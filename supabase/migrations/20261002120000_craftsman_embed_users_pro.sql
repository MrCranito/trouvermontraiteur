-- Let the craftsman API embed the linked professional account.
-- owner_user_pro_id already stores users_pro.owner_user_id, but PostgREST
-- can only nest that row when a foreign key exists.

update public.craftsmans c
set owner_user_pro_id = null
where c.owner_user_pro_id is not null
  and not exists (
    select 1
    from public.users_pro p
    where p.owner_user_id = c.owner_user_pro_id
  );

do $$
begin
  if not exists (
    select 1
    from pg_constraint c
    join pg_class rel on rel.oid = c.conrelid
    join pg_namespace nsp on nsp.oid = rel.relnamespace
    join pg_class frel on frel.oid = c.confrelid
    where nsp.nspname = 'public'
      and rel.relname = 'craftsmans'
      and frel.relname = 'users_pro'
      and c.contype = 'f'
  ) then
    alter table public.craftsmans
      add constraint craftsmans_owner_user_pro_id_users_pro_fkey
      foreign key (owner_user_pro_id)
      references public.users_pro (owner_user_id)
      on delete set null;
  end if;
end $$;

grant select (owner_user_id, business_name, created_at, updated_at)
  on table public.users_pro
  to anon;

drop policy if exists users_pro_select_linked_craftsman on public.users_pro;
create policy users_pro_select_linked_craftsman
  on public.users_pro
  for select
  to anon, authenticated
  using (
    exists (
      select 1
      from public.craftsmans c
      where c.owner_user_pro_id = users_pro.owner_user_id
        and c.deleted_at is null
        and (
          c.published = true
          or c.owner_user_pro_id = auth.uid()
        )
    )
  );

notify pgrst, 'reload schema';
