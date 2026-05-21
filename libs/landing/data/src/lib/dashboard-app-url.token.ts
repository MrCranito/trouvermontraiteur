import { InjectionToken } from '@angular/core';

/** Base URL of the professional dashboard app (e.g. `http://localhost:4300` in dev). */
export const DASHBOARD_APP_URL = new InjectionToken<string | null>(
  'DASHBOARD_APP_URL',
);
