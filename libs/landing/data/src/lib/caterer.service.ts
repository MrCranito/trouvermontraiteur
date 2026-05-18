import { Injectable } from '@angular/core';
import {
  Caterer,
  CatererCategory,
  DietaryOption,
  EventType,
} from '@trouvermontraiteur/models';
import { MOCK_CATERERS } from './mock-caterers';

export type SearchSort =
  | 'relevance'
  | 'rating'
  | 'reviews'
  | 'name'
  | 'price';

export interface CatererFilters {
  query: string;
  categories: CatererCategory[];
  minRating: number;
  eventDate: string;
  eventTypes: EventType[];
  dietary: DietaryOption[];
}

@Injectable({ providedIn: 'root' })
export class CatererService {
  private readonly caterers = MOCK_CATERERS;

  getAll(): Caterer[] {
    return [...this.caterers];
  }

  getBySlug(slug: string): Caterer | undefined {
    return this.caterers.find((c) => c.slug === slug);
  }

  filter(filters: CatererFilters): Caterer[] {
    const q = filters.query.trim().toLowerCase();

    return this.caterers.filter((caterer) => {
      if (filters.minRating > 0 && caterer.rating < filters.minRating) {
        return false;
      }

      if (filters.categories.length > 0) {
        const hasCategory = filters.categories.some((cat) =>
          caterer.categories.includes(cat),
        );
        if (!hasCategory) {
          return false;
        }
      }

      if (filters.eventDate) {
        if (caterer.unavailableDates.includes(filters.eventDate)) {
          return false;
        }
      }

      if (filters.eventTypes.length > 0) {
        const hasEvent = filters.eventTypes.some((event) =>
          caterer.eventTypes.includes(event),
        );
        if (!hasEvent) {
          return false;
        }
      }

      if (filters.dietary.length > 0) {
        const hasAllDietary = filters.dietary.every((d) =>
          caterer.dietary.includes(d),
        );
        if (!hasAllDietary) {
          return false;
        }
      }

      if (!q) {
        return true;
      }

      return (
        caterer.name.toLowerCase().includes(q) ||
        caterer.description.toLowerCase().includes(q) ||
        caterer.location.city.toLowerCase().includes(q)
      );
    });
  }

  sort(caterers: Caterer[], sort: SearchSort): Caterer[] {
    const list = [...caterers];

    switch (sort) {
      case 'rating':
        return list.sort((a, b) => b.rating - a.rating);
      case 'reviews':
        return list.sort((a, b) => b.reviewCount - a.reviewCount);
      case 'name':
        return list.sort((a, b) => a.name.localeCompare(b.name, 'fr'));
      case 'price':
        return list.sort(
          (a, b) => this.minMenuPrice(a) - this.minMenuPrice(b),
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

  private minMenuPrice(caterer: Caterer): number {
    if (caterer.menu.length === 0) {
      return Number.POSITIVE_INFINITY;
    }
    return Math.min(...caterer.menu.map((item) => item.price));
  }
}
