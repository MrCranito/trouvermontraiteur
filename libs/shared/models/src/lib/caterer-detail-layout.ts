/** Reorderable blocks on the public caterer detail page (main column). */
export type CatererDetailSectionId =
  | 'cover'
  | 'about'
  | 'prestations'
  | 'menu'
  | 'availability'
  | 'location';

export interface CatererDetailLayout {
  templateId: string;
  templateName: string;
  /** When true, the caterer customized section order (no preset). */
  custom: boolean;
  sections: CatererDetailSectionId[];
}

export interface CatererDetailLayoutPreset {
  id: string;
  name: string;
  description: string;
  layout: CatererDetailLayout;
}
