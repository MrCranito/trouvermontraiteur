-- =============================================================================
-- Eventup — remplace le catalogue catégories / sous-catégories
-- Les identifiants en base sont des UUID. Les libellés viennent du catalogue événement.
-- =============================================================================

begin;

delete from public.craftsmans_sub_category;
delete from public.sub_categories_translations;
delete from public.categories_translations;
delete from public.sub_categories;
delete from public.categories;

with inserted_categories as (
  insert into public.categories (label, "order")
  values
    ('Traiteur & Boissons', 1),
    ('Photo & Vidéo', 2),
    ('Musique & DJ', 3),
    ('Animation', 4),
    ('Décoration & Fleurs', 5),
    ('Location & Mobilier', 6),
    ('Organisation', 7),
    ('Technique & Audiovisuel', 8),
    ('Gâteau & Pâtisserie', 9),
    ('Beauté & Mode', 10)
  returning id, label
)
insert into public.categories_translations (category_id, language_code, name)
select id, 'fr', label
from inserted_categories;

insert into public.sub_categories (label, "order", category_id)
select service.label, service.sort_order, category.id
from (
  values
    ('Traiteur & Boissons', 'Traiteur', 1),
    ('Traiteur & Boissons', 'Food truck', 2),
    ('Traiteur & Boissons', 'Buffet & cocktail', 3),
    ('Traiteur & Boissons', 'Chef à domicile', 4),
    ('Traiteur & Boissons', 'Bar & boissons', 5),
    ('Photo & Vidéo', 'Photographe', 1),
    ('Photo & Vidéo', 'Vidéaste', 2),
    ('Photo & Vidéo', 'Photobooth', 3),
    ('Musique & DJ', 'DJ', 1),
    ('Musique & DJ', 'Groupe de musique', 2),
    ('Musique & DJ', 'Musicien', 3),
    ('Musique & DJ', 'Chanteur', 4),
    ('Animation', 'Animateur', 1),
    ('Animation', 'Jeux & quiz', 2),
    ('Animation', 'Spectacles', 3),
    ('Animation', 'Magicien', 4),
    ('Animation', 'Activités', 5),
    ('Décoration & Fleurs', 'Décoration', 1),
    ('Décoration & Fleurs', 'Fleuriste', 2),
    ('Décoration & Fleurs', 'Ballons', 3),
    ('Décoration & Fleurs', 'Mise en scène', 4),
    ('Location & Mobilier', 'Tables & chaises', 1),
    ('Location & Mobilier', 'Mobilier', 2),
    ('Location & Mobilier', 'Vaisselle', 3),
    ('Location & Mobilier', 'Tentes & structures', 4),
    ('Location & Mobilier', 'Matériel événementiel', 5),
    ('Organisation', 'Organisation d''événement', 1),
    ('Organisation', 'Wedding planner', 2),
    ('Organisation', 'Event planner', 3),
    ('Organisation', 'Coordination', 4),
    ('Organisation', 'Personnel événementiel', 5),
    ('Technique & Audiovisuel', 'Sonorisation', 1),
    ('Technique & Audiovisuel', 'Éclairage', 2),
    ('Technique & Audiovisuel', 'Écrans & vidéo', 3),
    ('Technique & Audiovisuel', 'Scène', 4),
    ('Gâteau & Pâtisserie', 'Gâteau événementiel', 1),
    ('Gâteau & Pâtisserie', 'Wedding cake', 2),
    ('Gâteau & Pâtisserie', 'Pièce montée', 3),
    ('Gâteau & Pâtisserie', 'Pâtisserie personnalisée', 4),
    ('Beauté & Mode', 'Coiffeur', 1),
    ('Beauté & Mode', 'Maquilleur', 2),
    ('Beauté & Mode', 'Tenues', 3),
    ('Beauté & Mode', 'Accessoires', 4)
) as service(category_label, label, sort_order)
join public.categories as category on category.label = service.category_label;

insert into public.sub_categories_translations (sub_category_id, language_code, name)
select id, 'fr', label
from public.sub_categories;

commit;
