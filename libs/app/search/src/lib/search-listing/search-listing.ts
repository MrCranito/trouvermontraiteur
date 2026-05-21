import {
  Component,
  computed,
  effect,
  ElementRef,
  inject,
  input,
  signal,
  viewChild,
} from '@angular/core';
import { Router, RouterLink } from '@angular/router';
import { ConsumerAuthService } from '@trouvermontraiteur/app-auth';
import { ConsumerFavoritesService } from '@trouvermontraiteur/app-consumer-data';
import { EVENT_LABELS } from '@trouvermontraiteur/data';
import { Caterer } from '@trouvermontraiteur/models';

interface ListingPhoto {
  id: string;
  imageUrl: string;
  caption: string;
}

@Component({
  selector: 'tmt-search-listing',
  imports: [RouterLink],
  templateUrl: './search-listing.html',
  styleUrl: './search-listing.scss',
})
export class SearchListing {
  private readonly router = inject(Router);
  private readonly auth = inject(ConsumerAuthService);
  private readonly favorites = inject(ConsumerFavoritesService);

  private readonly photoTrackRef =
    viewChild<ElementRef<HTMLElement>>('photoTrack');

  readonly caterer = input.required<Caterer>();
  readonly active = input(false);
  readonly showFavorite = input(true);

  protected readonly eventLabels = EVENT_LABELS;
  protected readonly photoIndex = signal(0);

  protected readonly photos = computed((): ListingPhoto[] => {
    const c = this.caterer();
    return [
      { id: 'cover', imageUrl: c.imageUrl, caption: c.name },
      ...c.realisations.map((r) => ({
        id: r.id,
        imageUrl: r.imageUrl,
        caption: r.caption,
      })),
    ];
  });

  protected readonly hasMultiplePhotos = computed(
    () => this.photos().length > 1,
  );

  protected readonly isFavorite = computed(() =>
    this.favorites.isFavorite(this.caterer().id),
  );

  constructor() {
    effect(() => {
      this.caterer().id;
      this.photoIndex.set(0);
      queueMicrotask(() => this.scrollToPhotoIndex(0, 'auto'));
    });
  }

  protected onPhotoScroll(event: Event): void {
    const track = event.target as HTMLElement;
    const width = track.clientWidth;
    if (width <= 0) {
      return;
    }
    const index = Math.round(track.scrollLeft / width);
    const clamped = Math.min(Math.max(0, index), this.photos().length - 1);
    if (clamped !== this.photoIndex()) {
      this.photoIndex.set(clamped);
    }
  }

  protected prevPhoto(event: Event): void {
    event.preventDefault();
    event.stopPropagation();
    this.goToPhoto(
      (this.photoIndex() - 1 + this.photos().length) % this.photos().length,
    );
  }

  protected nextPhoto(event: Event): void {
    event.preventDefault();
    event.stopPropagation();
    this.goToPhoto((this.photoIndex() + 1) % this.photos().length);
  }

  protected onFavoriteClick(event: Event): void {
    event.preventDefault();
    event.stopPropagation();

    if (!this.auth.isAuthenticated()) {
      void this.router.navigate(['/auth/connexion'], {
        queryParams: { returnUrl: this.router.url || '/' },
      });
      return;
    }

    this.favorites.toggle(this.caterer().id);
  }

  private goToPhoto(index: number): void {
    this.photoIndex.set(index);
    this.scrollToPhotoIndex(index);
  }

  private scrollToPhotoIndex(
    index: number,
    behavior: ScrollBehavior = 'smooth',
  ): void {
    const track = this.photoTrackRef()?.nativeElement;
    if (!track) {
      return;
    }
    const width = track.clientWidth;
    track.scrollTo({ left: width * index, behavior });
  }
}
