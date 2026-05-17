import { RenderMode, ServerRoute } from '@angular/ssr';
import { MOCK_CATERERS } from '@trouvermontraiteur/data';

export const serverRoutes: ServerRoute[] = [
  {
    path: '',
    renderMode: RenderMode.Prerender,
  },
  {
    path: 'recherche',
    renderMode: RenderMode.Prerender,
  },
  {
    path: 'inscription-pro',
    renderMode: RenderMode.Prerender,
  },
  {
    path: 'traiteurs/:slug',
    renderMode: RenderMode.Prerender,
    async getPrerenderParams() {
      return MOCK_CATERERS.map((c) => ({ slug: c.slug }));
    },
  },
  {
    path: '**',
    renderMode: RenderMode.Server,
  },
];
