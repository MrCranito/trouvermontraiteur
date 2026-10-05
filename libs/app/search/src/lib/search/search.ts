import { Component, computed, effect, inject, signal } from '@angular/core';
import { takeUntilDestroyed } from '@angular/core/rxjs-interop';
import { ActivatedRoute, Router } from '@angular/router';
import {
  AppCraftsmanCatalogService,
  CraftsmanFilters,
  CraftsmanPage,
  SearchSort,
} from '@trouvermontraiteur/app-consumer-data';
import { CategoryI18nService } from '@trouvermontraiteur/app-i18n';
import {
  lookupFrenchCityByName,
  preloadFrenchCities,
} from '@trouvermontraiteur/data';
import {
  CraftsmanTrade,
  ProjectType,
  ServiceOption,
} from '@trouvermontraiteur/models';
import type { MapFocus, MapViewport } from '@trouvermontraiteur/map-base';
import { MultipleMarkersMap } from '@trouvermontraiteur/multiple-markers-map';
import { Select } from 'primeng/select';
import { FormsModule } from '@angular/forms';
import {
  buildSearchQueryParams,
  parseSearchQueryParams,
} from '../search-query-params';
import {
  buildSearchResultsTitle,
  resolveTradeDisplayLabel,
  resolveTradeFamilyLabel,
} from './search-results-title';
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
  private readonly categoryI18n = inject(CategoryI18nService);

  protected readonly sortOptions: { label: string; value: SearchSort }[] = [
    { label: 'Pertinence', value: 'relevance' },
    { label: 'Meilleure note', value: 'rating' },
    { label: "Plus d'avis", value: 'reviews' },
    { label: 'Nom (A–Z)', value: 'name' },
    { label: 'Prix croissant', value: 'price' },
  ];

  protected query = signal('');
  protected minRating = signal(0);
  protected selectedTrades = signal<CraftsmanTrade[]>([]);
  protected selectedSubCategoryIds = signal<string[]>([]);
  protected projectDate = signal('');
  protected selectedProjectTypes = signal<ProjectType[]>([]);
  protected selectedServiceOptions = signal<ServiceOption[]>([]);
  protected sort = signal<SearchSort | null>(null);
  protected mapSelectedId = signal<string | null>(null);
  protected hoveredId = signal<string | null>(null);
  protected filtersVisible = signal(false);
  protected mapViewport = signal<MapViewport | null>(null);
  protected mapAutoFit = signal(true);
  protected mapLoading = signal(false);
  protected mapLat = signal<number | null>(null);
  protected mapLng = signal<number | null>(null);
  /** Ville affichée dans le titre (recherche discover ou filtre lieu). */
  protected cityDisplayName = signal<string | null>(null);
  /** Carte déplacée manuellement par l'utilisateur (après chargement initial). */
  protected userMovedMap = signal(false);
  private mapTitleUnlocked = false;

  protected readonly mapFocus = computed((): MapFocus | null => {
    const lat = this.mapLat();
    const lng = this.mapLng();
    if (lat === null || lng === null) {
      return null;
    }
    return { lat, lng, zoom: 11 };
  });

  private viewportLoadToken = 0;
  /** Évite de recentrer la carte après « Supprimer tous les filtres » (sync URL). */
  private preserveMapOnNextRouteSync = false;
  private static readonly MAP_LOAD_MIN_MS = 320;
  protected static readonly LIST_SKELETON_COUNT = 6;

  protected readonly skeletonItems = Array.from(
    { length: Search.LIST_SKELETON_COUNT },
    (_, i) => i,
  );

  protected readonly highlightedId = computed(
    () => this.hoveredId() ?? this.mapSelectedId(),
  );

  private readonly page = signal<CraftsmanPage>({
    items: [],
    from: 0,
    to: -1,
    total: 0,
  });
  private readonly resultsLoading = signal(false);
  private searchToken = 0;

  /** First page of craftsmen matching the filters inside the map bounds. */
  protected readonly results = computed(() => this.page().items);

  /** Same page, used to frame the map when auto-fit is on. */
  protected readonly mapCraftsmen = computed(() => this.page().items);

  protected readonly resultCount = computed(() => this.page().total);

  private readonly metierTitle = computed(() => {
    this.categoryI18n.activeLang();
    const ids = this.selectedSubCategoryIds();
    if (ids.length === 0) {
      return {
        tradeLabel: resolveTradeDisplayLabel(this.selectedTrades()),
        familyLabel: resolveTradeFamilyLabel(this.selectedTrades()),
        singleTrade: this.selectedTrades().length === 1,
      };
    }

    const selected = new Set(ids);
    const matched = [...this.craftsmanService.categoriesSignal()]
      .map((category) => ({
        category,
        subs: category.subCategories.filter((sub) => selected.has(sub.id)),
      }))
      .filter((entry) => entry.subs.length > 0);

    if (matched.length !== 1) {
      return { tradeLabel: null, familyLabel: null, singleTrade: false };
    }

    const { category, subs } = matched[0];
    const familyLabel = this.categoryI18n.name(category);
    if (subs.length === 1) {
      return {
        tradeLabel: this.categoryI18n.subCategoryLabel(subs[0]),
        familyLabel,
        singleTrade: true,
      };
    }

    return { tradeLabel: familyLabel, familyLabel, singleTrade: false };
  });

  protected readonly resultsTitle = computed(() =>
    buildSearchResultsTitle({
      count: this.resultCount(),
      loading: this.listLoading(),
      userMovedMap: this.userMovedMap(),
      cityName: this.cityDisplayName(),
      projectDate: this.projectDate(),
      ...this.metierTitle(),
    }),
  );

  /** Grid placeholders while the map viewport or results are updating. */
  protected readonly listLoading = computed(
    () =>
      this.mapLoading() ||
      this.resultsLoading() ||
      this.mapViewport() === null,
  );

  protected readonly currentFilters = computed<SearchFilterValues>(() => ({
    query: this.query(),
    minRating: this.minRating(),
    trades: this.selectedTrades(),
    subCategoryIds: this.selectedSubCategoryIds(),
    projectTypes: this.selectedProjectTypes(),
    serviceOptions: this.selectedServiceOptions(),
    projectDate: this.projectDate(),
  }));

  protected readonly activeFilterCount = computed(() => {
    let count = 0;
    if (this.query().trim()) {
      count++;
    }
    if (this.minRating() > 0) {
      count++;
    }
    if (this.projectDate()) {
      count++;
    }
    if (
      this.selectedTrades().length > 0 ||
      this.selectedSubCategoryIds().length > 0
    ) {
      count++;
    }
    if (this.selectedProjectTypes().length > 0) {
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

  constructor(private readonly craftsmanService: AppCraftsmanCatalogService) {
    void this.craftsmanService.ensureFullCatalog();

    this.route.queryParamMap.pipe(takeUntilDestroyed()).subscribe((params) => {
      const state = parseSearchQueryParams(params);
      this.query.set(state.query);
      this.minRating.set(state.minRating);
      this.selectedTrades.set(state.trades);
      this.selectedSubCategoryIds.set(state.subCategoryIds);
      this.projectDate.set(state.projectDate);
      this.selectedProjectTypes.set(state.projectTypes);
      this.selectedServiceOptions.set(state.serviceOptions);
      this.sort.set(state.sort);

      if (this.preserveMapOnNextRouteSync) {
        this.preserveMapOnNextRouteSync = false;
        return;
      }

      this.userMovedMap.set(false);
      this.mapTitleUnlocked = false;
      this.applyMapCoordinates(state.mapLat, state.mapLng, state.query);
    });

    effect(() => {
      const viewport = this.mapViewport();
      const sort = this.sort();
      const filters = this.searchFilters();
      const ready = this.craftsmanService.isReady();
      if (!viewport || !ready) {
        return;
      }
      void this.loadResults(viewport, filters, sort);
    });
  }

  private searchFilters(): CraftsmanFilters {
    return {
      query: this.query(),
      trades:
        this.selectedSubCategoryIds().length > 0 ? [] : this.selectedTrades(),
      subCategoryIds: this.selectedSubCategoryIds(),
      minRating: this.minRating(),
      projectDate: this.projectDate(),
      projectTypes: this.selectedProjectTypes(),
      serviceOptions: [],
    };
  }

  private async loadResults(
    viewport: MapViewport,
    filters: CraftsmanFilters,
    sort: SearchSort | null,
  ): Promise<void> {
    const token = ++this.searchToken;
    this.resultsLoading.set(true);

    try {
      const page = await this.craftsmanService.search(filters, {
        sort,
        bounds: boundsFromViewport(viewport),
      });
      if (token !== this.searchToken) {
        return;
      }
      this.page.set(page);
    } catch {
      if (token !== this.searchToken) {
        return;
      }
      this.page.set({ items: [], from: 0, to: -1, total: 0 });
    } finally {
      if (token === this.searchToken) {
        this.resultsLoading.set(false);
      }
    }
  }

  private applyMapCoordinates(
    lat: number | null,
    lng: number | null,
    query: string,
  ): void {
    const trimmed = query.trim();
    this.cityDisplayName.set(trimmed || null);

    if (lat !== null && lng !== null) {
      this.mapLat.set(lat);
      this.mapLng.set(lng);
      this.mapAutoFit.set(false);
      return;
    }

    this.mapLat.set(null);
    this.mapLng.set(null);
    this.mapAutoFit.set(true);

    if (!trimmed) {
      return;
    }

    void preloadFrenchCities().then(() => {
      const city = lookupFrenchCityByName(trimmed);
      if (city) {
        this.mapLat.set(city.lat);
        this.mapLng.set(city.lng);
        this.mapAutoFit.set(false);
        this.cityDisplayName.set(city.name);
      }
    });
  }

  protected onSortChange(value: SearchSort | null): void {
    this.sort.set(value);
    this.syncToUrl();
  }

  protected openFilters(): void {
    this.filtersVisible.set(true);
  }

  protected readonly hasActiveFilters = computed(() => this.activeFilterCount() > 0);

  protected clearAllFilters(): void {
    this.query.set('');
    this.minRating.set(0);
    this.selectedTrades.set([]);
    this.selectedSubCategoryIds.set([]);
    this.selectedProjectTypes.set([]);
    this.selectedServiceOptions.set([]);
    this.projectDate.set('');
    this.cityDisplayName.set(null);
    this.preserveMapOnNextRouteSync = true;
    this.syncToUrl();
  }

  protected onFiltersApply(values: SearchFilterValues): void {
    this.mapLoading.set(true);
    this.cityDisplayName.set(values.query.trim() || null);
    this.query.set(values.query);
    this.minRating.set(values.minRating);
    this.selectedSubCategoryIds.set(values.subCategoryIds);
    this.selectedTrades.set(
      values.subCategoryIds.length > 0 ? [] : values.trades,
    );
    this.selectedProjectTypes.set([]);
    this.selectedServiceOptions.set([]);
    this.projectDate.set(values.projectDate);
    this.mapAutoFit.set(true);
    this.applyMapCoordinates(null, null, values.query);
    this.syncToUrl();
  }

  protected onMapMoveStart(): void {
    if (this.mapTitleUnlocked) {
      this.userMovedMap.set(true);
    }
    this.viewportLoadToken++;
    this.mapLoading.set(true);
    this.mapSelectedId.set(null);
    this.hoveredId.set(null);
  }

  protected onMapViewportChange(viewport: MapViewport): void {
    if (isSameMapViewport(this.mapViewport(), viewport)) {
      return;
    }
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
    this.mapTitleUnlocked = true;
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
      trades: this.selectedTrades(),
      subCategoryIds: this.selectedSubCategoryIds(),
      projectDate: this.projectDate(),
      projectTypes: this.selectedProjectTypes(),
      serviceOptions: this.selectedServiceOptions(),
      sort: this.sort(),
      view: 'grid',
      mapLat: this.mapLat(),
      mapLng: this.mapLng(),
    });

    void this.router.navigate([], {
      relativeTo: this.route,
      queryParams,
      replaceUrl: true,
    });
  }
}

function isSameMapViewport(
  current: MapViewport | null,
  next: MapViewport,
): boolean {
  if (!current) {
    return false;
  }
  const latDelta = Math.abs(current.center.lat - next.center.lat);
  const lngDelta = Math.abs(current.center.lng - next.center.lng);
  const radiusDelta = Math.abs(current.radiusMeters - next.radiusMeters);
  return latDelta < 0.00005 && lngDelta < 0.00005 && radiusDelta < 25;
}

function boundsFromViewport(viewport: MapViewport): {
  minLat: number;
  maxLat: number;
  minLng: number;
  maxLng: number;
} {
  const lat = viewport.center.lat;
  const lng = viewport.center.lng;
  const latDelta = viewport.radiusMeters / 111_320;
  const lngScale = Math.cos((lat * Math.PI) / 180);
  const lngDelta =
    viewport.radiusMeters / (111_320 * Math.max(Math.abs(lngScale), 0.01));

  return {
    minLat: lat - latDelta,
    maxLat: lat + latDelta,
    minLng: lng - lngDelta,
    maxLng: lng + lngDelta,
  };
}
