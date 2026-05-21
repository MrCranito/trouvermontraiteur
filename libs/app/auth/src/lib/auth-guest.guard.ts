import { inject } from '@angular/core';
import { CanActivateFn, Router } from '@angular/router';
import { ConsumerAuthService } from './consumer-auth.service';

export const authGuestGuard: CanActivateFn = async () => {
  const auth = inject(ConsumerAuthService);
  const router = inject(Router);

  await auth.whenReady();

  if (!auth.isAuthenticated()) {
    return true;
  }

  return router.createUrlTree(['/']);
};
