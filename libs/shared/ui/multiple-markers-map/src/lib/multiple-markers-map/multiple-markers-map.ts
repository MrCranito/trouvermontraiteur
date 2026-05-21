import {
  Component,
  computed,
  effect,
  inject,
  input,
  output,
  signal,
  viewChild,
} from '@angular/core';
import { GoogleMap, MapInfoWindow, MapMarker } from '@angular/google-maps';
import { Caterer } from '@trouvermontraiteur/models';
import {
  buildCatererMapOptions,
  catererRatingMarkerIcon,
  getMapViewport,
  GoogleMapsLoaderService,
  PARIS_CENTER,
  type MapViewport,
} from '@trouvermontraiteur/map-base';
import { MapMarkerPopup } from '../map-marker-popup/map-marker-popup';

@Component({
  selector: 'tmt-multiple-markers-map',
  imports: [GoogleMap, MapMarker, MapInfoWindow, MapMarkerPopup],
  templateUrl: './multiple-markers-map.html',
  styleUrl: './multiple-markers-map.scss',
})
export class MultipleMarkersMap {
  private readonly mapsLoader = inject(GoogleMapsLoaderService);

  protected readonly mapsKeyMissing = !this.mapsLoader.isConfigured();

  /** Markers drawn on the map. */
  readonly caterers = input.required<Caterer[]>();
  /** Bounds used when `autoFit` is true; defaults to `caterers`. */
  readonly fitTargets = input<Caterer[] | null>(null);
  readonly selectedId = input<string | null>(null);
  readonly interactive = input(true);
  readonly showHint = input(true);
  /** When true, fits bounds to caterers (e.g. after filter change). */
  readonly autoFit = input(true);
  readonly catererSelect = output<string>();
  readonly catererClear = output<void>();
  readonly viewportChange = output<MapViewport>();
  /** Fired when the user starts panning or zooming (not programmatic fit). */
  readonly mapMoveStart = output<void>();

  private readonly mapRef = viewChild(GoogleMap);
  private readonly infoWindowRef = viewChild(MapInfoWindow);
  private mapListeners: google.maps.MapsEventListener[] = [];
  private userMapReady = false;
  private programmaticMove = false;
  private ignoreNextMapClickClose = false;

  protected readonly popupCaterer = signal<Caterer | null>(null);

  protected readonly popupWindowOptions: google.maps.InfoWindowOptions = {
    pixelOffset: new google.maps.Size(0, 28),
    maxWidth: 320,
    disableAutoPan: true,
  };

  protected readonly apiReady = signal(false);
  protected readonly loadFailed = signal(false);
  protected readonly center = signal(PARIS_CENTER);
  protected readonly zoom = signal(6);

  protected readonly mapOptions = computed(
    (): google.maps.MapOptions => buildCatererMapOptions(this.interactive()),
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
      const fitList = this.fitTargets() ?? this.caterers();
      const ready = this.apiReady();
      const shouldFit = this.autoFit();
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
        if (shouldFit) {
          this.fitMapToCaterers(fitList, map);
        }
        this.bindViewportListener(map);
        this.emitViewport(map);
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

    effect((onCleanup) => {
      const ready = this.apiReady();
      const mapRef = this.mapRef();
      if (!ready || !mapRef?.googleMap) {
        return;
      }
      const map = mapRef.googleMap;
      this.bindViewportListener(map);
      onCleanup(() => this.clearViewportListener());
    });

    effect(() => {
      const popup = this.popupCaterer();
      if (!popup) {
        return;
      }
      const visible = new Set(this.caterers().map((c) => c.id));
      if (!visible.has(popup.id)) {
        this.closePopup();
      }
    });
  }

