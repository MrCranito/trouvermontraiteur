import { InjectionToken } from '@angular/core';

/** Dashboard base URL for consumer auth screens (same lib as AuthLayout). */
export const CONSUMER_DASHBOARD_APP_URL = new InjectionToken<string | null>(
  'CONSUMER_DASHBOARD_APP_URL',
);
