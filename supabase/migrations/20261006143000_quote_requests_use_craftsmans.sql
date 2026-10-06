-- quote_requests pointe vers les artisans réellement affichés (craftsmans),
-- et le propriétaire est le compte pro lié via users_pro.

create or replace function public.is_craftsman_owner(p_craftsman_id uuid)
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select exists (
    select 1
    from public.craftsmans c
    left join public.users_pro p on p.id = c.owner_user_pro_id
    where c.id = p_craftsman_id
      and (
        p.owner_user_id = auth.uid()
        or c.owner_user_pro_id = auth.uid()
      )
  );
$$;

create or replace function public.current_craftsman_id()
returns uuid
language sql
stable
security definer
set search_path = public
as $$
  select c.id
  from public.craftsmans c
  left join public.users_pro p on p.id = c.owner_user_pro_id
  where p.owner_user_id = auth.uid()
     or c.owner_user_pro_id = auth.uid()
  limit 1;
$$;

do $$
declare
  v_constraint text;
  v_target text;
begin
  select con.conname, ctu.relname
    into v_constraint, v_target
  from pg_constraint con
  join pg_class rel on rel.oid = con.conrelid
  join pg_namespace nsp on nsp.oid = rel.relnamespace
  join pg_class ctu on ctu.oid = con.confrelid
  where nsp.nspname = 'public'
    and rel.relname = 'quote_requests'
    and con.contype = 'f'
    and pg_get_constraintdef(con.oid) ilike '%craftsman_id%';

  if v_constraint is not null and v_target is distinct from 'craftsmans' then
    execute format(
      'alter table public.quote_requests drop constraint %I',
      v_constraint
    );
  end if;

  if not exists (
    select 1
    from pg_constraint con
    join pg_class rel on rel.oid = con.conrelid
    join pg_namespace nsp on nsp.oid = rel.relnamespace
    join pg_class ctu on ctu.oid = con.confrelid
    where nsp.nspname = 'public'
      and rel.relname = 'quote_requests'
      and con.contype = 'f'
      and ctu.relname = 'craftsmans'
      and pg_get_constraintdef(con.oid) ilike '%craftsman_id%'
  ) then
    alter table public.quote_requests
      add constraint quote_requests_craftsman_id_fkey
      foreign key (craftsman_id) references public.craftsmans (id) on delete cascade;
  end if;
end $$;

create or replace function public.create_quote_request(
  p_craftsman_id uuid,
  p_client_name text,
  p_client_email text,
  p_event_type text,
  p_message text,
  p_event_date date default null,
  p_event_date_label text default null,
  p_guest_count integer default null,
  p_budget_hint text default null
)
returns uuid
language plpgsql
security definer
set search_path = public
as $$
declare
  v_id uuid;
begin
  if not exists (
    select 1
    from public.craftsmans c
    where c.id = p_craftsman_id
      and c.published = true
      and c.deleted_at is null
  ) then
    raise exception 'Artisan introuvable';
  end if;

  insert into public.quote_requests (
    craftsman_id,
    consumer_user_id,
    client_name,
    client_email,
    event_type,
    event_date,
    event_date_label,
    guest_count,
    budget_hint,
    message
  )
  values (
    p_craftsman_id,
    auth.uid(),
    trim(p_client_name),
    trim(p_client_email),
    trim(p_event_type),
    p_event_date,
    p_event_date_label,
    p_guest_count,
    nullif(trim(p_budget_hint), ''),
    trim(p_message)
  )
  returning id into v_id;

  return v_id;
end;
$$;
