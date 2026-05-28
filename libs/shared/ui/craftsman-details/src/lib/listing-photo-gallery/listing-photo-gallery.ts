import {
  Component,
  computed,
  effect,
  HostListener,
  input,
  model,
  OnDestroy,
  signal,
} from '@angular/core';

export interface GalleryPhoto {
  id: string;
  imageUrl: string;
  caption: string;
}

@Component({
  selector: 'tmt-listing-photo-gallery',
  templateUrl: './listing-photo-gallery.html',
  styleUrl: './listing-photo-gallery.scss',
})
export class ListingPhotoGallery {
  readonly visible = model(false);
  readonly photos = input.required<GalleryPhoto[]>();
  readonly startIndex = input(0);

  protected readonly currentIndex = signal(0);

  protected readonly currentPhoto = computed(() => {
    const list = this.photos();
    const i = this.currentIndex();
    return list[i] ?? list[0];
  });

  protected readonly counterLabel = computed(() => {
    const total = this.photos().length;
    if (total === 0) {
      return '';
    }
    return `${this.currentIndex() + 1} / ${total}`;
  });

  constructor() {
    effect(() => {
      if (!this.visible()) {
        return;
      }
      const total = this.photos().length;
      if (total === 0) {
        return;
      }
      const index = Math.min(Math.max(0, this.startIndex()), total - 1);
      this.currentIndex.set(index);
    });

    effect(() => {
      document.body.style.overflow = this.visible() ? 'hidden' : '';
    });
  }

  ngOnDestroy(): void {
    document.body.style.overflow = '';
  }

  @HostListener('document:keydown', ['$event'])
  protected onKeydown(event: KeyboardEvent): void {
    if (!this.visible()) {
      return;
    }
    switch (event.key) {
      case 'Escape':
        this.close();
        break;
      case 'ArrowLeft':
        event.preventDefault();
        this.prev();
        break;
      case 'ArrowRight':
        event.preventDefault();
        this.next();
        break;
    }
  }

  protected close(): void {
    this.visible.set(false);
  }

  protected prev(): void {
    const total = this.photos().length;
    if (total <= 1) {
      return;
    }
    this.currentIndex.update((i) => (i - 1 + total) % total);
  }

  protected next(): void {
    const total = this.photos().length;
    if (total <= 1) {
      return;
    }
    this.currentIndex.update((i) => (i + 1) % total);
  }

  protected onBackdropClick(event: MouseEvent): void {
    if (event.target === event.currentTarget) {
      this.close();
    }
  }
}
