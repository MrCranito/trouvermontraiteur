import { Component, computed, inject, signal } from '@angular/core';
import {
  ALL_CATEGORIES,
  ALL_DIETARY_OPTIONS,
  ALL_EVENT_TYPES,
  CATEGORY_LABELS,
  DIETARY_LABELS,
  EVENT_LABELS,
} from '@trouvermontraiteur/data';
import { CatererProfileService } from '@trouvermontraiteur/dashboard-data';
import {
  CatererCategory,
  DietaryOption,
  EventType,
  MenuItem,
} from '@trouvermontraiteur/models';
import { Button } from 'primeng/button';
import { Checkbox } from 'primeng/checkbox';
import { InputNumber } from 'primeng/inputnumber';
import { InputText } from 'primeng/inputtext';
import { Textarea } from 'primeng/textarea';
import { FormsModule } from '@angular/forms';
import { Message } from 'primeng/message';
@Component({
  selector: 'tmt-dashboard-profile',
  imports: [
    FormsModule,
    Button,
    InputText,
    Textarea,
    InputNumber,
    Checkbox,
    Message,
  ],
  templateUrl: './profile.html',
  styleUrl: './profile.scss',
})
export class DashboardProfile {
  private readonly profileService = inject(CatererProfileService);

  protected readonly saved = signal(false);

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

  protected name = signal('');
  protected description = signal('');
  protected imageUrl = signal('');
  protected address = signal('');
  protected city = signal('');
  protected minOrder = signal<number | null>(null);
  protected deliveryRadiusKm = signal<number | null>(null);
  protected categories = signal<CatererCategory[]>([]);
  protected eventTypes = signal<EventType[]>([]);
  protected dietary = signal<DietaryOption[]>([]);
  protected menuItems = signal<MenuItem[]>([]);

  protected readonly completeness = computed(() =>
    this.profileService.getCompleteness(),
  );

  constructor() {
    this.loadFromService();
  }

  protected loadFromService(): void {
    const c = this.profileService.getProfile();
    this.name.set(c.name);
    this.description.set(c.description);
    this.imageUrl.set(c.imageUrl);
    this.address.set(c.location.address);
    this.city.set(c.location.city);
    this.minOrder.set(c.minOrder ?? null);
    this.deliveryRadiusKm.set(c.deliveryRadiusKm ?? null);
    this.categories.set([...c.categories]);
    this.eventTypes.set([...c.eventTypes]);
    this.dietary.set([...c.dietary]);
    this.menuItems.set(structuredClone(c.menu));
    this.saved.set(false);
  }

  protected isCategoryChecked(cat: CatererCategory): boolean {
    return this.categories().includes(cat);
  }

  protected toggleCategory(cat: CatererCategory, checked: boolean): void {
    this.toggleList(this.categories, cat, checked);
  }

  protected isEventChecked(event: EventType): boolean {
    return this.eventTypes().includes(event);
  }

  protected toggleEvent(event: EventType, checked: boolean): void {
    this.toggleList(this.eventTypes, event, checked);
  }

  protected isDietaryChecked(option: DietaryOption): boolean {
    return this.dietary().includes(option);
  }

  protected toggleDietary(option: DietaryOption, checked: boolean): void {
    this.toggleList(this.dietary, option, checked);
  }

  protected updateMenuItem(
    id: string,
    field: 'name' | 'description' | 'price',
    value: string | number,
  ): void {
    this.menuItems.update((items) =>
      items.map((item) =>
        item.id === id
          ? {
              ...item,
              [field]: field === 'price' ? Number(value) : value,
            }
          : item,
      ),
    );
  }

  protected addMenuItem(): void {
    this.menuItems.update((items) => [
      ...items,
      {
        id: `new-${Date.now()}`,
        name: 'Nouveau plat',
        description: '',
        price: 0,
        category: 'aperitifs',
      },
    ]);
  }

  protected removeMenuItem(id: string): void {
    this.menuItems.update((items) => items.filter((i) => i.id !== id));
  }

  protected save(): void {
    const current = this.profileService.getProfile();

    this.profileService.replaceProfile({
      ...current,
      name: this.name().trim(),
      description: this.description().trim(),
      imageUrl: this.imageUrl().trim(),
      categories: this.categories(),
      eventTypes: this.eventTypes(),
      dietary: this.dietary(),
      minOrder: this.minOrder() ?? undefined,
      deliveryRadiusKm: this.deliveryRadiusKm() ?? undefined,
      menu: this.menuItems(),
      location: {
        ...current.location,
        address: this.address().trim(),
        city: this.city().trim(),
      },
    });

    this.saved.set(true);
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
