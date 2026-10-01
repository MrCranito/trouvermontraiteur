"""Stage decoration images and write craftsmans_images inserts.

Storage keys are decoration/{google_place_id}/{n}.jpg. The insert joins
craftsmans on google_place_id, so it does not depend on generated uuids.
"""

import json
from pathlib import Path

ROOT = Path("decoration_toulouse")
STAGING = Path(r"C:\Users\victo\AppData\Local\Temp\tmt-decoration-staging")
SQL_OUT = Path("supabase/migrations/20261001143000_link_toulouse_decoration_images.sql")
PREFIX = "decoration"
STORAGE_PREFIX = "decoration"


def sql_dollar(value: str, tag: str) -> str:
    if f"${tag}$" in value:
        tag = tag + "x"
    return f"${tag}${value}${tag}$"


def main() -> None:
    chosen: dict[str, Path] = {}
    for info_file in sorted(ROOT.glob("*/info.json")):
        info = json.loads(info_file.read_text(encoding="utf-8"))
        place_id = info.get("place_id")
        if not place_id:
            continue
        folder = info_file.parent
        current = chosen.get(place_id)
        if current is None or (
            current.name.endswith(")") and not folder.name.endswith(")")
        ):
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
        photos = sorted(folder.glob("photo_*.jpg"))
        if not photos:
            missing += 1
            continue
        dest_dir = STAGING / PREFIX / place_id
        dest_dir.mkdir(parents=True, exist_ok=True)
        for index, photo in enumerate(photos, start=1):
            dest = dest_dir / f"{index}.jpg"
            if not dest.exists():
                dest.hardlink_to(photo)
            storage_path = f"{STORAGE_PREFIX}/{place_id}/{index}.jpg"
            tag = f"i{photo_count}"
            rows.append(
                "  ("
                + ", ".join(
                    [
                        sql_dollar(place_id, f"{tag}g"),
                        sql_dollar(storage_path, f"{tag}p"),
                        str(index),
                    ]
                )
                + ")"
            )
            photo_count += 1

    if not rows:
        raise SystemExit("Aucune photo à lier")

    values = ",\n".join(rows)
    sql = f"""-- Link Toulouse decoration and flower images stored in the craftsmans_images bucket.
-- Paths are decoration/{{google_place_id}}/{{n}}.jpg.

insert into public.craftsmans_images (craftsman_id, storage_path, sort_order)
select craftsman.id, v.storage_path, v.sort_order
from (
  values
{values}
) as v(google_place_id, storage_path, sort_order)
join public.craftsmans as craftsman
  on craftsman.google_place_id = v.google_place_id
where not exists (
  select 1
  from public.craftsmans_images existing
  where existing.craftsman_id = craftsman.id
    and existing.sort_order = v.sort_order
);
"""
    SQL_OUT.write_text(sql, encoding="utf-8")
    print(
        f"craftsmans {len(chosen)} photos {photo_count} without_photos {missing}"
    )
    print(f"staging {STAGING}")
    print(f"sql {SQL_OUT}")


if __name__ == "__main__":
    main()
