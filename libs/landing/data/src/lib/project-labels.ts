import { ProjectType } from '@trouvermontraiteur/models';

export const PROJECT_LABELS: Record<ProjectType, string> = {
  renovation: 'Rénovation',
  depannage: 'Dépannage',
  construction: 'Construction',
  entretien: 'Entretien',
  amenagement: 'Aménagement',
  conseil: 'Conseil',
};

export const ALL_PROJECT_TYPES = Object.keys(
  PROJECT_LABELS,
) as ProjectType[];
