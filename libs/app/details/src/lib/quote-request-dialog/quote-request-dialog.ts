import { Component, effect, inject, input, model, output, signal } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { RouterLink } from '@angular/router';
import {
  ConsumerQuoteRequest,
  ConsumerQuotesService,
} from '@trouvermontraiteur/app-consumer-data';
import {
  ALL_EVENT_TYPES,
  EVENT_LABELS,
  parseIsoDateLocal,
  toIsoDateLocal,
} from '@trouvermontraiteur/data';
import { Caterer, EventType } from '@trouvermontraiteur/models';
import { Button } from 'primeng/button';
import { Dialog } from 'primeng/dialog';
import { InputNumber } from 'primeng/inputnumber';
import { InputText } from 'primeng/inputtext';
import { Message } from 'primeng/message';
import { Select } from 'primeng/select';
import { Textarea } from 'primeng/textarea';

@Component({
  selector: 'tmt-quote-request-dialog',
  imports: [
    FormsModule,
    RouterLink,
    Dialog,
    Button,
    InputText,
    InputNumber,
    Select,
    Textarea,
    Message,
  ],
  templateUrl: './quote-request-dialog.html',
  styleUrl: './quote-request-dialog.scss',
})
export class QuoteRequestDialog {
  private readonly quotesService = inject(ConsumerQuotesService);

  readonly visible = model.required<boolean>();
  readonly caterer = input.required<Caterer>();

  readonly submitted = output<ConsumerQuoteRequest>();

  protected readonly success = signal(false);
  protected readonly error = signal('');

  protected eventType: EventType | null = null;
  protected eventDate = '';
  protected guestCount: number | null = null;
  protected budgetHint = '';
  protected message = '';

  protected readonly minEventDate = toIsoDateLocal(new Date());

  protected readonly eventOptions = ALL_EVENT_TYPES.map((key) => ({
    key,
    label: EVENT_LABELS[key],
  }));

  constructor() {
    effect(() => {
      if (this.visible()) {
        this.resetForm();
      }
    });
  }

  protected submit(): void {
    this.error.set('');

    const c = this.caterer();
    const trimmedMessage = this.message.trim();

    if (!c || !this.eventType || !this.eventDate || !this.guestCount || !trimmedMessage) {
      this.error.set('Veuillez remplir tous les champs obligatoires.');
      return;
    }

    if (this.guestCount < 1) {
      this.error.set('Le nombre de convives doit être au moins 1.');
      return;
    }

    const quote: ConsumerQuoteRequest = {
      id: `cq-${Date.now()}-${Math.random().toString(36).slice(2, 8)}`,
      catererId: c.id,
      catererName: c.name,
      catererSlug: c.slug,
      catererImageUrl: c.imageUrl,
      status: 'pending',
      eventType: EVENT_LABELS[this.eventType],
      eventDateLabel: this.formatEventDateLabel(this.eventDate),
      guestCount: this.guestCount,
      budgetHint: this.budgetHint.trim() || undefined,
      message: trimmedMessage,
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

  private resetForm(): void {
    this.success.set(false);
    this.error.set('');
    this.eventType = null;
    this.eventDate = '';
    this.guestCount = null;
    this.budgetHint = '';
    this.message = '';
  }

  private formatEventDateLabel(iso: string): string {
    const date = parseIsoDateLocal(iso);
    return date.toLocaleDateString('fr-FR', {
      day: 'numeric',
      month: 'long',
      year: 'numeric',
    });
  }
}
