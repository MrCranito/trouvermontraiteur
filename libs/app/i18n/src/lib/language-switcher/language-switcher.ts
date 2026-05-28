import { Component, inject } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { TranslocoDirective, TranslocoService } from '@jsverse/transloco';
import {
  APP_I18N_LANGS,
  type AppI18nLang,
  storeAppLang,
} from '../provide-app-i18n';

@Component({
  selector: 'tmt-language-switcher',
  imports: [FormsModule, TranslocoDirective],
  templateUrl: './language-switcher.html',
  styleUrl: './language-switcher.scss',
})
export class TmtLanguageSwitcher {
  private readonly transloco = inject(TranslocoService);

  protected readonly languages = APP_I18N_LANGS;

  protected activeLang = this.transloco.getActiveLang() as AppI18nLang;

  protected onLangChange(lang: AppI18nLang): void {
    this.activeLang = lang;
    storeAppLang(lang);
    this.transloco.setActiveLang(lang);
  }
}
