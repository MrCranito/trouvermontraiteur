import { inject } from '@angular/core';
import { CanActivateFn, Router } from '@angular/router';
import { CatererAuthService } from './caterer-auth.service';

/** Blocks unauthenticated access; preserves return URL for post-login redirect. */
export const requireAuthGuard: CanActivateFn = async (_route, state) => {
  const auth = inject(CatererAuthService);
  const router = inject(Router);

  await auth.whenReady();

  if (!auth.isAuthenticated()) {
    return router.createUrlTree(['/auth/connexion'], {
      queryParams: { returnUrl: state.url },
    });
  }

  return true;
};
