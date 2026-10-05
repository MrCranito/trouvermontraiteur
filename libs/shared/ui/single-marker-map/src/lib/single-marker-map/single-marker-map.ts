import {
  Component,
  computed,
  DestroyRef,
  effect,
  inject,
  input,
  signal,
  viewChild,
} from '@angular/core';
import { GoogleMap } from '@angular/google-maps';
import { Craftsman } from '@trouvermontraiteur/models';
import {
  buildCraftsmanMapOptions,
  formatMarkerRating,
  GoogleMapsLoaderService,
  MapPinLayer,
  markerCategoryOf,
  PARIS_CENTER,
  type MapPinInput,
} from '@trouvermontraiteur/map-base';

@Component({
  selector: 'tmt-single-marker-map',
  imports: [GoogleMap],
  templateUrl: './single-marker-map.html',
  styleUrl: './single-marker-map.scss',
})
export class SingleMarkerMap {
  private readonly mapsLoader = inject(GoogleMapsLoaderService);
  private readonly destroyRef = inject(DestroyRef);

  protected readonly mapsKeyMissing = !this.mapsLoader.isConfigured();

  readonly craftsman = input.required<Craftsman>();
  readonly interactive = input(true);
  readonly showHint = input(true);

  private readonly mapRef = viewChild(GoogleMap);
  private pinLayer: MapPinLayer | null = null;

  protected readonly apiReady = signal(false);
  protected readonly loadFailed = signal(false);
  protected readonly center = signal(PARIS_CENTER);
  protected readonly zoom = signal(14);

  protected readonly mapOptions = computed((): google.maps.MapOptions =>
    buildCraftsmanMapOptions(this.interactive()),
  );

  constructor() {
    this.destroyRef.onDestroy(() => this.pinLayer?.destroy());

    effect(() => {
      const ready = this.apiReady();
      const mapRef = this.mapRef();
      const pin = this.pinInput();
      if (!ready || !mapRef) {
        return;
      }
      queueMicrotask(() => {
        const map = mapRef.googleMap;
        if (!map) {
          return;
        }
        if (!this.pinLayer) {
          this.pinLayer = new MapPinLayer(false);
        }
        this.pinLayer.attach(map, {
          onPinClick: () => undefined,
          onClusterClick: () => undefined,
        });
        this.pinLayer.sync([pin]);
      });
    });

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

  private readonly pinInput = computed((): MapPinInput => {
    const craftsman = this.craftsman();
    const rated = craftsman.reviewCount > 0;
    return {
      id: craftsman.id,
      name: craftsman.name,
      position: {
        lat: craftsman.location.lat,
        lng: craftsman.location.lng,
      },
      category: markerCategoryOf(craftsman),
      ratingLabel: rated ? formatMarkerRating(craftsman.rating) : null,
      certified: craftsman.certified,
      sponsored: false,
      selected: false,
      visited: false,
      hovered: false,
    };
  });

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
