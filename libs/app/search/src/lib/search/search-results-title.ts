import { TRADE_FAMILIES, TRADE_LABELS } from '@trouvermontraiteur/data';
import { CraftsmanTrade } from '@trouvermontraiteur/models';

export interface SearchResultsTitleInput {
  count: number;
  loading: boolean;
  userMovedMap: boolean;
  cityName: string | null;
  projectDate: string;
  tradeLabel: string | null;
  familyLabel: string | null;
  singleTrade: boolean;
}

export interface SearchResultsTitle {
  heading: string;
  subtitle: string;
}

export function formatArtisanCount(count: number): string {
  if (count === 0) {
    return 'Aucun artisan';
  }
  return `${count} artisan${count > 1 ? 's' : ''}`;
}

export function formatProjectDateLabel(iso: string): string | null {
  if (!iso || !/^\d{4}-\d{2}-\d{2}$/.test(iso)) {
    return null;
  }
  const parsed = new Date(`${iso}T12:00:00`);
  if (Number.isNaN(parsed.getTime())) {
    return null;
  }
  const formatted = new Intl.DateTimeFormat('fr-FR', {
    day: 'numeric',
    month: 'long',
  }).format(parsed);
  return formatted.charAt(0).toUpperCase() + formatted.slice(1);
}

export function resolveTradeFamilyLabel(
  trades: CraftsmanTrade[],
): string | null {
  if (trades.length === 0) {
    return null;
  }

  const family = TRADE_FAMILIES.find((entry) =>
    trades.every((trade) =>
      entry.trades.some((familyTrade) => familyTrade.id === trade),
    ),
  );

  return family?.label ?? null;
}

/** Libellé affiché dans le titre : métier si un seul, famille si toute une catégorie. */
export function resolveTradeDisplayLabel(
  trades: CraftsmanTrade[],
): string | null {
  if (trades.length === 0) {
    return null;
  }

  if (trades.length === 1) {
    return TRADE_LABELS[trades[0]] ?? null;
  }

  return resolveTradeFamilyLabel(trades);
}

export function buildSearchResultsTitle(
  input: SearchResultsTitleInput,
): SearchResultsTitle {
  if (input.loading) {
    return {
      heading: 'Recherche en cours…',
      subtitle: 'Mise à jour des artisans',
    };
  }

  if (input.count === 0) {
    return {
      heading: 'Aucune correspondance exacte',
      subtitle:
        'Modifiez ou supprimez certains de vos filtres ou ajustez votre zone de recherche.',
    };
  }

  if (input.count > 1000) {
    return {
      heading: 'Plus de 1000 artisans dans la zone de la carte',
      subtitle: 'Selon la zone visible sur la carte',
    };
  }

  const countLabel = formatArtisanCount(input.count);

  if (input.userMovedMap) {
    return {
      heading: `${countLabel} dans la zone de la carte`,
      subtitle: 'Selon la zone visible sur la carte',
    };
  }

  const dateLabel = formatProjectDateLabel(input.projectDate);
  const cityName = input.cityName?.trim() || null;
  const categoryLabel = input.tradeLabel;
  const familyLabel = input.familyLabel;
  const singleTrade = input.singleTrade;

  if (cityName && categoryLabel && singleTrade) {
    const locationHeading = dateLabel
      ? `${categoryLabel} — ${cityName} ${dateLabel} : ${countLabel}`
      : `${categoryLabel} — ${cityName} : ${countLabel}`;
    return {
      heading: locationHeading,
      subtitle:
        familyLabel && familyLabel !== categoryLabel
          ? `${familyLabel} — ${categoryLabel}`
          : dateLabel
            ? `Autour de ${cityName} pour le ${dateLabel.toLowerCase()}`
            : `Autour de ${cityName}`,
    };
  }

  if (cityName) {
    const locationHeading = dateLabel
      ? `${cityName} ${dateLabel} : ${countLabel}`
      : `${cityName} : ${countLabel}`;
    return {
      heading: locationHeading,
      subtitle: dateLabel
        ? `Autour de ${cityName} pour le ${dateLabel.toLowerCase()}`
        : `Autour de ${cityName}`,
    };
  }

  if (categoryLabel) {
    return {
      heading: `${categoryLabel} : ${countLabel} dans la zone de la carte`,
      subtitle: singleTrade
        ? familyLabel && familyLabel !== categoryLabel
          ? `${familyLabel} — ${categoryLabel}`
          : categoryLabel
        : `Métiers de la catégorie ${categoryLabel}`,
    };
  }

  return {
    heading: countLabel,
    subtitle: 'Parcourez les artisans disponibles',
  };
}
