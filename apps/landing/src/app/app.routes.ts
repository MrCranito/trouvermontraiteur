import { Route } from '@angular/router';
import { homeRoutes, ProSignup } from '@trouvermontraiteur/home';

export const appRoutes: Route[] = [
  ...homeRoutes,
  { path: 'inscription-pro', component: ProSignup },
];
