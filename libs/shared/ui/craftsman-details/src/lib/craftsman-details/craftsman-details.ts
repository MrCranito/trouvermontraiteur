import { NgClass } from '@angular/common';
import { Component, computed, inject, Injector, signal } from '@angular/core';
import { toSignal } from '@angular/core/rxjs-interop';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';
import { ConsumerAuthService } from '@trouvermontraiteur/app-auth';
import {
  AppCraftsmanCatalogService,
  ConsumerFavoritesService,
} from '@trouvermontraiteur/app-consumer-data';
import { map } from 'rxjs';
import {
  ALL_PROJECT_TYPES,
  ALL_SERVICE_OPTIONS,
  ALL_TRADES,
  buildDefaultAvailableDates,
  CraftsmanService,
  CatererDetailLayoutService,
  PROJECT_LABELS,
  SERVICE_OPTION_LABELS,
  TRADE_FAMILIES,
  TRADE_LABELS,
  type TradeFamily,
} from '@trouvermontraiteur/data';
import { AvailabilityCalendar } from '@trouvermontraiteur/availability-calendar';
import {
  Craftsman,
  CraftsmanLocation,
  CraftsmanRealisation,
  CraftsmanTrade,
  CatererDetailSectionId,
  ProjectType,
  ServiceItem,
  ServiceOption,
} from '@trouvermontraiteur/models';
import { SingleMarkerMap } from '@trouvermontraiteur/single-marker-map';
import { Button } from 'primeng/button';
import {
  Accordion,
  AccordionContent,
  AccordionHeader,
  AccordionPanel,
} from 'primeng/accordion';
import { Checkbox } from 'primeng/checkbox';
import { FormsModule } from '@angular/forms';
import { InputNumber } from 'primeng/inputnumber';
import { InputText } from 'primeng/inputtext';
import { Select } from 'primeng/select';
import { Textarea } from 'primeng/textarea';
import { Message } from 'primeng/message';
import { Rating } from 'primeng/rating';
import { ListingPhotoGallery } from '../listing-photo-gallery/listing-photo-gallery';
import { AvailabilityEditDialog } from '../availability-edit-dialog/availability-edit-dialog';
import { QuoteRequestDialog } from '../quote-request-dialog/quote-request-dialog';
import { CRAFTSMAN_DETAILS_EDIT_STORE } from '../craftsman-details-edit-store';
import { ListingDetailsSkeleton } from '../listing-details-skeleton/listing-details-skeleton';

export interface ListingPhoto {
  id: string;
  imageUrl: string;
  caption: string;
}

@Component({
  selector: 'tmt-craftsman-details',
  imports: [
    NgClass,
    ListingDetailsSkeleton,
    FormsModule,
    RouterLink,
    Button,
    Accordion,
    AccordionPanel,
    AccordionHeader,
    AccordionContent,
    Rating,
    SingleMarkerMap,
    AvailabilityCalendar,
    QuoteRequestDialog,
    AvailabilityEditDialog,
    ListingPhotoGallery,
    InputText,
    Textarea,
    InputNumber,
    Checkbox,
    Select,
    Message,
  ],
  templateUrl: './craftsman-details.html',
  styleUrl: './craftsman-details.scss',
})
export class CraftsmanDetails {
  private readonly injector = inject(Injector);
  private readonly route = inject(ActivatedRoute);
  private readonly router = inject(Router);
  private readonly craftsmanService = inject(CraftsmanService);
  private readonly catalog = inject(AppCraftsmanCatalogService, {
    optional: true,
  });
  private readonly layoutService = inject(CatererDetailLayoutService);
  private readonly editStore = inject(CRAFTSMAN_DETAILS_EDIT_STORE, {
    optional: true,
  });

  protected readonly editMode = computed(() => this.editStore !== null);

  /**
   * Consumer-only services are resolved lazily.
   * In dashboard edit mode we never resolve them, which avoids users_favorites calls.
   */
  private getConsumerAuth(): ConsumerAuthService | null {
    if (this.editMode()) {
      return null;
    }
    return this.injector.get(ConsumerAuthService, null);
  }

  private getConsumerFavorites(): ConsumerFavoritesService | null {
    if (this.editMode()) {
      return null;
    }
    return this.injector.get(ConsumerFavoritesService, null);
  }

