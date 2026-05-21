import { InjectionToken } from '@angular/core';

/** Google Maps JavaScript API key (Google Cloud Console → APIs & Services → Credentials). */
export const GOOGLE_MAPS_API_KEY = new InjectionToken<string>(
  'GOOGLE_MAPS_API_KEY',
  { factory: () => '' },
);
