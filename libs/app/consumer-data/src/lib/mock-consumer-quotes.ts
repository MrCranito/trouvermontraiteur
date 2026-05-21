import { ConsumerQuoteRequest } from './consumer-quote-request';

const now = Date.now();
const H = 60 * 60 * 1000;
const D = 24 * H;

/** Demo quotes keyed by consumer e-mail (lowercase). */
export function seedQuotesForEmail(email: string): ConsumerQuoteRequest[] {
  const key = email.trim().toLowerCase();
  const common: ConsumerQuoteRequest[] = [
    {
      id: 'cq-demo-1',
      catererId: '1',
      catererName: 'Maison du Terroir',
      catererSlug: 'maison-du-terroir',
      catererImageUrl: 'https://picsum.photos/seed/terroir/800/600',
      status: 'pending',
      eventType: 'Mariage',
      eventDateLabel: '14 juin 2026',
      guestCount: 120,
      budgetHint: '80–100 € / personne',
      message:
        'Bonjour, nous cherchons un traiteur pour notre mariage en plein air. Menu cocktail puis dîner assis, options végétariennes souhaitées.',
      requestedAt: 'Il y a 2 jours',
      requestedAtMs: now - 2 * D,
    },
    {
      id: 'cq-demo-2',
      catererId: '3',
      catererName: 'Saveurs Méditerranée',
      catererSlug: 'saveurs-mediterranee',
      catererImageUrl: 'https://picsum.photos/seed/mediterranee/800/600',
      status: 'answered',
      eventType: 'Anniversaire',
      eventDateLabel: '7 juillet 2026',
      guestCount: 35,
      message:
        'Anniversaire en appartement — finger food et desserts, pas de cuisine sur place.',
      requestedAt: 'Il y a 1 semaine',
      requestedAtMs: now - 7 * D,
      proResponse:
        'Bonjour, merci pour votre message. Nous proposons un menu finger food à 42 € / pers. pour 35 convives. Souhaitez-vous une dégustation ?',
      respondedAt: 'Il y a 5 jours',
    },
  ];

  if (key.includes('demo') || key.includes('test') || key.endsWith('@email.fr')) {
    return common;
  }

  return common.slice(0, 1);
}
