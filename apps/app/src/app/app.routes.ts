import { Route } from '@angular/router';
import { Search } from '@trouvermontraiteur/search';
import { detailsRoutes } from '@trouvermontraiteur/details';

export const appRoutes: Route[] = [
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
    path: 'traiteurs/:slug',
    children: detailsRoutes,
  },
  {
    path: '**',
    redirectTo: '',
  },
];
