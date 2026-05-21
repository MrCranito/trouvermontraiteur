# map-base

Shared Google Maps setup for consumer map components:

- `GOOGLE_MAPS_API_KEY` injection token
- `GoogleMapsLoaderService` — loads the Maps JS API (`@googlemaps/js-api-loader`)
- `homeMarkerIcon()` — brand marker graphics
- `PARIS_CENTER` — default center when there are no markers
- `buildCatererMapOptions()` — shared map options (no default UI, pan on/off)
- `caterer-map-shell.scss` — layout/styles for `tmt-multiple-markers-map` and `tmt-single-marker-map` (root class `caterer-map` for host overrides)

Use `@trouvermontraiteur/multiple-markers-map` for search (many caterers) and `@trouvermontraiteur/single-marker-map` for detail (one caterer).
