import {
  Component,
  computed,
  effect,
  inject,
  input,
  model,
  output,
  signal,
  untracked,
} from '@angular/core';
import { AppCraftsmanCatalogService } from '@trouvermontraiteur/app-consumer-data';
import { CategoryI18nService } from '@trouvermontraiteur/app-i18n';
import {
  CraftsmanTrade,
  ProjectType,
  ServiceOption,
} from '@trouvermontraiteur/models';
import { Dialog } from 'primeng/dialog';

export interface SearchFilterValues {
  query: string;
  minRating: number;
  trades: CraftsmanTrade[];
  subCategoryIds: string[];
  projectTypes: ProjectType[];
  serviceOptions: ServiceOption[];
  projectDate: string;
}

interface TradeChip {
  id: string;
  label: string;
  on: boolean;
}

interface FamilyCard {
  id: string;
  label: string;
  trades: TradeChip[];
  selectedCount: number;
  hasSelection: boolean;
  isOpen: boolean;
  allLabel: string;
}

interface TradeSearchHit {
  id: string;
  label: string;
  category: string;
  on: boolean;
}

interface ActiveFilterChip {
  id: string;
  label: string;
  kind: 'query' | 'rating' | 'trade';
  tradeId?: string;
}

const RATING_CHOICES: { label: string; value: number; star: boolean }[] = [
  { label: 'Toutes', value: 0, star: false },
  { label: '3+', value: 3, star: true },
  { label: '4+', value: 4, star: true },
  { label: '4,5+', value: 4.5, star: true },
];

export function formatFilterApplyLabel(matchCount: number): string {
  if (matchCount > 100) {
    return 'Afficher plus de 100 artisans';
  }
  if (matchCount === 0) {
    return 'Aucun artisan';
  }
  const noun = matchCount === 1 ? 'artisan' : 'artisans';
  return `Afficher ${matchCount} ${noun}`;
}

function fold(value: string): string {
  return value
    .toLowerCase()
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '');
}

function ratingChipLabel(value: number): string {
  const choice = RATING_CHOICES.find((item) => item.value === value);
  if (choice) {
    return `Note ${choice.label}`;
  }
  const text = Number.isInteger(value)
    ? String(value)
    : value.toLocaleString('fr-FR');
  return `Note ${text}+`;
}

@Component({
  selector: 'tmt-search-filters-dialog',
  imports: [Dialog],
  templateUrl: './search-filters-dialog.html',
  styleUrl: './search-filters-dialog.scss',
})
export class SearchFiltersDialog {
  private readonly craftsmanService = inject(AppCraftsmanCatalogService);
  private readonly categoryI18n = inject(CategoryI18nService);

  readonly visible = model.required<boolean>();
  readonly filters = input.required<SearchFilterValues>();
  /** True while explorer results are loading after apply. */
  readonly loading = input(false);

  readonly apply = output<SearchFilterValues>();

  protected readonly draft = signal<SearchFilterValues>(this.emptyDraft());
  protected readonly tradeQuery = signal('');
  private readonly openFamilyIds = signal<ReadonlySet<string>>(new Set());
  private readonly applying = signal(false);
  private readonly filterChangeLoading = signal(false);
  /** Bumped on each filter change to restart the dot CSS animation. */
  protected readonly dotsAnimationKey = signal(0);
  private applyStartedAt = 0;
  private filterChangeStartedAt = 0;
  private queryPulseTimer: ReturnType<typeof setTimeout> | undefined;

  /** At least one full dot-bounce cycle (animation is 0.525s). */
  private static readonly LOADING_MIN_MS = 350;

  protected readonly ratingChoices = RATING_CHOICES;

  protected readonly showApplyLoading = computed(
    () => this.applying() || this.filterChangeLoading(),
  );

  protected readonly draftMatchCount = computed(
    () =>
      this.craftsmanService.filter({
        query: this.draft().query,
        trades: this.draft().subCategoryIds.length > 0 ? [] : this.draft().trades,
        subCategoryIds: this.draft().subCategoryIds,
        minRating: this.draft().minRating,
        projectDate: this.draft().projectDate,
        projectTypes: this.draft().projectTypes,
        serviceOptions: [],
      }).length,
  );

  protected readonly applyButtonLabel = computed(() =>
    formatFilterApplyLabel(this.draftMatchCount()),
  );

