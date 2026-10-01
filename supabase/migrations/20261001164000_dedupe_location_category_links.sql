-- Drop Location & Mobilier links for businesses already filed under another trade
-- when their name is not a furniture or equipment rental.
-- Businesses whose name is a rental stay in Location & Mobilier only.

delete from public.craftsmans_sub_category as link
using public.craftsmans as craftsman,
  public.sub_categories_translations as location_label
where link.craftsman_id = craftsman.id
  and location_label.sub_category_id = link.sub_category_id
  and location_label.language_code = 'fr'
  and location_label.name in (
    'Tables & chaises',
    'Mobilier',
    'Vaisselle',
    'Tentes & structures',
    'Matériel événementiel'
  )
  and craftsman.name in (
    'Agence YE - Agence événementielle & de communication',
    'Atelier Camus - Faire-part - Decoration Mariage - Wedding Designer',
    'BOOST Evenement',
    'KRD Audiovisuel',
    'Location Salle Toulouse - La péniche Saint-Louis',
    'Psb Lounge',
    'Social Events (Photobooth - Vidéobooth 360° - Karaoké - Réalité Virtuelle - Social Wall - Totem intéractifs)',
    'Le Mur Interactif Occitanie',
    'Hōc Diē - Agence Événementielle & Wedding Planner Toulouse'
  );

delete from public.craftsmans_sub_category as link
using public.craftsmans as craftsman,
  public.sub_categories_translations as other_label
where link.craftsman_id = craftsman.id
  and other_label.sub_category_id = link.sub_category_id
  and other_label.language_code = 'fr'
  and other_label.name not in (
    'Tables & chaises',
    'Mobilier',
    'Vaisselle',
    'Tentes & structures',
    'Matériel événementiel'
  )
  and craftsman.name in (
    'Be Lounge Toulouse - Location tente et mobilier de réception',
    'Loc2lux Events - Location Matériels pour évènements ( Mariage, Baby shower, Fêtes privés... )',
    'Options Toulouse - Location de matériel événementiel',
    'Tentes événementielles - Organic Concept Toulouse'
  );

update public.craftsmans_sub_category as link
set sub_category_id = materiel.sub_category_id
from public.craftsmans as craftsman,
  public.sub_categories_translations as current_label,
  public.sub_categories_translations as materiel
where link.craftsman_id = craftsman.id
  and current_label.sub_category_id = link.sub_category_id
  and current_label.language_code = 'fr'
  and current_label.name = 'Tables & chaises'
  and materiel.language_code = 'fr'
  and materiel.name = 'Matériel événementiel'
  and craftsman.name in (
    'Loc2lux Events - Location Matériels pour évènements ( Mariage, Baby shower, Fêtes privés... )',
    'Options Toulouse - Location de matériel événementiel'
  );
