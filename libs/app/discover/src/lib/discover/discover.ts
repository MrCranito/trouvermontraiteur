import { Component, computed, inject, OnInit, signal } from '@angular/core';
import { Router } from '@angular/router';
import { TranslocoPipe, TranslocoService } from '@jsverse/transloco';
import { AppCraftsmanCatalogService } from '@trouvermontraiteur/app-consumer-data';
import { CategoryI18nService } from '@trouvermontraiteur/app-i18n';
import {
  FEATURED_CITY_LOCATIONS,
  lookupFrenchCityByName,
  preloadFrenchCities,
  type FrenchCityLocation,
} from '@trouvermontraiteur/data';
import { Category, Craftsman } from '@trouvermontraiteur/models';
import { buildSearchQueryParams } from '@trouvermontraiteur/search';
import { categoryIconClass } from '../category-icons';
import { DiscoverCard } from '../discover-card/discover-card';
import {
  DiscoverDatePicker,
  type DiscoverDatePickerMode,
} from '../discover-date-picker/discover-date-picker';
import {
  DiscoverCategoryPicker,
  type DiscoverCategorySelection,
} from '../discover-category-picker/discover-category-picker';
import { DiscoverLocationPicker } from '../discover-location-picker/discover-location-picker';

interface DiscoverSection {
  id: string;
  title: string;
  subtitle: string;
  categoryId: string;
  subCategoryId?: string;
  craftsmen: Craftsman[];
}

type CategoryChip =
  | { type: 'back'; categoryId: string; icon: string }
  | { type: 'category'; id: string; icon: string }
  | { type: 'subCategory'; id: string; label: string };

@Component({
  selector: 'tmt-discover',
  imports: [
    DiscoverCard,
    DiscoverCategoryPicker,
    DiscoverDatePicker,
    DiscoverLocationPicker,
    TranslocoPipe,
  ],
  templateUrl: './discover.html',
  styleUrl: './discover.scss',
})
export class Discover implements OnInit {
  private readonly router = inject(Router);
  private readonly catalog = inject(AppCraftsmanCatalogService);
  private readonly categoryI18n = inject(CategoryI18nService);
  private readonly transloco = inject(TranslocoService);

  protected readonly destination = signal('');
  protected readonly selectedCity = signal<FrenchCityLocation | null>(null);
  protected readonly projectDate = signal('');
  protected readonly dateFlexDays = signal(0);
  protected readonly datePickerMode = signal<DiscoverDatePickerMode>('dates');
  protected readonly datePickerOpen = signal(false);
  protected readonly locationPickerOpen = signal(false);
  protected readonly categoryPickerOpen = signal(false);
  protected readonly searchCategoryId = signal<string | null>(null);
  protected readonly searchSubCategoryId = signal<string | null>(null);
  protected readonly selectedCategoryId = signal<string | null>(null);

  protected readonly categories = computed(() =>
    [...this.catalog.categoriesSignal()].sort((a, b) => a.order - b.order),
  );
  protected readonly loading = computed(
    () => !this.catalog.isReady() || this.catalog.categoriesSignal().length === 0,
  );
  protected readonly skeletonCategoryChipItems = [0, 1, 2, 3, 4, 5];
  protected readonly skeletonSectionItems = [0, 1, 2];
  protected readonly skeletonRowItems = [0, 1, 2, 3];

  ngOnInit(): void {
    void this.bootstrapCategoryPreviews();
  }

  private async bootstrapCategoryPreviews(): Promise<void> {
    await this.catalog.ensureCategories();
    for (const category of this.categories()) {
      void this.catalog.loadCategoryPreview(category.id);
    }
  }

  protected readonly searchCategoryLabel = computed(() => {
    this.categoryI18n.activeLang();

    const subCategoryId = this.searchSubCategoryId();
    if (subCategoryId) {
      const subCategory = this.catalog
        .subCategoriesSignal()
        .find((item) => item.id === subCategoryId);
      return subCategory ? this.categoryI18n.subCategoryLabel(subCategory) : '';
    }

    const categoryId = this.searchCategoryId();
    if (categoryId) {
      return this.categoryLabel(categoryId);
    }

    return '';
  });

  protected readonly categoryChips = computed((): CategoryChip[] => {
    const categoryId = this.selectedCategoryId();
    if (!categoryId) {
      return this.categories().map((category) => {
        return {
          type: 'category' as const,
          id: category.id,
          icon: this.categoryIcon(category),
        };
      });
    }

    const category = this.categories().find((item) => item.id === categoryId);
    if (!category) {
      return [];
    }

    const subCategories = this.catalog.getSubCategoriesForCategory(categoryId);
    return [
      {
        type: 'back' as const,
        categoryId,
        icon: this.categoryIcon(category),
      },
      ...subCategories.map((subCategory) => ({
        type: 'subCategory' as const,
        id: subCategory.id,
        label: this.categoryI18n.subCategoryLabel(subCategory),
      })),
    ];
  });

