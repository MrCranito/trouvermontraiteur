import {
  MAP_MARKER_CATEGORY_LABEL,
  MAP_MARKER_ICON_PATH,
  type MapMarkerCategory,
} from './marker-category';

/** Individual pins below this zoom; clusters at this zoom and further out. */
export const MAP_PIN_CLUSTER_MAX_ZOOM = 10;

export interface MapPinInput {
  id: string;
  name: string;
  position: google.maps.LatLngLiteral;
  category: MapMarkerCategory;
  /** `null` shows « Nouveau » instead of a rating. */
  ratingLabel: string | null;
  certified: boolean;
  /** Terracotta ring used for premium / mis en avant. */
  sponsored: boolean;
  selected: boolean;
  visited: boolean;
  hovered: boolean;
}

export interface MapPinLayerHandlers {
  onPinClick: (id: string) => void;
  onClusterClick: (bounds: google.maps.LatLngBounds) => void;
  /** Fired before the click so a map-level click can be ignored. */
  onPointerDown?: () => void;
}

interface MarkerHandle {
  setPosition(position: google.maps.LatLngLiteral): void;
  setZIndex(zIndex: number): void;
  destroy(): void;
}

const STYLE_ID = 'tmt-map-marker-pin-styles';

const PIN_STYLES = `
.gm-style button.tmt-pin,
.gm-style button.tmt-cluster {
  transition: transform 140ms ease;
}
.gm-style button.tmt-pin:hover,
.gm-style button.tmt-pin.tmt-pin--hover,
.gm-style button.tmt-cluster:hover {
  transform: scale(1.08);
}
`;

function ensurePinStyles(): void {
  if (document.getElementById(STYLE_ID)) {
    return;
  }
  const style = document.createElement('style');
  style.id = STYLE_ID;
  style.textContent = PIN_STYLES;
  document.head.appendChild(style);
}

function svgEl(
  tag: 'svg' | 'path' | 'polygon',
  attrs: Record<string, string>,
): SVGElement {
  const el = document.createElementNS('http://www.w3.org/2000/svg', tag);
  for (const [key, value] of Object.entries(attrs)) {
    el.setAttribute(key, value);
  }
  return el;
}

function iconSvg(category: MapMarkerCategory): SVGSVGElement {
  const svg = svgEl('svg', {
    width: '15',
    height: '15',
    viewBox: '0 0 24 24',
    fill: 'none',
    stroke: 'currentColor',
    'stroke-width': '2',
    'stroke-linecap': 'round',
    'stroke-linejoin': 'round',
    'aria-hidden': 'true',
  }) as SVGSVGElement;
  svg.appendChild(svgEl('path', { d: MAP_MARKER_ICON_PATH[category] }));
  return svg;
}

function starSvg(): SVGSVGElement {
  const svg = svgEl('svg', {
    class: 'tmt-pin__star',
    width: '12',
    height: '12',
    viewBox: '0 0 24 24',
    fill: '#E3A21A',
    'aria-hidden': 'true',
  }) as SVGSVGElement;
  svg.appendChild(
    svgEl('path', {
      d: 'M12 2.5l2.9 6 6.6.9-4.8 4.6 1.2 6.5L12 17.3l-5.9 3.2 1.2-6.5L2.5 9.4l6.6-.9z',
    }),
  );
  return svg;
}

