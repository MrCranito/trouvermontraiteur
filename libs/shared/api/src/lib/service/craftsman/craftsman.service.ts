import { inject, Injectable } from '@angular/core';
import {
  buildCraftsmanFromRelatedData,
  Craftsman,
  CraftsmanImage,
  CraftsmanProUser,
  CraftsmanRecord,
  CraftsmanServiceRecord,
  CraftsmanSubCategory,
  CraftsmanUnavailability,
  SubCategory,
} from '@trouvermontraiteur/models';
import { SUPABASE_CLIENT } from '../../supabase/supabase.token';
import { CategoryRow } from '../../rows/category.row';
import { CraftsmanImageRow } from '../../rows/craftsman-image.row';
import { CraftsmanRow } from '../../rows/craftsman.row';
import { CraftsmanServiceRow } from '../../rows/craftsman-service.row';
import { CraftsmanSubCategoryRow } from '../../rows/craftsman-sub-category.row';
import { CraftsmanUnavailabilityRow } from '../../rows/craftsman-unavailability.row';
import { SubCategoryRow } from '../../rows/sub-category.row';
import { UserEstimateRow } from '../../rows/user-estimate.row';
import { UserFavoriteRow } from '../../rows/user-favorite.row';
import { UserRow } from '../user-row';
import { UsersProRow } from '../../rows/users-pro.row';
import { toCraftsmanImagePublicUrl } from '../../storage/craftsman-images.storage';

export interface CraftsmanSubCategoryWithRelationsRow
  extends CraftsmanSubCategoryRow {
  sub_categories: SubCategoryRow | null;
}

export interface UserFavoriteWithRelationsRow extends UserFavoriteRow {
  users: UserRow | null;
}

export interface UserEstimateWithRelationsRow extends UserEstimateRow {
  users: UserRow | null;
}

export interface CraftsmanWithRelationsRow extends CraftsmanRow {
  craftsmans_images: CraftsmanImageRow[] | null;
  craftsmans_services: CraftsmanServiceRow[] | null;
  craftsmans_sub_category: CraftsmanSubCategoryWithRelationsRow[] | null;
  craftsmans_unavailabilities: CraftsmanUnavailabilityRow[] | null;
  users_pro: UsersProRow | UsersProRow[] | null;
}

export interface CraftsmanSearchBounds {
  minLat: number;
  maxLat: number;
  minLng: number;
  maxLng: number;
}

export interface CraftsmanSearchFilters {
  query?: string;
  subCategoryIds?: string[];
  minRating?: number;
  projectDate?: string;
  ids?: string[];
  bounds?: CraftsmanSearchBounds;
}

export type CraftsmanSearchSort =
  | 'relevance'
  | 'rating'
  | 'reviews'
  | 'name'
  | 'price';

export interface CraftsmanPage {
  items: Craftsman[];
  from: number;
  to: number;
  total: number;
}

const CRAFTSMAN_DETAIL_SELECT = `*,
      craftsmans_services (
        id,
        name,
        description,
        price
      ),
      craftsmans_images (
        id,
        storage_path,
        sort_order
      ),
      craftsmans_unavailabilities (
        id,
        date
      ),
      craftsmans_sub_category (
        craftsman_id,
        sub_category_id,
        created_at,
        sub_categories (
          id,
          order,
          category_id,
          sub_categories_translations (
            language_code,
            name
          )
        )
       ),
      users_pro (
        owner_user_id,
        business_name
      )`;

@Injectable({ providedIn: 'root' })
export class CraftsmanService {
  private readonly supabase = inject(SUPABASE_CLIENT);

