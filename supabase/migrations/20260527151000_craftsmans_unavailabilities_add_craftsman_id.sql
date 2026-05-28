-- =============================================================================
-- Add craftsman_id FK on craftsmans_unavailabilities → public.craftsmans(id)
-- =============================================================================

alter table public.craftsmans_unavailabilities
  add column craftsman_id uuid;

alter table public.craftsmans_unavailabilities
  add constraint craftsmans_unavailabilities_craftsman_id_fkey
  foreign key (craftsman_id)
  references public.craftsmans (id)
  on delete cascade;

create index craftsmans_unavailabilities_craftsman_id_idx
  on public.craftsmans_unavailabilities (craftsman_id);
