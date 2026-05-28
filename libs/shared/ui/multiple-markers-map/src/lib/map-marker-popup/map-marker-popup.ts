import { Component, input } from '@angular/core';
import { RouterLink } from '@angular/router';
import { PROJECT_LABELS } from '@trouvermontraiteur/data';
import { Craftsman, ProjectType } from '@trouvermontraiteur/models';

@Component({
  selector: 'tmt-map-marker-popup',
  imports: [RouterLink],
  templateUrl: './map-marker-popup.html',
  styleUrl: './map-marker-popup.scss',
})
export class MapMarkerPopup {
  readonly craftsman = input.required<Craftsman>();

  protected readonly projectLabels = PROJECT_LABELS;

  protected visibleProjectTypes(): ProjectType[] {
    return this.craftsman().projectTypes.slice(0, 2);
  }

  protected ratingLabel(): string {
    const rating = this.craftsman().rating;
    return Number.isInteger(rating) ? String(rating) : rating.toFixed(1);
  }
}
