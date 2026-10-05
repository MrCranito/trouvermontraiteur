import { computed, inject, Injectable, signal } from '@angular/core';
import {
  CategoryService,
  CraftsmanPage,
  CraftsmanSearchBounds,
  CraftsmanService as CraftsmanApiService,
} from '@trouvermontraiteur/api';
import {
  CraftsmanFilters,
  normalizeCraftsmanTrade,
  SEARCH_RESULTS_LIMIT,
  SearchSort,
} from '@trouvermontraiteur/data';
import {
  filterCraftsmenByRadius,
  sortCraftsmenByDistanceFrom,
  type MapViewport,
} from '@trouvermontraiteur/map-base';
import {
  Category,
  Craftsman,
  CraftsmanTrade,
  resolveCraftsmanTradeFromSubCategoryLabel,
  resolveSubCategoryTranslation,
  SubCategory,
} from '@trouvermontraiteur/models';

export type { MapViewport, SearchSort, CraftsmanFilters, CraftsmanPage };
export { SEARCH_RESULTS_LIMIT };

export interface CraftsmanSearchOptions {
  page?: number;
  pageSize?: number;
  sort?: SearchSort | null;
  bounds?: CraftsmanSearchBounds;
}

const DISCOVER_PREVIEW_PER_CATEGORY = 10;

@Injectable({ providedIn: 'root' })
export class AppCraftsmanCatalogService {
  private readonly craftsmanApi = inject(CraftsmanApiService);
  private readonly categoryApi = inject(CategoryService);

  private readonly craftsmans = signal<Craftsman[]>([]);
  private readonly categories = signal<Category[]>([]);
  private readonly discoverByCategory = signal<Record<string, Craftsman[]>>({});
  private readonly discoverLoadingByCategory = signal<Record<string, boolean>>(
    {},
  );
  private readonly discoverBySubCategory = signal<Record<string, Craftsman[]>>(
    {},
  );
  private readonly discoverLoadingBySubCategory = signal<
    Record<string, boolean>
  >({});
  private readonly loading = signal(false);
  private readonly ready = signal(false);
  private readonly error = signal<unknown>(null);
  private readonly fullCatalogLoaded = signal(false);
  private loadPromise: Promise<void> | null = null;
  private categoriesPromise: Promise<void> | null = null;
  private readonly categoryPreviewPromises = new Map<
    string,
    Promise<Craftsman[]>
  >();
  private readonly subCategoryPreviewPromises = new Map<
    string,
    Promise<Craftsman[]>
  >();

  readonly craftsmenSignal = this.craftsmans.asReadonly();
  readonly categoriesSignal = this.categories.asReadonly();
  readonly subCategoriesSignal = computed(() =>
    this.categories().flatMap((category) => category.subCategories),
  );
  readonly isLoading = this.loading.asReadonly();
  readonly isReady = this.ready.asReadonly();
  readonly loadError = this.error.asReadonly();

  constructor() {
    void this.ensureCategories().then(() => {
      this.ready.set(true);
    });
  }

  getAll(): Craftsman[] {
    return this.craftsmans();
  }

  getBySlug(slug: string): Craftsman | undefined {
    return this.craftsmans().find((craftsman) => craftsman.slug === slug);
  }

  getSubCategoriesForCategory(categoryId: string): SubCategory[] {
    const category = this.categories().find((item) => item.id === categoryId);
    return [...(category?.subCategories ?? [])].sort(
      (a, b) => a.order - b.order,
    );
  }

  async search(
    filters: CraftsmanFilters,
    options: CraftsmanSearchOptions = {},
  ): Promise<CraftsmanPage> {
    const page = options.page ?? 0;
    const pageSize = options.pageSize ?? SEARCH_RESULTS_LIMIT;
    const from = Math.max(0, page) * Math.max(1, pageSize);

    if (filters.projectTypes.length > 0 || filters.serviceOptions.length > 0) {
      return { items: [], from, to: -1, total: 0 };
    }

    const subCategoryIds = this.resolveSubCategoryIds(filters);
    const categoryFilterRequested =
      filters.subCategoryIds.length > 0 || filters.trades.length > 0;
    if (categoryFilterRequested && subCategoryIds.length === 0) {
      return { items: [], from, to: -1, total: 0 };
    }

    return this.craftsmanApi.search(
      {
        query: filters.query,
        subCategoryIds,
        minRating: filters.minRating,
        projectDate: filters.projectDate,
        bounds: options.bounds,
      },
      page,
      pageSize,
      options.sort === undefined ? 'relevance' : (options.sort ?? undefined),
    );
  }

