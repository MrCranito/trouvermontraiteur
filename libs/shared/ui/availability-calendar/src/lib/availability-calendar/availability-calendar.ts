import { Component, computed, input, output, signal } from '@angular/core';
import {
  buildMonthGrid,
  formatMonthYear,
  FR_WEEKDAY_SHORT,
} from '@trouvermontraiteur/data';

@Component({
  selector: 'tmt-availability-calendar',
  templateUrl: './availability-calendar.html',
  styleUrl: './availability-calendar.scss',
})
export class AvailabilityCalendar {
  /** ISO dates (yyyy-MM-dd) marked as available. */
  readonly availableDates = input<string[]>([]);
  readonly readonly = input(false);
  /** Number of consecutive months to display. */
  readonly monthsToShow = input(1);

  readonly availableDatesChange = output<string[]>();

  protected readonly weekdayLabels = FR_WEEKDAY_SHORT;

  /** Months ahead of the current month (0 = starts at today’s month). */
  private readonly viewOffsetMonths = signal(0);

  private readonly todayAnchor = computed(() => {
    const now = new Date();
    return { year: now.getFullYear(), month: now.getMonth() };
  });

  protected readonly canGoPrev = computed(() => this.viewOffsetMonths() > 0);

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
    const count = Math.max(1, this.monthsToShow());
    const start = this.viewStart();
    const selected = new Set(this.availableDates());
    const views: {
      year: number;
      month: number;
      label: string;
      weeks: ReturnType<typeof buildMonthGrid>;
    }[] = [];

    let year = start.year;
    let month = start.month;

    for (let i = 0; i < count; i++) {
      views.push({
        year,
        month,
        label: formatMonthYear(year, month),
        weeks: buildMonthGrid(year, month, selected, true, new Set()),
      });
      month += 1;
      if (month > 11) {
        month = 0;
        year += 1;
      }
    }

    return views;
  });

  protected readonly navLabel = computed(() => {
    const views = this.monthViews();
    if (views.length === 0) {
      return '';
    }
    if (views.length === 1) {
      return views[0].label;
    }
    return `${views[0].label} – ${views[views.length - 1].label}`;
  });

  protected goPrevMonth(): void {
    if (this.canGoPrev()) {
      this.viewOffsetMonths.update((offset) => offset - 1);
    }
  }

  protected goNextMonth(): void {
    this.viewOffsetMonths.update((offset) => offset + 1);
  }

  protected onDayClick(iso: string, inMonth: boolean, isPast: boolean): void {
    if (this.readonly() || !inMonth || isPast) {
      return;
    }

    const next = new Set(this.availableDates());
    if (next.has(iso)) {
      next.delete(iso);
    } else {
      next.add(iso);
    }

    this.availableDatesChange.emit([...next].sort());
  }

  protected dayAriaLabel(
    iso: string,
    inMonth: boolean,
    isPast: boolean,
    isAvailable: boolean,
  ): string {
    const date = new Date(iso + 'T12:00:00').toLocaleDateString('fr-FR', {
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
    return isAvailable ? `${date}, disponible` : `${date}, indisponible`;
  }
}
