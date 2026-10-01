import { computed, inject, Injectable, signal } from '@angular/core';
import {
  CategoryService,
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
  SubCategory,
} from '@trouvermontraiteur/models';

export type { MapViewport, SearchSort, CraftsmanFilters };
export { SEARCH_RESULTS_LIMIT };

@Injectable({ providedIn: 'root' })
export class AppCraftsmanCatalogService {
  private readonly craftsmanApi = inject(CraftsmanApiService);
  private readonly categoryApi = inject(CategoryService);

  private readonly craftsmans = signal<Craftsman[]>([]);
  private readonly categories = signal<Category[]>([]);
  private readonly loading = signal(false);
  private readonly ready = signal(false);
  private readonly error = signal<unknown>(null);

  readonly craftsmenSignal = this.craftsmans.asReadonly();
  readonly categoriesSignal = this.categories.asReadonly();
  readonly subCategoriesSignal = computed(() =>
    this.categories().flatMap((category) => category.subCategories),
  );
  readonly isLoading = this.loading.asReadonly();
  readonly isReady = this.ready.asReadonly();
  readonly loadError = this.error.asReadonly();

  constructor() {
    void this.load();
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

  async load(): Promise<void> {
    if (this.loading()) {
      return;
    }

    this.loading.set(true);
    this.error.set(null);

    try {
      const [craftsmanRecords, categories] = await Promise.all([
        this.craftsmanApi.getAll(),
        this.categoryApi.getAll(),
      ]);

      const craftsmansPublished = craftsmanRecords.filter(
        (item) => item.published && item.deleted_at === null,
      );

      this.categories.set(categories);
      this.craftsmans.set(craftsmansPublished);
    } catch (err) {
      this.error.set(err);
      this.craftsmans.set([]);
      this.categories.set([]);
    } finally {
      this.loading.set(false);
      this.ready.set(true);
    }
  }
}