  filterByMapViewport(
    craftsmen: Craftsman[],
    viewport: MapViewport,
  ): Craftsman[] {
    return filterCraftsmenByRadius(
      craftsmen,
      viewport.center,
      viewport.radiusMeters,
    );
  }

  searchInMapArea(
    craftsmen: Craftsman[],
    viewport: MapViewport,
    sort: SearchSort,
    limit = SEARCH_RESULTS_LIMIT,
  ): Craftsman[] {
    const inView = this.filterByMapViewport(craftsmen, viewport);
    const ordered =
      sort === 'relevance'
        ? sortCraftsmenByDistanceFrom(inView, viewport.center)
        : this.sort(inView, sort);
    return ordered.slice(0, limit);
  }

  filter(filters: CraftsmanFilters): Craftsman[] {
    const q = filters.query.trim().toLowerCase();

    return this.craftsmans().filter((craftsman) => {
      if (filters.minRating > 0 && craftsman.rating < filters.minRating) {
        return false;
      }

      if (filters.subCategoryIds.length > 0) {
        const selected = new Set(filters.subCategoryIds);
        const hasSubCategory = craftsman.subCategoryIds.some((id) =>
          selected.has(id),
        );
        if (!hasSubCategory) {
          return false;
        }
      } else if (filters.trades.length > 0) {
        const craftsmanTrades = new Set(
          craftsman.trades
            .map((trade) => normalizeCraftsmanTrade(trade))
            .filter((trade): trade is CraftsmanTrade => trade !== null),
        );
        const hasTrade = filters.trades.some((trade) =>
          craftsmanTrades.has(trade),
        );
        if (!hasTrade) {
          return false;
        }
      }

      if (filters.projectDate) {
        const explicit = craftsman.availableDates.length > 0;
        if (explicit) {
          if (!craftsman.availableDates.includes(filters.projectDate)) {
            return false;
          }
        } else if (craftsman.unavailableDates.includes(filters.projectDate)) {
          return false;
        }
      }

      if (filters.projectTypes.length > 0) {
        const hasProject = filters.projectTypes.some((project) =>
          craftsman.projectTypes.includes(project),
        );
        if (!hasProject) {
          return false;
        }
      }

      if (filters.serviceOptions.length > 0) {
        const hasAllOptions = filters.serviceOptions.every((option) =>
          craftsman.serviceOptions.includes(option),
        );
        if (!hasAllOptions) {
          return false;
        }
      }

      if (!q) {
        return true;
      }

      return (
        craftsman.name.toLowerCase().includes(q) ||
        craftsman.description.toLowerCase().includes(q) ||
        craftsman.location.city.toLowerCase().includes(q) ||
        craftsman.location.address.toLowerCase().includes(q)
      );
    });
  }

  sort(craftsmen: Craftsman[], sort: SearchSort): Craftsman[] {
    const list = [...craftsmen];

    switch (sort) {
      case 'rating':
        return list.sort((a, b) => b.rating - a.rating);
      case 'reviews':
        return list.sort((a, b) => b.reviewCount - a.reviewCount);
      case 'name':
        return list.sort((a, b) => a.name.localeCompare(b.name, 'fr'));
      case 'price':
        return list.sort(
          (a, b) => this.minServicePrice(a) - this.minServicePrice(b),
        );
      case 'relevance':
      default:
        return list.sort(
          (a, b) =>
            b.rating * Math.log10(b.reviewCount + 1) -
            a.rating * Math.log10(a.reviewCount + 1),
        );
    }
  }

  private minServicePrice(craftsman: Craftsman): number {
    if (craftsman.services.length === 0) {
      return Number.POSITIVE_INFINITY;
    }
    return Math.min(...craftsman.services.map((item) => item.price));
  }

