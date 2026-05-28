export interface FrenchCityLocation {
  id: string;
  name: string;
  subtitle: string;
  lat: number;
  lng: number;
}

/** Featured destinations shown before the user types. */
export const FEATURED_CITY_LOCATIONS: readonly FrenchCityLocation[] = [
  {
    id: 'paris',
    name: 'Paris',
    subtitle: 'Île-de-France',
    lat: 48.8566,
    lng: 2.3522,
  },
  {
    id: 'lyon',
    name: 'Lyon',
    subtitle: 'Auvergne-Rhône-Alpes',
    lat: 45.7578,
    lng: 4.832,
  },
  {
    id: 'marseille',
    name: 'Marseille',
    subtitle: "Provence-Alpes-Côte d'Azur",
    lat: 43.2965,
    lng: 5.3698,
  },
  {
    id: 'toulouse',
    name: 'Toulouse',
    subtitle: 'Occitanie',
    lat: 43.6047,
    lng: 1.4442,
  },
  {
    id: 'bordeaux',
    name: 'Bordeaux',
    subtitle: 'Nouvelle-Aquitaine',
    lat: 44.8378,
    lng: -0.5792,
  },
  {
    id: 'nice',
    name: 'Nice',
    subtitle: "Provence-Alpes-Côte d'Azur",
    lat: 43.7102,
    lng: 7.262,
  },
  {
    id: 'lille',
    name: 'Lille',
    subtitle: 'Hauts-de-France',
    lat: 50.6292,
    lng: 3.0573,
  },
  {
    id: 'nantes',
    name: 'Nantes',
    subtitle: 'Pays de la Loire',
    lat: 47.2184,
    lng: -1.5536,
  },
  {
    id: 'strasbourg',
    name: 'Strasbourg',
    subtitle: 'Grand Est',
    lat: 48.5734,
    lng: 7.7521,
  },
  {
    id: 'montpellier',
    name: 'Montpellier',
    subtitle: 'Occitanie',
    lat: 43.6108,
    lng: 3.8767,
  },
];

export function normalizeSearchText(value: string): string {
  return value
    .normalize('NFD')
    .replace(/\p{M}/gu, '')
    .toLowerCase()
    .trim();
}

export function slugifyLocationId(name: string): string {
  return name
    .normalize('NFD')
    .replace(/\p{M}/gu, '')
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-|-$/g, '');
}
