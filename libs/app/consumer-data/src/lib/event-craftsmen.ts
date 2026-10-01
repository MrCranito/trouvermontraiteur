import {
  Category,
  Craftsman,
  CraftsmanTrade,
  resolveCraftsmanTradeFromSubCategoryLabel,
  resolveSubCategoryTranslation,
  SubCategory,
} from '@trouvermontraiteur/models';

/** Trades the consumer app shows: craftsmen who work on events. */
export const EVENT_CRAFTSMAN_TRADE_IDS = new Set<CraftsmanTrade>([
  'traiteur',
  'patissier',
  'chocolatier',
  'fleuriste',
  'photographe_artisan',
  'peintre_decorateur',
  'coiffeur',
  'estheticienne',
  'styliste',
  'couturier',
]);

export function isEventCraftsmanTrade(id: string): id is CraftsmanTrade {
  return EVENT_CRAFTSMAN_TRADE_IDS.has(id as CraftsmanTrade);
}

function isEventSubCategory(subCategory: SubCategory): boolean {
  if (isEventCraftsmanTrade(subCategory.id)) {
    return true;
  }

  const trade = resolveCraftsmanTradeFromSubCategoryLabel(
    resolveSubCategoryTranslation(subCategory, 'fr'),
  );
  return trade !== null && isEventCraftsmanTrade(trade);
}

export function eventCategoriesOnly(categories: Category[]): Category[] {
  return categories
    .map((category) => ({
      ...category,
      subCategories: category.subCategories.filter((subCategory) =>
        isEventSubCategory(subCategory),
      ),
    }))
    .filter((category) => category.subCategories.length > 0);
}

export function isEventCraftsman(
  craftsman: Craftsman,
  eventSubCategoryIds: ReadonlySet<string>,
): boolean {
  return (
    craftsman.subCategoryIds.some((id) => eventSubCategoryIds.has(id)) ||
    craftsman.trades.some((trade) => isEventCraftsmanTrade(trade))
  );
}
