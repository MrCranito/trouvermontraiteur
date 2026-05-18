import { InjectionToken } from '@angular/core';

/**
 * Base URL of the public app (search + caterer profiles).
 * When set (e.g. `http://localhost:4200` in dev), landing links open the app in a new tab.
 */
export const PUBLIC_APP_URL = new InjectionToken<string | null>('PUBLIC_APP_URL');
