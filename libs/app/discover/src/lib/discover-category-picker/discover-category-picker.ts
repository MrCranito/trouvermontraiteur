import { Component, computed, inject, input, output, signal } from '@angular/core';
import { TranslocoPipe } from '@jsverse/transloco';
import { AppCraftsmanCatalogService } from '@trouvermontraiteur/app-consumer-data';
import { CategoryI18nService } from '@trouvermontraiteur/app-i18n';
import { Category, SubCategory } from '@trouvermontraiteur/models';
import { categoryIconClass } from '../category-icons';

export interface DiscoverCategorySelection {
  categoryId: string | null;
  subCategoryId: string | null;
}

@Component({
  selector: 'tmt-discover-category-picker',
  imports: [TranslocoPipe],
  templateUrl: './discover-category-picker.html',
  styleUrl: './discover-category-picker.scss',
})
export class DiscoverCategoryPicker {
  protected readonly catalog = inject(AppCraftsmanCatalogService);
  protected readonly categoryI18n = inject(CategoryI18nService);

  readonly categoryId = input<string | null>(null);
  readonly subCategoryId = input<string | null>(null);

  readonly select = output<DiscoverCategorySelection>();
  readonly dismiss = output<void>();

  protected readonly drillCategoryId = signal<string | null>(null);

  protected readonly categories = computed(() =>
    [...this.catalog.categoriesSignal()].sort((a, b) => a.order - b.order),
  );

  protected readonly drillCategory = computed((): Category | null => {
    const id = this.drillCategoryId();
    if (!id) {
      return null;
    }
    return this.categories().find((category) => category.id === id) ?? null;
  });

  protected readonly drillSubCategories = computed((): SubCategory[] => {
    const category = this.drillCategory();
    if (!category) {
      return [];
    }
    return this.catalog.getSubCategoriesForCategory(category.id);
  });

  protected categoryIcon(category: Category): string {
    return categoryIconClass(category);
  }

  protected onBackdropClick(event: MouseEvent): void {
    if (event.target === event.currentTarget) {
      this.dismiss.emit();
    }
  }

  protected onPanelClick(event: MouseEvent): void {
    event.stopPropagation();
  }

  protected pickAll(): void {
    this.select.emit({ categoryId: null, subCategoryId: null });
  }

  protected openCategory(categoryId: string): void {
    this.drillCategoryId.set(categoryId);
  }

  protected backToCategories(): void {
    this.drillCategoryId.set(null);
  }

  protected pickCategoryOnly(categoryId: string): void {
    this.select.emit({ categoryId, subCategoryId: null });
  }

  protected pickSubCategory(categoryId: string, subCategoryId: string): void {
    this.select.emit({ categoryId, subCategoryId });
  }

  protected isCategorySelected(categoryId: string): boolean {
    return this.categoryId() === categoryId && !this.subCategoryId();
  }

  protected isSubCategorySelected(subCategoryId: string): boolean {
    return this.subCategoryId() === subCategoryId;
  }

  protected categoryTranslocoKey(categoryId: string): string {
    return `categories.${categoryId}`;
  }

  protected categoryLabel(category: Category): string {
    return this.categoryI18n.name(category);
  }
}
