import {
  ApplicationConfig,
  provideBrowserGlobalErrorListeners,
} from '@angular/core';
import { provideRouter, withRouterConfig } from '@angular/router';
import { appRoutes } from './app.routes';
import { provideDashboardCraftsmanDetailsEdit } from '@trouvermontraiteur/dashboard-custom-details';
import { provideTmtPrimeNG } from '@trouvermontraiteur/theme';
import { AUTH_REDIRECT_BASE } from '@trouvermontraiteur/dashboard-auth';
import { AUTH_REDIRECT_BASE as APP_AUTH_REDIRECT_BASE } from '@trouvermontraiteur/app-auth';
import { DASHBOARD_APP_URL, PUBLIC_APP_URL } from '@trouvermontraiteur/data';
import { environment } from '@env';
import { SUPABASE_CLIENT } from '@trouvermontraiteur/api';
import { GOOGLE_MAPS_API_KEY } from '@trouvermontraiteur/map-base';
import { createClient } from '@supabase/supabase-js';

export const appConfig: ApplicationConfig = {
  providers: [
    {
      provide: SUPABASE_CLIENT,
      useFactory: () =>
        createClient(environment.supabase_url, environment.supabase_key),
    },
    {
      provide: GOOGLE_MAPS_API_KEY,
      useValue: environment.googleMapsApiKey,
    },
    { provide: PUBLIC_APP_URL, useValue: environment.appUrl },
    { provide: DASHBOARD_APP_URL, useValue: environment.dashboardUrl },
    {
      provide: AUTH_REDIRECT_BASE,
      useValue: environment.dashboardUrl.replace(/\/$/, ''),
    },
    {
      provide: APP_AUTH_REDIRECT_BASE,
      useValue: environment.dashboardUrl.replace(/\/$/, ''),
    },
    provideBrowserGlobalErrorListeners(),
    ...provideDashboardCraftsmanDetailsEdit(),
    provideRouter(
      appRoutes,
      withRouterConfig({ paramsInheritanceStrategy: 'always' }),
    ),
    provideTmtPrimeNG(),
  ],
};
