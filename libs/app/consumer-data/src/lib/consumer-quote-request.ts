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
  budgetHint?: string;
  message: string;
  requestedAt: string;
  requestedAtMs: number;
  proResponse?: string;
  respondedAt?: string;
}
