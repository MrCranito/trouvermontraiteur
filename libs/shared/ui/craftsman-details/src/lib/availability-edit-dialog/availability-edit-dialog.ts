import { Component, effect, input, model, output, signal } from '@angular/core';
import { toIsoDateLocal } from '@trouvermontraiteur/data';
import { AvailabilityCalendar } from '@trouvermontraiteur/availability-calendar';
import { Button } from 'primeng/button';
import { Dialog } from 'primeng/dialog';

@Component({
  selector: 'tmt-availability-edit-dialog',
  imports: [Dialog, Button, AvailabilityCalendar],
  templateUrl: './availability-edit-dialog.html',
  styleUrl: './availability-edit-dialog.scss',
})
export class AvailabilityEditDialog {
  readonly visible = model.required<boolean>();
  readonly availableDates = input<string[]>([]);

  readonly saved = output<string[]>();

  protected readonly draftDates = signal<string[]>([]);

  constructor() {
    effect(() => {
      if (this.visible()) {
        this.draftDates.set([...this.availableDates()]);
      }
    });
  }

  protected onDatesChange(dates: string[]): void {
    this.draftDates.set(dates);
  }

  protected selectWeekends(): void {
    const next = new Set(this.draftDates());
    const start = new Date();
    start.setHours(0, 0, 0, 0);

    for (let i = 0; i < 120; i++) {
      const d = new Date(start);
      d.setDate(start.getDate() + i);
      const day = d.getDay();
      if (day === 0 || day === 6) {
        next.add(toIsoDateLocal(d));
      }
    }

    this.draftDates.set([...next].sort());
  }

  protected clearFuture(): void {
    const today = new Date();
    today.setHours(0, 0, 0, 0);
    const todayIso = toIsoDateLocal(today);

    this.draftDates.set(this.draftDates().filter((iso) => iso < todayIso));
  }

  protected save(): void {
    this.saved.emit([...this.draftDates()].sort());
    this.visible.set(false);
  }

  protected cancel(): void {
    this.visible.set(false);
  }
}
