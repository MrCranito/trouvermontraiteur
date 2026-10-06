import {
  Component,
  computed,
  ElementRef,
  inject,
  signal,
  viewChild,
} from '@angular/core';
import { FormsModule } from '@angular/forms';
import { QuoteThreadService } from '@trouvermontraiteur/api';
import {
  CatererDevisService,
  CatererQuoteRequest,
  compareQuoteColumn,
  QuoteRequestStatus,
} from '@trouvermontraiteur/dashboard-data';
import {
  fileToQuoteAttachment,
  isQuoteThreadImage,
  QuoteThreadAttachment,
  QuoteThreadMessage,
} from '@trouvermontraiteur/models';
import { Button } from 'primeng/button';
import { Dialog } from 'primeng/dialog';
import { TableModule } from 'primeng/table';
import { Tag } from 'primeng/tag';

@Component({
  selector: 'tmt-dashboard-devis',
  imports: [
    FormsModule,
    TableModule,
    Button,
    Tag,
    Dialog,
  ],
  templateUrl: './dashboard-devis.html',
  styleUrl: './dashboard-devis.scss',
})
export class DashboardDevis {
  private readonly devisService = inject(CatererDevisService);
  private readonly threads = inject(QuoteThreadService);
  private readonly threadScroller =
    viewChild<ElementRef<HTMLElement>>('threadScroller');

  protected readonly detailVisible = signal(false);
  protected readonly conversationVisible = signal(false);
  protected readonly detailRequest = signal<CatererQuoteRequest | null>(null);
  protected readonly conversationRequest = signal<CatererQuoteRequest | null>(
    null,
  );
  protected readonly messages = signal<QuoteThreadMessage[]>([]);
  protected readonly draft = signal('');
  protected readonly pendingFiles = signal<QuoteThreadAttachment[]>([]);
  protected readonly threadError = signal('');
  protected readonly threadSending = signal(false);
  protected readonly isImage = isQuoteThreadImage;

  protected readonly requests = this.devisService.requestsSignal;
  protected readonly requestsLoading = this.devisService.isLoading;
  protected readonly requestsError = this.devisService.errorSignal;
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

  protected openDetail(request: CatererQuoteRequest, event?: Event): void {
    event?.stopPropagation();
    this.devisService.markAsViewed(request.id);
    const current = this.requests().find((r) => r.id === request.id) ?? request;
    this.detailRequest.set(current);
    this.detailVisible.set(true);
  }

  protected async openConversation(
    request: CatererQuoteRequest,
    event?: Event,
  ): Promise<void> {
    event?.stopPropagation();
    this.devisService.markAsViewed(request.id);
    const current = this.requests().find((r) => r.id === request.id) ?? request;
    this.conversationRequest.set(current);
    this.draft.set('');
    this.pendingFiles.set([]);
    this.threadError.set('');
    this.conversationVisible.set(true);
    await this.reloadThread(current);
  }

  protected async openConversationFromDetail(): Promise<void> {
    const request = this.detailRequest();
    if (!request) {
      return;
    }
    this.detailVisible.set(false);
    await this.openConversation(request);
  }

  protected async onAttach(event: Event): Promise<void> {
    const input = event.target as HTMLInputElement;
    const files = Array.from(input.files ?? []);
    input.value = '';
    this.threadError.set('');

    const next = [...this.pendingFiles()];
    for (const file of files) {
      if (next.length >= 6) {
        this.threadError.set('6 pièces jointes maximum.');
        break;
      }
      try {
        next.push(await fileToQuoteAttachment(file));
      } catch (err) {
        this.threadError.set(
          err instanceof Error ? err.message : 'Fichier impossible à ajouter.',
        );
      }
    }
    this.pendingFiles.set(next);
  }

  protected removePending(id: string): void {
    this.pendingFiles.update((files) => files.filter((file) => file.id !== id));
  }

  protected async sendMessage(): Promise<void> {
    const request = this.conversationRequest();
    const body = this.draft().trim();
    const attachments = this.pendingFiles();
    if (!request || this.threadSending() || (!body && attachments.length === 0)) {
      return;
    }

    this.threadSending.set(true);
    this.threadError.set('');
    try {
      await this.threads.send({
        quoteId: request.id,
        author: 'craftsman',
        body,
        attachments,
      });
      if (body) {
        await this.devisService.submitResponse(request.id, body);
        this.syncRequestSignals(request.id);
      }
      this.draft.set('');
      this.pendingFiles.set([]);
      const current =
        this.requests().find((item) => item.id === request.id) ?? request;
      this.conversationRequest.set(current);
      await this.reloadThread(current);
    } catch (err) {
      this.threadError.set(
        err instanceof Error ? err.message : 'Envoi impossible.',
      );
    } finally {
      this.threadSending.set(false);
    }
  }

  protected sortRequests(event: {
    data?: CatererQuoteRequest[];
    field?: string;
    order?: number;
  }): void {
    const rows = event.data;
    const field = event.field;
    if (!rows || !field) {
      return;
    }
    const order = event.order ?? 1;
    rows.sort((left, right) => compareQuoteColumn(left, right, field, order));
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

  protected formatMessageTime(value: string): string {
    const date = new Date(value);
    if (Number.isNaN(date.getTime())) {
      return value;
    }
    return new Intl.DateTimeFormat('fr-FR', {
      day: 'numeric',
      month: 'short',
      hour: '2-digit',
      minute: '2-digit',
    }).format(date);
  }

  private async reloadThread(request: CatererQuoteRequest): Promise<void> {
    const stored = await this.threads.list(request.id);
    this.messages.set(this.displayMessages(request, stored));
    queueMicrotask(() => {
      const scroller = this.threadScroller()?.nativeElement;
      if (scroller) {
        scroller.scrollTop = scroller.scrollHeight;
      }
    });
  }

  private displayMessages(
    request: CatererQuoteRequest,
    stored: QuoteThreadMessage[],
  ): QuoteThreadMessage[] {
    const origin: QuoteThreadMessage = {
      id: `origin-${request.id}`,
      quoteId: request.id,
      author: 'client',
      body: request.message,
      createdAt: new Date(request.requestedAtMs).toISOString(),
      attachments: [],
    };
    const history: QuoteThreadMessage[] = [origin];
    if (
      request.proResponse &&
      !stored.some(
        (message) =>
          message.author === 'craftsman' && message.body === request.proResponse,
      )
    ) {
      history.push({
        id: `response-${request.id}`,
        quoteId: request.id,
        author: 'craftsman',
        body: request.proResponse,
        createdAt: new Date(request.requestedAtMs + 60_000).toISOString(),
        attachments: [],
      });
    }
    return [...history, ...stored];
  }

  private syncRequestSignals(id: string): void {
    const current = this.requests().find((r) => r.id === id);
    if (!current) {
      return;
    }
    if (this.detailRequest()?.id === id) {
      this.detailRequest.set(current);
    }
    if (this.conversationRequest()?.id === id) {
      this.conversationRequest.set(current);
    }
  }
}
