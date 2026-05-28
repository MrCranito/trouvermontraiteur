-- =============================================================================
-- TMT — Catégories et sous-catégories artisans
-- Aligné sur libs/shared/models/src/lib/trade-families.ts (TRADE_FAMILIES)
-- À exécuter dans l'éditeur SQL Supabase ou via `supabase db push`
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Tables
-- -----------------------------------------------------------------------------

create table if not exists public.categories (
  id text primary key,
  label text not null,
  display_order integer not null default 0,
  created_at timestamptz not null default now()
);

comment on table public.categories is
  'Familles de métiers (ex. Bâtiments, Alimentation).';

create table if not exists public.sub_categories (
  category_id text not null references public.categories (id) on delete cascade,
  id text not null,
  label text not null,
  display_order integer not null default 0,
  created_at timestamptz not null default now(),
  primary key (category_id, id)
);

comment on table public.sub_categories is
  'Métiers / sous-catégories rattachés à une famille. Même id peut exister dans plusieurs familles (ex. serrurier).';

create index if not exists sub_categories_id_idx on public.sub_categories (id);

-- -----------------------------------------------------------------------------
-- Données — catégories (familles)
-- -----------------------------------------------------------------------------

insert into public.categories (id, label, display_order) values
  ('batiments', 'Bâtiments', 1),
  ('reparation', 'Réparation', 2),
  ('mobilite', 'Mobilité', 3),
  ('alimentation', 'Alimentation', 4),
  ('beaute', 'Beauté', 5),
  ('mode', 'Mode', 6),
  ('decoration', 'Décoration', 7),
  ('jardin', 'Jardin', 8),
  ('audiovisuel', 'Audiovisuel', 9)
on conflict (id) do update set
  label = excluded.label,
  display_order = excluded.display_order;

-- -----------------------------------------------------------------------------
-- Données — sous-catégories (métiers)
-- -----------------------------------------------------------------------------

