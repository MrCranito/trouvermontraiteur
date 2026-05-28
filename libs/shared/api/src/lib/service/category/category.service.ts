import { inject, Injectable } from '@angular/core';
import { Category, SubCategory } from '@trouvermontraiteur/models';
import { SUPABASE_CLIENT } from '../../supabase/supabase.token';
import { CategoryRow } from '../../rows/category.row';
import { SubCategoryRow } from '../../rows/sub-category.row';

@Injectable({ providedIn: 'root' })
export class CategoryService {
  private readonly supabase = inject(SUPABASE_CLIENT);

  async getAll(): Promise<Category[]> {
    const { data, error } = await this.supabase
      .from('categories')
      .select(
        `id,
        order,
        categories_translations (
          language_code,
          name
        ),
        sub_categories (
          id,
          order,
          category_id,
          sub_categories_translations:sub_categories_translations (
            language_code,
            name
          )
        )`,
      )
      .order('order')
      .order('order', { foreignTable: 'sub_categories' });

    if (error) {
      throw error;
    }

    return (data as CategoryRow[] | null)?.map((row) => this.mapRow(row)) ?? [];
  }

  private mapRow(row: CategoryRow): Category {
    return {
      id: row.id,
      translations: row.categories_translations,
      order: row.order,
      subCategories: (row.sub_categories ?? []).map((subCategory) =>
        this.mapSubCategoryRow(subCategory),
      ),
    };
  }

  private mapSubCategoryRow(row: SubCategoryRow): SubCategory {
    return {
      id: row.id,
      order: row.order,
      categoryId: row.category_id,
      translations: row.sub_categories_translations ?? [],
    };
  }
}
