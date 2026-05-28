import type { Craftsman } from './craftsman';

export interface CraftsmanPublishReadiness {
  canPublish: boolean;
  missing: string[];
}

export function getCraftsmanPublishReadiness(
  craftsman: Pick<
    Craftsman,
    'description' | 'imageUrl' | 'realisations' | 'trades' | 'subCategoryIds'
  >,
): CraftsmanPublishReadiness {
  const missing: string[] = [];

  const hasPhoto =
    craftsman.imageUrl.trim().length > 0 ||
    craftsman.realisations.some((item) => item.imageUrl.trim().length > 0);

  if (!hasPhoto) {
    missing.push('Au moins une photo');
  }

  if (!craftsman.description.trim()) {
    missing.push('Une description');
  }

  const hasProfessionCategory =
    craftsman.trades.length > 0 || craftsman.subCategoryIds.length > 0;

  if (!hasProfessionCategory) {
    missing.push('Une catégorie de métier');
  }

  return {
    canPublish: missing.length === 0,
    missing,
  };
}