  protected readonly tradeFamilies = computed(() => {
    this.categoryI18n.activeLang();
    return [...this.craftsmanService.categoriesSignal()]
      .sort((a, b) => a.order - b.order)
      .map((category) => ({
        id: category.id,
        label: this.categoryI18n.name(category),
        trades: [...category.subCategories]
          .sort((a, b) => a.order - b.order)
          .map((subCategory) => ({
            id: subCategory.id,
            label: this.categoryI18n.subCategoryLabel(subCategory),
          })),
      }))
      .filter((family) => family.trades.length > 0);
  });

  protected readonly familyCards = computed((): FamilyCard[] => {
    const selected = new Set(this.draft().subCategoryIds);
    const open = this.openFamilyIds();
    return this.tradeFamilies().map((family) => {
      const selectedCount = family.trades.filter((trade) =>
        selected.has(trade.id),
      ).length;
      const allOn =
        family.trades.length > 0 && selectedCount === family.trades.length;
      return {
        id: family.id,
        label: family.label,
        selectedCount,
        hasSelection: selectedCount > 0,
        isOpen: open.has(family.id),
        allLabel: allOn ? 'Tout désélectionner' : 'Tout sélectionner',
        trades: family.trades.map((trade) => ({
          id: trade.id,
          label: trade.label,
          on: selected.has(trade.id),
        })),
      };
    });
  });

  protected readonly tradeSearchQuery = computed(() => this.tradeQuery().trim());

  protected readonly isSearchingTrades = computed(
    () => this.tradeSearchQuery().length > 0,
  );

  protected readonly tradeSearchResults = computed((): TradeSearchHit[] => {
    const query = fold(this.tradeSearchQuery());
    if (!query) {
      return [];
    }
    const selected = new Set(this.draft().subCategoryIds);
    const results: TradeSearchHit[] = [];
    for (const family of this.tradeFamilies()) {
      const familyMatch = fold(family.label).includes(query);
      for (const trade of family.trades) {
        if (familyMatch || fold(trade.label).includes(query)) {
          results.push({
            id: trade.id,
            label: trade.label,
            category: family.label,
            on: selected.has(trade.id),
          });
        }
      }
    }
    return results;
  });

  protected readonly selectionCountLabel = computed(() => {
    const count = this.draft().subCategoryIds.length;
    if (count === 0) {
      return 'Tous les métiers';
    }
    return `${count} sélectionné${count > 1 ? 's' : ''}`;
  });

  protected readonly activeChips = computed((): ActiveFilterChip[] => {
    const draft = this.draft();
    const chips: ActiveFilterChip[] = [];
    if (draft.minRating > 0) {
      chips.push({
        id: 'rating',
        label: ratingChipLabel(draft.minRating),
        kind: 'rating',
      });
    }

    const labels = new Map<string, string>();
    for (const family of this.tradeFamilies()) {
      for (const trade of family.trades) {
        labels.set(trade.id, trade.label);
      }
    }
    for (const tradeId of draft.subCategoryIds) {
      chips.push({
        id: `trade:${tradeId}`,
        label: labels.get(tradeId) ?? tradeId,
        kind: 'trade',
        tradeId,
      });
    }

    const query = draft.query.trim();
    if (query) {
      chips.push({ id: 'query', label: query, kind: 'query' });
    }
    return chips;
  });

  protected readonly hasActiveDraft = computed(() => {
    const draft = this.draft();
    return (
      this.activeChips().length > 0 ||
      draft.trades.length > 0 ||
      draft.projectTypes.length > 0 ||
      draft.serviceOptions.length > 0 ||
      draft.projectDate.trim().length > 0
    );
  });

