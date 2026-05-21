import { Component, computed, inject, signal } from '@angular/core';
import { toSignal } from '@angular/core/rxjs-interop';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';
import { ConsumerAuthService } from '@trouvermontraiteur/app-auth';
import { ConsumerFavoritesService } from '@trouvermontraiteur/app-consumer-data';
import { map } from 'rxjs';
import {
  buildDefaultAvailableDates,
  CATEGORY_LABELS,
  CatererDetailLayoutService,
  CatererService,
  DIETARY_LABELS,
  EVENT_LABELS,
} from '@trouvermontraiteur/data';
import { AvailabilityCalendar } from '@trouvermontraiteur/availability-calendar';
import {
  Caterer,
  CatererCategory,
  CatererDetailSectionId,
  CatererLocation,
  MenuItem,
} from '@trouvermontraiteur/models';
import { SingleMarkerMap } from '@trouvermontraiteur/single-marker-map';
import {
  Accordion,
  AccordionContent,
  AccordionHeader,
  AccordionPanel,
} from 'primeng/accordion';
import { Button } from 'primeng/button';
import { FormsModule } from '@angular/forms';
import { Rating } from 'primeng/rating';
import { ListingPhotoGallery } from '../listing-photo-gallery/listing-photo-gallery';
import { QuoteRequestDialog } from '../quote-request-dialog/quote-request-dialog';

export interface ListingPhoto {
  id: string;
  imageUrl: string;
  caption: string;
}

@Component({
  selector: 'tmt-details',
  imports: [
    FormsModule,
    RouterLink,
    Button,
    Rating,
    Accordion,
    AccordionPanel,
    AccordionHeader,
    AccordionContent,
    SingleMarkerMap,
    AvailabilityCalendar,
    QuoteRequestDialog,
    ListingPhotoGallery,
  ],
  templateUrl: './details.html',
  styleUrl: './details.scss',
})
export class Details {
  private readonly route = inject(ActivatedRoute);
  private readonly router = inject(Router);
  private readonly auth = inject(ConsumerAuthService);
  private readonly favorites = inject(ConsumerFavoritesService);
  private readonly catererService = inject(CatererService);
  private readonly layoutService = inject(CatererDetailLayoutService);

  protected readonly quoteDialogVisible = signal(false);
  protected readonly galleryVisible = signal(false);
  protected readonly galleryStartIndex = signal(0);
  protected readonly shareHintVisible = signal(false);

  private readonly slug = toSignal(
    this.route.paramMap.pipe(map((p) => p.get('slug') ?? '')),
    { initialValue: '' },
  );

  protected readonly caterer = computed(() =>
    this.catererService.getBySlug(this.slug()),
  );

  protected readonly orderedSections = computed((): CatererDetailSectionId[] => {
    const c = this.caterer();
    if (!c) {
      return [];
    }
    const layout = this.layoutService.getLayout(c.slug);
    return this.layoutService.resolveVisibleSections(c, layout);
  });

  /** Sections rendered in the main column (cover is handled by the photo grid). */
  protected readonly contentSections = computed(() =>
    this.orderedSections().filter((id) => id !== 'cover'),
  );

  protected readonly allPhotos = computed((): ListingPhoto[] => {
    const c = this.caterer();
    if (!c) {
      return [];
    }
    return [
      { id: 'cover', imageUrl: c.imageUrl, caption: c.name },
      ...c.realisations.map((r) => ({
        id: r.id,
        imageUrl: r.imageUrl,
        caption: r.caption,
      })),
    ];
  });

  protected readonly mosaicPhotos = computed(() => this.allPhotos().slice(0, 5));

  protected readonly mosaicCount = computed(() => this.mosaicPhotos().length);

  protected readonly isFavorite = computed(() => {
    const c = this.caterer();
    return c ? this.favorites.isFavorite(c.id) : false;
  });

  protected readonly priceFrom = computed(() => {
    const c = this.caterer();
    if (!c?.menu.length) {
      return null;
    }
    return Math.min(...c.menu.map((item) => item.price));
  });

  protected readonly categoryLabels = CATEGORY_LABELS;
  protected readonly eventLabels = EVENT_LABELS;
  protected readonly dietaryLabels = DIETARY_LABELS;

  protected readonly displayAvailableDates = computed(() => {
    const c = this.caterer();
    if (!c) {
      return [];
    }
    if (c.availableDates.length > 0) {
      return c.availableDates;
    }
    return buildDefaultAvailableDates(c.unavailableDates);
  });

  protected menuByCategory = computed(() => {
    const caterer = this.caterer();
    if (!caterer) {
      return [] as { category: CatererCategory; label: string; items: MenuItem[] }[];
    }

    const groups = new Map<CatererCategory, MenuItem[]>();
    for (const item of caterer.menu) {
      const list = groups.get(item.category) ?? [];
      list.push(item);
      groups.set(item.category, list);
    }

    return [...groups.entries()].map(([category, items]) => ({
      category,
      label: CATEGORY_LABELS[category],
      items,
    }));
  });

  protected openGallery(index: number): void {
    this.galleryStartIndex.set(index);
    this.galleryVisible.set(true);
  }

  protected toggleSave(): void {
    const c = this.caterer();
    if (!c) {
      return;
    }
    if (!this.auth.isAuthenticated()) {
      void this.router.navigate(['/auth/connexion'], {
        queryParams: { returnUrl: this.router.url },
      });
      return;
    }
    this.favorites.toggle(c.id);
  }

  protected async shareListing(): Promise<void> {
    const c = this.caterer();
    if (!c) {
      return;
    }
    const url = window.location.href;
    const shareData = { title: c.name, url };

    try {
      if (navigator.share) {
        await navigator.share(shareData);
        return;
      }
      await navigator.clipboard.writeText(url);
      this.shareHintVisible.set(true);
      window.setTimeout(() => this.shareHintVisible.set(false), 2500);
    } catch {
      // User cancelled native share or clipboard denied — no-op.
    }
  }

  protected openQuoteDialog(): void {
    if (!this.auth.isAuthenticated()) {
      void this.router.navigate(['/auth/connexion'], {
        queryParams: { returnUrl: this.router.url },
      });
      return;
    }
    this.quoteDialogVisible.set(true);
  }

  protected formatPrice(price: number): string {
    return new Intl.NumberFormat('fr-FR', {
      style: 'currency',
      currency: 'EUR',
    }).format(price);
  }

  protected mapsUrl(location: CatererLocation): string {
    const query = encodeURIComponent(
      `${location.address}, ${location.city}`,
    );
    return `https://www.google.com/maps/search/?api=1&query=${query}`;
  }
}
