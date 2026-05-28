-- =============================================================================
-- When a users_pro row is created, create an empty craftsmans listing for that pro.
-- =============================================================================

create unique index if not exists craftsmans_owner_user_pro_id_unique
  on public.craftsmans (owner_user_pro_id);

create or replace function public.create_craftsman_for_users_pro()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
declare
  v_ref_id uuid;
begin
  -- Supports both schemas:
  -- - users_pro.id PK (owner_user_id FK to auth.users.id)
  -- - users_pro.owner_user_id PK
  v_ref_id := coalesce((to_jsonb(new) ->> 'id')::uuid, new.owner_user_id);

  if not exists (
    select 1
    from public.craftsmans c
    where c.owner_user_pro_id = v_ref_id
  ) then
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
      v_ref_id,
      coalesce(nullif(trim(new.business_name), ''), 'Mon entreprise'),
      '',
      '',
      '',
      '',
      false
    );
  end if;

  return new;
end;
$$;

drop trigger if exists users_pro_after_insert_create_craftsman on public.users_pro;
create trigger users_pro_after_insert_create_craftsman
  after insert on public.users_pro
  for each row
  execute function public.create_craftsman_for_users_pro();

-- Backfill pros that already have users_pro but no craftsmans row yet
insert into public.craftsmans (
  owner_user_pro_id,
  name,
  address,
  city,
  postal_code,
  description,
  published
)
select
  p.owner_user_id,
  coalesce(nullif(trim(p.business_name), ''), 'Mon entreprise'),
  '',
  '',
  '',
  '',
  false
from public.users_pro p
where not exists (
  select 1
  from public.craftsmans c
  where c.owner_user_pro_id = p.owner_user_id
);
