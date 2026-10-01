-- Places already imported in another trade were also returned by decoration searches.
-- Drop that extra Décoration & Fleurs link, except Atelier Camus, whose name is the decoration business.
-- Atelier Camus stays in Mise en scène and leaves Traiteur.

delete from public.craftsmans_sub_category as link
using public.craftsmans as craftsman,
  public.sub_categories_translations as decoration_label
where link.craftsman_id = craftsman.id
  and decoration_label.sub_category_id = link.sub_category_id
  and decoration_label.language_code = 'fr'
  and decoration_label.name in ('Décoration', 'Fleuriste', 'Ballons', 'Mise en scène')
  and craftsman.name <> 'Atelier Camus - Faire-part - Decoration Mariage - Wedding Designer'
  and exists (
    select 1
    from public.craftsmans_sub_category as other
    join public.sub_categories_translations as other_label
      on other_label.sub_category_id = other.sub_category_id
     and other_label.language_code = 'fr'
    where other.craftsman_id = craftsman.id
      and other_label.name not in ('Décoration', 'Fleuriste', 'Ballons', 'Mise en scène')
  );

delete from public.craftsmans_sub_category as link
using public.craftsmans as craftsman,
  public.sub_categories_translations as other_label
where link.craftsman_id = craftsman.id
  and craftsman.name = 'Atelier Camus - Faire-part - Decoration Mariage - Wedding Designer'
  and other_label.sub_category_id = link.sub_category_id
  and other_label.language_code = 'fr'
  and other_label.name = 'Traiteur';
