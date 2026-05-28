import { signal } from '@angular/core';
import {
  FEATURED_CITY_LOCATIONS,
  FrenchCityLocation,
  normalizeSearchText,
  slugifyLocationId,
} from './french-locations';

/** @deprecated Use FrenchCityLocation */
export type DiscoverLocation = FrenchCityLocation;

/** @deprecated Use FEATURED_CITY_LOCATIONS */
export const DISCOVER_LOCATIONS = FEATURED_CITY_LOCATIONS;

type CityTuple = [name: string, departmentName: string, lat: number, lng: number];

const CITIES_ASSET_URL = '/assets/french-cities.json';
const SEARCH_RESULT_LIMIT = 50;
const MIN_QUERY_LENGTH = 2;

export type FrenchCitiesLoadState = 'idle' | 'loading' | 'ready' | 'error';

export const frenchCitiesLoadState = signal<FrenchCitiesLoadState>('idle');

interface FrenchCityIndexEntry {
  name: string;
  departmentName: string;
  lat: number;
  lng: number;
  normalized: string;
}

let frenchCityIndex: FrenchCityIndexEntry[] | null = null;
let loadPromise: Promise<void> | null = null;

export function preloadFrenchCities(): Promise<void> {
  if (frenchCityIndex) {
    frenchCitiesLoadState.set('ready');
    return Promise.resolve();
  }

  if (loadPromise) {
    return loadPromise;
  }

  frenchCitiesLoadState.set('loading');

  loadPromise = fetch(CITIES_ASSET_URL)
    .then((response) => {
      if (!response.ok) {
        throw new Error(`Failed to load ${CITIES_ASSET_URL} (${response.status})`);
      }
      return response.json() as Promise<CityTuple[]>;
    })
    .then((tuples) => {
      frenchCityIndex = tuples.map(([name, departmentName, lat, lng]) => ({
        name,
        departmentName,
        lat,
        lng,
        normalized: normalizeSearchText(name),
      }));
      frenchCitiesLoadState.set('ready');
    })
    .catch((error) => {
      frenchCitiesLoadState.set('error');
      loadPromise = null;
      console.error('[french-cities] Load failed:', error);
      throw error;
    });

  return loadPromise;
}

export function isFrenchCitiesLoaded(): boolean {
  return frenchCityIndex !== null;
}

function toFrenchCityLocation(entry: FrenchCityIndexEntry): FrenchCityLocation {
  return {
    id: `${slugifyLocationId(entry.name)}-${slugifyLocationId(entry.departmentName)}`,
    name: entry.name,
    subtitle: entry.departmentName,
    lat: entry.lat,
    lng: entry.lng,
  };
}

function rankMatch(entry: FrenchCityIndexEntry, needle: string): number {
  if (entry.normalized === needle) {
    return 0;
  }
  if (entry.normalized.startsWith(needle)) {
    return 1;
  }
  return 2;
}

export function searchFrenchCities(query: string): FrenchCityLocation[] {
  const needle = normalizeSearchText(query);
  if (!needle || needle.length < MIN_QUERY_LENGTH || !frenchCityIndex) {
    return [];
  }

  const matches: { location: FrenchCityLocation; rank: number }[] = [];

  for (const entry of frenchCityIndex) {
    if (!entry.normalized.includes(needle)) {
      continue;
    }

    matches.push({
      location: toFrenchCityLocation(entry),
      rank: rankMatch(entry, needle),
    });

    if (matches.length >= SEARCH_RESULT_LIMIT * 4) {
      break;
    }
  }

  matches.sort((a, b) => {
    if (a.rank !== b.rank) {
      return a.rank - b.rank;
    }
    return a.location.name.localeCompare(b.location.name, 'fr');
  });

  return matches.slice(0, SEARCH_RESULT_LIMIT).map((m) => m.location);
}

/** Resolve coordinates for a commune name (exact match, accent-insensitive). */
export function lookupFrenchCityByName(
  name: string,
): FrenchCityLocation | null {
  const needle = normalizeSearchText(name);
  if (!needle) {
    return null;
  }

  const featured = FEATURED_CITY_LOCATIONS.find(
    (loc) => normalizeSearchText(loc.name) === needle,
  );
  if (featured) {
    return featured;
  }

  if (!frenchCityIndex) {
    return null;
  }

  const exact = frenchCityIndex.find((entry) => entry.normalized === needle);
  return exact ? toFrenchCityLocation(exact) : null;
}
