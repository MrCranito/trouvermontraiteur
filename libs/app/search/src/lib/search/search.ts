import { Component, computed, inject, signal } from '@angular/core';
import { takeUntilDestroyed } from '@angular/core/rxjs-interop';
import { ActivatedRoute, Router } from '@angular/router';
import { CatererService, SearchSort } from '@trouvermontraiteur/data';
import {
  CatererCategory,
  DietaryOption,
  EventType,
} from '@trouvermontraiteur/models';
import type { MapViewport } from '@trouvermontraiteur/map-base';
import { MultipleMarkersMap } from '@trouvermontraiteur/multiple-markers-map';
import { Select } from 'primeng/select';
import { FormsModule } from '@angular/forms';
import {
  buildSearchQueryParams,
  parseSearchQueryParams,
} from '../search-query-params';
import { SearchListing } from '../search-listing/search-listing';
import { SearchListingSkeleton } from '../search-listing-skeleton/search-listing-skeleton';
import {
  SearchFilterValues,
  SearchFiltersDialog,
} from '../search-filters-dialog/search-filters-dialog';
import { Button } from 'primeng/button';

@Component({
  selector: 'tmt-search',
  imports: [
    FormsModule,
    Select,
    Button,
    MultipleMarkersMap,
    SearchListing,
    SearchListingSkeleton,
    SearchFiltersDialog,
  ],
  templateUrl: './search.html',
  styleUrl: './search.scss',
})
export class Search {
  private readonly route = inject(ActivatedRoute);
  private readonly router = inject(Router);

  protected readonly sortOptions: { label: string; value: SearchSort }[] = [
    { label: 'Pertinence', value: 'relevance' },
    { label: 'Meilleure note', value: 'rating' },
    { label: "Plus d'avis", value: 'reviews' },
    { label: 'Nom (A–Z)', value: 'name' },
    { label: 'Prix croissant', value: 'price' },
  ];

  protected query = signal('');
  protected minRating = signal(0);
  protected selectedCategories = signal<CatererCategory[]>([]);
  protected eventDate = signal('');
  protected selectedEventTypes = signal<EventType[]>([]);
  protected selectedDietary = signal<DietaryOption[]>([]);
  protected sort = signal<SearchSort>('relevance');
  protected mapSelectedId = signal<string | null>(null);
  protected hoveredId = signal<string | null>(null);
  protected filtersVisible = signal(false);
  protected mapViewport = signal<MapViewport | null>(null);
  protected mapAutoFit = signal(true);
  protected mapLoading = signal(false);

  private viewportLoadToken = 0;
  private static readonly MAP_LOAD_MIN_MS = 320;
  protected static readonly LIST_SKELETON_COUNT = 6;

  protected readonly skeletonItems = Array.from(
    { length: Search.LIST_SKELETON_COUNT },
    (_, i) => i,
  );

  protected readonly highlightedId = computed(
    () => this.hoveredId() ?? this.mapSelectedId(),
  );

  protected readonly filteredByCriteria = computed(() =>
    this.catererService.filter({
      query: this.query(),
      categories: this.selectedCategories(),
      minRating: this.minRating(),
      eventDate: this.eventDate(),
      eventTypes: this.selectedEventTypes(),
      dietary: this.selectedDietary(),
    }),
  );

  /** Up to 20 caterers in the map viewport (radius + center). */
  protected readonly results = computed(() => {
    const viewport = this.mapViewport();
    if (!viewport) {
      return [];
    }
    return this.catererService.searchInMapArea(
      this.filteredByCriteria(),
      viewport,
      this.sort(),
    );
  });

  /** All caterers matching filters (for map markers and initial fit). */
  protected readonly mapCaterers = computed(() => this.filteredByCriteria());

  protected readonly resultCount = computed(() => this.results().length);

  /** Grid placeholders while the map viewport or results are updating. */
  protected readonly listLoading = computed(
    () => this.mapLoading() || this.mapViewport() === null,
  );

