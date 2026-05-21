import { Component, input } from '@angular/core';
import { RouterLink } from '@angular/router';
import { EVENT_LABELS } from '@trouvermontraiteur/data';
import { Caterer, EventType } from '@trouvermontraiteur/models';

@Component({
  selector: 'tmt-map-marker-popup',
  imports: [RouterLink],
  templateUrl: './map-marker-popup.html',
  styleUrl: './map-marker-popup.scss',
})
export class MapMarkerPopup {
  readonly caterer = input.required<Caterer>();

  protected readonly eventLabels = EVENT_LABELS;

  protected visibleEventTypes(): EventType[] {
    return this.caterer().eventTypes.slice(0, 2);
  }

  protected ratingLabel(): string {
    const rating = this.caterer().rating;
    return Number.isInteger(rating) ? String(rating) : rating.toFixed(1);
  }
}
