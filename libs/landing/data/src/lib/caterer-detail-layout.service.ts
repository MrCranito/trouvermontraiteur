import { Injectable } from '@angular/core';
import {
  Craftsman,
  CatererDetailLayout,
  CatererDetailSectionId,
} from '@trouvermontraiteur/models';
import {
  DEFAULT_DETAIL_LAYOUT,
  DETAIL_LAYOUT_PRESETS,
} from './detail-layout-presets';

const STORAGE_VERSION = 'v1';

@Injectable({ providedIn: 'root' })
export class CatererDetailLayoutService {
  getLayout(slug: string): CatererDetailLayout {
    const stored = this.readFromStorage(slug);
    if (stored) {
      return this.sanitizeLayout(stored);
    }
    return structuredClone(DEFAULT_DETAIL_LAYOUT);
  }

  saveLayout(slug: string, layout: CatererDetailLayout): void {
    const sanitized = this.sanitizeLayout(layout);
    localStorage.setItem(this.storageKey(slug), JSON.stringify(sanitized));
  }

  applyPreset(slug: string, presetId: string): CatererDetailLayout {
    const preset = DETAIL_LAYOUT_PRESETS.find((p) => p.id === presetId);
    const layout = structuredClone(
      preset?.layout ?? DEFAULT_DETAIL_LAYOUT,
    );
    this.saveLayout(slug, layout);
    return layout;
  }

  getPresets() {
    return DETAIL_LAYOUT_PRESETS;
  }

  /** Sections to render for a craftsman (skips empty optional blocks). */
  resolveVisibleSections(
    craftsman: Craftsman,
    layout: CatererDetailLayout,
  ): CatererDetailSectionId[] {
    return layout.sections.filter((id) => this.isSectionVisible(craftsman, id));
  }

  isSectionVisible(
    craftsman: Craftsman,
    sectionId: CatererDetailSectionId,
  ): boolean {
    switch (sectionId) {
      case 'prestations':
        return (
          craftsman.projectTypes.length > 0 ||
          craftsman.serviceOptions.length > 0
        );
      default:
        return true;
    }
  }

  private storageKey(slug: string): string {
    return `tmt:caterer-detail-layout:${STORAGE_VERSION}:${slug}`;
  }

  private readFromStorage(slug: string): CatererDetailLayout | null {
    try {
      const raw = localStorage.getItem(this.storageKey(slug));
      if (!raw) {
        return null;
      }
      return JSON.parse(raw) as CatererDetailLayout;
    } catch {
      return null;
    }
  }

  private sanitizeLayout(layout: CatererDetailLayout): CatererDetailLayout {
    const allowed = new Set<CatererDetailSectionId>([
      'cover',
      'about',
      'prestations',
      'menu',
      'availability',
      'location',
    ]);
    const sections = layout.sections
      .map((id) => ((id as string) === 'gallery' ? 'availability' : id))
      .filter((id) => allowed.has(id as CatererDetailSectionId));
    const unique = [...new Set(sections)] as CatererDetailSectionId[];

    return {
      templateId: layout.templateId || 'custom',
      templateName: layout.templateName || 'Personnalisé',
      custom: layout.custom ?? layout.templateId === 'custom',
      sections:
        unique.length > 0 ? unique : [...DEFAULT_DETAIL_LAYOUT.sections],
    };
  }
}
