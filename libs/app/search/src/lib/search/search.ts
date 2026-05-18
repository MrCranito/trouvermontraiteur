import { Component, computed, inject, signal } from '@angular/core';
import { takeUntilDestroyed } from '@angular/core/rxjs-interop';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';
import {
  ALL_CATEGORIES,
  ALL_DIETARY_OPTIONS,
  ALL_EVENT_TYPES,
  CATEGORY_LABELS,
  DIETARY_LABELS,
  EVENT_LABELS,
  CatererService,
  SearchSort,
} from '@trouvermontraiteur/data';
import {
  Caterer,
  CatererCategory,
  DietaryOption,
  EventType,
} from '@trouvermontraiteur/models';
import { CatererCard } from '@trouvermontraiteur/ui';
import { CatererMap } from '@trouvermontraiteur/map';
import { Button } from 'primeng/button';
import { Checkbox } from 'primeng/checkbox';
import { IconField } from 'primeng/iconfield';
import { InputIcon } from 'primeng/inputicon';
import { InputText } from 'primeng/inputtext';
import {
  Accordion,
  AccordionContent,
  AccordionHeader,
  AccordionPanel,
} from 'primeng/accordion';
import { Select } from 'primeng/select';
import { SelectButton } from 'primeng/selectbutton';
import { Slider } from 'primeng/slider';
import { FormsModule } from '@angular/forms';
import {
  buildSearchQueryParams,
  parseSearchQueryParams,
  SearchViewMode,
} from '../search-query-params';

