-- Magicians belong in Animation. Drop the earlier Mise en scène link.

delete from public.craftsmans_sub_category as link
using public.craftsmans as craftsman,
  public.sub_categories_translations as other_label
where link.craftsman_id = craftsman.id
  and other_label.sub_category_id = link.sub_category_id
  and other_label.language_code = 'fr'
  and other_label.name not in (
    'Animateur',
    'Jeux & quiz',
    'Spectacles',
    'Magicien',
    'Activités'
  )
  and craftsman.name in (
    'Bertrand Gaté Magicien',
    'Compagnie les Incompressibles - Magie, feux d''artifice',
    'Jay’magicien'
  );
