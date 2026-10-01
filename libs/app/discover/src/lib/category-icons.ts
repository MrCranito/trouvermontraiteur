import type { Category } from '@trouvermontraiteur/models';

const PRIME_ICON_CLASS = /^pi pi-[a-z0-9-]+$/;

/** Class list for a category chip, from `categories.icon`. */
export function categoryIconClass(
  category: Pick<Category, 'icon'>,
): string {
  const icon = category.icon?.trim() ?? '';
  return PRIME_ICON_CLASS.test(icon) ? icon : 'pi pi-briefcase';
}
