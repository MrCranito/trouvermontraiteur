-- =============================================================================
-- Hotfix: eliminate 42P10 around users_pro upsert/conflict paths
-- 1) Ensure users_pro has a real PK on owner_user_id
-- 2) Recreate auth sync function without ON CONFLICT on users_pro
-- =============================================================================

-- Deduplicate users_pro rows, keep the most recently updated one.
with ranked as (
  select
    ctid,
    row_number() over (
      partition by owner_user_id
      order by updated_at desc nulls last, created_at desc nulls last, ctid desc
    ) as rn
  from public.users_pro
  where owner_user_id is not null
)
delete from public.users_pro u
using ranked r
where u.ctid = r.ctid
  and r.rn > 1;

alter table public.users_pro
  alter column owner_user_id set not null;

do $$
begin
  if not exists (
    select 1
    from pg_constraint
    where conrelid = 'public.users_pro'::regclass
      and contype = 'p'
  ) then
    alter table public.users_pro
      add constraint users_pro_pkey primary key (owner_user_id);
  end if;
end $$;

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
