import { effect, inject, Injectable, signal } from '@angular/core';
import { ContractService } from '@trouvermontraiteur/api';
import { CatererAuthService } from '@trouvermontraiteur/dashboard-auth';
import { UserProContract } from '@trouvermontraiteur/models';

@Injectable({ providedIn: 'root' })
export class CatererContractsService {
  private readonly auth = inject(CatererAuthService);
  private readonly contractApi = inject(ContractService);

  private readonly contracts = signal<UserProContract[]>([]);
  private readonly loading = signal(false);
  private readonly error = signal<string | null>(null);
  private readonly ready = signal(false);

  readonly contractsSignal = this.contracts.asReadonly();
  readonly isLoading = this.loading.asReadonly();
  readonly errorSignal = this.error.asReadonly();
  readonly isReady = this.ready.asReadonly();

  constructor() {
    effect(() => {
      if (!this.auth.isReady()) {
        return;
      }
      void this.load();
    });
  }

  async load(): Promise<void> {
    const userId = this.auth.user()?.id ?? null;
    if (!userId) {
      this.contracts.set([]);
      this.error.set(null);
      this.ready.set(true);
      return;
    }

    this.loading.set(true);
    this.error.set(null);
    try {
      const items = await this.contractApi.getMine();
      this.contracts.set(items);
    } catch (err) {
      this.contracts.set([]);
      this.error.set(
        err instanceof Error ? err.message : 'Impossible de charger les contrats',
      );
    } finally {
      this.loading.set(false);
      this.ready.set(true);
    }
  }
}
