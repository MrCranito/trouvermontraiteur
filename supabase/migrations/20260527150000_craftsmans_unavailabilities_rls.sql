-- =============================================================================
-- RLS + grants for craftsmans_unavailabilities
-- =============================================================================

create or replace function public.is_craftsman_owner_by_id(p_craftsman_id uuid)
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select exists (
    select 1
    from public.craftsmans c
    where c.id = p_craftsman_id
      and c.owner_user_id = auth.uid()
  );
$$;

grant select on public.craftsmans_unavailabilities to anon, authenticated;
grant insert, update, delete on public.craftsmans_unavailabilities to authenticated;

alter table public.craftsmans_unavailabilities enable row level security;

drop policy if exists craftsmans_unavailabilities_select on public.craftsmans_unavailabilities;
create policy craftsmans_unavailabilities_select on public.craftsmans_unavailabilities
  for select
  using (
    exists (
      select 1
      from public.craftsmans c
      where c.id = owner_craftsman_id
        and (c.published = true or c.owner_user_id = auth.uid())
    )
  );

drop policy if exists craftsmans_unavailabilities_owner_insert on public.craftsmans_unavailabilities;
create policy craftsmans_unavailabilities_owner_insert on public.craftsmans_unavailabilities
  for insert
  with check (public.is_craftsman_owner_by_id(owner_craftsman_id));

drop policy if exists craftsmans_unavailabilities_owner_update on public.craftsmans_unavailabilities;
create policy craftsmans_unavailabilities_owner_update on public.craftsmans_unavailabilities
  for update
  using (public.is_craftsman_owner_by_id(owner_craftsman_id))
  with check (public.is_craftsman_owner_by_id(owner_craftsman_id));

drop policy if exists craftsmans_unavailabilities_owner_delete on public.craftsmans_unavailabilities;
create policy craftsmans_unavailabilities_owner_delete on public.craftsmans_unavailabilities
  for delete
  using (public.is_craftsman_owner_by_id(owner_craftsman_id));
