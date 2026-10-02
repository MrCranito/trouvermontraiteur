-- Top N published craftsman ids for one main category (discover home sections).
create or replace function public.get_discover_preview_craftsman_ids_for_category(
  p_category_id uuid,
  p_limit int default 10
)
returns table (craftsman_id uuid)
language sql
stable
security invoker
set search_path = public
as $$
  with ranked as (
    select
      c.id as craftsman_id,
      row_number() over (
        order by
          c.rating desc nulls last,
          c.review_count desc nulls last,
          c.created_at desc
      ) as rn
    from public.craftsmans c
    join public.craftsmans_sub_category csc on csc.craftsman_id = c.id
    join public.sub_categories sc on sc.id = csc.sub_category_id
    where sc.category_id = p_category_id
      and c.published is true
      and c.deleted_at is null
    group by c.id, c.rating, c.review_count, c.created_at
  )
  select ranked.craftsman_id
  from ranked
  where ranked.rn <= greatest(coalesce(p_limit, 10), 1);
$$;

revoke all on function public.get_discover_preview_craftsman_ids_for_category(uuid, int) from public;
grant execute on function public.get_discover_preview_craftsman_ids_for_category(uuid, int) to anon, authenticated;