insert into public.sub_categories (category_id, id, label, display_order) values
  -- Bâtiments
  ('batiments', 'macon', 'Maçon', 1),
  ('batiments', 'electricien', 'Électricien', 2),
  ('batiments', 'plombier', 'Plombier', 3),
  ('batiments', 'chauffagiste', 'Chauffagiste', 4),
  ('batiments', 'frigoriste', 'Frigoriste', 5),
  ('batiments', 'climaticien', 'Climaticien', 6),
  ('batiments', 'couvreur', 'Couvreur', 7),
  ('batiments', 'zingueur', 'Zingueur', 8),
  ('batiments', 'charpentier', 'Charpentier', 9),
  ('batiments', 'menuisier', 'Menuisier', 10),
  ('batiments', 'serrurier', 'Serrurier', 11),
  ('batiments', 'metallier', 'Métallier', 12),
  ('batiments', 'ferronnier', 'Ferronnier', 13),
  ('batiments', 'carreleur', 'Carreleur', 14),
  ('batiments', 'peintre_batiment', 'Peintre en bâtiment', 15),
  ('batiments', 'plaquiste', 'Plaquiste', 16),
  ('batiments', 'facadier', 'Façadier', 17),
  ('batiments', 'vitrier', 'Vitrier', 18),
  ('batiments', 'miroitier', 'Miroitier', 19),
  ('batiments', 'tailleur_pierre', 'Tailleur de pierre', 20),
  ('batiments', 'marbrier', 'Marbrier', 21),
  ('batiments', 'etancheur', 'Étancheur', 22),
  ('batiments', 'pisciniste', 'Pisciniste', 23),
  ('batiments', 'installateur_sanitaire', 'Installateur sanitaire', 24),
  ('batiments', 'installateur_photovoltaique', 'Installateur photovoltaïque', 25),
  ('batiments', 'domoticien', 'Domoticien', 26),
  -- Réparation
  ('reparation', 'depanneur', 'Dépanneur', 1),
  ('reparation', 'serrurier', 'Serrurier', 2),
  ('reparation', 'reparateur_electromenager', 'Réparateur électroménager', 3),
  ('reparation', 'reparateur_informatique', 'Réparateur informatique', 4),
  ('reparation', 'reparateur_smartphone', 'Réparateur smartphone', 5),
  ('reparation', 'horloger_reparateur', 'Horloger réparateur', 6),
  -- Mobilité
  ('mobilite', 'garagiste', 'Garagiste', 1),
  ('mobilite', 'mecanicien_auto', 'Mécanicien auto', 2),
  ('mobilite', 'carrossier', 'Carrossier', 3),
  ('mobilite', 'peintre_automobile', 'Peintre automobile', 4),
  ('mobilite', 'debosseleur', 'Débosseleur', 5),
  ('mobilite', 'controleur_technique', 'Contrôleur technique', 6),
  ('mobilite', 'reparateur_moto', 'Réparateur moto', 7),
  ('mobilite', 'reparateur_velo', 'Réparateur vélo', 8),
  -- Alimentation
  ('alimentation', 'traiteur', 'Traiteur', 1),
  ('alimentation', 'boulanger', 'Boulanger', 2),
  ('alimentation', 'patissier', 'Pâtissier', 3),
  ('alimentation', 'chocolatier', 'Chocolatier', 4),
  ('alimentation', 'boucher', 'Boucher', 5),
  ('alimentation', 'charcutier', 'Charcutier', 6),
  ('alimentation', 'poissonnier', 'Poissonnier', 7),
  ('alimentation', 'fromager', 'Fromager', 8),
  ('alimentation', 'brasseur', 'Brasseur', 9),
  ('alimentation', 'caviste', 'Caviste', 10),
  ('alimentation', 'pizzaolo', 'Pizzaïolo', 11),
  -- Beauté
  ('beaute', 'coiffeur', 'Coiffeur', 1),
  ('beaute', 'masseur', 'Masseur', 2),
  ('beaute', 'estheticienne', 'Esthéticienne', 3),
  ('beaute', 'prothesiste_ongulaire', 'Prothésiste ongulaire', 4),
  ('beaute', 'tatoueur', 'Tatoueur', 5),
  ('beaute', 'perceur', 'Perceur', 6),
  -- Mode
  ('mode', 'couturier', 'Couturier', 1),
  ('mode', 'styliste', 'Styliste', 2),
  ('mode', 'cordonnier', 'Cordonnier', 3),
  ('mode', 'maroquinier', 'Maroquinier', 4),
  ('mode', 'bijoutier', 'Bijoutier', 5),
  ('mode', 'joaillier', 'Joaillier', 6),
  ('mode', 'horloger', 'Horloger', 7),
  ('mode', 'lunetier', 'Lunetier', 8),
  -- Décoration
  ('decoration', 'architecte_interieur', 'Architecte d''intérieur', 1),
  ('decoration', 'tapissier', 'Tapissier', 2),
  ('decoration', 'ceramiste', 'Céramiste', 3),
  ('decoration', 'potier', 'Potier', 4),
  ('decoration', 'encadreur', 'Encadreur', 5),
  ('decoration', 'mosaiste', 'Mosaïste', 6),
  ('decoration', 'peintre_decorateur', 'Peintre décorateur', 7),
  ('decoration', 'vitrailliste', 'Vitrailliste', 8),
  -- Jardin
  ('jardin', 'paysagiste', 'Paysagiste', 1),
  ('jardin', 'jardinier', 'Jardinier', 2),
  ('jardin', 'elagueur', 'Élagueur', 3),
  ('jardin', 'fleuriste', 'Fleuriste', 4),
  ('jardin', 'pisciniste', 'Pisciniste', 5),
  -- Audiovisuel
  ('audiovisuel', 'photographe_artisan', 'Photographe artisan', 1)
on conflict (category_id, id) do update set
  label = excluded.label,
  display_order = excluded.display_order;

-- -----------------------------------------------------------------------------
-- RLS : lecture publique (données de référence)
-- -----------------------------------------------------------------------------

alter table public.categories enable row level security;
alter table public.sub_categories enable row level security;

drop policy if exists categories_select_all on public.categories;
create policy categories_select_all on public.categories
  for select
  using (true);

drop policy if exists sub_categories_select_all on public.sub_categories;
create policy sub_categories_select_all on public.sub_categories
  for select
  using (true);

-- -----------------------------------------------------------------------------
-- Vue pratique : liste à plat (famille + métier)
-- -----------------------------------------------------------------------------

create or replace view public.craftsman_category_tree as
select
  c.id as category_id,
  c.label as category_label,
  c.display_order as category_order,
  sc.id as sub_category_id,
  sc.label as sub_category_label,
  sc.display_order as sub_category_order
from public.categories c
join public.sub_categories sc on sc.category_id = c.id
order by c.display_order, sc.display_order;

comment on view public.craftsman_category_tree is
  'Arbre catégories / sous-catégories pour filtres UI et API.';
