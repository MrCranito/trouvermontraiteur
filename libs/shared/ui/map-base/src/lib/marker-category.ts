import { Craftsman, CraftsmanTrade } from '@trouvermontraiteur/models';

/** Trade family drawn inside a map pin. Matches the marker design. */
export type MapMarkerCategory =
  | 'traiteur'
  | 'photo'
  | 'musique'
  | 'anim'
  | 'deco'
  | 'loc'
  | 'orga'
  | 'tech'
  | 'gateau'
  | 'beaute'
  | 'autre';

export const MAP_MARKER_CATEGORY_LABEL: Record<MapMarkerCategory, string> = {
  traiteur: 'Traiteur & Boissons',
  photo: 'Photo & Vidéo',
  musique: 'Musique & DJ',
  anim: 'Animation',
  deco: 'Décoration & Fleurs',
  loc: 'Location & Mobilier',
  orga: 'Organisation',
  tech: 'Technique & Audiovisuel',
  gateau: 'Gâteau & Pâtisserie',
  beaute: 'Beauté & Mode',
  autre: 'Artisan',
};

/** Stroke icon paths (24×24), same geometry as the marker design. */
export const MAP_MARKER_ICON_PATH: Record<MapMarkerCategory, string> = {
  traiteur: 'M3 18h18 M5 18a7 7 0 0 1 14 0 M12 8V6 M10 6h4',
  photo:
    'M4 8h3l1.5-2h7L17 8h3v11H4z M12 10.5a3.5 3.5 0 1 0 0 7a3.5 3.5 0 1 0 0-7z',
  musique:
    'M9 18V5l11-2v13 M9 18a3 3 0 1 1-6 0a3 3 0 1 1 6 0z M20 16a3 3 0 1 1-6 0a3 3 0 1 1 6 0z',
  anim: 'M12 3l1.8 4.7 4.7 1.8-4.7 1.8L12 16l-1.8-4.7L5.5 9.5l4.7-1.8z M19 15l.8 2.2L22 18l-2.2.8L19 21l-.8-2.2L16 18l2.2-.8z',
  deco: 'M12 21v-8 M7 4l2.5 3L12 4l2.5 3L17 4v5a5 5 0 0 1-10 0z M12 18c-1.5-1.8-4-2.2-5.5-1.5 M12 18c1.5-1.8 4-2.2 5.5-1.5',
  loc: 'M7 3v10 M17 3v10 M7 8h10 M5 13h14v3H5z M6 16v5 M18 16v5',
  orga: 'M8 3h8v3H8z M7 4.5H5v16.5h14V4.5h-2 M9 13l2 2 4-4',
  tech: 'M6 3h12v18H6z M12 11a3 3 0 1 0 0 6a3 3 0 1 0 0-6z M12 7h.01',
  gateau:
    'M4 14c1.4-2 3-3 4.4-3S11 12 12 12s1.8-1 3.6-1 3 .9 4.4 3v5H4z M12 11V7.5 M10.2 7.5h3.6',
  beaute: 'M8 3v18 M8 7h8a3 3 0 0 1 0 6H8 M8 13h6a2.5 2.5 0 0 1 0 5H8',
  autre: 'M8 7V5h8v2 M4 7h16v12H4z M4 12h16',
};

