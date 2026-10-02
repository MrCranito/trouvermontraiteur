-- =============================================================================
-- Ensure authenticated consumers have a public.users row.
-- users_favorites.owner_user_id FKs to public.users; auth sync alone can miss
-- legacy accounts or sessions that never ran the metadata trigger.
-- =============================================================================

create or replace function public.ensure_consumer_profile()
returns void
language plpgsql
security definer
set search_path = public
as $$
declare
  v_uid uuid := auth.uid();
  v_email text;
  v_meta jsonb;
begin
  if v_uid is null then
    raise exception 'Not authenticated';
  end if;

  select email, coalesce(raw_user_meta_data, '{}'::jsonb)
  into v_email, v_meta
  from auth.users
  where id = v_uid;

  if not found then
    raise exception 'Auth user not found';
  end if;

  if (v_meta ->> 'user_type') = 'pro' then
    raise exception 'Pro accounts cannot create a consumer profile';
  end if;

  insert into public.users (
    id,
    email,
    phone,
    first_name,
    last_name,
    full_name,
    avatar_url,
    updated_at
  )
  values (
    v_uid,
    coalesce(v_email, ''),
    v_meta ->> 'phone',
    v_meta ->> 'first_name',
    v_meta ->> 'last_name',
    coalesce(
      v_meta ->> 'full_name',
      v_meta ->> 'name',
      nullif(trim(concat_ws(' ', v_meta ->> 'first_name', v_meta ->> 'last_name')), '')
    ),
    coalesce(v_meta ->> 'avatar_url', v_meta ->> 'picture'),
    now()
  )
  on conflict (id) do update
    set
      email = excluded.email,
      full_name = coalesce(excluded.full_name, public.users.full_name),
      avatar_url = coalesce(excluded.avatar_url, public.users.avatar_url),
      updated_at = now();
end;
$$;

revoke all on function public.ensure_consumer_profile() from public;
grant execute on function public.ensure_consumer_profile() to authenticated;

-- Backfill consumers that already have user_type but no public.users row.
insert into public.users (
  id,
  email,
  phone,
  first_name,
  last_name,
  full_name,
  avatar_url,
  updated_at
)
select
  u.id,
  coalesce(u.email, ''),
  u.raw_user_meta_data ->> 'phone',
  u.raw_user_meta_data ->> 'first_name',
  u.raw_user_meta_data ->> 'last_name',
  coalesce(
    u.raw_user_meta_data ->> 'full_name',
    u.raw_user_meta_data ->> 'name',
    nullif(
      trim(
        concat_ws(
          ' ',
          u.raw_user_meta_data ->> 'first_name',
          u.raw_user_meta_data ->> 'last_name'
        )
      ),
      ''
    )
  ),
  coalesce(
    u.raw_user_meta_data ->> 'avatar_url',
    u.raw_user_meta_data ->> 'picture'
  ),
  now()
from auth.users u
where coalesce(u.raw_user_meta_data ->> 'user_type', '') = 'consumer'
  and not exists (
    select 1 from public.users p where p.id = u.id
  );