  constructor() {
    effect(() => {
      if (!this.visible()) {
        return;
      }

      untracked(() => {
        const filters = structuredClone(this.filters());
        this.draft.set(filters);
        this.tradeQuery.set('');
        this.applying.set(false);
        this.filterChangeLoading.set(false);
        clearTimeout(this.queryPulseTimer);

        const selected = new Set(filters.subCategoryIds);
        this.openFamilyIds.set(
          new Set(
            this.tradeFamilies()
              .filter((family) =>
                family.trades.some((trade) => selected.has(trade.id)),
              )
              .map((family) => family.id),
          ),
        );
      });
    });

    effect((onCleanup) => {
      if (!this.applying()) {
        return;
      }

      this.loading();

      const tryFinishApply = (): void => {
        const elapsed = Date.now() - this.applyStartedAt;
        const minAnimationDone = elapsed >= SearchFiltersDialog.LOADING_MIN_MS;
        if (minAnimationDone && !this.loading()) {
          this.applying.set(false);
          this.filterChangeLoading.set(false);
          this.visible.set(false);
        }
      };

      tryFinishApply();
      const timer = setInterval(tryFinishApply, 40);
      onCleanup(() => clearInterval(timer));
    });

    effect((onCleanup) => {
      if (!this.filterChangeLoading() || this.applying()) {
        return;
      }

      const tryFinishPulse = (): void => {
        const elapsed = Date.now() - this.filterChangeStartedAt;
        if (elapsed >= SearchFiltersDialog.LOADING_MIN_MS) {
          this.filterChangeLoading.set(false);
        }
      };

      tryFinishPulse();
      const timer = setInterval(tryFinishPulse, 40);
      onCleanup(() => clearInterval(timer));
    });
  }

  protected close(): void {
    this.visible.set(false);
  }

  protected setRating(value: number): void {
    if (this.draft().minRating === value) {
      return;
    }
    this.patchDraft({ minRating: value });
  }

  protected onTradeQueryInput(event: Event): void {
    this.tradeQuery.set((event.target as HTMLInputElement).value);
  }

  protected patchDraft(partial: Partial<SearchFilterValues>): void {
    this.draft.update((current) => ({ ...current, ...partial }));

    if ('query' in partial) {
      clearTimeout(this.queryPulseTimer);
      this.queryPulseTimer = setTimeout(() => this.pulseFilterLoading(), 280);
      return;
    }

    this.pulseFilterLoading();
  }

  /** Brief loading pulse on the apply button after each filter change. */
  private pulseFilterLoading(): void {
    if (this.applying()) {
      return;
    }
    this.filterChangeStartedAt = Date.now();
    this.dotsAnimationKey.update((key) => key + 1);
    this.filterChangeLoading.set(true);
  }

  protected toggleTrade(key: string, checked: boolean): void {
    const subCategoryIds = this.draft().subCategoryIds;
    this.patchDraft({
      subCategoryIds: checked
        ? [...subCategoryIds, key]
        : subCategoryIds.filter((id) => id !== key),
    });
  }

  protected toggleFamilyOpen(familyId: string): void {
    this.openFamilyIds.update((current) => {
      const next = new Set(current);
      if (next.has(familyId)) {
        next.delete(familyId);
      } else {
        next.add(familyId);
      }
      return next;
    });
  }

  protected toggleFamilyAll(familyId: string): void {
    const family = this.tradeFamilies().find((item) => item.id === familyId);
    if (!family) {
      return;
    }
    const ids = family.trades.map((trade) => trade.id);
    const current = this.draft().subCategoryIds;
    const selected = new Set(current);
    const allOn = ids.every((id) => selected.has(id));
    this.patchDraft({
      subCategoryIds: allOn
        ? current.filter((id) => !ids.includes(id))
        : [...current, ...ids.filter((id) => !selected.has(id))],
    });
  }

  protected removeChip(chip: ActiveFilterChip): void {
    if (chip.kind === 'rating') {
      this.patchDraft({ minRating: 0 });
      return;
    }
    if (chip.kind === 'query') {
      this.patchDraft({ query: '' });
      return;
    }
    if (chip.tradeId) {
      this.toggleTrade(chip.tradeId, false);
    }
  }

  protected resetDraft(): void {
    this.draft.set(this.emptyDraft());
    this.tradeQuery.set('');
    this.openFamilyIds.set(new Set());
    this.pulseFilterLoading();
  }

  protected submit(): void {
    if (this.applying()) {
      return;
    }
    clearTimeout(this.queryPulseTimer);
    this.filterChangeLoading.set(false);
    this.applyStartedAt = Date.now();
    this.dotsAnimationKey.update((key) => key + 1);
    this.applying.set(true);
    this.apply.emit(structuredClone(this.draft()));
  }

  private emptyDraft(): SearchFilterValues {
    return {
      query: '',
      minRating: 0,
      trades: [],
      subCategoryIds: [],
      projectTypes: [],
      serviceOptions: [],
      projectDate: '',
    };
  }
}
