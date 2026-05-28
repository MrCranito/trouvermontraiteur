import { Component, computed, effect, input, output, signal } from '@angular/core';
import {
  FEATURED_CITY_LOCATIONS,
  frenchCitiesLoadState,
  FrenchCityLocation,
  preloadFrenchCities,
  searchFrenchCities,
} from '@trouvermontraiteur/data';

@Component({
  selector: 'tmt-discover-location-picker',
  templateUrl: './discover-location-picker.html',
  styleUrl: './discover-location-picker.scss',
})
export class DiscoverLocationPicker {
  readonly query = input('');

  readonly select = output<FrenchCityLocation>();
  readonly dismiss = output<void>();

  protected readonly loadState = frenchCitiesLoadState;
  protected readonly debouncedQuery = signal('');

  protected readonly hasQuery = computed(
    () => this.debouncedQuery().length > 0,
  );

  protected readonly canSearch = computed(
    () => this.debouncedQuery().length >= 2,
  );

  protected readonly filteredLocations = computed(() => {
    const q = this.debouncedQuery();
    if (!q) {
      return [...FEATURED_CITY_LOCATIONS];
    }
    if (!this.canSearch()) {
      return [];
    }
    if (this.loadState() !== 'ready') {
      return [];
    }
    return searchFrenchCities(q);
  });

  constructor() {
    void preloadFrenchCities();

    effect((onCleanup) => {
      const q = this.query().trim();
      const timer = setTimeout(() => this.debouncedQuery.set(q), 120);
      onCleanup(() => clearTimeout(timer));
    });
  }

  protected pick(location: FrenchCityLocation): void {
    this.select.emit(location);
  }

  protected onBackdropClick(event: MouseEvent): void {
    event.stopPropagation();
    this.dismiss.emit();
  }

  protected onPanelClick(event: MouseEvent): void {
    event.stopPropagation();
  }
}
