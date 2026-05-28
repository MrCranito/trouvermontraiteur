-- craftsmans.owner_user_pro_id = auth user id (same value as users_pro.owner_user_id)

do $$
begin
  if exists (
    select 1
    from information_schema.columns
    where table_schema = 'public'
      and table_name = 'craftsmans'
      and column_name = 'owner_user_id'
  )
  and not exists (
    select 1
    from information_schema.columns
    where table_schema = 'public'
      and table_name = 'craftsmans'
      and column_name = 'owner_user_pro_id'
  ) then
    alter table public.craftsmans
      rename column owner_user_id to owner_user_pro_id;
  end if;
end $$;

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
      and c.owner_user_pro_id = auth.uid()
  );
$$;

drop policy if exists craftsmans_unavailabilities_select on public.craftsmans_unavailabilities;
create policy craftsmans_unavailabilities_select on public.craftsmans_unavailabilities
  for select
  using (
    exists (
      select 1
      from public.craftsmans c
      where c.id = owner_craftsman_id
        and (c.published = true or c.owner_user_pro_id = auth.uid())
    )
  );
