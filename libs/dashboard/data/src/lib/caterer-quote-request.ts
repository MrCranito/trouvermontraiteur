export type QuoteRequestStatus = 'new' | 'viewed' | 'answered' | 'archived';

export interface CatererQuoteRequest {
  id: string;
  status: QuoteRequestStatus;
  clientName: string;
  clientEmail: string;
  eventType: string;
  eventDateLabel: string;
  guestCount: number | null;
  /** Timestamp de `event_date` pour un tri chronologique. */
  eventDateMs: number | null;
  guestRange?: string;
  place?: string;
  datesFlexible?: boolean;
  services?: string[];
  budgetHint?: string;
  message: string;
  /** Libellé affiché (ex. « Il y a 2 h »). */
  requestedAt: string;
  /** Horodatage pour le tri par date de réception. */
  requestedAtMs: number;
  /** Réponse rédigée par l'artisan. */
  proResponse?: string;
  respondedAt?: string;
}

const STATUS_ORDER: Record<QuoteRequestStatus, number> = {
  new: 0,
  viewed: 1,
  answered: 2,
  archived: 3,
};

/** Tri selon le type de colonne : texte, date, entier, enum. Les vides restent en bas. */
export function compareQuoteColumn(
  left: CatererQuoteRequest,
  right: CatererQuoteRequest,
  field: string,
  order: number,
): number {
  switch (field) {
    case 'clientName':
      return compareText(left.clientName, right.clientName, order);
    case 'eventType':
      return compareText(left.eventType, right.eventType, order);
    case 'budgetHint':
      return compareText(left.budgetHint, right.budgetHint, order);
    case 'eventDateMs':
      return compareNumber(left.eventDateMs, right.eventDateMs, order);
    case 'guestCount':
      return compareNumber(left.guestCount, right.guestCount, order);
    case 'requestedAtMs':
      return compareNumber(left.requestedAtMs, right.requestedAtMs, order);
    case 'status':
      return compareNumber(
        STATUS_ORDER[left.status],
        STATUS_ORDER[right.status],
        order,
      );
    default:
      return 0;
  }
}

function compareText(
  left: string | null | undefined,
  right: string | null | undefined,
  order: number,
): number {
  const a = left?.trim() ?? '';
  const b = right?.trim() ?? '';
  if (!a && !b) {
    return 0;
  }
  if (!a) {
    return 1;
  }
  if (!b) {
    return -1;
  }
  return a.localeCompare(b, 'fr', { sensitivity: 'base', numeric: true }) * order;
}

function compareNumber(
  left: number | null | undefined,
  right: number | null | undefined,
  order: number,
): number {
  if (left == null && right == null) {
    return 0;
  }
  if (left == null) {
    return 1;
  }
  if (right == null) {
    return -1;
  }
  return (left - right) * order;
}