  protected readonly quoteDialogVisible = signal(false);
  protected readonly availabilityDialogVisible = signal(false);
  protected readonly galleryVisible = signal(false);
  protected readonly galleryStartIndex = signal(0);
  protected readonly shareHintVisible = signal(false);
  protected readonly saved = signal(false);
  protected readonly publishing = signal(false);
  protected readonly editNameDialogVisible = signal(false);
  protected readonly editDescriptionDialogVisible = signal(false);
  protected readonly draftName = signal('');
  protected readonly draftDescription = signal('');

  /** Slug sur la route parente `artisans/:slug` (enfant à path `''`). */
  private readonly slug = toSignal(
    this.route.paramMap.pipe(
      map((p) => {
        const direct = p.get('slug');
        if (direct) {
          return direct;
        }
        let parent = this.route.parent;
        while (parent) {
          const fromParent = parent.snapshot.paramMap.get('slug');
          if (fromParent) {
            return fromParent;
          }
          parent = parent.parent;
        }
        return '';
      }),
    ),
    { initialValue: this.resolveSlugFromRouteTree() },
  );

  private resolveSlugFromRouteTree(): string {
    let r: ActivatedRoute | null = this.route;
    while (r) {
      const slug = r.snapshot.paramMap.get('slug');
      if (slug) {
        return slug;
      }
      r = r.parent;
    }
    return '';
  }

  protected readonly tradeFamilies = TRADE_FAMILIES;
  protected readonly projectOptions = ALL_PROJECT_TYPES.map((key) => ({
    key,
    label: PROJECT_LABELS[key],
  }));
  protected readonly serviceOptionChoices = ALL_SERVICE_OPTIONS.map((key) => ({
    key,
    label: SERVICE_OPTION_LABELS[key],
  }));

  protected name = signal('');
  protected description = signal('');
  protected imageUrl = signal('');
  protected address = signal('');
  protected city = signal('');
  protected minOrder = signal<number | null>(null);
  protected trades = signal<CraftsmanTrade[]>([]);
  protected projectTypes = signal<ProjectType[]>([]);
  protected serviceOptions = signal<ServiceOption[]>([]);
  protected serviceItems = signal<ServiceItem[]>([]);
  protected realisations = signal<CraftsmanRealisation[]>([]);
  protected availableDates = signal<string[]>([]);

  constructor() {
    if (this.editStore) {
      this.loadDraftFromStore();
    }
  }

  protected readonly completeness = computed(() =>
    this.editStore?.getCompleteness() ?? { score: 100, missing: [] },
  );

  protected readonly publishReadiness = computed(() => {
    const preview = this.previewCraftsman();
    if (!preview || !this.editStore) {
      return { canPublish: false, missing: [] as string[] };
    }
    return this.editStore.getPublishReadiness(preview);
  });

  protected readonly canPublish = computed(
    () => this.publishReadiness().canPublish,
  );

  protected readonly isProfilePublished = computed(() => {
    if (!this.editStore) {
      return false;
    }
    return this.editStore.getProfile().published;
  });

  protected readonly previewCraftsman = computed((): Craftsman | null => {
    if (!this.editMode()) {
      return null;
    }
    const base = this.editStore!.getProfile();
    return {
      ...base,
      name: this.name().trim() || base.name,
      description: this.description(),
      imageUrl: this.imageUrl().trim() || base.imageUrl,
      trades: this.trades(),
      projectTypes: this.projectTypes(),
      serviceOptions: this.serviceOptions(),
      services: this.serviceItems(),
      realisations: this.realisations(),
      availableDates: this.availableDates(),
      minOrder: this.minOrder() ?? undefined,
      location: {
        ...base.location,
        address: this.address().trim(),
        city: this.city().trim(),
        postalCode: base.location.postalCode,
      },
    };
  });

  protected readonly craftsman = computed(() => {
    if (this.editMode()) {
      return this.previewCraftsman();
    }
    return (
      this.catalog?.getBySlug(this.slug()) ??
      this.craftsmanService.getBySlug(this.slug())
    );
  });

  /** Catalogue API loading (consumer app); dashboard edit mode skips skeleton. */
  protected readonly pageLoading = computed(() => {
    if (this.editMode()) {
      return false;
    }
    return this.catalog ? !this.catalog.isReady() : false;
  });

  protected readonly orderedSections = computed((): CatererDetailSectionId[] => {
    const c = this.craftsman();
    if (!c) {
      return [];
    }
    const layout = this.layoutService.getLayout(c.slug);
    return this.layoutService.resolveVisibleSections(c, layout);
  });

  protected readonly contentSections = computed((): CatererDetailSectionId[] => {
    if (this.editMode()) {
      return ['about', 'availability', 'prestations', 'menu', 'location'];
    }
    return this.orderedSections().filter((id) => id !== 'cover');
  });

