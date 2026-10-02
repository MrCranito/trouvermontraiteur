export type { User } from './lib/user';
export type {
  Category,
  CategoryTranslation,
  CraftsmanImage,
  CraftsmanRecord,
  CraftsmanServiceRecord,
  CraftsmanSubCategory,
  CraftsmanUnavailability,
  SubCategory,
  SubCategoryTranslation,
  UserEstimate,
  UserFavorite,
  UserProContract,
  UserProContractStatus,
  UserRecord,
} from './lib/database';
export {
  normalizeLanguageCode,
  resolveCategoryTranslation,
  resolveCategoryTranslationFromList,
  resolveSubCategoryTranslation,
  resolveSubCategoryTranslationFromList,
  type CategoryTranslationField,
} from './lib/category-i18n';
export {
  USER_TYPE,
  USER_TYPE_METADATA_KEY,
  consumerUserMetadata,
  getUserType,
  isConsumerUser,
  isProUser,
  proUserMetadata,
  type UserType,
} from './lib/auth-user-type';
export type {
  Craftsman,
  CraftsmanBuildInput,
  CraftsmanBuildOptions,
  CraftsmanLocation,
  CraftsmanProUser,
  CraftsmanRealisation,
  ProjectType,
  ServiceItem,
  ServiceOption,
} from './lib/craftsman';
export {
  CRAFTSMAN_EMPTY_IMAGE_URL,
  buildCraftsmanFromRelatedData,
  craftsmanCoverImage,
  resolveCraftsmanTradeFromSubCategoryLabel,
} from './lib/craftsman';
export {
  getCraftsmanPublishReadiness,
  type CraftsmanPublishReadiness,
} from './lib/craftsman-publish';
export type { CraftsmanTrade } from './lib/trade-families';
export {
  ALL_TRADES,
  TRADE_FAMILIES,
  TRADE_LABELS,
  type TradeFamily,
} from './lib/trade-families';
export type {
  CatererDetailLayout,
  CatererDetailLayoutPreset,
  CatererDetailSectionId,
} from './lib/caterer-detail-layout';
