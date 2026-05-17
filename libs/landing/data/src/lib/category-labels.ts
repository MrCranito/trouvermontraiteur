import { CatererCategory } from '@trouvermontraiteur/models';

export const CATEGORY_LABELS: Record<CatererCategory, string> = {
  boissons_soft: 'Boissons sans alcool',
  boissons_alcool: 'Boissons alcoolisées',
  aperitifs: 'Apéritifs',
  repas: 'Repas',
  desserts: 'Desserts',
};

export const ALL_CATEGORIES = Object.keys(
  CATEGORY_LABELS,
) as CatererCategory[];
