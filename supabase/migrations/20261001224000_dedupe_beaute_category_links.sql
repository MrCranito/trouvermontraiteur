-- Wedding dress makers stay in Beauté & Mode.
-- Decoration links are removed when the name is clearly a bridal outfit.

delete from public.craftsmans_sub_category as link
using public.craftsmans as craftsman,
  public.sub_categories_translations as other_label
where link.craftsman_id = craftsman.id
  and other_label.sub_category_id = link.sub_category_id
  and other_label.language_code = 'fr'
  and other_label.name not in (
    'Coiffeur',
    'Maquilleur',
    'Tenues',
    'Accessoires'
  )
  and craftsman.name in (
    'Delphine Josse — Créatrice de Robes de Mariée & Sur-Mesure • Toulouse',
    'Muriel Prando Créatrice - Robes de mariée Toulouse',
    'So In Love - Créatrices de robes de mariée sur mesure'
  );
