import { Component, computed, input } from '@angular/core';
import { RouterLink } from '@angular/router';
import { PROJECT_LABELS } from '@trouvermontraiteur/data';
import { Craftsman } from '@trouvermontraiteur/models';

@Component({
  selector: 'tmt-discover-card',
  imports: [RouterLink],
  templateUrl: './discover-card.html',
  styleUrl: './discover-card.scss',
})
export class DiscoverCard {
  readonly craftsman = input.required<Craftsman>();

  protected readonly projectLabels = PROJECT_LABELS;

  protected readonly subtitle = computed(() => {
    const c = this.craftsman();
    const projects = c.projectTypes
      .slice(0, 2)
      .map((p) => this.projectLabels[p])
      .join(' · ');
    return projects ? `${c.location.city} · ${projects}` : c.location.city;
  });

  protected readonly ratingLabel = computed(() => {
    const rating = this.craftsman().rating;
    return Number.isInteger(rating) ? String(rating) : rating.toFixed(1);
  });
}
