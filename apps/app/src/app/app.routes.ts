import { Route } from '@angular/router';
import { authGuard, authRoutes } from '@trouvermontraiteur/app-auth';
import { AppShell } from '@trouvermontraiteur/app-shell';
import { favoritesRoutes } from '@trouvermontraiteur/app-favorites';
import { myDevisRoutes } from '@trouvermontraiteur/app-my-devis';
import { Discover } from '@trouvermontraiteur/app-discover';
import { Search } from '@trouvermontraiteur/search';
import { craftsmanDetailsRoutes } from '@trouvermontraiteur/craftsman-details';

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
        component: Discover,
        data: { showBackLink: false },
      },
      {
        path: 'explorer',
        component: Search,
        data: { showBackLink: true },
      },
      {
        path: 'search',
        redirectTo: 'explorer',
        pathMatch: 'full',
      },
      {
        path: 'recherche',
        redirectTo: 'explorer',
        pathMatch: 'full',
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
        path: 'artisans/:slug',
        children: craftsmanDetailsRoutes,
      },
    ],
  },
  {
    path: '**',
    redirectTo: '',
  },
];
