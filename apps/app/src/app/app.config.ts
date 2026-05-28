import {
  ApplicationConfig,
  provideBrowserGlobalErrorListeners,
} from '@angular/core';
import { provideRouter } from '@angular/router';
import { appRoutes } from './app.routes';
import { provideAppI18n } from '@trouvermontraiteur/app-i18n';
import { provideTmtPrimeNG } from '@trouvermontraiteur/theme';
import { AUTH_REDIRECT_BASE, CONSUMER_DASHBOARD_APP_URL } from '@trouvermontraiteur/app-auth';
import { PUBLIC_APP_URL } from '@trouvermontraiteur/data';
import { SUPABASE_CLIENT } from '@trouvermontraiteur/api';
import { GOOGLE_MAPS_API_KEY } from '@trouvermontraiteur/map-base';
import { environment } from '@env';
import { createClient } from '@supabase/supabase-js';

export const appConfig: ApplicationConfig = {
  providers: [
    ...provideAppI18n(),
    {
      provide: GOOGLE_MAPS_API_KEY,
      useValue: environment.googleMapsApiKey,
    },
    {
      provide: SUPABASE_CLIENT,
      useFactory: () =>
        createClient(environment.supabase_url, environment.supabase_key),
    },
    {
      provide: AUTH_REDIRECT_BASE,
      useValue: environment.appUrl.replace(/\/$/, ''),
    },
    { provide: PUBLIC_APP_URL, useValue: environment.appUrl },
    {
      provide: CONSUMER_DASHBOARD_APP_URL,
      useValue: environment.dashboardUrl,
    },
    provideBrowserGlobalErrorListeners(),
    provideRouter(appRoutes),
    provideTmtPrimeNG(),
  ],
};
