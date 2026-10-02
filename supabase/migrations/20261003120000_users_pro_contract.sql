-- =============================================================================
-- users_pro_contract — contrats liés à un compte pro (auth.uid())
-- =============================================================================

create table if not exists public.users_pro_contract (
  id uuid primary key default gen_random_uuid(),
  owner_user_id uuid not null default auth.uid()
    references auth.users (id) on delete cascade,
  title text,
  client_name text not null default '',
  client_email text,
  client_phone text,
  event_type text,
  event_date date,
  guest_count integer,
  amount_cents integer,
  currency text not null default 'EUR',
  status text not null default 'draft'
    check (status in ('draft', 'sent', 'signed', 'cancelled')),
  notes text,
  signed_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists users_pro_contract_owner_user_id_idx
  on public.users_pro_contract (owner_user_id);

create index if not exists users_pro_contract_status_idx
  on public.users_pro_contract (status);

create index if not exists users_pro_contract_created_at_idx
  on public.users_pro_contract (created_at desc);

alter table public.users_pro_contract enable row level security;

grant select, insert, update, delete on public.users_pro_contract to authenticated;

drop policy if exists users_pro_contract_select_own on public.users_pro_contract;
create policy users_pro_contract_select_own on public.users_pro_contract
  for select
  to authenticated
  using (owner_user_id = auth.uid());

drop policy if exists users_pro_contract_insert_own on public.users_pro_contract;
create policy users_pro_contract_insert_own on public.users_pro_contract
  for insert
  to authenticated
  with check (owner_user_id = auth.uid());

drop policy if exists users_pro_contract_update_own on public.users_pro_contract;
create policy users_pro_contract_update_own on public.users_pro_contract
  for update
  to authenticated
  using (owner_user_id = auth.uid())
  with check (owner_user_id = auth.uid());

drop policy if exists users_pro_contract_delete_own on public.users_pro_contract;
create policy users_pro_contract_delete_own on public.users_pro_contract
  for delete
  to authenticated
  using (owner_user_id = auth.uid());

notify pgrst, 'reload schema';
