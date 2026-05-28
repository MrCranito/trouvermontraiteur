-- =============================================================================
-- Setup business: one RPC call from the dashboard (no multi-table client round-trips).
-- Handles existing users_pro row from auth sync + craftsmans row from trigger.
-- =============================================================================

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

revoke all on function public.setup_pro_business_profile(text, text, text, text, text)
  from public;
grant execute on function public.setup_pro_business_profile(text, text, text, text, text)
  to authenticated;