  private static readonly MOSAIC_MAX_PHOTOS = 6;

  protected readonly allPhotos = computed((): ListingPhoto[] => {
    const c = this.craftsman();
    if (!c) {
      return [];
    }

    const seen = new Set<string>();
    const photos: ListingPhoto[] = [];

    const add = (photo: ListingPhoto): void => {
      const url = photo.imageUrl.trim();
      if (!url || seen.has(url)) {
        return;
      }
      seen.add(url);
      photos.push({ ...photo, imageUrl: url });
    };

    add({ id: 'cover', imageUrl: c.imageUrl, caption: c.name });
    for (const realisation of c.realisations) {
      add({
        id: realisation.id,
        imageUrl: realisation.imageUrl,
        caption: realisation.caption || c.name,
      });
    }

    return photos;
  });

  protected readonly mosaicPhotos = computed(() =>
    this.allPhotos().slice(0, CraftsmanDetails.MOSAIC_MAX_PHOTOS),
  );

  protected readonly mosaicCount = computed(() => this.mosaicPhotos().length);

  protected readonly isFavorite = computed(() => {
    const favorites = this.getConsumerFavorites();
    if (!favorites) {
      return false;
    }
    const c = this.craftsman();
    return c ? favorites.isFavorite(c.id) : false;
  });

  protected readonly priceFrom = computed(() => {
    const c = this.craftsman();
    if (!c?.services.length) {
      return null;
    }
    return Math.min(...c.services.map((item) => item.price));
  });

  protected readonly projectLabels = PROJECT_LABELS;
  protected readonly serviceOptionLabels = SERVICE_OPTION_LABELS;

  protected readonly displayAvailableDates = computed(() => {
    if (this.editMode()) {
      const dates = this.availableDates();
      if (dates.length > 0) {
        return dates;
      }
      const base = this.editStore!.getProfile();
      return buildDefaultAvailableDates(base.unavailableDates);
    }
    const c = this.craftsman();
    if (!c) {
      return [];
    }
    if (c.availableDates.length > 0) {
      return c.availableDates;
    }
    return buildDefaultAvailableDates(c.unavailableDates);
  });

  protected readonly serviceDisplayGroups = computed(() => {
    const craftsman = this.craftsman();
    if (!craftsman) {
      return [] as {
        key: string;
        category: CraftsmanTrade;
        label: string;
        items: ServiceItem[];
      }[];
    }

    if (this.editMode()) {
      return craftsman.services.map((item) => ({
        key: item.id,
        category: item.category,
        label: TRADE_LABELS[item.category],
        items: [item],
      }));
    }

    const groups = new Map<CraftsmanTrade, ServiceItem[]>();
    for (const item of craftsman.services) {
      const list = groups.get(item.category) ?? [];
      list.push(item);
      groups.set(item.category, list);
    }

    return [...groups.entries()].map(([category, items]) => ({
      key: category,
      category,
      label: TRADE_LABELS[category],
      items,
    }));
  });

  protected readonly categoryOptions = computed(() =>
    (this.trades().length > 0 ? this.trades() : ALL_TRADES).map((key) => ({
      label: TRADE_LABELS[key],
      value: key,
    })),
  );

  protected loadDraftFromStore(): void {
    const c = this.editStore!.getProfile();
    this.name.set(c.name);
    this.description.set(c.description);
    this.imageUrl.set(c.imageUrl);
    this.address.set(c.location.address);
    this.city.set(c.location.city);
    this.minOrder.set(c.minOrder ?? null);
    this.trades.set([...c.trades]);
    this.projectTypes.set([...c.projectTypes]);
    this.serviceOptions.set([...c.serviceOptions]);
    this.serviceItems.set(structuredClone(c.services));
    this.realisations.set(structuredClone(c.realisations));
    this.availableDates.set(
      c.availableDates.length > 0
        ? [...c.availableDates]
        : buildDefaultAvailableDates(c.unavailableDates),
    );
    this.saved.set(false);
  }

  private buildDraftFromPreview(): Craftsman | null {
    const preview = this.previewCraftsman();
    if (!preview || !this.editStore) {
      return null;
    }
    return {
      ...preview,
      realisations: this.realisations().filter((r) => r.imageUrl.trim()),
      availableDates: [...this.availableDates()].sort(),
      unavailableDates: [],
    };
  }

