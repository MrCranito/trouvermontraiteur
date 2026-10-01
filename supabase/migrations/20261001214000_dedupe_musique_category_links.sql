-- DJs stay in Musique & DJ.
-- Photobooth, video, and event-organisation links are removed when the name is a DJ.
-- PADJ.fr was imported as an organiser; the name is a DJ, so it moves.

delete from public.craftsmans_sub_category as link
using public.craftsmans as craftsman,
  public.sub_categories_translations as other_label
where link.craftsman_id = craftsman.id
  and other_label.sub_category_id = link.sub_category_id
  and other_label.language_code = 'fr'
  and other_label.name not in (
    'DJ',
    'Groupe de musique',
    'Musicien',
    'Chanteur'
  )
  and craftsman.name in (
    'AGENCE LPC - TOULOUSE DJ',
    'DJ EVEN',
    'DJ Toulouse - Guillaume B - Guillaume BAUDRAND',
    'DJ Toulouse Une belle soirée',
    'Karanim Disco',
    'Les Petites Pépites dj',
    'Nanobox - DJ Mariage Toulouse | Animation Événementielle',
    'PADJ.fr'
  );

insert into public.craftsmans_sub_category (craftsman_id, sub_category_id)
select craftsman.id, sub_category.id
from public.craftsmans as craftsman
join public.sub_categories_translations as translation
  on translation.language_code = 'fr'
 and translation.name = 'DJ'
join public.sub_categories as sub_category
  on sub_category.id = translation.sub_category_id
where craftsman.name = 'PADJ.fr'
  and not exists (
    select 1
    from public.craftsmans_sub_category as link
    where link.craftsman_id = craftsman.id
      and link.sub_category_id = sub_category.id
  );
