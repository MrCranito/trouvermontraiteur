-- Prefer direct craftsmans queries filtered by category_id from the app.
drop function if exists public.get_discover_preview_craftsman_ids(int);
drop function if exists public.get_discover_preview_craftsman_ids_for_category(uuid, int);
