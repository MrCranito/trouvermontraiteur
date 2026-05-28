import { computed, effect, inject, Injectable, signal } from '@angular/core';
import { SUPABASE_CLIENT } from '@trouvermontraiteur/api';
import { CatererAuthService } from '@trouvermontraiteur/dashboard-auth';

export interface BusinessProfileFormValue {
  businessName: string;
  address: string;
  city: string;
  postalCode: string;
  siret: string;
}

interface UsersProRow {
  id?: string;
  business_name: string;
  siret: string;
}

interface CraftsmanLocationRow {
  name: string;
  address: string | null;
  city: string | null;
  postal_code: string | null;
}

@Injectable({ providedIn: 'root' })
export class BusinessProfileService {
  private readonly supabase = inject(SUPABASE_CLIENT);
  private readonly auth = inject(CatererAuthService);

  private readonly ready = signal(false);
  private readonly loading = signal(false);
  private readonly profile = signal<BusinessProfileFormValue | null>(null);
  private cachedUserId: string | null = null;

  readonly isReady = this.ready.asReadonly();
  readonly isLoading = this.loading.asReadonly();
  readonly value = this.profile.asReadonly();
  readonly isComplete = computed(() => this.isFormComplete(this.profile()));

  constructor() {
    effect(() => {
      if (!this.auth.isReady()) {
        return;
      }
      if (!this.auth.user()?.id) {
        this.reset();
      }
    });
  }

  reset(): void {
    this.profile.set(null);
    this.ready.set(false);
    this.loading.set(false);
    this.cachedUserId = null;
  }

  async ensureLoaded(): Promise<void> {
    await this.auth.whenReady();
    const userId = this.auth.user()?.id ?? null;
    if (!userId) {
      this.reset();
      return;
    }
    if (this.ready() && this.cachedUserId === userId) {
      return;
    }
    await this.reload();
  }

  async reload(): Promise<void> {
    await this.auth.whenReady();
    const userId = this.auth.user()?.id;
    if (!userId) {
      this.reset();
      return;
    }

    this.loading.set(true);
    try {
      const proResult = await this.supabase
        .from('users_pro')
        .select('id, business_name, siret')
        .maybeSingle();

      if (proResult.error) {
        throw proResult.error;
      }
      if (!proResult.data) {
        this.profile.set(null);
        return;
      }

      const pro = proResult.data as UsersProRow;
      const usersProId = pro.id ?? null;
      const { data: craftsmanData, error: craftsmanError } = usersProId
        ? await this.supabase
            .from('craftsmans')
            .select('name, address, city, postal_code')
            .eq('owner_user_pro_id', usersProId)
            .maybeSingle()
        : { data: null, error: null };

      if (craftsmanError) {
        throw craftsmanError;
      }
      const craftsman = craftsmanData as CraftsmanLocationRow | null;

      this.profile.set({
        businessName:
          pro.business_name?.trim() || craftsman?.name?.trim() || '',
        address: craftsman?.address ?? '',
        city: craftsman?.city ?? '',
        postalCode: craftsman?.postal_code ?? '',
        siret: pro.siret ?? '',
      });
    } finally {
      this.cachedUserId = userId;
      this.loading.set(false);
      this.ready.set(true);
    }
  }

  /** Setup-business submit: single Supabase RPC (no client select/update). */
  async save(value: BusinessProfileFormValue): Promise<void> {
    await this.auth.whenReady();
    if (!this.auth.user()?.id) {
      throw new Error('Utilisateur non connecté');
    }

    const businessName = value.businessName.trim();
    const address = value.address.trim();
    const city = value.city.trim();
    const postalCode = value.postalCode.trim();
    const siret = value.siret.trim();

    const { error } = await this.supabase.rpc('setup_pro_business_profile', {
      p_business_name: businessName,
      p_siret: siret,
      p_address: address,
      p_city: city,
      p_postal_code: postalCode,
    });

    if (error) {
      throw error;
    }

    this.profile.set({
      businessName,
      address,
      city,
      postalCode,
      siret,
    });
    this.ready.set(true);
  }

  private isFormComplete(value: BusinessProfileFormValue | null): boolean {
    if (!value) {
      return false;
    }
    const siret = value.siret.trim();
    return (
      value.businessName.trim().length > 1 &&
      value.address.trim().length > 5 &&
      value.city.trim().length > 1 &&
      value.postalCode.trim().length >= 4 &&
      /^\d{14}$/.test(siret)
    );
  }
}
