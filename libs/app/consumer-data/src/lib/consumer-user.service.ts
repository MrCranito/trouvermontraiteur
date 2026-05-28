import { effect, inject, Injectable, signal } from '@angular/core';
import { UserService } from '@trouvermontraiteur/api';
import { User } from '@trouvermontraiteur/models';
import { ConsumerAuthService } from '@trouvermontraiteur/app-auth';

@Injectable({ providedIn: 'root' })
export class ConsumerUserService {
  private readonly auth = inject(ConsumerAuthService);
  private readonly userService = inject(UserService);

  private readonly profile = signal<User | null>(null);
  private readonly loading = signal(false);
  private readonly ready = signal(false);

  readonly user = this.profile.asReadonly();
  readonly isLoading = this.loading.asReadonly();
  readonly isReady = this.ready.asReadonly();

  constructor() {
    effect(() => {
      const authUserId = this.auth.isReady()
        ? (this.auth.user()?.id ?? null)
        : undefined;

      if (authUserId === undefined) {
        return;
      }

      void this.load(authUserId);
    });
  }

  private async load(authUserId: string | null): Promise<void> {
    this.loading.set(true);

    try {
      if (!authUserId) {
        this.profile.set(null);
        return;
      }

      this.profile.set(await this.userService.getUser(authUserId));
    } finally {
      this.loading.set(false);
      this.ready.set(true);
    }
  }
}
