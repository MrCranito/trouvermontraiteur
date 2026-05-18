import { InjectionToken } from '@angular/core';

/** Origin used for Supabase e-mail links and OAuth redirects (e.g. `http://localhost:4400`). */
export const AUTH_REDIRECT_BASE = new InjectionToken<string>(
  'AUTH_REDIRECT_BASE',
);
