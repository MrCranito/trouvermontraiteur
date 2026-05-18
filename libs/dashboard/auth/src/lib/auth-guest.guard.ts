import { inject } from '@angular/core';
import { CanActivateFn, Router } from '@angular/router';
import { CatererAuthService } from './caterer-auth.service';

export const authGuestGuard: CanActivateFn = async () => {
  const auth = inject(CatererAuthService);
  const router = inject(Router);

  await auth.whenReady();

  if (!auth.isAuthenticated()) {
    return true;
  }

  return router.createUrlTree(['/apercu']);
};