function certifiedSvg(): SVGSVGElement {
  const svg = svgEl('svg', {
    class: 'tmt-pin__badge',
    width: '17',
    height: '17',
    viewBox: '0 0 24 24',
    'aria-label': 'Certifié',
    role: 'img',
  }) as SVGSVGElement;
  svg.style.position = 'absolute';
  svg.style.top = '-7px';
  svg.style.right = '-7px';
  svg.style.display = 'none';
  svg.appendChild(
    svgEl('polygon', {
      points:
        '12.00,1.00 14.41,3.02 17.50,2.47 18.58,5.42 21.53,6.50 20.98,9.59 23.00,12.00 20.98,14.41 21.53,17.50 18.58,18.58 17.50,21.53 14.41,20.98 12.00,23.00 9.59,20.98 6.50,21.53 5.42,18.58 2.47,17.50 3.02,14.41 1.00,12.00 3.02,9.59 2.47,6.50 5.42,5.42 6.50,2.47 9.59,3.02',
      fill: '#B04A17',
      stroke: '#FFFFFF',
      'stroke-width': '2.2',
      'stroke-linejoin': 'round',
    }),
  );
  svg.appendChild(
    svgEl('path', {
      d: 'M8.4 12.3l2.4 2.4 4.8-5',
      fill: 'none',
      stroke: '#FFFFFF',
      'stroke-width': '2.6',
      'stroke-linecap': 'round',
      'stroke-linejoin': 'round',
    }),
  );
  return svg;
}

function pinZIndex(pin: MapPinInput): number {
  if (pin.selected) {
    return 40;
  }
  if (pin.hovered) {
    return 35;
  }
  if (pin.sponsored) {
    return 30;
  }
  return 10;
}

function createPinButton(): HTMLButtonElement {
  const button = document.createElement('button');
  button.type = 'button';
  button.className = 'tmt-pin';
  button.style.display = 'flex';
  button.style.flexDirection = 'column';
  button.style.alignItems = 'center';
  button.style.padding = '0';
  button.style.margin = '0';
  button.style.border = 'none';
  button.style.background = 'transparent';
  button.style.cursor = 'pointer';
  button.style.lineHeight = '1';
  button.style.fontFamily =
    "'Poppins', 'Segoe UI', system-ui, sans-serif";

  const body = document.createElement('span');
  body.className = 'tmt-pin__body';
  body.style.position = 'relative';
  body.style.display = 'flex';
  body.style.alignItems = 'center';
  body.style.gap = '5px';
  body.style.height = '34px';
  body.style.boxSizing = 'border-box';
  body.style.padding = '0 11px 0 4px';
  body.style.borderRadius = '17px';
  body.style.fontSize = '13px';
  body.style.fontWeight = '600';
  body.style.whiteSpace = 'nowrap';
  body.style.fontVariantNumeric = 'tabular-nums';
  body.style.lineHeight = '1';

  const icon = document.createElement('span');
  icon.className = 'tmt-pin__icon';
  icon.style.width = '26px';
  icon.style.height = '26px';
  icon.style.borderRadius = '13px';
  icon.style.display = 'flex';
  icon.style.alignItems = 'center';
  icon.style.justifyContent = 'center';
  icon.style.flex = 'none';
  icon.appendChild(iconSvg('autre'));

  const label = document.createElement('span');
  label.className = 'tmt-pin__label';

  body.append(icon, label, starSvg(), certifiedSvg());

  const tail = document.createElement('span');
  tail.className = 'tmt-pin__tail';
  tail.style.width = '10px';
  tail.style.height = '10px';
  tail.style.marginTop = '-6px';
  tail.style.transform = 'rotate(45deg)';
  tail.style.flex = 'none';

  button.append(body, tail);
  return button;
}

