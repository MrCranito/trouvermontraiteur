-- Organisers stay in Organisation. Listings whose name is a planner or event agency
-- leave their previous trade. Rentals, caterers, DJs, and photo or video pros
-- stay in that trade instead of Organisation.

delete from public.craftsmans_sub_category as link
using public.craftsmans as craftsman,
  public.sub_categories_translations as other_label
where link.craftsman_id = craftsman.id
  and other_label.sub_category_id = link.sub_category_id
  and other_label.language_code = 'fr'
  and other_label.name not in (
    'Organisation d''événement',
    'Wedding planner',
    'Event planner'
  )
  and exists (
    select 1
    from public.craftsmans_sub_category as org_link
    join public.sub_categories_translations as org_label
      on org_label.sub_category_id = org_link.sub_category_id
     and org_label.language_code = 'fr'
    where org_link.craftsman_id = craftsman.id
      and org_label.name in (
        'Organisation d''événement',
        'Wedding planner',
        'Event planner'
      )
  )
  and (
    craftsman.name ilike '%wedding planner%'
    or craftsman.name ilike '%event planner%'
    or craftsman.name ilike '%organisateur%'
    or craftsman.name ilike '%organisatrice%'
    or craftsman.name ilike '%agence événementielle%'
    or craftsman.name ilike '%agence evenementielle%'
    or craftsman.name ilike '%agence event%'
  );

delete from public.craftsmans_sub_category as link
using public.craftsmans as craftsman,
  public.sub_categories_translations as org_label
where link.craftsman_id = craftsman.id
  and org_label.sub_category_id = link.sub_category_id
  and org_label.language_code = 'fr'
  and org_label.name in (
    'Organisation d''événement',
    'Wedding planner',
    'Event planner'
  )
  and (
    craftsman.name ilike '%wedding designer%'
    or craftsman.name ilike '%faire-part%'
    or craftsman.name ilike '%photobooth%'
    or craftsman.name ilike '%vidéaste%'
    or craftsman.name ilike '%videaste%'
    or craftsman.name ilike '%traiteur%'
    or craftsman.name ilike '%chef %'
    or craftsman.name ilike '%location tente%'
    or craftsman.name ilike '%location matériel%'
    or craftsman.name ilike '%location materiel%'
    or craftsman.name ilike '%location salle%'
    or craftsman.name ilike '%péniche%'
    or craftsman.name ilike '%peniche%'
    or craftsman.name ilike '%réalité virtuelle%'
    or craftsman.name ilike '%realite virtuelle%'
    or craftsman.name ilike 'dj %'
    or craftsman.name ilike '% dj %'
  );

delete from public.craftsmans_sub_category as link
using public.craftsmans as craftsman,
  public.sub_categories_translations as org_label
where link.craftsman_id = craftsman.id
  and org_label.sub_category_id = link.sub_category_id
  and org_label.language_code = 'fr'
  and org_label.name in (
    'Organisation d''événement',
    'Wedding planner',
    'Event planner'
  )
  and craftsman.name not ilike '%wedding planner%'
  and craftsman.name not ilike '%event planner%'
  and craftsman.name not ilike '%organisateur%'
  and craftsman.name not ilike '%organisatrice%'
  and craftsman.name not ilike '%agence événementielle%'
  and craftsman.name not ilike '%agence evenementielle%'
  and craftsman.name not ilike '%agence event%'
  and exists (
    select 1
    from public.craftsmans_sub_category as other_link
    join public.sub_categories_translations as other_label
      on other_label.sub_category_id = other_link.sub_category_id
     and other_label.language_code = 'fr'
    where other_link.craftsman_id = craftsman.id
      and other_label.name in (
        'Vidéaste',
        'Photobooth',
        'Photographe',
        'Traiteur',
        'Tables & chaises',
        'Mobilier',
        'Vaisselle',
        'Tentes & structures',
        'Matériel événementiel',
        'Fleuriste',
        'Ballons'
      )
  );
