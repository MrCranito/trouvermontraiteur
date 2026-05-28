import { inject } from '@angular/core';
import { CanActivateFn, Router } from '@angular/router';
import { CatererAuthService } from '@trouvermontraiteur/dashboard-auth';
import { BusinessProfileService } from './business-profile.service';

export const businessProfileCompletedGuard: CanActivateFn = async (
  _route,
  _state,
) => {
  const auth = inject(CatererAuthService);
  const router = inject(Router);

  await auth.whenReady();
  if (!auth.isAuthenticated()) {
    return router.createUrlTree(['/auth/connexion']);
  }

  // Keep this guard lightweight to avoid extra Supabase calls on dashboard reload.
  return true;
};

export const businessProfileSetupGuard: CanActivateFn = async (route, state) => {
  const auth = inject(CatererAuthService);
  const service = inject(BusinessProfileService);
  const router = inject(Router);

  await auth.whenReady();
  if (!auth.isAuthenticated()) {
    return router.createUrlTree(['/auth/connexion'], {
      queryParams: { returnUrl: state.url },
    });
  }

  // No Supabase reads on setup-business; redirect only if profile was saved this session.
  if (!service.isReady() || !service.isComplete()) {
    return true;
  }

  const returnUrl = route.queryParamMap.get('returnUrl');
  if (returnUrl && returnUrl !== '/setup-business') {
    return router.parseUrl(returnUrl);
  }
  return router.createUrlTree(['/apercu']);
};
