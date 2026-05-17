import { Component, input } from '@angular/core';
import { RouterLink } from '@angular/router';
import { Caterer } from '@trouvermontraiteur/models';
import { CATEGORY_LABELS } from '@trouvermontraiteur/data';
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

  protected readonly categoryLabels = CATEGORY_LABELS;
}
