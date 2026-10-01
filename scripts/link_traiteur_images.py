"""Stage local traiteur photos and write craftsmans_images inserts."""

import json
from pathlib import Path

ROOT = Path("traiteurs_toulouse")
MAPPING = Path(r"C:\Users\victo\AppData\Local\Temp\tmt-place-ids.json")
STAGING = Path(r"C:\Users\victo\AppData\Local\Temp\tmt-image-staging")
SQL_OUT = Path("supabase/migrations/20260930183000_link_toulouse_traiteur_images.sql")


def sql_dollar(value: str, tag: str) -> str:
    if f"${tag}$" in value:
        tag = tag + "x"
    return f"${tag}${value}${tag}$"


def main() -> None:
    payload = json.loads(MAPPING.read_text(encoding="utf-8-sig"))
    by_place = {row["google_place_id"]: row["id"] for row in payload["rows"]}

    chosen: dict[str, Path] = {}
    for info_file in sorted(ROOT.glob("*/info.json")):
        info = json.loads(info_file.read_text(encoding="utf-8"))
        place_id = info.get("place_id")
        if not place_id or place_id not in by_place:
            continue
        folder = info_file.parent
        current = chosen.get(place_id)
        if current is None or (current.name.endswith(")") and not folder.name.endswith(")")):
            chosen[place_id] = folder

    if STAGING.exists():
        for path in sorted(STAGING.rglob("*"), reverse=True):
            if path.is_file():
                path.unlink()
            elif path.is_dir():
                path.rmdir()
    STAGING.mkdir(parents=True, exist_ok=True)

    rows: list[str] = []
    photo_count = 0
    missing = 0

    for place_id, folder in sorted(chosen.items(), key=lambda item: item[1].name):
        craftsman_id = by_place[place_id]
        photos = sorted(folder.glob("photo_*.jpg"))
        if not photos:
            missing += 1
            continue
        dest_dir = STAGING / craftsman_id
        dest_dir.mkdir(parents=True, exist_ok=True)
        for index, photo in enumerate(photos, start=1):
            dest = dest_dir / f"{index}.jpg"
            if not dest.exists():
                dest.hardlink_to(photo)
            storage_path = f"{craftsman_id}/{index}.jpg"
            tag = f"p{photo_count}"
            rows.append(
                "  ("
                + ", ".join(
                    [
                        f"'{craftsman_id}'::uuid",
                        sql_dollar(storage_path, tag),
                        str(index),
                    ]
                )
                + ")"
            )
            photo_count += 1

    values = ",\n".join(rows)
    sql = f"""-- Link Toulouse traiteur photos stored in the craftsmans_images bucket.

insert into public.craftsmans_images (craftsman_id, storage_path, sort_order)
select v.craftsman_id, v.storage_path, v.sort_order
from (
  values
{values}
) as v(craftsman_id, storage_path, sort_order)
where not exists (
  select 1
  from public.craftsmans_images existing
  where existing.craftsman_id = v.craftsman_id
    and existing.sort_order = v.sort_order
);
"""
    SQL_OUT.write_text(sql, encoding="utf-8")
    print(f"craftsmans {len(chosen)} photos {photo_count} without_photos {missing}")
    print(f"staging {STAGING}")
    print(f"sql {SQL_OUT}")


if __name__ == "__main__":
    main()
