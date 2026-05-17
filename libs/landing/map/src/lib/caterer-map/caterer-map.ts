import { Component, input, output } from '@angular/core';
import { Caterer } from '@trouvermontraiteur/models';
import { Tooltip } from 'primeng/tooltip';

interface MapBounds {
  minLat: number;
  maxLat: number;
  minLng: number;
  maxLng: number;
}

interface MarkerPosition {
  left: string;
  top: string;
}

@Component({
  selector: 'tmt-caterer-map',
  imports: [Tooltip],
  templateUrl: './caterer-map.html',
  styleUrl: './caterer-map.scss',
})
export class CatererMap {
  readonly caterers = input.required<Caterer[]>();
  readonly selectedId = input<string | null>(null);
  readonly catererSelect = output<string>();

  private readonly bounds: MapBounds = {
    minLat: 48.82,
    maxLat: 48.9,
    minLng: 2.23,
    maxLng: 2.39,
  };

  protected markerPosition(caterer: Caterer): MarkerPosition {
    const { lat, lng } = caterer.location;
    const x =
      ((lng - this.bounds.minLng) / (this.bounds.maxLng - this.bounds.minLng)) *
      100;
    const y =
      ((this.bounds.maxLat - lat) / (this.bounds.maxLat - this.bounds.minLat)) *
      100;
    return {
      left: `${Math.min(96, Math.max(4, x))}%`,
      top: `${Math.min(92, Math.max(8, y))}%`,
    };
  }

  protected selectCaterer(id: string): void {
    this.catererSelect.emit(id);
  }
}