  protected readonly currentFilters = computed<SearchFilterValues>(() => ({
    query: this.query(),
    minRating: this.minRating(),
    categories: this.selectedCategories(),
    eventTypes: this.selectedEventTypes(),
    dietary: this.selectedDietary(),
    eventDate: this.eventDate(),
  }));

  protected readonly activeFilterCount = computed(() => {
    let count = 0;
    if (this.query().trim()) {
      count++;
    }
    if (this.minRating() > 0) {
      count++;
    }
    if (this.eventDate()) {
      count++;
    }
    if (this.selectedCategories().length > 0) {
      count++;
    }
    if (this.selectedEventTypes().length > 0) {
      count++;
    }
    if (this.selectedDietary().length > 0) {
      count++;
    }
    return count;
  });

  protected readonly filtersButtonLabel = computed(() => {
    const count = this.activeFilterCount();
    return count > 0 ? `Filtres (${count})` : 'Filtres';
  });

  protected readonly filtersButtonAriaLabel = computed(() => {
    const count = this.activeFilterCount();
    return count > 0
      ? `Filtres, ${count} critère${count > 1 ? 's' : ''} actif${count > 1 ? 's' : ''}`
      : 'Filtres';
  });

  constructor(private readonly catererService: CatererService) {
    this.route.queryParamMap.pipe(takeUntilDestroyed()).subscribe((params) => {
      const state = parseSearchQueryParams(params);
      this.query.set(state.query);
      this.minRating.set(state.minRating);
      this.selectedCategories.set(state.categories);
      this.eventDate.set(state.eventDate);
      this.selectedEventTypes.set(state.eventTypes);
      this.selectedDietary.set(state.dietary);
      this.sort.set(state.sort);
    });
  }

  protected onSortChange(value: SearchSort): void {
    this.sort.set(value);
    this.syncToUrl();
  }

  protected openFilters(): void {
    this.filtersVisible.set(true);
  }

  protected onFiltersApply(values: SearchFilterValues): void {
    this.query.set(values.query);
    this.minRating.set(values.minRating);
    this.selectedCategories.set(values.categories);
    this.selectedEventTypes.set(values.eventTypes);
    this.selectedDietary.set(values.dietary);
    this.eventDate.set(values.eventDate);
    this.mapAutoFit.set(true);
    this.syncToUrl();
  }

  protected onMapMoveStart(): void {
    this.viewportLoadToken++;
    this.mapLoading.set(true);
    this.mapSelectedId.set(null);
    this.hoveredId.set(null);
  }

  protected onMapViewportChange(viewport: MapViewport): void {
    void this.applyMapViewport(viewport);
  }

  private async applyMapViewport(viewport: MapViewport): Promise<void> {
    const token = this.viewportLoadToken;
    const startedAt = performance.now();

    await new Promise<void>((resolve) => {
      requestAnimationFrame(() => resolve());
    });

    if (token !== this.viewportLoadToken) {
      return;
    }

    this.catererService.searchInMapArea(
      this.filteredByCriteria(),
      viewport,
      this.sort(),
    );

    const elapsed = performance.now() - startedAt;
    const remaining = Search.MAP_LOAD_MIN_MS - elapsed;
    if (remaining > 0) {
      await new Promise<void>((resolve) => setTimeout(resolve, remaining));
    }

    if (token !== this.viewportLoadToken) {
      return;
    }

    this.mapViewport.set(viewport);
    this.mapAutoFit.set(false);
    this.mapLoading.set(false);
  }

  protected onListingHover(id: string | null): void {
    this.hoveredId.set(id);
  }

  protected onMapSelect(id: string): void {
    this.mapSelectedId.set(id);
  }

  protected onMapClear(): void {
    this.mapSelectedId.set(null);
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
      view: 'grid',
    });

    void this.router.navigate([], {
      relativeTo: this.route,
      queryParams,
      replaceUrl: true,
    });
  }
}
