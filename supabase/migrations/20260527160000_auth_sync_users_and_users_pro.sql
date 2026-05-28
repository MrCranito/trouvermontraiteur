-- =============================================================================
-- Sync auth.users → public.users (consumer) or public.users_pro (pro)
-- Relies on user_metadata.user_type set by the apps on signUp / updateUser:
--   consumer app → { "user_type": "consumer" }
--   dashboard    → { "user_type": "pro" }
-- =============================================================================

-- Consumer profile (particulier)
create table if not exists public.users (
  id uuid primary key references auth.users (id) on delete cascade,
  email text not null default '',
  phone text,
  first_name text,
  last_name text,
  full_name text,
  avatar_url text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists users_email_idx on public.users (email);

alter table public.users enable row level security;

grant select, update on public.users to authenticated;

drop policy if exists users_select_own on public.users;
create policy users_select_own on public.users
  for select
  to authenticated
  using (id = auth.uid());

drop policy if exists users_update_own on public.users;
create policy users_update_own on public.users
  for update
  to authenticated
  using (id = auth.uid())
  with check (id = auth.uid());

-- -----------------------------------------------------------------------------

create or replace function public.sync_profile_for_auth_user()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
declare
  user_type text;
  meta jsonb;
begin
  meta := coalesce(new.raw_user_meta_data, '{}'::jsonb);
  user_type := meta ->> 'user_type';

  if user_type = 'pro' then
    update public.users_pro
    set updated_at = now()
    where owner_user_id = new.id;

    if not found then
      insert into public.users_pro (
        owner_user_id,
        business_name,
        siret,
        updated_at
      )
      values (
        new.id,
        '',
        '',
        now()
      );
    end if;
    return new;
  end if;

  if user_type = 'consumer' then
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
      new.id,
      coalesce(new.email, ''),
      meta ->> 'phone',
      meta ->> 'first_name',
      meta ->> 'last_name',
      coalesce(
        meta ->> 'full_name',
        meta ->> 'name',
        nullif(trim(concat_ws(' ', meta ->> 'first_name', meta ->> 'last_name')), '')
      ),
      coalesce(meta ->> 'avatar_url', meta ->> 'picture'),
      now()
    )
    on conflict (id) do update
      set
        email = excluded.email,
        full_name = coalesce(excluded.full_name, public.users.full_name),
        avatar_url = coalesce(excluded.avatar_url, public.users.avatar_url),
        updated_at = now();
  end if;

  return new;
end;
$$;

revoke all on function public.sync_profile_for_auth_user() from public;
grant execute on function public.sync_profile_for_auth_user() to supabase_auth_admin;

drop trigger if exists on_auth_user_created_sync_profile on auth.users;
create trigger on_auth_user_created_sync_profile
  after insert on auth.users
  for each row
  execute function public.sync_profile_for_auth_user();

-- OAuth / first login may set user_type after insert (updateUser in the apps)
drop trigger if exists on_auth_user_updated_sync_profile on auth.users;
create trigger on_auth_user_updated_sync_profile
  after update of raw_user_meta_data on auth.users
  for each row
  when (
    (new.raw_user_meta_data ->> 'user_type')
      is distinct from (old.raw_user_meta_data ->> 'user_type')
  )
  execute function public.sync_profile_for_auth_user();