@Component({
  selector: 'tmt-search',
  imports: [
    FormsModule,
    Button,
    InputText,
    IconField,
    InputIcon,
    Accordion,
    AccordionPanel,
    AccordionHeader,
    AccordionContent,
    Checkbox,
    Select,
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
  private readonly route = inject(ActivatedRoute);
  private readonly router = inject(Router);
  private querySyncTimer: ReturnType<typeof setTimeout> | undefined;

  protected readonly minEventDate = new Date().toISOString().slice(0, 10);

  protected readonly categoryOptions = ALL_CATEGORIES.map((key) => ({
    key,
    label: CATEGORY_LABELS[key],
  }));

  protected readonly eventOptions = ALL_EVENT_TYPES.map((key) => ({
    key,
    label: EVENT_LABELS[key],
  }));

  protected readonly dietaryOptions = ALL_DIETARY_OPTIONS.map((key) => ({
    key,
    label: DIETARY_LABELS[key],
  }));

  protected readonly sortOptions: { label: string; value: SearchSort }[] = [
    { label: 'Pertinence', value: 'relevance' },
    { label: 'Meilleure note', value: 'rating' },
    { label: "Plus d'avis", value: 'reviews' },
    { label: 'Nom (A–Z)', value: 'name' },
    { label: 'Prix croissant', value: 'price' },
  ];

  protected readonly viewOptions = [
    { label: 'Grille', value: 'grid' as SearchViewMode, icon: 'pi pi-th-large' },
    { label: 'Carte', value: 'map' as SearchViewMode, icon: 'pi pi-map' },
  ];

  protected query = signal('');
  protected minRating = signal(0);
  protected selectedCategories = signal<CatererCategory[]>([]);
  protected eventDate = signal('');
  protected selectedEventTypes = signal<EventType[]>([]);
  protected selectedDietary = signal<DietaryOption[]>([]);
  protected sort = signal<SearchSort>('relevance');
  protected viewMode = signal<SearchViewMode>('grid');
  protected mapSelectedId = signal<string | null>(null);
  protected showBackLink = true;

  protected readonly filteredResults = computed(() =>
    this.catererService.filter({
      query: this.query(),
      categories: this.selectedCategories(),
      minRating: this.minRating(),
      eventDate: this.eventDate(),
      eventTypes: this.selectedEventTypes(),
      dietary: this.selectedDietary(),
    }),
  );

  protected readonly results = computed(() =>
    this.catererService.sort(this.filteredResults(), this.sort()),
  );

  protected readonly resultCount = computed(() => this.results().length);

  protected readonly hasActiveFilters = computed(
    () =>
      this.query().trim().length > 0 ||
      this.minRating() > 0 ||
      this.selectedCategories().length > 0 ||
      this.eventDate().length > 0 ||
      this.selectedEventTypes().length > 0 ||
      this.selectedDietary().length > 0,
  );

  constructor(private readonly catererService: CatererService) {
    this.route.data.pipe(takeUntilDestroyed()).subscribe((data) => {
      this.showBackLink = data['showBackLink'] !== false;
    });

    this.route.queryParamMap.pipe(takeUntilDestroyed()).subscribe((params) => {
      const state = parseSearchQueryParams(params);
      this.query.set(state.query);
      this.minRating.set(state.minRating);
      this.selectedCategories.set(state.categories);
      this.eventDate.set(state.eventDate);
      this.selectedEventTypes.set(state.eventTypes);
      this.selectedDietary.set(state.dietary);
      this.sort.set(state.sort);
      this.viewMode.set(state.view);
    });
  }

  protected onQueryChange(value: string): void {
    this.query.set(value);
    clearTimeout(this.querySyncTimer);
    this.querySyncTimer = setTimeout(() => this.syncToUrl(), 300);
  }

  protected onMinRatingChange(value: number): void {
    this.minRating.set(value);
    this.syncToUrl();
  }

  protected onEventDateChange(value: string): void {
    this.eventDate.set(value);
    this.syncToUrl();
  }

  protected onSortChange(value: SearchSort): void {
    this.sort.set(value);
    this.syncToUrl();
  }

  protected onViewModeChange(value: SearchViewMode): void {
    this.viewMode.set(value);
    this.syncToUrl();
  }

  protected isCategoryChecked(cat: CatererCategory): boolean {
    return this.selectedCategories().includes(cat);
  }

  protected toggleCategory(cat: CatererCategory, checked: boolean): void {
    this.toggleInList(this.selectedCategories, cat, checked);
    this.syncToUrl();
  }

  protected isEventChecked(event: EventType): boolean {
    return this.selectedEventTypes().includes(event);
  }

  protected toggleEvent(event: EventType, checked: boolean): void {
    this.toggleInList(this.selectedEventTypes, event, checked);
    this.syncToUrl();
  }

  protected isDietaryChecked(option: DietaryOption): boolean {
    return this.selectedDietary().includes(option);
  }

  protected toggleDietary(option: DietaryOption, checked: boolean): void {
    this.toggleInList(this.selectedDietary, option, checked);
    this.syncToUrl();
  }

  protected onMapSelect(id: string): void {
    this.mapSelectedId.set(id);
  }

  protected findCaterer(id: string): Caterer | undefined {
    return this.results().find((c) => c.id === id);
  }

  protected resetFilters(): void {
    clearTimeout(this.querySyncTimer);
    this.query.set('');
    this.minRating.set(0);
    this.selectedCategories.set([]);
    this.eventDate.set('');
    this.selectedEventTypes.set([]);
    this.selectedDietary.set([]);
    this.sort.set('relevance');
    this.viewMode.set('grid');
    this.mapSelectedId.set(null);
    this.syncToUrl();
  }

  private toggleInList<T>(
    listSignal: { (): T[]; set: (value: T[]) => void },
    item: T,
    checked: boolean,
  ): void {
    const current = listSignal();
    if (checked) {
      listSignal.set([...current, item]);
    } else {
      listSignal.set(current.filter((x) => x !== item));
    }
  }

  private syncToUrl(): void {
    const queryParams = buildSearchQueryParams({
      query: this.query(),
      minRating: this.minRating(),
      categories: this.selectedCategories(),
      eventDate: this.eventDate(),
      eventTypes: this.selectedEventTypes(),
      dietary: this.selectedDietary(),
      sort: this.sort(),
      view: this.viewMode(),
    });

    void this.router.navigate([], {
      relativeTo: this.route,
      queryParams,
      replaceUrl: true,
    });
  }
}
