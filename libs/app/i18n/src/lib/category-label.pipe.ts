import { inject, Pipe, PipeTransform } from '@angular/core';
import { Category } from '@trouvermontraiteur/models';
import { CategoryI18nService } from './category-i18n.service';

@Pipe({
  name: 'categoryLabel',
  pure: false,
})
export class CategoryLabelPipe implements PipeTransform {
  private readonly categoryI18n = inject(CategoryI18nService);

  transform(
    category: Pick<Category, 'id' | 'translations'> | null | undefined,
  ): string {
    return this.categoryI18n.name(category);
  }
}
