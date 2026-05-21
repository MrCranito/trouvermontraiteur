import { Component, effect, input, model, output } from '@angular/core';
import { FormsModule } from '@angular/forms';
import {
  ALL_CATEGORIES,
  ALL_DIETARY_OPTIONS,
  ALL_EVENT_TYPES,
  CATEGORY_LABELS,
  DIETARY_LABELS,
  EVENT_LABELS,
} from '@trouvermontraiteur/data';
import {
  CatererCategory,
  DietaryOption,
  EventType,
} from '@trouvermontraiteur/models';
import { Button } from 'primeng/button';
import { Checkbox } from 'primeng/checkbox';
import { Dialog } from 'primeng/dialog';
import { InputText } from 'primeng/inputtext';
import { Select } from 'primeng/select';

export interface SearchFilterValues {
  query: string;
  minRating: number;
  categories: CatererCategory[];
  eventTypes: EventType[];
  dietary: DietaryOption[];
  eventDate: string;
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
  ],
  templateUrl: './search-filters-dialog.html',
  styleUrl: './search-filters-dialog.scss',
})
export class SearchFiltersDialog {
  readonly visible = model.required<boolean>();
  readonly filters = input.required<SearchFilterValues>();

  readonly apply = output<SearchFilterValues>();

  protected draft: SearchFilterValues = this.emptyDraft();

  protected readonly categoryOptions = ALL_CATEGORIES.map((key) => ({
    key,
    label: CATEGORY_LABELS[key],
  }));

  protected readonly eventOptions = ALL_EVENT_TYPES.map((key) => ({
    key,
    label: EVENT_LABELS[key],
  }));

  protected readonly dietaryOptions = ALL_DIETARY_OPTIONS.map((key) => ({
    key,
    label: DIETARY_LABELS[key],
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
        this.draft = structuredClone(this.filters());
      }
    });
  }

  protected isCategoryChecked(key: CatererCategory): boolean {
    return this.draft.categories.includes(key);
  }

  protected isEventChecked(key: EventType): boolean {
    return this.draft.eventTypes.includes(key);
  }

  protected isDietaryChecked(key: DietaryOption): boolean {
    return this.draft.dietary.includes(key);
  }

  protected toggleCategory(key: CatererCategory, checked: boolean): void {
    this.draft = {
      ...this.draft,
      categories: checked
        ? [...this.draft.categories, key]
        : this.draft.categories.filter((c) => c !== key),
    };
  }

  protected toggleEvent(key: EventType, checked: boolean): void {
    this.draft = {
      ...this.draft,
      eventTypes: checked
        ? [...this.draft.eventTypes, key]
        : this.draft.eventTypes.filter((e) => e !== key),
    };
  }

  protected toggleDietary(key: DietaryOption, checked: boolean): void {
    this.draft = {
      ...this.draft,
      dietary: checked
        ? [...this.draft.dietary, key]
        : this.draft.dietary.filter((d) => d !== key),
    };
  }

  protected resetDraft(): void {
    this.draft = this.emptyDraft();
  }

  protected cancel(): void {
    this.visible.set(false);
  }

  protected submit(): void {
    this.apply.emit(structuredClone(this.draft));
    this.visible.set(false);
  }

  private emptyDraft(): SearchFilterValues {
    return {
      query: '',
      minRating: 0,
      categories: [],
      eventTypes: [],
      dietary: [],
      eventDate: '',
    };
  }
}
