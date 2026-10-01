import {
  Injectable,
  Injector,
  computed,
  effect,
  inject,
  signal,
} from '@angular/core';
import { FavoriteService } from '@trouvermontraiteur/api';
import { ConsumerAuthService } from '@trouvermontraiteur/app-auth';
import { Craftsman } from '@trouvermontraiteur/models';
import { AppCraftsmanCatalogService } from './app-craftsman-catalog.service';

@Injectable({ providedIn: 'root' })
export class ConsumerFavoritesService {
  private readonly auth = inject(ConsumerAuthService);
  private readonly favoriteApi = inject(FavoriteService);
  private readonly injector = inject(Injector);
  private catalogRef: AppCraftsmanCatalogService | null = null;

  private readonly favoriteIds = signal<string[]>([]);
  private readonly loading = signal(false);
  private readonly ready = signal(false);

  readonly ids = this.favoriteIds.asReadonly();
  readonly isReady = this.ready.asReadonly();

  /**
   * Stays true until favorite ids and, when there are any, the catalog
   * used to resolve them are both ready. The catalog is created only then,
   * so a craftsman details page can check ids without loading every craftsman.
   */
  readonly isLoading = computed(() => {
    if (this.loading() || !this.ready()) {
      return true;
    }
    if (this.favoriteIds().length === 0) {
      return false;
    }
    return !this.catalog().isReady();
  });

  readonly favoriteCraftsmen = computed((): Craftsman[] => {
    const ids = new Set(this.favoriteIds());
    if (ids.size === 0) {
      return [];
    }
    return this.catalog().getAll().filter((c) => ids.has(c.id));
  });

  private catalog(): AppCraftsmanCatalogService {
    this.catalogRef ??= this.injector.get(AppCraftsmanCatalogService);
    return this.catalogRef;
  }

  /** @deprecated Use favoriteCraftsmen */
  readonly favoriteCaterers = this.favoriteCraftsmen;

  constructor() {
    effect(() => {
      if (!this.auth.isReady()) {
        return;
      }

      const userId = this.auth.user()?.id ?? null;
      if (!userId) {
        this.favoriteIds.set([]);
        this.ready.set(true);
        return;
      }

      void this.load();
    });
  }

  isFavorite(craftsmanId: string): boolean {
    return this.favoriteIds().includes(craftsmanId);
  }

  async load(): Promise<void> {
    if (!this.auth.isAuthenticated()) {
      this.favoriteIds.set([]);
      this.ready.set(true);
      return;
    }

    this.loading.set(true);

    try {
      const favorites = await this.favoriteApi.getAll();
      this.favoriteIds.set(favorites.map((item) => item.craftsmanId));
    } catch {
      this.favoriteIds.set([]);
    } finally {
      this.loading.set(false);
      this.ready.set(true);
    }
  }

  async toggle(craftsmanId: string): Promise<boolean> {
    if (!this.auth.isAuthenticated()) {
      return false;
    }

    const wasFavorite = this.isFavorite(craftsmanId);

    if (wasFavorite) {
      this.favoriteIds.update((ids) => ids.filter((id) => id !== craftsmanId));
      try {
        await this.favoriteApi.remove(craftsmanId);
        return false;
      } catch (err) {
        this.favoriteIds.update((ids) => [...ids, craftsmanId]);
        throw err;
      }
    }

    this.favoriteIds.update((ids) => [...ids, craftsmanId]);
    try {
      await this.favoriteApi.add(craftsmanId);
      return true;
    } catch (err) {
      this.favoriteIds.update((ids) => ids.filter((id) => id !== craftsmanId));
      throw err;
    }
  }

  async remove(craftsmanId: string): Promise<void> {
    if (!this.isFavorite(craftsmanId)) {
      return;
    }
    await this.toggle(craftsmanId);
  }
}
