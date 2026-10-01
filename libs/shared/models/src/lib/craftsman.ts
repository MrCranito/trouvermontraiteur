import type { CraftsmanTrade } from './trade-families';
import type {
  CraftsmanImage,
  CraftsmanRecord,
  CraftsmanServiceRecord,
  CraftsmanSubCategory,
  CraftsmanUnavailability,
  SubCategory,
} from './database';
import { resolveSubCategoryTranslation } from './category-i18n';
import { ALL_TRADES } from './trade-families';

export type { CraftsmanTrade } from './trade-families';

/** Shown when a craftsman has no linked photos. Served from the app public folder. */
export const CRAFTSMAN_EMPTY_IMAGE_URL = '/images/empty_image.png';

export function craftsmanCoverImage(
  imageUrl: string | null | undefined,
): string {
  const trimmed = imageUrl?.trim() ?? '';
  return trimmed || CRAFTSMAN_EMPTY_IMAGE_URL;
}

export type ProjectType =
  | 'renovation'
  | 'depannage'
  | 'construction'
  | 'entretien'
  | 'amenagement'
  | 'conseil';

export type ServiceOption =
  | 'devis_gratuit'
  | 'urgence'
  | 'garantie_decennale'
  | 'rge';

export interface CraftsmanLocation {
  lat: number;
  lng: number;
  city: string;
  address: string;
  postalCode: string;
}

export interface ServiceItem {
  id: string;
  name: string;
  description: string;
  price: number;
  category: CraftsmanTrade;
}

export interface CraftsmanRealisation {
  id: string;
  imageUrl: string;
  caption: string;
}

/** Professional account linked to a craftsman, when one exists. */
export interface CraftsmanProUser {
  id: string;
  businessName: string;
}

export interface Craftsman {
  id: string;
  name: string;
  slug: string;
  description: string;
  imageUrl: string;
  published: boolean;
  rating: number;
  reviewCount: number;
  /** True when a professional account is included on this profile. */
  certified: boolean;
  /** Linked professional account, or null when none is available. */
  proUser: CraftsmanProUser | null;
  subCategoryIds: string[];
  trades: CraftsmanTrade[];
  projectTypes: ProjectType[];
  serviceOptions: ServiceOption[];
  /** ISO dates (yyyy-MM-dd) when unavailable (legacy / fallback). */
  unavailableDates: string[];
  /** ISO dates when bookings are accepted. When non-empty, only these dates count as available. */
  availableDates: string[];
  location: CraftsmanLocation;
  realisations: CraftsmanRealisation[];
  services: ServiceItem[];
  minOrder?: number;
  deliveryRadiusKm?: number;
  deleted_at: Date | null;
}

export interface CraftsmanBuildInput {
  craftsman: CraftsmanRecord;
  images: CraftsmanImage[];
  services: CraftsmanServiceRecord[];
  craftsmanSubCategories: CraftsmanSubCategory[];
  subCategories: SubCategory[];
  unavailabilities: CraftsmanUnavailability[];
  proUser?: CraftsmanProUser | null;
}

export interface CraftsmanBuildOptions {
  /** Maps `craftsmans_images.storage_path` to a browser-ready URL. */
  resolveStoragePath?: (storagePath: string) => string;
}

function toIsoDate(date: Date): string {
  return date.toISOString().slice(0, 10);
}

function slugify(value: string): string {
  return value
    .toLowerCase()
    .normalize('NFD')
    .replace(/\p{M}/gu, '')
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/(^-|-$)/g, '');
}

export function resolveCraftsmanTradeFromSubCategoryLabel(
  subCategoryLabel: string,
): CraftsmanTrade | null {
  const normalized = slugify(subCategoryLabel).replace(/-/g, '_');
  return ALL_TRADES.includes(normalized as CraftsmanTrade)
    ? (normalized as CraftsmanTrade)
    : null;
}

export function buildCraftsmanFromRelatedData(
  input: CraftsmanBuildInput,
  options: CraftsmanBuildOptions = {},
): Craftsman {
  const { craftsman } = input;
  const resolveStoragePath =
    options.resolveStoragePath ?? ((storagePath: string) => storagePath);

  const craftsmanImages = input.images
    .filter((item) => item.craftsmanId === craftsman.id)
    .sort((a, b) => a.sortOrder - b.sortOrder);

  const linkedSubCategoryIds = new Set(
    input.craftsmanSubCategories
      .filter((item) => item.craftsmanId === craftsman.id)
      .map((item) => item.subCategoryId),
  );

  const trades = input.subCategories
    .filter((item) => linkedSubCategoryIds.has(item.id))
    .map((item) =>
      resolveCraftsmanTradeFromSubCategoryLabel(
        resolveSubCategoryTranslation(item, 'fr'),
      ),
    )
    .filter((item): item is CraftsmanTrade => item !== null);

  const uniqueTrades = [...new Set(trades)];
  const primaryTrade = uniqueTrades[0] ?? ALL_TRADES[0];

  const services: ServiceItem[] = input.services
    .filter((item) => item.ownerCraftsmanId === craftsman.id)
    .map((item) => ({
      id: String(item.id),
      name: item.name,
      description: item.description ?? '',
      price: item.price,
      category: primaryTrade,
    }));

  const unavailableDates = input.unavailabilities
    .filter((item) => item.ownerCraftsmanId === craftsman.id)
    .map((item) => toIsoDate(item.date));

  return {
    id: craftsman.id,
    name: craftsman.name,
    slug: slugify(craftsman.name),
    deleted_at: craftsman.deletedAt,
    published: craftsman.published,
    description: craftsman.description ?? '',
    imageUrl: craftsmanImages[0]
      ? resolveStoragePath(craftsmanImages[0].storagePath)
      : '',
    rating: craftsman.rating,
    reviewCount: craftsman.reviewCount,
    proUser: input.proUser ?? null,
    certified: input.proUser != null,
    subCategoryIds: [...linkedSubCategoryIds],
    trades: uniqueTrades,
    projectTypes: [],
    serviceOptions: [],
    unavailableDates,
    availableDates: [],
    location: {
      lat: craftsman.latitude ?? 0,
      lng: craftsman.longitude ?? 0,
      city: craftsman.city ?? '',
      address: craftsman.address ?? '',
      postalCode: craftsman.postalCode ?? '',
    },
    realisations: craftsmanImages.map((item) => ({
      id: item.id,
      imageUrl: resolveStoragePath(item.storagePath),
      caption: '',
    })),
    services,
  };
}
