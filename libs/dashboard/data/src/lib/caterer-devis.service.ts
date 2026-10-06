import { computed, effect, inject, Injectable, signal } from '@angular/core';
import { SUPABASE_CLIENT } from '@trouvermontraiteur/api';
import { CatererAuthService } from '@trouvermontraiteur/dashboard-auth';
import { CatererProfileService } from './caterer-profile.service';
import {
  CatererQuoteRequest,
  QuoteRequestStatus,
} from './caterer-quote-request';

export interface DevisQueryOptions {
  status?: QuoteRequestStatus | null;
  eventType?: string | null;
}

interface QuoteRequestRow {
  id: string;
  status: QuoteRequestStatus;
  client_name: string;
  client_email: string;
  event_type: string;
  event_date: string | null;
  event_date_label: string | null;
  guest_count: number | null;
  budget_hint: string | null;
  message: string;
  pro_response: string | null;
  responded_at: string | null;
  created_at: string;
}

const QUOTE_SELECT =
  'id, status, client_name, client_email, event_type, event_date, event_date_label, guest_count, budget_hint, message, pro_response, responded_at, created_at';

@Injectable({ providedIn: 'root' })
export class CatererDevisService {
  private readonly supabase = inject(SUPABASE_CLIENT);
  private readonly auth = inject(CatererAuthService);
  private readonly profile = inject(CatererProfileService);

  private readonly requests = signal<CatererQuoteRequest[]>([]);
  private readonly loading = signal(false);
  private readonly error = signal<string | null>(null);
  private craftsmanId: string | null = null;

  readonly requestsSignal = this.requests.asReadonly();
  readonly isLoading = this.loading.asReadonly();
  readonly errorSignal = this.error.asReadonly();
  readonly newCount = computed(
    () => this.requests().filter((request) => request.status === 'new').length,
  );

  constructor() {
    effect(() => {
      if (!this.auth.isReady() || !this.profile.isReady()) {
        return;
      }
      const craftsmanId = this.profile.profileSignal()?.id ?? null;
      void this.load(craftsmanId);
    });
  }

  queryRequests(options: DevisQueryOptions = {}): CatererQuoteRequest[] {
    let items = [...this.requests()];

    if (options.status) {
      items = items.filter((request) => request.status === options.status);
    }
    if (options.eventType) {
      items = items.filter((request) => request.eventType === options.eventType);
    }

    return items.sort((a, b) => b.requestedAtMs - a.requestedAtMs);
  }

  getEventTypes(): string[] {
    return [...new Set(this.requests().map((request) => request.eventType))].sort(
      (a, b) => a.localeCompare(b, 'fr'),
    );
  }

  async load(craftsmanId = this.craftsmanId): Promise<void> {
    this.craftsmanId = craftsmanId;
    if (!craftsmanId) {
      this.requests.set([]);
      this.error.set(null);
      return;
    }

    this.loading.set(true);
    this.error.set(null);
    const { data, error } = await this.supabase
      .from('quote_requests')
      .select(QUOTE_SELECT)
      .eq('craftsman_id', craftsmanId)
      .order('created_at', { ascending: false });

    this.loading.set(false);
    if (error) {
      this.requests.set([]);
      this.error.set('Impossible de charger les demandes de devis.');
      return;
    }

    this.requests.set(
      ((data ?? []) as QuoteRequestRow[]).map((row) => this.mapRow(row)),
    );
  }

  async markAsViewed(id: string): Promise<void> {
    const item = this.requests().find((request) => request.id === id);
    if (item?.status !== 'new') {
      return;
    }

    this.updateStatus(id, 'viewed');
    const { error } = await this.supabase
      .from('quote_requests')
      .update({
        status: 'viewed',
        viewed_at: new Date().toISOString(),
      })
      .eq('id', id);

    if (error) {
      this.error.set('Impossible de marquer la demande comme lue.');
      await this.load();
    }
  }

  async submitResponse(id: string, responseText: string): Promise<void> {
    const text = responseText.trim();
    if (!text) {
      return;
    }

    const respondedAt = new Date().toISOString();
    this.requests.update((list) =>
      list.map((item) =>
        item.id === id
          ? {
              ...item,
              status: 'answered' as const,
              proResponse: text,
              respondedAt: this.formatDateTime(respondedAt),
            }
          : item,
      ),
    );

    const { error } = await this.supabase
      .from('quote_requests')
      .update({
        status: 'answered',
        pro_response: text,
        responded_at: respondedAt,
        viewed_at: respondedAt,
      })
      .eq('id', id);

    if (error) {
      this.error.set('Impossible d’enregistrer la réponse.');
      await this.load();
    }
  }

  private updateStatus(id: string, status: QuoteRequestStatus): void {
    this.requests.update((list) =>
      list.map((item) => (item.id === id ? { ...item, status } : item)),
    );
  }

  private mapRow(row: QuoteRequestRow): CatererQuoteRequest {
    const eventDateMs = row.event_date
      ? Date.parse(`${row.event_date}T00:00:00`)
      : null;

    return {
      id: row.id,
      status: row.status,
      clientName: row.client_name,
      clientEmail: row.client_email,
      eventType: row.event_type,
      eventDateLabel:
        row.event_date_label?.trim() ||
        (eventDateMs != null && !Number.isNaN(eventDateMs)
          ? this.formatDate(eventDateMs)
          : '—'),
      eventDateMs:
        eventDateMs != null && !Number.isNaN(eventDateMs) ? eventDateMs : null,
      guestCount: row.guest_count,
      budgetHint: row.budget_hint?.trim() || undefined,
      message: row.message,
      requestedAt: this.formatRelative(row.created_at),
      requestedAtMs: Date.parse(row.created_at),
      proResponse: row.pro_response?.trim() || undefined,
      respondedAt: row.responded_at
        ? this.formatDateTime(row.responded_at)
        : undefined,
    };
  }

  private formatDate(timestamp: number): string {
    return new Intl.DateTimeFormat('fr-FR', {
      day: 'numeric',
      month: 'long',
      year: 'numeric',
    }).format(new Date(timestamp));
  }

  private formatDateTime(iso: string): string {
    return new Intl.DateTimeFormat('fr-FR', {
      day: 'numeric',
      month: 'short',
      year: 'numeric',
      hour: '2-digit',
      minute: '2-digit',
    }).format(new Date(iso));
  }

  private formatRelative(iso: string): string {
    const timestamp = Date.parse(iso);
    if (Number.isNaN(timestamp)) {
      return '—';
    }
    const minutes = Math.round((Date.now() - timestamp) / 60000);
    if (minutes < 1) {
      return "À l'instant";
    }
    if (minutes < 60) {
      return `Il y a ${minutes} min`;
    }
    const hours = Math.round(minutes / 60);
    if (hours < 24) {
      return `Il y a ${hours} h`;
    }
    const days = Math.round(hours / 24);
    if (days === 1) {
      return 'Hier';
    }
    if (days < 14) {
      return `Il y a ${days} jours`;
    }
    return this.formatDate(timestamp);
  }
}