  protected readonly sections = computed((): DiscoverSection[] => {
    this.categoryI18n.activeLang();
    // Re-read previews when category/subcategory loads finish.
    this.catalog.craftsmenSignal();

    const categoryId = this.selectedCategoryId();

    if (!categoryId) {
      return this.categories().map((category) => ({
        id: `category-${category.id}`,
        title: '',
        subtitle: '',
        categoryId: category.id,
        craftsmen: this.catalog.getCategoryPreview(category.id),
      }));
    }

    const category = this.categories().find((item) => item.id === categoryId);
    if (!category) {
      return [];
    }

    const categoryName = this.categoryLabel(categoryId);

    return this.catalog
      .getSubCategoriesForCategory(categoryId)
      .map((subCategory) => {
        const subCategoryName = this.categoryI18n.subCategoryLabel(subCategory);
        return {
          id: `sub-category-${categoryId}-${subCategory.id}`,
          title: subCategoryName,
          subtitle: `${categoryName} — ${subCategoryName}`,
          categoryId,
          subCategoryId: subCategory.id,
          craftsmen: this.catalog.getSubCategoryPreview(subCategory.id),
        };
      });
  });

  protected isSectionLoading(section: DiscoverSection): boolean {
    if (section.subCategoryId) {
      return this.catalog.isSubCategoryPreviewLoading(section.subCategoryId);
    }
    return this.catalog.isCategoryPreviewLoading(section.categoryId);
  }

  protected categoryTranslocoKey(categoryId: string): string {
    return `categories.${categoryId}`;
  }

  protected hasCategoryTranslocoKey(categoryId: string): boolean {
    this.categoryI18n.activeLang();
    const lang = this.transloco.getActiveLang();
    const dictionary = this.transloco.getTranslation(lang) as
      | { categories?: Record<string, string> }
      | undefined;
    return Boolean(dictionary?.categories?.[categoryId]);
  }

  protected categoryLabel(categoryId: string): string {
    if (this.hasCategoryTranslocoKey(categoryId)) {
      return this.transloco.translate(this.categoryTranslocoKey(categoryId));
    }

    const category = this.categories().find((item) => item.id === categoryId);
    return category ? this.categoryI18n.name(category) : categoryId;
  }

  protected readonly categoriesAriaLabelKey = computed(() => {
    this.categoryI18n.activeLang();
    return this.selectedCategoryId()
      ? 'discover.categoriesSelected'
      : 'discover.categories';
  });

  protected openExplorer(options?: {
    query?: string;
    subCategoryIds?: string[];
    projectDate?: string;
    mapLat?: number | null;
    mapLng?: number | null;
  }): void {
    void this.router.navigate(['/explorer'], {
      queryParams: buildSearchQueryParams({
        query: options?.query ?? this.destination(),
        minRating: 0,
        trades: [],
        subCategoryIds:
          options?.subCategoryIds ?? this.subCategoryIdsForExplorer(),
        projectDate: options?.projectDate ?? this.projectDate(),
        projectTypes: [],
        serviceOptions: [],
        sort: 'relevance',
        view: 'grid',
        mapLat: options?.mapLat ?? null,
        mapLng: options?.mapLng ?? null,
      }),
    });
  }

  protected onSearchSubmit(): void {
    void this.submitWithCityCoordinates();
  }

  private async submitWithCityCoordinates(): Promise<void> {
    const coords = await this.resolveCityCoordinates();
    this.openExplorer({
      subCategoryIds: this.subCategoryIdsForExplorer(),
      mapLat: coords?.lat ?? null,
      mapLng: coords?.lng ?? null,
    });
  }

  private subCategoryIdsForExplorer(): string[] {
    const subCategoryId = this.searchSubCategoryId();
    if (subCategoryId) {
      return [subCategoryId];
    }

    const categoryId = this.searchCategoryId();
    if (!categoryId) {
      return [];
    }

    return this.catalog
      .getSubCategoriesForCategory(categoryId)
      .map((subCategory) => subCategory.id);
  }

  private async resolveCityCoordinates(): Promise<{
    lat: number;
    lng: number;
  } | null> {
    const picked = this.selectedCity();
    if (picked) {
      return { lat: picked.lat, lng: picked.lng };
    }

    const name = this.destination().trim();
    if (!name) {
      return null;
    }

    const featured = FEATURED_CITY_LOCATIONS.find((c) => c.name === name);
    if (featured) {
      return { lat: featured.lat, lng: featured.lng };
    }

    await preloadFrenchCities();
    const city = lookupFrenchCityByName(name);
    return city ? { lat: city.lat, lng: city.lng } : null;
  }

  protected projectDateLabel(): string {
    if (this.datePickerMode() === 'flexible' && !this.projectDate()) {
      return 'Dates flexibles';
    }

    const raw = this.projectDate();
    if (!raw) {
      return '';
    }

    const parsed = new Date(`${raw}T12:00:00`);
    if (Number.isNaN(parsed.getTime())) {
      return raw;
    }

    const formatted = new Intl.DateTimeFormat('fr-FR', {
      day: 'numeric',
      month: 'short',
      year: 'numeric',
    }).format(parsed);

    const flex = this.dateFlexDays();
    if (flex > 0) {
      const dayLabel = flex === 1 ? 'jour' : 'jours';
      return `${formatted} ± ${flex} ${dayLabel}`;
    }

    return formatted;
  }

