-- =============================================================================
-- users_favorites — owner_user_id from auth.uid(), RLS per user
-- =============================================================================

alter table public.users_favorites
  alter column owner_user_id set default auth.uid();

alter table public.users_favorites enable row level security;

grant select, insert, delete on public.users_favorites to authenticated;

drop policy if exists users_favorites_select_own on public.users_favorites;
create policy users_favorites_select_own on public.users_favorites
  for select
  to authenticated
  using (owner_user_id = auth.uid());

drop policy if exists users_favorites_insert_own on public.users_favorites;
create policy users_favorites_insert_own on public.users_favorites
  for insert
  to authenticated
  with check (owner_user_id = auth.uid());

drop policy if exists users_favorites_delete_own on public.users_favorites;
create policy users_favorites_delete_own on public.users_favorites
  for delete
  to authenticated
  using (owner_user_id = auth.uid());