function paintPin(button: HTMLButtonElement, pin: MapPinInput): void {
  const selected = pin.selected;
  const visited = pin.visited && !selected;
  const sponsored = pin.sponsored;
  const rated = pin.ratingLabel != null;
  const bg = selected ? '#2A2420' : visited ? '#F2ECE3' : '#FFFFFF';
  const fg = selected ? '#FFFFFF' : visited ? '#4A433D' : '#2A2420';
  const iconBg = selected
    ? 'rgba(255,255,255,0.16)'
    : sponsored
      ? '#F6E6DC'
      : visited
        ? '#E6DED3'
        : '#F2ECE3';
  const iconFg = selected ? '#FFFFFF' : sponsored ? '#8F3A10' : '#2A2420';
  const shadow =
    sponsored && !selected
      ? '0 0 0 2px #B04A17, 0 2px 8px rgba(42,36,32,0.22)'
      : selected
        ? '0 4px 14px rgba(42,36,32,0.35)'
        : '0 2px 8px rgba(42,36,32,0.22)';

  const body = button.querySelector<HTMLElement>('.tmt-pin__body');
  const icon = button.querySelector<HTMLElement>('.tmt-pin__icon');
  const iconPath = button.querySelector<SVGPathElement>('.tmt-pin__icon path');
  const star = button.querySelector<SVGSVGElement>('.tmt-pin__star');
  const label = button.querySelector<HTMLElement>('.tmt-pin__label');
  const badge = button.querySelector<SVGSVGElement>('.tmt-pin__badge');
  const tail = button.querySelector<HTMLElement>('.tmt-pin__tail');

  if (body) {
    body.style.background = bg;
    body.style.color = fg;
    body.style.boxShadow = shadow;
  }
  if (icon) {
    icon.style.background = iconBg;
    icon.style.color = iconFg;
  }
  iconPath?.setAttribute('d', MAP_MARKER_ICON_PATH[pin.category]);
  if (star) {
    const starFill = selected ? '#F2C14E' : '#E3A21A';
    star.style.display = rated ? 'block' : 'none';
    star.setAttribute('fill', starFill);
    star.querySelector('path')?.setAttribute('fill', starFill);
  }
  if (label) {
    label.textContent = rated ? pin.ratingLabel : 'Nouveau';
    label.style.fontWeight = rated ? '600' : '500';
  }
  if (badge) {
    badge.style.display = pin.certified ? 'block' : 'none';
  }
  if (tail) {
    tail.style.background = bg;
    tail.style.boxShadow =
      sponsored && !selected ? '2px 2px 0 0 #B04A17' : 'none';
  }

  button.dataset['pinId'] = pin.id;
  button.style.cursor = 'pointer';
  button.classList.toggle('tmt-pin--hover', pin.hovered);
  button.setAttribute('aria-pressed', selected ? 'true' : 'false');
  const note = rated ? `note ${pin.ratingLabel} sur 5` : 'nouveau';
  button.setAttribute(
    'aria-label',
    `${pin.name}, ${MAP_MARKER_CATEGORY_LABEL[pin.category]}, ${note}`,
  );
}

function createClusterButton(count: number): HTMLButtonElement {
  const button = document.createElement('button');
  button.type = 'button';
  button.className = 'tmt-cluster';
  button.textContent = String(count);
  button.style.width = '52px';
  button.style.height = '52px';
  button.style.boxSizing = 'border-box';
  button.style.borderRadius = '26px';
  button.style.border = '3px solid #FFFFFF';
  button.style.background = '#2A2420';
  button.style.color = '#FFFFFF';
  button.style.fontFamily = "'Poppins', 'Segoe UI', system-ui, sans-serif";
  button.style.fontSize = '16px';
  button.style.fontWeight = '600';
  button.style.lineHeight = '1';
  button.style.padding = '0';
  button.style.margin = '0';
  button.style.cursor = 'pointer';
  button.style.boxShadow = '0 2px 12px rgba(42,36,32,0.3)';
  button.style.display = 'flex';
  button.style.alignItems = 'center';
  button.style.justifyContent = 'center';
  button.setAttribute('aria-label', `${count} artisans, zoomer`);
  return button;
}

function stopMapGesture(element: HTMLElement): void {
  for (const type of ['pointerdown', 'mousedown', 'touchstart', 'dblclick']) {
    element.addEventListener(type, (event) => event.stopPropagation());
  }
}

