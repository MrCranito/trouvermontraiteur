import { Route } from '@angular/router';
import { authRoutes, authGuard } from '@trouvermontraiteur/dashboard-auth';
import { DashboardShell } from '@trouvermontraiteur/dashboard-shell';
import { overviewRoutes } from '@trouvermontraiteur/dashboard-overview';
import { profileRoutes } from '@trouvermontraiteur/dashboard-profile';
import { devisRoutes } from '@trouvermontraiteur/dashboard-devis';
import { disponibilitesRoutes } from '@trouvermontraiteur/dashboard-availability';

export const appRoutes: Route[] = [
  {
    path: 'auth',
    children: authRoutes,
  },
  {
    path: '',
    component: DashboardShell,
    canActivate: [authGuard],
    children: [
      {
        path: 'apercu',
        children: overviewRoutes,
      },
      {
        path: 'profil',
        children: profileRoutes,
      },
      {
        path: 'devis',
        children: devisRoutes,
      },
      {
        path: 'disponibilites',
        children: disponibilitesRoutes,
      },
      { path: '', redirectTo: 'apercu', pathMatch: 'full' },
    ],
  },
  { path: '**', redirectTo: 'apercu' },
];
