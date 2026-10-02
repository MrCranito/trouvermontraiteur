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
  private readonly favoriteCraftsmenList = signal<Craftsman[]>([]);
  private readonly loading = signal(false);
  private readonly ready = signal(false);

  readonly ids = this.favoriteIds.asReadonly();
  readonly isReady = this.ready.asReadonly();

  /**
   * Stays true until favorite ids and, when there are any, the craftsmen
   * used to resolve them are both ready.
   */
  readonly isLoading = computed(() => {
    if (this.loading() || !this.ready()) {
      return true;
    }
    return false;
  });

  readonly favoriteCraftsmen = this.favoriteCraftsmenList.asReadonly();

  private catalog(): AppCraftsmanCatalogService {
    this.catalogRef ??= this.injector.get(AppCraftsmanCatalogService);
    return this.catalogRef;
  }

  /** @deprecated Use favoriteCraftsmen */
  readonly favoriteCaterers = this.favoriteCraftsmen;

  constructor() {
    let loadedForUserId: string | null | undefined;

    effect(() => {
      if (!this.auth.isReady()) {
        return;
      }

      const userId = this.auth.user()?.id ?? null;
      if (userId === loadedForUserId) {
        return;
      }
      loadedForUserId = userId;

      if (!userId) {
        this.favoriteIds.set([]);
        this.favoriteCraftsmenList.set([]);
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
      this.favoriteCraftsmenList.set([]);
      this.ready.set(true);
      return;
    }

    this.loading.set(true);

    try {
      const favorites = await this.favoriteApi.getAll();
      const ids = favorites.map((item) => item.craftsmanId);
      this.favoriteIds.set(ids);
      this.favoriteCraftsmenList.set(await this.catalog().getByIds(ids));
    } catch {
      this.favoriteIds.set([]);
      this.favoriteCraftsmenList.set([]);
    } finally {
      this.loading.set(false);
      this.ready.set(true);
    }
  }

  async toggle(craftsmanId: string): Promise<boolean> {
    if (!this.auth.isAuthenticated()) {
      return false;
    }

    const accessError = await this.auth.ensureConsumerAccess();
    if (accessError || !this.auth.isConsumer()) {
      return false;
    }

    const wasFavorite = this.isFavorite(craftsmanId);

    if (wasFavorite) {
      this.favoriteIds.update((ids) => ids.filter((id) => id !== craftsmanId));
      this.favoriteCraftsmenList.update((list) =>
        list.filter((item) => item.id !== craftsmanId),
      );
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
      const [craftsman] = await this.catalog().getByIds([craftsmanId]);
      if (craftsman) {
        this.favoriteCraftsmenList.update((list) =>
          list.some((item) => item.id === craftsmanId)
            ? list
            : [...list, craftsman],
        );
      }
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
