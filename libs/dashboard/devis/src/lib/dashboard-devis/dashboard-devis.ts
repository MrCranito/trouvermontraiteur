import { Component, computed, inject, signal } from '@angular/core';
import { FormsModule } from '@angular/forms';
import {
  CatererDevisService,
  CatererQuoteRequest,
  QuoteRequestStatus,
} from '@trouvermontraiteur/dashboard-data';
import { Button } from 'primeng/button';
import { Dialog } from 'primeng/dialog';
import { Message } from 'primeng/message';
import { TableModule } from 'primeng/table';
import { Tag } from 'primeng/tag';
import { Textarea } from 'primeng/textarea';

@Component({
  selector: 'tmt-dashboard-devis',
  imports: [
    FormsModule,
    TableModule,
    Button,
    Tag,
    Dialog,
    Textarea,
    Message,
  ],
  templateUrl: './dashboard-devis.html',
  styleUrl: './dashboard-devis.scss',
})
export class DashboardDevis {
  private readonly devisService = inject(CatererDevisService);

  protected readonly detailVisible = signal(false);
  protected readonly respondVisible = signal(false);
  protected readonly detailRequest = signal<CatererQuoteRequest | null>(null);
  protected readonly respondRequest = signal<CatererQuoteRequest | null>(null);
  protected readonly responseText = signal('');
  protected readonly respondSuccess = signal(false);

  protected readonly requests = this.devisService.requestsSignal;
  protected readonly newCount = this.devisService.newCount;

  protected readonly tableRows = computed((): CatererQuoteRequest[] =>
    [...this.requests()].sort((a, b) => b.requestedAtMs - a.requestedAtMs),
  );

  protected readonly statsSummary = computed(() => {
    const all = this.requests();
    return {
      total: all.length,
      new: all.filter((r) => r.status === 'new').length,
      pending: all.filter((r) => r.status === 'new' || r.status === 'viewed')
        .length,
      answered: all.filter((r) => r.status === 'answered').length,
    };
  });

  protected openDetail(request: CatererQuoteRequest): void {
    this.devisService.markAsViewed(request.id);
    const current = this.requests().find((r) => r.id === request.id) ?? request;
    this.detailRequest.set(current);
    this.detailVisible.set(true);
  }

  protected openRespond(request: CatererQuoteRequest): void {
    this.devisService.markAsViewed(request.id);
    const current = this.requests().find((r) => r.id === request.id) ?? request;
    this.respondRequest.set(current);
    this.responseText.set(current.proResponse ?? '');
    this.respondSuccess.set(false);
    this.respondVisible.set(true);
  }

  protected openRespondFromDetail(): void {
    const request = this.detailRequest();
    if (!request) {
      return;
    }
    this.detailVisible.set(false);
    this.openRespond(request);
  }

  protected closeRespond(): void {
    this.respondVisible.set(false);
    this.respondSuccess.set(false);
  }

  protected sendResponse(): void {
    const request = this.respondRequest();
    const text = this.responseText().trim();
    if (!request || !text) {
      return;
    }
    this.devisService.submitResponse(request.id, text);
    this.syncRequestSignals(request.id);
    this.respondSuccess.set(true);
    this.responseText.set(text);
  }

  protected statusLabel(status: QuoteRequestStatus): string {
    const labels: Record<QuoteRequestStatus, string> = {
      new: 'Nouveau',
      viewed: 'Lu',
      answered: 'Répondu',
      archived: 'Archivé',
    };
    return labels[status];
  }

  protected statusSeverity(
    status: QuoteRequestStatus,
  ): 'success' | 'info' | 'warn' | 'secondary' | 'danger' {
    switch (status) {
      case 'new':
        return 'warn';
      case 'viewed':
        return 'info';
      case 'answered':
        return 'success';
      default:
        return 'secondary';
    }
  }

  protected markAsAnswered(id: string): void {
    this.devisService.markAsAnswered(id);
    this.syncRequestSignals(id);
  }

  protected clientInitials(name: string): string {
    return name
      .split(/\s+/)
      .filter(Boolean)
      .slice(0, 2)
      .map((part) => part[0]?.toUpperCase() ?? '')
      .join('');
  }

  protected canRespond(request: CatererQuoteRequest): boolean {
    return request.status !== 'archived';
  }

  private syncRequestSignals(id: string): void {
    const current = this.requests().find((r) => r.id === id);
    if (!current) {
      return;
    }
    if (this.detailRequest()?.id === id) {
      this.detailRequest.set(current);
    }
    if (this.respondRequest()?.id === id) {
      this.respondRequest.set(current);
    }
  }
}
