-- Seed traiteurs Toulouse collected from Google Places.
-- Catalog listings have no pro owner. google_place_id keeps the import idempotent.

alter table public.craftsmans
  add column if not exists latitude double precision,
  add column if not exists longitude double precision,
  add column if not exists google_place_id text;

alter table public.craftsmans
  alter column owner_user_pro_id drop not null;

create unique index if not exists craftsmans_google_place_id_uidx
  on public.craftsmans (google_place_id)
  where google_place_id is not null;

insert into public.craftsmans (
  name,
  description,
  published,
  latitude,
  longitude,
  address,
  city,
  postal_code,
  google_place_id
)
select
  v.name,
  v.description,
  v.published::boolean,
  v.latitude::double precision,
  v.longitude::double precision,
  v.address,
  v.city,
  v.postal_code,
  v.google_place_id
from (
  values
  ($t0n$A La Toque$t0n$, $t0d$Traiteur à Toulouse.
Téléphone : 05 61 30 04 15
Site web : https://alatoque.com/
Note Google : 4.7/5 (45 avis)
Google Maps : https://maps.google.com/?cid=1630970460137523226&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t0d$, true, 43.613315, 1.4084075, $t0a$6 Rue Miramar$t0a$, $t0c$Toulouse$t0c$, $t0p$31200$t0p$, $t0g$ChIJNft-PyG7rhIRGginA_5eohY$t0g$),
  ($t1n$AU ROYAUME DE SHAIRAZAD$t1n$, $t1d$Traiteur à Toulouse.
Téléphone : 06 20 08 71 02
Site web : https://au-royaume-de-shairazad.eatbu.com/?lang=fr
Note Google : 4.5/5 (136 avis)
Google Maps : https://maps.google.com/?cid=11394641563898056809&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t1d$, true, 43.5373497, 1.403807, $t1a$32 Av. des Palanques$t1a$, $t1c$Portet-sur-Garonne$t1c$, $t1p$31120$t1p$, $t1g$ChIJN4talpm5rhIRaZALhyHmIZ4$t1g$),
  ($t2n$Air Saucisse. Sympathique Artisan Boucher charcutier traiteur$t2n$, $t2d$Traiteur à Toulouse.
Téléphone : 06 76 33 69 01
Note Google : 5/5 (17 avis)
Google Maps : https://maps.google.com/?cid=615001078542399264&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t2d$, true, 43.6000448, 1.4453080999999999, $t2a$16 Rue des Tourneurs$t2a$, $t2c$Toulouse$t2c$, $t2p$31000$t2p$, $t2g$ChIJj_xW7tO9rhIRIHcA9zjsiAg$t2g$),
  ($t3n$Antoine des Carmes traiteur$t3n$, $t3d$Traiteur à Toulouse.
Google Maps : https://maps.google.com/?cid=7667631557124103171&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t3d$, true, 43.597808099999995, 1.4451771999999998, $t3a$Marché, 2 Pl. des Carmes$t3a$, $t3c$Toulouse$t3c$, $t3p$31000$t3p$, $t3g$ChIJ53FBEwC9rhIRAxz1vkbmaGo$t3g$),
  ($t4n$Aperitiu$t4n$, $t4d$Traiteur à Toulouse.
Téléphone : 05 61 20 90 10
Site web : https://www.aperitiu-toulouse.fr/
Note Google : 5/5 (19 avis)
Google Maps : https://maps.google.com/?cid=15152301126925074560&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t4d$, true, 43.5847628, 1.4674515, $t4a$92 Av. Antoine de Saint-Exupéry$t4a$, $t4c$Toulouse$t4c$, $t4p$31400$t4p$, $t4g$ChIJFxYEF369rhIRgMAeOJjJR9I$t4g$),
  ($t5n$Artisan Traiteur Toulouse$t5n$, $t5d$Traiteur à Toulouse.
Téléphone : 06 60 52 06 48
Site web : https://www.artisan-traiteur-toulouse.com/
Note Google : 4.7/5 (144 avis)
Google Maps : https://maps.google.com/?cid=4098027804351548142&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t5d$, true, 43.6096353, 1.4516381, $t5a$Rue Bertrand de Born$t5a$, $t5c$Toulouse$t5c$, $t5p$31000$t5p$, $t5g$ChIJoQuQ5Ze8rhIR7koMZpMe3zg$t5g$),
  ($t6n$Atelier Camus - Faire-part - Decoration Mariage - Wedding Designer$t6n$, $t6d$Traiteur à Toulouse.
Téléphone : 06 43 61 22 89
Site web : https://www.atelier-camus.com/
Note Google : 4.9/5 (119 avis)
Google Maps : https://maps.google.com/?cid=17487502430677092984&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t6d$, true, 43.5953476, 1.4196346, $t6a$52 Bd Gabriel Koenigs$t6a$, $t6c$Toulouse$t6c$, $t6p$31300$t6p$, $t6g$ChIJ9c-6AAy7rhIReMpJ1c4WsPI$t6g$),
  ($t7n$Atelier Pergo$t7n$, $t7d$Traiteur à Toulouse.
Téléphone : 05 36 09 14 57
Site web : http://atelierpergo.fr/
Note Google : 5/5 (2 avis)
Google Maps : https://maps.google.com/?cid=18085068903722500159&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t7d$, true, 43.642488199999995, 1.4288484, $t7a$Marché Gare (M.I.N, 200 Av. des États-Unis$t7a$, $t7c$Toulouse$t7c$, $t7p$31200$t7p$, $t7g$ChIJ7xrXxvelrhIRP8DXYFkS-_o$t7g$),
  ($t8n$Bicoq' Traiteur$t8n$, $t8d$Traiteur à Toulouse.
Note Google : 4.8/5 (48 avis)
Google Maps : https://maps.google.com/?cid=1262547276164534034&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t8d$, true, 43.6365677, 1.4946975999999998, $t8a$33 Rte de Lavaur$t8a$, $t8c$L'Union$t8c$, $t8p$31240$t8p$, $t8g$ChIJv0vFbc-irhIREo_s8w54hRE$t8g$),
  ($t9n$Bimbiz Food$t9n$, $t9d$Traiteur à Toulouse.
Téléphone : 06 11 57 24 77
Site web : https://www.bimbiz-food.com/
Note Google : 4.9/5 (278 avis)
Google Maps : https://maps.google.com/?cid=8445339914862053047&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t9d$, true, 43.604442, 1.4439161999999999, $t9a$Pl. du Capitole$t9a$, $t9c$Toulouse$t9c$, $t9p$31000$t9p$, $t9g$ChIJoTqrX129rhIRt8bHQOjfM3U$t9g$),
  ($t10n$Boucherie Bocaria$t10n$, $t10d$Traiteur à Toulouse.
Téléphone : 05 34 59 31 37
Site web : https://www.instagram.com/boucheriebocaria?igsh=MXFqczcyb3FhZDl0eg==&utm_source=qr
Note Google : 4.9/5 (27 avis)
Google Maps : https://maps.google.com/?cid=16855075526533311416&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t10d$, true, 43.592096, 1.4339302999999999, $t10a$271 Av. de Muret$t10a$, $t10c$Toulouse$t10c$, $t10p$31300$t10p$, $t10g$ChIJ4RI9zkO7rhIRuOtlreNB6ek$t10g$),
  ($t11n$C&N Traiteur$t11n$, $t11d$Traiteur à Toulouse.
Téléphone : 05 61 37 10 10
Site web : https://cetntraiteur.fr/
Note Google : 4.6/5 (189 avis)
Google Maps : https://maps.google.com/?cid=18389353145338588306&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t11d$, true, 43.6661316, 1.4189041999999998, $t11a$4 Imp. Raymond Loewy$t11a$, $t11c$Aucamville$t11c$, $t11p$31140$t11p$, $t11g$ChIJ_VMbFvakrhIRkmweNUEbNP8$t11g$),
  ($t12n$COOKING4U$t12n$, $t12d$Traiteur à Toulouse.
Téléphone : 05 61 09 81 09
Site web : https://www.cooking4u.fr/
Note Google : 4.8/5 (130 avis)
Google Maps : https://maps.google.com/?cid=17723378527542306191&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t12d$, true, 43.663368999999996, 1.5367559, $t12a$3 Chem. de Tartaloche$t12a$, $t12c$Rouffiac-Tolosan$t12c$, $t12p$31180$t12p$, $t12g$ChIJr6lNONuVrhIRj-XxSd4W9vU$t12g$),
  ($t13n$CROUSTY ONE TOULOUSE$t13n$, $t13d$Traiteur à Toulouse.
Téléphone : 05 62 27 63 06
Site web : https://croustyone.com/
Note Google : 4.8/5 (143 avis)
Google Maps : https://maps.google.com/?cid=3229383007069197047&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t13d$, true, 43.6077265, 1.4469904, $t13a$28 Bd de Strasbourg$t13a$, $t13c$Toulouse$t13c$, $t13p$31000$t13p$, $t13g$ChIJM1D_iQy9rhIR99IKJLwS0Sw$t13g$),
  ($t14n$Carrefour Traiteur$t14n$, $t14d$Traiteur à Toulouse.
Téléphone : 05 61 28 56 60
Site web : https://traiteur.carrefour.fr/
Note Google : 5/5 (1 avis)
Google Maps : https://maps.google.com/?cid=2568984237469737048&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t14d$, true, 43.6268131, 1.4330557, $t14a$83 Bd Silvio Trentin$t14a$, $t14c$Toulouse$t14c$, $t14p$31200$t14p$, $t14g$ChIJsQiwsn67rhIRWCD2i43dpiM$t14g$),
  ($t15n$Casa D'Italia$t15n$, $t15d$Traiteur à Toulouse.
Téléphone : 05 61 25 44 64
Site web : https://casaditalia.fr/
Note Google : 4.3/5 (524 avis)
Google Maps : https://maps.google.com/?cid=12040769385857333542&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t15d$, true, 43.5980863, 1.4449986, $t15a$21 Pl. des Carmes$t15a$, $t15c$Toulouse$t15c$, $t15p$31000$t15p$, $t15g$ChIJNV4i7IK8rhIRJrlsMvZnGac$t15g$),
  ($t16n$CheersByLuc$t16n$, $t16d$Traiteur à Toulouse.
Téléphone : 06 49 38 09 33
Site web : https://sites.google.com/view/cheersbyluc/accueil
Note Google : 5/5 (7 avis)
Google Maps : https://maps.google.com/?cid=3157811378729423849&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t16d$, true, 43.599905799999995, 1.4452885, $t16a$12 Rue des Tourneurs$t16a$, $t16c$Toulouse$t16c$, $t16p$31000$t16p$, $t16g$ChIJMdS4qP-9rhIR6ZPa2LfM0is$t16g$),
  ($t17n$Chez ROM'S - AROMATIC Traiteur$t17n$, $t17d$Traiteur à Toulouse.
Téléphone : 06 98 37 25 38
Site web : https://aromatic-traiteur-restaurant.fr/
Note Google : 4.7/5 (197 avis)
Google Maps : https://maps.google.com/?cid=10742310961548823563&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t17d$, true, 43.585975499999996, 1.5298336, $t17a$Av. du Parc$t17a$, $t17c$Quint-Fonsegrives$t17c$, $t17p$31130$t17p$, $t17g$ChIJUWpjcS2WrhIRCwzngedaFJU$t17g$),
  ($t18n$Chez Salomé$t18n$, $t18d$Traiteur à Toulouse.
Téléphone : 06 86 23 58 86
Note Google : 3/5 (34 avis)
Google Maps : https://maps.google.com/?cid=18148468543533097939&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t18d$, true, 43.597662799999995, 1.4447732, $t18a$1 Pl. des Carmes$t18a$, $t18c$Toulouse$t18c$, $t18p$31000$t18p$, $t18g$ChIJHV9r3KG9rhIR0yOkUvxP3Ps$t18g$),
  ($t19n$Dawliz$t19n$, $t19d$Traiteur à Toulouse.
Téléphone : 06 41 05 29 86
Site web : http://dawliztoulouse.com/
Note Google : 3.9/5 (159 avis)
Google Maps : https://maps.google.com/?cid=12798513715258390312&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t19d$, true, 43.54449460000001, 1.3980731000000002, $t19a$5 bis Rue des Frères Boudé$t19a$, $t19c$Toulouse$t19c$, $t19p$31100$t19p$, $t19g$ChIJh5lx_IS5rhIRKPfwImp0nbE$t19g$),
  ($t20n$Delices de l'Inde$t20n$, $t20d$Traiteur à Toulouse.
Téléphone : 06 63 36 53 22
Note Google : 5/5 (1 avis)
Google Maps : https://maps.google.com/?cid=8551404388183844584&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t20d$, true, 43.60657940000001, 1.4469855999999999, $t20a$Pl. Victor Hugo Loge 220.221.1/2$t20a$, $t20c$Toulouse$t20c$, $t20p$31000$t20p$, $t20g$ChIJrbD5zZC9rhIR6CZq2PuwrHY$t20g$),
  ($t21n$Demoulin Traiteur$t21n$, $t21d$Traiteur à Toulouse.
Téléphone : 05 34 56 19 80
Site web : http://www.demoulin-traiteur.com/
Note Google : 4.8/5 (40 avis)
Google Maps : https://maps.google.com/?cid=2266622508561419211&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t21d$, true, 43.607555500000004, 1.3565923, $t21a$8 Rue Marius Tercé$t21a$, $t21c$Toulouse$t21c$, $t21p$31300$t21p$, $t21g$ChIJRXz6f3KwrhIRy0u1limpdB8$t21g$),
  ($t22n$Dielthy$t22n$, $t22d$Traiteur à Toulouse.
Téléphone : 06 37 84 59 64
Site web : http://dielthy.com/
Note Google : 5/5 (87 avis)
Google Maps : https://maps.google.com/?cid=15213345401490673471&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t22d$, true, 43.604641699999995, 1.4506621, $t22a$5 Imp. Colombette$t22a$, $t22c$Toulouse$t22c$, $t22p$31000$t22p$, $t22g$ChIJ-7S4SE-9rhIRP48s9QmpINM$t22g$),
  ($t23n$El Rey de la Paëlla$t23n$, $t23d$Traiteur à Toulouse.
Téléphone : 06 76 04 94 22
Site web : https://www.elreydelapaella.fr/
Note Google : 4.8/5 (80 avis)
Google Maps : https://maps.google.com/?cid=16405581436020387686&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t23d$, true, 43.6499768, 1.4398914999999999, $t23a$16 Imp. du Clos de Rispet$t23a$, $t23c$Toulouse$t23c$, $t23p$31200$t23p$, $t23g$ChIJqUGYH5-krhIRZu-8Q2VVrOM$t23g$),
  ($t24n$Esprit Traiteur$t24n$, $t24d$Traiteur à Toulouse.
Téléphone : 05 61 30 43 00
Site web : http://esprit-traiteur.com/
Note Google : 4.6/5 (76 avis)
Google Maps : https://maps.google.com/?cid=15477537418547873106&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t24d$, true, 43.5945447, 1.3118538, $t24a$12 Imp. Denis Papin$t24a$, $t24c$Tournefeuille$t24c$, $t24p$31170$t24p$, $t24g$ChIJZceyG6GxrhIRUsVcVkdCy9Y$t24g$),
  ($t25n$Event Ewa Wedding Planner$t25n$, $t25d$Traiteur à Toulouse.
Téléphone : 06 41 47 45 75
Site web : http://www.eventewa.com/
Note Google : 5/5 (109 avis)
Google Maps : https://maps.google.com/?cid=4750811451348019079&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t25d$, true, 43.6157666, 1.4496412, $t25a$27 Rue des Jumeaux$t25a$, $t25c$Toulouse$t25c$, $t25p$31200$t25p$, $t25g$ChIJARkbhmCjrhIRh-d0GNhF7kE$t25g$),
  ($t26n$FLORIDA TRAITEUR$t26n$, $t26d$Traiteur à Toulouse.
Téléphone : 07 88 91 38 03
Site web : https://www.instagram.com/lefloridatraiteur/?hl=fr&utm_source=gmb
Note Google : 4.4/5 (22 avis)
Google Maps : https://maps.google.com/?cid=14708396258809237305&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t26d$, true, 43.6043993, 1.4427572, $t26a$12 Pl. du Capitole$t26a$, $t26c$Toulouse$t26c$, $t26p$31000$t26p$, $t26g$ChIJaR8BEVm7rhIROU8CDni4Hsw$t26g$),
  ($t27n$Faim de saveurs$t27n$, $t27d$Traiteur à Toulouse.
Téléphone : 07 69 99 76 62
Site web : https://www.faimdesaveurs.fr/
Note Google : 4.7/5 (43 avis)
Google Maps : https://maps.google.com/?cid=3543096072859320567&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t27d$, true, 43.5950029, 1.4438749000000002, $t27a$21 Pl. du Salin$t27a$, $t27c$Toulouse$t27c$, $t27p$31000$t27p$, $t27g$ChIJkc2n-hq9rhIR94DcKxubKzE$t27g$),
  ($t28n$Falcou Traiteur - Evènement Professionnel & Mariage - Toulouse$t28n$, $t28d$Traiteur à Toulouse.
Téléphone : 05 62 89 04 70
Site web : https://www.falcou.fr/
Note Google : 4.6/5 (59 avis)
Google Maps : https://maps.google.com/?cid=11796752572711946553&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t28d$, true, 43.652460999999995, 1.521776, $t28a$15 Rue du Casse$t28a$, $t28c$Saint-Jean$t28c$, $t28p$31240$t28p$, $t28g$ChIJaSf5A3aYrhIROcmrh_Z7tqM$t28g$),
  ($t29n$Fannette Traiteur- Cuisine nomade & Engagée - Yoga$t29n$, $t29d$Traiteur à Toulouse.
Site web : https://www.fannettecuisineetyoga.com/
Note Google : 4.8/5 (80 avis)
Google Maps : https://maps.google.com/?cid=4669682449190347292&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t29d$, true, 43.5971885, 1.4300963, $t29a$42 Rue Varsovie$t29a$, $t29c$Toulouse$t29c$, $t29p$31100$t29p$, $t29g$ChIJk6uiT6y7rhIRHOLdTXILzkA$t29g$),
  ($t30n$GALINETTE -Restaurant- Rôtisserie à Toulouse -Caviste-Traiteur-Concept Store -$t30n$, $t30d$Traiteur à Toulouse.
Téléphone : 05 61 27 64 55
Site web : https://www.galinette-rotisserie.fr/
Note Google : 4.7/5 (187 avis)
Google Maps : https://maps.google.com/?cid=9285852094811186908&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t30d$, true, 43.6006329, 1.4682791, $t30a$4 Av. de Castres$t30a$, $t30c$Toulouse$t30c$, $t30p$31500$t30p$, $t30g$ChIJP8kjz1q9rhIR3KYJHEj53YA$t30g$),
  ($t31n$Gusto’Art - Food Truck - Traiteur$t31n$, $t31d$Traiteur à Toulouse.
Téléphone : 07 77 76 80 14
Site web : https://gustoart.fr/
Note Google : 5/5 (47 avis)
Google Maps : https://maps.google.com/?cid=16789556940791133150&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t31d$, true, 43.6045898, 1.4442198, $t31a$$t31a$, $t31c$Toulouse$t31c$, $t31p$31000$t31p$, $t31g$ChIJScW8KZe7rhIR3rMMMBV9AOk$t31g$),
  ($t32n$HT'Bon$t32n$, $t32d$Traiteur à Toulouse.
Téléphone : 06 45 96 09 51
Site web : https://www.htbon31.fr/
Note Google : 5/5 (102 avis)
Google Maps : https://maps.google.com/?cid=10481518482023336263&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t32d$, true, 43.6060618, 1.3697884, $t32a$9 bis Rue Alain Fournier$t32a$, $t32c$Toulouse$t32c$, $t32p$31300$t32p$, $t32g$ChIJe30w-m2lrhIRR0mxo4bVdZE$t32g$),
  ($t33n$Holocene Traiteur$t33n$, $t33d$Traiteur à Toulouse.
Téléphone : 05 32 74 08 33
Site web : https://www.holocene-restaurant.fr/traiteur/
Note Google : 4.9/5 (192 avis)
Google Maps : https://maps.google.com/?cid=7464596972020631004&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t33d$, true, 43.627347199999996, 1.4878869000000001, $t33a$16 Rue Louis Renault$t33a$, $t33c$Balma$t33c$, $t33p$31130$t33p$, $t33g$ChIJucX4qgy7rhIR3AW_nGWTl2c$t33g$),
  ($t34n$Horace Events$t34n$, $t34d$Traiteur à Toulouse.
Téléphone : 05 61 50 26 40
Site web : http://horaceevents.fr/
Note Google : 5/5 (52 avis)
Google Maps : https://maps.google.com/?cid=10668644223232357031&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t34d$, true, 43.647507499999996, 1.4627664999999999, $t34a$39 Chem. Virebent$t34a$, $t34c$Toulouse$t34c$, $t34p$31200$t34p$, $t34g$ChIJh_ySblRdgGwRp7LJaGWjDpQ$t34g$),
  ($t35n$Huma Cuisine$t35n$, $t35d$Traiteur à Toulouse.
Téléphone : 06 66 27 46 49
Site web : https://huma-cuisine.fr/
Note Google : 5/5 (21 avis)
Google Maps : https://maps.google.com/?cid=15051088869128310622&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t35d$, true, 43.608768399999995, 1.4468187, $t35a$2 Rue des Moutons$t35a$, $t35c$Toulouse$t35c$, $t35p$31000$t35p$, $t35g$ChIJS0hw1ay9rhIRXo86F5U14NA$t35g$),
  ($t36n$L' Atelier Des Gourmandises$t36n$, $t36d$Traiteur à Toulouse.
Téléphone : 06 88 29 01 24
Site web : https://latelierdesgourmandises.com/
Note Google : 5/5 (174 avis)
Google Maps : https://maps.google.com/?cid=13666647936404457841&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t36d$, true, 43.6308587, 1.4486735, $t36a$14 Rue de la Marquise de Sévigné$t36a$, $t36c$Toulouse$t36c$, $t36p$31200$t36p$, $t36g$ChIJH0W0Bx6jrhIRcYm2n-Ovqb0$t36g$),
  ($t37n$L'Ateliette Traiteur$t37n$, $t37d$Traiteur à Toulouse.
Téléphone : 07 67 70 12 12
Site web : http://lateliette.fr/
Note Google : 4.8/5 (112 avis)
Google Maps : https://maps.google.com/?cid=10434325023377499527&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t37d$, true, 43.562743999999995, 1.5238622, $t37a$3 Bd du libre Échange$t37a$, $t37c$Saint-Orens-de-Gameville$t37c$, $t37p$31650$t37p$, $t37g$ChIJRdKouty9rhIRh6ViSVMrzpA$t37g$),
  ($t38n$LA BEL'UNION TRAITEUR$t38n$, $t38d$Traiteur à Toulouse.
Téléphone : 05 61 82 58 97
Site web : https://www.labelunion31.fr/
Note Google : 4.8/5 (107 avis)
Google Maps : https://maps.google.com/?cid=2380665301037654310&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t38d$, true, 43.6981828, 1.5717090999999999, $t38a$26 Rue du Girou$t38a$, $t38c$Gragnague$t38c$, $t38p$31380$t38p$, $t38g$ChIJAyFUROWjrhIRJqFyXXrSCSE$t38g$),
  ($t39n$LES GOÛTS DIVINS BÉTHEL TRAITEUR MARIAGE$t39n$, $t39d$Traiteur à Toulouse.
Téléphone : 07 84 76 16 40
Site web : https://legoutdivinbethel.com/
Note Google : 5/5 (90 avis)
Google Maps : https://maps.google.com/?cid=7144595614613356937&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t39d$, true, 43.642883499999996, 1.4397457999999999, $t39a$21 Rue Raoul Dufy$t39a$, $t39c$Toulouse$t39c$, $t39p$31200$t39p$, $t39g$ChIJ4-BPqg6lrhIRicHXmNuzJmM$t39g$),
  ($t40n$LEY'LA le traiteur / foodtruck$t40n$, $t40d$Traiteur à Toulouse.
Téléphone : 06 58 17 55 71
Site web : http://www.leyla-traiteurpatissier.fr/
Note Google : 4.8/5 (19 avis)
Google Maps : https://maps.google.com/?cid=2030648299853041332&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t40d$, true, 43.63337490000001, 1.4676649, $t40a$52 Rue d'Avranches$t40a$, $t40c$Toulouse$t40c$, $t40p$31200$t40p$, $t40g$ChIJX23DNDqjrhIRtM59sN5PLhw$t40g$),
  ($t41n$La Bonne Franckette$t41n$, $t41d$Traiteur à Toulouse.
Téléphone : 06 41 19 68 19
Google Maps : https://maps.google.com/?cid=10394417906941246906&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t41d$, true, 43.6140331, 1.438049, $t41a$32 bis Av. Honoré Serres$t41a$, $t41c$Toulouse$t41c$, $t41p$31000$t41p$, $t41g$ChIJpaimJ1y7rhIRuj0xrgNkQJA$t41g$),
  ($t42n$La Brigade Traiteur$t42n$, $t42d$Traiteur à Toulouse.
Téléphone : 06 47 53 36 35
Site web : http://www.labrigadetraiteur.fr/
Note Google : 4.9/5 (151 avis)
Google Maps : https://maps.google.com/?cid=5934618548150477704&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t42d$, true, 43.642488199999995, 1.4288484, $t42a$200 Av. des États-Unis$t42a$, $t42c$Toulouse$t42c$, $t42p$31200$t42p$, $t42g$ChIJfRcL01GjrhIRiCP0ZyAAXFI$t42g$),
  ($t43n$La Cuisine du Chef - Jocelyn David$t43n$, $t43d$Traiteur à Toulouse.
Téléphone : 06 78 76 45 68
Site web : http://www.lacuisineduchef.fr/
Note Google : 5/5 (62 avis)
Google Maps : https://maps.google.com/?cid=8847439179669413112&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t43d$, true, 43.650770099999995, 1.4393342, $t43a$Rte de Launaguet$t43a$, $t43c$Toulouse$t43c$, $t43p$31200$t43p$, $t43g$ChIJC7awYGKlrhIR-JwR5A5ryHo$t43g$),
  ($t44n$La Faim des Haricots$t44n$, $t44d$Traiteur à Toulouse.
Téléphone : 05 61 22 49 25
Site web : http://www.lafaimdesharicots.fr/
Note Google : 4.5/5 (2427 avis)
Google Maps : https://maps.google.com/?cid=13206649089372452885&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t44d$, true, 43.6017912, 1.4438354999999998, $t44a$2b Rue du Puits Vert$t44a$, $t44c$Toulouse$t44c$, $t44p$31000$t44p$, $t44g$ChIJ--CgeZ28rhIRFfhH_V9xR7c$t44g$),
  ($t45n$La Mitonnee$t45n$, $t45d$Traiteur à Toulouse.
Téléphone : 05 61 53 94 97
Note Google : 5/5 (3 avis)
Google Maps : https://maps.google.com/?cid=4363133581904025856&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t45d$, true, 43.5973757, 1.4441821, $t45a$3 Pl. des Carmes$t45a$, $t45c$Toulouse$t45c$, $t45p$31000$t45p$, $t45g$ChIJ___zN_KirhIRAJn3OOD2jDw$t45g$),
  ($t46n$La Nonna Lina - Epicerie Fine Toulouse$t46n$, $t46d$Traiteur à Toulouse.
Téléphone : 05 34 44 61 97
Site web : https://lanonnalina.wixsite.com/website
Note Google : 4.7/5 (140 avis)
Google Maps : https://maps.google.com/?cid=10799331463886306478&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t46d$, true, 43.6060234, 1.4470233, $t46a$6 Rue Victor Hugo$t46a$, $t46c$Toulouse$t46c$, $t46p$31000$t46p$, $t46g$ChIJ3TSmcfO9rhIRrnykxL_u3pU$t46g$),
  ($t47n$La Ritonette$t47n$, $t47d$Traiteur à Toulouse.
Téléphone : 07 81 98 76 34
Note Google : 5/5 (8 avis)
Google Maps : https://maps.google.com/?cid=6470222149150271136&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t47d$, true, 43.603325299999995, 1.4080082999999999, $t47a$258 Av. de Grande Bretagne$t47a$, $t47c$Toulouse$t47c$, $t47p$31300$t47p$, $t47g$ChIJK1FK9Ky7rhIRoGb3kcPYylk$t47g$),
  ($t48n$La parmentiere$t48n$, $t48d$Traiteur à Toulouse.
Note Google : 3.9/5 (10 avis)
Google Maps : https://maps.google.com/?cid=13892825670124873880&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t48d$, true, 43.606516299999996, 1.446492, $t48a$Marche$t48a$, $t48c$Toulouse$t48c$, $t48p$31000$t48p$, $t48g$ChIJo3rNE8e9rhIRmKg48lY7zcA$t48g$),
  ($t49n$Labo des Sens - Traiteur - Toulouse$t49n$, $t49d$Traiteur à Toulouse.
Téléphone : 06 48 55 68 53
Site web : http://www.labo-des-sens.fr/
Note Google : 5/5 (108 avis)
Google Maps : https://maps.google.com/?cid=10817475372319043126&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t49d$, true, 43.6622486, 1.3037857, $t49a$2210 Rte de Toulouse$t49a$, $t49c$Mondonville$t49c$, $t49p$31700$t49p$, $t49g$ChIJO2CngmaurhIRNu6cpYlkH5Y$t49g$),
  ($t50n$Le GL Traiteur$t50n$, $t50d$Traiteur à Toulouse.
Téléphone : 07 66 88 63 29
Site web : http://www.legltraiteur.com/
Note Google : 4.8/5 (220 avis)
Google Maps : https://maps.google.com/?cid=1788042296774413104&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t50d$, true, 43.6202933, 1.2950186, $t50a$32 bis Chem. du Parc$t50a$, $t50c$Pibrac$t50c$, $t50p$31820$t50p$, $t50g$ChIJ_e5BCXGjrhIRMMuc1v5m0Bg$t50g$),
  ($t51n$Le Manoir du Prince$t51n$, $t51d$Traiteur à Toulouse.
Téléphone : 05 32 10 87 40
Site web : http://www.lemanoirduprince.fr/
Note Google : 4.6/5 (415 avis)
Google Maps : https://maps.google.com/?cid=8625308194446079841&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t51d$, true, 43.5378046, 1.3706558, $t51a$999 Rte de Seysses$t51a$, $t51c$Portet-sur-Garonne$t51c$, $t51p$31120$t51p$, $t51g$ChIJ4YjKmeW5rhIRYXc5oBpAs3c$t51g$),
  ($t52n$Le P'tit Gourmand$t52n$, $t52d$Traiteur à Toulouse.
Téléphone : 05 61 12 21 49
Note Google : 3.7/5 (54 avis)
Google Maps : https://maps.google.com/?cid=14371778892833552957&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t52d$, true, 43.610952399999995, 1.4374495999999999, $t52a$7 Bd Lascrosses$t52a$, $t52c$Toulouse$t52c$, $t52p$31000$t52p$, $t52g$ChIJn5jguF27rhIRPfrMEcLQcsc$t52g$),
  ($t53n$Le Panier d'Or Toulouse$t53n$, $t53d$Traiteur à Toulouse.
Téléphone : 06 48 17 08 39
Site web : http://www.lepanierdor.fr/
Note Google : 4.9/5 (293 avis)
Google Maps : https://maps.google.com/?cid=3467979707656077829&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t53d$, true, 43.60555, 1.4588891, $t53a$17 Av. de la Gloire$t53a$, $t53c$Toulouse$t53c$, $t53p$31500$t53p$, $t53g$ChIJ-YhxPpS8rhIRBYIagyu9IDA$t53g$),
  ($t54n$Le Restaugramme$t54n$, $t54d$Traiteur à Toulouse.
Téléphone : 07 68 24 08 77
Site web : http://www.lerestaugramme.fr/
Note Google : 4.7/5 (17 avis)
Google Maps : https://maps.google.com/?cid=11629077237570389632&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t54d$, true, 43.620182199999995, 1.4553821, $t54a$10 Rue de l'Espérance$t54a$, $t54c$Toulouse$t54c$, $t54p$31500$t54p$, $t54g$ChIJcVBbyEmlrhIRgMb2UiLIYqE$t54g$),
  ($t55n$Le Rôtisseur$t55n$, $t55d$Traiteur à Toulouse.
Téléphone : 05 36 47 13 52
Note Google : 4.4/5 (172 avis)
Google Maps : https://maps.google.com/?cid=4787650531973500753&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t55d$, true, 43.5987411, 1.455577, $t55a$10 Rue du Pont Montaudran$t55a$, $t55c$Toulouse$t55c$, $t55p$31000$t55p$, $t55g$ChIJlcQHM468rhIRUY_98somcUI$t55g$),
  ($t56n$Le Traiteur des Arenes$t56n$, $t56d$Traiteur à Toulouse.
Téléphone : 05 34 56 69 45
Site web : http://www.traiteurdesarenes.fr/
Note Google : 4.4/5 (12 avis)
Google Maps : https://maps.google.com/?cid=1478276649026015778&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t56d$, true, 43.5626089, 1.3725313, $t56a$48, bis Rte de Saint-Simon$t56a$, $t56c$Toulouse$t56c$, $t56p$31100$t56p$, $t56g$ChIJkawWBXS7rhIRIlLzsMfkgxQ$t56g$),
  ($t57n$Le plat qui plait - Traiteur tradition Toulouse Balma$t57n$, $t57d$Traiteur à Toulouse.
Téléphone : 06 62 26 44 58
Site web : https://www.leplatquiplait.com/
Note Google : 5/5 (78 avis)
Google Maps : https://maps.google.com/?cid=4649140104746183564&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t57d$, true, 43.597795999999995, 1.463956, $t57a$6 Rue André Cavagnol$t57a$, $t57c$Toulouse$t57c$, $t57p$31500$t57p$, $t57g$ChIJjXUEx9C9rhIRjCtrBksQhUA$t57g$),
  ($t58n$Les Saveurs d'Aubin (exclusivement en ligne)$t58n$, $t58d$Traiteur à Toulouse.
Téléphone : 07 60 04 25 92
Site web : http://www.les-saveursdaubin.com/
Note Google : 4.7/5 (161 avis)
Google Maps : https://maps.google.com/?cid=10792585548128469640&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t58d$, true, 43.5756504, 1.4732455, $t58a$4 Rue Valentina Terechkova$t58a$, $t58c$Toulouse$t58c$, $t58p$31400$t58p$, $t58g$ChIJBxf0Tk-8rhIRiEI23F_3xpU$t58g$),
  ($t59n$Les petits plats de Clémence$t59n$, $t59d$Traiteur à Toulouse.
Téléphone : 05 61 23 42 11
Site web : https://lespetitsplatsdeclemence.com/
Note Google : 4.6/5 (32 avis)
Google Maps : https://maps.google.com/?cid=9397484889916754017&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t59d$, true, 43.603293699999995, 1.4417995000000001, $t59a$25 Rue Léon Gambetta$t59a$, $t59c$Toulouse$t59c$, $t59p$31000$t59p$, $t59g$ChIJ0SiZP2K7rhIRYciWpbeSaoI$t59g$),
  ($t60n$Les romances de Marie$t60n$, $t60d$Traiteur à Toulouse.
Téléphone : 06 95 58 80 87
Site web : https://www.lesromancesdemarie.com/
Note Google : 4.9/5 (43 avis)
Google Maps : https://maps.google.com/?cid=11132913657492177013&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t60d$, true, 43.611019999999996, 1.447706, $t60a$18 Rue de l'Orient$t60a$, $t60c$Toulouse$t60c$, $t60p$31000$t60p$, $t60g$ChIJERdyerO9rhIRdYDqnfwNgJo$t60g$),
  ($t61n$Libelula - Votre traiteur végétal à Toulouse$t61n$, $t61d$Traiteur à Toulouse.
Téléphone : 07 82 52 44 74
Site web : http://www.libelula.fr/
Note Google : 4.8/5 (18 avis)
Google Maps : https://maps.google.com/?cid=4802479915980219330&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t61d$, true, 43.6074043, 1.4713741, $t61a$79 Av. de la Gloire$t61a$, $t61c$Toulouse$t61c$, $t61p$31500$t61p$, $t61g$ChIJVVWlNO66rhIRwuPy-AnWpUI$t61g$),
  ($t62n$Location Salle Toulouse - La péniche Saint-Louis$t62n$, $t62d$Traiteur à Toulouse.
Téléphone : 07 61 92 39 57
Site web : https://peniche-saint-louis.fr/
Note Google : 4.4/5 (121 avis)
Google Maps : https://maps.google.com/?cid=16771155122751893834&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t62d$, true, 43.594414799999996, 1.457247, $t62a$35 Bd Griffoul Dorval$t62a$, $t62c$Toulouse$t62c$, $t62p$31400$t62p$, $t62g$ChIJg6H1MGC8rhIRSnGZDLocv-g$t62g$),
  ($t63n$L’Orso italiano$t63n$, $t63d$Traiteur à Toulouse.
Téléphone : 06 46 00 63 86
Site web : http://www.lorsoitaliano.com/?utm_source=google&utm_medium=wix_google_business_profile&utm_campaign=11924943169294516073
Note Google : 4.4/5 (308 avis)
Google Maps : https://maps.google.com/?cid=4468453419062761477&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t63d$, true, 43.560590700000006, 1.50307, $t63a$54 Rte de Labège$t63a$, $t63c$Toulouse$t63c$, $t63p$31400$t63p$, $t63g$ChIJg0r-RoO9rhIRBZidsrUiAz4$t63g$),
  ($t64n$L’éveil des sens traiteur$t64n$, $t64d$Traiteur à Toulouse.
Téléphone : 07 85 92 13 18
Site web : http://www.traiteur-occitanie.fr/
Note Google : 5/5 (52 avis)
Google Maps : https://maps.google.com/?cid=13506767882592754500&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t64d$, true, 43.518975, 1.55423, $t64a$Av. de la Mairie$t64a$, $t64c$Escalquens$t64c$, $t64p$31750$t64p$, $t64g$ChIJq4nS-g-VrhIRRJuYydOtcbs$t64g$),
  ($t65n$M'îles Délices - traiteur Toulouse$t65n$, $t65d$Traiteur à Toulouse.
Téléphone : 06 26 81 41 33
Site web : http://www.milesdelices.fr/
Note Google : 4.6/5 (85 avis)
Google Maps : https://maps.google.com/?cid=6505086602933826467&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t65d$, true, 43.545978, 1.5050389, $t65a$478 Rue de la Découverte$t65a$, $t65c$Labège$t65c$, $t65p$31670$t65p$, $t65g$ChIJK9RWsRi7rhIRo_MFycy1Rlo$t65g$),
  ($t66n$MPA Restaurant Traiteur$t66n$, $t66d$Traiteur à Toulouse.
Téléphone : 05 61 09 08 98
Site web : https://www.mpa-traiteur.com/
Note Google : 4.5/5 (50 avis)
Google Maps : https://maps.google.com/?cid=10685670429378888958&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t66d$, true, 43.657340999999995, 1.4801768, $t66a$L, 55 Av. de Toulouse$t66a$, $t66c$L'Union$t66c$, $t66p$31240$t66p$, $t66g$ChIJEwTS1ByjrhIR_kQG8qMgS5Q$t66g$),
  ($t67n$Maison Alchimie - Collectif prestataire mariage à Toulouse$t67n$, $t67d$Traiteur à Toulouse.
Téléphone : 06 09 54 82 17
Site web : https://maisonalchimie-mariage.com/
Note Google : 5/5 (9 avis)
Google Maps : https://maps.google.com/?cid=2099585814969751283&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t67d$, true, 43.6023012, 1.4472171, $t67a$14 Pl. Saint-Georges$t67a$, $t67c$Toulouse$t67c$, $t67p$31000$t67p$, $t67g$ChIJNW-z33S9rhIR85a4tCw6Ix0$t67g$),
  ($t68n$Maison Garcia$t68n$, $t68d$Traiteur à Toulouse.
Téléphone : 05 61 23 10 62
Site web : http://www.maison-garcia.fr/
Note Google : 4.6/5 (166 avis)
Google Maps : https://maps.google.com/?cid=7218883934510624962&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t68d$, true, 43.6067551, 1.446539, $t68a$Marché, loge 166, Pl. Victor Hugo$t68a$, $t68c$Toulouse$t68c$, $t68p$31000$t68p$, $t68g$ChIJUUw54568rhIRwrBH77CgLmQ$t68g$),
  ($t69n$Maison Pardailhé Victor Hugo$t69n$, $t69d$Traiteur à Toulouse.
Téléphone : 06 24 77 09 06
Site web : https://maisonpardailhé.fr/
Note Google : 4.8/5 (23 avis)
Google Maps : https://maps.google.com/?cid=4334705459167926652&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t69d$, true, 43.6060471, 1.4469005, $t69a$Marché, Loge 250, Pl. Victor Hugo 253$t69a$, $t69c$Toulouse$t69c$, $t69p$31000$t69p$, $t69g$ChIJYfzby7K9rhIRfJmmG6b3Jzw$t69g$),
  ($t70n$Maison Sampietro$t70n$, $t70d$Traiteur à Toulouse.
Téléphone : 05 34 66 90 35
Site web : http://www.maisonsampietro.fr/
Note Google : 4.6/5 (132 avis)
Google Maps : https://maps.google.com/?cid=18234172281575866196&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t70d$, true, 43.6000373, 1.4532389, $t70a$28 Pl. Dupuy$t70a$, $t70c$Toulouse$t70c$, $t70p$31000$t70p$, $t70g$ChIJ35O6oR-9rhIRVH-a0BTLDP0$t70g$),
  ($t71n$Maison Sampietro - Traiteur Toulouse$t71n$, $t71d$Traiteur à Toulouse.
Téléphone : 05 34 43 48 99
Site web : https://www.maisonsampietro.fr/
Note Google : 4.6/5 (24 avis)
Google Maps : https://maps.google.com/?cid=18342958407805129998&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t71d$, true, 43.607004499999995, 1.4461631, $t71a$25 Pl. Victor Hugo$t71a$, $t71c$Toulouse$t71c$, $t71p$31000$t71p$, $t71g$ChIJRwG0DAC9rhIRDlX9mnxHj_4$t71g$),
  ($t72n$Manding'Art | location de salle, évènementielle, traiteur à Bonnefoy Toulouse$t72n$, $t72d$Traiteur à Toulouse.
Téléphone : 06 85 53 51 33
Site web : https://www.ateliermandingart.com/
Note Google : 4.6/5 (89 avis)
Google Maps : https://maps.google.com/?cid=7510410590168942608&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t72d$, true, 43.6174892, 1.4542709, $t72a$1bis Rue Dr Paul Pujos$t72a$, $t72c$Toulouse$t72c$, $t72p$31500$t72p$, $t72g$ChIJsbWjv7q8rhIREAha0KNWOmg$t72g$),
  ($t73n$Mignardise de Paris (Farah Cuisine)$t73n$, $t73d$Traiteur à Toulouse.
Téléphone : 07 51 35 46 92
Note Google : 4.9/5 (16 avis)
Google Maps : https://maps.google.com/?cid=7802556753310565605&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t73d$, true, 43.594643999999995, 1.4803674000000002, $t73a$17 Rue Julia$t73a$, $t73c$Toulouse$t73c$, $t73p$31500$t73p$, $t73g$ChIJG5qBdWR15kcR5cTmBAdASGw$t73g$),
  ($t74n$Mon Traiteur !$t74n$, $t74d$Traiteur à Toulouse.
Téléphone : 05 62 75 13 12
Site web : http://toulousetraiteur.fr/
Note Google : 4.8/5 (59 avis)
Google Maps : https://maps.google.com/?cid=13944800170604561235&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t74d$, true, 43.6637255, 1.4305208999999999, $t74a$57 Rte de Fronton$t74a$, $t74c$Aucamville$t74c$, $t74p$31140$t74p$, $t74g$ChIJnWYZqIykrhIRUwOxWN_hhcE$t74g$),
  ($t75n$Mon traiteur libanais$t75n$, $t75d$Traiteur à Toulouse.
Téléphone : 06 07 32 79 73
Site web : http://montraiteurlibanais.com/
Note Google : 4.9/5 (123 avis)
Google Maps : https://maps.google.com/?cid=12790345165097158976&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t75d$, true, 43.6060824, 1.3980006999999999, $t75a$15 Imp. de Maubec$t75a$, $t75c$Toulouse$t75c$, $t75p$31300$t75p$, $t75g$ChIJAcJXi-a6rhIRQElAWClvgLE$t75g$),
  ($t76n$NC Cuisine - Chef à domicile$t76n$, $t76d$Traiteur à Toulouse.
Téléphone : 06 80 98 55 45
Site web : https://www.instagram.com/nc_cuisine/
Note Google : 5/5 (143 avis)
Google Maps : https://maps.google.com/?cid=7114913088246544802&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t76d$, true, 43.6381666, 1.4338047000000003, $t76a$$t76a$, $t76c$Toulouse$t76c$, $t76p$31200$t76p$, $t76g$ChIJx8LbFFfmxagRonm24ME_vWI$t76g$),
  ($t77n$Newrest Group International$t77n$, $t77d$Traiteur à Toulouse.
Téléphone : 05 62 89 39 88
Site web : http://www.newrest.eu/fr/
Note Google : 3.3/5 (24 avis)
Google Maps : https://maps.google.com/?cid=7335583701291873637&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t77d$, true, 43.6038792, 1.4501522999999998, $t77a$61 Bd Lazare Carnot$t77a$, $t77c$Toulouse$t77c$, $t77p$31000$t77p$, $t77g$ChIJp_z10Ju8rhIRZbWlv4I6zWU$t77g$),
  ($t78n$Ombeline Treich - Chef Privé à domicile$t78n$, $t78d$Traiteur à Toulouse.
Téléphone : 07 68 98 38 87
Site web : https://ombelinetreich.com/
Note Google : 5/5 (128 avis)
Google Maps : https://maps.google.com/?cid=548980240809729834&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t78d$, true, 43.5953703, 1.3673665, $t78a$5 All. Louise de Coligny-Chatillon$t78a$, $t78c$Toulouse$t78c$, $t78p$31300$t78p$, $t78g$ChIJoZRgTGu7rhIRKh8s0p5engc$t78g$),
  ($t79n$P'tits plats Balma$t79n$, $t79d$Traiteur à Toulouse.
Téléphone : 07 86 37 16 40
Site web : https://www.ptitsplatsbalma.fr/
Note Google : 5/5 (41 avis)
Google Maps : https://maps.google.com/?cid=4619698798097556666&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t79d$, true, 43.633314999999996, 1.4970869999999998, $t79a$44 Rte de Gauré$t79a$, $t79c$Balma$t79c$, $t79p$31130$t79p$, $t79g$ChIJnWrRIxbrrhIRumTnpZR3HEA$t79g$),
  ($t80n$PGN Traiteur$t80n$, $t80d$Traiteur à Toulouse.
Téléphone : 05 61 74 56 89
Site web : https://www.traiteur-pgn.fr/
Note Google : 4.8/5 (37 avis)
Google Maps : https://maps.google.com/?cid=7870486643224251864&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t80d$, true, 43.6769582, 1.3939154999999999, $t80a$53 Rue Jean Jaurès$t80a$, $t80c$Fenouillet$t80c$, $t80p$31150$t80p$, $t80g$ChIJQTuHMNKlrhIR2I3WAueVOW0$t80g$),
  ($t81n$Paella Traditionnelle$t81n$, $t81d$Traiteur à Toulouse.
Téléphone : 06 71 42 72 48
Site web : http://paella-livraison-toulouse.com/
Note Google : 4.8/5 (18 avis)
Google Maps : https://maps.google.com/?cid=7435022778773493941&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t81d$, true, 43.618932, 1.4431574999999999, $t81a$26 Rue d'Aquitaine$t81a$, $t81c$Toulouse$t81c$, $t81p$31200$t81p$, $t81g$ChIJE5DD_le7rhIRtVi7KdOBLmc$t81g$),
  ($t82n$Pierrotcook traiteur$t82n$, $t82d$Traiteur à Toulouse.
Téléphone : 06 50 21 59 90
Site web : http://pierrotcook.fr/
Note Google : 5/5 (9 avis)
Google Maps : https://maps.google.com/?cid=14731722961634914657&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t82d$, true, 43.607924499999996, 1.3783371, $t82a$248 Chem. de Tournefeuille$t82a$, $t82c$Toulouse$t82c$, $t82p$31300$t82p$, $t82g$ChIJKXajVJa6rhIRYfG2SfuXccw$t82g$),
  ($t83n$Por Aqui (traiteur, epicerie)$t83n$, $t83d$Traiteur à Toulouse.
Téléphone : 05 61 23 32 24
Site web : https://por-aqui.fr/fr/
Note Google : 4.1/5 (9 avis)
Google Maps : https://maps.google.com/?cid=14919114097808080954&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t83d$, true, 43.6069071, 1.4470839, $t83a$Pl. Victor Hugo$t83a$, $t83c$Toulouse$t83c$, $t83p$31000$t83p$, $t83g$ChIJm_IeGN69rhIROoBfIzpXC88$t83g$),
  ($t84n$Restaurant Chez Nicole$t84n$, $t84d$Traiteur à Toulouse.
Téléphone : 05 34 53 23 02
Site web : https://www.chez-nicole.com/
Note Google : 4.9/5 (283 avis)
Google Maps : https://maps.google.com/?cid=3511092338976046741&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t84d$, true, 43.588014699999995, 1.446339, $t84a$69 Gd Rue Saint-Michel$t84a$, $t84c$Toulouse$t84c$, $t84p$31400$t84p$, $t84g$ChIJz253COW9rhIRlT5DNuHnuTA$t84g$),
  ($t85n$Skandi & Pergo Traiteur$t85n$, $t85d$Traiteur à Toulouse.
Téléphone : 05 34 27 10 38
Site web : http://www.skandi.fr/
Note Google : 4.7/5 (113 avis)
Google Maps : https://maps.google.com/?cid=17606130754181433526&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t85d$, true, 43.5310431, 1.3701037, $t85a$35 Rue Écopole$t85a$, $t85c$Villeneuve-Tolosane$t85c$, $t85p$31270$t85p$, $t85g$ChIJib4qpj63rhIRtogQwKOKVfQ$t85g$),
  ($t86n$Terrines et pâtés-croûte$t86n$, $t86d$Traiteur à Toulouse.
Téléphone : 05 61 44 35 56
Site web : https://www.spoomstraiteur.com/
Note Google : 4.8/5 (25 avis)
Google Maps : https://maps.google.com/?cid=17831002675117725103&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t86d$, true, 43.5988787, 1.4490802, $t86a$6 Rue Pierre de Fermat$t86a$, $t86c$Toulouse$t86c$, $t86p$31000$t86p$, $t86g$ChIJs_I2GJm9rhIRr5Vu13VydPc$t86g$),
  ($t87n$Terroir Exotique$t87n$, $t87d$Traiteur à Toulouse.
Téléphone : 05 62 16 37 11
Site web : http://terroirexotique.com/
Note Google : 5/5 (32 avis)
Google Maps : https://maps.google.com/?cid=9852419205208588796&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t87d$, true, 43.6140331, 1.438049, $t87a$32 bis Av. Honoré Serres$t87a$, $t87c$Toulouse$t87c$, $t87p$31000$t87p$, $t87g$ChIJD9u18pG9rhIR_MGxGBHTuog$t87g$),
  ($t88n$Tout & Bon Blagnac$t88n$, $t88d$Traiteur à Toulouse.
Téléphone : 05 82 95 04 59
Site web : https://toutetbon.fr/nos-traiteurs-france/blagnac
Note Google : 4.3/5 (32 avis)
Google Maps : https://maps.google.com/?cid=9290427857542189750&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t88d$, true, 43.5675338, 1.3854028999999999, $t88a$4 Rue Paul Mesplé$t88a$, $t88c$Toulouse$t88c$, $t88p$31100$t88p$, $t88g$ChIJ65DBO2e7rhIRthIy5Ok67oA$t88g$),
  ($t89n$Tout & Bon Labège$t89n$, $t89d$Traiteur à Toulouse.
Téléphone : 05 61 53 46 49
Site web : https://toutetbon.fr/nos-traiteurs-france/labege
Note Google : 4.4/5 (37 avis)
Google Maps : https://maps.google.com/?cid=382614392429314814&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t89d$, true, 43.550871799999996, 1.5101251999999998, $t89a$3547 Rte de Baziege la Lauragaise$t89a$, $t89c$Labège$t89c$, $t89p$31670$t89p$, $t89g$ChIJVxH4oOK9rhIR_oKzQsNRTwU$t89g$),
  ($t90n$Traiteur / chef à domicile Spicy Spoon$t90n$, $t90d$Traiteur à Toulouse.
Téléphone : 07 84 15 34 66
Site web : https://www.chefmourad.com/
Note Google : 5/5 (2 avis)
Google Maps : https://maps.google.com/?cid=17626382179024258065&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t90d$, true, 43.569221, 1.4825409999999999, $t90a$7 All. Pierre de Serre de St Roman$t90a$, $t90c$Toulouse$t90c$, $t90p$31400$t90p$, $t90g$ChIJe2JrcQC9rhIREUQECDR9nfQ$t90g$),
  ($t91n$Traiteur Auchan Toulouse$t91n$, $t91d$Traiteur à Toulouse.
Téléphone : 05 61 26 73 00
Site web : https://traiteur.auchan.fr/magasin/auchan-traiteur-toulouse-70/e-11127660
Note Google : 3.6/5 (29 avis)
Google Maps : https://maps.google.com/?cid=17712263532738163813&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t91d$, true, 43.631541399999996, 1.4836038999999999, $t91a$Chem. de Gabardie$t91a$, $t91c$Toulouse$t91c$, $t91p$31075$t91p$, $t91g$ChIJ8ecYzdWirhIRZbT25NaZzvU$t91g$),
  ($t92n$Traiteur Délice Events Toulouse$t92n$, $t92d$Traiteur à Toulouse.
Téléphone : 07 49 46 12 26
Site web : https://www.deliceevents.fr/
Note Google : 4.9/5 (88 avis)
Google Maps : https://maps.google.com/?cid=16642620648818346947&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t92d$, true, 43.5696369, 1.3332557, $t92a$2 Rue Berthelot$t92a$, $t92c$Tournefeuille$t92c$, $t92p$31170$t92p$, $t92g$ChIJ9Wv1aFYDZwgRwwtmwE139uY$t92g$),
  ($t93n$Traiteur Guedot$t93n$, $t93d$Traiteur à Toulouse.
Téléphone : 05 61 52 36 95
Site web : https://traiteur-guedot-toulouse.eatbu.com/
Note Google : 4.5/5 (16 avis)
Google Maps : https://maps.google.com/?cid=10095482372002141420&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t93d$, true, 43.590851, 1.445098, $t93a$147 Gd Rue Saint-Michel$t93a$, $t93c$Toulouse$t93c$, $t93p$31400$t93p$, $t93g$ChIJDVnnrM29rhIR7NRnq7pbGow$t93g$),
  ($t94n$Traiteur Toulouse halal$t94n$, $t94d$Traiteur à Toulouse.
Téléphone : 07 83 24 97 65
Site web : https://www.instagram.com/traiteur_toulouse_halal?igsh=cmsycGR6bXZ0eno5&utm_source=qr
Note Google : 4.9/5 (33 avis)
Google Maps : https://maps.google.com/?cid=2560593826867268966&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t94d$, true, 43.616839999999996, 1.3105, $t94a$11 All. de Guérande$t94a$, $t94c$Colomiers$t94c$, $t94p$31770$t94p$, $t94g$ChIJJz8HEQKxrhIRZk172IQOiSM$t94g$),
  ($t95n$Un Chef Dans Votre Cuisine - Traiteur$t95n$, $t95d$Traiteur à Toulouse.
Téléphone : 05 62 20 01 45
Site web : https://www.unchefdansvotrecuisine.fr/
Note Google : 4.8/5 (172 avis)
Google Maps : https://maps.google.com/?cid=6370232547708322075&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t95d$, true, 43.5757161, 1.5110162, $t95a$101 Chem. des Tuileries Bis$t95a$, $t95c$Toulouse$t95c$, $t95p$31400$t95p$, $t95g$ChIJQTAf3JG9rhIRG0HJTsCcZ1g$t95g$),
  ($t96n$Wi's Traiteur$t96n$, $t96d$Traiteur à Toulouse.
Téléphone : 05 34 41 56 90
Site web : http://www.wistraiteur.com/
Note Google : 4.8/5 (65 avis)
Google Maps : https://maps.google.com/?cid=15495669838507526715&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t96d$, true, 43.6435969, 1.4515668, $t96a$101 Rue Edmond Rostand$t96a$, $t96c$Toulouse$t96c$, $t96p$31200$t96p$, $t96g$ChIJoxFdkVyjrhIRO8r5WJ6tC9c$t96g$),
  ($t97n$Yvette Traiteur Toulouse$t97n$, $t97d$Traiteur à Toulouse.
Téléphone : 05 61 73 95 96
Site web : https://www.yvette-toulouse.fr/
Note Google : 5/5 (13 avis)
Google Maps : https://maps.google.com/?cid=12872074312839425877&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t97d$, true, 43.6364118, 1.4949231, $t97a$33 Rte de Lavaur$t97a$, $t97c$L'Union$t97c$, $t97p$31240$t97p$, $t97g$ChIJoRHe4i29rhIRVW85a2PLorI$t97g$),
  ($t98n$l'appétit suprême$t98n$, $t98d$Traiteur à Toulouse.
Téléphone : 05 34 33 72 64
Site web : https://www.facebook.com/pg/Lapp%C3%A9tit-supr%C3%AAme-1062458533907429/
Note Google : 4.8/5 (36 avis)
Google Maps : https://maps.google.com/?cid=9466295385331524658&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t98d$, true, 43.6060839, 1.4466447999999998, $t98a$Marché Victor Hugo Loges 184 à 186 et 213 à 214A$t98a$, $t98c$Toulouse$t98c$, $t98p$31000$t98p$, $t98g$ChIJwUMOHAi9rhIRMuSalX8JX4M$t98g$),
  ($t99n$les épicuriennes traiteuses$t99n$, $t99d$Traiteur à Toulouse.
Téléphone : 07 69 32 63 21
Site web : https://lesepicuriennestraiteuses.com/
Note Google : 4.5/5 (35 avis)
Google Maps : https://maps.google.com/?cid=12458714820294023861&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$t99d$, true, 43.6048806, 1.4427782000000002, $t99a$$t99a$, $t99c$Toulouse$t99c$, $t99p$31000$t99p$, $t99g$ChIJ__-7pj63rhIRtRqFtR4_5qw$t99g$)
) as v(
  name,
  description,
  published,
  latitude,
  longitude,
  address,
  city,
  postal_code,
  google_place_id
)
where not exists (
  select 1
  from public.craftsmans existing
  where existing.google_place_id = v.google_place_id
);

insert into public.craftsmans_sub_category (craftsman_id, sub_category_id)
select craftsman.id, sub_category.id
from public.craftsmans as craftsman
join public.sub_categories_translations as translation
  on translation.language_code = 'fr'
 and translation.name = 'Traiteur'
join public.sub_categories as sub_category
  on sub_category.id = translation.sub_category_id
where craftsman.google_place_id is not null
  and not exists (
    select 1
    from public.craftsmans_sub_category link
    where link.craftsman_id = craftsman.id
      and link.sub_category_id = sub_category.id
  );

-- Keep the PostGIS point in sync when the column is a plain geography/geometry.
do $$
declare
  location_type text;
  location_generated "char";
begin
  select a.atttypid::regtype::text, a.attgenerated
  into location_type, location_generated
  from pg_attribute a
  join pg_class c on c.oid = a.attrelid
  join pg_namespace n on n.oid = c.relnamespace
  where n.nspname = 'public'
    and c.relname = 'craftsmans'
    and a.attname = 'location'
    and not a.attisdropped;

  if location_type is null or location_generated <> '' then
    return;
  end if;

  if location_type like 'geography%' then
    update public.craftsmans
    set location = ST_SetSRID(ST_MakePoint(longitude, latitude), 4326)::geography
    where google_place_id is not null
      and latitude is not null
      and longitude is not null
      and location is null;
  elsif location_type like 'geometry%' then
    update public.craftsmans
    set location = ST_SetSRID(ST_MakePoint(longitude, latitude), 4326)
    where google_place_id is not null
      and latitude is not null
      and longitude is not null
      and location is null;
  end if;
end $$;
