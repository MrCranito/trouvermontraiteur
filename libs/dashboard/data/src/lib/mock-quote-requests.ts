import { CatererQuoteRequest } from './caterer-quote-request';

const now = Date.now();
const H = 60 * 60 * 1000;
const D = 24 * H;

export const MOCK_QUOTE_REQUESTS: CatererQuoteRequest[] = [
  {
    id: 'q1',
    status: 'new',
    clientName: 'Sophie Martin',
    clientEmail: 'sophie.martin@email.fr',
    eventType: 'Mariage',
    eventDateLabel: '14 juin 2026',
    guestCount: 120,
    budgetHint: '80–100 € / personne',
    message:
      'Bonjour, nous cherchons un traiteur pour notre mariage en plein air à Versailles. Menu cocktail suivi d’un dîner assis, options végétariennes souhaitées.',
    requestedAt: 'Il y a 2 h',
    requestedAtMs: now - 2 * H,
  },
  {
    id: 'q2',
    status: 'new',
    clientName: 'Thomas Leroy',
    clientEmail: 't.leroy@entreprise.com',
    eventType: 'Séminaire entreprise',
    eventDateLabel: '22 mai 2026',
    guestCount: 45,
    budgetHint: 'Sur devis',
    message:
      'Déjeuner buffet pour un séminaire d’équipe (45 pers.) — besoin d’un service rapide entre 12h et 14h, parking livraison disponible.',
    requestedAt: 'Il y a 5 h',
    requestedAtMs: now - 5 * H,
  },
  {
    id: 'q3',
    status: 'viewed',
    clientName: 'Camille Dupont',
    clientEmail: 'camille.dupont@gmail.com',
    eventType: 'Anniversaire',
    eventDateLabel: '7 juillet 2026',
    guestCount: 35,
    message:
      'Anniversaire 40 ans en appartement — format finger food et pièce montée, pas de cuisine sur place.',
    requestedAt: 'Hier',
    requestedAtMs: now - D,
  },
  {
    id: 'q4',
    status: 'answered',
    clientName: 'Marc & Julie Bernard',
    clientEmail: 'marc.bernard@email.fr',
    eventType: 'Cocktail de lancement',
    eventDateLabel: '30 mai 2026',
    guestCount: 80,
    budgetHint: '60 € / personne',
    message:
      'Cocktail dinatoire pour l’ouverture d’un showroom — 2h30, boissons non alcoolisées à prévoir pour 15 % des invités.',
    requestedAt: 'Il y a 3 jours',
    requestedAtMs: now - 3 * D,
  },
  {
    id: 'q5',
    status: 'archived',
    clientName: 'Association Les Amis du Quartier',
    clientEmail: 'contact@amis-quartier.org',
    eventType: 'Événement associatif',
    eventDateLabel: '12 avril 2026',
    guestCount: 200,
    message:
      'Repas communautaire — menu simple et accessible, devis déjà accepté et événement passé.',
    requestedAt: 'Il y a 3 semaines',
    requestedAtMs: now - 21 * D,
  },
];
