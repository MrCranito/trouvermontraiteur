-- =============================================================================
-- TMT — Analytics dashboard artisans (vue d'ensemble)
-- Visites, favoris, devis, impressions/clics recherche, activité récente
-- À exécuter dans l'éditeur SQL Supabase ou via `supabase db push`
-- =============================================================================

-- Extensions utiles
create extension if not exists "pgcrypto";

-- -----------------------------------------------------------------------------
-- Types
-- -----------------------------------------------------------------------------

create type public.quote_request_status as enum (
  'new',
  'viewed',
  'answered',
  'archived'
);

create type public.craftsman_analytics_event_type as enum (
  'profile_view',       -- consultation fiche /artisans/:slug
  'search_impression',  -- apparition dans une liste de résultats
  'profile_click',      -- clic sur une carte depuis la recherche
  'favorite_added',     -- ajout aux favoris (doublon possible avec consumer_favorites)
  'contact_request'     -- demande de devis (doublon possible avec quote_requests)
);

-- -----------------------------------------------------------------------------
-- Artisans (profil pro lié à auth.users)
-- -----------------------------------------------------------------------------

create table if not exists public.craftsmen (
  id uuid primary key default gen_random_uuid(),
  owner_user_id uuid not null unique references auth.users (id) on delete cascade,
  slug text not null unique,
  name text not null,
  description text not null default '',
  image_url text,
  rating numeric(2, 1) not null default 0 check (rating >= 0 and rating <= 5),
  review_count integer not null default 0 check (review_count >= 0),
  trades text[] not null default '{}',
  project_types text[] not null default '{}',
  service_options text[] not null default '{}',
  location jsonb not null default '{}'::jsonb,
  min_order integer,
  delivery_radius_km integer,
  published boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists craftsmen_owner_user_id_idx on public.craftsmen (owner_user_id);
create index if not exists craftsmen_slug_idx on public.craftsmen (slug);
create index if not exists craftsmen_published_idx on public.craftsmen (published) where published = true;

-- -----------------------------------------------------------------------------
-- Favoris (likes)
-- -----------------------------------------------------------------------------

create table if not exists public.consumer_favorites (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users (id) on delete cascade,
  craftsman_id uuid not null references public.craftsmen (id) on delete cascade,
  created_at timestamptz not null default now(),
  unique (user_id, craftsman_id)
);

create index if not exists consumer_favorites_craftsman_id_idx
  on public.consumer_favorites (craftsman_id);

create index if not exists consumer_favorites_user_id_idx
  on public.consumer_favorites (user_id);

-- -----------------------------------------------------------------------------
-- Demandes de devis
-- -----------------------------------------------------------------------------

create table if not exists public.quote_requests (
  id uuid primary key default gen_random_uuid(),
  craftsman_id uuid not null references public.craftsmen (id) on delete cascade,
  consumer_user_id uuid references auth.users (id) on delete set null,
  status public.quote_request_status not null default 'new',
  client_name text not null,
  client_email text not null,
  event_type text not null,
  event_date date,
  event_date_label text,
  guest_count integer,
  budget_hint text,
  message text not null,
  pro_response text,
  responded_at timestamptz,
  viewed_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists quote_requests_craftsman_id_created_at_idx
  on public.quote_requests (craftsman_id, created_at desc);

create index if not exists quote_requests_consumer_user_id_idx
  on public.quote_requests (consumer_user_id);

create index if not exists quote_requests_status_idx
  on public.quote_requests (craftsman_id, status);

-- -----------------------------------------------------------------------------
-- Événements analytics (journal brut)
-- -----------------------------------------------------------------------------

create table if not exists public.craftsman_analytics_events (
  id uuid primary key default gen_random_uuid(),
  craftsman_id uuid not null references public.craftsmen (id) on delete cascade,
  event_type public.craftsman_analytics_event_type not null,
  actor_user_id uuid references auth.users (id) on delete set null,
  session_id text,
  search_query text,
  search_filters jsonb,
  source_path text,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);

create index if not exists craftsman_analytics_events_craftsman_created_idx
  on public.craftsman_analytics_events (craftsman_id, created_at desc);

create index if not exists craftsman_analytics_events_type_created_idx
  on public.craftsman_analytics_events (craftsman_id, event_type, created_at desc);

create index if not exists craftsman_analytics_events_search_query_idx
  on public.craftsman_analytics_events (craftsman_id, search_query)
  where search_query is not null and search_query <> '';

-- -----------------------------------------------------------------------------
-- updated_at automatique
-- -----------------------------------------------------------------------------

create or replace function public.set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists craftsmen_set_updated_at on public.craftsmen;
create trigger craftsmen_set_updated_at
  before update on public.craftsmen
  for each row execute function public.set_updated_at();

drop trigger if exists quote_requests_set_updated_at on public.quote_requests;
create trigger quote_requests_set_updated_at
  before update on public.quote_requests
  for each row execute function public.set_updated_at();

-- -----------------------------------------------------------------------------
-- Helpers RLS : artisan connecté
-- -----------------------------------------------------------------------------

create or replace function public.current_craftsman_id()
returns uuid
language sql
stable
security definer
set search_path = public
as $$
  select c.id
  from public.craftsmen c
  where c.owner_user_id = auth.uid()
  limit 1;
$$;

create or replace function public.is_craftsman_owner(p_craftsman_id uuid)
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select exists (
    select 1
    from public.craftsmen c
    where c.id = p_craftsman_id
      and c.owner_user_id = auth.uid()
  );
$$;

-- -----------------------------------------------------------------------------
-- Enregistrement d'événements (app publique)
-- -----------------------------------------------------------------------------

create or replace function public.record_craftsman_event(
  p_craftsman_id uuid,
  p_event_type public.craftsman_analytics_event_type,
  p_search_query text default null,
  p_search_filters jsonb default null,
  p_source_path text default null,
  p_session_id text default null,
  p_metadata jsonb default '{}'::jsonb
)
returns uuid
language plpgsql
security definer
set search_path = public
as $$
declare
  v_event_id uuid;
begin
  if not exists (select 1 from public.craftsmen c where c.id = p_craftsman_id and c.published = true) then
    raise exception 'Artisan introuvable ou non publié';
  end if;

  insert into public.craftsman_analytics_events (
    craftsman_id,
    event_type,
    actor_user_id,
    session_id,
    search_query,
    search_filters,
    source_path,
    metadata
  )
  values (
    p_craftsman_id,
    p_event_type,
    auth.uid(),
    p_session_id,
    nullif(trim(p_search_query), ''),
    p_search_filters,
    p_source_path,
    coalesce(p_metadata, '{}'::jsonb)
  )
  returning id into v_event_id;

  return v_event_id;
end;
$$;

-- Batch : impressions recherche (liste de résultats affichée)
create or replace function public.record_search_impressions(
  p_craftsman_ids uuid[],
  p_search_query text default null,
  p_search_filters jsonb default null,
  p_source_path text default null,
  p_session_id text default null
)
returns integer
language plpgsql
security definer
set search_path = public
as $$
declare
  v_count integer := 0;
  v_id uuid;
begin
  if p_craftsman_ids is null or cardinality(p_craftsman_ids) = 0 then
    return 0;
  end if;

  foreach v_id in array p_craftsman_ids loop
    if exists (select 1 from public.craftsmen c where c.id = v_id and c.published = true) then
      insert into public.craftsman_analytics_events (
        craftsman_id, event_type, actor_user_id, session_id,
        search_query, search_filters, source_path
      )
      values (
        v_id, 'search_impression', auth.uid(), p_session_id,
        nullif(trim(p_search_query), ''), p_search_filters, p_source_path
      );
      v_count := v_count + 1;
    end if;
  end loop;

  return v_count;
end;
$$;

-- -----------------------------------------------------------------------------
-- Favoris
-- -----------------------------------------------------------------------------

create or replace function public.toggle_consumer_favorite(p_craftsman_id uuid)
returns boolean
language plpgsql
security definer
set search_path = public
as $$
declare
  v_added boolean;
begin
  if auth.uid() is null then
    raise exception 'Authentification requise';
  end if;

  if not exists (select 1 from public.craftsmen c where c.id = p_craftsman_id and c.published = true) then
    raise exception 'Artisan introuvable';
  end if;

  if exists (
    select 1 from public.consumer_favorites f
    where f.user_id = auth.uid() and f.craftsman_id = p_craftsman_id
  ) then
    delete from public.consumer_favorites
    where user_id = auth.uid() and craftsman_id = p_craftsman_id;
    v_added := false;
  else
    insert into public.consumer_favorites (user_id, craftsman_id)
    values (auth.uid(), p_craftsman_id);
    perform public.record_craftsman_event(
      p_craftsman_id,
      'favorite_added',
      p_metadata => jsonb_build_object('via', 'toggle_consumer_favorite')
    );
    v_added := true;
  end if;

  return v_added;
end;
$$;

-- -----------------------------------------------------------------------------
-- Devis : création côté consommateur
-- -----------------------------------------------------------------------------

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
  if not exists (select 1 from public.craftsmen c where c.id = p_craftsman_id and c.published = true) then
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

  perform public.record_craftsman_event(
    p_craftsman_id,
    'contact_request',
    p_metadata => jsonb_build_object('quote_request_id', v_id)
  );

  return v_id;
end;
$$;

-- Marquer devis comme vu / répondu (dashboard pro)
create or replace function public.mark_quote_request_viewed(p_quote_id uuid)
returns void
language plpgsql
security definer
set search_path = public
as $$
begin
  update public.quote_requests q
  set
    status = case when q.status = 'new' then 'viewed'::public.quote_request_status else q.status end,
    viewed_at = coalesce(q.viewed_at, now())
  where q.id = p_quote_id
    and public.is_craftsman_owner(q.craftsman_id);
end;
$$;

create or replace function public.answer_quote_request(
  p_quote_id uuid,
  p_response text
)
returns void
language plpgsql
security definer
set search_path = public
as $$
begin
  update public.quote_requests q
  set
    status = 'answered',
    pro_response = trim(p_response),
    responded_at = now(),
    viewed_at = coalesce(q.viewed_at, now())
  where q.id = p_quote_id
    and public.is_craftsman_owner(q.craftsman_id);
end;
$$;

create or replace function public.update_quote_request_status(
  p_quote_id uuid,
  p_status public.quote_request_status
)
returns void
language plpgsql
security definer
set search_path = public
as $$
begin
  update public.quote_requests q
  set status = p_status
  where q.id = p_quote_id
    and public.is_craftsman_owner(q.craftsman_id);
end;
$$;

-- -----------------------------------------------------------------------------
-- Vue d'ensemble dashboard (JSON = CatererDashboardStats côté Angular)
-- -----------------------------------------------------------------------------

create or replace function public.humanize_interval_fr(p_interval interval)
returns text
language plpgsql
immutable
as $$
declare
  v_secs bigint := extract(epoch from abs(p_interval))::bigint;
begin
  if v_secs < 60 then return 'À l''instant'; end if;
  if v_secs < 3600 then return 'Il y a ' || (v_secs / 60) || ' min'; end if;
  if v_secs < 86400 then return 'Il y a ' || (v_secs / 3600) || ' h'; end if;
  if v_secs < 172800 then return 'Hier'; end if;
  if v_secs < 604800 then return 'Il y a ' || (v_secs / 86400) || ' jours'; end if;
  if v_secs < 2592000 then return 'Il y a ' || (v_secs / 604800) || ' sem.'; end if;
  return 'Il y a ' || (v_secs / 2592000) || ' mois';
end;
$$;

create or replace function public._stat_trend(
  p_current bigint,
  p_previous bigint
)
returns jsonb
language sql
immutable
as $$
  select jsonb_build_object(
    'value', p_current,
    'delta', case
      when p_previous = 0 then
        case when p_current = 0 then 0 else 100 end
      else round(((p_current::numeric - p_previous::numeric) / p_previous::numeric) * 100, 1)
    end
  );
$$;

create or replace function public.get_craftsman_dashboard_stats(
  p_days integer default 30
)
returns jsonb
language plpgsql
stable
security definer
set search_path = public
as $$
declare
  v_craftsman_id uuid;
  v_now timestamptz := now();
  v_period_start timestamptz;
  v_prev_start timestamptz;
  v_prev_end timestamptz;

  v_profile_views bigint;
  v_profile_views_prev bigint;
  v_search_impressions bigint;
  v_search_impressions_prev bigint;
  v_profile_clicks bigint;
  v_profile_clicks_prev bigint;
  v_contact_requests bigint;
  v_contact_requests_prev bigint;
  v_saved_total bigint;
  v_saved_prev bigint;

  v_views_series jsonb;
  v_top_keywords jsonb;
  v_recent_activity jsonb;
begin
  v_craftsman_id := public.current_craftsman_id();
  if v_craftsman_id is null then
    raise exception 'Aucun profil artisan associé à cet utilisateur';
  end if;

  v_period_start := v_now - make_interval(days => greatest(p_days, 1));
  v_prev_end := v_period_start;
  v_prev_start := v_prev_end - make_interval(days => greatest(p_days, 1));

  -- Compteurs période courante / précédente
  select count(*) into v_profile_views
  from public.craftsman_analytics_events e
  where e.craftsman_id = v_craftsman_id
    and e.event_type = 'profile_view'
    and e.created_at >= v_period_start;

  select count(*) into v_profile_views_prev
  from public.craftsman_analytics_events e
  where e.craftsman_id = v_craftsman_id
    and e.event_type = 'profile_view'
    and e.created_at >= v_prev_start and e.created_at < v_prev_end;

  select count(*) into v_search_impressions
  from public.craftsman_analytics_events e
  where e.craftsman_id = v_craftsman_id
    and e.event_type = 'search_impression'
    and e.created_at >= v_period_start;

  select count(*) into v_search_impressions_prev
  from public.craftsman_analytics_events e
  where e.craftsman_id = v_craftsman_id
    and e.event_type = 'search_impression'
    and e.created_at >= v_prev_start and e.created_at < v_prev_end;

  select count(*) into v_profile_clicks
  from public.craftsman_analytics_events e
  where e.craftsman_id = v_craftsman_id
    and e.event_type = 'profile_click'
    and e.created_at >= v_period_start;

  select count(*) into v_profile_clicks_prev
  from public.craftsman_analytics_events e
  where e.craftsman_id = v_craftsman_id
    and e.event_type = 'profile_click'
    and e.created_at >= v_prev_start and e.created_at < v_prev_end;

  select count(*) into v_contact_requests
  from public.quote_requests q
  where q.craftsman_id = v_craftsman_id
    and q.created_at >= v_period_start;

  select count(*) into v_contact_requests_prev
  from public.quote_requests q
  where q.craftsman_id = v_craftsman_id
    and q.created_at >= v_prev_start and q.created_at < v_prev_end;

  select count(*) into v_saved_total
  from public.consumer_favorites f
  where f.craftsman_id = v_craftsman_id;

  select count(*) into v_saved_prev
  from public.consumer_favorites f
  where f.craftsman_id = v_craftsman_id
    and f.created_at >= v_prev_start and f.created_at < v_prev_end;

  -- Série 7 jours (vues profil)
  select coalesce(jsonb_agg(day_row order by day_row->>'date'), '[]'::jsonb)
  into v_views_series
  from (
    select jsonb_build_object(
      'date', to_char(d.day, 'YYYY-MM-DD'),
      'label', case extract(isodow from d.day)::int
        when 1 then 'Lun' when 2 then 'Mar' when 3 then 'Mer' when 4 then 'Jeu'
        when 5 then 'Ven' when 6 then 'Sam' when 7 then 'Dim'
      end,
      'views', coalesce(v.cnt, 0)
    ) as day_row
    from generate_series(
      (v_now::date - interval '6 days')::date,
      v_now::date,
      interval '1 day'
    ) as d(day)
    left join lateral (
      select count(*)::bigint as cnt
      from public.craftsman_analytics_events e
      where e.craftsman_id = v_craftsman_id
        and e.event_type = 'profile_view'
        and e.created_at::date = d.day
    ) v on true
  ) s;

  -- Mots-clés (requêtes ayant mené à un clic ou une vue, 30 j)
  select coalesce(jsonb_agg(kw.keyword), '[]'::jsonb)
  into v_top_keywords
  from (
    select lower(trim(e.search_query)) as keyword, count(*) as cnt
    from public.craftsman_analytics_events e
    where e.craftsman_id = v_craftsman_id
      and e.search_query is not null
      and trim(e.search_query) <> ''
      and e.event_type in ('profile_click', 'profile_view')
      and e.created_at >= v_period_start
    group by 1
    order by cnt desc
    limit 8
  ) kw;

  -- Activité récente (événements + devis)
  with merged as (
    select
      e.id::text as id,
      e.created_at,
      case e.event_type
        when 'profile_view' then 'pi pi-eye'
        when 'search_impression' then 'pi pi-search'
        when 'profile_click' then 'pi pi-arrow-right'
        when 'favorite_added' then 'pi pi-heart'
        when 'contact_request' then 'pi pi-envelope'
        else 'pi pi-circle'
      end as icon,
      case e.event_type
        when 'profile_view' then 'Vue de profil'
        when 'search_impression' then 'Apparition recherche'
        when 'profile_click' then 'Clic sur la fiche'
        when 'favorite_added' then 'Ajout aux favoris'
        when 'contact_request' then 'Demande de contact'
        else 'Interaction'
      end as title,
      coalesce(
        case
          when e.search_query is not null and e.search_query <> '' then
            'Requête « ' || e.search_query || ' ».'
        end,
        'Interaction enregistrée sur votre vitrine.'
      ) as description
    from public.craftsman_analytics_events e
    where e.craftsman_id = v_craftsman_id

    union all

    select
      q.id::text,
      q.created_at,
      'pi pi-envelope',
      'Demande de devis',
      q.event_type || ' — ' || q.client_name
        || coalesce(' (' || q.guest_count::text || ' pers.)', '')
    from public.quote_requests q
    where q.craftsman_id = v_craftsman_id
  )
  select coalesce(jsonb_agg(
    jsonb_build_object(
      'id', m.id,
      'icon', m.icon,
      'title', m.title,
      'description', m.description,
      'timeAgo', public.humanize_interval_fr(v_now - m.created_at)
    )
    order by m.created_at desc
  ), '[]'::jsonb)
  into v_recent_activity
  from (
    select * from merged order by created_at desc limit 15
  ) m;

  return jsonb_build_object(
    'periodLabel', p_days || ' derniers jours',
    'profileViews', public._stat_trend(v_profile_views, v_profile_views_prev),
    'searchImpressions', public._stat_trend(v_search_impressions, v_search_impressions_prev),
    'profileClicks', public._stat_trend(v_profile_clicks, v_profile_clicks_prev),
    'contactRequests', public._stat_trend(v_contact_requests, v_contact_requests_prev),
    'savedCount', public._stat_trend(v_saved_total, v_saved_prev),
    'viewsSeries', v_views_series,
    'topKeywords', v_top_keywords,
    'recentActivity', v_recent_activity
  );
end;
$$;

-- Liste devis pour le dashboard pro
create or replace function public.get_craftsman_quote_requests()
returns setof public.quote_requests
language sql
stable
security definer
set search_path = public
as $$
  select q.*
  from public.quote_requests q
  where q.craftsman_id = public.current_craftsman_id()
  order by q.created_at desc;
$$;

-- Synthèse devis (total / nouveaux / en cours / répondus)
create or replace function public.get_craftsman_quote_stats()
returns jsonb
language sql
stable
security definer
set search_path = public
as $$
  select jsonb_build_object(
    'total', count(*),
    'new', count(*) filter (where q.status = 'new'),
    'pending', count(*) filter (where q.status in ('new', 'viewed')),
    'answered', count(*) filter (where q.status = 'answered')
  )
  from public.quote_requests q
  where q.craftsman_id = public.current_craftsman_id();
$$;

-- -----------------------------------------------------------------------------
-- Row Level Security
-- -----------------------------------------------------------------------------

alter table public.craftsmen enable row level security;
alter table public.consumer_favorites enable row level security;
alter table public.quote_requests enable row level security;
alter table public.craftsman_analytics_events enable row level security;

-- Craftsmen : lecture publique des profils publiés ; écriture par le propriétaire
create policy craftsmen_select_published on public.craftsmen
  for select using (published = true or owner_user_id = auth.uid());

create policy craftsmen_owner_all on public.craftsmen
  for all using (owner_user_id = auth.uid())
  with check (owner_user_id = auth.uid());

-- Favoris : chaque utilisateur gère les siens ; le pro voit le décompte via RPC
create policy consumer_favorites_own on public.consumer_favorites
  for all using (user_id = auth.uid())
  with check (user_id = auth.uid());

create policy consumer_favorites_owner_read on public.consumer_favorites
  for select using (public.is_craftsman_owner(craftsman_id));

-- Devis : consommateur lit/crée les siens ; pro lit/gère les siens
create policy quote_requests_consumer_select on public.quote_requests
  for select using (consumer_user_id = auth.uid());

create policy quote_requests_consumer_insert on public.quote_requests
  for insert with check (consumer_user_id = auth.uid());

create policy quote_requests_owner_select on public.quote_requests
  for select using (public.is_craftsman_owner(craftsman_id));

create policy quote_requests_owner_update on public.quote_requests
  for update using (public.is_craftsman_owner(craftsman_id));

-- Analytics : insertion via fonctions security definer ; lecture propriétaire uniquement
create policy craftsman_analytics_owner_select on public.craftsman_analytics_events
  for select using (public.is_craftsman_owner(craftsman_id));

-- -----------------------------------------------------------------------------
-- Droits d'exécution RPC
-- -----------------------------------------------------------------------------

grant usage on schema public to anon, authenticated;

grant execute on function public.record_craftsman_event to anon, authenticated;
grant execute on function public.record_search_impressions to anon, authenticated;
grant execute on function public.toggle_consumer_favorite to authenticated;
grant execute on function public.create_quote_request to anon, authenticated;
grant execute on function public.get_craftsman_dashboard_stats to authenticated;
grant execute on function public.get_craftsman_quote_requests to authenticated;
grant execute on function public.get_craftsman_quote_stats to authenticated;
grant execute on function public.mark_quote_request_viewed to authenticated;
grant execute on function public.answer_quote_request to authenticated;
grant execute on function public.update_quote_request_status to authenticated;