  protected async saveDraft(): Promise<void> {
    const draft = this.buildDraftFromPreview();
    if (!draft || !this.editStore) {
      return;
    }
    this.editStore.replaceProfile(draft);
    await this.editStore.saveDraft(draft);
    this.saved.set(true);
  }

  protected async publishEdits(): Promise<void> {
    const draft = this.buildDraftFromPreview();
    if (!draft || !this.editStore || !this.canPublish()) {
      return;
    }
    this.publishing.set(true);
    try {
      this.editStore.replaceProfile(draft);
      await this.editStore.publishProfile(draft);
      this.saved.set(true);
    } finally {
      this.publishing.set(false);
    }
  }

  protected markDirty(): void {
    this.saved.set(false);
  }

  protected openNameDialog(): void {
    this.draftName.set(this.name());
    this.editNameDialogVisible.set(true);
  }

  protected closeNameDialog(): void {
    this.editNameDialogVisible.set(false);
  }

  protected saveNameDialog(): void {
    this.name.set(this.draftName().trim());
    this.markDirty();
    this.closeNameDialog();
  }

  protected openDescriptionDialog(): void {
    this.draftDescription.set(this.description());
    this.editDescriptionDialogVisible.set(true);
  }

  protected closeDescriptionDialog(): void {
    this.editDescriptionDialogVisible.set(false);
  }

  protected saveDescriptionDialog(): void {
    this.description.set(this.draftDescription());
    this.markDirty();
    this.closeDescriptionDialog();
  }

  protected isTradeChecked(trade: CraftsmanTrade): boolean {
    return this.trades().includes(trade);
  }

  protected selectedTradesInFamily(family: TradeFamily): number {
    const selected = new Set(this.trades());
    return family.trades.filter((trade) =>
      selected.has(trade.id as CraftsmanTrade),
    ).length;
  }

  protected toggleTrade(trade: CraftsmanTrade, checked: boolean): void {
    this.toggleList(this.trades, trade, checked);
    this.markDirty();
  }

  protected isProjectChecked(project: ProjectType): boolean {
    return this.projectTypes().includes(project);
  }

  protected toggleProject(project: ProjectType, checked: boolean): void {
    this.toggleList(this.projectTypes, project, checked);
    this.markDirty();
  }

  protected isServiceOptionChecked(option: ServiceOption): boolean {
    return this.serviceOptions().includes(option);
  }

  protected toggleServiceOption(option: ServiceOption, checked: boolean): void {
    this.toggleList(this.serviceOptions, option, checked);
    this.markDirty();
  }

  protected openAvailabilityDialog(): void {
    this.availabilityDialogVisible.set(true);
  }

  protected onAvailabilitySaved(dates: string[]): void {
    this.availableDates.set(dates);
    void this.saveDraft();
  }

  protected onCoverFileSelected(event: Event): void {
    const input = event.target as HTMLInputElement;
    const file = input.files?.[0];
    input.value = '';
    if (!file) {
      return;
    }
    void this.applyImageFile(file, (dataUrl) => {
      this.imageUrl.set(dataUrl);
      this.markDirty();
    });
  }

  protected onRealisationFilesSelected(event: Event): void {
    const input = event.target as HTMLInputElement;
    const files = input.files;
    input.value = '';
    if (!files?.length) {
      return;
    }
    void this.addRealisationsFromFiles(Array.from(files));
  }

  protected onReplaceRealisationPhoto(id: string, event: Event): void {
    const input = event.target as HTMLInputElement;
    const file = input.files?.[0];
    input.value = '';
    if (!file) {
      return;
    }
    void this.applyImageFile(file, (dataUrl) => {
      this.realisations.update((items) =>
        items.map((item) =>
          item.id === id ? { ...item, imageUrl: dataUrl } : item,
        ),
      );
      this.markDirty();
    });
  }

  protected triggerCoverFilePicker(): void {
    document.getElementById('listing-cover-file')?.click();
  }

  protected triggerRealisationFilePicker(id: string): void {
    document.getElementById(`listing-realisation-file-${id}`)?.click();
  }

  protected updateRealisationCaption(id: string, caption: string): void {
    this.realisations.update((items) =>
      items.map((item) => (item.id === id ? { ...item, caption } : item)),
    );
    this.markDirty();
  }

  private async addRealisationsFromFiles(files: File[]): Promise<void> {
    const additions: CraftsmanRealisation[] = [];
    for (const file of files) {
      if (!file.type.startsWith('image/')) {
        continue;
      }
      const imageUrl = await this.readImageFile(file);
      additions.push({
        id: `new-${Date.now()}-${Math.random().toString(36).slice(2, 9)}`,
        imageUrl,
        caption: this.captionFromFileName(file.name),
      });
    }
    if (additions.length === 0) {
      return;
    }
    this.realisations.update((items) => [...items, ...additions]);
    this.markDirty();
  }

