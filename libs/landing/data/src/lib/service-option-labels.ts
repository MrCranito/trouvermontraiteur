import { ServiceOption } from '@trouvermontraiteur/models';

export const SERVICE_OPTION_LABELS: Record<ServiceOption, string> = {
  devis_gratuit: 'Devis gratuit',
  urgence: 'Intervention urgente',
  garantie_decennale: 'Garantie décennale',
  rge: 'Certifié RGE',
};

export const ALL_SERVICE_OPTIONS = Object.keys(
  SERVICE_OPTION_LABELS,
) as ServiceOption[];
