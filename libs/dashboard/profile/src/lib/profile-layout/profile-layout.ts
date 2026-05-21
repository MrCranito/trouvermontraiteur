import { Component, inject, signal } from '@angular/core';
import {
  CatererDetailLayout,
  CatererDetailLayoutPreset,
  CatererDetailSectionId,
} from '@trouvermontraiteur/models';
import { CatererProfileService } from '@trouvermontraiteur/dashboard-data';
import {
  CatererDetailLayoutService,
  DETAIL_SECTION_DESCRIPTIONS,
  DETAIL_SECTION_LABELS,
} from '@trouvermontraiteur/data';
import { Button } from 'primeng/button';
import { Message } from 'primeng/message';
import { ProfileNav } from '../profile-nav/profile-nav';

@Component({
  selector: 'tmt-dashboard-profile-layout',
  imports: [ProfileNav, Button, Message],
  templateUrl: './profile-layout.html',
  styleUrl: './profile-layout.scss',
})
export class DashboardProfileLayout {
  private readonly profileService = inject(CatererProfileService);
  private readonly layoutService = inject(CatererDetailLayoutService);

  protected readonly sectionLabels = DETAIL_SECTION_LABELS;
  protected readonly sectionDescriptions = DETAIL_SECTION_DESCRIPTIONS;
  protected readonly presets = this.layoutService.getPresets();

  protected readonly saved = signal(false);
  protected readonly sections = signal<CatererDetailSectionId[]>([]);
  protected readonly templateId = signal('classic');
  protected readonly templateName = signal('Classique');
  protected readonly custom = signal(false);

  private dragFromIndex: number | null = null;

  protected readonly caterer = this.profileService.profileSignal;

  constructor() {
    this.loadLayout();
  }

  protected loadLayout(): void {
    const layout = this.layoutService.getLayout(this.caterer().slug);
    this.applyLayoutState(layout);
  }

  protected selectPreset(preset: CatererDetailLayoutPreset): void {
    const layout = this.layoutService.applyPreset(
      this.caterer().slug,
      preset.id,
    );
    this.applyLayoutState(layout);
    this.saved.set(false);
  }

  protected startCustomLayout(): void {
    this.custom.set(true);
    this.templateId.set('custom');
    this.templateName.set('Personnalisé');
    this.saved.set(false);
  }

  protected onDragStart(index: number): void {
    this.dragFromIndex = index;
  }

  protected onDragOver(event: DragEvent): void {
    event.preventDefault();
  }

  protected onDrop(event: DragEvent, toIndex: number): void {
    event.preventDefault();
    const fromIndex = this.dragFromIndex;
    this.dragFromIndex = null;
    if (fromIndex === null || fromIndex === toIndex) {
      return;
    }

    const next = [...this.sections()];
    const [moved] = next.splice(fromIndex, 1);
    next.splice(toIndex, 0, moved);
    this.sections.set(next);
    this.custom.set(true);
    this.templateId.set('custom');
    this.templateName.set('Personnalisé');
    this.saved.set(false);
  }

  protected onDragEnd(): void {
    this.dragFromIndex = null;
  }

  protected save(): void {
    const layout: CatererDetailLayout = {
      templateId: this.templateId(),
      templateName: this.templateName(),
      custom: this.custom(),
      sections: this.sections(),
    };
    this.layoutService.saveLayout(this.caterer().slug, layout);
    this.saved.set(true);
  }

  protected resetToClassic(): void {
    this.selectPreset(this.presets[0]);
    this.save();
  }

  private applyLayoutState(layout: CatererDetailLayout): void {
    this.sections.set([...layout.sections]);
    this.templateId.set(layout.templateId);
    this.templateName.set(layout.templateName);
    this.custom.set(layout.custom);
  }
}
