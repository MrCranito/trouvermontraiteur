-- Remove craftsmans that were never linked to a Google Place.
-- Child rows with ON DELETE CASCADE are removed automatically.
-- Non-cascade dependents are cleaned up first.

with doomed as (
  select id
  from public.craftsmans
  where google_place_id is null
     or btrim(google_place_id) = ''
)
delete from public.users_favorites uf
using doomed d
where uf.craftsman_id = d.id;

with doomed as (
  select id
  from public.craftsmans
  where google_place_id is null
     or btrim(google_place_id) = ''
)
delete from public.users_estimates ue
using doomed d
where ue.owner_craftsman_id = d.id;

with doomed as (
  select id
  from public.craftsmans
  where google_place_id is null
     or btrim(google_place_id) = ''
)
delete from public.craftsmans_services cs
using doomed d
where cs.owner_craftsman_id = d.id;

delete from public.craftsmans
where google_place_id is null
   or btrim(google_place_id) = '';
