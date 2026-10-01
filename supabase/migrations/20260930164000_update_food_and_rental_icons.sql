-- Traiteur uses the storefront icon. Location uses the warehouse icon
-- (PrimeIcons has no chair glyph).

update public.categories
set icon = case label
  when 'Traiteur & Boissons' then 'pi pi-shop'
  when 'Location & Mobilier' then 'pi pi-warehouse'
  else icon
end
where label in ('Traiteur & Boissons', 'Location & Mobilier');
