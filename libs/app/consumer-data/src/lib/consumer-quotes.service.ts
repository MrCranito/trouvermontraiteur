import { Injectable, computed, effect, inject, signal } from '@angular/core';
import { ConsumerAuthService } from '@trouvermontraiteur/app-auth';
import { ConsumerQuoteRequest } from './consumer-quote-request';
import { seedQuotesForEmail } from './mock-consumer-quotes';

@Injectable({ providedIn: 'root' })
export class ConsumerQuotesService {
  private readonly auth = inject(ConsumerAuthService);

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

  addQuote(quote: ConsumerQuoteRequest): void {
    const email = this.auth.user()?.email;
    if (!email) {
      return;
    }
    const next = [quote, ...this.userQuotes()];
    this.userQuotes.set(next);
    this.persist(email, next);
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