  async ensureCategories(): Promise<void> {
    if (this.categories().length > 0) {
      return;
    }
    if (this.categoriesPromise) {
      return this.categoriesPromise;
    }

    this.categoriesPromise = (async () => {
      try {
        const categories = await this.categoryApi.getAll();
        this.categories.set(categories);
      } catch (err) {
        this.error.set(err);
        this.categories.set([]);
      } finally {
        this.categoriesPromise = null;
      }
    })();

    return this.categoriesPromise;
  }

  /** Home page: load the first N craftsmen for one main category. */
  getCategoryPreview(categoryId: string): Craftsman[] {
    if (this.fullCatalogLoaded()) {
      return this.sliceForCategory(this.craftsmans(), categoryId, DISCOVER_PREVIEW_PER_CATEGORY);
    }
    return this.discoverByCategory()[categoryId] ?? [];
  }

  isCategoryPreviewLoading(categoryId: string): boolean {
    if (this.fullCatalogLoaded()) {
      return false;
    }
    return this.discoverLoadingByCategory()[categoryId] === true;
  }

  async loadCategoryPreview(
    categoryId: string,
    limit = DISCOVER_PREVIEW_PER_CATEGORY,
  ): Promise<Craftsman[]> {
    if (this.fullCatalogLoaded()) {
      return this.getCategoryPreview(categoryId);
    }

    const cached = this.discoverByCategory()[categoryId];
    if (cached) {
      return cached;
    }

    const pending = this.categoryPreviewPromises.get(categoryId);
    if (pending) {
      return pending;
    }

    const promise = (async () => {
      this.discoverLoadingByCategory.update((state) => ({
        ...state,
        [categoryId]: true,
      }));

      try {
        const items = await this.craftsmanApi.getByCategoryId(
          categoryId,
          limit,
        );
        this.discoverByCategory.update((state) => ({
          ...state,
          [categoryId]: items,
        }));
        this.mergeCraftsmen(items);
        return items;
      } catch (err) {
        this.error.set(err);
        this.discoverByCategory.update((state) => ({
          ...state,
          [categoryId]: [],
        }));
        return [];
      } finally {
        this.discoverLoadingByCategory.update((state) => ({
          ...state,
          [categoryId]: false,
        }));
        this.categoryPreviewPromises.delete(categoryId);
      }
    })();

    this.categoryPreviewPromises.set(categoryId, promise);
    return promise;
  }

  getSubCategoryPreview(subCategoryId: string): Craftsman[] {
    if (this.fullCatalogLoaded()) {
      return this.craftsmans()
        .filter((craftsman) =>
          craftsman.subCategoryIds.includes(subCategoryId),
        )
        .slice(0, DISCOVER_PREVIEW_PER_CATEGORY);
    }
    return this.discoverBySubCategory()[subCategoryId] ?? [];
  }

  isSubCategoryPreviewLoading(subCategoryId: string): boolean {
    if (this.fullCatalogLoaded()) {
      return false;
    }
    return this.discoverLoadingBySubCategory()[subCategoryId] === true;
  }

  async loadSubCategoryPreview(
    subCategoryId: string,
    limit = DISCOVER_PREVIEW_PER_CATEGORY,
  ): Promise<Craftsman[]> {
    if (this.fullCatalogLoaded()) {
      return this.getSubCategoryPreview(subCategoryId);
    }

    const cached = this.discoverBySubCategory()[subCategoryId];
    if (cached) {
      return cached;
    }

    const pending = this.subCategoryPreviewPromises.get(subCategoryId);
    if (pending) {
      return pending;
    }

    const promise = (async () => {
      this.discoverLoadingBySubCategory.update((state) => ({
        ...state,
        [subCategoryId]: true,
      }));

      try {
        const items = await this.craftsmanApi.getBySubCategoryId(
          subCategoryId,
          limit,
        );
        this.discoverBySubCategory.update((state) => ({
          ...state,
          [subCategoryId]: items,
        }));
        this.mergeCraftsmen(items);
        return items;
      } catch (err) {
        this.error.set(err);
        this.discoverBySubCategory.update((state) => ({
          ...state,
          [subCategoryId]: [],
        }));
        return [];
      } finally {
        this.discoverLoadingBySubCategory.update((state) => ({
          ...state,
          [subCategoryId]: false,
        }));
        this.subCategoryPreviewPromises.delete(subCategoryId);
      }
    })();

    this.subCategoryPreviewPromises.set(subCategoryId, promise);
    return promise;
  }

