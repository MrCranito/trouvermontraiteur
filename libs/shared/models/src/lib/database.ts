export interface CategoryTranslation {
  language_code: string;
  name: string;
}

export interface Category {
  id: string;
  /** PrimeIcons classes, for example `pi pi-camera`. */
  icon: string;
  translations: CategoryTranslation[];
  order: number;
  subCategories: SubCategory[];
}

export interface SubCategoryTranslation {
  language_code: string;
  name: string;
}

export interface SubCategory {
  id: string;
  order: number;
  categoryId: string;
  translations: SubCategoryTranslation[];
}

export interface CraftsmanRecord {
  id: string;
  name: string;
  description: string;
  published: boolean;
  ownerUserId: string | null;
  latitude: number | null;
  longitude: number | null;
  address: string | null;
  city: string | null;
  postalCode: string | null;
  rating: number;
  reviewCount: number;
  createdAt: Date;
  updatedAt: Date;
  deletedAt: Date | null;
}

export interface CraftsmanImage {
  id: string;
  craftsmanId: string;
  storagePath: string;
  sortOrder: number;
  createdAt: Date;
}

export interface CraftsmanServiceRecord {
  id: number;
  name: string;
  description: string | null;
  price: number;
  ownerCraftsmanId: string;
  createdAt: Date;
}

export interface CraftsmanSubCategory {
  craftsmanId: string;
  subCategoryId: string;
  createdAt: Date;
}

export interface CraftsmanUnavailability {
  id: string;
  date: Date;
  ownerCraftsmanId: string;
  createdAt: Date;
}

export interface UserRecord {
  id: string;
  email: string;
  phone: string | null;
  firstName: string | null;
  lastName: string | null;
  fullName: string | null;
  avatarUrl: string | null;
  createdAt: Date;
  updatedAt: Date;
}

export interface UserEstimate {
  id: number;
  ownerUserId: string;
  ownerCraftsmanId: string;
  createdAt: Date;
}

export interface UserFavorite {
  id: number;
  ownerUserId: string;
  craftsmanId: string;
  createdAt: Date;
}

export type UserProContractStatus =
  | 'draft'
  | 'sent'
  | 'signed'
  | 'cancelled';

export interface UserProContract {
  id: string;
  ownerUserId: string;
  title: string | null;
  clientName: string;
  clientEmail: string | null;
  clientPhone: string | null;
  eventType: string | null;
  eventDate: string | null;
  guestCount: number | null;
  amountCents: number | null;
  currency: string;
  status: UserProContractStatus;
  notes: string | null;
  signedAt: Date | null;
  createdAt: Date;
  updatedAt: Date;
}
