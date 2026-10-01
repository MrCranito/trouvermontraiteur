-- Google rating and review count for catalog listings.
-- Seeded descriptions store "Note Google : 4.7/5 (45 avis)".

alter table public.craftsmans
  add column if not exists rating numeric(2, 1) not null default 0,
  add column if not exists review_count integer not null default 0;

update public.craftsmans
set
  rating = substring(description from 'Note Google : ([0-9]+[.]?[0-9]*)/5')::numeric,
  review_count = coalesce(
    substring(description from 'Note Google : [0-9]+[.]?[0-9]*/5 \(([0-9]+) avis\)')::integer,
    0
  ),
  updated_at = now()
where description like '%Note Google :%';
