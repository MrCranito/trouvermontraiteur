import { Component, inject } from '@angular/core';
import { RouterLink } from '@angular/router';
import {
  ConsumerQuoteRequest,
  ConsumerQuotesService,
} from '@trouvermontraiteur/app-consumer-data';
import { craftsmanCoverImage } from '@trouvermontraiteur/models';
import { Button } from 'primeng/button';
import { Tag } from 'primeng/tag';

@Component({
  selector: 'tmt-consumer-devis',
  imports: [RouterLink, Button, Tag],
  templateUrl: './consumer-devis.html',
  styleUrl: './consumer-devis.scss',
})
export class ConsumerDevis {
  protected readonly quotesService = inject(ConsumerQuotesService);

  protected readonly quotes = this.quotesService.quotes;

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
}