  async search(
    filters: CraftsmanSearchFilters = {},
    page = 0,
    pageSize = 20,
    sort?: CraftsmanSearchSort,
  ): Promise<CraftsmanPage> {
    const safePage = Math.max(0, page);
    const safePageSize = Math.max(1, pageSize);
    const from = safePage * safePageSize;
    const to = from + safePageSize - 1;

    const requestedIds = distinctIds(filters.ids);
    if (filters.ids && requestedIds.length === 0) {
      return { items: [], from, to: -1, total: 0 };
    }

    const subCategoryIds = distinctIds(filters.subCategoryIds);
    let query = this.supabase
      .from('craftsmans')
      .select(
        craftsmanDetailSelect(
          subCategoryIds.length > 0,
        ) as typeof CRAFTSMAN_DETAIL_SELECT,
        { count: 'exact' },
      )
      .eq('published', true)
      .is('deleted_at', null);

    if (requestedIds.length > 0) {
      query = query.in('id', requestedIds);
    }

    if (subCategoryIds.length > 0) {
      query = query.in('category_filter.sub_category_id', subCategoryIds);
    }

    if (filters.minRating != null && filters.minRating > 0) {
      query = query.gte('rating', filters.minRating);
    }

    const text = sanitizeIlike(filters.query ?? '');
    if (text) {
      query = query.or(
        `name.ilike.%${text}%,description.ilike.%${text}%,city.ilike.%${text}%,address.ilike.%${text}%`,
      );
    }

    const bounds = filters.bounds;
    if (bounds) {
      query = query
        .gte('latitude', bounds.minLat)
        .lte('latitude', bounds.maxLat)
        .gte('longitude', bounds.minLng)
        .lte('longitude', bounds.maxLng);
    }

    if (filters.projectDate) {
      const unavailableIds = await this.idsUnavailableOn(filters.projectDate);
      if (unavailableIds.length > 0) {
        query = query.not('id', 'in', `(${unavailableIds.join(',')})`);
      }
    }

    const sorted = sort ? applyCraftsmanSort(query, sort) : query;
    const { data, error, count } = await sorted.range(from, to);

    if (error) {
      throw error;
    }

    let items = this.mapRows(data as CraftsmanWithRelationsRow[] | null);
    if (sort === 'price') {
      items = [...items].sort(
        (a, b) => minServicePrice(a) - minServicePrice(b),
      );
    }

    const total = count ?? 0;
    return {
      items,
      total,
      from,
      to: items.length === 0 ? -1 : from + items.length - 1,
    };
  }

  async getAll(): Promise<Craftsman[]> {
    const { data, error } = await this.supabase
      .from('craftsmans')
      .select(CRAFTSMAN_DETAIL_SELECT)
      .eq('published', true)
      .is('deleted_at', null);

    if (error) {
      throw error;
    }

    return this.mapRows(data as CraftsmanWithRelationsRow[] | null);
  }

  async getByIds(ids: string[]): Promise<Craftsman[]> {
    const uniqueIds = [...new Set(ids.filter(Boolean))];
    if (uniqueIds.length === 0) {
      return [];
    }

    const { data, error } = await this.supabase
      .from('craftsmans')
      .select(CRAFTSMAN_DETAIL_SELECT)
      .in('id', uniqueIds)
      .eq('published', true)
      .is('deleted_at', null);

    if (error) {
      throw error;
    }

    return this.mapRows(data as CraftsmanWithRelationsRow[] | null);
  }

  /**
   * Published craftsmen for one main category (discover home section).
   */
  async getByCategoryId(categoryId: string, limit = 10): Promise<Craftsman[]> {
    const { data, error } = await this.supabase
      .from('craftsmans')
      .select(
        `*,
      craftsmans_services (
        id,
        name,
        description,
        price
      ),
      craftsmans_images (
        id,
        storage_path,
        sort_order
      ),
      craftsmans_unavailabilities (
        id,
        date
      ),
      craftsmans_sub_category!inner (
        craftsman_id,
        sub_category_id,
        created_at,
        sub_categories!inner (
          id,
          order,
          category_id,
          sub_categories_translations (
            language_code,
            name
          )
        )
       ),
      users_pro (
        owner_user_id,
        business_name
      )`,
      )
      .eq('published', true)
      .is('deleted_at', null)
      .eq('craftsmans_sub_category.sub_categories.category_id', categoryId)
      .order('rating', { ascending: false })
      .limit(limit);

    if (error) {
      throw error;
    }

    return this.mapRows(data as CraftsmanWithRelationsRow[] | null);
  }

  /**
   * Published craftsmen for one subcategory (discover category drill-down).
   */
  async getBySubCategoryId(
    subCategoryId: string,
    limit = 10,
  ): Promise<Craftsman[]> {
    const { data, error } = await this.supabase
      .from('craftsmans')
      .select(
        `*,
      craftsmans_services (
        id,
        name,
        description,
        price
      ),
      craftsmans_images (
        id,
        storage_path,
        sort_order
      ),
      craftsmans_unavailabilities (
        id,
        date
      ),
      craftsmans_sub_category!inner (
        craftsman_id,
        sub_category_id,
        created_at,
        sub_categories (
          id,
          order,
          category_id,
          sub_categories_translations (
            language_code,
            name
          )
        )
       ),
      users_pro (
        owner_user_id,
        business_name
      )`,
      )
      .eq('published', true)
      .is('deleted_at', null)
      .eq('craftsmans_sub_category.sub_category_id', subCategoryId)
      .order('rating', { ascending: false })
      .limit(limit);

    if (error) {
      throw error;
    }

    return this.mapRows(data as CraftsmanWithRelationsRow[] | null);
  }

