import { effect, inject, Injectable, signal } from '@angular/core';
import { CraftsmanService, SUPABASE_CLIENT } from '@trouvermontraiteur/api';
import { CatererAuthService } from '@trouvermontraiteur/dashboard-auth';
import {
  Craftsman,
  getCraftsmanPublishReadiness,
} from '@trouvermontraiteur/models';
import { ProfileCompleteness } from './caterer-dashboard-stats';

@Injectable({ providedIn: 'root' })
export class CatererProfileService {
  private readonly supabase = inject(SUPABASE_CLIENT);
  private readonly auth = inject(CatererAuthService);
  private readonly craftsmanApi = inject(CraftsmanService);

  private readonly profile = signal<Craftsman | null>(null);
  private readonly ready = signal(false);
  private readonly loading = signal(false);

  readonly profileSignal = this.profile.asReadonly();
  readonly isReady = this.ready.asReadonly();
  readonly isLoading = this.loading.asReadonly();

  constructor() {
    effect(() => {
      if (!this.auth.isReady()) {
        return;
      }
      void this.load();
    });
  }

  getProfile(): Craftsman {
    const craftsman = this.profile();
    if (!craftsman) {
      throw new Error('Profil artisan indisponible');
    }
    return craftsman;
  }

  replaceProfile(craftsman: Craftsman): void {
    this.profile.set(structuredClone(craftsman));
  }

  updateProfile(
    patch: Partial<Pick<Craftsman, 'availableDates' | 'unavailableDates'>>,
  ): void {
    const current = this.getProfile();
    this.replaceProfile({ ...current, ...patch });
  }

  getCompleteness(): ProfileCompleteness {
    const c = this.profile();
    if (!c) {
      return { score: 0, missing: ['Profil artisan indisponible'] };
    }
    const missing: string[] = [];

    if (!c.description?.trim()) {
      missing.push('Description');
    }
    if (!c.imageUrl?.trim() && !c.realisations.some((r) => r.imageUrl.trim())) {
      missing.push('Photo de couverture');
    }
    if (!c.location.address?.trim() || !c.location.city?.trim()) {
      missing.push('Adresse complète');
    }
    if (c.trades.length === 0 && c.subCategoryIds.length === 0) {
      missing.push('Catégorie de métier');
    }
    if (c.projectTypes.length === 0) {
      missing.push('Types de projet');
    }
    if (c.services.length === 0) {
      missing.push('Au moins une prestation');
    }
    if (c.realisations.length === 0) {
      missing.push('Photos de réalisations');
    }
    if (c.minOrder == null || c.minOrder <= 0) {
      missing.push('Commande minimum');
    }

    const checks = 8;
    const score = Math.round(((checks - missing.length) / checks) * 100);

    return { score: Math.max(0, Math.min(100, score)), missing };
  }

  getPublishReadiness(craftsman: Craftsman) {
    return getCraftsmanPublishReadiness(craftsman);
  }

  async saveDraft(craftsman: Craftsman): Promise<void> {
    await this.persistProfile(craftsman, craftsman.published);
  }

  async publishProfile(craftsman: Craftsman): Promise<void> {
    const readiness = getCraftsmanPublishReadiness(craftsman);
    if (!readiness.canPublish) {
      throw new Error(
        `Complétez votre profil avant publication : ${readiness.missing.join(', ')}.`,
      );
    }

    await this.persistProfile({ ...craftsman, published: true }, true);
  }

  private async load(): Promise<void> {
    const userId = this.auth.user()?.id ?? null;
    if (!userId) {
      this.profile.set(null);
      this.ready.set(false);
      return;
    }

    this.loading.set(true);
    try {
      const { data: usersPro, error } = await this.supabase
        .from('users_pro')
        .select('id')
        .eq('owner_user_id', userId)
        .maybeSingle();

      if (error) {
        throw error;
      }

      const usersProId = (usersPro as { id?: string } | null)?.id ?? null;
      const craftsman = usersProId
        ? await this.craftsmanApi.getByOwnerUserProId(usersProId)
        : null;
      this.profile.set(craftsman);
    } catch {
      this.profile.set(null);
    } finally {
      this.loading.set(false);
      this.ready.set(true);
    }
  }

  private async persistProfile(
    craftsman: Craftsman,
    published: boolean,
  ): Promise<void> {
    await this.craftsmanApi.updateProfile(craftsman.id, {
      name: craftsman.name.trim(),
      description: craftsman.description.trim(),
      published,
      address: craftsman.location.address.trim(),
      city: craftsman.location.city.trim(),
      postal_code: craftsman.location.postalCode.trim(),
    });

    this.profile.set(structuredClone({ ...craftsman, published }));
  }
}
