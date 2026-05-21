export type QuoteRequestStatus = 'new' | 'viewed' | 'answered' | 'archived';

export interface CatererQuoteRequest {
  id: string;
  status: QuoteRequestStatus;
  clientName: string;
  clientEmail: string;
  eventType: string;
  eventDateLabel: string;
  guestCount: number;
  budgetHint?: string;
  message: string;
  /** Libellé affiché (ex. « Il y a 2 h »). */
  requestedAt: string;
  /** Horodatage pour le tri par date de réception. */
  requestedAtMs: number;
  /** Réponse rédigée par le traiteur (démo locale). */
  proResponse?: string;
  respondedAt?: string;
}
