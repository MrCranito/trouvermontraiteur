-- PrimeIcons class shown on category chips in the consumer app.

alter table public.categories
  add column if not exists icon text not null default 'pi pi-briefcase';

comment on column public.categories.icon is
  'PrimeIcons classes for the category chip, for example pi pi-camera.';

update public.categories as category
set icon = icons.icon
from (
  values
    ('Traiteur & Boissons', 'pi pi-apple'),
    ('Photo & Vidéo', 'pi pi-camera'),
    ('Musique & DJ', 'pi pi-headphones'),
    ('Animation', 'pi pi-face-smile'),
    ('Décoration & Fleurs', 'pi pi-palette'),
    ('Location & Mobilier', 'pi pi-table'),
    ('Organisation', 'pi pi-calendar'),
    ('Technique & Audiovisuel', 'pi pi-sliders-h'),
    ('Gâteau & Pâtisserie', 'pi pi-gift'),
    ('Beauté & Mode', 'pi pi-sparkles')
) as icons(label, icon)
where category.label = icons.label;
