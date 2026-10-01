import type { SubCategoryRow } from './sub-category.row';

export interface CategoryRow {
  id: string;
  order: number;
  icon: string;
  categories_translations: CategoryTranslationRow[];
  sub_categories: SubCategoryRow[];
}

export interface CategoryTranslationRow {
  language_code: string;
  name: string;
}
