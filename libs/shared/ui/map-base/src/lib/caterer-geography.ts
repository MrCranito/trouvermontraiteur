import { Caterer } from '@trouvermontraiteur/models';

export interface MapViewport {
  center: google.maps.LatLngLiteral;
  radiusMeters: number;
}

const EARTH_RADIUS_M = 6_371_000;

/** Great-circle distance between two points, in meters. */
export function haversineDistanceMeters(
  a: google.maps.LatLngLiteral,
  b: google.maps.LatLngLiteral,
): number {
  const toRad = (deg: number) => (deg * Math.PI) / 180;
  const dLat = toRad(b.lat - a.lat);
  const dLng = toRad(b.lng - a.lng);
  const lat1 = toRad(a.lat);
  const lat2 = toRad(b.lat);
  const h =
    Math.sin(dLat / 2) ** 2 +
    Math.cos(lat1) * Math.cos(lat2) * Math.sin(dLng / 2) ** 2;
  return 2 * EARTH_RADIUS_M * Math.asin(Math.min(1, Math.sqrt(h)));
}

/** Nearest first from `center`. */
export function sortCaterersByDistanceFrom(
  caterers: Caterer[],
  center: google.maps.LatLngLiteral,
): Caterer[] {
  return [...caterers].sort(
    (a, b) =>
      haversineDistanceMeters(center, {
        lat: a.location.lat,
        lng: a.location.lng,
      }) -
      haversineDistanceMeters(center, {
        lat: b.location.lat,
        lng: b.location.lng,
      }),
  );
}

/** Caterers whose location is within `radiusMeters` of `center`. */
export function filterCaterersByRadius(
  caterers: Caterer[],
  center: google.maps.LatLngLiteral,
  radiusMeters: number,
): Caterer[] {
  if (radiusMeters <= 0) {
    return [];
  }
  return caterers.filter(
    (c) =>
      haversineDistanceMeters(center, {
        lat: c.location.lat,
        lng: c.location.lng,
      }) <= radiusMeters,
  );
}

/**
 * Search radius from the map center, scaled to the visible map size on screen
 * (half of the shorter viewport side in ground meters).
 */
export function getViewportSearchRadiusMeters(
  map: google.maps.Map,
): number | null {
  const bounds = map.getBounds();
  const div = map.getDiv();
  if (!bounds || !div) {
    return null;
  }

  const widthPx = div.offsetWidth;
  const heightPx = div.offsetHeight;
  if (widthPx <= 0 || heightPx <= 0) {
    return null;
  }

  const ne = bounds.getNorthEast();
  const sw = bounds.getSouthWest();
  const latSpan = Math.abs(ne.lat() - sw.lat());
  const lngSpan = Math.abs(ne.lng() - sw.lng());
  const avgLat = (ne.lat() + sw.lat()) / 2;
  const metersPerDegLat = 111_320;
  const metersPerDegLng =
    111_320 * Math.cos((avgLat * Math.PI) / 180);
  const heightMeters = latSpan * metersPerDegLat;
  const widthMeters = lngSpan * metersPerDegLng;
  const metersPerPxX = widthMeters / widthPx;
  const metersPerPxY = heightMeters / heightPx;
  const minSidePx = Math.min(widthPx, heightPx);
  const radiusMeters = ((metersPerPxX + metersPerPxY) / 2) * minSidePx * 0.5;

  return Math.max(radiusMeters, 500);
}

/** Center and screen-proportional radius for the current map viewport. */
export function getMapViewport(map: google.maps.Map): MapViewport | null {
  const center = map.getCenter();
  const radiusMeters = getViewportSearchRadiusMeters(map);
  if (!center || radiusMeters == null) {
    return null;
  }
  return {
    center: { lat: center.lat(), lng: center.lng() },
    radiusMeters,
  };
}
