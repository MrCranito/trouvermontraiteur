import { InjectionToken } from '@angular/core';
import {
  Craftsman,
  CraftsmanPublishReadiness,
} from '@trouvermontraiteur/models';

export interface CraftsmanDetailsEditCompleteness {
  score: number;
  missing: string[];
}

/** Permet au dashboard d’alimenter `CraftsmanDetails` en mode édition sans coupler la lib au dashboard. */
export interface CraftsmanDetailsEditStore {
  getProfile(): Craftsman;
  replaceProfile(craftsman: Craftsman): void;
  getCompleteness(): CraftsmanDetailsEditCompleteness;
  getPublishReadiness(craftsman: Craftsman): CraftsmanPublishReadiness;
  saveDraft(craftsman: Craftsman): Promise<void>;
  publishProfile(craftsman: Craftsman): Promise<void>;
}

export const CRAFTSMAN_DETAILS_EDIT_STORE =
  new InjectionToken<CraftsmanDetailsEditStore>('CRAFTSMAN_DETAILS_EDIT_STORE');
