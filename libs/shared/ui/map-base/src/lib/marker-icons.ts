import { colors } from '@trouvermontraiteur/theme';
import { HOME_ICON_PNG_BASE64 } from './home-icon.base64';

const MARKER_SIZE = 30;
const ICON_INSET = 5;
const ICON_DRAW_SIZE = MARKER_SIZE - ICON_INSET * 2;

function roundedHouseSvg(strokeColor: string): string {
  const imageHref = `data:image/png;base64,${HOME_ICON_PNG_BASE64}`;

  return `<svg xmlns="http://www.w3.org/2000/svg" width="${MARKER_SIZE}" height="${MARKER_SIZE}" viewBox="0 0 30 30">
  <defs>
    <clipPath id="clip">
      <circle cx="15" cy="15" r="14"/>
    </clipPath>
  </defs>
  <circle
    cx="15"
    cy="15"
    r="14"
    fill="${colors.cream}"
    stroke="${strokeColor}"
    stroke-width="1.5"
  />
  <image
    href="${imageHref}"
    x="${ICON_INSET}"
    y="${ICON_INSET}"
    width="${ICON_DRAW_SIZE}"
    height="${ICON_DRAW_SIZE}"
    clip-path="url(#clip)"
    preserveAspectRatio="xMidYMid meet"
  />
</svg>`;
}

function formatRatingLabel(rating: number): string {
  return Number.isInteger(rating) ? String(rating) : rating.toFixed(1);
}

/** 5-point star path centered at (cx, cy). */
function starPath(
  cx: number,
  cy: number,
  outerR: number,
  innerR: number,
): string {
  const points: string[] = [];
  for (let i = 0; i < 10; i++) {
    const r = i % 2 === 0 ? outerR : innerR;
    const angle = -Math.PI / 2 + (i * Math.PI) / 5;
    points.push(`${cx + r * Math.cos(angle)},${cy + r * Math.sin(angle)}`);
  }
  return `M${points.join('L')}Z`;
}

/** Rounded-square map marker with rating (note) + star on the right. */
export function catererRatingMarkerIcon(
  rating: number,
  active: boolean,
): google.maps.Icon {
  const label = formatRatingLabel(rating);
  const width = label.length > 3 ? 48 : 42;
  const height = 30;
  const fontSize = label.length > 3 ? 11 : 12;
  const starCx = width - 13;
  const starCy = height / 2;
  const textX = (4 + starCx - 6.5) / 2;

  const fill = active ? colors.terracotta : colors.cream;
  const stroke = active ? colors.terracotta : colors.terracotta;
  const textFill = active ? colors.cream : colors.charcoal;
  const starFill = active ? colors.cream : colors.gold;

  const svg = `<svg xmlns="http://www.w3.org/2000/svg" width="${width}" height="${height}" viewBox="0 0 ${width} ${height}">
  <rect
    x="1"
    y="1"
    width="${width - 2}"
    height="${height - 2}"
    rx="8"
    ry="8"
    fill="${fill}"
    stroke="${stroke}"
    stroke-width="${active ? 2.5 : 2}"
  />
  <text
    x="${textX}"
    y="${height / 2}"
    text-anchor="middle"
    dominant-baseline="central"
    font-family="Poppins,sans-serif"
    font-size="${fontSize}"
    font-weight="700"
    fill="${textFill}"
  >${label}</text>
  <path
    d="${starPath(starCx, starCy, 6.5, 3.2)}"
    fill="${starFill}"
  />
</svg>`;

  return {
    url: `data:image/svg+xml;charset=UTF-8,${encodeURIComponent(svg)}`,
    scaledSize: new google.maps.Size(width, height),
    anchor: new google.maps.Point(width / 2, height / 2),
  };
}

/** Rounded 30×30 map marker using the brand home icon. */
export function homeMarkerIcon(active: boolean): google.maps.Icon {
  const stroke = active ? colors.terracottaLight : colors.terracotta;

  return {
    url: `data:image/svg+xml;charset=UTF-8,${encodeURIComponent(
      roundedHouseSvg(stroke),
    )}`,
    scaledSize: new google.maps.Size(MARKER_SIZE, MARKER_SIZE),
    anchor: new google.maps.Point(MARKER_SIZE / 2, MARKER_SIZE / 2),
  };
}
