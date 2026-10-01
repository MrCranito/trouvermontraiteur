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
import { RouterLink } from '@angular/router';
import { ConsumerAuthService } from '@trouvermontraiteur/app-auth';
import {
  ConsumerFavoritesService,
  FavoriteLoginPromptService,
} from '@trouvermontraiteur/app-consumer-data';
import { PROJECT_LABELS } from '@trouvermontraiteur/data';
import { CertifiedBadge } from '@trouvermontraiteur/certified-badge';
import {
  CRAFTSMAN_EMPTY_IMAGE_URL,
  Craftsman,
} from '@trouvermontraiteur/models';

interface ListingPhoto {
  id: string;
  imageUrl: string;
  caption: string;
}

@Component({
  selector: 'tmt-search-listing',
  imports: [RouterLink, CertifiedBadge],
  templateUrl: './search-listing.html',
  styleUrl: './search-listing.scss',
})
export class SearchListing {
  private readonly auth = inject(ConsumerAuthService);
  private readonly favorites = inject(ConsumerFavoritesService);
  private readonly favoriteLoginPrompt = inject(FavoriteLoginPromptService);

  private readonly photoTrackRef =
    viewChild<ElementRef<HTMLElement>>('photoTrack');

  readonly craftsman = input.required<Craftsman>();
  readonly active = input(false);
  readonly showFavorite = input(true);

  protected readonly projectLabels = PROJECT_LABELS;
  protected readonly photoIndex = signal(0);

  protected readonly photos = computed((): ListingPhoto[] => {
    const c = this.craftsman();
    const photos = [
      { id: 'cover', imageUrl: c.imageUrl, caption: c.name },
      ...c.realisations.map((r) => ({
        id: r.id,
        imageUrl: r.imageUrl,
        caption: r.caption,
      })),
    ].filter((photo) => photo.imageUrl.trim().length > 0);

    if (photos.length === 0) {
      return [
        {
          id: 'empty',
          imageUrl: CRAFTSMAN_EMPTY_IMAGE_URL,
          caption: c.name,
        },
      ];
    }

    return photos;
  });

  protected readonly hasMultiplePhotos = computed(
    () => this.photos().length > 1,
  );

  protected readonly isFavorite = computed(() =>
    this.favorites.isFavorite(this.craftsman().id),
  );

  constructor() {
    effect(() => {
      this.craftsman().id;
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
    const index = this.photoIndex();
    if (index <= 0) {
      return;
    }
    this.goToPhoto(index - 1);
  }

  protected nextPhoto(event: Event): void {
    event.preventDefault();
    event.stopPropagation();
    const index = this.photoIndex();
    if (index >= this.photos().length - 1) {
      return;
    }
    this.goToPhoto(index + 1);
  }

  protected onFavoriteClick(event: Event): void {
    event.preventDefault();
    event.stopPropagation();

    if (!this.auth.isAuthenticated()) {
      this.favoriteLoginPrompt.open();
      return;
    }

    void this.favorites.toggle(this.craftsman().id);
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
