import {
  CatererDetailLayout,
  CatererDetailLayoutPreset,
  CatererDetailSectionId,
} from '@trouvermontraiteur/models';

const DEFAULT_SECTIONS: CatererDetailSectionId[] = [
  'cover',
  'about',
  'availability',
  'prestations',
  'menu',
  'location',
];

function layout(
  id: string,
  name: string,
  sections: CatererDetailSectionId[],
  custom = false,
): CatererDetailLayout {
  return { templateId: id, templateName: name, custom, sections };
}

export const DEFAULT_DETAIL_LAYOUT: CatererDetailLayout = layout(
  'classic',
  'Classique',
  DEFAULT_SECTIONS,
);

export const DETAIL_LAYOUT_PRESETS: CatererDetailLayoutPreset[] = [
  {
    id: 'classic',
    name: 'Classique',
    description:
      'Présentation, disponibilités, prestations, menu puis localisation — le parcours le plus naturel.',
    layout: DEFAULT_DETAIL_LAYOUT,
  },
  {
    id: 'menu-first',
    name: 'Carte en avant',
    description:
      'Met le menu juste après la présentation pour les clients qui comparent les tarifs.',
    layout: layout('menu-first', 'Carte en avant', [
      'cover',
      'about',
      'menu',
      'availability',
      'prestations',
      'location',
    ]),
  },
  {
    id: 'availability-focus',
    name: 'Disponibilités en avant',
    description:
      'Le calendrier apparaît juste après la présentation pour rassurer vos clients.',
    layout: layout('availability-focus', 'Disponibilités en avant', [
      'cover',
      'availability',
      'about',
      'prestations',
      'menu',
      'location',
    ]),
  },
  {
    id: 'compact',
    name: 'Essentiel',
    description:
      'Version épurée : moins de sections visibles, informations regroupées.',
    layout: layout('compact', 'Essentiel', [
      'cover',
      'about',
      'availability',
      'menu',
      'location',
    ]),
  },
];

export const DETAIL_SECTION_LABELS: Record<CatererDetailSectionId, string> = {
  cover: 'Photo de couverture',
  about: 'À propos',
  prestations: 'Événements & régimes',
  menu: 'Menu & prestations',
  availability: 'Disponibilités',
  location: 'Localisation',
};

export const DETAIL_SECTION_DESCRIPTIONS: Record<
  CatererDetailSectionId,
  string
> = {
  cover: 'Image principale en haut de la fiche',
  about: 'Description de votre établissement',
  prestations: 'Types d’événements et régimes alimentaires',
  menu: 'Carte et tarifs par catégorie',
  availability: 'Calendrier des dates disponibles',
  location: 'Carte et adresse',
};
