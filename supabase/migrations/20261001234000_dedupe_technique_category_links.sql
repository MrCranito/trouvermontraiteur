-- Interactive screens stay in Technique & Audiovisuel.
-- A video-production name stays Vidéaste.
-- A general event-rental name stays Matériel événementiel.

delete from public.craftsmans_sub_category as link
using public.craftsmans as craftsman,
  public.sub_categories_translations as other_label
where link.craftsman_id = craftsman.id
  and other_label.sub_category_id = link.sub_category_id
  and other_label.language_code = 'fr'
  and other_label.name not in (
    'Sonorisation',
    'Éclairage',
    'Écrans & vidéo',
    'Scène'
  )
  and craftsman.name = 'Le Mur Interactif Occitanie';

delete from public.craftsmans_sub_category as link
using public.craftsmans as craftsman,
  public.sub_categories_translations as tech_label
where link.craftsman_id = craftsman.id
  and tech_label.sub_category_id = link.sub_category_id
  and tech_label.language_code = 'fr'
  and tech_label.name in (
    'Sonorisation',
    'Éclairage',
    'Écrans & vidéo',
    'Scène'
  )
  and craftsman.name in (
    'KRD Audiovisuel',
    'Loc2lux Events - Location Matériels pour évènements ( Mariage, Baby shower, Fêtes privés... )'
  );
