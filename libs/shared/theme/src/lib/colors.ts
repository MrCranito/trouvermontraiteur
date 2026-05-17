/** Brand palette — use in SCSS, charts, or custom UI outside PrimeNG tokens. */
export const colors = {
  cream: '#FAF6EF',
  creamDark: '#F0E8D8',
  terracotta: '#C4622D',
  terracottaLight: '#E8825A',
  sage: '#5C7A5E',
  sageLight: '#8FAF91',
  charcoal: '#2A2219',
  muted: '#7A6E61',
  gold: '#D4A853',
  border: 'rgba(42,34,25,0.12)',
} as const;

export type BrandColors = typeof colors;
