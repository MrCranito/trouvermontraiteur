import {
  Component,
  computed,
  DestroyRef,
  effect,
  inject,
  input,
  NgZone,
  output,
  signal,
  viewChild,
} from '@angular/core';
import { GoogleMap, MapInfoWindow } from '@angular/google-maps';
import { Craftsman } from '@trouvermontraiteur/models';
import {
  buildCraftsmanMapOptions,
  formatMarkerRating,
  getMapViewport,
  GoogleMapsLoaderService,
  MAP_PIN_CLUSTER_MAX_ZOOM,
  MapPinLayer,
  markerCategoryOf,
  PARIS_CENTER,
  type MapFocus,
  type MapPinInput,
  type MapViewport,
} from '@trouvermontraiteur/map-base';
import { MapMarkerPopup } from '../map-marker-popup/map-marker-popup';

@Component({
  selector: 'tmt-multiple-markers-map',
  imports: [GoogleMap, MapInfoWindow, MapMarkerPopup],
  templateUrl: './multiple-markers-map.html',
  styleUrl: './multiple-markers-map.scss',
})
export class MultipleMarkersMap {
  private readonly mapsLoader = inject(GoogleMapsLoaderService);
  private readonly zone = inject(NgZone);
  private readonly destroyRef = inject(DestroyRef);

  protected readonly mapsKeyMissing = !this.mapsLoader.isConfigured();

  /** Markers drawn on the map. */
  readonly craftsmen = input.required<Craftsman[]>();
  /** Bounds used when `autoFit` is true; defaults to `craftsmen`. */
  readonly fitTargets = input<Craftsman[] | null>(null);
  readonly selectedId = input<string | null>(null);
  /** Listing hover: scales the pin without selecting it. */
  readonly hoveredId = input<string | null>(null);
  readonly interactive = input(true);
  readonly showHint = input(true);
  /** When true, fits bounds to craftsmen (e.g. after filter change). */
  readonly autoFit = input(true);
  /** When set, centers the map on this point (e.g. selected city). */
  readonly mapFocus = input<MapFocus | null>(null);
  readonly catererSelect = output<string>();
  readonly catererClear = output<void>();
  readonly viewportChange = output<MapViewport>();
  /** Fired when the user starts panning or zooming (not programmatic fit). */
  readonly mapMoveStart = output<void>();

  private readonly mapRef = viewChild(GoogleMap);
  private readonly infoWindowRef = viewChild(MapInfoWindow);
  private pinLayer: MapPinLayer | null = null;
  private mapListeners: google.maps.MapsEventListener[] = [];
  private userMapReady = false;
  private programmaticMove = false;
  private ignoreNextMapClickClose = false;

  protected readonly popupCraftsman = signal<Craftsman | null>(null);
  private readonly visitedIds = signal<ReadonlySet<string>>(new Set());

  protected readonly popupPosition = computed((): google.maps.LatLngLiteral => {
    const popup = this.popupCraftsman();
    if (!popup) {
      return PARIS_CENTER;
    }
    return { lat: popup.location.lat, lng: popup.location.lng };
  });

  protected readonly popupWindowOptions = computed(
    (): google.maps.InfoWindowOptions => {
      const base: google.maps.InfoWindowOptions = {
        maxWidth: 320,
        disableAutoPan: true,
      };
      if (this.apiReady() && typeof google !== 'undefined' && google.maps) {
        base.pixelOffset = new google.maps.Size(0, -46);
      }
      return base;
    },
  );

  protected readonly apiReady = signal(false);
  protected readonly loadFailed = signal(false);
  protected readonly center = signal(PARIS_CENTER);
  protected readonly zoom = signal(6);

  protected readonly mapOptions = computed(
    (): google.maps.MapOptions => buildCraftsmanMapOptions(this.interactive()),
  );

