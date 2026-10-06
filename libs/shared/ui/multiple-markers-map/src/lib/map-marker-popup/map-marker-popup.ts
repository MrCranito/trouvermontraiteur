import {
  Component,
  computed,
  effect,
  ElementRef,
  inject,
  input,
  output,
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
  ProjectType,
} from '@trouvermontraiteur/models';

interface PopupPhoto {
  id: string;
  imageUrl: string;
  caption: string;
}

@Component({
  selector: 'tmt-map-marker-popup',
  imports: [RouterLink, CertifiedBadge],
  templateUrl: './map-marker-popup.html',
  styleUrl: './map-marker-popup.scss',
})
export class MapMarkerPopup {
  private readonly auth = inject(ConsumerAuthService);
  private readonly favorites = inject(ConsumerFavoritesService);
  private readonly favoriteLoginPrompt = inject(FavoriteLoginPromptService);
  private readonly photoTrackRef =
    viewChild<ElementRef<HTMLElement>>('photoTrack');

  readonly craftsman = input.required<Craftsman>();
  readonly closed = output<void>();

  protected readonly projectLabels = PROJECT_LABELS;
  protected readonly photoIndex = signal(0);

  protected readonly photos = computed((): PopupPhoto[] => {
    const craftsman = this.craftsman();
    const seen = new Set<string>();
    const photos: PopupPhoto[] = [];

    const add = (photo: PopupPhoto): void => {
      const imageUrl = photo.imageUrl.trim();
      if (!imageUrl || seen.has(imageUrl)) {
        return;
      }
      seen.add(imageUrl);
      photos.push({ ...photo, imageUrl });
    };

    add({
      id: 'cover',
      imageUrl: craftsman.imageUrl,
      caption: craftsman.name,
    });
    for (const realisation of craftsman.realisations) {
      add({
        id: realisation.id,
        imageUrl: realisation.imageUrl,
        caption: realisation.caption || craftsman.name,
      });
    }

    if (photos.length === 0) {
      return [
        {
          id: 'empty',
          imageUrl: CRAFTSMAN_EMPTY_IMAGE_URL,
          caption: craftsman.name,
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

  protected visibleProjectTypes(): ProjectType[] {
    return this.craftsman().projectTypes.slice(0, 2);
  }

  protected ratingLabel(): string {
    const rating = this.craftsman().rating;
    return Number.isInteger(rating) ? String(rating) : rating.toFixed(1);
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

  protected onCloseClick(event: Event): void {
    event.preventDefault();
    event.stopPropagation();
    this.closed.emit();
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
    track.scrollTo({ left: track.clientWidth * index, behavior });
  }
}
