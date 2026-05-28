export interface SubCategoryTranslationRow {
  language_code: string;
  name: string;
}

export interface SubCategoryRow {
  id: string;
  order: number;
  category_id: string;
  sub_categories_translations: SubCategoryTranslationRow[];
}
