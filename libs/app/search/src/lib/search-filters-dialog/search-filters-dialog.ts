import {
  Component,
  computed,
  effect,
  inject,
  input,
  model,
  output,
  signal,
} from '@angular/core';
import { FormsModule } from '@angular/forms';
import { AppCraftsmanCatalogService } from '@trouvermontraiteur/app-consumer-data';
import {
  ALL_PROJECT_TYPES,
  ALL_SERVICE_OPTIONS,
  PROJECT_LABELS,
  SERVICE_OPTION_LABELS,
  TRADE_FAMILIES,
} from '@trouvermontraiteur/data';
import {
  CraftsmanTrade,
  ProjectType,
  ServiceOption,
} from '@trouvermontraiteur/models';
import {
  Accordion,
  AccordionContent,
  AccordionHeader,
  AccordionPanel,
} from 'primeng/accordion';
import { Button } from 'primeng/button';
import { Checkbox } from 'primeng/checkbox';
import { Dialog } from 'primeng/dialog';
import { InputText } from 'primeng/inputtext';
import { Select } from 'primeng/select';

export interface SearchFilterValues {
  query: string;
  minRating: number;
  trades: CraftsmanTrade[];
  projectTypes: ProjectType[];
  serviceOptions: ServiceOption[];
  projectDate: string;
}

export function formatFilterApplyLabel(matchCount: number): string {
  if (matchCount > 100) {
    return 'Afficher plus de 100 artisans';
  }
  const noun = matchCount === 1 ? 'artisan' : 'artisans';
  return `Afficher ${matchCount} ${noun}`;
}

@Component({
  selector: 'tmt-search-filters-dialog',
  imports: [
    FormsModule,
    Dialog,
    Button,
    Checkbox,
    InputText,
    Select,
    Accordion,
    AccordionPanel,
    AccordionHeader,
    AccordionContent,
  ],
  templateUrl: './search-filters-dialog.html',
  styleUrl: './search-filters-dialog.scss',
})
export class SearchFiltersDialog {
  private readonly craftsmanService = inject(AppCraftsmanCatalogService);

  readonly visible = model.required<boolean>();
  readonly filters = input.required<SearchFilterValues>();
  /** True while explorer results are loading after apply. */
  readonly loading = input(false);

  readonly apply = output<SearchFilterValues>();

  protected readonly draft = signal<SearchFilterValues>(this.emptyDraft());
  private readonly applying = signal(false);
  private readonly filterChangeLoading = signal(false);
  /** Bumped on each filter change to restart the dot CSS animation. */
  protected readonly dotsAnimationKey = signal(0);
  private applyStartedAt = 0;
  private filterChangeStartedAt = 0;
  private queryPulseTimer: ReturnType<typeof setTimeout> | undefined;

  /** At least one full dot-bounce cycle (animation is 0.525s). */
  private static readonly LOADING_MIN_MS = 350;

  protected readonly showApplyLoading = computed(
    () => this.applying() || this.filterChangeLoading(),
  );

  protected readonly draftMatchCount = computed(
    () =>
      this.craftsmanService.filter({
        query: this.draft().query,
        trades: this.draft().trades,
        minRating: this.draft().minRating,
        projectDate: this.draft().projectDate,
        projectTypes: this.draft().projectTypes,
        serviceOptions: this.draft().serviceOptions,
      }).length,
  );

  protected readonly applyButtonLabel = computed(() =>
    formatFilterApplyLabel(this.draftMatchCount()),
  );

  protected readonly tradeFamilies = TRADE_FAMILIES;

  protected readonly projectOptions = ALL_PROJECT_TYPES.map((key) => ({
    key,
    label: PROJECT_LABELS[key],
  }));

  protected readonly serviceOptionChoices = ALL_SERVICE_OPTIONS.map((key) => ({
    key,
    label: SERVICE_OPTION_LABELS[key],
  }));

  protected readonly ratingOptions: { label: string; value: number }[] = [
    { label: 'Toutes les notes', value: 0 },
    { label: '3 étoiles et plus', value: 3 },
    { label: '3,5 étoiles et plus', value: 3.5 },
    { label: '4 étoiles et plus', value: 4 },
    { label: '4,5 étoiles et plus', value: 4.5 },
  ];

  constructor() {
    effect(() => {
      if (this.visible()) {
        this.draft.set(structuredClone(this.filters()));
        this.applying.set(false);
        this.filterChangeLoading.set(false);
        clearTimeout(this.queryPulseTimer);
      }
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

  protected isTradeChecked(key: CraftsmanTrade): boolean {
    return this.draft().trades.includes(key);
  }

  protected isProjectChecked(key: ProjectType): boolean {
    return this.draft().projectTypes.includes(key);
  }

  protected isServiceOptionChecked(key: ServiceOption): boolean {
    return this.draft().serviceOptions.includes(key);
  }

  protected toggleTrade(key: CraftsmanTrade, checked: boolean): void {
    const trades = this.draft().trades;
    this.patchDraft({
      trades: checked ? [...trades, key] : trades.filter((t) => t !== key),
    });
  }

  protected toggleProject(key: ProjectType, checked: boolean): void {
    const projectTypes = this.draft().projectTypes;
    this.patchDraft({
      projectTypes: checked
        ? [...projectTypes, key]
        : projectTypes.filter((p) => p !== key),
    });
  }

  protected toggleServiceOption(key: ServiceOption, checked: boolean): void {
    const serviceOptions = this.draft().serviceOptions;
    this.patchDraft({
      serviceOptions: checked
        ? [...serviceOptions, key]
        : serviceOptions.filter((o) => o !== key),
    });
  }

  protected resetDraft(): void {
    this.draft.set(this.emptyDraft());
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
      projectTypes: [],
      serviceOptions: [],
      projectDate: '',
    };
  }
}
