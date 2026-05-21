import { Injectable, computed, effect, inject, signal } from '@angular/core';
import { ConsumerAuthService } from '@trouvermontraiteur/app-auth';
import { CatererService } from '@trouvermontraiteur/data';
import { Caterer } from '@trouvermontraiteur/models';

@Injectable({ providedIn: 'root' })
export class ConsumerFavoritesService {
  private readonly auth = inject(ConsumerAuthService);
  private readonly catererService = inject(CatererService);

  private readonly favoriteIds = signal<string[]>([]);

  readonly ids = this.favoriteIds.asReadonly();

  readonly favoriteCaterers = computed((): Caterer[] => {
    const ids = new Set(this.favoriteIds());
    return this.catererService.getAll().filter((c) => ids.has(c.id));
  });

  constructor() {
    effect(() => {
      this.auth.user();
      this.reload();
    });
  }

  isFavorite(catererId: string): boolean {
    return this.favoriteIds().includes(catererId);
  }

  toggle(catererId: string): boolean {
    const next = new Set(this.favoriteIds());
    let added = false;
    if (next.has(catererId)) {
      next.delete(catererId);
    } else {
      next.add(catererId);
      added = true;
    }
    const list = [...next];
    this.favoriteIds.set(list);
    this.persist(list);
    return added;
  }

  remove(catererId: string): void {
    const list = this.favoriteIds().filter((id) => id !== catererId);
    this.favoriteIds.set(list);
    this.persist(list);
  }

  private reload(): void {
    const raw = localStorage.getItem(this.storageKey());
    if (!raw) {
      this.favoriteIds.set([]);
      return;
    }
    try {
      const parsed = JSON.parse(raw) as unknown;
      this.favoriteIds.set(
        Array.isArray(parsed)
          ? parsed.filter((id): id is string => typeof id === 'string')
          : [],
      );
    } catch {
      this.favoriteIds.set([]);
    }
  }

  private persist(ids: string[]): void {
    localStorage.setItem(this.storageKey(), JSON.stringify(ids));
  }

  private storageKey(): string {
    const userId = this.auth.user()?.id ?? 'guest';
    return `tmt:consumer-favorites:v1:${userId}`;
  }
}
