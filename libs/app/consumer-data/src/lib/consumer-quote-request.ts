export type ConsumerQuoteStatus = 'pending' | 'answered' | 'archived';

/** Quote request submitted by a consumer to a craftsman. */
export interface ConsumerQuoteRequest {
  id: string;
  craftsmanId: string;
  craftsmanName: string;
  craftsmanSlug: string;
  craftsmanImageUrl: string;
  status: ConsumerQuoteStatus;
  projectTypeLabel: string;
  eventDateLabel: string;
  guestCount: number;
  /** Guest range chosen in the quote dialog, e.g. "50–100". */
  guestRange?: string;
  place?: string;
  datesFlexible?: boolean;
  services?: string[];
  budgetHint?: string;
  message: string;
  requestedAt: string;
  requestedAtMs: number;
  proResponse?: string;
  respondedAt?: string;
}
