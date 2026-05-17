import { Component, computed, signal } from '@angular/core';
import { RouterLink } from '@angular/router';
import {
  ALL_CATEGORIES,
  CATEGORY_LABELS,
  CatererService,
} from '@trouvermontraiteur/data';
import { Caterer, CatererCategory } from '@trouvermontraiteur/models';
import { CatererCard } from '@trouvermontraiteur/ui';
import { CatererMap } from '@trouvermontraiteur/map';
import { Button } from 'primeng/button';
import { Checkbox } from 'primeng/checkbox';
import { IconField } from 'primeng/iconfield';
import { InputIcon } from 'primeng/inputicon';
import { InputText } from 'primeng/inputtext';
import { SelectButton } from 'primeng/selectbutton';
import { Slider } from 'primeng/slider';
import { FormsModule } from '@angular/forms';

type ViewMode = 'grid' | 'list' | 'map';

@Component({
  selector: 'tmt-search',
  imports: [
    FormsModule,
    Button,
    InputText,
    IconField,
    InputIcon,
    Checkbox,
    SelectButton,
    Slider,
    CatererCard,
    CatererMap,
    RouterLink,
  ],
  templateUrl: './search.html',
  styleUrl: './search.scss',
})
export class Search {
  protected readonly categoryOptions = ALL_CATEGORIES.map((key) => ({
    key,
    label: CATEGORY_LABELS[key],
  }));

  protected readonly viewOptions = [
    { label: 'Grille', value: 'grid' as ViewMode, icon: 'pi pi-th-large' },
    { label: 'Liste', value: 'list' as ViewMode, icon: 'pi pi-list' },
    { label: 'Carte', value: 'map' as ViewMode, icon: 'pi pi-map' },
  ];

  protected query = signal('');
  protected minRating = signal(0);
  protected selectedCategories = signal<CatererCategory[]>([]);
  protected viewMode = signal<ViewMode>('grid');
  protected mapSelectedId = signal<string | null>(null);

  protected readonly results = computed(() =>
    this.catererService.filter({
      query: this.query(),
      categories: this.selectedCategories(),
      minRating: this.minRating(),
    }),
  );

  protected readonly resultCount = computed(() => this.results().length);

  constructor(private readonly catererService: CatererService) {}

  protected isCategoryChecked(cat: CatererCategory): boolean {
    return this.selectedCategories().includes(cat);
  }

  protected toggleCategory(cat: CatererCategory, checked: boolean): void {
    const current = this.selectedCategories();
    if (checked) {
      this.selectedCategories.set([...current, cat]);
    } else {
      this.selectedCategories.set(current.filter((c) => c !== cat));
    }
  }

  protected onMapSelect(id: string): void {
    this.mapSelectedId.set(id);
  }

  protected findCaterer(id: string): Caterer | undefined {
    return this.results().find((c) => c.id === id);
  }

  protected resetFilters(): void {
    this.query.set('');
    this.minRating.set(0);
    this.selectedCategories.set([]);
  }
}
