import { Component, computed, inject, input } from '@angular/core';
import { RouterLink } from '@angular/router';
import { CATEGORY_LABELS, PUBLIC_APP_URL } from '@trouvermontraiteur/data';
import { Caterer } from '@trouvermontraiteur/models';
import { Button } from 'primeng/button';
import { Card } from 'primeng/card';
import { Rating } from 'primeng/rating';
import { Tag } from 'primeng/tag';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'tmt-caterer-card',
  imports: [Card, Button, Rating, Tag, RouterLink, FormsModule],
  templateUrl: './caterer-card.html',
  styleUrl: './caterer-card.scss',
})
export class CatererCard {
  readonly caterer = input.required<Caterer>();
  readonly layout = input<'grid' | 'list'>('grid');
  readonly variant = input<'default' | 'featured'>('default');

  private readonly publicAppUrl = inject(PUBLIC_APP_URL, { optional: true });

  protected readonly categoryLabels = CATEGORY_LABELS;

  protected readonly detailUrl = computed(() => {
    const base = this.publicAppUrl?.replace(/\/$/, '');
    if (!base?.startsWith('http://') && !base?.startsWith('https://')) {
      return null;
    }
    return `${base}/traiteurs/${this.caterer().slug}`;
  });
}
