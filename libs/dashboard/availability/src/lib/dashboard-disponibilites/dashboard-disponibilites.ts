import { Component, inject, signal } from '@angular/core';
import { buildDefaultAvailableDates, toIsoDateLocal } from '@trouvermontraiteur/data';
import { CatererProfileService } from '@trouvermontraiteur/dashboard-data';
import { AvailabilityCalendar } from '@trouvermontraiteur/availability-calendar';
import { Button } from 'primeng/button';
import { Message } from 'primeng/message';

@Component({
  selector: 'tmt-dashboard-disponibilites',
  imports: [AvailabilityCalendar, Button, Message],
  templateUrl: './dashboard-disponibilites.html',
  styleUrl: './dashboard-disponibilites.scss',
})
export class DashboardDisponibilites {
  private readonly profileService = inject(CatererProfileService);

  protected readonly saved = signal(false);
  protected readonly draftDates = signal<string[]>([]);

  constructor() {
    const profile = this.profileService.getProfile();
    const initial =
      profile.availableDates.length > 0
        ? [...profile.availableDates]
        : buildDefaultAvailableDates(profile.unavailableDates);
    this.draftDates.set(initial);
  }

  protected onDatesChange(dates: string[]): void {
    this.draftDates.set(dates);
    this.saved.set(false);
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
    this.saved.set(false);
  }

  protected clearFuture(): void {
    const today = new Date();
    today.setHours(0, 0, 0, 0);
    const todayIso = toIsoDateLocal(today);

    this.draftDates.set(
      this.draftDates().filter((iso) => iso < todayIso),
    );
    this.saved.set(false);
  }

  protected save(): void {
    this.profileService.updateProfile({
      availableDates: [...this.draftDates()].sort(),
      unavailableDates: [],
    });
    this.saved.set(true);
  }
}
