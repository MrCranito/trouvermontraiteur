export type CatererCategory =
  | 'boissons_soft'
  | 'boissons_alcool'
  | 'aperitifs'
  | 'repas'
  | 'desserts';

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

export interface Caterer {
  id: string;
  name: string;
  slug: string;
  description: string;
  imageUrl: string;
  rating: number;
  reviewCount: number;
  categories: CatererCategory[];
  location: CatererLocation;
  menu: MenuItem[];
  minOrder?: number;
  deliveryRadiusKm?: number;
}
