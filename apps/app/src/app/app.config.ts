import {
  ApplicationConfig,
  LOCALE_ID,
  provideBrowserGlobalErrorListeners,
} from '@angular/core';
import { provideRouter } from '@angular/router';
import { appRoutes } from './app.routes';
import { provideTmtPrimeNG } from '@trouvermontraiteur/theme';
import { AUTH_REDIRECT_BASE } from '@trouvermontraiteur/app-auth';
import { SUPABASE_CLIENT } from '@trouvermontraiteur/api';
import { GOOGLE_MAPS_API_KEY } from '@trouvermontraiteur/map-base';
import { environment } from '@env';
import { createClient } from '@supabase/supabase-js';

export const appConfig: ApplicationConfig = {
  providers: [
    { provide: LOCALE_ID, useValue: 'fr' },
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
    provideBrowserGlobalErrorListeners(),
    provideRouter(appRoutes),
    provideTmtPrimeNG(),
  ],
};
