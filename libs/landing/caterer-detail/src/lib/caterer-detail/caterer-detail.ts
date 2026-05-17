import { Component, computed, inject } from '@angular/core';
import { toSignal } from '@angular/core/rxjs-interop';
import { ActivatedRoute, RouterLink } from '@angular/router';
import { map } from 'rxjs';
import { CATEGORY_LABELS, CatererService } from '@trouvermontraiteur/data';
import { CatererCategory, MenuItem } from '@trouvermontraiteur/models';
import { Accordion, AccordionContent, AccordionHeader, AccordionPanel } from 'primeng/accordion';
import { Button } from 'primeng/button';
import { Divider } from 'primeng/divider';
import { Rating } from 'primeng/rating';
import { Tag } from 'primeng/tag';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'tmt-caterer-detail',
  imports: [
    FormsModule,
    RouterLink,
    Button,
    Rating,
    Tag,
    Divider,
    Accordion,
    AccordionPanel,
    AccordionHeader,
    AccordionContent,
  ],
  templateUrl: './caterer-detail.html',
  styleUrl: './caterer-detail.scss',
})
export class CatererDetail {
  private readonly route = inject(ActivatedRoute);
  private readonly catererService = inject(CatererService);

  private readonly slug = toSignal(
    this.route.paramMap.pipe(map((p) => p.get('slug') ?? '')),
    { initialValue: '' },
  );

  protected readonly caterer = computed(() =>
    this.catererService.getBySlug(this.slug()),
  );

  protected readonly categoryLabels = CATEGORY_LABELS;

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

  protected formatPrice(price: number): string {
    return new Intl.NumberFormat('fr-FR', {
      style: 'currency',
      currency: 'EUR',
    }).format(price);
  }
}
