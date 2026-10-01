-- Remove Coordination and Personnel événementiel from the catalog.
-- The two demo listings that only existed for those subcategories are unpublished.

update public.craftsmans as craftsman
set
  published = false,
  deleted_at = coalesce(craftsman.deleted_at, now()),
  updated_at = now()
where craftsman.name in (
  'Ariège Studio Coordination',
  'Clémence Personnel événementiel'
);

with dropped as (
  select translation.sub_category_id
  from public.sub_categories_translations as translation
  where translation.language_code = 'fr'
    and translation.name in ('Coordination', 'Personnel événementiel')
),
removed_links as (
  delete from public.craftsmans_sub_category as link
  where link.sub_category_id in (select sub_category_id from dropped)
  returning link.craftsman_id
),
removed_translations as (
  delete from public.sub_categories_translations as translation
  where translation.sub_category_id in (select sub_category_id from dropped)
  returning translation.sub_category_id
)
delete from public.sub_categories as sub_category
where sub_category.id in (select sub_category_id from dropped);
