import {
  ApplicationConfig,
  provideBrowserGlobalErrorListeners,
} from '@angular/core';
import { provideRouter } from '@angular/router';
import { appRoutes } from './app.routes';
import { providePrimeNG } from 'primeng/config';
import { TmtPreset } from '@trouvermontraiteur/theme';
import { provideSupabase } from '@trouvermontraiteur/api';
import { APP_PREVIEW_URL } from '@trouvermontraiteur/dashboard-data';
import {
  AUTH_REDIRECT_BASE,
} from '@trouvermontraiteur/dashboard-auth';
import { environment } from '../environments/environment';

export const appConfig: ApplicationConfig = {
  providers: [
    { provide: APP_PREVIEW_URL, useValue: environment.appPreviewUrl },
    {
      provide: AUTH_REDIRECT_BASE,
      useValue:
        typeof window !== 'undefined'
          ? window.location.origin
          : 'http://localhost:4400',
    },
    provideSupabase(environment.supabaseUrl, environment.supabaseAnonKey),
    provideBrowserGlobalErrorListeners(),
    provideRouter(appRoutes),
    providePrimeNG({
      theme: {
        preset: TmtPreset,
      },
    }),
  ],
};
