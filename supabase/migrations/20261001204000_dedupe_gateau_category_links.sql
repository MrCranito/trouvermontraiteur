-- Cake designers stay in Gâteau & Pâtisserie.
-- Traiteurs, wedding planners, and rental companies stay in their existing trade.

delete from public.craftsmans_sub_category as link
using public.craftsmans as craftsman,
  public.sub_categories_translations as other_label
where link.craftsman_id = craftsman.id
  and other_label.sub_category_id = link.sub_category_id
  and other_label.language_code = 'fr'
  and other_label.name not in (
    'Gâteau événementiel',
    'Wedding cake',
    'Pièce montée',
    'Pâtisserie personnalisée'
  )
  and craftsman.name = 'VAL JUSTAMANTE CAKE DESIGN TOULOUSE';

delete from public.craftsmans_sub_category as link
using public.craftsmans as craftsman,
  public.sub_categories_translations as cake_label
where link.craftsman_id = craftsman.id
  and cake_label.sub_category_id = link.sub_category_id
  and cake_label.language_code = 'fr'
  and cake_label.name in (
    'Gâteau événementiel',
    'Wedding cake',
    'Pièce montée',
    'Pâtisserie personnalisée'
  )
  and craftsman.name in (
    'Artisan Traiteur Toulouse',
    'Bimbiz Food',
    'Event Ewa Wedding Planner',
    'L'' Atelier Des Gourmandises',
    'Les romances de Marie',
    'Wedding Location Toulouse'
  );
