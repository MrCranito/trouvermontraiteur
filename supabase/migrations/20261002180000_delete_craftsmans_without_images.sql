-- Drop published and unpublished craftsmen that have no usable photo.
-- Related images, subcategory links, and unavailabilities cascade.
-- Estimates, favorites, and services do not, so they are removed first.

with imageless as (
  select craftsmans.id
  from public.craftsmans
  where not exists (
    select 1
    from public.craftsmans_images as image
    where image.craftsman_id = craftsmans.id
      and btrim(coalesce(image.storage_path, '')) <> ''
  )
),
removed_estimates as (
  delete from public.users_estimates as estimate
  using imageless
  where estimate.owner_craftsman_id = imageless.id
  returning estimate.id
),
removed_favorites as (
  delete from public.users_favorites as favorite
  using imageless
  where favorite.craftsman_id = imageless.id
  returning favorite.craftsman_id
),
removed_services as (
  delete from public.craftsmans_services as service
  using imageless
  where service.owner_craftsman_id = imageless.id
  returning service.owner_craftsman_id
)
delete from public.craftsmans as craftsman
using imageless
where craftsman.id = imageless.id;
