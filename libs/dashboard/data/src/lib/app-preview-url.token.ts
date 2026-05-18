import { InjectionToken } from '@angular/core';

/** Base URL of the public app where caterer profiles are shown. */
export const APP_PREVIEW_URL = new InjectionToken<string>('APP_PREVIEW_URL', {
  factory: () => 'http://localhost:4200',
});
