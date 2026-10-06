-- Messages d'une demande de devis. Pas de temps réel : chaque ouverture relit la discussion.
-- Les pièces jointes sont des data URLs (images compressées côté client).

create table if not exists public.quote_thread_messages (
  id uuid primary key,
  quote_id text not null,
  author text not null check (author in ('client', 'craftsman')),
  body text not null default '',
  attachments jsonb not null default '[]'::jsonb,
  created_at timestamptz not null default now()
);

create index if not exists quote_thread_messages_quote_id_created_at_idx
  on public.quote_thread_messages (quote_id, created_at);

alter table public.quote_thread_messages enable row level security;

grant select, insert on public.quote_thread_messages to authenticated;

drop policy if exists quote_thread_messages_select on public.quote_thread_messages;
create policy quote_thread_messages_select on public.quote_thread_messages
  for select to authenticated
  using (true);

drop policy if exists quote_thread_messages_insert on public.quote_thread_messages;
create policy quote_thread_messages_insert on public.quote_thread_messages
  for insert to authenticated
  with check (auth.uid() is not null);
