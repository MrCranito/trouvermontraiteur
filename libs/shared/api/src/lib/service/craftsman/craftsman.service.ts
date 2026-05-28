import { inject, Injectable } from '@angular/core';
import {
  buildCraftsmanFromRelatedData,
  Craftsman,
  CraftsmanImage,
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
       )`;

@Injectable({ providedIn: 'root' })
export class CraftsmanService {
  private readonly supabase = inject(SUPABASE_CLIENT);

  async getAll(): Promise<Craftsman[]> {
    const { data, error } = await this.supabase
      .from('craftsmans')
      .select(CRAFTSMAN_DETAIL_SELECT);

    if (error) {
      throw error;
    }

    return this.mapRows(data as CraftsmanWithRelationsRow[] | null);
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
      },
      { resolveStoragePath },
    );
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
}
