-- Returns up to N published craftsman ids per main category for the discover home page.
create or replace function public.get_discover_preview_craftsman_ids(
  p_limit_per_category int default 10
)
returns table (category_id uuid, craftsman_id uuid)
language sql
stable
security invoker
set search_path = public
as $$
  with per_category as (
    select
      sc.category_id,
      c.id as craftsman_id,
      row_number() over (
        partition by sc.category_id
        order by
          c.rating desc nulls last,
          c.review_count desc nulls last,
          c.created_at desc
      ) as rn
    from public.craftsmans c
    join public.craftsmans_sub_category csc on csc.craftsman_id = c.id
    join public.sub_categories sc on sc.id = csc.sub_category_id
    where c.published is true
      and c.deleted_at is null
    group by sc.category_id, c.id, c.rating, c.review_count, c.created_at
  )
  select
    per_category.category_id,
    per_category.craftsman_id
  from per_category
  where per_category.rn <= greatest(coalesce(p_limit_per_category, 10), 1);
$$;

revoke all on function public.get_discover_preview_craftsman_ids(int) from public;
grant execute on function public.get_discover_preview_craftsman_ids(int) to anon, authenticated;
