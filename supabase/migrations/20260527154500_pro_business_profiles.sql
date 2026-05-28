-- =============================================================================
-- Pro business profile onboarding (dashboard)
-- =============================================================================

create table if not exists public.users_pro (
  owner_user_id uuid primary key references auth.users (id) on delete cascade,
  business_name text not null default '',
  siret text not null default '',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists users_pro_owner_user_id_idx
  on public.users_pro (owner_user_id);

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
