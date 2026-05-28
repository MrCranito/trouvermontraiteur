export interface TradeFamily {
  readonly id: string;
  readonly label: string;
  readonly trades: readonly { readonly id: string; readonly label: string }[];
}

export const TRADE_FAMILIES = [
  {
    id: 'batiments',
    label: 'Bâtiments',
    trades: [
      { id: 'macon', label: 'Maçon' },
      { id: 'electricien', label: 'Électricien' },
      { id: 'plombier', label: 'Plombier' },
      { id: 'chauffagiste', label: 'Chauffagiste' },
      { id: 'frigoriste', label: 'Frigoriste' },
      { id: 'climaticien', label: 'Climaticien' },
      { id: 'couvreur', label: 'Couvreur' },
      { id: 'zingueur', label: 'Zingueur' },
      { id: 'charpentier', label: 'Charpentier' },
      { id: 'menuisier', label: 'Menuisier' },
      { id: 'serrurier', label: 'Serrurier' },
      { id: 'metallier', label: 'Métallier' },
      { id: 'ferronnier', label: 'Ferronnier' },
      { id: 'carreleur', label: 'Carreleur' },
      { id: 'peintre_batiment', label: 'Peintre en bâtiment' },
      { id: 'plaquiste', label: 'Plaquiste' },
      { id: 'facadier', label: 'Façadier' },
      { id: 'vitrier', label: 'Vitrier' },
      { id: 'miroitier', label: 'Miroitier' },
      { id: 'tailleur_pierre', label: 'Tailleur de pierre' },
      { id: 'marbrier', label: 'Marbrier' },
      { id: 'etancheur', label: 'Étancheur' },
      { id: 'pisciniste', label: 'Pisciniste' },
      { id: 'installateur_sanitaire', label: 'Installateur sanitaire' },
      { id: 'installateur_photovoltaique', label: 'Installateur photovoltaïque' },
      { id: 'domoticien', label: 'Domoticien' },
    ],
  },
  {
    id: 'reparation',
    label: 'Réparation',
    trades: [
      { id: 'depanneur', label: 'Dépanneur' },
      { id: 'serrurier', label: 'Serrurier' },
      { id: 'reparateur_electromenager', label: 'Réparateur électroménager' },
      { id: 'reparateur_informatique', label: 'Réparateur informatique' },
      { id: 'reparateur_smartphone', label: 'Réparateur smartphone' },
      { id: 'horloger_reparateur', label: 'Horloger réparateur' },
    ],
  },
  {
    id: 'mobilite',
    label: 'Mobilité',
    trades: [
      { id: 'garagiste', label: 'Garagiste' },
      { id: 'mecanicien_auto', label: 'Mécanicien auto' },
      { id: 'carrossier', label: 'Carrossier' },
      { id: 'peintre_automobile', label: 'Peintre automobile' },
      { id: 'debosseleur', label: 'Débosseleur' },
      { id: 'controleur_technique', label: 'Contrôleur technique' },
      { id: 'reparateur_moto', label: 'Réparateur moto' },
      { id: 'reparateur_velo', label: 'Réparateur vélo' },
    ],
  },
  {
    id: 'alimentation',
    label: 'Alimentation',
    trades: [
      { id: 'traiteur', label: 'Traiteur' },
      { id: 'boulanger', label: 'Boulanger' },
      { id: 'patissier', label: 'Pâtissier' },
      { id: 'chocolatier', label: 'Chocolatier' },
      { id: 'boucher', label: 'Boucher' },
      { id: 'charcutier', label: 'Charcutier' },
      { id: 'poissonnier', label: 'Poissonnier' },
      { id: 'fromager', label: 'Fromager' },
      { id: 'brasseur', label: 'Brasseur' },
      { id: 'caviste', label: 'Caviste' },
      { id: 'pizzaolo', label: 'Pizzaïolo' },
    ],
  },
  {
    id: 'beaute',
    label: 'Beauté',
    trades: [
      { id: 'coiffeur', label: 'Coiffeur' },
      { id: 'masseur', label: 'Masseur' },
      { id: 'estheticienne', label: 'Esthéticienne' },
      { id: 'prothesiste_ongulaire', label: 'Prothésiste ongulaire' },
      { id: 'tatoueur', label: 'Tatoueur' },
      { id: 'perceur', label: 'Perceur' },
    ],
  },
  {
    id: 'mode',
    label: 'Mode',
    trades: [
      { id: 'couturier', label: 'Couturier' },
      { id: 'styliste', label: 'Styliste' },
      { id: 'cordonnier', label: 'Cordonnier' },
      { id: 'maroquinier', label: 'Maroquinier' },
      { id: 'bijoutier', label: 'Bijoutier' },
      { id: 'joaillier', label: 'Joaillier' },
      { id: 'horloger', label: 'Horloger' },
      { id: 'lunetier', label: 'Lunetier' },
    ],
  },
  {
    id: 'decoration',
    label: 'Décoration',
    trades: [
      { id: 'architecte_interieur', label: "Architecte d'intérieur" },
      { id: 'tapissier', label: 'Tapissier' },
      { id: 'ceramiste', label: 'Céramiste' },
      { id: 'potier', label: 'Potier' },
      { id: 'encadreur', label: 'Encadreur' },
      { id: 'mosaiste', label: 'Mosaïste' },
      { id: 'peintre_decorateur', label: 'Peintre décorateur' },
      { id: 'vitrailliste', label: 'Vitrailliste' },
    ],
  },
  {
    id: 'jardin',
    label: 'Jardin',
    trades: [
      { id: 'paysagiste', label: 'Paysagiste' },
      { id: 'jardinier', label: 'Jardinier' },
      { id: 'elagueur', label: 'Élagueur' },
      { id: 'fleuriste', label: 'Fleuriste' },
      { id: 'pisciniste', label: 'Pisciniste' },
    ],
  },
  {
    id: 'audiovisuel',
    label: 'Audiovisuel',
    trades: [{ id: 'photographe_artisan', label: 'Photographe artisan' }],
  },
] as const satisfies readonly TradeFamily[];

type TradeFamiliesConst = typeof TRADE_FAMILIES;

export type CraftsmanTrade =
  TradeFamiliesConst[number]['trades'][number]['id'];

const tradeLabelEntries = TRADE_FAMILIES.flatMap((family) =>
  family.trades.map((trade) => [trade.id, trade.label] as const),
);

export const TRADE_LABELS: Record<CraftsmanTrade, string> = Object.fromEntries(
  tradeLabelEntries,
) as Record<CraftsmanTrade, string>;

export const ALL_TRADES = [...new Set(tradeLabelEntries.map(([id]) => id))] as CraftsmanTrade[];
