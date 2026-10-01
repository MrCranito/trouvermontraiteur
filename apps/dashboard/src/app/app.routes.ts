import { Route } from '@angular/router';
import {
  authRoutes,
  authGuard,
  requireAuthGuard,
} from '@trouvermontraiteur/dashboard-auth';
import { DashboardShell } from '@trouvermontraiteur/dashboard-shell';
import { overviewRoutes } from '@trouvermontraiteur/dashboard-overview';
import { CraftsmanDetails } from '@trouvermontraiteur/craftsman-details';
import { devisRoutes } from '@trouvermontraiteur/dashboard-devis';
import {
  businessProfileCompletedGuard,
  businessProfileSetupGuard,
} from './business-profile.guard';
import { SetupBusiness } from './setup-business/setup-business';

export const appRoutes: Route[] = [
  {
    path: 'auth',
    children: authRoutes,
  },
  {
    path: 'setup-business',
    component: SetupBusiness,
    canActivate: [requireAuthGuard, authGuard, businessProfileSetupGuard],
  },
  {
    path: '',
    component: DashboardShell,
    canActivate: [authGuard],
    children: [
      {
        path: 'apercu',
        canActivate: [businessProfileCompletedGuard],
        children: overviewRoutes,
      },
      {
        path: 'custom-details',
        canActivate: [businessProfileCompletedGuard],
        component: CraftsmanDetails,
      },
      {
        path: 'profil',
        redirectTo: 'custom-details',
        pathMatch: 'full',
      },
      {
        path: 'artisans/:id',
        redirectTo: 'custom-details',
        pathMatch: 'full',
      },
      {
        path: 'devis',
        canActivate: [businessProfileCompletedGuard],
        children: devisRoutes,
      },
      { path: '', redirectTo: 'apercu', pathMatch: 'full' },
    ],
  },
  { path: '**', redirectTo: 'apercu' },
];