  async getById(id: string): Promise<Craftsman | null> {
    const { data, error } = await this.supabase
      .from('craftsmans')
      .select(CRAFTSMAN_DETAIL_SELECT)
      .eq('id', id)
      .eq('published', true)
      .is('deleted_at', null)
      .maybeSingle();

    if (error) {
      throw error;
    }

    if (!data) {
      return null;
    }

    return this.mapRows([data as CraftsmanWithRelationsRow])[0] ?? null;
  }

  async getByOwnerUserId(ownerUserId: string): Promise<Craftsman | null> {
    return this.getByOwnerUserProId(ownerUserId);
  }

  async getByOwnerUserProId(ownerUserProId: string): Promise<Craftsman | null> {
    const { data, error } = await this.supabase
      .from('craftsmans')
      .select(CRAFTSMAN_DETAIL_SELECT)
      .eq('owner_user_pro_id', ownerUserProId)
      .maybeSingle();

    if (error) {
      throw error;
    }

    if (!data) {
      return null;
    }

    return this.mapRows([data as CraftsmanWithRelationsRow])[0] ?? null;
  }

  async createForOwner(input: {
    ownerUserId: string;
    name: string;
    address?: string;
    city?: string;
    postalCode?: string;
    description?: string;
  }): Promise<Craftsman> {
    const { data, error } = await this.supabase
      .from('craftsmans')
      .insert({
        owner_user_pro_id: input.ownerUserId,
        name: input.name.trim(),
        address: input.address?.trim() ?? '',
        city: input.city?.trim() ?? '',
        postal_code: input.postalCode?.trim() ?? '',
        description: input.description?.trim() ?? '',
        published: false,
      })
      .select(CRAFTSMAN_DETAIL_SELECT)
      .single();

    if (error) {
      throw error;
    }

    return this.mapRows([data as CraftsmanWithRelationsRow])[0];
  }

  async updateProfile(
    craftsmanId: string,
    patch: {
      name?: string;
      description?: string;
      published?: boolean;
      address?: string;
      city?: string;
      postal_code?: string;
    },
  ): Promise<void> {
    const { error } = await this.supabase
      .from('craftsmans')
      .update({
        ...patch,
        updated_at: new Date().toISOString(),
      })
      .eq('id', craftsmanId);

    if (error) {
      throw error;
    }
  }

  private mapRows(rows: CraftsmanWithRelationsRow[] | null): Craftsman[] {
    const resolveStoragePath = (storagePath: string) =>
      toCraftsmanImagePublicUrl(this.supabase, storagePath);

    return rows?.map((row) => this.mapRow(row, resolveStoragePath)) ?? [];
  }

  private mapRow(
    row: CraftsmanWithRelationsRow,
    resolveStoragePath: (storagePath: string) => string,
  ): Craftsman {
    const craftsman = this.mapCraftsmanRecord(row);
    const craftsmanId = craftsman.id;

    return buildCraftsmanFromRelatedData(
      {
        craftsman,
        images: (row.craftsmans_images ?? []).map((image) =>
          this.mapImageRow(image, craftsmanId),
        ),
        services: (row.craftsmans_services ?? []).map((service) =>
          this.mapServiceRow(service, craftsmanId),
        ),
        craftsmanSubCategories: (row.craftsmans_sub_category ?? []).map(
          (link) => this.mapSubCategoryLinkRow(link),
        ),
        subCategories: this.collectSubCategories(
          row.craftsmans_sub_category ?? [],
        ),
        unavailabilities: (row.craftsmans_unavailabilities ?? []).map((item) =>
          this.mapUnavailabilityRow(item, craftsmanId),
        ),
        proUser: this.mapProUser(row.users_pro),
      },
      { resolveStoragePath },
    );
  }

  private mapProUser(
    row: UsersProRow | UsersProRow[] | null | undefined,
  ): CraftsmanProUser | null {
    const proUser = Array.isArray(row) ? row[0] : row;
    const id = proUser?.owner_user_id?.trim() ?? '';
    if (!id) {
      return null;
    }

    return {
      id,
      businessName: proUser?.business_name?.trim() ?? '',
    };
  }

  private mapCraftsmanRecord(row: CraftsmanRow): CraftsmanRecord {
    return {
      id: row.id,
      name: row.name,
      description: row.description?.trim() ?? '',
      published: row.published,
      ownerUserId: row.owner_user_pro_id,
      latitude: row.latitude,
      longitude: row.longitude,
      address: row.address,
      city: row.city,
      postalCode: row.postal_code,
      rating: toNumber(row.rating),
      reviewCount: toNumber(row.review_count),
      createdAt: new Date(row.created_at),
      updatedAt: new Date(row.updated_at),
      deletedAt: row.deleted_at ? new Date(row.deleted_at) : null,
    };
  }

