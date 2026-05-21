export type ConsumerQuoteStatus = 'pending' | 'answered' | 'archived';

/** Quote request submitted by a consumer to a caterer. */
export interface ConsumerQuoteRequest {
  id: string;
  catererId: string;
  catererName: string;
  catererSlug: string;
  catererImageUrl: string;
  status: ConsumerQuoteStatus;
  eventType: string;
  eventDateLabel: string;
  guestCount: number;
  budgetHint?: string;
  message: string;
  requestedAt: string;
  requestedAtMs: number;
  proResponse?: string;
  respondedAt?: string;
}
