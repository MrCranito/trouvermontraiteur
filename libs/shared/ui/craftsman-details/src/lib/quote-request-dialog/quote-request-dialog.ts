import { Component, effect, inject, input, model, output, signal } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { RouterLink } from '@angular/router';
import {
  ConsumerQuoteRequest,
  ConsumerQuotesService,
} from '@trouvermontraiteur/app-consumer-data';
import {
  ALL_PROJECT_TYPES,
  PROJECT_LABELS,
  parseIsoDateLocal,
  toIsoDateLocal,
} from '@trouvermontraiteur/data';
import { Craftsman, ProjectType } from '@trouvermontraiteur/models';
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
  readonly craftsman = input.required<Craftsman>();

  readonly submitted = output<ConsumerQuoteRequest>();

  protected readonly success = signal(false);
  protected readonly error = signal('');

  protected projectType: ProjectType | null = null;
  protected projectDate = '';
  protected guestCount: number | null = null;
  protected budgetHint = '';
  protected message = '';

  protected readonly minProjectDate = toIsoDateLocal(new Date());

  protected readonly projectOptions = ALL_PROJECT_TYPES.map((key) => ({
    key,
    label: PROJECT_LABELS[key],
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

    const c = this.craftsman();
    const trimmedMessage = this.message.trim();

    if (
      !c ||
      !this.projectType ||
      !this.projectDate ||
      !this.guestCount ||
      !trimmedMessage
    ) {
      this.error.set('Veuillez remplir tous les champs obligatoires.');
      return;
    }

    if (this.guestCount < 1) {
      this.error.set('Le nombre de personnes doit être au moins 1.');
      return;
    }

    const quote: ConsumerQuoteRequest = {
      id: `cq-${Date.now()}-${Math.random().toString(36).slice(2, 8)}`,
      craftsmanId: c.id,
      craftsmanName: c.name,
      craftsmanSlug: c.slug,
      craftsmanImageUrl: c.imageUrl,
      status: 'pending',
      projectTypeLabel: PROJECT_LABELS[this.projectType],
      eventDateLabel: this.formatProjectDateLabel(this.projectDate),
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
    this.projectType = null;
    this.projectDate = '';
    this.guestCount = null;
    this.budgetHint = '';
    this.message = '';
  }

  private formatProjectDateLabel(iso: string): string {
    const date = parseIsoDateLocal(iso);
    return date.toLocaleDateString('fr-FR', {
      day: 'numeric',
      month: 'long',
      year: 'numeric',
    });
  }
}
