import { EventType } from '@trouvermontraiteur/models';

export const EVENT_LABELS: Record<EventType, string> = {
  mariage: 'Mariage',
  anniversaire: 'Anniversaire & fête',
  cocktail: 'Cocktail & réception',
  entreprise: 'Séminaire & entreprise',
  brunch: 'Brunch',
  famille: 'Baptême & famille',
};

export const ALL_EVENT_TYPES = Object.keys(EVENT_LABELS) as EventType[];
