/** Map options shared by caterer listing/detail maps (no default UI, optional pan). */
export function buildCatererMapOptions(panEnabled: boolean): google.maps.MapOptions {
  return {
    disableDefaultUI: true,
    mapTypeControl: false,
    streetViewControl: false,
    fullscreenControl: false,
    zoomControl: false,
    rotateControl: false,
    scaleControl: false,
    clickableIcons: false,
    keyboardShortcuts: false,
    draggable: panEnabled,
    scrollwheel: panEnabled,
    disableDoubleClickZoom: !panEnabled,
    gestureHandling: panEnabled ? 'greedy' : 'none',
  };
}
