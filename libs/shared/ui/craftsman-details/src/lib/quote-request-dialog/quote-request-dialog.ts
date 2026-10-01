import { Component, effect, inject, input, model, output, signal } from '@angular/core';
import { FormsModule } from '@angular/forms';
import {
  ConsumerQuoteRequest,
  ConsumerQuotesService,
} from '@trouvermontraiteur/app-consumer-data';
import { parseIsoDateLocal } from '@trouvermontraiteur/data';
import { Craftsman, TRADE_LABELS } from '@trouvermontraiteur/models';
import { Dialog } from 'primeng/dialog';

const EVENT_TYPES = [
  'Mariage',
  'Anniversaire',
  'Séminaire',
  "Soirée d'entreprise",
  'Concert / spectacle',
  'Autre',
] as const;

const GUEST_RANGES = ['< 50', '50–100', '100–250', '250 +'] as const;

const GUEST_COUNTS: Record<(typeof GUEST_RANGES)[number], number> = {
  '< 50': 49,
  '50–100': 75,
  '100–250': 175,
  '250 +': 250,
};

const EVENT_SERVICES = [
  'Sonorisation',
  'Éclairage',
  'Scène & structure',
  'Vidéoprojection',
  'Régie technique',
] as const;

const BUDGETS = [
  '< 1 000 €',
  '1 000 – 3 000 €',
  '3 000 – 6 000 €',
  '6 000 € +',
  'Je ne sais pas',
] as const;

const MESSAGE_HINTS = [
  'Horaires',
  'Intérieur / extérieur',
  'Accès au lieu',
  'Électricité dispo',
] as const;

const MESSAGE_MAX = 1000;

@Component({
  selector: 'tmt-quote-request-dialog',
  imports: [FormsModule, Dialog],
  templateUrl: './quote-request-dialog.html',
  styleUrl: './quote-request-dialog.scss',
})
export class QuoteRequestDialog {
  private readonly quotesService = inject(ConsumerQuotesService);

  readonly visible = model.required<boolean>();
  readonly craftsman = input.required<Craftsman>();

  readonly submitted = output<ConsumerQuoteRequest>();

  protected readonly success = signal(false);
  protected readonly eventTypes = EVENT_TYPES;
  protected readonly guestRanges = GUEST_RANGES;
  protected readonly eventServices = EVENT_SERVICES;
  protected readonly budgets = BUDGETS;
  protected readonly messageHints = MESSAGE_HINTS;
  protected readonly messageMax = MESSAGE_MAX;

  protected eventType: (typeof EVENT_TYPES)[number] | '' = 'Mariage';
  protected projectDate = '';
  protected place = '';
  protected flexible = false;
  protected guestRange: (typeof GUEST_RANGES)[number] | '' = '';
  protected services: string[] = ['Sonorisation'];
  protected budget: (typeof BUDGETS)[number] | '' = '';
  protected message = '';

  constructor() {
    effect(() => {
      if (this.visible()) {
        this.resetForm();
      }
    });
  }

  protected get dialogClass(): string {
    return this.success()
      ? 'quote-request-dialog quote-request-dialog--sent'
      : 'quote-request-dialog';
  }

  protected get initials(): string {
    const parts = this.craftsman()
      .name.split(/[\s:·|/–—-]+/u)
      .filter((part) => part.length > 0);
    const acronym = parts.find(
      (part) =>
        part.length >= 2 &&
        part.length <= 4 &&
        part === part.toLocaleUpperCase('fr-FR') &&
        /\p{L}/u.test(part),
    );
    if (acronym) {
      return acronym;
    }
    const letters = parts.map((part) => part.charAt(0)).join('');
    return (letters.slice(0, 3) || '·').toLocaleUpperCase('fr-FR');
  }

  protected get showRating(): boolean {
    return this.craftsman().rating > 0;
  }

  protected get ratingLabel(): string {
    const rating = this.craftsman().rating;
    return rating.toLocaleString('fr-FR', {
      minimumFractionDigits: Number.isInteger(rating) ? 0 : 1,
      maximumFractionDigits: 1,
    });
  }

  protected get reviewsLabel(): string {
    return `${this.craftsman().reviewCount} avis`;
  }

  protected get metaLine(): string {
    const craftsman = this.craftsman();
    const parts: string[] = [];
    if (craftsman.rating > 0) {
      parts.push(this.ratingLabel, this.reviewsLabel);
    }
    const trade = craftsman.trades[0];
    if (trade) {
      parts.push(TRADE_LABELS[trade]);
    }
    if (craftsman.location.city) {
      parts.push(craftsman.location.city);
    }
    return parts.join(' · ');
  }

