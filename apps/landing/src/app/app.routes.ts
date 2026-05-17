import { Route } from '@angular/router';
import { homeRoutes, ProSignup } from '@trouvermontraiteur/home';
import { searchRoutes } from '@trouvermontraiteur/search';
import { catererDetailRoutes } from '@trouvermontraiteur/caterer-detail';

export const appRoutes: Route[] = [
  ...homeRoutes,
  { path: 'inscription-pro', component: ProSignup },
  {
    path: 'recherche',
    children: searchRoutes,
  },
  {
    path: 'traiteurs/:slug',
    children: catererDetailRoutes,
  },
];
