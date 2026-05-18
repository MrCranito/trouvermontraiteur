import { Component, computed, ElementRef, inject, viewChild } from '@angular/core';
import { toSignal } from '@angular/core/rxjs-interop';
import { ActivatedRoute, RouterLink } from '@angular/router';
import { map } from 'rxjs';
import {
  CATEGORY_LABELS,
  CatererService,
  DIETARY_LABELS,
  EVENT_LABELS,
} from '@trouvermontraiteur/data';
import { Caterer, CatererCategory, CatererLocation, MenuItem } from '@trouvermontraiteur/models';
import { CatererMap } from '@trouvermontraiteur/map';
import { Accordion, AccordionContent, AccordionHeader, AccordionPanel } from 'primeng/accordion';
import { Button } from 'primeng/button';
import { Rating } from 'primeng/rating';
import { Tag } from 'primeng/tag';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'tmt-details',
  imports: [
    FormsModule,
    RouterLink,
    Button,
    Rating,
    Tag,
    Accordion,
    AccordionPanel,
    AccordionHeader,
    AccordionContent,
    CatererMap,
  ],
  templateUrl: './details.html',
  styleUrl: './details.scss',
})
export class Details {
  private readonly route = inject(ActivatedRoute);
  private readonly catererService = inject(CatererService);

  private readonly gallerySlider = viewChild<ElementRef<HTMLElement>>('gallerySlider');

  private readonly slug = toSignal(
    this.route.paramMap.pipe(map((p) => p.get('slug') ?? '')),
    { initialValue: '' },
  );

  protected readonly caterer = computed(() =>
    this.catererService.getBySlug(this.slug()),
  );

  protected readonly mapCaterers = computed(() => {
    const c = this.caterer();
    return c ? [c] : [];
  });

  protected readonly categoryLabels = CATEGORY_LABELS;
  protected readonly eventLabels = EVENT_LABELS;
  protected readonly dietaryLabels = DIETARY_LABELS;

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

  protected scrollGallery(direction: -1 | 1): void {
    const el = this.gallerySlider()?.nativeElement;
    if (!el) {
      return;
    }

    const slide = el.querySelector<HTMLElement>('.detail-page__slide');
    const gap = 12;
    const amount = slide ? slide.offsetWidth + gap : el.clientWidth * 0.88;
    el.scrollBy({ left: direction * amount, behavior: 'smooth' });
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