  async loadSubCategoryPreviewsForCategory(
    categoryId: string,
    limit = DISCOVER_PREVIEW_PER_CATEGORY,
  ): Promise<void> {
    await this.ensureCategories();
    const subCategories = this.getSubCategoriesForCategory(categoryId);
    await Promise.all(
      subCategories.map((subCategory) =>
        this.loadSubCategoryPreview(subCategory.id, limit),
      ),
    );
  }

  /** @deprecated Prefer loadCategoryPreview per category. */
  async loadDiscoverPreview(
    limitPerCategory = DISCOVER_PREVIEW_PER_CATEGORY,
  ): Promise<void> {
    await this.ensureCategories();
    await Promise.all(
      this.categories().map((category) =>
        this.loadCategoryPreview(category.id, limitPerCategory),
      ),
    );
  }

  /** Full published catalog (explorer / search). */
  async load(): Promise<void> {
    if (this.fullCatalogLoaded()) {
      this.ready.set(true);
      return;
    }
    if (this.loadPromise) {
      return this.loadPromise;
    }

    this.loadPromise = this.runLoad(async () => {
      const [craftsmanRecords, categories] = await Promise.all([
        this.craftsmanApi.getAll(),
        this.categoryApi.getAll(),
      ]);

      this.categories.set(categories);
      this.craftsmans.set(craftsmanRecords);
      this.fullCatalogLoaded.set(true);
    }).finally(() => {
      this.loadPromise = null;
    });

    return this.loadPromise;
  }

  async ensureFullCatalog(): Promise<void> {
    return this.load();
  }

  async getByIds(ids: string[]): Promise<Craftsman[]> {
    const uniqueIds = [...new Set(ids.filter(Boolean))];
    if (uniqueIds.length === 0) {
      return [];
    }

    const cached = this.craftsmans();
    const byId = new Map(cached.map((item) => [item.id, item]));
    const missing = uniqueIds.filter((id) => !byId.has(id));

    if (missing.length > 0) {
      const fetched = await this.craftsmanApi.getByIds(missing);
      for (const item of fetched) {
        byId.set(item.id, item);
      }
      if (!this.fullCatalogLoaded()) {
        this.craftsmans.set([...byId.values()]);
      }
    }

    return uniqueIds
      .map((id) => byId.get(id))
      .filter((item): item is Craftsman => item !== undefined);
  }

  private mergeCraftsmen(items: Craftsman[]): void {
    if (this.fullCatalogLoaded() || items.length === 0) {
      return;
    }
    const byId = new Map(this.craftsmans().map((item) => [item.id, item]));
    for (const item of items) {
      byId.set(item.id, item);
    }
    this.craftsmans.set([...byId.values()]);
  }

  private sliceForCategory(
    all: Craftsman[],
    categoryId: string,
    limit: number,
  ): Craftsman[] {
    const subCategoryIds = new Set(
      this.getSubCategoriesForCategory(categoryId).map((item) => item.id),
    );
    if (subCategoryIds.size === 0) {
      return [];
    }
    return all
      .filter((craftsman) =>
        craftsman.subCategoryIds.some((id) => subCategoryIds.has(id)),
      )
      .slice(0, limit);
  }

  private async runLoad(work: () => Promise<void>): Promise<void> {
    this.loading.set(true);
    this.error.set(null);

    try {
      await work();
    } catch (err) {
      this.error.set(err);
      if (!this.fullCatalogLoaded()) {
        this.craftsmans.set([]);
      }
    } finally {
      this.loading.set(false);
      this.ready.set(true);
    }
  }

  private resolveSubCategoryIds(filters: CraftsmanFilters): string[] {
    if (filters.subCategoryIds.length > 0) {
      return filters.subCategoryIds;
    }
    if (filters.trades.length === 0) {
      return [];
    }

    const wanted = new Set(filters.trades);
    return this.subCategoriesSignal()
      .filter((subCategory) => {
        const trade = resolveCraftsmanTradeFromSubCategoryLabel(
          resolveSubCategoryTranslation(subCategory, 'fr'),
        );
        return trade !== null && wanted.has(trade);
      })
      .map((subCategory) => subCategory.id);
  }
}
