import {
  Component,
  computed,
  input,
  output,
  signal,
} from '@angular/core';
import {
  buildMonthGrid,
  formatMonthYear,
  toIsoDateLocal,
} from '@trouvermontraiteur/data';

export type DiscoverDatePickerMode = 'dates' | 'flexible';

const WEEKDAY_LETTERS = ['L', 'M', 'M', 'J', 'V', 'S', 'D'] as const;

const FLEX_OPTIONS: readonly { days: number; label: string }[] = [
  { days: 0, label: 'Dates exactes' },
  { days: 1, label: '± 1 jour' },
  { days: 2, label: '± 2 jours' },
  { days: 3, label: '± 3 jours' },
  { days: 7, label: '± 7 jours' },
  { days: 14, label: '± 14 jours' },
];

const FLEXIBLE_STAY_OPTIONS: readonly { id: string; label: string }[] = [
  { id: 'weekend', label: 'Un week-end' },
  { id: 'week', label: 'Une semaine' },
  { id: 'month', label: 'Un mois' },
];

@Component({
  selector: 'tmt-discover-date-picker',
  templateUrl: './discover-date-picker.html',
  styleUrl: './discover-date-picker.scss',
})
export class DiscoverDatePicker {
  readonly value = input('');
  readonly flexDays = input(0);
  readonly mode = input<DiscoverDatePickerMode>('dates');

  readonly valueChange = output<string>();
  readonly flexDaysChange = output<number>();
  readonly modeChange = output<DiscoverDatePickerMode>();
  readonly dismiss = output<void>();

  protected readonly weekdayLetters = WEEKDAY_LETTERS;
  protected readonly flexOptions = FLEX_OPTIONS;
  protected readonly flexibleStayOptions = FLEXIBLE_STAY_OPTIONS;

  private readonly viewOffsetMonths = signal(0);

  protected readonly canGoPrev = computed(() => this.viewOffsetMonths() > 0);

  private readonly todayAnchor = computed(() => {
    const now = new Date();
    return { year: now.getFullYear(), month: now.getMonth() };
  });

  protected readonly viewStart = computed(() => {
    const anchor = this.todayAnchor();
    let month = anchor.month + this.viewOffsetMonths();
    let year = anchor.year;

    while (month > 11) {
      month -= 12;
      year += 1;
    }
    while (month < 0) {
      month += 12;
      year -= 1;
    }

    return { year, month };
  });

  protected readonly monthViews = computed(() => {
    const start = this.viewStart();
    const selected = this.value();
    const selectedSet = selected ? new Set([selected]) : new Set<string>();
    const views: {
      year: number;
      month: number;
      label: string;
      weeks: ReturnType<typeof buildMonthGrid>;
    }[] = [];

    let year = start.year;
    let month = start.month;

    for (let i = 0; i < 2; i++) {
      views.push({
        year,
        month,
        label: formatMonthYear(year, month),
        weeks: buildMonthGrid(year, month, selectedSet, true, new Set()),
      });
      month += 1;
      if (month > 11) {
        month = 0;
        year += 1;
      }
    }

    return views;
  });

  protected setMode(next: DiscoverDatePickerMode): void {
    if (next !== this.mode()) {
      this.modeChange.emit(next);
    }
  }

  protected selectFlex(days: number): void {
    if (days !== this.flexDays()) {
      this.flexDaysChange.emit(days);
    }
  }

  protected onDayClick(iso: string, inMonth: boolean, isPast: boolean): void {
    if (!inMonth || isPast) {
      return;
    }
    this.valueChange.emit(iso);
  }

  protected isSelected(iso: string): boolean {
    return this.value() === iso;
  }

  protected goPrevMonth(): void {
    if (this.canGoPrev()) {
      this.viewOffsetMonths.update((o) => o - 1);
    }
  }

  protected goNextMonth(): void {
    this.viewOffsetMonths.update((o) => o + 1);
  }

  protected onBackdropClick(event: MouseEvent): void {
    event.stopPropagation();
    this.dismiss.emit();
  }

  protected onPanelClick(event: MouseEvent): void {
    event.stopPropagation();
  }

  protected dayAriaLabel(
    iso: string,
    inMonth: boolean,
    isPast: boolean,
    selected: boolean,
  ): string {
    const date = new Date(`${iso}T12:00:00`).toLocaleDateString('fr-FR', {
      weekday: 'long',
      day: 'numeric',
      month: 'long',
      year: 'numeric',
    });
    if (!inMonth) {
      return date;
    }
    if (isPast) {
      return `${date}, passé`;
    }
    if (selected) {
      return `${date}, sélectionné`;
    }
    return date;
  }

  /** Suggest a date ~3 weeks ahead when switching to calendar mode. */
  protected suggestDefaultDate(): void {
    if (this.value()) {
      return;
    }
    const d = new Date();
    d.setDate(d.getDate() + 21);
    this.valueChange.emit(toIsoDateLocal(d));
  }
}
