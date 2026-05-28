import { Craftsman } from '@trouvermontraiteur/models';

/** Local calendar date as yyyy-MM-dd (no timezone shift). */
export function toIsoDateLocal(date: Date): string {
  const y = date.getFullYear();
  const m = String(date.getMonth() + 1).padStart(2, '0');
  const d = String(date.getDate()).padStart(2, '0');
  return `${y}-${m}-${d}`;
}

export function parseIsoDateLocal(iso: string): Date {
  const [y, m, d] = iso.split('-').map(Number);
  return new Date(y, m - 1, d);
}

export const FR_WEEKDAY_SHORT = ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim'] as const;

export function formatMonthYear(year: number, month: number): string {
  const label = new Date(year, month, 1).toLocaleDateString('fr-FR', {
    month: 'long',
    year: 'numeric',
  });
  return label.charAt(0).toUpperCase() + label.slice(1);
}

export interface CalendarDayCell {
  iso: string;
  day: number;
  inMonth: boolean;
  isPast: boolean;
  isAvailable: boolean;
  isToday: boolean;
}

/** Whether the craftsman accepts bookings on this date. */
export function isCraftsmanAvailableOn(craftsman: Craftsman, iso: string): boolean {
  if (craftsman.availableDates.length > 0) {
    return craftsman.availableDates.includes(iso);
  }
  return !craftsman.unavailableDates.includes(iso);
}

export function buildMonthGrid(
  year: number,
  month: number,
  selectedAvailable: Set<string>,
  useExplicitAvailability: boolean,
  unavailable: Set<string>,
): CalendarDayCell[][] {
  const todayIso = toIsoDateLocal(new Date());
  const first = new Date(year, month, 1);
  const startOffset = (first.getDay() + 6) % 7;
  const gridStart = new Date(year, month, 1 - startOffset);

  const weeks: CalendarDayCell[][] = [];
  let cursor = new Date(gridStart);

  for (let w = 0; w < 6; w++) {
    const week: CalendarDayCell[] = [];
    for (let d = 0; d < 7; d++) {
      const iso = toIsoDateLocal(cursor);
      const inMonth = cursor.getMonth() === month;
      const isPast = iso < todayIso;
      const isAvailable = useExplicitAvailability
        ? selectedAvailable.has(iso)
        : !unavailable.has(iso);

      week.push({
        iso,
        day: cursor.getDate(),
        inMonth,
        isPast,
        isAvailable: inMonth && !isPast && isAvailable,
        isToday: iso === todayIso,
      });

      cursor = new Date(cursor);
      cursor.setDate(cursor.getDate() + 1);
    }
    weeks.push(week);
    if (w >= 3 && cursor.getMonth() !== month && cursor.getDate() <= 7) {
      break;
    }
  }

  return weeks;
}

/** Next N days not listed as unavailable (bootstrap for demo). */
export function buildDefaultAvailableDates(
  unavailableDates: string[],
  daysAhead = 120,
): string[] {
  const blocked = new Set(unavailableDates);
  const start = new Date();
  start.setHours(0, 0, 0, 0);
  const dates: string[] = [];

  for (let i = 0; i < daysAhead; i++) {
    const d = new Date(start);
    d.setDate(start.getDate() + i);
    const iso = toIsoDateLocal(d);
    if (!blocked.has(iso)) {
      dates.push(iso);
    }
  }

  return dates;
}
