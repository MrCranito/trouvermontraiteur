import { Injectable } from '@angular/core';
import { Caterer, CatererCategory } from '@trouvermontraiteur/models';
import { MOCK_CATERERS } from './mock-caterers';

export interface CatererFilters {
  query: string;
  categories: CatererCategory[];
  minRating: number;
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
}
