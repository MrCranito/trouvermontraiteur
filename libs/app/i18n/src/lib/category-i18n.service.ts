import { inject, Injectable } from '@angular/core';
import { toSignal } from '@angular/core/rxjs-interop';
import { TranslocoService } from '@jsverse/transloco';
import {
  Category,
  SubCategory,
  resolveCategoryTranslation,
  resolveSubCategoryTranslation,
} from '@trouvermontraiteur/models';
import { startWith } from 'rxjs';

@Injectable({ providedIn: 'root' })
export class CategoryI18nService {
  private readonly transloco = inject(TranslocoService);

  readonly activeLang = toSignal(
    this.transloco.langChanges$.pipe(
      startWith(this.transloco.getActiveLang()),
    ),
    { initialValue: this.transloco.getActiveLang() },
  );

  name(category: Pick<Category, 'id' | 'translations'> | null | undefined): string {
    if (!category) {
      return '';
    }

    this.activeLang();
    return resolveCategoryTranslation(category, this.transloco.getActiveLang(), 'name');
  }

  subCategoryLabel(
    subCategory: Pick<SubCategory, 'id' | 'translations'> | null | undefined,
  ): string {
    if (!subCategory) {
      return '';
    }

    this.activeLang();
    return resolveSubCategoryTranslation(
      subCategory,
      this.transloco.getActiveLang(),
    );
  }
}
