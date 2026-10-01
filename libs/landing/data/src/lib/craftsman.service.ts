import { Injectable } from '@angular/core';
import {
  Craftsman,
  CraftsmanTrade,
  ProjectType,
  ServiceOption,
} from '@trouvermontraiteur/models';
import {
  filterCraftsmenByRadius,
  sortCraftsmenByDistanceFrom,
  type MapViewport,
} from '@trouvermontraiteur/map-base';
import { MOCK_CRAFTSMEN } from './mock-craftsmen';
import { normalizeCraftsmanTrade } from './trade-labels';

export type { MapViewport };

/** Max craftsmen returned for a map-area search (radius + center). */
export const SEARCH_RESULTS_LIMIT = 20;

export type SearchSort =
  | 'relevance'
  | 'rating'
  | 'reviews'
  | 'name'
  | 'price';

export interface CraftsmanFilters {
  query: string;
  trades: CraftsmanTrade[];
  subCategoryIds: string[];
  minRating: number;
  projectDate: string;
  projectTypes: ProjectType[];
  serviceOptions: ServiceOption[];
}

@Injectable({ providedIn: 'root' })
export class CraftsmanService {
  private readonly craftsmen = MOCK_CRAFTSMEN;

  getAll(): Craftsman[] {
    return [...this.craftsmen];
  }

  getBySlug(slug: string): Craftsman | undefined {
    return this.craftsmen.find((c) => c.slug === slug);
  }

  /** Craftsmen within the map viewport circle (center + screen-proportional radius). */
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

  /**
   * Craftsmen in the map viewport, ordered by distance (relevance) or sort, capped at `limit`.
   */
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

    return this.craftsmen.filter((craftsman) => {
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
        } else if (
          craftsman.unavailableDates.includes(filters.projectDate)
        ) {
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
        craftsman.location.city.toLowerCase().includes(q)
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
}
