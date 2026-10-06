import {
  Component,
  ElementRef,
  inject,
  signal,
  viewChild,
} from '@angular/core';
import { FormsModule } from '@angular/forms';
import { RouterLink } from '@angular/router';
import { QuoteThreadService } from '@trouvermontraiteur/api';
import {
  ConsumerQuoteRequest,
  ConsumerQuotesService,
} from '@trouvermontraiteur/app-consumer-data';
import {
  craftsmanCoverImage,
  fileToQuoteAttachment,
  isQuoteThreadImage,
  QuoteThreadAttachment,
  QuoteThreadMessage,
} from '@trouvermontraiteur/models';
import { Button } from 'primeng/button';
import { Dialog } from 'primeng/dialog';
import { Tag } from 'primeng/tag';

@Component({
  selector: 'tmt-consumer-devis',
  imports: [FormsModule, RouterLink, Button, Tag, Dialog],
  templateUrl: './consumer-devis.html',
  styleUrl: './consumer-devis.scss',
})
export class ConsumerDevis {
  private readonly threads = inject(QuoteThreadService);
  private readonly threadScroller =
    viewChild<ElementRef<HTMLElement>>('threadScroller');

  protected readonly quotesService = inject(ConsumerQuotesService);
  protected readonly quotes = this.quotesService.quotes;
  protected readonly isImage = isQuoteThreadImage;

  protected readonly conversationVisible = signal(false);
  protected readonly activeQuote = signal<ConsumerQuoteRequest | null>(null);
  protected readonly messages = signal<QuoteThreadMessage[]>([]);
  protected readonly draft = signal('');
  protected readonly pendingFiles = signal<QuoteThreadAttachment[]>([]);
  protected readonly threadError = signal('');
  protected readonly threadSending = signal(false);

  protected coverImage(url: string): string {
    return craftsmanCoverImage(url);
  }

  protected statusLabel(status: ConsumerQuoteRequest['status']): string {
    const labels = {
      pending: 'En attente',
      answered: 'Répondu',
      archived: 'Archivé',
    } as const;
    return labels[status];
  }

  protected statusSeverity(
    status: ConsumerQuoteRequest['status'],
  ): 'success' | 'info' | 'secondary' {
    switch (status) {
      case 'answered':
        return 'success';
      case 'pending':
        return 'info';
      default:
        return 'secondary';
    }
  }

  protected async openConversation(quote: ConsumerQuoteRequest): Promise<void> {
    this.activeQuote.set(quote);
    this.draft.set('');
    this.pendingFiles.set([]);
    this.threadError.set('');
    this.conversationVisible.set(true);
    await this.reloadThread(quote);
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
    const quote = this.activeQuote();
    const body = this.draft().trim();
    const attachments = this.pendingFiles();
    if (!quote || this.threadSending() || (!body && attachments.length === 0)) {
      return;
    }

    this.threadSending.set(true);
    this.threadError.set('');
    try {
      await this.threads.send({
        quoteId: quote.id,
        author: 'client',
        body,
        attachments,
      });
      this.draft.set('');
      this.pendingFiles.set([]);
      await this.reloadThread(quote);
    } catch (err) {
      this.threadError.set(
        err instanceof Error ? err.message : 'Envoi impossible.',
      );
    } finally {
      this.threadSending.set(false);
    }
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

  private async reloadThread(quote: ConsumerQuoteRequest): Promise<void> {
    const stored = await this.threads.list(quote.id);
    this.messages.set(this.displayMessages(quote, stored));
    queueMicrotask(() => {
      const scroller = this.threadScroller()?.nativeElement;
      if (scroller) {
        scroller.scrollTop = scroller.scrollHeight;
      }
    });
  }

  private displayMessages(
    quote: ConsumerQuoteRequest,
    stored: QuoteThreadMessage[],
  ): QuoteThreadMessage[] {
    const history: QuoteThreadMessage[] = [
      {
        id: `origin-${quote.id}`,
        quoteId: quote.id,
        author: 'client',
        body: quote.message,
        createdAt: new Date(quote.requestedAtMs).toISOString(),
        attachments: [],
      },
    ];
    if (
      quote.proResponse &&
      !stored.some(
        (message) =>
          message.author === 'craftsman' && message.body === quote.proResponse,
      )
    ) {
      history.push({
        id: `response-${quote.id}`,
        quoteId: quote.id,
        author: 'craftsman',
        body: quote.proResponse,
        createdAt: new Date(quote.requestedAtMs + 60_000).toISOString(),
        attachments: [],
      });
    }
    return [...history, ...stored];
  }
}

  protected statusLabel(status: ConsumerQuoteRequest['status']): string {
    const labels = {
      pending: 'En attente',
      answered: 'Répondu',
      archived: 'Archivé',
    } as const;
    return labels[status];
  }

  protected statusSeverity(
    status: ConsumerQuoteRequest['status'],
  ): 'success' | 'info' | 'secondary' {
    switch (status) {
      case 'answered':
        return 'success';
      case 'pending':
        return 'info';
      default:
        return 'secondary';
    }
  }
}
