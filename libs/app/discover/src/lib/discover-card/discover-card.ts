import { Component, computed, inject, input } from '@angular/core';
import { RouterLink } from '@angular/router';
import { ConsumerAuthService } from '@trouvermontraiteur/app-auth';
import {
  ConsumerFavoritesService,
  FavoriteLoginPromptService,
} from '@trouvermontraiteur/app-consumer-data';
import { PROJECT_LABELS } from '@trouvermontraiteur/data';
import { Craftsman, craftsmanCoverImage } from '@trouvermontraiteur/models';

@Component({
  selector: 'tmt-discover-card',
  imports: [RouterLink],
  templateUrl: './discover-card.html',
  styleUrl: './discover-card.scss',
})
export class DiscoverCard {
  private readonly auth = inject(ConsumerAuthService);
  private readonly favorites = inject(ConsumerFavoritesService);
  private readonly favoriteLoginPrompt = inject(FavoriteLoginPromptService);

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

  protected readonly coverImage = computed(() =>
    craftsmanCoverImage(this.craftsman().imageUrl),
  );

  protected readonly isFavorite = computed(() =>
    this.favorites.isFavorite(this.craftsman().id),
  );

  protected onFavoriteClick(event: Event): void {
    event.preventDefault();
    event.stopPropagation();

    if (!this.auth.isAuthenticated()) {
      this.favoriteLoginPrompt.open();
      return;
    }

    void this.favorites.toggle(this.craftsman().id);
  }
}
