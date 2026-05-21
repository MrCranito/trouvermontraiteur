import { Route } from '@angular/router';
import { authGuard, authRoutes } from '@trouvermontraiteur/app-auth';
import { AppShell } from '@trouvermontraiteur/app-shell';
import { favoritesRoutes } from '@trouvermontraiteur/app-favorites';
import { myDevisRoutes } from '@trouvermontraiteur/app-my-devis';
import { Search } from '@trouvermontraiteur/search';
import { detailsRoutes } from '@trouvermontraiteur/details';

export const appRoutes: Route[] = [
  {
    path: 'auth',
    children: authRoutes,
  },
  {
    path: '',
    component: AppShell,
    children: [
      {
        path: '',
        component: Search,
        data: { showBackLink: false },
      },
      {
        path: 'search',
        redirectTo: '',
        pathMatch: 'full',
      },
      {
        path: 'recherche',
        redirectTo: '',
        pathMatch: 'prefix',
      },
      {
        path: 'favoris',
        canActivate: [authGuard],
        children: favoritesRoutes,
      },
      {
        path: 'devis',
        canActivate: [authGuard],
        children: myDevisRoutes,
      },
      {
        path: 'traiteurs/:slug',
        children: detailsRoutes,
      },
    ],
  },
  {
    path: '**',
    redirectTo: '',
  },
];
