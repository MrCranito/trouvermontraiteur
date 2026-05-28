import type {
  Category,
  CategoryTranslation,
  SubCategory,
  SubCategoryTranslation,
} from './database';

export type CategoryTranslationField = keyof Omit<
  CategoryTranslation,
  'language_code'
>;

export function normalizeLanguageCode(languageCode: string): string {
  return languageCode.split('-')[0]?.toLowerCase() ?? languageCode;
}

function resolveLocalizedField<
  T extends { language_code: string },
  F extends keyof Omit<T, 'language_code'>,
>(
  entity: { id: string; translations: T[] },
  languageCode: string,
  field: F,
): string {
  const translations = entity.translations ?? [];
  if (translations.length === 0) {
    return entity.id;
  }

  const read = (item: T): string | undefined => {
    const value = item[field];
    return typeof value === 'string' ? value.trim() : undefined;
  };

  const target = normalizeLanguageCode(languageCode);
  const match = translations.find(
    (item) => normalizeLanguageCode(item.language_code) === target,
  );
  const matched = match ? read(match) : undefined;
  if (matched) {
    return matched;
  }

  const french = translations.find(
    (item) => normalizeLanguageCode(item.language_code) === 'fr',
  );
  const frenchValue = french ? read(french) : undefined;
  if (frenchValue) {
    return frenchValue;
  }

  const first = translations.map(read).find((value) => value);
  return first ?? entity.id;
}

export function resolveCategoryTranslation(
  category: Pick<Category, 'id' | 'translations'>,
  languageCode: string,
  field: CategoryTranslationField = 'name',
): string {
  return resolveLocalizedField(category, languageCode, field);
}

export function resolveCategoryTranslationFromList(
  translations: CategoryTranslation[],
  languageCode: string,
  field: CategoryTranslationField = 'name',
): string {
  return resolveCategoryTranslation(
    { id: '', translations },
    languageCode,
    field,
  );
}

export function resolveSubCategoryTranslation(
  subCategory: Pick<SubCategory, 'id' | 'translations'>,
  languageCode: string,
): string {
  return resolveLocalizedField(subCategory, languageCode, 'name');
}

export function resolveSubCategoryTranslationFromList(
  translations: SubCategoryTranslation[],
  languageCode: string,
): string {
  return resolveSubCategoryTranslation({ id: '', translations }, languageCode);
}
