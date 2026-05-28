export { PUBLIC_APP_URL } from './lib/public-app-url.token';
export { DASHBOARD_APP_URL } from './lib/dashboard-app-url.token';
export { buildAppUrl } from './lib/app-url';
export {
  buildDefaultAvailableDates,
  buildMonthGrid,
  formatMonthYear,
  FR_WEEKDAY_SHORT,
  isCraftsmanAvailableOn,
  toIsoDateLocal,
  parseIsoDateLocal,
  type CalendarDayCell,
} from './lib/availability';
export {
  FEATURED_CITY_LOCATIONS,
  normalizeSearchText,
  slugifyLocationId,
  type FrenchCityLocation,
} from './lib/french-locations';
export {
  DISCOVER_LOCATIONS,
  frenchCitiesLoadState,
  isFrenchCitiesLoaded,
  lookupFrenchCityByName,
  preloadFrenchCities,
  searchFrenchCities,
  type DiscoverLocation,
  type FrenchCitiesLoadState,
} from './lib/french-cities';
export { CraftsmanService, SEARCH_RESULTS_LIMIT } from './lib/craftsman.service';
export type {
  CraftsmanFilters,
  MapViewport,
  SearchSort,
} from './lib/craftsman.service';
export { DEMO_CRAFTSMAN_SLUG, MOCK_CRAFTSMEN } from './lib/mock-craftsmen';
export {
  TRADE_LABELS,
  ALL_TRADES,
  TRADE_FAMILIES,
  LEGACY_TRADE_ALIASES,
  normalizeCraftsmanTrade,
  type TradeFamily,
} from './lib/trade-labels';
export { PROJECT_LABELS, ALL_PROJECT_TYPES } from './lib/project-labels';
export {
  SERVICE_OPTION_LABELS,
  ALL_SERVICE_OPTIONS,
} from './lib/service-option-labels';
export { CatererDetailLayoutService } from './lib/caterer-detail-layout.service';
export {
  DEFAULT_DETAIL_LAYOUT,
  DETAIL_LAYOUT_PRESETS,
  DETAIL_SECTION_LABELS,
  DETAIL_SECTION_DESCRIPTIONS,
} from './lib/detail-layout-presets';
