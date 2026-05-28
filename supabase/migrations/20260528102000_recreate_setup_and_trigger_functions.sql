-- =============================================================================
-- Hotfix for 42P10 ON CONFLICT inference errors
-- Recreate functions with conflict-safe logic.
-- =============================================================================

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

create or replace function public.setup_pro_business_profile(
  p_business_name text,
  p_siret text,
  p_address text,
  p_city text,
  p_postal_code text
)
returns void
language plpgsql
security definer
set search_path = public
as $$
declare
  v_uid uuid := auth.uid();
  v_name text := coalesce(nullif(trim(p_business_name), ''), 'Mon entreprise');
  v_has_users_pro_id boolean;
  v_users_pro_ref_id uuid;
begin
  if v_uid is null then
    raise exception 'Not authenticated';
  end if;

  update public.users_pro
  set
    business_name = trim(p_business_name),
    siret = trim(p_siret),
    updated_at = now()
  where owner_user_id = v_uid;

  if not found then
    insert into public.users_pro (owner_user_id, business_name, siret, updated_at)
    values (v_uid, trim(p_business_name), trim(p_siret), now());
  end if;

  select exists (
    select 1
    from information_schema.columns
    where table_schema = 'public'
      and table_name = 'users_pro'
      and column_name = 'id'
  )
  into v_has_users_pro_id;

  if v_has_users_pro_id then
    execute 'select id from public.users_pro where owner_user_id = $1 limit 1'
      into v_users_pro_ref_id
      using v_uid;
  else
    v_users_pro_ref_id := v_uid;
  end if;

  update public.craftsmans
  set
    name = v_name,
    address = trim(coalesce(p_address, '')),
    city = trim(coalesce(p_city, '')),
    postal_code = trim(coalesce(p_postal_code, '')),
    updated_at = now()
  where owner_user_pro_id = v_users_pro_ref_id;

  if not found then
    insert into public.craftsmans (
      owner_user_pro_id,
      name,
      address,
      city,
      postal_code,
      description,
      published,
      updated_at
    )
    values (
      v_users_pro_ref_id,
      v_name,
      trim(coalesce(p_address, '')),
      trim(coalesce(p_city, '')),
      trim(coalesce(p_postal_code, '')),
      '',
      false,
      now()
    );
  end if;
end;
$$;
