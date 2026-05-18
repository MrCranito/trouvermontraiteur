export type CatererCategory =
  | 'boissons_soft'
  | 'boissons_alcool'
  | 'aperitifs'
  | 'repas'
  | 'desserts';

export type EventType =
  | 'mariage'
  | 'anniversaire'
  | 'cocktail'
  | 'entreprise'
  | 'brunch'
  | 'famille';

export type DietaryOption =
  | 'vegetarien'
  | 'vegan'
  | 'halal'
  | 'sans_gluten'
  | 'sans_lactose';

export interface CatererLocation {
  lat: number;
  lng: number;
  city: string;
  address: string;
}

export interface MenuItem {
  id: string;
  name: string;
  description: string;
  price: number;
  category: CatererCategory;
}

export interface CatererRealisation {
  id: string;
  imageUrl: string;
  caption: string;
}

export interface Caterer {
  id: string;
  name: string;
  slug: string;
  description: string;
  imageUrl: string;
  rating: number;
  reviewCount: number;
  categories: CatererCategory[];
  eventTypes: EventType[];
  dietary: DietaryOption[];
  /** ISO dates (yyyy-MM-dd) when the caterer is unavailable */
  unavailableDates: string[];
  location: CatererLocation;
  /** Photos of past events and setups */
  realisations: CatererRealisation[];
  menu: MenuItem[];
  minOrder?: number;
  deliveryRadiusKm?: number;
}
