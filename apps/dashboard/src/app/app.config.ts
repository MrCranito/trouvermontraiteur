import {
  ApplicationConfig,
  provideBrowserGlobalErrorListeners,
} from '@angular/core';
import { provideRouter } from '@angular/router';
import { appRoutes } from './app.routes';
import { provideTmtPrimeNG } from '@trouvermontraiteur/theme';
import { APP_PREVIEW_URL } from '@trouvermontraiteur/dashboard-data';
import { AUTH_REDIRECT_BASE } from '@trouvermontraiteur/dashboard-auth';
import { environment } from '@env';
import { SUPABASE_CLIENT } from '@trouvermontraiteur/api';
import { createClient } from '@supabase/supabase-js';

export const appConfig: ApplicationConfig = {
  providers: [
    {
      provide: SUPABASE_CLIENT,
      useFactory: () =>
        createClient(environment.supabase_url, environment.supabase_key),
    },
    { provide: APP_PREVIEW_URL, useValue: environment.appPreviewUrl },
    {
      provide: AUTH_REDIRECT_BASE,
      useValue: environment.dashboardUrl.replace(/\/$/, ''),
    },
    provideBrowserGlobalErrorListeners(),
    provideRouter(appRoutes),
    provideTmtPrimeNG(),
  ],
};
