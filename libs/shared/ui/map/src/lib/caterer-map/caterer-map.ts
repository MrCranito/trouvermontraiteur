import { Component, computed, input, output } from '@angular/core';
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

const DEFAULT_BOUNDS: MapBounds = {
  minLat: 48.82,
  maxLat: 48.9,
  minLng: 2.23,
  maxLng: 2.39,
};

@Component({
  selector: 'tmt-caterer-map',
  imports: [Tooltip],
  templateUrl: './caterer-map.html',
  styleUrl: './caterer-map.scss',
})
export class CatererMap {
  readonly caterers = input.required<Caterer[]>();
  readonly selectedId = input<string | null>(null);
  readonly interactive = input(true);
  readonly showHint = input(true);
  readonly catererSelect = output<string>();

  private readonly bounds = computed(() => {
    const list = this.caterers();
    if (list.length === 0) {
      return DEFAULT_BOUNDS;
    }

    if (list.length === 1) {
      const { lat, lng } = list[0].location;
      const pad = 0.018;
      return {
        minLat: lat - pad,
        maxLat: lat + pad,
        minLng: lng - pad,
        maxLng: lng + pad,
      };
    }

    let minLat = list[0].location.lat;
    let maxLat = list[0].location.lat;
    let minLng = list[0].location.lng;
    let maxLng = list[0].location.lng;

    for (const caterer of list) {
      minLat = Math.min(minLat, caterer.location.lat);
      maxLat = Math.max(maxLat, caterer.location.lat);
      minLng = Math.min(minLng, caterer.location.lng);
      maxLng = Math.max(maxLng, caterer.location.lng);
    }

    const latPad = Math.max(0.012, (maxLat - minLat) * 0.2);
    const lngPad = Math.max(0.012, (maxLng - minLng) * 0.2);

    return {
      minLat: minLat - latPad,
      maxLat: maxLat + latPad,
      minLng: minLng - lngPad,
      maxLng: maxLng + lngPad,
    };
  });

  protected markerPosition(caterer: Caterer): MarkerPosition {
    const { lat, lng } = caterer.location;
    const b = this.bounds();
    const x = ((lng - b.minLng) / (b.maxLng - b.minLng)) * 100;
    const y = ((b.maxLat - lat) / (b.maxLat - b.minLat)) * 100;
    return {
      left: `${Math.min(96, Math.max(4, x))}%`,
      top: `${Math.min(92, Math.max(8, y))}%`,
    };
  }

  protected selectCaterer(id: string): void {
    if (!this.interactive()) {
      return;
    }
    this.catererSelect.emit(id);
  }
}
