-- =============================================================================
-- Fix ON CONFLICT target for craftsmans.owner_user_pro_id
-- Previous partial unique index cannot be inferred by ON CONFLICT (owner_user_pro_id).
-- =============================================================================

-- Keep latest row when duplicates exist, then enforce unique index.
with ranked as (
  select
    ctid,
    row_number() over (
      partition by owner_user_pro_id
      order by updated_at desc nulls last, created_at desc nulls last, ctid desc
    ) as rn
  from public.craftsmans
  where owner_user_pro_id is not null
)
delete from public.craftsmans c
using ranked r
where c.ctid = r.ctid
  and r.rn > 1;

drop index if exists public.craftsmans_owner_user_pro_id_unique;

create unique index if not exists craftsmans_owner_user_pro_id_unique
  on public.craftsmans (owner_user_pro_id);