function mountOverlay(
  map: google.maps.Map,
  position: google.maps.LatLngLiteral,
  element: HTMLElement,
  anchor: 'pin' | 'cluster',
): MarkerHandle {
  const Overlay = class extends google.maps.OverlayView {
    private wrap: HTMLDivElement | null = null;
    private latLng = new google.maps.LatLng(position);
    private zIndex = 1;

    override onAdd(): void {
      const wrap = document.createElement('div');
      wrap.style.position = 'absolute';
      wrap.style.transform =
        anchor === 'pin' ? 'translate(-50%, -100%)' : 'translate(-50%, -50%)';
      wrap.style.zIndex = String(this.zIndex);
      wrap.style.pointerEvents = 'auto';
      wrap.appendChild(element);
      this.wrap = wrap;
      this.getPanes()?.overlayMouseTarget.appendChild(wrap);
    }

    override draw(): void {
      const point = this.getProjection()?.fromLatLngToDivPixel(this.latLng);
      if (!point || !this.wrap) {
        return;
      }
      this.wrap.style.left = `${point.x}px`;
      this.wrap.style.top = `${point.y}px`;
    }

    override onRemove(): void {
      this.wrap?.remove();
      this.wrap = null;
    }

    move(next: google.maps.LatLngLiteral): void {
      this.latLng = new google.maps.LatLng(next);
      this.draw();
    }

    raise(zIndex: number): void {
      this.zIndex = zIndex;
      if (this.wrap) {
        this.wrap.style.zIndex = String(zIndex);
      }
    }
  };

  const overlay = new Overlay();
  overlay.setMap(map);
  return {
    setPosition: (next) => overlay.move(next),
    setZIndex: (zIndex) => overlay.raise(zIndex),
    destroy: () => overlay.setMap(null),
  };
}

interface PinRecord {
  handle: MarkerHandle;
  button: HTMLButtonElement;
  z: { value: number };
}

interface ClusterRecord {
  handle: MarkerHandle;
  button: HTMLButtonElement;
  members: MapPinInput[];
}

interface ClusterGroup {
  id: string;
  count: number;
  position: google.maps.LatLngLiteral;
  members: MapPinInput[];
}

type PinGroup =
  | { kind: 'pin'; pin: MapPinInput }
  | { kind: 'cluster'; cluster: ClusterGroup };

function project(lat: number, lng: number, zoom: number): { x: number; y: number } {
  const scale = 256 * 2 ** zoom;
  const sin = Math.sin((lat * Math.PI) / 180);
  const x = ((lng + 180) / 360) * scale;
  const y =
    (0.5 - Math.log((1 + sin) / (1 - sin)) / (4 * Math.PI)) * scale;
  return { x, y };
}

function groupPins(pins: MapPinInput[], zoom: number, cluster: boolean): PinGroup[] {
  if (!cluster || zoom > MAP_PIN_CLUSTER_MAX_ZOOM) {
    return pins.map((pin) => ({ kind: 'pin', pin }));
  }

  const cell = 72;
  const buckets = new Map<string, MapPinInput[]>();
  for (const pin of pins) {
    const point = project(pin.position.lat, pin.position.lng, zoom);
    const key = `${Math.floor(point.x / cell)}:${Math.floor(point.y / cell)}`;
    const list = buckets.get(key);
    if (list) {
      list.push(pin);
    } else {
      buckets.set(key, [pin]);
    }
  }

  const groups: PinGroup[] = [];
  for (const [id, members] of buckets) {
    if (members.length < 2) {
      groups.push({ kind: 'pin', pin: members[0] });
      continue;
    }
    const lat =
      members.reduce((sum, pin) => sum + pin.position.lat, 0) / members.length;
    const lng =
      members.reduce((sum, pin) => sum + pin.position.lng, 0) / members.length;
    groups.push({
      kind: 'cluster',
      cluster: { id, count: members.length, position: { lat, lng }, members },
    });
  }
  return groups;
}

/** HTML map pins (and far-zoom clusters) matching the marker design. */
export class MapPinLayer {
  private map: google.maps.Map | null = null;
  private handlers: MapPinLayerHandlers | null = null;
  private zoomListener: google.maps.MapsEventListener | null = null;
  private pins: MapPinInput[] = [];
  private readonly pinRecords = new Map<string, PinRecord>();
  private readonly clusterRecords = new Map<string, ClusterRecord>();

  constructor(private readonly cluster: boolean) {}