  protected openCategoryPicker(event?: Event): void {
    event?.stopPropagation();
    this.datePickerOpen.set(false);
    this.locationPickerOpen.set(false);
    this.categoryPickerOpen.set(true);
  }

  protected closeCategoryPicker(): void {
    this.categoryPickerOpen.set(false);
  }

  protected onCategorySelect(selection: DiscoverCategorySelection): void {
    this.searchCategoryId.set(selection.categoryId);
    this.searchSubCategoryId.set(selection.subCategoryId);
    this.closeCategoryPicker();
  }

  protected openLocationPicker(event?: Event): void {
    event?.stopPropagation();
    this.datePickerOpen.set(false);
    this.categoryPickerOpen.set(false);
    this.locationPickerOpen.set(true);
    void preloadFrenchCities();
  }

  protected closeLocationPicker(): void {
    this.locationPickerOpen.set(false);
  }

  protected onDestinationInput(event: Event): void {
    const value = (event.target as HTMLInputElement).value;
    this.destination.set(value);
    this.selectedCity.set(null);
    this.openLocationPicker();
  }

  protected onLocationSelect(location: FrenchCityLocation): void {
    this.destination.set(location.name);
    this.selectedCity.set(location);
    this.closeLocationPicker();
  }

  protected toggleDatePicker(event: Event): void {
    event.stopPropagation();
    this.locationPickerOpen.set(false);
    this.categoryPickerOpen.set(false);
    this.datePickerOpen.update((open) => !open);
  }

  protected closeDatePicker(): void {
    this.datePickerOpen.set(false);
  }

  protected onPickerDateChange(iso: string): void {
    this.projectDate.set(iso);
    this.datePickerMode.set('dates');
  }

  protected onCategoryChipClick(chip: CategoryChip): void {
    if (chip.type === 'back') {
      this.selectedCategoryId.set(null);
      this.searchCategoryId.set(null);
      this.searchSubCategoryId.set(null);
      return;
    }
    if (chip.type === 'category') {
      this.selectedCategoryId.set(chip.id);
      this.searchCategoryId.set(chip.id);
      this.searchSubCategoryId.set(null);
      void this.catalog.loadSubCategoryPreviewsForCategory(chip.id);
      return;
    }
    void this.navigateToSearchWithSubCategory(chip.id);
  }

  protected openSectionExplorer(section: DiscoverSection): void {
    if (section.subCategoryId) {
      void this.navigateToSearchWithSubCategory(section.subCategoryId);
      return;
    }
    void this.navigateToSearchWithCategory(section.categoryId);
  }

  private async navigateToSearchWithCategory(
    categoryId: string,
  ): Promise<void> {
    const previousCategoryId = this.searchCategoryId();
    const previousSubCategoryId = this.searchSubCategoryId();
    this.searchCategoryId.set(categoryId);
    this.searchSubCategoryId.set(null);

    const coords = await this.resolveCityCoordinates();
    this.openExplorer({
      subCategoryIds: this.subCategoryIdsForExplorer(),
      mapLat: coords?.lat ?? null,
      mapLng: coords?.lng ?? null,
    });

    this.searchCategoryId.set(previousCategoryId);
    this.searchSubCategoryId.set(previousSubCategoryId);
  }

  private async navigateToSearchWithSubCategory(
    subCategoryId: string,
  ): Promise<void> {
    const subCategory = this.catalog
      .subCategoriesSignal()
      .find((item) => item.id === subCategoryId);
    if (!subCategory) {
      return;
    }

    const previousCategoryId = this.searchCategoryId();
    const previousSubCategoryId = this.searchSubCategoryId();
    this.searchCategoryId.set(subCategory.categoryId);
    this.searchSubCategoryId.set(subCategoryId);

    const coords = await this.resolveCityCoordinates();
    this.openExplorer({
      subCategoryIds: this.subCategoryIdsForExplorer(),
      mapLat: coords?.lat ?? null,
      mapLng: coords?.lng ?? null,
    });

    this.searchCategoryId.set(previousCategoryId);
    this.searchSubCategoryId.set(previousSubCategoryId);
  }

  protected sectionExplorerLabel(section: DiscoverSection): string {
    const title = section.subCategoryId
      ? section.title
      : this.categoryLabel(section.categoryId);
    return `Explorer : ${title}`;
  }

  protected trackCategoryChip(chip: CategoryChip): string {
    if (chip.type === 'back') {
      return `back-${chip.categoryId}`;
    }
    return `${chip.type}-${chip.id}`;
  }

  private categoryIcon(category: Category): string {
    return categoryIconClass(category);
  }
}