  protected get canSend(): boolean {
    return (
      !!this.eventType && !!this.projectDate && this.message.trim().length > 0
    );
  }

  protected get progressDone(): number {
    const checks = [
      !!this.eventType,
      !!this.projectDate,
      !!this.place.trim(),
      !!this.guestRange,
      this.message.trim().length >= 20,
    ];
    return checks.filter(Boolean).length;
  }

  protected get progressLabel(): string {
    if (!this.canSend) {
      return 'Type, date et message requis';
    }
    if (this.progressDone === 5) {
      return 'Demande complète, prête à envoyer';
    }
    return `${this.progressDone}/5 infos clés · plus c’est précis, plus le devis l’est`;
  }

  protected get progressPercent(): string {
    return `${Math.round((this.progressDone / 5) * 100)}%`;
  }

  protected get summaryType(): string {
    return (this.eventType || 'événement').toLowerCase();
  }

  protected get summaryRows(): { key: string; value: string }[] {
    const date = this.projectDate
      ? `${this.projectDate.split('-').reverse().join('/')}${this.flexible ? ' (flexible)' : ''}`
      : '—';
    const services = this.orderedServices();
    return [
      { key: 'Événement', value: this.eventType || '—' },
      { key: 'Date', value: date },
      { key: 'Lieu', value: this.place.trim() || '—' },
      { key: 'Invités', value: this.guestRange || '—' },
      {
        key: 'Prestations',
        value: services.length ? services.join(', ') : '—',
      },
      { key: 'Budget', value: this.budget || '—' },
    ];
  }

  protected pickEventType(value: (typeof EVENT_TYPES)[number]): void {
    this.eventType = this.eventType === value ? '' : value;
  }

  protected pickGuestRange(value: (typeof GUEST_RANGES)[number]): void {
    this.guestRange = this.guestRange === value ? '' : value;
  }

  protected pickBudget(value: (typeof BUDGETS)[number]): void {
    this.budget = this.budget === value ? '' : value;
  }

  protected serviceOn(label: string): boolean {
    return this.services.includes(label);
  }

  protected toggleService(label: string): void {
    this.services = this.serviceOn(label)
      ? this.services.filter((item) => item !== label)
      : [...this.services, label];
  }

  protected addHint(label: string): void {
    const current = this.message;
    const separator = current && !current.endsWith('\n') ? '\n' : '';
    this.message = `${current}${separator}${label} : `.slice(0, MESSAGE_MAX);
  }

  protected onMessageInput(value: string): void {
    this.message = value.slice(0, MESSAGE_MAX);
  }

  protected submit(): void {
    if (!this.canSend || !this.eventType) {
      return;
    }

    const craftsman = this.craftsman();
    const services = this.orderedServices();
    const quote: ConsumerQuoteRequest = {
      id: `cq-${Date.now()}-${Math.random().toString(36).slice(2, 8)}`,
      craftsmanId: craftsman.id,
      craftsmanName: craftsman.name,
      craftsmanSlug: craftsman.slug,
      craftsmanImageUrl: craftsman.imageUrl,
      status: 'pending',
      projectTypeLabel: this.eventType,
      eventDateLabel: this.formatProjectDateLabel(this.projectDate),
      guestCount: this.guestRange ? GUEST_COUNTS[this.guestRange] : 0,
      guestRange: this.guestRange || undefined,
      place: this.place.trim() || undefined,
      datesFlexible: this.flexible || undefined,
      services: services.length ? services : undefined,
      budgetHint: this.budget || undefined,
      message: this.message.trim(),
      requestedAt: "À l'instant",
      requestedAtMs: Date.now(),
    };

    this.quotesService.addQuote(quote);
    this.success.set(true);
    this.submitted.emit(quote);
  }

  protected close(): void {
    this.visible.set(false);
  }

  private orderedServices(): string[] {
    return EVENT_SERVICES.filter((label) => this.services.includes(label));
  }

  private resetForm(): void {
    this.success.set(false);
    this.eventType = 'Mariage';
    this.projectDate = '';
    this.place = '';
    this.flexible = false;
    this.guestRange = '';
    this.services = ['Sonorisation'];
    this.budget = '';
    this.message = '';
  }

  private formatProjectDateLabel(iso: string): string {
    const date = parseIsoDateLocal(iso);
    const label = date.toLocaleDateString('fr-FR', {
      day: 'numeric',
      month: 'long',
      year: 'numeric',
    });
    return this.flexible ? `${label} (dates flexibles)` : label;
  }
}