  attach(map: google.maps.Map, handlers: MapPinLayerHandlers): void {
    if (this.map === map) {
      this.handlers = handlers;
      this.render();
      return;
    }

    this.detachListeners();
    this.map = map;
    this.handlers = handlers;
    ensurePinStyles();
    this.zoomListener = map.addListener('zoom_changed', () => this.render());
    this.render();
  }

  sync(pins: MapPinInput[]): void {
    this.pins = pins;
    this.render();
  }

  destroy(): void {
    this.detachListeners();
    this.clearRecords();
    this.map = null;
    this.handlers = null;
    this.pins = [];
  }

  private detachListeners(): void {
    if (this.zoomListener) {
      google.maps.event.removeListener(this.zoomListener);
      this.zoomListener = null;
    }
  }

  private clearRecords(): void {
    for (const record of this.pinRecords.values()) {
      record.handle.destroy();
    }
    for (const record of this.clusterRecords.values()) {
      record.handle.destroy();
    }
    this.pinRecords.clear();
    this.clusterRecords.clear();
  }

  private render(): void {
    const map = this.map;
    if (!map) {
      return;
    }

    const zoom = map.getZoom() ?? 6;
    const groups = groupPins(this.pins, zoom, this.cluster);
    const pinIds = new Set<string>();
    const clusterIds = new Set<string>();

    for (const group of groups) {
      if (group.kind === 'pin') {
        pinIds.add(group.pin.id);
        this.upsertPin(map, group.pin);
      } else {
        clusterIds.add(group.cluster.id);
        this.upsertCluster(map, group.cluster);
      }
    }

    for (const [id, record] of this.pinRecords) {
      if (!pinIds.has(id)) {
        record.handle.destroy();
        this.pinRecords.delete(id);
      }
    }
    for (const [id, record] of this.clusterRecords) {
      if (!clusterIds.has(id)) {
        record.handle.destroy();
        this.clusterRecords.delete(id);
      }
    }
  }

  private upsertPin(map: google.maps.Map, pin: MapPinInput): void {
    let record = this.pinRecords.get(pin.id);
    if (!record) {
      const button = createPinButton();
      const z = { value: pinZIndex(pin) };
      const handle = mountOverlay(map, pin.position, button, 'pin');
      stopMapGesture(button);
      button.addEventListener('pointerdown', () => {
        this.handlers?.onPointerDown?.();
      });
      button.addEventListener('click', (event) => {
        event.preventDefault();
        event.stopPropagation();
        const id = button.dataset['pinId'];
        if (id) {
          this.handlers?.onPinClick(id);
        }
      });
      button.addEventListener('mouseenter', () => {
        handle.setZIndex(Math.max(z.value, 36));
      });
      button.addEventListener('mouseleave', () => {
        handle.setZIndex(z.value);
      });
      record = { handle, button, z };
      this.pinRecords.set(pin.id, record);
    }

    record.z.value = pinZIndex(pin);
    record.handle.setZIndex(record.z.value);
    record.handle.setPosition(pin.position);
    paintPin(record.button, pin);
  }

  private upsertCluster(map: google.maps.Map, cluster: ClusterGroup): void {
    let record = this.clusterRecords.get(cluster.id);
    if (!record) {
      const button = createClusterButton(cluster.count);
      const handle = mountOverlay(map, cluster.position, button, 'cluster');
      const members: MapPinInput[] = [];
      stopMapGesture(button);
      button.addEventListener('pointerdown', () => {
        this.handlers?.onPointerDown?.();
      });
      button.addEventListener('click', (event) => {
        event.preventDefault();
        event.stopPropagation();
        const bounds = new google.maps.LatLngBounds();
        for (const member of members) {
          bounds.extend(member.position);
        }
        this.handlers?.onClusterClick(bounds);
      });
      record = { handle, button, members };
      this.clusterRecords.set(cluster.id, record);
    }

    record.members.splice(0, record.members.length, ...cluster.members);
    record.button.textContent = String(cluster.count);
    record.button.setAttribute(
      'aria-label',
      `${cluster.count} artisans, zoomer`,
    );
    record.handle.setZIndex(20);
    record.handle.setPosition(cluster.position);
  }
}
