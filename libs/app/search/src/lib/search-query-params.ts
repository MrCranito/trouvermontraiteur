import { ParamMap } from '@angular/router';
import {
  ALL_PROJECT_TYPES,
  ALL_SERVICE_OPTIONS,
  normalizeCraftsmanTrade,
  SearchSort,
} from '@trouvermontraiteur/data';
import {
  CraftsmanTrade,
  ProjectType,
  ServiceOption,
} from '@trouvermontraiteur/models';

export type SearchViewMode = 'grid' | 'map';

export interface SearchFiltersState {
  query: string;
  minRating: number;
  trades: CraftsmanTrade[];
  subCategoryIds: string[];
  projectDate: string;
  projectTypes: ProjectType[];
  serviceOptions: ServiceOption[];
  sort: SearchSort;
  view: SearchViewMode;
  mapLat: number | null;
  mapLng: number | null;
}

function parseCoordParam(value: string | null): number | null {
  if (value === null || value === '') {
    return null;
  }
  const parsed = Number.parseFloat(value);
  return Number.isFinite(parsed) ? parsed : null;
}

function parseSubCategoryIds(value: string | null): string[] {
  if (!value) {
    return [];
  }
  const seen = new Set<string>();
  const ids: string[] = [];
  for (const raw of value.split(',')) {
    const token = raw.trim();
    if (!token || seen.has(token)) {
      continue;
    }
    seen.add(token);
    ids.push(token);
  }
  return ids;
}

function parseTradesParam(value: string | null): CraftsmanTrade[] {
  if (!value) {
    return [];
  }
  const seen = new Set<CraftsmanTrade>();
  const trades: CraftsmanTrade[] = [];
  for (const raw of value.split(',')) {
    const token = raw.trim();
    if (!token) {
      continue;
    }
    const normalized = normalizeCraftsmanTrade(token);
    if (normalized && !seen.has(normalized)) {
      seen.add(normalized);
      trades.push(normalized);
    }
  }
  return trades;
}
const VALID_PROJECTS = new Set<string>(ALL_PROJECT_TYPES);
const VALID_OPTIONS = new Set<string>(ALL_SERVICE_OPTIONS);
const VALID_SORT = new Set<string>([
  'relevance',
  'rating',
  'reviews',
  'name',
  'price',
]);

function parseListParam<T extends string>(
  value: string | null,
  valid: Set<string>,
): T[] {
  if (!value) {
    return [];
  }
  return value
    .split(',')
    .map((v) => v.trim())
    .filter((v): v is T => valid.has(v));
}

export function parseSearchQueryParams(params: ParamMap): SearchFiltersState {
  const query = params.get('q') ?? '';

  const ratingRaw = params.get('rating');
  const parsedRating = ratingRaw !== null ? Number.parseFloat(ratingRaw) : 0;
  const minRating =
    Number.isFinite(parsedRating) && parsedRating >= 0 && parsedRating <= 5
      ? parsedRating
      : 0;

  const trades = parseTradesParam(params.get('trades'));
  const subCategoryIds = parseSubCategoryIds(params.get('subs'));
  const projectTypes = parseListParam<ProjectType>(
    params.get('projects'),
    VALID_PROJECTS,
  );
  const serviceOptions = parseListParam<ServiceOption>(
    params.get('options'),
    VALID_OPTIONS,
  );

  const dateParam = params.get('date') ?? '';
  const projectDate = /^\d{4}-\d{2}-\d{2}$/.test(dateParam) ? dateParam : '';

  const sortParam = params.get('sort');
  const sort: SearchSort =
    sortParam && VALID_SORT.has(sortParam) ? (sortParam as SearchSort) : 'relevance';

  const view: SearchViewMode = params.get('view') === 'map' ? 'map' : 'grid';

  const mapLat = parseCoordParam(params.get('lat'));
  const mapLng = parseCoordParam(params.get('lng'));

  return {
    query,
    minRating,
    trades,
    subCategoryIds,
    projectDate,
    projectTypes,
    serviceOptions,
    sort,
    view,
    mapLat,
    mapLng,
  };
}

export function buildSearchQueryParams(
  state: SearchFiltersState,
): Record<string, string | null> {
  return {
    q: state.query.trim() || null,
    rating: state.minRating > 0 ? String(state.minRating) : null,
    trades: state.trades.length > 0 ? state.trades.join(',') : null,
    subs:
      state.subCategoryIds.length > 0 ? state.subCategoryIds.join(',') : null,
    date: state.projectDate || null,
    projects:
      state.projectTypes.length > 0 ? state.projectTypes.join(',') : null,
    options:
      state.serviceOptions.length > 0 ? state.serviceOptions.join(',') : null,
    sort: state.sort !== 'relevance' ? state.sort : null,
    view: state.view !== 'grid' ? state.view : null,
    lat: state.mapLat !== null ? String(state.mapLat) : null,
    lng: state.mapLng !== null ? String(state.mapLng) : null,
  };
}
