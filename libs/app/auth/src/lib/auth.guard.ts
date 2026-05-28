import { inject } from '@angular/core';
import { CanActivateFn, Router } from '@angular/router';
import { ConsumerAuthService } from './consumer-auth.service';
import { WRONG_PORTAL_ERROR_CODE } from './auth.errors';

export const authGuard: CanActivateFn = async (_route, state) => {
  const auth = inject(ConsumerAuthService);
  const router = inject(Router);

  await auth.whenReady();

  if (!auth.isAuthenticated()) {
    return router.createUrlTree(['/auth/connexion'], {
      queryParams: { returnUrl: state.url },
    });
  }

  if (auth.isPro()) {
    await auth.clearSession();
    return router.createUrlTree(['/auth/connexion'], {
      queryParams: { error: WRONG_PORTAL_ERROR_CODE },
    });
  }

  if (!auth.isConsumer()) {
    const err = await auth.ensureConsumerAccess();
    if (err?.message === WRONG_PORTAL_ERROR_CODE || auth.isPro()) {
      return router.createUrlTree(['/auth/connexion'], {
        queryParams: { error: WRONG_PORTAL_ERROR_CODE },
      });
    }
    if (!auth.isConsumer()) {
      await auth.clearSession();
      return router.createUrlTree(['/auth/connexion']);
    }
  }

  return true;
};