  protected markerOptions(caterer: Caterer): google.maps.MarkerOptions {
    const active =
      this.selectedId() === caterer.id ||
      this.popupCaterer()?.id === caterer.id;
    const note = Number.isInteger(caterer.rating)
      ? String(caterer.rating)
      : caterer.rating.toFixed(1);
    return {
      clickable: this.interactive(),
      zIndex: active ? 200 : Math.round(caterer.rating * 10),
      title: `${caterer.name} — ${note}`,
      icon: catererRatingMarkerIcon(caterer.rating, active),
    };
  }

  protected markerPosition(caterer: Caterer): google.maps.LatLngLiteral {
    return {
      lat: caterer.location.lat,
      lng: caterer.location.lng,
    };
  }

  protected onMarkerClick(caterer: Caterer, marker: MapMarker): void {
    if (!this.interactive()) {
      return;
    }

    this.ignoreNextMapClickClose = true;
    queueMicrotask(() => {
      this.ignoreNextMapClickClose = false;
    });

    if (this.popupCaterer()?.id === caterer.id) {
      this.closePopup();
      return;
    }

    this.popupCaterer.set(caterer);
    this.catererSelect.emit(caterer.id);
    queueMicrotask(() => this.infoWindowRef()?.open(marker));
  }

  protected onPopupClose(): void {
    this.closePopup();
  }

  private closePopup(): void {
    const wasOpen = this.popupCaterer() !== null;
    this.popupCaterer.set(null);
    this.infoWindowRef()?.close();
    if (wasOpen) {
      this.catererClear.emit();
    }
  }

  protected zoomIn(): void {
    if (this.userMapReady) {
      this.mapMoveStart.emit();
    }
    this.adjustZoom(1);
  }

  protected zoomOut(): void {
    if (this.userMapReady) {
      this.mapMoveStart.emit();
    }
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

  private bindViewportListener(map: google.maps.Map): void {
    this.clearViewportListener();
    this.mapListeners = [
      map.addListener('idle', () => {
        if (!this.userMapReady) {
          this.userMapReady = true;
        }
        if (this.programmaticMove) {
          this.programmaticMove = false;
        }
        this.emitViewport(map);
      }),
      map.addListener('dragstart', () => {
        this.closePopup();
        if (this.userMapReady) {
          this.mapMoveStart.emit();
        }
      }),
      map.addListener('click', () => {
        if (this.ignoreNextMapClickClose) {
          return;
        }
        this.closePopup();
      }),
      map.addListener('zoom_changed', () => {
        if (this.userMapReady && !this.programmaticMove) {
          this.closePopup();
          this.mapMoveStart.emit();
        }
      }),
    ];
  }

  private clearViewportListener(): void {
    for (const listener of this.mapListeners) {
      google.maps.event.removeListener(listener);
    }
    this.mapListeners = [];
  }

  private emitViewport(map: google.maps.Map): void {
    const viewport = getMapViewport(map);
    if (viewport) {
      this.viewportChange.emit(viewport);
    }
  }

  private fitMapToCaterers(list: Caterer[], map: google.maps.Map): void {
    this.programmaticMove = true;

    if (list.length === 0) {
      map.setCenter(PARIS_CENTER);
      map.setZoom(6);
      this.center.set(PARIS_CENTER);
      this.zoom.set(6);
      return;
    }

    if (list.length === 1) {
      const { lat, lng } = list[0].location;
      const position = { lat, lng };
      map.setCenter(position);
      map.setZoom(12);
      this.center.set(position);
      this.zoom.set(12);
      return;
    }

    const bounds = new google.maps.LatLngBounds();
    for (const caterer of list) {
      bounds.extend({
        lat: caterer.location.lat,
        lng: caterer.location.lng,
      });
    }
    map.fitBounds(bounds, 48);
    google.maps.event.addListenerOnce(map, 'idle', () => {
      const c = map.getCenter();
      if (c) {
        this.center.set({ lat: c.lat(), lng: c.lng() });
      }
      const z = map.getZoom();
      if (z != null) {
        this.zoom.set(z);
      }
      this.emitViewport(map);
    });
  }
}
