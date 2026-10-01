-- Seed event hosts, games, shows, magicians, and activities around Toulouse.
-- Only these google_place_id values are linked to Animation subcategories.

insert into public.craftsmans (
  name,
  description,
  published,
  latitude,
  longitude,
  address,
  city,
  postal_code,
  google_place_id,
  rating,
  review_count
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
  v.google_place_id,
  v.rating::numeric(2, 1),
  v.review_count::integer
from (
  values
  ($d0n$Animation Casino Entreprise Toulouse - AA Casino by AA Event - Agence d'animation de Soirée Casino Factice$d0n$, $d0d$Jeux et quiz à Toulouse.
Téléphone : 06 77 01 02 92
Site web : https://www.aacasino.fr/
Note Google : 5/5 (2 avis)
Google Maps : https://maps.google.com/?cid=2567027264679561080&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d0d$, true, 43.5550989, 1.4031464, $d0a$35 Av. de Larrieu-Thibaud$d0a$, $d0c$Toulouse$d0c$, $d0p$31100$d0p$, $d0g$ChIJj7f2FVS7rhIReMf3T7LpnyM$d0g$, 5.0, 2, $d0s$Jeux & quiz$d0s$),
  ($d1n$Audrey Des Rencontres et Des Jeux$d1n$, $d1d$Jeux et quiz à Plaisance-du-Touch.
Téléphone : 06 72 05 91 98
Site web : https://rencontresetjeux.fr/Brochure2026.pdf#zoom=50
Note Google : 5/5 (13 avis)
Google Maps : https://maps.google.com/?cid=9520299629788874402&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d1d$, true, 43.568571999999996, 1.2920791, $d1a$57 Rue de Gascogne$d1a$, $d1c$Plaisance-du-Touch$d1c$, $d1p$31830$d1p$, $d1g$ChIJB0YF9hT9VEoRokbZlBLmHoQ$d1g$, 5.0, 13, $d1s$Jeux & quiz$d1s$),
  ($d2n$Bertrand Gaté Magicien$d2n$, $d2d$Magicien à Toulouse.
Téléphone : 07 77 73 47 41
Site web : https://bertrandgate.com/
Note Google : 5/5 (556 avis)
Google Maps : https://maps.google.com/?cid=818344505767687380&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d2d$, true, 43.602049199999996, 1.442091, $d2a$13 Rue Sainte-Ursule$d2a$, $d2c$Toulouse$d2c$, $d2p$31000$d2p$, $d2g$ChIJ6wnV_I5Ol6IR1PQsAv5XWws$d2g$, 5.0, 556, $d2s$Magicien$d2s$),
  ($d3n$Cirque De Noel$d3n$, $d3d$Spectacles à Toulouse.
Site web : http://www.cirque-noel-toulouse.fr/
Note Google : 4.4/5 (1756 avis)
Google Maps : https://maps.google.com/?cid=9136255243620498141&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d3d$, true, 43.590225, 1.4026701, $d3a$1 Chem. des Courses$d3a$, $d3c$Toulouse$d3c$, $d3p$31100$d3p$, $d3g$ChIJxS731AO7rhIR3bpM9bx_yn4$d3g$, 4.4, 1756, $d3s$Spectacles$d3s$),
  ($d4n$Compagnie 64 Degrés - Spectacle FEU et LED$d4n$, $d4d$Spectacles à Toulouse.
Téléphone : 06 17 55 42 91
Site web : http://www.cie64degres.com/
Note Google : 4.9/5 (39 avis)
Google Maps : https://maps.google.com/?cid=4651179331945699987&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d4d$, true, 43.5792227, 1.4470634999999998, $d4a$3 avenue du quatorzième régiment$d4a$, $d4c$Toulouse$d4c$, $d4p$31400$d4p$, $d4g$ChIJtZZe51Zpp20RkxpDm_VOjEA$d4g$, 4.9, 39, $d4s$Spectacles$d4s$),
  ($d5n$Compagnie Cirkomcha - échassiers - Spectacle de feu - cirque$d5n$, $d5d$Spectacles à Toulouse.
Téléphone : 06 13 90 55 61
Site web : http://www.cirkomcha.com/
Note Google : 5/5 (22 avis)
Google Maps : https://maps.google.com/?cid=636734046410076814&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d5d$, true, 43.6184489, 1.4367113, $d5a$48 Av. des Minimes$d5a$, $d5c$Toulouse$d5c$, $d5p$31200$d5p$, $d5g$ChIJ-d8VcuIlqRIRjnKr3D0i1gg$d5g$, 5.0, 22, $d5s$Spectacles$d5s$),
  ($d6n$Compagnie les Incompressibles - Magie, feux d'artifice$d6n$, $d6d$Magicien à Toulouse.
Téléphone : 06 13 66 56 45
Site web : http://www.les-incompressibles.com/
Note Google : 5/5 (23 avis)
Google Maps : https://maps.google.com/?cid=17222649637613009675&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d6d$, true, 43.5700496, 1.4605785999999998, $d6a$19 Rue Jean Giraudoux$d6a$, $d6c$Toulouse$d6c$, $d6p$31400$d6p$, $d6g$ChIJV_FpuPK7rhIRC_vujJgkA-8$d6g$, 5.0, 23, $d6s$Magicien$d6s$),
  ($d7n$Elite Animation$d7n$, $d7d$Animateur à Cornebarrieu.
Téléphone : 06 23 03 00 24
Site web : https://eliteanimation.com/
Note Google : 5/5 (48 avis)
Google Maps : https://maps.google.com/?cid=9079892896170589695&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d7d$, true, 43.6397273, 1.3128473, $d7a$62 Rte de Pibrac$d7a$, $d7c$Cornebarrieu$d7c$, $d7p$31700$d7p$, $d7g$ChIJ5-qI-8yxrhIR_z3XUntCAn4$d7g$, 5.0, 48, $d7s$Animateur$d7s$),
  ($d8n$FLAMINGO Animations, fêtes à domicile pour enfants$d8n$, $d8d$Activités à Toulouse.
Téléphone : 06 37 59 01 30
Site web : http://www.flamingoanimations.fr/
Note Google : 4.9/5 (19 avis)
Google Maps : https://maps.google.com/?cid=14191380773119860847&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d8d$, true, 43.60190120000001, 1.4490759, $d8a$5 Rue Renée Aspe$d8a$, $d8c$Toulouse$d8c$, $d8p$31000$d8p$, $d8g$ChIJLd-WDpu8rhIRbyAevp_p8cQ$d8g$, 4.9, 19, $d8s$Activités$d8s$),
  ($d9n$Florian Gareau Magicien$d9n$, $d9d$Magicien à Toulouse.
Téléphone : 06 28 41 72 41
Site web : https://www.florian-gareau.com/
Note Google : 5/5 (283 avis)
Google Maps : https://maps.google.com/?cid=7671192556633246215&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d9d$, true, 43.6093364, 1.4501334, $d9a$33 Rue de Stalingrad$d9a$, $d9c$Toulouse$d9c$, $d9p$31000$d9p$, $d9g$ChIJ1WayE70IJ2QRB8q-jfyMdWo$d9g$, 5.0, 283, $d9s$Magicien$d9s$),
  ($d10n$Granraf le Magicien$d10n$, $d10d$Magicien à Tournefeuille.
Téléphone : 06 24 51 81 42
Site web : http://www.granraf.com/
Note Google : 5/5 (19 avis)
Google Maps : https://maps.google.com/?cid=16146358324206280454&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d10d$, true, 43.5829862, 1.3289809, $d10a$11 Rue de la Camargue$d10a$, $d10c$Tournefeuille$d10c$, $d10p$31170$d10p$, $d10g$ChIJ-0-GFv2wrhIRBp98SlljE-A$d10g$, 5.0, 19, $d10s$Magicien$d10s$),
  ($d11n$Ibtissem Danseuse Orientale$d11n$, $d11d$Spectacles à Toulouse.
Téléphone : 06 33 32 71 97
Site web : https://danse-orientale-toulouse.fr/
Note Google : 5/5 (64 avis)
Google Maps : https://maps.google.com/?cid=11210419618553473273&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d11d$, true, 43.60648, 1.4447902000000001, $d11a$38 Rue Charles de Rémusat$d11a$, $d11c$Toulouse$d11c$, $d11p$31000$d11p$, $d11g$ChIJa3qlPp68rhIR-Sjzaj9pk5s$d11g$, 5.0, 64, $d11s$Spectacles$d11s$),
  ($d12n$Id2 Loisirs animations ludiques sportives et jeux interactifs$d12n$, $d12d$Jeux et quiz à Fontenilles.
Téléphone : 06 09 39 56 95
Site web : http://www.id2loisirs.fr/
Note Google : 4.9/5 (30 avis)
Google Maps : https://maps.google.com/?cid=3724049262495110988&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d12d$, true, 43.5589379, 1.1747542, $d12a$2 bis Av. de Gascogne$d12a$, $d12c$Fontenilles$d12c$, $d12p$31470$d12p$, $d12g$ChIJfTNqFGO6rhIRTJcTyRJ7rjM$d12g$, 4.9, 30, $d12s$Jeux & quiz$d12s$),
  ($d13n$Jay’magicien$d13n$, $d13d$Magicien à Toulouse.
Téléphone : 07 83 30 02 52
Site web : https://www.jaymagicien.com/
Note Google : 5/5 (29 avis)
Google Maps : https://maps.google.com/?cid=3502431117965468390&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d13d$, true, 43.5754465, 1.4846313999999998, $d13a$Rue Emile Lecrivain$d13a$, $d13c$Toulouse$d13c$, $d13p$31400$d13p$, $d13g$ChIJlwGx66W9rhIR5iKbjIsimzA$d13g$, 5.0, 29, $d13s$Magicien$d13s$),
  ($d14n$L'Art Du Oui Danse - Chorégraphe Toulouse$d14n$, $d14d$Spectacles à Toulouse.
Téléphone : 07 81 90 90 15
Site web : https://www.lartduoui.fr/
Note Google : 5/5 (9 avis)
Google Maps : https://maps.google.com/?cid=4600075101917458979&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d14d$, true, 43.5979272, 1.4441332, $d14a$42 Rue des Polinaires$d14a$, $d14c$Toulouse$d14c$, $d14p$31000$d14p$, $d14g$ChIJL2Dmb829rhIRI7Lo1e6_1j8$d14g$, 5.0, 9, $d14s$Spectacles$d14s$),
  ($d15n$La Chorégraphe des Mariés$d15n$, $d15d$Spectacles à Toulouse.
Téléphone : 06 87 00 95 38
Site web : https://www.lachoregraphedesmaries.com/
Note Google : 5/5 (93 avis)
Google Maps : https://maps.google.com/?cid=3604546480240283351&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d15d$, true, 43.597700200000006, 1.4441581, $d15a$9 Pl. des Carmes$d15a$, $d15c$Toulouse$d15c$, $d15p$31000$d15p$, $d15g$ChIJGT1ZnvexrhIR104bE-3rBTI$d15g$, 5.0, 93, $d15s$Spectacles$d15s$),
  ($d16n$Les Anims & Ateliers de Claire, AdC Event.$d16n$, $d16d$Animateur à Aussonne.
Téléphone : 06 10 71 80 61
Site web : http://www.lesateliersdeclaire.com/
Note Google : 4.4/5 (5 avis)
Google Maps : https://maps.google.com/?cid=334148923406857472&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d16d$, true, 43.688390999999996, 1.3316923999999999, $d16a$12 Lot. les Épicéas$d16a$, $d16c$Aussonne$d16c$, $d16p$31840$d16p$, $d16g$ChIJ98lNkyGvrhIRALW-6awiowQ$d16g$, 4.4, 5, $d16s$Animateur$d16s$),
  ($d17n$Les Savants Fous Toulouse$d17n$, $d17d$Spectacles à Tournefeuille.
Téléphone : 06 38 74 09 44
Site web : https://www.lessavantsfous.fr/contact-toulouse.html?utm_source=Google&utm_medium=MyBusiness
Note Google : 4.9/5 (64 avis)
Google Maps : https://maps.google.com/?cid=17040039056769893486&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d17d$, true, 43.5614704, 1.3524625, $d17a$3 Chem. de Bordenoire$d17a$, $d17c$Tournefeuille$d17c$, $d17p$31170$d17p$, $d17g$ChIJe9tAem5-rhIRbkSNeT1heuw$d17g$, 4.9, 64, $d17s$Spectacles$d17s$),
  ($d18n$Lucas Nolan Magicien Toulouse$d18n$, $d18d$Magicien à Toulouse.
Téléphone : 06 84 68 88 44
Site web : https://www.magicien-mentaliste-toulouse.com/
Note Google : 5/5 (564 avis)
Google Maps : https://maps.google.com/?cid=9431647674061415032&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d18d$, true, 43.5836186, 1.3716161999999998, $d18a$16 Chem. Ferro-Lebres$d18a$, $d18c$Toulouse$d18c$, $d18p$31100$d18p$, $d18g$ChIJyd12lPa7rhIReOIRq5bx44I$d18g$, 5.0, 564, $d18s$Magicien$d18s$),
  ($d19n$Magicien Gabko$d19n$, $d19d$Magicien à Ramonville-Saint-Agne.
Téléphone : 06 83 13 86 96
Site web : http://magicien-gabko.fr/
Note Google : 5/5 (3 avis)
Google Maps : https://maps.google.com/?cid=3464946263024098126&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d19d$, true, 43.544480899999996, 1.47899, $d19a$$d19a$, $d19c$Ramonville-Saint-Agne$d19c$, $d19p$31520$d19p$, $d19g$ChIJJe818Ia-rhIRTltepUT2FTA$d19g$, 5.0, 3, $d19s$Magicien$d19s$),
  ($d20n$Magicien Toulouse$d20n$, $d20d$Magicien à Toulouse.
Téléphone : 06 59 40 98 44
Site web : https://www.toulouse-magicien.fr/contact/
Google Maps : https://maps.google.com/?cid=2532333146859473947&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d20d$, true, 43.6520444, 1.4318597, $d20a$281 Av. de Fronton$d20a$, $d20c$Toulouse$d20c$, $d20p$31200$d20p$, $d20g$ChIJyd53L5ekrhIRG4yBh5SnJCM$d20g$, 0, 0, $d20s$Magicien$d20s$),
  ($d21n$Magicien Toulouse Magic lucky$d21n$, $d21d$Magicien à Toulouse.
Téléphone : 06 14 71 04 16
Site web : https://www.toulousemagicien.com/?utm_source=google&utm_medium=wix_google_business_profile&utm_campaign=7838341807769837149
Google Maps : https://maps.google.com/?cid=11509532216659185919&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d21d$, true, 43.577945400000004, 1.4055412999999999, $d21a$1 All. Antonio Machado$d21a$, $d21c$Toulouse$d21c$, $d21p$31100$d21p$, $d21g$ChIJP3TnlO67rhIR_5DiKJISup8$d21g$, 0, 0, $d21s$Magicien$d21s$),
  ($d22n$Murder Party Haute Garonne - Mortelle Soirée$d22n$, $d22d$Jeux et quiz à Montastruc-la-Conseillère.
Téléphone : 06 82 19 02 08
Site web : http://www.mortellesoiree.com/
Note Google : 5/5 (4 avis)
Google Maps : https://maps.google.com/?cid=6367775258784599835&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d22d$, true, 43.7214885, 1.5890707, $d22a$23 Chem. Vert$d22a$, $d22c$Montastruc-la-Conseillère$d22c$, $d22p$31380$d22p$, $d22g$ChIJpWpPuqKerhIRG49gJdzhXlg$d22g$, 5.0, 4, $d22s$Jeux & quiz$d22s$),
  ($d23n$Quentin : Animateur Présentateur Micro Événementiel Toulouse et Occitanie$d23n$, $d23d$Animateur à Toulouse.
Téléphone : 06 29 31 20 25
Note Google : 5/5 (17 avis)
Google Maps : https://maps.google.com/?cid=5614483573138760483&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d23d$, true, 43.607005099999995, 1.4513435, $d23a$54 All. Jean Jaurès$d23a$, $d23c$Toulouse$d23c$, $d23p$31000$d23p$, $d23g$ChIJPa2ayX68rhIRI6MzHhCn6k0$d23g$, 5.0, 17, $d23s$Animateur$d23s$),
  ($d24n$Remi Ladore Magicien Toulouse$d24n$, $d24d$Magicien à Toulouse.
Téléphone : 06 59 40 98 44
Site web : https://www.toulouse-magicien.fr/
Note Google : 5/5 (249 avis)
Google Maps : https://maps.google.com/?cid=6866703892897388328&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d24d$, true, 43.625937, 1.445036, $d24a$76 Rue Pierre Cazeneuve$d24a$, $d24c$Toulouse$d24c$, $d24p$31200$d24p$, $d24g$ChIJN5UvTqq8rhIRKNfwKc9uS18$d24g$, 5.0, 249, $d24s$Magicien$d24s$),
  ($d25n$Robin Z'Kat Magicien, Illusionniste à Toulouse et en région Occitanie$d25n$, $d25d$Magicien à Toulouse.
Téléphone : 06 30 49 36 72
Site web : http://robinmagicien.com/
Note Google : 5/5 (38 avis)
Google Maps : https://maps.google.com/?cid=14760505501005308247&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d25d$, true, 43.621484099999996, 1.4333039, $d25a$87 Rue du Général Bourbaki$d25a$, $d25c$Toulouse$d25c$, $d25p$31200$d25p$, $d25g$ChIJM46vK7XD9EcRV-GedIzZ18w$d25g$, 5.0, 38, $d25s$Magicien$d25s$),
  ($d26n$Romi Magicien$d26n$, $d26d$Magicien à Toulouse.
Téléphone : 06 07 81 03 15
Site web : https://romi-magicien.fr/
Note Google : 5/5 (95 avis)
Google Maps : https://maps.google.com/?cid=6194377163077754825&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d26d$, true, 43.5786435, 1.4876802999999998, $d26a$14 Rue de Garin$d26a$, $d26c$Toulouse$d26c$, $d26p$31500$d26p$, $d26g$ChIJM_LFnXi9rhIRyZ8K6jXZ9lU$d26g$, 5.0, 95, $d26s$Magicien$d26s$),
  ($d27n$Spectacles et animations cirque et magie$d27n$, $d27d$Magicien à Toulouse.
Téléphone : 07 66 59 97 63
Site web : http://www.spectacles-animations.fr/
Note Google : 5/5 (1 avis)
Google Maps : https://maps.google.com/?cid=13543874686716043257&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d27d$, true, 43.6167259, 1.4549086999999998, $d27a$5 Rue Arago$d27a$, $d27c$Toulouse$d27c$, $d27p$31500$d27p$, $d27g$ChIJHYpuKwC9rhIR-V8d4ESC9bs$d27g$, 5.0, 1, $d27s$Magicien$d27s$),
  ($d28n$Stephane Damour | Magicien - Mentaliste$d28n$, $d28d$Magicien à Castanet-Tolosan.
Téléphone : 06 26 29 34 74
Site web : https://stephane-damour.fr/
Note Google : 5/5 (16 avis)
Google Maps : https://maps.google.com/?cid=7791288104990000874&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d28d$, true, 43.5130353, 1.5116344, $d28a$1 Av. Se Canto villa 4$d28a$, $d28c$Castanet-Tolosan$d28c$, $d28p$31320$d28p$, $d28g$ChIJSxR2D1LswkcR6sanYEA3IGw$d28g$, 5.0, 16, $d28s$Magicien$d28s$),
  ($d29n$Thomas le Magicien$d29n$, $d29d$Magicien à Toulouse.
Téléphone : 06 74 34 59 82
Site web : https://www.magie-mentalisme.com/
Google Maps : https://maps.google.com/?cid=4947618484478415098&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d29d$, true, 43.6004957, 1.4349017, $d29a$37 Rue Charles Viguerie$d29a$, $d29c$Toulouse$d29c$, $d29p$31300$d29p$, $d29g$ChIJNVKnEPS7rhIR-hB-S8x4qUQ$d29g$, 0, 0, $d29s$Magicien$d29s$),
  ($d30n$Tonio Animation$d30n$, $d30d$Animateur à Portet-sur-Garonne.
Téléphone : 06 08 04 15 80
Note Google : 5/5 (4 avis)
Google Maps : https://maps.google.com/?cid=3640044919564273927&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d30d$, true, 43.540943899999995, 1.4040641, $d30a$12 Chemin des Palanques N$d30a$, $d30c$Portet-sur-Garonne$d30c$, $d30p$31120$d30p$, $d30g$ChIJjSIZax-5rhIRBwkYjZEJhDI$d30g$, 5.0, 4, $d30s$Animateur$d30s$),
  ($d31n$animation mariage Toulouse$d31n$, $d31d$Animateur à Muret.
Téléphone : 06 09 13 04 39
Note Google : 3/5 (2 avis)
Google Maps : https://maps.google.com/?cid=14360174303733193669&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d31d$, true, 43.445433, 1.338274, $d31a$Rte d'Eaunes$d31a$, $d31c$Muret$d31c$, $d31p$31600$d31p$, $d31g$ChIJx0TedGzIrhIRxZu1HnKWScc$d31g$, 3.0, 2, $d31s$Animateur$d31s$),
  ($d32n$clown pom$d32n$, $d32d$Spectacles à Toulouse.
Téléphone : 06 27 26 00 18
Site web : http://koikadi-theatre-clown.fr/
Google Maps : https://maps.google.com/?cid=9399720137615645086&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d32d$, true, 43.6185866, 1.4570064999999999, $d32a$3 Rue Albert Sorel$d32a$, $d32c$Toulouse$d32c$, $d32p$31500$d32p$, $d32g$ChIJPfhCdbq8rhIRnpmqzqmDcoI$d32g$, 0, 0, $d32s$Spectacles$d32s$),
  ($d33n$jean luc magie$d33n$, $d33d$Magicien à Canohès.
Téléphone : 06 76 86 77 26
Site web : https://www.jlmagie.com/
Note Google : 5/5 (125 avis)
Google Maps : https://maps.google.com/?cid=6249176984278808398&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d33d$, true, 42.6439052, 2.8379019, $d33a$7 Imp. du Peric$d33a$, $d33c$Canohès$d33c$, $d33p$66680$d33p$, $d33g$ChIJa2IkBgJvsBIRTjd8jluJuVY$d33g$, 5.0, 125, $d33s$Magicien$d33s$)
) as v(
  name,
  description,
  published,
  latitude,
  longitude,
  address,
  city,
  postal_code,
  google_place_id,
  rating,
  review_count,
  sub_category
)
where not exists (
  select 1
  from public.craftsmans existing
  where existing.google_place_id = v.google_place_id
);

insert into public.craftsmans_sub_category (craftsman_id, sub_category_id)
select craftsman.id, sub_category.id
from (
  values
  ($d0n$Animation Casino Entreprise Toulouse - AA Casino by AA Event - Agence d'animation de Soirée Casino Factice$d0n$, $d0d$Jeux et quiz à Toulouse.
Téléphone : 06 77 01 02 92
Site web : https://www.aacasino.fr/
Note Google : 5/5 (2 avis)
Google Maps : https://maps.google.com/?cid=2567027264679561080&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d0d$, true, 43.5550989, 1.4031464, $d0a$35 Av. de Larrieu-Thibaud$d0a$, $d0c$Toulouse$d0c$, $d0p$31100$d0p$, $d0g$ChIJj7f2FVS7rhIReMf3T7LpnyM$d0g$, 5.0, 2, $d0s$Jeux & quiz$d0s$),
  ($d1n$Audrey Des Rencontres et Des Jeux$d1n$, $d1d$Jeux et quiz à Plaisance-du-Touch.
Téléphone : 06 72 05 91 98
Site web : https://rencontresetjeux.fr/Brochure2026.pdf#zoom=50
Note Google : 5/5 (13 avis)
Google Maps : https://maps.google.com/?cid=9520299629788874402&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d1d$, true, 43.568571999999996, 1.2920791, $d1a$57 Rue de Gascogne$d1a$, $d1c$Plaisance-du-Touch$d1c$, $d1p$31830$d1p$, $d1g$ChIJB0YF9hT9VEoRokbZlBLmHoQ$d1g$, 5.0, 13, $d1s$Jeux & quiz$d1s$),
  ($d2n$Bertrand Gaté Magicien$d2n$, $d2d$Magicien à Toulouse.
Téléphone : 07 77 73 47 41
Site web : https://bertrandgate.com/
Note Google : 5/5 (556 avis)
Google Maps : https://maps.google.com/?cid=818344505767687380&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d2d$, true, 43.602049199999996, 1.442091, $d2a$13 Rue Sainte-Ursule$d2a$, $d2c$Toulouse$d2c$, $d2p$31000$d2p$, $d2g$ChIJ6wnV_I5Ol6IR1PQsAv5XWws$d2g$, 5.0, 556, $d2s$Magicien$d2s$),
  ($d3n$Cirque De Noel$d3n$, $d3d$Spectacles à Toulouse.
Site web : http://www.cirque-noel-toulouse.fr/
Note Google : 4.4/5 (1756 avis)
Google Maps : https://maps.google.com/?cid=9136255243620498141&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d3d$, true, 43.590225, 1.4026701, $d3a$1 Chem. des Courses$d3a$, $d3c$Toulouse$d3c$, $d3p$31100$d3p$, $d3g$ChIJxS731AO7rhIR3bpM9bx_yn4$d3g$, 4.4, 1756, $d3s$Spectacles$d3s$),
  ($d4n$Compagnie 64 Degrés - Spectacle FEU et LED$d4n$, $d4d$Spectacles à Toulouse.
Téléphone : 06 17 55 42 91
Site web : http://www.cie64degres.com/
Note Google : 4.9/5 (39 avis)
Google Maps : https://maps.google.com/?cid=4651179331945699987&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d4d$, true, 43.5792227, 1.4470634999999998, $d4a$3 avenue du quatorzième régiment$d4a$, $d4c$Toulouse$d4c$, $d4p$31400$d4p$, $d4g$ChIJtZZe51Zpp20RkxpDm_VOjEA$d4g$, 4.9, 39, $d4s$Spectacles$d4s$),
  ($d5n$Compagnie Cirkomcha - échassiers - Spectacle de feu - cirque$d5n$, $d5d$Spectacles à Toulouse.
Téléphone : 06 13 90 55 61
Site web : http://www.cirkomcha.com/
Note Google : 5/5 (22 avis)
Google Maps : https://maps.google.com/?cid=636734046410076814&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d5d$, true, 43.6184489, 1.4367113, $d5a$48 Av. des Minimes$d5a$, $d5c$Toulouse$d5c$, $d5p$31200$d5p$, $d5g$ChIJ-d8VcuIlqRIRjnKr3D0i1gg$d5g$, 5.0, 22, $d5s$Spectacles$d5s$),
  ($d6n$Compagnie les Incompressibles - Magie, feux d'artifice$d6n$, $d6d$Magicien à Toulouse.
Téléphone : 06 13 66 56 45
Site web : http://www.les-incompressibles.com/
Note Google : 5/5 (23 avis)
Google Maps : https://maps.google.com/?cid=17222649637613009675&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d6d$, true, 43.5700496, 1.4605785999999998, $d6a$19 Rue Jean Giraudoux$d6a$, $d6c$Toulouse$d6c$, $d6p$31400$d6p$, $d6g$ChIJV_FpuPK7rhIRC_vujJgkA-8$d6g$, 5.0, 23, $d6s$Magicien$d6s$),
  ($d7n$Elite Animation$d7n$, $d7d$Animateur à Cornebarrieu.
Téléphone : 06 23 03 00 24
Site web : https://eliteanimation.com/
Note Google : 5/5 (48 avis)
Google Maps : https://maps.google.com/?cid=9079892896170589695&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d7d$, true, 43.6397273, 1.3128473, $d7a$62 Rte de Pibrac$d7a$, $d7c$Cornebarrieu$d7c$, $d7p$31700$d7p$, $d7g$ChIJ5-qI-8yxrhIR_z3XUntCAn4$d7g$, 5.0, 48, $d7s$Animateur$d7s$),
  ($d8n$FLAMINGO Animations, fêtes à domicile pour enfants$d8n$, $d8d$Activités à Toulouse.
Téléphone : 06 37 59 01 30
Site web : http://www.flamingoanimations.fr/
Note Google : 4.9/5 (19 avis)
Google Maps : https://maps.google.com/?cid=14191380773119860847&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d8d$, true, 43.60190120000001, 1.4490759, $d8a$5 Rue Renée Aspe$d8a$, $d8c$Toulouse$d8c$, $d8p$31000$d8p$, $d8g$ChIJLd-WDpu8rhIRbyAevp_p8cQ$d8g$, 4.9, 19, $d8s$Activités$d8s$),
  ($d9n$Florian Gareau Magicien$d9n$, $d9d$Magicien à Toulouse.
Téléphone : 06 28 41 72 41
Site web : https://www.florian-gareau.com/
Note Google : 5/5 (283 avis)
Google Maps : https://maps.google.com/?cid=7671192556633246215&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d9d$, true, 43.6093364, 1.4501334, $d9a$33 Rue de Stalingrad$d9a$, $d9c$Toulouse$d9c$, $d9p$31000$d9p$, $d9g$ChIJ1WayE70IJ2QRB8q-jfyMdWo$d9g$, 5.0, 283, $d9s$Magicien$d9s$),
  ($d10n$Granraf le Magicien$d10n$, $d10d$Magicien à Tournefeuille.
Téléphone : 06 24 51 81 42
Site web : http://www.granraf.com/
Note Google : 5/5 (19 avis)
Google Maps : https://maps.google.com/?cid=16146358324206280454&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d10d$, true, 43.5829862, 1.3289809, $d10a$11 Rue de la Camargue$d10a$, $d10c$Tournefeuille$d10c$, $d10p$31170$d10p$, $d10g$ChIJ-0-GFv2wrhIRBp98SlljE-A$d10g$, 5.0, 19, $d10s$Magicien$d10s$),
  ($d11n$Ibtissem Danseuse Orientale$d11n$, $d11d$Spectacles à Toulouse.
Téléphone : 06 33 32 71 97
Site web : https://danse-orientale-toulouse.fr/
Note Google : 5/5 (64 avis)
Google Maps : https://maps.google.com/?cid=11210419618553473273&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d11d$, true, 43.60648, 1.4447902000000001, $d11a$38 Rue Charles de Rémusat$d11a$, $d11c$Toulouse$d11c$, $d11p$31000$d11p$, $d11g$ChIJa3qlPp68rhIR-Sjzaj9pk5s$d11g$, 5.0, 64, $d11s$Spectacles$d11s$),
  ($d12n$Id2 Loisirs animations ludiques sportives et jeux interactifs$d12n$, $d12d$Jeux et quiz à Fontenilles.
Téléphone : 06 09 39 56 95
Site web : http://www.id2loisirs.fr/
Note Google : 4.9/5 (30 avis)
Google Maps : https://maps.google.com/?cid=3724049262495110988&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d12d$, true, 43.5589379, 1.1747542, $d12a$2 bis Av. de Gascogne$d12a$, $d12c$Fontenilles$d12c$, $d12p$31470$d12p$, $d12g$ChIJfTNqFGO6rhIRTJcTyRJ7rjM$d12g$, 4.9, 30, $d12s$Jeux & quiz$d12s$),
  ($d13n$Jay’magicien$d13n$, $d13d$Magicien à Toulouse.
Téléphone : 07 83 30 02 52
Site web : https://www.jaymagicien.com/
Note Google : 5/5 (29 avis)
Google Maps : https://maps.google.com/?cid=3502431117965468390&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d13d$, true, 43.5754465, 1.4846313999999998, $d13a$Rue Emile Lecrivain$d13a$, $d13c$Toulouse$d13c$, $d13p$31400$d13p$, $d13g$ChIJlwGx66W9rhIR5iKbjIsimzA$d13g$, 5.0, 29, $d13s$Magicien$d13s$),
  ($d14n$L'Art Du Oui Danse - Chorégraphe Toulouse$d14n$, $d14d$Spectacles à Toulouse.
Téléphone : 07 81 90 90 15
Site web : https://www.lartduoui.fr/
Note Google : 5/5 (9 avis)
Google Maps : https://maps.google.com/?cid=4600075101917458979&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d14d$, true, 43.5979272, 1.4441332, $d14a$42 Rue des Polinaires$d14a$, $d14c$Toulouse$d14c$, $d14p$31000$d14p$, $d14g$ChIJL2Dmb829rhIRI7Lo1e6_1j8$d14g$, 5.0, 9, $d14s$Spectacles$d14s$),
  ($d15n$La Chorégraphe des Mariés$d15n$, $d15d$Spectacles à Toulouse.
Téléphone : 06 87 00 95 38
Site web : https://www.lachoregraphedesmaries.com/
Note Google : 5/5 (93 avis)
Google Maps : https://maps.google.com/?cid=3604546480240283351&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d15d$, true, 43.597700200000006, 1.4441581, $d15a$9 Pl. des Carmes$d15a$, $d15c$Toulouse$d15c$, $d15p$31000$d15p$, $d15g$ChIJGT1ZnvexrhIR104bE-3rBTI$d15g$, 5.0, 93, $d15s$Spectacles$d15s$),
  ($d16n$Les Anims & Ateliers de Claire, AdC Event.$d16n$, $d16d$Animateur à Aussonne.
Téléphone : 06 10 71 80 61
Site web : http://www.lesateliersdeclaire.com/
Note Google : 4.4/5 (5 avis)
Google Maps : https://maps.google.com/?cid=334148923406857472&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d16d$, true, 43.688390999999996, 1.3316923999999999, $d16a$12 Lot. les Épicéas$d16a$, $d16c$Aussonne$d16c$, $d16p$31840$d16p$, $d16g$ChIJ98lNkyGvrhIRALW-6awiowQ$d16g$, 4.4, 5, $d16s$Animateur$d16s$),
  ($d17n$Les Savants Fous Toulouse$d17n$, $d17d$Spectacles à Tournefeuille.
Téléphone : 06 38 74 09 44
Site web : https://www.lessavantsfous.fr/contact-toulouse.html?utm_source=Google&utm_medium=MyBusiness
Note Google : 4.9/5 (64 avis)
Google Maps : https://maps.google.com/?cid=17040039056769893486&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d17d$, true, 43.5614704, 1.3524625, $d17a$3 Chem. de Bordenoire$d17a$, $d17c$Tournefeuille$d17c$, $d17p$31170$d17p$, $d17g$ChIJe9tAem5-rhIRbkSNeT1heuw$d17g$, 4.9, 64, $d17s$Spectacles$d17s$),
  ($d18n$Lucas Nolan Magicien Toulouse$d18n$, $d18d$Magicien à Toulouse.
Téléphone : 06 84 68 88 44
Site web : https://www.magicien-mentaliste-toulouse.com/
Note Google : 5/5 (564 avis)
Google Maps : https://maps.google.com/?cid=9431647674061415032&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d18d$, true, 43.5836186, 1.3716161999999998, $d18a$16 Chem. Ferro-Lebres$d18a$, $d18c$Toulouse$d18c$, $d18p$31100$d18p$, $d18g$ChIJyd12lPa7rhIReOIRq5bx44I$d18g$, 5.0, 564, $d18s$Magicien$d18s$),
  ($d19n$Magicien Gabko$d19n$, $d19d$Magicien à Ramonville-Saint-Agne.
Téléphone : 06 83 13 86 96
Site web : http://magicien-gabko.fr/
Note Google : 5/5 (3 avis)
Google Maps : https://maps.google.com/?cid=3464946263024098126&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d19d$, true, 43.544480899999996, 1.47899, $d19a$$d19a$, $d19c$Ramonville-Saint-Agne$d19c$, $d19p$31520$d19p$, $d19g$ChIJJe818Ia-rhIRTltepUT2FTA$d19g$, 5.0, 3, $d19s$Magicien$d19s$),
  ($d20n$Magicien Toulouse$d20n$, $d20d$Magicien à Toulouse.
Téléphone : 06 59 40 98 44
Site web : https://www.toulouse-magicien.fr/contact/
Google Maps : https://maps.google.com/?cid=2532333146859473947&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d20d$, true, 43.6520444, 1.4318597, $d20a$281 Av. de Fronton$d20a$, $d20c$Toulouse$d20c$, $d20p$31200$d20p$, $d20g$ChIJyd53L5ekrhIRG4yBh5SnJCM$d20g$, 0, 0, $d20s$Magicien$d20s$),
  ($d21n$Magicien Toulouse Magic lucky$d21n$, $d21d$Magicien à Toulouse.
Téléphone : 06 14 71 04 16
Site web : https://www.toulousemagicien.com/?utm_source=google&utm_medium=wix_google_business_profile&utm_campaign=7838341807769837149
Google Maps : https://maps.google.com/?cid=11509532216659185919&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d21d$, true, 43.577945400000004, 1.4055412999999999, $d21a$1 All. Antonio Machado$d21a$, $d21c$Toulouse$d21c$, $d21p$31100$d21p$, $d21g$ChIJP3TnlO67rhIR_5DiKJISup8$d21g$, 0, 0, $d21s$Magicien$d21s$),
  ($d22n$Murder Party Haute Garonne - Mortelle Soirée$d22n$, $d22d$Jeux et quiz à Montastruc-la-Conseillère.
Téléphone : 06 82 19 02 08
Site web : http://www.mortellesoiree.com/
Note Google : 5/5 (4 avis)
Google Maps : https://maps.google.com/?cid=6367775258784599835&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d22d$, true, 43.7214885, 1.5890707, $d22a$23 Chem. Vert$d22a$, $d22c$Montastruc-la-Conseillère$d22c$, $d22p$31380$d22p$, $d22g$ChIJpWpPuqKerhIRG49gJdzhXlg$d22g$, 5.0, 4, $d22s$Jeux & quiz$d22s$),
  ($d23n$Quentin : Animateur Présentateur Micro Événementiel Toulouse et Occitanie$d23n$, $d23d$Animateur à Toulouse.
Téléphone : 06 29 31 20 25
Note Google : 5/5 (17 avis)
Google Maps : https://maps.google.com/?cid=5614483573138760483&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d23d$, true, 43.607005099999995, 1.4513435, $d23a$54 All. Jean Jaurès$d23a$, $d23c$Toulouse$d23c$, $d23p$31000$d23p$, $d23g$ChIJPa2ayX68rhIRI6MzHhCn6k0$d23g$, 5.0, 17, $d23s$Animateur$d23s$),
  ($d24n$Remi Ladore Magicien Toulouse$d24n$, $d24d$Magicien à Toulouse.
Téléphone : 06 59 40 98 44
Site web : https://www.toulouse-magicien.fr/
Note Google : 5/5 (249 avis)
Google Maps : https://maps.google.com/?cid=6866703892897388328&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d24d$, true, 43.625937, 1.445036, $d24a$76 Rue Pierre Cazeneuve$d24a$, $d24c$Toulouse$d24c$, $d24p$31200$d24p$, $d24g$ChIJN5UvTqq8rhIRKNfwKc9uS18$d24g$, 5.0, 249, $d24s$Magicien$d24s$),
  ($d25n$Robin Z'Kat Magicien, Illusionniste à Toulouse et en région Occitanie$d25n$, $d25d$Magicien à Toulouse.
Téléphone : 06 30 49 36 72
Site web : http://robinmagicien.com/
Note Google : 5/5 (38 avis)
Google Maps : https://maps.google.com/?cid=14760505501005308247&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d25d$, true, 43.621484099999996, 1.4333039, $d25a$87 Rue du Général Bourbaki$d25a$, $d25c$Toulouse$d25c$, $d25p$31200$d25p$, $d25g$ChIJM46vK7XD9EcRV-GedIzZ18w$d25g$, 5.0, 38, $d25s$Magicien$d25s$),
  ($d26n$Romi Magicien$d26n$, $d26d$Magicien à Toulouse.
Téléphone : 06 07 81 03 15
Site web : https://romi-magicien.fr/
Note Google : 5/5 (95 avis)
Google Maps : https://maps.google.com/?cid=6194377163077754825&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d26d$, true, 43.5786435, 1.4876802999999998, $d26a$14 Rue de Garin$d26a$, $d26c$Toulouse$d26c$, $d26p$31500$d26p$, $d26g$ChIJM_LFnXi9rhIRyZ8K6jXZ9lU$d26g$, 5.0, 95, $d26s$Magicien$d26s$),
  ($d27n$Spectacles et animations cirque et magie$d27n$, $d27d$Magicien à Toulouse.
Téléphone : 07 66 59 97 63
Site web : http://www.spectacles-animations.fr/
Note Google : 5/5 (1 avis)
Google Maps : https://maps.google.com/?cid=13543874686716043257&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d27d$, true, 43.6167259, 1.4549086999999998, $d27a$5 Rue Arago$d27a$, $d27c$Toulouse$d27c$, $d27p$31500$d27p$, $d27g$ChIJHYpuKwC9rhIR-V8d4ESC9bs$d27g$, 5.0, 1, $d27s$Magicien$d27s$),
  ($d28n$Stephane Damour | Magicien - Mentaliste$d28n$, $d28d$Magicien à Castanet-Tolosan.
Téléphone : 06 26 29 34 74
Site web : https://stephane-damour.fr/
Note Google : 5/5 (16 avis)
Google Maps : https://maps.google.com/?cid=7791288104990000874&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d28d$, true, 43.5130353, 1.5116344, $d28a$1 Av. Se Canto villa 4$d28a$, $d28c$Castanet-Tolosan$d28c$, $d28p$31320$d28p$, $d28g$ChIJSxR2D1LswkcR6sanYEA3IGw$d28g$, 5.0, 16, $d28s$Magicien$d28s$),
  ($d29n$Thomas le Magicien$d29n$, $d29d$Magicien à Toulouse.
Téléphone : 06 74 34 59 82
Site web : https://www.magie-mentalisme.com/
Google Maps : https://maps.google.com/?cid=4947618484478415098&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d29d$, true, 43.6004957, 1.4349017, $d29a$37 Rue Charles Viguerie$d29a$, $d29c$Toulouse$d29c$, $d29p$31300$d29p$, $d29g$ChIJNVKnEPS7rhIR-hB-S8x4qUQ$d29g$, 0, 0, $d29s$Magicien$d29s$),
  ($d30n$Tonio Animation$d30n$, $d30d$Animateur à Portet-sur-Garonne.
Téléphone : 06 08 04 15 80
Note Google : 5/5 (4 avis)
Google Maps : https://maps.google.com/?cid=3640044919564273927&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d30d$, true, 43.540943899999995, 1.4040641, $d30a$12 Chemin des Palanques N$d30a$, $d30c$Portet-sur-Garonne$d30c$, $d30p$31120$d30p$, $d30g$ChIJjSIZax-5rhIRBwkYjZEJhDI$d30g$, 5.0, 4, $d30s$Animateur$d30s$),
  ($d31n$animation mariage Toulouse$d31n$, $d31d$Animateur à Muret.
Téléphone : 06 09 13 04 39
Note Google : 3/5 (2 avis)
Google Maps : https://maps.google.com/?cid=14360174303733193669&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d31d$, true, 43.445433, 1.338274, $d31a$Rte d'Eaunes$d31a$, $d31c$Muret$d31c$, $d31p$31600$d31p$, $d31g$ChIJx0TedGzIrhIRxZu1HnKWScc$d31g$, 3.0, 2, $d31s$Animateur$d31s$),
  ($d32n$clown pom$d32n$, $d32d$Spectacles à Toulouse.
Téléphone : 06 27 26 00 18
Site web : http://koikadi-theatre-clown.fr/
Google Maps : https://maps.google.com/?cid=9399720137615645086&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d32d$, true, 43.6185866, 1.4570064999999999, $d32a$3 Rue Albert Sorel$d32a$, $d32c$Toulouse$d32c$, $d32p$31500$d32p$, $d32g$ChIJPfhCdbq8rhIRnpmqzqmDcoI$d32g$, 0, 0, $d32s$Spectacles$d32s$),
  ($d33n$jean luc magie$d33n$, $d33d$Magicien à Canohès.
Téléphone : 06 76 86 77 26
Site web : https://www.jlmagie.com/
Note Google : 5/5 (125 avis)
Google Maps : https://maps.google.com/?cid=6249176984278808398&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d33d$, true, 42.6439052, 2.8379019, $d33a$7 Imp. du Peric$d33a$, $d33c$Canohès$d33c$, $d33p$66680$d33p$, $d33g$ChIJa2IkBgJvsBIRTjd8jluJuVY$d33g$, 5.0, 125, $d33s$Magicien$d33s$)
) as v(
  name,
  description,
  published,
  latitude,
  longitude,
  address,
  city,
  postal_code,
  google_place_id,
  rating,
  review_count,
  sub_category
)
join public.craftsmans as craftsman
  on craftsman.google_place_id = v.google_place_id
join public.sub_categories_translations as translation
  on translation.language_code = 'fr'
 and translation.name = v.sub_category
join public.sub_categories as sub_category
  on sub_category.id = translation.sub_category_id
where not exists (
  select 1
  from public.craftsmans_sub_category link
  where link.craftsman_id = craftsman.id
    and link.sub_category_id = sub_category.id
);

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
    where google_place_id in ($d0id$ChIJj7f2FVS7rhIReMf3T7LpnyM$d0id$, $d1id$ChIJB0YF9hT9VEoRokbZlBLmHoQ$d1id$, $d2id$ChIJ6wnV_I5Ol6IR1PQsAv5XWws$d2id$, $d3id$ChIJxS731AO7rhIR3bpM9bx_yn4$d3id$, $d4id$ChIJtZZe51Zpp20RkxpDm_VOjEA$d4id$, $d5id$ChIJ-d8VcuIlqRIRjnKr3D0i1gg$d5id$, $d6id$ChIJV_FpuPK7rhIRC_vujJgkA-8$d6id$, $d7id$ChIJ5-qI-8yxrhIR_z3XUntCAn4$d7id$, $d8id$ChIJLd-WDpu8rhIRbyAevp_p8cQ$d8id$, $d9id$ChIJ1WayE70IJ2QRB8q-jfyMdWo$d9id$, $d10id$ChIJ-0-GFv2wrhIRBp98SlljE-A$d10id$, $d11id$ChIJa3qlPp68rhIR-Sjzaj9pk5s$d11id$, $d12id$ChIJfTNqFGO6rhIRTJcTyRJ7rjM$d12id$, $d13id$ChIJlwGx66W9rhIR5iKbjIsimzA$d13id$, $d14id$ChIJL2Dmb829rhIRI7Lo1e6_1j8$d14id$, $d15id$ChIJGT1ZnvexrhIR104bE-3rBTI$d15id$, $d16id$ChIJ98lNkyGvrhIRALW-6awiowQ$d16id$, $d17id$ChIJe9tAem5-rhIRbkSNeT1heuw$d17id$, $d18id$ChIJyd12lPa7rhIReOIRq5bx44I$d18id$, $d19id$ChIJJe818Ia-rhIRTltepUT2FTA$d19id$, $d20id$ChIJyd53L5ekrhIRG4yBh5SnJCM$d20id$, $d21id$ChIJP3TnlO67rhIR_5DiKJISup8$d21id$, $d22id$ChIJpWpPuqKerhIRG49gJdzhXlg$d22id$, $d23id$ChIJPa2ayX68rhIRI6MzHhCn6k0$d23id$, $d24id$ChIJN5UvTqq8rhIRKNfwKc9uS18$d24id$, $d25id$ChIJM46vK7XD9EcRV-GedIzZ18w$d25id$, $d26id$ChIJM_LFnXi9rhIRyZ8K6jXZ9lU$d26id$, $d27id$ChIJHYpuKwC9rhIR-V8d4ESC9bs$d27id$, $d28id$ChIJSxR2D1LswkcR6sanYEA3IGw$d28id$, $d29id$ChIJNVKnEPS7rhIR-hB-S8x4qUQ$d29id$, $d30id$ChIJjSIZax-5rhIRBwkYjZEJhDI$d30id$, $d31id$ChIJx0TedGzIrhIRxZu1HnKWScc$d31id$, $d32id$ChIJPfhCdbq8rhIRnpmqzqmDcoI$d32id$, $d33id$ChIJa2IkBgJvsBIRTjd8jluJuVY$d33id$)
      and latitude is not null
      and longitude is not null
      and location is null;
  elsif location_type like 'geometry%' then
    update public.craftsmans
    set location = ST_SetSRID(ST_MakePoint(longitude, latitude), 4326)
    where google_place_id in ($d0id$ChIJj7f2FVS7rhIReMf3T7LpnyM$d0id$, $d1id$ChIJB0YF9hT9VEoRokbZlBLmHoQ$d1id$, $d2id$ChIJ6wnV_I5Ol6IR1PQsAv5XWws$d2id$, $d3id$ChIJxS731AO7rhIR3bpM9bx_yn4$d3id$, $d4id$ChIJtZZe51Zpp20RkxpDm_VOjEA$d4id$, $d5id$ChIJ-d8VcuIlqRIRjnKr3D0i1gg$d5id$, $d6id$ChIJV_FpuPK7rhIRC_vujJgkA-8$d6id$, $d7id$ChIJ5-qI-8yxrhIR_z3XUntCAn4$d7id$, $d8id$ChIJLd-WDpu8rhIRbyAevp_p8cQ$d8id$, $d9id$ChIJ1WayE70IJ2QRB8q-jfyMdWo$d9id$, $d10id$ChIJ-0-GFv2wrhIRBp98SlljE-A$d10id$, $d11id$ChIJa3qlPp68rhIR-Sjzaj9pk5s$d11id$, $d12id$ChIJfTNqFGO6rhIRTJcTyRJ7rjM$d12id$, $d13id$ChIJlwGx66W9rhIR5iKbjIsimzA$d13id$, $d14id$ChIJL2Dmb829rhIRI7Lo1e6_1j8$d14id$, $d15id$ChIJGT1ZnvexrhIR104bE-3rBTI$d15id$, $d16id$ChIJ98lNkyGvrhIRALW-6awiowQ$d16id$, $d17id$ChIJe9tAem5-rhIRbkSNeT1heuw$d17id$, $d18id$ChIJyd12lPa7rhIReOIRq5bx44I$d18id$, $d19id$ChIJJe818Ia-rhIRTltepUT2FTA$d19id$, $d20id$ChIJyd53L5ekrhIRG4yBh5SnJCM$d20id$, $d21id$ChIJP3TnlO67rhIR_5DiKJISup8$d21id$, $d22id$ChIJpWpPuqKerhIRG49gJdzhXlg$d22id$, $d23id$ChIJPa2ayX68rhIRI6MzHhCn6k0$d23id$, $d24id$ChIJN5UvTqq8rhIRKNfwKc9uS18$d24id$, $d25id$ChIJM46vK7XD9EcRV-GedIzZ18w$d25id$, $d26id$ChIJM_LFnXi9rhIRyZ8K6jXZ9lU$d26id$, $d27id$ChIJHYpuKwC9rhIR-V8d4ESC9bs$d27id$, $d28id$ChIJSxR2D1LswkcR6sanYEA3IGw$d28id$, $d29id$ChIJNVKnEPS7rhIR-hB-S8x4qUQ$d29id$, $d30id$ChIJjSIZax-5rhIRBwkYjZEJhDI$d30id$, $d31id$ChIJx0TedGzIrhIRxZu1HnKWScc$d31id$, $d32id$ChIJPfhCdbq8rhIRnpmqzqmDcoI$d32id$, $d33id$ChIJa2IkBgJvsBIRTjd8jluJuVY$d33id$)
      and latitude is not null
      and longitude is not null
      and location is null;
  end if;
end $$;
