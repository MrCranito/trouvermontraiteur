import { computed, Injectable, signal } from '@angular/core';
import {
  CatererQuoteRequest,
  QuoteRequestStatus,
} from './caterer-quote-request';
import { MOCK_QUOTE_REQUESTS } from './mock-quote-requests';

export interface DevisQueryOptions {
  status?: QuoteRequestStatus | null;
  eventType?: string | null;
}

@Injectable({ providedIn: 'root' })
export class CatererDevisService {
  private readonly requests = signal<CatererQuoteRequest[]>(
    structuredClone(MOCK_QUOTE_REQUESTS),
  );

  readonly requestsSignal = this.requests.asReadonly();

  readonly newCount = computed(
    () => this.requests().filter((r) => r.status === 'new').length,
  );

  queryRequests(options: DevisQueryOptions = {}): CatererQuoteRequest[] {
    let items = [...this.requests()];

    if (options.status) {
      items = items.filter((r) => r.status === options.status);
    }
    if (options.eventType) {
      items = items.filter((r) => r.eventType === options.eventType);
    }

    return items.sort((a, b) => b.requestedAtMs - a.requestedAtMs);
  }

  getEventTypes(): string[] {
    return [...new Set(this.requests().map((r) => r.eventType))].sort((a, b) =>
      a.localeCompare(b, 'fr'),
    );
  }

  updateStatus(id: string, status: QuoteRequestStatus): void {
    this.requests.update((list) =>
      list.map((item) => (item.id === id ? { ...item, status } : item)),
    );
  }

  markAsViewed(id: string): void {
    const item = this.requests().find((r) => r.id === id);
    if (item?.status === 'new') {
      this.updateStatus(id, 'viewed');
    }
  }

  markAsAnswered(id: string): void {
    this.updateStatus(id, 'answered');
  }

  submitResponse(id: string, responseText: string): void {
    const text = responseText.trim();
    if (!text) {
      return;
    }
    const respondedAt = new Intl.DateTimeFormat('fr-FR', {
      day: 'numeric',
      month: 'short',
      year: 'numeric',
      hour: '2-digit',
      minute: '2-digit',
    }).format(new Date());

    this.requests.update((list) =>
      list.map((item) =>
        item.id === id
          ? {
              ...item,
              status: 'answered' as const,
              proResponse: text,
              respondedAt,
            }
          : item,
      ),
    );
  }
}
