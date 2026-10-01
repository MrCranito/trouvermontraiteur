-- Live craftsmans.owner_user_pro_id references users_pro.id, not owner_user_id.
-- The public read policy has to match that key so a linked pro account is
-- returned with the craftsman.

do $$
begin
  if exists (
    select 1
    from information_schema.columns
    where table_schema = 'public'
      and table_name = 'users_pro'
      and column_name = 'id'
  ) then
    execute 'drop policy if exists users_pro_select_linked_craftsman on public.users_pro';
    execute $policy$
      create policy users_pro_select_linked_craftsman
        on public.users_pro
        for select
        to anon, authenticated
        using (
          exists (
            select 1
            from public.craftsmans c
            where c.owner_user_pro_id = users_pro.id
              and c.deleted_at is null
              and (
                c.published = true
                or users_pro.owner_user_id = auth.uid()
              )
          )
        )
    $policy$;
  end if;
end $$;

notify pgrst, 'reload schema';
