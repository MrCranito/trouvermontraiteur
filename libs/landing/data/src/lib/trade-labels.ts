import {
  ALL_TRADES,
  CraftsmanTrade,
  TRADE_FAMILIES,
  TRADE_LABELS,
  type TradeFamily,
} from '@trouvermontraiteur/models';

export { ALL_TRADES, TRADE_FAMILIES, TRADE_LABELS, type TradeFamily };

/** Slugs hérités (anciennes catégories agrégées). */
export const LEGACY_TRADE_ALIASES: Record<string, CraftsmanTrade> = {
  plomberie: 'plombier',
  electricite: 'electricien',
  menuiserie: 'menuisier',
  peinture: 'peintre_batiment',
  maconnerie: 'macon',
  couverture: 'couvreur',
  jardinage: 'jardinier',
  climatisation: 'climaticien',
  serrurerie: 'serrurier',
  carrelage: 'carreleur',
};

export function normalizeCraftsmanTrade(trade: string): CraftsmanTrade | null {
  if (trade in TRADE_LABELS) {
    return trade as CraftsmanTrade;
  }
  return LEGACY_TRADE_ALIASES[trade] ?? null;
}
