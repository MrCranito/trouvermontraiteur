import { ParamMap } from '@angular/router';
import {
  ALL_CATEGORIES,
  ALL_DIETARY_OPTIONS,
  ALL_EVENT_TYPES,
  SearchSort,
} from '@trouvermontraiteur/data';
import {
  CatererCategory,
  DietaryOption,
  EventType,
} from '@trouvermontraiteur/models';

export type SearchViewMode = 'grid' | 'map';

export interface SearchFiltersState {
  query: string;
  minRating: number;
  categories: CatererCategory[];
  eventDate: string;
  eventTypes: EventType[];
  dietary: DietaryOption[];
  sort: SearchSort;
  view: SearchViewMode;
}

const VALID_CATEGORIES = new Set<string>(ALL_CATEGORIES);
const VALID_EVENTS = new Set<string>(ALL_EVENT_TYPES);
const VALID_DIETARY = new Set<string>(ALL_DIETARY_OPTIONS);
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

  const categories = parseListParam<CatererCategory>(
    params.get('categories'),
    VALID_CATEGORIES,
  );
  const eventTypes = parseListParam<EventType>(
    params.get('events'),
    VALID_EVENTS,
  );
  const dietary = parseListParam<DietaryOption>(
    params.get('dietary'),
    VALID_DIETARY,
  );

  const dateParam = params.get('date') ?? '';
  const eventDate = /^\d{4}-\d{2}-\d{2}$/.test(dateParam) ? dateParam : '';

  const sortParam = params.get('sort');
  const sort: SearchSort =
    sortParam && VALID_SORT.has(sortParam) ? (sortParam as SearchSort) : 'relevance';

  const view: SearchViewMode = params.get('view') === 'map' ? 'map' : 'grid';

  return {
    query,
    minRating,
    categories,
    eventDate,
    eventTypes,
    dietary,
    sort,
    view,
  };
}

export function buildSearchQueryParams(
  state: SearchFiltersState,
): Record<string, string | null> {
  return {
    q: state.query.trim() || null,
    rating: state.minRating > 0 ? String(state.minRating) : null,
    categories:
      state.categories.length > 0 ? state.categories.join(',') : null,
    date: state.eventDate || null,
    events: state.eventTypes.length > 0 ? state.eventTypes.join(',') : null,
    dietary: state.dietary.length > 0 ? state.dietary.join(',') : null,
    sort: state.sort !== 'relevance' ? state.sort : null,
    view: state.view !== 'grid' ? state.view : null,
  };
}