  private applyImageFile(
    file: File,
    onLoad: (dataUrl: string) => void,
  ): Promise<void> {
    if (!file.type.startsWith('image/')) {
      return Promise.resolve();
    }
    return this.readImageFile(file).then(onLoad);
  }

  private readImageFile(file: File): Promise<string> {
    return new Promise((resolve, reject) => {
      const reader = new FileReader();
      reader.onload = () => resolve(reader.result as string);
      reader.onerror = () => reject(reader.error);
      reader.readAsDataURL(file);
    });
  }

  private captionFromFileName(name: string): string {
    const base = name.replace(/\.[^.]+$/, '').replace(/[-_]+/g, ' ').trim();
    return base || 'Nouvelle réalisation';
  }

  protected removeRealisation(id: string): void {
    this.realisations.update((items) => items.filter((i) => i.id !== id));
    this.markDirty();
  }

  protected updateServiceItem(
    id: string,
    field: 'name' | 'description' | 'price' | 'category',
    value: string | number,
  ): void {
    this.serviceItems.update((items) =>
      items.map((item) =>
        item.id === id
          ? {
              ...item,
              [field]:
                field === 'price'
                  ? Number(value)
                  : field === 'category'
                    ? (value as CraftsmanTrade)
                    : value,
            }
          : item,
      ),
    );
    this.markDirty();
  }

  protected addServiceItem(): void {
    const defaultTrade = this.trades()[0] ?? ('plombier' as CraftsmanTrade);
    this.serviceItems.update((items) => [
      ...items,
      {
        id: `new-${Date.now()}`,
        name: 'Nouvelle prestation',
        description: '',
        price: 0,
        category: defaultTrade,
      },
    ]);
    this.markDirty();
  }

  protected removeServiceItem(id: string): void {
    this.serviceItems.update((items) => items.filter((i) => i.id !== id));
    this.markDirty();
  }

  protected openGallery(index: number): void {
    if (this.editMode()) {
      return;
    }
    this.galleryStartIndex.set(index);
    this.galleryVisible.set(true);
  }

  protected toggleSave(): void {
    if (this.editMode()) {
      return;
    }
    const c = this.craftsman();
    if (!c) {
      return;
    }
    const consumerAuth = this.getConsumerAuth();
    const consumerFavorites = this.getConsumerFavorites();
    if (!consumerAuth || !consumerFavorites) {
      return;
    }
    if (!consumerAuth.isAuthenticated()) {
      void this.router.navigate(['/auth/connexion'], {
        queryParams: { returnUrl: this.router.url },
      });
      return;
    }
    void consumerFavorites.toggle(c.id);
  }

  protected async shareListing(): Promise<void> {
    const c = this.craftsman();
    if (!c) {
      return;
    }
    const url = window.location.href;
    const shareData = { title: c.name, url };

    try {
      if (navigator.share) {
        await navigator.share(shareData);
        return;
      }
      await navigator.clipboard.writeText(url);
      this.shareHintVisible.set(true);
      window.setTimeout(() => this.shareHintVisible.set(false), 2500);
    } catch {
      // User cancelled native share or clipboard denied — no-op.
    }
  }

  protected openQuoteDialog(): void {
    if (this.editMode()) {
      return;
    }
    const consumerAuth = this.getConsumerAuth();
    if (!consumerAuth) {
      return;
    }
    if (!consumerAuth.isAuthenticated()) {
      void this.router.navigate(['/auth/connexion'], {
        queryParams: { returnUrl: this.router.url },
      });
      return;
    }
    this.quoteDialogVisible.set(true);
  }

  protected formatPrice(price: number): string {
    return new Intl.NumberFormat('fr-FR', {
      style: 'currency',
      currency: 'EUR',
    }).format(price);
  }

  protected mapsUrl(location: CraftsmanLocation): string {
    const query = encodeURIComponent(
      `${location.address}, ${location.city}`,
    );
    return `https://www.google.com/maps/search/?api=1&query=${query}`;
  }

  private toggleList<T>(
    listSignal: { (): T[]; set: (value: T[]) => void },
    item: T,
    checked: boolean,
  ): void {
    const current = listSignal();
    if (checked) {
      listSignal.set([...current, item]);
    } else {
      listSignal.set(current.filter((x) => x !== item));
    }
  }
}
