-- =============================================================================
-- users_pro — owner_user_id from auth.uid(), RLS per user (do not send from client)
-- =============================================================================

alter table public.users_pro
  alter column owner_user_id set default auth.uid();

alter table public.users_pro enable row level security;

grant select, insert, update on public.users_pro to authenticated;

drop policy if exists users_pro_select_own on public.users_pro;
create policy users_pro_select_own on public.users_pro
  for select
  to authenticated
  using (owner_user_id = auth.uid());

drop policy if exists users_pro_insert_own on public.users_pro;
create policy users_pro_insert_own on public.users_pro
  for insert
  to authenticated
  with check (owner_user_id = auth.uid());

drop policy if exists users_pro_update_own on public.users_pro;
create policy users_pro_update_own on public.users_pro
  for update
  to authenticated
  using (owner_user_id = auth.uid())
  with check (owner_user_id = auth.uid());
