-- Florists, decorators, and balloon artists imported only as Traiteur
-- move to the matching Décoration & Fleurs subcategory.
-- Businesses that already have their own trade drop the extra Traiteur link,
-- unless the name itself is a caterer, bar, or food service.
-- Rêves en Fête stays in Organisation and also gets Décoration.

update public.craftsmans_sub_category as link
set sub_category_id = target.sub_category_id
from public.craftsmans as craftsman
join (
  select
    craftsman.id,
    case
      when craftsman.name ~* 'ballon' then ballons.sub_category_id
      when craftsman.name ~* 'fleur' then fleuriste.sub_category_id
      when craftsman.name ~* 'd[ée]cor' then decoration.sub_category_id
    end as sub_category_id
  from public.craftsmans as craftsman
  cross join public.sub_categories_translations as fleuriste
  cross join public.sub_categories_translations as decoration
  cross join public.sub_categories_translations as ballons
  cross join public.sub_categories_translations as traiteur
  where fleuriste.language_code = 'fr'
    and fleuriste.name = 'Fleuriste'
    and decoration.language_code = 'fr'
    and decoration.name = 'Décoration'
    and ballons.language_code = 'fr'
    and ballons.name = 'Ballons'
    and traiteur.language_code = 'fr'
    and traiteur.name = 'Traiteur'
    and craftsman.name ~* '(fleur|d[ée]cor|ballon)'
    and exists (
      select 1
      from public.craftsmans_sub_category as current_link
      where current_link.craftsman_id = craftsman.id
        and current_link.sub_category_id = traiteur.sub_category_id
    )
    and not exists (
      select 1
      from public.craftsmans_sub_category as other
      where other.craftsman_id = craftsman.id
        and other.sub_category_id <> traiteur.sub_category_id
    )
) as target on target.id = craftsman.id
where link.craftsman_id = craftsman.id
  and link.sub_category_id = (
    select sub_category_id
    from public.sub_categories_translations
    where language_code = 'fr'
      and name = 'Traiteur'
  )
  and target.sub_category_id is not null;

insert into public.craftsmans_sub_category (craftsman_id, sub_category_id)
select craftsman.id, decoration.sub_category_id
from public.craftsmans as craftsman
join public.sub_categories_translations as decoration
  on decoration.language_code = 'fr'
 and decoration.name = 'Décoration'
where craftsman.name = 'Rêves en Fête - Agence événementielle et décoration'
  and not exists (
    select 1
    from public.craftsmans_sub_category as link
    where link.craftsman_id = craftsman.id
      and link.sub_category_id = decoration.sub_category_id
  );

delete from public.craftsmans_sub_category as link
using public.craftsmans as craftsman,
  public.sub_categories_translations as traiteur
where link.craftsman_id = craftsman.id
  and traiteur.sub_category_id = link.sub_category_id
  and traiteur.language_code = 'fr'
  and traiteur.name = 'Traiteur'
  and craftsman.name !~* '\y(traiteur|food[[:space:]]?truck|chef|cuisine|buffet|cocktail|pizz|bar|boisson|restaurant|catering|brunch|repas|gastronom)\y'
  and exists (
    select 1
    from public.craftsmans_sub_category as other
    where other.craftsman_id = craftsman.id
      and other.sub_category_id <> traiteur.sub_category_id
  );
