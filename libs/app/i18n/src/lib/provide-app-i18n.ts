import { isDevMode, LOCALE_ID } from '@angular/core';
import { provideHttpClient } from '@angular/common/http';
import { provideTransloco, TranslocoService } from '@jsverse/transloco';
import { TranslocoHttpLoader } from './transloco-http.loader';

export const APP_I18N_LANGS = ['fr', 'en', 'es'] as const;
export type AppI18nLang = (typeof APP_I18N_LANGS)[number];

const STORAGE_KEY = 'tmt.app.lang';

export function readStoredAppLang(): AppI18nLang | null {
  if (typeof localStorage === 'undefined') {
    return null;
  }

  const stored = localStorage.getItem(STORAGE_KEY);
  return APP_I18N_LANGS.includes(stored as AppI18nLang)
    ? (stored as AppI18nLang)
    : null;
}

export function storeAppLang(lang: AppI18nLang): void {
  localStorage.setItem(STORAGE_KEY, lang);
}

function localeIdForLang(lang: AppI18nLang): string {
  switch (lang) {
    case 'en':
      return 'en';
    case 'es':
      return 'es';
    default:
      return 'fr';
  }
}

export function provideAppI18n() {
  const defaultLang = readStoredAppLang() ?? 'fr';

  return [
    provideHttpClient(),
    provideTransloco({
      config: {
        availableLangs: [...APP_I18N_LANGS],
        defaultLang,
        reRenderOnLangChange: true,
        prodMode: !isDevMode(),
      },
      loader: TranslocoHttpLoader,
    }),
    {
      provide: LOCALE_ID,
      useFactory: (transloco: TranslocoService) =>
        localeIdForLang(transloco.getActiveLang() as AppI18nLang),
      deps: [TranslocoService],
    },
  ];
}