  private mapImageRow(
    row: CraftsmanImageRow,
    craftsmanId: string,
  ): CraftsmanImage {
    return {
      id: row.id,
      craftsmanId: row.craftsman_id ?? row.craftman_id ?? craftsmanId,
      storagePath: row.storage_path,
      sortOrder: row.sort_order,
      createdAt: row.created_at ? new Date(row.created_at) : new Date(0),
    };
  }

  private mapServiceRow(
    row: CraftsmanServiceRow,
    craftsmanId: string,
  ): CraftsmanServiceRecord {
    return {
      id: row.id,
      name: row.name,
      description: row.description,
      price: row.price,
      ownerCraftsmanId: row.owner_craftsman_id ?? craftsmanId,
      createdAt: new Date(row.created_at),
    };
  }

  private mapSubCategoryLinkRow(
    row: CraftsmanSubCategoryRow,
  ): CraftsmanSubCategory {
    return {
      craftsmanId: row.craftsman_id,
      subCategoryId: row.sub_category_id,
      createdAt: new Date(row.created_at),
    };
  }

  private collectSubCategories(
    links: CraftsmanSubCategoryWithRelationsRow[],
  ): SubCategory[] {
    const byId = new Map<string, SubCategory>();

    for (const link of links) {
      const sub = link.sub_categories;
      if (!sub) {
        continue;
      }
      byId.set(sub.id, {
        id: sub.id,
        order: sub.order,
        categoryId: sub.category_id,
        translations: sub.sub_categories_translations ?? [],
      });
    }

    return [...byId.values()];
  }

  private mapUnavailabilityRow(
    row: CraftsmanUnavailabilityRow,
    craftsmanId: string,
  ): CraftsmanUnavailability {
    const ownerCraftsmanId =
      row.craftsman_id ?? row.owner_craftsman_id ?? craftsmanId;

    return {
      id: row.id,
      date: new Date(row.date),
      ownerCraftsmanId,
      createdAt: row.created_at ? new Date(row.created_at) : new Date(0),
    };
  }

  private async idsUnavailableOn(projectDate: string): Promise<string[]> {
    if (!/^\d{4}-\d{2}-\d{2}$/.test(projectDate)) {
      return [];
    }

    const start = `${projectDate}T00:00:00.000Z`;
    const end = new Date(start);
    end.setUTCDate(end.getUTCDate() + 1);

    const { data, error } = await this.supabase
      .from('craftsmans_unavailabilities')
      .select('craftsman_id, owner_craftsman_id')
      .gte('date', start)
      .lt('date', end.toISOString());

    if (error) {
      throw error;
    }

    const ids = new Set<string>();
    for (const row of data ?? []) {
      const id = row.craftsman_id ?? row.owner_craftsman_id;
      if (id) {
        ids.add(id);
      }
    }
    return [...ids];
  }
}

function toNumber(value: number | string | null | undefined): number {
  const parsed = typeof value === 'number' ? value : Number(value);
  return Number.isFinite(parsed) ? parsed : 0;
}

function distinctIds(ids: string[] | undefined): string[] {
  return [
    ...new Set((ids ?? []).map((id) => id.trim()).filter((id) => id.length > 0)),
  ];
}

function craftsmanDetailSelect(filterBySubCategory: boolean): string {
  if (!filterBySubCategory) {
    return CRAFTSMAN_DETAIL_SELECT;
  }

  return `category_filter:craftsmans_sub_category!inner(sub_category_id), ${CRAFTSMAN_DETAIL_SELECT}`;
}

function sanitizeIlike(value: string): string {
  return value
    .replace(/[%_,.()]/g, ' ')
    .replace(/\s+/g, ' ')
    .trim();
}

function minServicePrice(craftsman: Craftsman): number {
  if (craftsman.services.length === 0) {
    return Number.POSITIVE_INFINITY;
  }
  return Math.min(...craftsman.services.map((item) => item.price));
}

function applyCraftsmanSort<
  T extends {
    order: (
      column: string,
      options: { ascending: boolean },
    ) => T;
  },
>(query: T, sort: CraftsmanSearchSort): T {
  switch (sort) {
    case 'rating':
      return query
        .order('rating', { ascending: false })
        .order('id', { ascending: true });
    case 'reviews':
      return query
        .order('review_count', { ascending: false })
        .order('id', { ascending: true });
    case 'name':
    case 'price':
      return query
        .order('name', { ascending: true })
        .order('id', { ascending: true });
    case 'relevance':
    default:
      return query
        .order('rating', { ascending: false })
        .order('review_count', { ascending: false })
        .order('id', { ascending: true });
  }
}
