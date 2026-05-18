import { Injectable, signal } from '@angular/core';
import { Caterer } from '@trouvermontraiteur/models';
import { MOCK_CATERERS } from '@trouvermontraiteur/data';
import { ProfileCompleteness } from './caterer-dashboard-stats';

const DEMO_CATERER_SLUG = 'maison-du-terroir';

@Injectable({ providedIn: 'root' })
export class CatererProfileService {
  private readonly profile = signal<Caterer>(
    structuredClone(
      MOCK_CATERERS.find((c) => c.slug === DEMO_CATERER_SLUG) ?? MOCK_CATERERS[0],
    ),
  );

  readonly profileSignal = this.profile.asReadonly();

  getProfile(): Caterer {
    return this.profile();
  }

  updateProfile(patch: Partial<Caterer>): void {
    this.profile.update((current) => ({ ...current, ...patch }));
  }

  replaceProfile(caterer: Caterer): void {
    this.profile.set(structuredClone(caterer));
  }

  getCompleteness(): ProfileCompleteness {
    const c = this.profile();
    const missing: string[] = [];

    if (!c.description?.trim()) {
      missing.push('Description');
    }
    if (!c.imageUrl?.trim()) {
      missing.push('Photo de couverture');
    }
    if (!c.location.address?.trim() || !c.location.city?.trim()) {
      missing.push('Adresse complète');
    }
    if (c.categories.length === 0) {
      missing.push('Prestations proposées');
    }
    if (c.eventTypes.length === 0) {
      missing.push("Types d'événements");
    }
    if (c.menu.length === 0) {
      missing.push('Au moins un plat au menu');
    }
    if (c.realisations.length === 0) {
      missing.push('Photos de réalisations');
    }
    if (c.minOrder == null || c.minOrder <= 0) {
      missing.push('Commande minimum');
    }

    const checks = 8;
    const score = Math.round(((checks - missing.length) / checks) * 100);

    return { score: Math.max(0, Math.min(100, score)), missing };
  }
}