const CATEGORY_KEYS: { key: string; category: MapMarkerCategory }[] = [
  { key: 'mise en scene', category: 'deco' },
  { key: 'groupe de musique', category: 'musique' },
  { key: 'personnel evenementiel', category: 'orga' },
  { key: 'materiel evenementiel', category: 'loc' },
  { key: 'wedding planner', category: 'orga' },
  { key: 'event planner', category: 'orga' },
  { key: 'wedding cake', category: 'gateau' },
  { key: 'piece montee', category: 'gateau' },
  { key: 'food truck', category: 'traiteur' },
  { key: 'photographe', category: 'photo' },
  { key: 'photobooth', category: 'photo' },
  { key: 'videaste', category: 'photo' },
  { key: 'sonorisation', category: 'tech' },
  { key: 'audiovisuel', category: 'tech' },
  { key: 'eclairage', category: 'tech' },
  { key: 'coordination', category: 'orga' },
  { key: 'organisation', category: 'orga' },
  { key: 'estheticienne', category: 'beaute' },
  { key: 'decoration', category: 'deco' },
  { key: 'chocolatier', category: 'gateau' },
  { key: 'chocolat', category: 'gateau' },
  { key: 'patissier', category: 'gateau' },
  { key: 'patiss', category: 'gateau' },
  { key: 'gateau', category: 'gateau' },
  { key: 'fleuriste', category: 'deco' },
  { key: 'animateur', category: 'anim' },
  { key: 'animation', category: 'anim' },
  { key: 'magicien', category: 'anim' },
  { key: 'spectacle', category: 'anim' },
  { key: 'musicien', category: 'musique' },
  { key: 'chanteur', category: 'musique' },
  { key: 'musique', category: 'musique' },
  { key: 'mobilier', category: 'loc' },
  { key: 'vaisselle', category: 'loc' },
  { key: 'location', category: 'loc' },
  { key: 'traiteur', category: 'traiteur' },
  { key: 'boulanger', category: 'traiteur' },
  { key: 'boucher', category: 'traiteur' },
  { key: 'cocktail', category: 'traiteur' },
  { key: 'buffet', category: 'traiteur' },
  { key: 'boisson', category: 'traiteur' },
  { key: 'coiffeur', category: 'beaute' },
  { key: 'maquilleur', category: 'beaute' },
  { key: 'couturier', category: 'beaute' },
  { key: 'styliste', category: 'beaute' },
  { key: 'accessoire', category: 'beaute' },
  { key: 'beaute', category: 'beaute' },
  { key: 'technique', category: 'tech' },
  { key: 'ecrans', category: 'tech' },
  { key: 'ecran', category: 'tech' },
  { key: 'fleur', category: 'deco' },
  { key: 'ballon', category: 'deco' },
  { key: 'decor', category: 'deco' },
  { key: 'tente', category: 'loc' },
  { key: 'chaise', category: 'loc' },
  { key: 'table', category: 'loc' },
  { key: 'photo', category: 'photo' },
  { key: 'video', category: 'photo' },
  { key: 'scene', category: 'tech' },
  { key: 'activite', category: 'anim' },
  { key: 'quiz', category: 'anim' },
  { key: 'chef', category: 'traiteur' },
  { key: 'tenue', category: 'beaute' },
  { key: 'dj', category: 'musique' },
];

CATEGORY_KEYS.sort((a, b) => b.key.length - a.key.length);

const TRADE_CATEGORY: Partial<Record<CraftsmanTrade, MapMarkerCategory>> = {
  traiteur: 'traiteur',
  boulanger: 'traiteur',
  boucher: 'traiteur',
  charcutier: 'traiteur',
  poissonnier: 'traiteur',
  fromager: 'traiteur',
  brasseur: 'traiteur',
  caviste: 'traiteur',
  pizzaolo: 'traiteur',
  patissier: 'gateau',
  chocolatier: 'gateau',
  photographe_artisan: 'photo',
  fleuriste: 'deco',
  peintre_decorateur: 'deco',
  architecte_interieur: 'deco',
  coiffeur: 'beaute',
  estheticienne: 'beaute',
  styliste: 'beaute',
  couturier: 'beaute',
  masseur: 'beaute',
};

function normalizeLabel(value: string): string {
  return value
    .toLowerCase()
    .normalize('NFD')
    .replace(/\p{M}/gu, '');
}

function matchesKey(text: string, key: string): boolean {
  if (key.length > 3) {
    return text.includes(key);
  }
  return new RegExp(`(?:^|[^a-z0-9])${key}(?:$|[^a-z0-9])`).test(text);
}

function categoryFromText(value: string): MapMarkerCategory | null {
  const text = normalizeLabel(value);
  for (const entry of CATEGORY_KEYS) {
    if (matchesKey(text, entry.key)) {
      return entry.category;
    }
  }
  return null;
}

/** French rating label (`4,8`). `null` means the pin shows « Nouveau ». */
export function formatMarkerRating(rating: number): string {
  return rating.toFixed(1).replace('.', ',');
}

export function markerCategoryOf(
  craftsman: Pick<Craftsman, 'categoryLabels' | 'trades'>,
): MapMarkerCategory {
  for (const label of craftsman.categoryLabels ?? []) {
    const match = categoryFromText(label);
    if (match) {
      return match;
    }
  }

  for (const trade of craftsman.trades) {
    const match = categoryFromText(trade) ?? TRADE_CATEGORY[trade];
    if (match) {
      return match;
    }
  }

  return 'autre';
}
