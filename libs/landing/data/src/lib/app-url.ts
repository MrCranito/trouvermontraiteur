/** Builds an absolute or relative app URL from a configured base. */
export function buildAppUrl(
  base: string | null | undefined,
  path = '',
): string {
  const normalizedPath = path
    ? path.startsWith('/')
      ? path
      : `/${path}`
    : '';

  const trimmed = (base ?? '').replace(/\/$/, '');
  if (!trimmed) {
    return normalizedPath || '/';
  }

  if (trimmed.startsWith('http://') || trimmed.startsWith('https://')) {
    return `${trimmed}${normalizedPath}`;
  }

  return `${trimmed}${normalizedPath}`;
}
