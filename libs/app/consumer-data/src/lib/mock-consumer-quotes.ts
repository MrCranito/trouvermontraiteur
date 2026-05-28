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
      craftsmanId: '1',
      craftsmanName: 'Dupont Maçonnerie — Paris',
      craftsmanSlug: 'dupont-maconnerie-paris',
      craftsmanImageUrl:
        'https://images.unsplash.com/photo-1541888946425-d81bb19240f5?auto=format&fit=crop&w=800&h=600&q=80',
      status: 'pending',
      projectTypeLabel: 'Rénovation',
      eventDateLabel: '14 juin 2026',
      guestCount: 1,
      budgetHint: '5 000 – 8 000 €',
      message:
        'Bonjour, nous souhaitons rénover notre salle de bain (8 m²). Devis détaillé avec options carrelage et plomberie.',
      requestedAt: 'Il y a 2 jours',
      requestedAtMs: now - 2 * D,
    },
    {
      id: 'cq-demo-2',
      craftsmanId: '2',
      craftsmanName: 'Volt Pro Électricité — Lyon',
      craftsmanSlug: 'volt-pro-electricite-lyon',
      craftsmanImageUrl:
        'https://images.unsplash.com/photo-1541888946425-d81bb19240f5?auto=format&fit=crop&w=800&h=600&q=80',
      status: 'answered',
      projectTypeLabel: 'Construction',
      eventDateLabel: '7 juillet 2026',
      guestCount: 1,
      message:
        'Extension de 15 m² sur jardin — gros œuvre et menuiserie, accès chantier par allée étroite.',
      requestedAt: 'Il y a 1 semaine',
      requestedAtMs: now - 7 * D,
      proResponse:
        'Bonjour, merci pour votre message. Nous pouvons réaliser une visite technique la semaine prochaine et vous transmettre un devis sous 5 jours ouvrés.',
      respondedAt: 'Il y a 5 jours',
    },
  ];

  if (key.includes('demo') || key.includes('test') || key.endsWith('@email.fr')) {
    return common;
  }

  return common.slice(0, 1);
}
