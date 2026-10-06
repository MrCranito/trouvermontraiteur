import { Injectable, computed, effect, inject, signal } from '@angular/core';
import { SUPABASE_CLIENT } from '@trouvermontraiteur/api';
import { ConsumerAuthService } from '@trouvermontraiteur/app-auth';
import { ConsumerQuoteRequest } from './consumer-quote-request';
import { seedQuotesForEmail } from './mock-consumer-quotes';

@Injectable({ providedIn: 'root' })
export class ConsumerQuotesService {
  private readonly auth = inject(ConsumerAuthService);
  private readonly supabase = inject(SUPABASE_CLIENT);

  private readonly userQuotes = signal<ConsumerQuoteRequest[]>([]);

  readonly quotes = computed(() => {
    const email = this.auth.user()?.email;
    if (!email) {
      return [];
    }
    const stored = this.userQuotes();
    const seeds = seedQuotesForEmail(email);
    const seen = new Set(stored.map((q) => q.id));
    return [...stored, ...seeds.filter((s) => !seen.has(s.id))].sort(
      (a, b) => b.requestedAtMs - a.requestedAtMs,
    );
  });

  constructor() {
    effect(() => {
      const email = this.auth.user()?.email;
      this.reload(email);
    });
  }

  async addQuote(quote: ConsumerQuoteRequest): Promise<ConsumerQuoteRequest> {
    const email = this.auth.user()?.email;
    if (!email) {
      throw new Error('Connectez-vous pour envoyer une demande.');
    }

    const saved = await this.insertRemote(quote);
    const next = [saved, ...this.userQuotes()];
    this.userQuotes.set(next);
    this.persist(email, next);
    return saved;
  }

  private async insertRemote(
    quote: ConsumerQuoteRequest,
  ): Promise<ConsumerQuoteRequest> {
    const user = this.auth.user();
    const email = user?.email;
    if (!user || !email) {
      throw new Error('Connectez-vous pour envoyer une demande.');
    }

    const meta = user.user_metadata as Record<string, unknown> | undefined;
    const fullName =
      typeof meta?.['full_name'] === 'string' ? meta['full_name'].trim() : '';

    const { data, error } = await this.supabase
      .from('quote_requests')
      .insert({
        craftsman_id: quote.craftsmanId,
        consumer_user_id: user.id,
        client_name: fullName || email,
        client_email: email,
        event_type: quote.projectTypeLabel,
        event_date: quote.eventDateIso || null,
        event_date_label: quote.eventDateLabel,
        guest_count: quote.guestCount > 0 ? quote.guestCount : null,
        budget_hint: quote.budgetHint ?? null,
        message: quote.message,
      })
      .select('id, created_at')
      .single();

    if (error) {
      throw new Error('Impossible d’enregistrer la demande de devis.');
    }

    const row = data as { id: string; created_at: string };
    return {
      ...quote,
      id: row.id,
      requestedAtMs: Date.parse(row.created_at),
    };
  }

  private reload(email: string | undefined): void {
    if (!email) {
      this.userQuotes.set([]);
      return;
    }
    const raw = localStorage.getItem(this.storageKey(email));
    if (!raw) {
      this.userQuotes.set([]);
      return;
    }
    try {
      const parsed = JSON.parse(raw) as ConsumerQuoteRequest[];
      this.userQuotes.set(Array.isArray(parsed) ? parsed : []);
    } catch {
      this.userQuotes.set([]);
    }
  }

  private persist(email: string, quotes: ConsumerQuoteRequest[]): void {
    localStorage.setItem(this.storageKey(email), JSON.stringify(quotes));
  }

  private storageKey(email: string): string {
    return `tmt:consumer-quotes:v2:${email.trim().toLowerCase()}`;
  }
}
