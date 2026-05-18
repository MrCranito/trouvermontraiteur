import { DietaryOption } from '@trouvermontraiteur/models';

export const DIETARY_LABELS: Record<DietaryOption, string> = {
  vegetarien: 'Végétarien',
  vegan: 'Vegan',
  halal: 'Halal',
  sans_gluten: 'Sans gluten',
  sans_lactose: 'Sans lactose',
};

export const ALL_DIETARY_OPTIONS = Object.keys(
  DIETARY_LABELS,
) as DietaryOption[];
