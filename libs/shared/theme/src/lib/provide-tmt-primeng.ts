import { EnvironmentProviders } from '@angular/core';
import { providePrimeNG } from 'primeng/config';
import { TmtPreset } from './tmt-preset';

/** PrimeNG setup shared by all apps — light brand theme only (no system dark inputs). */
export function provideTmtPrimeNG(): EnvironmentProviders {
  return providePrimeNG({
    theme: {
      preset: TmtPreset,
      options: {
        darkModeSelector: '.tmt-dark',
      },
    },
  });
}
