import { InjectionToken } from '@angular/core';

/** Origin used for Supabase e-mail links and OAuth redirects (e.g. `http://localhost:4200`). */
export const AUTH_REDIRECT_BASE = new InjectionToken<string>(
  'APP_AUTH_REDIRECT_BASE',
);
