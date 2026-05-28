-- =============================================================================
-- Location fields live on craftsmans only; users_pro keeps business_name + siret.
-- =============================================================================

alter table public.craftsmans
  add column if not exists city text not null default '';

-- Copy location from users_pro → craftsmans before dropping columns
do $$
begin
  if exists (
    select 1
    from information_schema.columns
    where table_schema = 'public'
      and table_name = 'users_pro'
      and column_name = 'address'
  ) then
    update public.craftsmans c
    set
      name = coalesce(nullif(trim(p.business_name), ''), c.name),
      address = coalesce(nullif(trim(p.address), ''), c.address),
      city = coalesce(nullif(trim(p.city), ''), c.city),
      postal_code = coalesce(nullif(trim(p.postal_code), ''), c.postal_code),
      updated_at = now()
    from public.users_pro p
    where c.owner_user_pro_id = p.owner_user_id;

    alter table public.users_pro drop column if exists address;
    alter table public.users_pro drop column if exists city;
    alter table public.users_pro drop column if exists postal_code;
  end if;
end $$;

create or replace function public.create_craftsman_for_users_pro()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  insert into public.craftsmans (
    owner_user_pro_id,
    name,
    address,
    city,
    postal_code,
    description,
    published
  )
  values (
    new.owner_user_id,
    coalesce(nullif(trim(new.business_name), ''), 'Mon entreprise'),
    '',
    '',
    '',
    '',
    false
  )
  on conflict (owner_user_pro_id) do nothing;

  return new;
end;
$$;

create or replace function public.sync_craftsman_name_from_users_pro()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  update public.craftsmans
  set
    name = coalesce(nullif(trim(new.business_name), ''), 'Mon entreprise'),
    updated_at = now()
  where owner_user_pro_id = new.owner_user_id;

  return new;
end;
$$;

drop trigger if exists users_pro_after_update_sync_craftsman on public.users_pro;
create trigger users_pro_after_update_sync_craftsman
  after update of business_name on public.users_pro
  for each row
  execute function public.sync_craftsman_name_from_users_pro();
