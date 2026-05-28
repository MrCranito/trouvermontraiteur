-- =============================================================================
-- Public Storage bucket for craftsman gallery images
-- Bucket id matches table name: craftsmans_images
-- Object keys in craftsmans_images.storage_path are relative to this bucket.
-- =============================================================================

insert into storage.buckets (id, name, public)
values ('craftsmans_images', 'craftsmans_images', true)
on conflict (id) do update
set public = excluded.public;

drop policy if exists craftsmans_images_public_read on storage.objects;
create policy craftsmans_images_public_read on storage.objects
  for select
  to anon, authenticated
  using (bucket_id = 'craftsmans_images');

drop policy if exists craftsmans_images_authenticated_insert on storage.objects;
create policy craftsmans_images_authenticated_insert on storage.objects
  for insert
  to authenticated
  with check (bucket_id = 'craftsmans_images');

drop policy if exists craftsmans_images_authenticated_update on storage.objects;
create policy craftsmans_images_authenticated_update on storage.objects
  for update
  to authenticated
  using (bucket_id = 'craftsmans_images')
  with check (bucket_id = 'craftsmans_images');

drop policy if exists craftsmans_images_authenticated_delete on storage.objects;
create policy craftsmans_images_authenticated_delete on storage.objects
  for delete
  to authenticated
  using (bucket_id = 'craftsmans_images');
