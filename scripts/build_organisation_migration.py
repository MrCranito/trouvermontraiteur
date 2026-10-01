"""Build the Toulouse event-organisation craftsman seed migration."""

import json
import re
from pathlib import Path

ROOT = Path("organisation_toulouse")
OUT = Path("supabase/migrations/20261001181000_seed_toulouse_organisation.sql")

SUB_CATEGORIES = (
    "Organisation d'événement",
    "Wedding planner",
    "Event planner",
)
LABELS = {
    "Organisation d'événement": "Organisateur d'événement",
    "Wedding planner": "Wedding planner",
    "Event planner": "Event planner",
}


def sql_dollar(value: str, tag: str) -> str:
    text = value if value is not None else ""
    if f"${tag}$" in text:
        tag = tag + "x"
    return f"${tag}${text}${tag}$"


def parse_address(formatted: str | None) -> tuple[str, str, str]:
    if not formatted:
        return "", "Toulouse", ""

    text = re.sub(r",?\s*France\s*$", "", formatted.strip(), flags=re.IGNORECASE)
    match = re.search(r"\b(\d{5})\b\s+([^,]+)\s*$", text)
    if not match:
        return text, "Toulouse", ""

    postal = match.group(1)
    city = match.group(2).strip()
    address = text[: match.start()].strip(" ,")
    return address, city or "Toulouse", postal


def description(info: dict, city: str) -> str:
    sub_category = info.get("sub_category") or "Organisation d'événement"
    label = LABELS.get(sub_category, sub_category)
    lines = [f"{label} à {city}."]
    phone = info.get("phone")
    website = info.get("website")
    rating = info.get("rating")
    reviews = info.get("review_count")
    maps = info.get("google_maps")

    if phone:
        lines.append(f"Téléphone : {phone}")
    if website:
        lines.append(f"Site web : {website}")
    if rating is not None:
        review_label = f" ({reviews} avis)" if reviews else ""
        lines.append(f"Note Google : {rating}/5{review_label}")
    if maps:
        lines.append(f"Google Maps : {maps}")
    return "\n".join(lines)


def num(value) -> str:
    if value is None:
        return "null"
    return str(float(value))


def rating_sql(value) -> str:
    if value is None:
        return "0"
    return f"{float(value):.1f}"


def review_sql(value) -> str:
    if value is None:
        return "0"
    return str(int(value))


def main() -> None:
    by_place: dict[str, tuple[str, dict]] = {}
    for info_file in sorted(ROOT.glob("*/info.json")):
        info = json.loads(info_file.read_text(encoding="utf-8"))
        place_id = info.get("place_id")
        if not place_id:
            continue
        folder_name = info_file.parent.name
        current = by_place.get(place_id)
        if current is None or (
            current[0].endswith(")") and not folder_name.endswith(")")
        ):
            by_place[place_id] = (folder_name, info)

    infos = [
        info
        for _, info in sorted(by_place.values(), key=lambda item: item[1].get("name") or "")
    ]

    if not infos:
        raise SystemExit(f"Aucun info.json dans {ROOT}")

    rows = []
    place_literals = []
    for index, info in enumerate(infos):
        address, city, postal = parse_address(info.get("address"))
        sub_category = info.get("sub_category") or "Organisation d'événement"
        if sub_category not in SUB_CATEGORIES:
            sub_category = "Organisation d'événement"
        tag = f"d{index}"
        place_id = info.get("place_id") or ""
        rows.append(
            "  ("
            + ", ".join(
                [
                    sql_dollar(info.get("name") or sub_category, f"{tag}n"),
                    sql_dollar(description(info, city), f"{tag}d"),
                    "true",
                    num(info.get("latitude")),
                    num(info.get("longitude")),
                    sql_dollar(address, f"{tag}a"),
                    sql_dollar(city, f"{tag}c"),
                    sql_dollar(postal, f"{tag}p"),
                    sql_dollar(place_id, f"{tag}g"),
                    rating_sql(info.get("rating")),
                    review_sql(info.get("review_count")),
                    sql_dollar(sub_category, f"{tag}s"),
                ]
            )
            + ")"
        )
        place_literals.append(sql_dollar(place_id, f"{tag}id"))

    values = ",\n".join(rows)
    place_list = ", ".join(place_literals)
    sql = f"""-- Seed event organisers, wedding planners, and event planners around Toulouse.
-- Only these google_place_id values are linked to Organisation subcategories.

insert into public.craftsmans (
  name,
  description,
  published,
  latitude,
  longitude,
  address,
  city,
  postal_code,
  google_place_id,
  rating,
  review_count
)
select
  v.name,
  v.description,
  v.published::boolean,
  v.latitude::double precision,
  v.longitude::double precision,
  v.address,
  v.city,
  v.postal_code,
  v.google_place_id,
  v.rating::numeric(2, 1),
  v.review_count::integer
from (
  values
{values}
) as v(
  name,
  description,
  published,
  latitude,
  longitude,
  address,
  city,
  postal_code,
  google_place_id,
  rating,
  review_count,
  sub_category
)
where not exists (
  select 1
  from public.craftsmans existing
  where existing.google_place_id = v.google_place_id
);

insert into public.craftsmans_sub_category (craftsman_id, sub_category_id)
select craftsman.id, sub_category.id
from (
  values
{values}
) as v(
  name,
  description,
  published,
  latitude,
  longitude,
  address,
  city,
  postal_code,
  google_place_id,
  rating,
  review_count,
  sub_category
)
join public.craftsmans as craftsman
  on craftsman.google_place_id = v.google_place_id
join public.sub_categories_translations as translation
  on translation.language_code = 'fr'
 and translation.name = v.sub_category
join public.sub_categories as sub_category
  on sub_category.id = translation.sub_category_id
where not exists (
  select 1
  from public.craftsmans_sub_category link
  where link.craftsman_id = craftsman.id
    and link.sub_category_id = sub_category.id
);

do $$
declare
  location_type text;
  location_generated "char";
begin
  select a.atttypid::regtype::text, a.attgenerated
  into location_type, location_generated
  from pg_attribute a
  join pg_class c on c.oid = a.attrelid
  join pg_namespace n on n.oid = c.relnamespace
  where n.nspname = 'public'
    and c.relname = 'craftsmans'
    and a.attname = 'location'
    and not a.attisdropped;

  if location_type is null or location_generated <> '' then
    return;
  end if;

  if location_type like 'geography%' then
    update public.craftsmans
    set location = ST_SetSRID(ST_MakePoint(longitude, latitude), 4326)::geography
    where google_place_id in ({place_list})
      and latitude is not null
      and longitude is not null
      and location is null;
  elsif location_type like 'geometry%' then
    update public.craftsmans
    set location = ST_SetSRID(ST_MakePoint(longitude, latitude), 4326)
    where google_place_id in ({place_list})
      and latitude is not null
      and longitude is not null
      and location is null;
  end if;
end $$;
"""

    place_ids = [info.get("place_id") for info in infos]
    if len(place_ids) != len(set(place_ids)):
        raise SystemExit("Place IDs en double dans la migration")

    OUT.write_text(sql, encoding="utf-8")
    counts = {name: 0 for name in SUB_CATEGORIES}
    for info in infos:
        key = info.get("sub_category") or "Organisation d'événement"
        counts[key] = counts.get(key, 0) + 1
    print(f"Wrote {OUT} ({len(infos)} professionnels) {counts}")


if __name__ == "__main__":
    main()
