import {
  ApplicationConfig,
  provideBrowserGlobalErrorListeners,
} from '@angular/core';
import { provideRouter } from '@angular/router';
import { appRoutes } from './app.routes';
import {
  provideClientHydration,
  withEventReplay,
} from '@angular/platform-browser';
import { provideTmtPrimeNG } from '@trouvermontraiteur/theme';
import { DASHBOARD_APP_URL, PUBLIC_APP_URL } from '@trouvermontraiteur/data';
import { SEARCH_APP_URL } from '@trouvermontraiteur/home';
import { environment } from '../environments/environment';

export const appConfig: ApplicationConfig = {
  providers: [
    { provide: PUBLIC_APP_URL, useValue: environment.searchAppUrl },
    { provide: DASHBOARD_APP_URL, useValue: environment.dashboardAppUrl },
    { provide: SEARCH_APP_URL, useValue: environment.searchAppUrl },
    provideClientHydration(withEventReplay()),
    provideBrowserGlobalErrorListeners(),
    provideRouter(appRoutes),
    provideTmtPrimeNG(),
  ],
};
