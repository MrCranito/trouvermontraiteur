import {
  Component,
  computed,
  effect,
  inject,
  input,
  signal,
  viewChild,
} from '@angular/core';
import { GoogleMap, MapMarker } from '@angular/google-maps';
import { Craftsman } from '@trouvermontraiteur/models';
import {
  buildCraftsmanMapOptions,
  GoogleMapsLoaderService,
  homeMarkerIcon,
  PARIS_CENTER,
} from '@trouvermontraiteur/map-base';

@Component({
  selector: 'tmt-single-marker-map',
  imports: [GoogleMap, MapMarker],
  templateUrl: './single-marker-map.html',
  styleUrl: './single-marker-map.scss',
})
export class SingleMarkerMap {
  private readonly mapsLoader = inject(GoogleMapsLoaderService);

  protected readonly mapsKeyMissing = !this.mapsLoader.isConfigured();

  readonly craftsman = input.required<Craftsman>();
  readonly interactive = input(true);
  readonly showHint = input(true);

  private readonly mapRef = viewChild(GoogleMap);

  protected readonly apiReady = signal(false);
  protected readonly loadFailed = signal(false);
  protected readonly center = signal(PARIS_CENTER);
  protected readonly zoom = signal(14);

  protected readonly mapOptions = computed((): google.maps.MapOptions =>
    buildCraftsmanMapOptions(this.interactive()),
  );

  constructor() {
    if (!this.mapsLoader.isConfigured()) {
      this.loadFailed.set(true);
      return;
    }

    void this.mapsLoader
      .load()
      .then(() => this.apiReady.set(true))
      .catch(() => this.loadFailed.set(true));

    effect(() => {
      const c = this.craftsman();
      const ready = this.apiReady();
      const mapRef = this.mapRef();
      if (!ready || !mapRef) {
        return;
      }

      queueMicrotask(() => {
        const map = mapRef.googleMap;
        if (!map) {
          return;
        }
        map.setOptions(this.mapOptions());
        google.maps.event.trigger(map, 'resize');
        this.fitToCraftsman(c, map);
      });
    });

    effect(() => {
      const options = this.mapOptions();
      const map = this.mapRef()?.googleMap;
      if (!this.apiReady() || !map) {
        return;
      }
      map.setOptions(options);
    });
  }

  protected markerOptions(craftsman: Craftsman): google.maps.MarkerOptions {
    return {
      clickable: this.interactive(),
      zIndex: 1,
      title: craftsman.name,
      icon: homeMarkerIcon(true),
    };
  }

  protected markerPosition(craftsman: Craftsman): google.maps.LatLngLiteral {
    return {
      lat: craftsman.location.lat,
      lng: craftsman.location.lng,
    };
  }

  protected zoomIn(): void {
    this.adjustZoom(1);
  }

  protected zoomOut(): void {
    this.adjustZoom(-1);
  }

  private adjustZoom(delta: 1 | -1): void {
    const map = this.mapRef()?.googleMap;
    if (!map) {
      return;
    }
    const current = map.getZoom() ?? this.zoom();
    const next = Math.min(20, Math.max(3, current + delta));
    map.setZoom(next);
    this.zoom.set(next);
  }

  private fitToCraftsman(craftsman: Craftsman, map: google.maps.Map): void {
    const { lat, lng } = craftsman.location;
    const position = { lat, lng };
    map.setCenter(position);
    map.setZoom(14);
    this.center.set(position);
    this.zoom.set(14);
  }
}