  constructor() {
    this.destroyRef.onDestroy(() => this.pinLayer?.destroy());

    effect(() => {
      const ready = this.apiReady();
      const mapRef = this.mapRef();
      const pins = this.pinInputs();
      if (!ready || !mapRef) {
        return;
      }
      queueMicrotask(() => {
        const map = mapRef.googleMap;
        if (!map) {
          return;
        }
        this.ensurePinLayer(map).sync(pins);
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
      const ready = this.apiReady();
      const shouldFit = this.autoFit();
      const focus = this.mapFocus();
      const mapRef = this.mapRef();
      // Marker updates must not move or re-report the camera. Reading the
      // list only while auto-fit is on keeps a result refresh from emitting
      // another viewport.
      const fitList = shouldFit ? (this.fitTargets() ?? this.craftsmen()) : null;
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
        if (focus) {
          this.focusMapOn(focus, map);
        } else if (shouldFit && fitList) {
          this.fitMapToCraftsmen(fitList, map);
        }
        this.bindViewportListener(map);
        this.emitViewport(map);
      });
    });

    effect(() => {
      const focus = this.mapFocus();
      const ready = this.apiReady();
      const mapRef = this.mapRef();
      if (!focus || !ready || !mapRef?.googleMap) {
        return;
      }
      queueMicrotask(() => {
        const map = mapRef.googleMap;
        if (!map) {
          return;
        }
        this.focusMapOn(focus, map);
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
      const popup = this.popupCraftsman();
      if (!popup) {
        return;
      }
      const visible = new Set(this.craftsmen().map((c) => c.id));
      if (!visible.has(popup.id)) {
        this.closePopup();
      }
    });
  }

  private readonly pinInputs = computed((): MapPinInput[] => {
    const selectedId = this.selectedId();
    const hoveredId = this.hoveredId();
    const popupId = this.popupCraftsman()?.id ?? null;
    const visited = this.visitedIds();
    return this.craftsmen().map((craftsman) => {
      const selected = selectedId === craftsman.id || popupId === craftsman.id;
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
        selected,
        visited: visited.has(craftsman.id),
        hovered: hoveredId === craftsman.id,
      };
    });
  });

  protected markerPosition(caterer: Craftsman): google.maps.LatLngLiteral {
    return {
      lat: caterer.location.lat,
      lng: caterer.location.lng,
    };
  }

  private ensurePinLayer(map: google.maps.Map): MapPinLayer {
    if (!this.pinLayer) {
      this.pinLayer = new MapPinLayer(true);
    }
    this.pinLayer.attach(map, {
      onPinClick: (id) => this.zone.run(() => this.onPinClick(id)),
      onClusterClick: (bounds) => this.zone.run(() => this.focusCluster(bounds)),
      onPointerDown: () => {
        this.ignoreNextMapClickClose = true;
        window.setTimeout(() => {
          this.ignoreNextMapClickClose = false;
        }, 350);
      },
    });
    return this.pinLayer;
  }

  private onPinClick(id: string): void {
    if (!this.interactive()) {
      return;
    }

    const caterer = this.craftsmen().find((item) => item.id === id);
    if (!caterer) {
      return;
    }

    if (this.popupCraftsman()?.id === caterer.id) {
      this.closePopup();
      return;
    }

    this.visitedIds.update((current) => {
      if (current.has(caterer.id)) {
        return current;
      }
      const next = new Set(current);
      next.add(caterer.id);
      return next;
    });
    this.popupCraftsman.set(caterer);
    this.catererSelect.emit(caterer.id);
    const info = this.infoWindowRef();
    info?.infoWindow?.setPosition(this.markerPosition(caterer));
    queueMicrotask(() => info?.open());
  }

  private focusCluster(bounds: google.maps.LatLngBounds): void {
    const map = this.mapRef()?.googleMap;
    if (!map) {
      return;
    }

    this.closePopup();
    this.programmaticMove = true;
    map.fitBounds(bounds, 72);
    google.maps.event.addListenerOnce(map, 'idle', () => {
      const zoom = map.getZoom();
      if (zoom != null && zoom <= MAP_PIN_CLUSTER_MAX_ZOOM) {
        this.programmaticMove = true;
        map.setZoom(MAP_PIN_CLUSTER_MAX_ZOOM + 1);
      }
    });
  }

  protected onPopupClose(): void {
    this.closePopup();
  }

  private closePopup(): void {
    const wasOpen = this.popupCraftsman() !== null;
    this.popupCraftsman.set(null);
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

  private focusMapOn(focus: MapFocus, map: google.maps.Map): void {
    this.programmaticMove = true;
    const position = { lat: focus.lat, lng: focus.lng };
    const zoom = focus.zoom ?? 11;
    map.setCenter(position);
    map.setZoom(zoom);
    this.center.set(position);
    this.zoom.set(zoom);
  }

  private fitMapToCraftsmen(list: Craftsman[], map: google.maps.Map): void {
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
