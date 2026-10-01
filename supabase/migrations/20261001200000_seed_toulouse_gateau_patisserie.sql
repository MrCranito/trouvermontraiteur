-- Seed event cake and pastry makers around Toulouse.
-- Only these google_place_id values are linked to Gâteau & Pâtisserie subcategories.

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
  ($d0n$Art de Patisser$d0n$, $d0d$Pâtissier événementiel à Toulouse.
Téléphone : 05 62 75 57 26
Site web : https://www.artdepatisser.com/
Note Google : 5/5 (201 avis)
Google Maps : https://maps.google.com/?cid=3759409269329933507&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d0d$, true, 43.60543, 1.4461498, $d0a$3 Rue Caussette$d0a$, $d0c$Toulouse$d0c$, $d0p$31000$d0p$, $d0g$ChIJbxbMDbG9rhIRw7S4788aLDQ$d0g$, 5.0, 201, $d0s$Gâteau événementiel$d0s$),
  ($d1n$Artisan Boulanger Pâtissier "La Grignette"$d1n$, $d1d$Pièce montée à Toulouse.
Téléphone : 05 61 07 52 71
Site web : https://www.facebook.com/LaGrignetteEricetNatasha/
Note Google : 4.7/5 (290 avis)
Google Maps : https://maps.google.com/?cid=643300939721099029&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d1d$, true, 43.5575841, 1.3801687, $d1a$6 Rue Règuelongue$d1a$, $d1c$Toulouse$d1c$, $d1p$31100$d1p$, $d1g$ChIJn-XJDWK6rhIRFUfA28t27Qg$d1g$, 4.7, 290, $d1s$Pièce montée$d1s$),
  ($d2n$Artisan Traiteur Toulouse$d2n$, $d2d$Pâtissier événementiel à Toulouse.
Téléphone : 06 60 52 06 48
Site web : https://www.artisan-traiteur-toulouse.com/
Note Google : 4.7/5 (144 avis)
Google Maps : https://maps.google.com/?cid=4098027804351548142&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d2d$, true, 43.6096353, 1.4516381, $d2a$Rue Bertrand de Born$d2a$, $d2c$Toulouse$d2c$, $d2p$31000$d2p$, $d2g$ChIJoQuQ5Ze8rhIR7koMZpMe3zg$d2g$, 4.7, 144, $d2s$Gâteau événementiel$d2s$),
  ($d3n$Au Pain de mon Grand-Père$d3n$, $d3d$Pièce montée à Toulouse.
Téléphone : 05 62 80 99 90
Site web : http://www.aupaindemongrandpere.com/
Note Google : 4.4/5 (579 avis)
Google Maps : https://maps.google.com/?cid=3640533264598471553&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d3d$, true, 43.578990999999995, 1.4841924, $d3a$237 Av. Antoine de Saint-Exupéry$d3a$, $d3c$Toulouse$d3c$, $d3p$31400$d3p$, $d3g$ChIJb8L59LK9rhIRgZNiPbfFhTI$d3g$, 4.4, 579, $d3s$Pièce montée$d3s$),
  ($d4n$Au Poussin Bleu$d4n$, $d4d$Pâtissier événementiel à Toulouse.
Téléphone : 05 61 52 01 70
Site web : https://aupoussinbleu.fr/
Note Google : 4.2/5 (637 avis)
Google Maps : https://maps.google.com/?cid=11686510608447366003&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d4d$, true, 43.5989007, 1.4453312999999999, $d4a$45 Rue du Languedoc$d4a$, $d4c$Toulouse$d4c$, $d4p$31000$d4p$, $d4g$ChIJBY6Y3YK8rhIRc-NWCHvTLqI$d4g$, 4.2, 637, $d4s$Gâteau événementiel$d4s$),
  ($d5n$Au Poussin Rose$d5n$, $d5d$Pâtissier événementiel à Toulouse.
Téléphone : 05 61 62 58 37
Site web : https://aupoussinrose.fr/
Note Google : 4.6/5 (358 avis)
Google Maps : https://maps.google.com/?cid=7374981101799770163&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d5d$, true, 43.6088954, 1.4480355, $d5a$22 Rue de Bayard$d5a$, $d5c$Toulouse$d5c$, $d5p$31000$d5p$, $d5g$ChIJrSc9VJ-8rhIRM4j-3TwyWWY$d5g$, 4.6, 358, $d5s$Gâteau événementiel$d5s$),
  ($d6n$Aux Petits Fours, Pâtisserie Saint-Criq$d6n$, $d6d$Wedding cake à Toulouse.
Téléphone : 05 61 49 35 07
Site web : http://www.patisserie-saint-criq-toulouse.fr/
Note Google : 4/5 (906 avis)
Google Maps : https://maps.google.com/?cid=667817970865771228&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d6d$, true, 43.596706, 1.422744, $d6a$7 Pl. de la Patte d'Oie$d6a$, $d6c$Toulouse$d6c$, $d6p$31300$d6p$, $d6g$ChIJQ_znwQy7rhIR3JITAOiQRAk$d6g$, 4.0, 906, $d6s$Wedding cake$d6s$),
  ($d7n$BO délices$d7n$, $d7d$Wedding cake à Toulouse.
Note Google : 4.8/5 (81 avis)
Google Maps : https://maps.google.com/?cid=11698924186314520113&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d7d$, true, 43.5797455, 1.4499952, $d7a$70 Av. de l'U.R.S.S.$d7a$, $d7c$Toulouse$d7c$, $d7p$31400$d7p$, $d7g$ChIJVdhqeTq9rhIRMbaAW5DtWqI$d7g$, 4.8, 81, $d7s$Wedding cake$d7s$),
  ($d8n$Bapz salon de thé$d8n$, $d8d$Pâtissier événementiel à Toulouse.
Téléphone : 05 61 23 06 63
Site web : http://www.bapz.fr/
Note Google : 4.6/5 (1519 avis)
Google Maps : https://maps.google.com/?cid=15004475874446210328&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d8d$, true, 43.600609999999996, 1.442319, $d8a$13 Rue de la Bourse$d8a$, $d8c$Toulouse$d8c$, $d8p$31000$d8p$, $d8g$ChIJ336pv2K7rhIRGPVIiU-bOtA$d8g$, 4.6, 1519, $d8s$Gâteau événementiel$d8s$),
  ($d9n$Bergo$d9n$, $d9d$Pièce montée à Tournefeuille.
Téléphone : 05 61 07 09 57
Site web : http://www.patisseriebergo.fr/
Note Google : 4.8/5 (234 avis)
Google Maps : https://maps.google.com/?cid=10289319408947327608&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d9d$, true, 43.584123399999996, 1.3466352, $d9a$87 Rue Gaston Doumergue$d9a$, $d9c$Tournefeuille$d9c$, $d9p$31170$d9p$, $d9g$ChIJTeygJfOwrhIReHLWvnwBy44$d9g$, 4.8, 234, $d9s$Pièce montée$d9s$),
  ($d10n$Besties Bakery Toulouse$d10n$, $d10d$Pâtissier événementiel à Toulouse.
Téléphone : 09 86 60 78 90
Site web : https://bestiesbakery.fr/toulouse
Note Google : 4.4/5 (318 avis)
Google Maps : https://maps.google.com/?cid=16808007156828124110&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d10d$, true, 43.600901199999996, 1.4439031999999998, $d10a$16 Rue des Changes$d10a$, $d10c$Toulouse$d10c$, $d10p$31000$d10p$, $d10g$ChIJSbsVWkO9rhIRzrP23HQJQuk$d10g$, 4.4, 318, $d10s$Gâteau événementiel$d10s$),
  ($d11n$Bimbiz Food$d11n$, $d11d$Pâtissier événementiel à Toulouse.
Téléphone : 06 11 57 24 77
Site web : https://www.bimbiz-food.com/
Note Google : 4.9/5 (280 avis)
Google Maps : https://maps.google.com/?cid=8445339914862053047&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d11d$, true, 43.604442, 1.4439161999999999, $d11a$Pl. du Capitole$d11a$, $d11c$Toulouse$d11c$, $d11p$31000$d11p$, $d11g$ChIJoTqrX129rhIRt8bHQOjfM3U$d11g$, 4.9, 280, $d11s$Gâteau événementiel$d11s$),
  ($d12n$Boulangerie / Pâtisserie Mirarosa$d12n$, $d12d$Pâtissier événementiel à Toulouse.
Téléphone : 05 34 46 59 75
Site web : http://www.mirarosa.fr/
Note Google : 4.6/5 (377 avis)
Google Maps : https://maps.google.com/?cid=12252177243534374862&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d12d$, true, 43.587734600000005, 1.4464204999999999, $d12a$65 Gd Rue Saint-Michel$d12a$, $d12c$Toulouse$d12c$, $d12p$31400$d12p$, $d12g$ChIJp42hucK7rhIRzrf9xUl6CKo$d12g$, 4.6, 377, $d12s$Gâteau événementiel$d12s$),
  ($d13n$Boulangerie Pâtisserie "Cyprien"$d13n$, $d13d$Wedding cake à Toulouse.
Téléphone : 05 34 51 06 60
Site web : http://boulangerie-cyprien.fr/
Note Google : 4.6/5 (898 avis)
Google Maps : https://maps.google.com/?cid=9011403559026157736&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d13d$, true, 43.598257, 1.432544, $d13a$55 Rue de la République$d13a$, $d13c$Toulouse$d13c$, $d13p$31300$d13p$, $d13g$ChIJq6oeQnC7rhIRqOhx38rvDn0$d13g$, 4.6, 898, $d13s$Wedding cake$d13s$),
  ($d14n$Boulangerie Pâtisserie "Cyprien"$d14n$, $d14d$Wedding cake à Toulouse.
Téléphone : 05 34 57 20 09
Site web : http://boulangerie-cyprien.fr/
Note Google : 4.5/5 (82 avis)
Google Maps : https://maps.google.com/?cid=13802269739176787772&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d14d$, true, 43.5930501, 1.43393, $d14a$7 Pl. du Fer À Cheval$d14a$, $d14c$Toulouse$d14c$, $d14p$31300$d14p$, $d14g$ChIJuzRTYQC7rhIRPH_BQTODi78$d14g$, 4.5, 82, $d14s$Wedding cake$d14s$),
  ($d15n$Boulangerie Pâtisserie MAGDA$d15n$, $d15d$Wedding cake à Toulouse.
Téléphone : 05 64 72 34 49
Note Google : 4.6/5 (79 avis)
Google Maps : https://maps.google.com/?cid=8749615856845733467&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d15d$, true, 43.590942299999995, 1.4692522, $d15a$154 Av. Jean Rieux$d15a$, $d15c$Toulouse$d15c$, $d15p$31500$d15p$, $d15g$ChIJ-0OlQsG9rhIRWz5qrEPhbHk$d15g$, 4.6, 79, $d15s$Wedding cake$d15s$),
  ($d16n$Boulangerie Pâtisserie MAGDA$d16n$, $d16d$Pièce montée à Toulouse.
Téléphone : 09 83 22 37 68
Site web : https://www.facebook.com/Boulangerie-Patisserie-Magda-101508834927023/
Note Google : 4.4/5 (197 avis)
Google Maps : https://maps.google.com/?cid=4814150912260718067&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d16d$, true, 43.5850359, 1.4668915, $d16a$86 Av. Antoine de Saint-Exupéry$d16a$, $d16c$Toulouse$d16c$, $d16p$31400$d16p$, $d16g$ChIJ88tDKH-9rhIR8z1sjL9Mz0I$d16g$, 4.4, 197, $d16s$Pièce montée$d16s$),
  ($d17n$Boulangerie Saint Sauveur$d17n$, $d17d$Pièce montée à Toulouse.
Téléphone : 05 61 52 89 23
Note Google : 4.3/5 (276 avis)
Google Maps : https://maps.google.com/?cid=2950428291326008059&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d17d$, true, 43.594018000000005, 1.4560089999999999, $d17a$37 All. des Soupirs$d17a$, $d17c$Toulouse$d17c$, $d17p$31000$d17p$, $d17g$ChIJPXUOL4m8rhIR-9q_H-YG8ig$d17g$, 4.3, 276, $d17s$Pièce montée$d17s$),
  ($d18n$Boulangerie Saint Sernin$d18n$, $d18d$Pâtisserie personnalisée à Toulouse.
Note Google : 4.8/5 (167 avis)
Google Maps : https://maps.google.com/?cid=7625766606975604089&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d18d$, true, 43.607753699999996, 1.4420431000000002, $d18a$64 Rue du Taur$d18a$, $d18c$Toulouse$d18c$, $d18p$31000$d18p$, $d18g$ChIJoTDQRmC7rhIReRXRdFMq1Gk$d18g$, 4.8, 167, $d18s$Pâtisserie personnalisée$d18s$),
  ($d19n$Boulangerie Terra Maïr Saint-Georges$d19n$, $d19d$Wedding cake à Toulouse.
Téléphone : 05 64 72 13 19
Site web : https://www.terramair.com/
Note Google : 4.8/5 (53 avis)
Google Maps : https://maps.google.com/?cid=9672783631807793820&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d19d$, true, 43.601075099999996, 1.4483684, $d19a$6 R. d'Astorg$d19a$, $d19c$Toulouse$d19c$, $d19p$31000$d19p$, $d19g$ChIJr2Ggi829rhIRnMod63ahPIY$d19g$, 4.8, 53, $d19s$Wedding cake$d19s$),
  ($d20n$Boulangerie de la Cartoucherie$d20n$, $d20d$Pièce montée à Toulouse.
Téléphone : 05 61 72 51 16
Site web : https://boulangerie-de-la-cartoucherie.eatbu.com/
Note Google : 3/5 (184 avis)
Google Maps : https://maps.google.com/?cid=11280510986374520861&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d20d$, true, 43.6020013, 1.4080544, $d20a$1 Place de la Charte des Libertés Communales$d20a$, $d20c$Toulouse$d20c$, $d20p$31300$d20p$, $d20g$ChIJD1m5Vuq7rhIRHaC-s_lsjJw$d20g$, 3.0, 184, $d20s$Pièce montée$d20s$),
  ($d21n$Cook Shop$d21n$, $d21d$Pâtissier événementiel à Portet-sur-Garonne.
Téléphone : 09 81 72 51 36
Site web : http://facebook.com/275863815896506?utm_source=gmb
Note Google : 4.4/5 (411 avis)
Google Maps : https://maps.google.com/?cid=2506514030254252112&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d21d$, true, 43.5297134, 1.4039352999999999, $d21a$3 Bd de l'Europe$d21a$, $d21c$Portet-sur-Garonne$d21c$, $d21p$31120$d21p$, $d21g$ChIJRY3wj6C5rhIRUGDW_TrtyCI$d21g$, 4.4, 411, $d21s$Gâteau événementiel$d21s$),
  ($d22n$Cours de cuisine Toulouse - Amis & Fines Herbes$d22n$, $d22d$Pâtissier événementiel à Toulouse.
Téléphone : 06 73 81 54 08
Site web : http://www.cook-meeting.fr/
Note Google : 5/5 (682 avis)
Google Maps : https://maps.google.com/?cid=8238977516898704858&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d22d$, true, 43.620081299999995, 1.4224503, $d22a$125 Chem. du Sang de Serp$d22a$, $d22c$Toulouse$d22c$, $d22p$31200$d22p$, $d22g$ChIJVzwkG7GkrhIR2l0tT2a6VnI$d22g$, 5.0, 682, $d22s$Gâteau événementiel$d22s$),
  ($d23n$Cours de pâtisserie — Johan — Toulouse$d23n$, $d23d$Wedding cake à Toulouse.
Téléphone : 07 69 44 50 11
Site web : https://cours-patisserie.fr/
Note Google : 4.7/5 (69 avis)
Google Maps : https://maps.google.com/?cid=8727256046276332843&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d23d$, true, 43.599497199999995, 1.4848909, $d23a$21 Rue Claudius Rougenet$d23a$, $d23c$Toulouse$d23c$, $d23p$31500$d23p$, $d23g$ChIJUS3t0Ry9rhIRK00uliJxHXk$d23g$, 4.7, 69, $d23s$Wedding cake$d23s$),
  ($d24n$Cyndie Benelli-Wedding Cake sur Mesure (Au pays de Cyndie)$d24n$, $d24d$Wedding cake à Lagarde.
Téléphone : 06 74 41 39 31
Site web : https://www.aupaysdecyndie.com/
Note Google : 5/5 (65 avis)
Google Maps : https://maps.google.com/?cid=4645559011285560629&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d24d$, true, 43.3457639, 1.7123070999999999, $d24a$139 Rue de la Prison$d24a$, $d24c$Lagarde$d24c$, $d24p$31290$d24p$, $d24g$ChIJcz7xqsmVrhIRNW3Kuk5XeEA$d24g$, 5.0, 65, $d24s$Wedding cake$d24s$),
  ($d25n$Dantras Maxime$d25n$, $d25d$Pâtissier événementiel à Toulouse.
Téléphone : 05 61 48 84 65
Site web : https://www.aubonquignon.com/
Note Google : 4.4/5 (272 avis)
Google Maps : https://maps.google.com/?cid=4521500383020794228&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d25d$, true, 43.6227778, 1.4619444, $d25a$76 Av. de Lavaur$d25a$, $d25c$Toulouse$d25c$, $d25p$31500$d25p$, $d25g$ChIJxTrCDba8rhIRdEG_daSYvz4$d25g$, 4.4, 272, $d25s$Gâteau événementiel$d25s$),
  ($d26n$DeVilmar$d26n$, $d26d$Wedding cake à Toulouse.
Téléphone : 05 62 80 62 11
Site web : https://www.instagram.com/devilmar_/
Note Google : 4.9/5 (593 avis)
Google Maps : https://maps.google.com/?cid=7584244648047796434&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d26d$, true, 43.605106000000006, 1.4421378000000002, $d26a$5 Rue des Lois$d26a$, $d26c$Toulouse$d26c$, $d26p$31000$d26p$, $d26g$ChIJOdbLl1m7rhIR0uCLCFOmQGk$d26g$, 4.9, 593, $d26s$Wedding cake$d26s$),
  ($d27n$Des Sens pâtisserie$d27n$, $d27d$Pâtissier événementiel à Toulouse.
Téléphone : 05 62 30 04 56
Note Google : 4.9/5 (180 avis)
Google Maps : https://maps.google.com/?cid=4352205683735877062&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d27d$, true, 43.6079607, 1.4491893999999998, $d27a$24 Rue Denfert Rochereau$d27a$, $d27c$Toulouse$d27c$, $d27p$31000$d27p$, $d27g$ChIJyxOdpaa9rhIRxlWDqAIkZjw$d27g$, 4.9, 180, $d27s$Gâteau événementiel$d27s$),
  ($d28n$Entremets - Pâtisserie Créative$d28n$, $d28d$Pâtissier événementiel à Toulouse.
Téléphone : 05 61 75 88 66
Site web : https://www.entremets-toulouse.fr/
Note Google : 4.9/5 (426 avis)
Google Maps : https://maps.google.com/?cid=13309813435040366189&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d28d$, true, 43.596094099999995, 1.4441456, $d28a$21 Rue Pharaon$d28a$, $d28c$Toulouse$d28c$, $d28p$31000$d28p$, $d28g$ChIJ-fBmcya9rhIRbX5N_sz0tbg$d28g$, 4.9, 426, $d28s$Gâteau événementiel$d28s$),
  ($d29n$Event Ewa Wedding Planner$d29n$, $d29d$Wedding cake à Toulouse.
Téléphone : 06 41 47 45 75
Site web : http://www.eventewa.com/
Note Google : 5/5 (109 avis)
Google Maps : https://maps.google.com/?cid=4750811451348019079&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d29d$, true, 43.6157666, 1.4496412, $d29a$27 Rue des Jumeaux$d29a$, $d29c$Toulouse$d29c$, $d29p$31200$d29p$, $d29g$ChIJARkbhmCjrhIRh-d0GNhF7kE$d29g$, 5.0, 109, $d29s$Wedding cake$d29s$),
  ($d30n$FLANFLAN$d30n$, $d30d$Pâtissier événementiel à Toulouse.
Note Google : 4.5/5 (346 avis)
Google Maps : https://maps.google.com/?cid=12902867539834092016&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d30d$, true, 43.6013205, 1.4451121999999998, $d30a$60 Rue des Tourneurs$d30a$, $d30c$Toulouse$d30c$, $d30p$31000$d30p$, $d30g$ChIJAQfeigi9rhIR8Lm6R6oxELM$d30g$, 4.5, 346, $d30s$Gâteau événementiel$d30s$),
  ($d31n$Flagrant Délice$d31n$, $d31d$Pâtissier événementiel à Toulouse.
Téléphone : 05 61 48 05 27
Site web : https://www.flagrant-delice.fr/
Note Google : 4.4/5 (451 avis)
Google Maps : https://maps.google.com/?cid=6678957813635015444&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d31d$, true, 43.6163388, 1.472953, $d31a$119 Rue Louis Plana$d31a$, $d31c$Toulouse$d31c$, $d31p$31000$d31p$, $d31g$ChIJF4Iw19q8rhIRFOOIr75ssFw$d31g$, 4.4, 451, $d31s$Gâteau événementiel$d31s$),
  ($d32n$Florian's Coffee$d32n$, $d32d$Pâtissier événementiel à Toulouse.
Téléphone : 06 09 52 25 67
Site web : https://www.florianscoffee.com/
Note Google : 4.9/5 (358 avis)
Google Maps : https://maps.google.com/?cid=11191997710234153233&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d32d$, true, 43.6044877, 1.4455209999999998, $d32a$Métro Capitole, Rue du Poids de l'Huile$d32a$, $d32c$Toulouse$d32c$, $d32p$31000$d32p$, $d32g$ChIJb_wufp68rhIREfF9pZ72UZs$d32g$, 4.9, 358, $d32s$Gâteau événementiel$d32s$),
  ($d33n$Gentina$d33n$, $d33d$Pâtissier événementiel à Toulouse.
Téléphone : 09 73 58 64 90
Site web : http://www.maison-gentina.com/
Note Google : 4.6/5 (240 avis)
Google Maps : https://maps.google.com/?cid=2126185887759730918&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d33d$, true, 43.603569, 1.4541610999999999, $d33a$39 Rue Pierre-Paul Riquet$d33a$, $d33c$Toulouse$d33c$, $d33p$31000$d33p$, $d33g$ChIJFd8A4Jm8rhIR5ghexsy6gR0$d33g$, 4.6, 240, $d33s$Gâteau événementiel$d33s$),
  ($d34n$Gourmandista$d34n$, $d34d$Pâtisserie personnalisée à Plaisance-du-Touch.
Téléphone : 06 80 11 83 28
Site web : https://www.gourmandista.fr/
Note Google : 5/5 (44 avis)
Google Maps : https://maps.google.com/?cid=12360397182919540035&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d34d$, true, 43.568853, 1.307629, $d34a$5 bis Rue Pierre Loti$d34a$, $d34c$Plaisance-du-Touch$d34c$, $d34p$31830$d34p$, $d34g$ChIJM3oMcSe7rhIRQ32o6r_ziKs$d34g$, 5.0, 44, $d34s$Pâtisserie personnalisée$d34s$),
  ($d35n$KUMO PATISSERIE$d35n$, $d35d$Wedding cake à Toulouse.
Téléphone : 05 61 22 19 31
Site web : https://www.kumo-patisserie.com/
Note Google : 4.6/5 (201 avis)
Google Maps : https://maps.google.com/?cid=9493700932395579914&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d35d$, true, 43.603046899999995, 1.4447708, $d35a$3 Rue Saint-Pantaléon$d35a$, $d35c$Toulouse$d35c$, $d35p$31000$d35p$, $d35g$ChIJARPfgRe9rhIRCro7v7JmwIM$d35g$, 4.6, 201, $d35s$Wedding cake$d35s$),
  ($d36n$L' Atelier Des Gourmandises$d36n$, $d36d$Pâtissier événementiel à Toulouse.
Téléphone : 06 88 29 01 24
Site web : https://latelierdesgourmandises.com/
Note Google : 5/5 (173 avis)
Google Maps : https://maps.google.com/?cid=13666647936404457841&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d36d$, true, 43.6308587, 1.4486735, $d36a$14 Rue de la Marquise de Sévigné$d36a$, $d36c$Toulouse$d36c$, $d36p$31200$d36p$, $d36g$ChIJH0W0Bx6jrhIRcYm2n-Ovqb0$d36g$, 5.0, 173, $d36s$Gâteau événementiel$d36s$),
  ($d37n$L'atelier des chefs$d37n$, $d37d$Pâtissier événementiel à Toulouse.
Téléphone : 05 61 47 71 23
Site web : https://www.atelierdeschefs.fr/fr/concept/ateliers-cuisine/46-toulouse.php
Note Google : 4.7/5 (524 avis)
Google Maps : https://maps.google.com/?cid=12288764495109761980&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d37d$, true, 43.60116420000001, 1.4529831, $d37a$5 R. Antoine Idrac$d37a$, $d37c$Toulouse$d37c$, $d37p$31000$d37p$, $d37g$ChIJz-ISnJq8rhIRvCtzGzN2iqo$d37g$, 4.7, 524, $d37s$Gâteau événementiel$d37s$),
  ($d38n$L'invitation$d38n$, $d38d$Wedding cake à Toulouse.
Téléphone : 07 53 45 88 83
Site web : https://linvitationtoulouse.fr/
Note Google : 4.7/5 (39 avis)
Google Maps : https://maps.google.com/?cid=11825252951227025274&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d38d$, true, 43.5989529, 1.4362583, $d38a$3 Rue de la République$d38a$, $d38c$Toulouse$d38c$, $d38p$31300$d38p$, $d38g$ChIJ7_XtVQww9E4RescGAei8G6Q$d38g$, 4.7, 39, $d38s$Wedding cake$d38s$),
  ($d39n$LE FOURNIL DES FILLES$d39n$, $d39d$Pièce montée à Toulouse.
Téléphone : 05 61 26 40 87
Site web : https://www.campaillette.com/
Note Google : 3.5/5 (16 avis)
Google Maps : https://maps.google.com/?cid=6072025744753020568&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d39d$, true, 43.6176155, 1.4551498999999999, $d39a$34 Rue du Faubourg Bonnefoy$d39a$, $d39c$Toulouse$d39c$, $d39p$31500$d39p$, $d39g$ChIJuybujLq8rhIRmM4Hbz4rRFQ$d39g$, 3.5, 16, $d39s$Pièce montée$d39s$),
  ($d40n$La Gourmandine - Côté Marché$d40n$, $d40d$Pâtissier événementiel à Toulouse.
Téléphone : 05 61 22 78 84
Site web : http://www.la-gourmandine.fr/
Note Google : 4.5/5 (2034 avis)
Google Maps : https://maps.google.com/?cid=271710180779426851&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d40d$, true, 43.6059191, 1.4463171, $d40a$17 Pl. Victor Hugo$d40a$, $d40c$Toulouse$d40c$, $d40p$31000$d40p$, $d40g$ChIJE8Pk8Z68rhIRIwQ3R_hOxQM$d40g$, 4.5, 2034, $d40s$Gâteau événementiel$d40s$),
  ($d41n$La Rose de Tunis - Toulouse$d41n$, $d41d$Pâtissier événementiel à Toulouse.
Téléphone : 05 61 29 82 83
Site web : https://larosedetunis.com/
Note Google : 3.5/5 (641 avis)
Google Maps : https://maps.google.com/?cid=1238891784411935431&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d41d$, true, 43.609353000000006, 1.4445797999999999, $d41a$51 Bd de Strasbourg$d41a$, $d41c$Toulouse$d41c$, $d41p$31000$d41p$, $d41g$ChIJgefPH6C8rhIRx_IFlYNtMRE$d41g$, 3.5, 641, $d41s$Gâteau événementiel$d41s$),
  ($d42n$Labo&Gato Toulouse$d42n$, $d42d$Pâtissier événementiel à Toulouse.
Téléphone : 05 31 98 03 00
Site web : https://www.laboetgato.fr/
Note Google : 4.5/5 (206 avis)
Google Maps : https://maps.google.com/?cid=18171443359369073839&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d42d$, true, 43.6059973, 1.4452623, $d42a$12 Rue Rivals$d42a$, $d42c$Toulouse$d42c$, $d42p$31000$d42p$, $d42g$ChIJQRG2RJ68rhIRrxRTe3XvLfw$d42g$, 4.5, 206, $d42s$Gâteau événementiel$d42s$),
  ($d43n$Le Comptoir de Mathilde$d43n$, $d43d$Wedding cake à Toulouse.
Téléphone : 05 34 30 01 79
Site web : https://www.lecomptoirdemathilde.com/fr/
Note Google : 4.4/5 (243 avis)
Google Maps : https://maps.google.com/?cid=14488117346584982197&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d43d$, true, 43.6050778, 1.4443361, $d43a$5 Rue Lafayette$d43a$, $d43c$Toulouse$d43c$, $d43p$31000$d43p$, $d43g$ChIJAe3bEZ68rhIRtXJfI_chEMk$d43g$, 4.4, 243, $d43s$Wedding cake$d43s$),
  ($d44n$Le Panier ROYAL$d44n$, $d44d$Wedding cake à Toulouse.
Téléphone : 09 87 70 16 12
Site web : https://lepanierroyal31.fr/fr
Note Google : 4.4/5 (331 avis)
Google Maps : https://maps.google.com/?cid=9466249063639786235&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d44d$, true, 43.613491700000004, 1.4607672999999999, $d44a$22 Ave Léon Blum$d44a$, $d44c$Toulouse$d44c$, $d44p$31500$d44p$, $d44g$ChIJtVsuyLi8rhIR-6KfeV7fXoM$d44g$, 4.4, 331, $d44s$Wedding cake$d44s$),
  ($d45n$Le Panivore$d45n$, $d45d$Pièce montée à Toulouse.
Téléphone : 05 61 42 68 14
Note Google : 4.4/5 (251 avis)
Google Maps : https://maps.google.com/?cid=9519185747105435074&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d45d$, true, 43.597345499999996, 1.4288927999999999, $d45a$11 Av. Etienne Billières$d45a$, $d45c$Toulouse$d45c$, $d45p$31300$d45p$, $d45g$ChIJvaA0K3K7rhIRwk0ujwDxGoQ$d45g$, 4.4, 251, $d45s$Pièce montée$d45s$),
  ($d46n$Le Paradis Gourmand$d46n$, $d46d$Pâtissier événementiel à Toulouse.
Téléphone : 05 61 22 05 77
Site web : https://leparadisgourmand.fr/
Note Google : 4/5 (140 avis)
Google Maps : https://maps.google.com/?cid=3009170890127718428&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d46d$, true, 43.6009706, 1.4449965, $d46a$45 Rue des Tourneurs$d46a$, $d46c$Toulouse$d46c$, $d46p$31000$d46p$, $d46g$ChIJA1c6o6m9rhIRHDiCNvu4wik$d46g$, 4.0, 140, $d46s$Gâteau événementiel$d46s$),
  ($d47n$Le Salon d'Eugénie$d47n$, $d47d$Pâtissier événementiel à Toulouse.
Téléphone : 05 62 30 84 52
Site web : http://lesalondeugenie.fr/
Note Google : 4.4/5 (1503 avis)
Google Maps : https://maps.google.com/?cid=16875875090434489732&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d47d$, true, 43.605350099999995, 1.4421249, $d47a$16 Rue des Lois$d47a$, $d47c$Toulouse$d47c$, $d47p$31000$d47p$, $d47g$ChIJD-tklGG7rhIRhP01h_smM-o$d47g$, 4.4, 1503, $d47s$Gâteau événementiel$d47s$),
  ($d48n$Le régal oriental$d48n$, $d48d$Wedding cake à Toulouse.
Téléphone : 05 61 21 81 50
Note Google : 4.5/5 (313 avis)
Google Maps : https://maps.google.com/?cid=16422249833332807652&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d48d$, true, 43.6064833, 1.4448832, $d48a$38 Rue Charles de Rémusat$d48a$, $d48c$Toulouse$d48c$, $d48p$31000$d48p$, $d48g$ChIJzyJH3GG9rhIR5BeF8DaN5-M$d48g$, 4.5, 313, $d48s$Wedding cake$d48s$),
  ($d49n$Les douceurs de Daniel$d49n$, $d49d$Wedding cake à Villaudric.
Téléphone : 06 16 67 00 47
Site web : http://lesdouceursdedaniel.com/
Note Google : 4.8/5 (142 avis)
Google Maps : https://maps.google.com/?cid=11251664228918947995&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d49d$, true, 43.821835799999995, 1.4487147999999999, $d49a$41 Rte de Villematier$d49a$, $d49c$Villaudric$d49c$, $d49p$31620$d49p$, $d49g$ChIJQ4acCocerBIRm_CumADxJZw$d49g$, 4.8, 142, $d49s$Wedding cake$d49s$),
  ($d50n$Les délices d’Emily$d50n$, $d50d$Pâtissier événementiel à Toulouse.
Téléphone : 06 02 83 64 07
Note Google : 3.8/5 (410 avis)
Google Maps : https://maps.google.com/?cid=6420001641059583434&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d50d$, true, 43.5967972, 1.4241237, $d50a$68 Av. Etienne Billières$d50a$, $d50c$Toulouse$d50c$, $d50p$31300$d50p$, $d50g$ChIJD2x7sGGlrhIRygXIWHptGFk$d50g$, 3.8, 410, $d50s$Gâteau événementiel$d50s$),
  ($d51n$Les gourmandises d'Olivier$d51n$, $d51d$Pièce montée à Toulouse.
Téléphone : 06 70 18 74 93
Site web : https://www.lesgourmandisesdolivier-patissier.fr/contact-les-gourmandises-d-olivier-patissier-a-toulouse
Note Google : 4.3/5 (9 avis)
Google Maps : https://maps.google.com/?cid=10452570284213429443&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d51d$, true, 43.599709, 1.3854594999999998, $d51a$6 Rue Aymé Kunc$d51a$, $d51c$Toulouse$d51c$, $d51p$31300$d51p$, $d51g$ChIJ__9DTY26rhIRw2RYHEv9DpE$d51g$, 4.3, 9, $d51s$Pièce montée$d51s$),
  ($d52n$Les gourmandises de Mathis$d52n$, $d52d$Wedding cake à Toulouse.
Téléphone : 05 61 21 35 64
Note Google : 3.9/5 (366 avis)
Google Maps : https://maps.google.com/?cid=2733350936997921685&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d52d$, true, 43.605772699999996, 1.4279625, $d52a$1bis Av. Paul Séjourné$d52a$, $d52c$Toulouse$d52c$, $d52p$31000$d52p$, $d52g$ChIJg8zDw2u7rhIRlQM-_jHQ7iU$d52g$, 3.9, 366, $d52s$Wedding cake$d52s$),
  ($d53n$Les romances de Marie$d53n$, $d53d$Wedding cake à Toulouse.
Téléphone : 06 95 58 80 87
Site web : https://www.lesromancesdemarie.com/
Note Google : 4.9/5 (43 avis)
Google Maps : https://maps.google.com/?cid=11132913657492177013&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d53d$, true, 43.611019999999996, 1.447706, $d53a$18 Rue de l'Orient$d53a$, $d53c$Toulouse$d53c$, $d53p$31000$d53p$, $d53g$ChIJERdyerO9rhIRdYDqnfwNgJo$d53g$, 4.9, 43, $d53s$Wedding cake$d53s$),
  ($d54n$L’écureuil Gourmand$d54n$, $d54d$Wedding cake à Toulouse.
Téléphone : 05 34 33 69 13
Site web : https://www.instagram.com/lecureuilgourmand?igsh=dTVnY3Y1MXJzN2Fh&utm_source=qr
Note Google : 4.1/5 (190 avis)
Google Maps : https://maps.google.com/?cid=18168184073645114214&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d54d$, true, 43.606082199999996, 1.4459653, $d54a$16 Rue Rivals$d54a$, $d54c$Toulouse$d54c$, $d54p$31000$d54p$, $d54g$ChIJT49xKAC9rhIRZsOG4ydbIvw$d54g$, 4.1, 190, $d54s$Wedding cake$d54s$),
  ($d55n$MC Macarons - Cake Design - Gâteaux personnalisés$d55n$, $d55d$Pâtisserie personnalisée à Lherm.
Téléphone : 06 73 74 48 65
Site web : https://www.instagram.com/mc.macarons/
Note Google : 5/5 (53 avis)
Google Maps : https://maps.google.com/?cid=17579632074113434345&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d55d$, true, 43.435704, 1.2256213, $d55a$4 bis Rue de l'Anguille$d55a$, $d55c$Lherm$d55c$, $d55p$31600$d55p$, $d55g$ChIJo-aoL9zlWioR6UKYAztm9_M$d55g$, 5.0, 53, $d55s$Pâtisserie personnalisée$d55s$),
  ($d56n$Maison De Oliveira$d56n$, $d56d$Pièce montée à Toulouse.
Téléphone : 05 62 48 00 74
Note Google : 3.2/5 (228 avis)
Google Maps : https://maps.google.com/?cid=8034878591542246610&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d56d$, true, 43.5977162, 1.4294284, $d56a$2 Av. Etienne Billières$d56a$, $d56c$Toulouse$d56c$, $d56p$31300$d56p$, $d56g$ChIJVZ2nhHG7rhIR0jxEJoKfgW8$d56g$, 3.2, 228, $d56s$Pièce montée$d56s$),
  ($d57n$Maison Pillon Capitole$d57n$, $d57d$Wedding cake à Toulouse.
Téléphone : 05 25 24 00 30
Site web : https://www.maison-pillon.fr/
Note Google : 4.1/5 (236 avis)
Google Maps : https://maps.google.com/?cid=3112550951645974675&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d57d$, true, 43.6037542, 1.4437144, $d57a$3 Pl. du Capitole$d57a$, $d57c$Toulouse$d57c$, $d57p$31000$d57p$, $d57g$ChIJuYXJcv29rhIRk5ApepkAMis$d57g$, 4.1, 236, $d57s$Wedding cake$d57s$),
  ($d58n$Maison Pillon Ozenne$d58n$, $d58d$Pâtissier événementiel à Toulouse.
Téléphone : 05 61 52 68 14
Site web : http://www.maison-pillon.fr/
Note Google : 4.2/5 (514 avis)
Google Maps : https://maps.google.com/?cid=14696535599207318003&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d58d$, true, 43.5974722, 1.4457346, $d58a$2 Rue Théodore Ozenne$d58a$, $d58c$Toulouse$d58c$, $d58p$31000$d58p$, $d58g$ChIJo7KB-4K8rhIR84GiC0OV9Ms$d58g$, 4.2, 514, $d58s$Gâteau événementiel$d58s$),
  ($d59n$Maison Pillon Wilson$d59n$, $d59d$Pâtissier événementiel à Toulouse.
Téléphone : 05 61 21 96 51
Site web : http://www.maison-pillon.fr/
Note Google : 4/5 (362 avis)
Google Maps : https://maps.google.com/?cid=7726346162149214986&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d59d$, true, 43.605555599999995, 1.4475, $d59a$2 Rue d'Austerlitz$d59a$, $d59c$Toulouse$d59c$, $d59p$31000$d59p$, $d59g$ChIJc3Pyu568rhIRCkubBuZ-OWs$d59g$, 4.0, 362, $d59s$Gâteau événementiel$d59s$),
  ($d60n$Oh My Cooks Carmes - Cookies à Toulouse$d60n$, $d60d$Pâtissier événementiel à Toulouse.
Téléphone : 07 56 84 86 17
Site web : http://www.ohmycooks.fr/
Note Google : 4.9/5 (506 avis)
Google Maps : https://maps.google.com/?cid=14870176770484614574&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d60d$, true, 43.5982169, 1.4469870999999999, $d60a$13 Pl. Mage$d60a$, $d60c$Toulouse$d60c$, $d60p$31000$d60p$, $d60g$ChIJdatdqea9rhIRrjUAuPx6Xc4$d60g$, 4.9, 506, $d60s$Gâteau événementiel$d60s$),
  ($d61n$PERLETTE$d61n$, $d61d$Pâtissier événementiel à Toulouse.
Téléphone : 09 83 80 80 60
Site web : http://www.perlette.fr/
Note Google : 4.1/5 (239 avis)
Google Maps : https://maps.google.com/?cid=11080492662589347641&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d61d$, true, 43.6042434, 1.4463038000000001, $d61a$5 Rue du Poids de l'Huile$d61a$, $d61c$Toulouse$d61c$, $d61p$31000$d61p$, $d61g$ChIJKWOG-n29rhIROdf1oV7RxZk$d61g$, 4.1, 239, $d61s$Gâteau événementiel$d61s$),
  ($d62n$Patisserie B.Authié Saint Orens$d62n$, $d62d$Pièce montée à Saint-Orens-de-Gameville.
Téléphone : 05 62 24 87 74
Site web : http://www.patisserie-authie.fr/?utm_source=gmb
Note Google : 4.7/5 (113 avis)
Google Maps : https://maps.google.com/?cid=5864219213648648300&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d62d$, true, 43.563148299999995, 1.5162273, $d62a$10 Rue des Tilleuls$d62a$, $d62c$Saint-Orens-de-Gameville$d62c$, $d62p$31650$d62p$, $d62g$ChIJ1QBS0va9rhIRbFiMCk7kYVE$d62g$, 4.7, 113, $d62s$Pièce montée$d62s$),
  ($d63n$Pepite Cookie - Toulouse$d63n$, $d63d$Wedding cake à Toulouse.
Téléphone : 05 61 22 03 88
Site web : https://pepite-cookie.fr/
Note Google : 4.9/5 (381 avis)
Google Maps : https://maps.google.com/?cid=10380274530813877619&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d63d$, true, 43.6059522, 1.4445204999999999, $d63a$24 Rue Charles de Rémusat$d63a$, $d63c$Toulouse$d63c$, $d63p$31000$d63p$, $d63g$ChIJIQR0UCS9rhIRcx0yULAkDpA$d63g$, 4.9, 381, $d63s$Wedding cake$d63s$),
  ($d64n$Perlette$d64n$, $d64d$Pâtissier événementiel à Toulouse.
Téléphone : 05 61 21 67 60
Site web : http://perlette.fr/
Note Google : 4.1/5 (1936 avis)
Google Maps : https://maps.google.com/?cid=15292850807546927927&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d64d$, true, 43.6014826, 1.4424223999999999, $d64a$2 Pl. de la Bourse$d64a$, $d64c$Toulouse$d64c$, $d64p$31000$d64p$, $d64g$ChIJPw9ipJ68rhIRN1vh0sgeO9Q$d64g$, 4.1, 1936, $d64s$Gâteau événementiel$d64s$),
  ($d65n$Perlette$d65n$, $d65d$Wedding cake à Toulouse.
Téléphone : 09 82 36 60 46
Site web : http://www.perlette.fr/
Note Google : 4.2/5 (331 avis)
Google Maps : https://maps.google.com/?cid=18133314579137960369&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d65d$, true, 43.5997067, 1.4438167000000002, $d65a$57 Rue des Filatiers$d65a$, $d65c$Toulouse$d65c$, $d65p$31000$d65p$, $d65g$ChIJd5ob2Aa9rhIRsRnuCYl5pvs$d65g$, 4.2, 331, $d65s$Wedding cake$d65s$),
  ($d66n$Perlette goûter$d66n$, $d66d$Wedding cake à Toulouse.
Téléphone : 09 83 64 60 29
Site web : http://www.perlette.fr/
Note Google : 3.9/5 (343 avis)
Google Maps : https://maps.google.com/?cid=69108691138961807&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d66d$, true, 43.6033641, 1.4419823, $d66a$27 Rue Léon Gambetta$d66a$, $d66c$Toulouse$d66c$, $d66p$31000$d66p$, $d66g$ChIJL1L8vL-7rhIRj-E6Cv2F9QA$d66g$, 3.9, 343, $d66s$Wedding cake$d66s$),
  ($d67n$Pâtisserie B.Authié l'Union$d67n$, $d67d$Pièce montée à L'Union.
Téléphone : 05 62 10 66 80
Site web : http://www.patisserie-authie.fr/
Note Google : 4.5/5 (138 avis)
Google Maps : https://maps.google.com/?cid=1248668419399427987&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d67d$, true, 43.6557217, 1.4792014, $d67a$L, 15 Centre Commercial St Caprais$d67a$, $d67c$L'Union$d67c$, $d67p$31240$d67p$, $d67g$ChIJcwE5wxyjrhIRkyeNzE8pVBE$d67g$, 4.5, 138, $d67s$Pièce montée$d67s$),
  ($d68n$Pâtisserie Chocolaterie Antoine FOR NARA$d68n$, $d68d$Pâtissier événementiel à Toulouse.
Téléphone : 05 61 22 53 42
Site web : https://antoinefornara.fr/
Note Google : 4.5/5 (1035 avis)
Google Maps : https://maps.google.com/?cid=5009323128750145459&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d68d$, true, 43.6185256, 1.4362167, $d68a$31 Av. des Minimes$d68a$, $d68c$Toulouse$d68c$, $d68p$31200$d68p$, $d68g$ChIJE1FVhlq7rhIRs_9MVtiwhEU$d68g$, 4.5, 1035, $d68s$Gâteau événementiel$d68s$),
  ($d69n$Pâtisserie Chocolaterie Antoine Fornara - Place Dupuy$d69n$, $d69d$Pâtissier événementiel à Toulouse.
Téléphone : 05 61 45 98 08
Site web : https://antoinefornara.fr/
Note Google : 4.4/5 (253 avis)
Google Maps : https://maps.google.com/?cid=15934021670642743721&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d69d$, true, 43.5997863, 1.453713, $d69a$24 Pl. Dupuy$d69a$, $d69c$Toulouse$d69c$, $d69p$31000$d69p$, $d69g$ChIJm7WomfC9rhIRqXkJkkkEId0$d69g$, 4.4, 253, $d69s$Gâteau événementiel$d69s$),
  ($d70n$Pâtisserie Conté$d70n$, $d70d$Pâtissier événementiel à Toulouse.
Téléphone : 05 61 52 06 73
Site web : https://www.patisserieconte.com/
Note Google : 4.5/5 (1083 avis)
Google Maps : https://maps.google.com/?cid=16050307840186964486&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d70d$, true, 43.5997213, 1.4480115, $d70a$37 Rue Croix Baragnon$d70a$, $d70c$Toulouse$d70c$, $d70p$31000$d70p$, $d70g$ChIJp1BRqpy8rhIRBtoCRvElvt4$d70g$, 4.5, 1083, $d70s$Gâteau événementiel$d70s$),
  ($d71n$Pâtisserie Georgette$d71n$, $d71d$Pâtissier événementiel à Toulouse.
Téléphone : 06 19 81 53 90
Site web : http://www.patisserie-georgette.com/
Note Google : 4.7/5 (318 avis)
Google Maps : https://maps.google.com/?cid=14653517415806708508&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d71d$, true, 43.5856505, 1.4655428, $d71a$62 Av. Antoine de Saint-Exupéry$d71a$, $d71c$Toulouse$d71c$, $d71p$31400$d71p$, $d71g$ChIJ_QRea3y9rhIRHKsot3PAW8s$d71g$, 4.7, 318, $d71s$Gâteau événementiel$d71s$),
  ($d72n$Pâtisserie Marocaine et orientale & Epicerie Fine Maymana France$d72n$, $d72d$Pâtissier événementiel à Toulouse.
Téléphone : 05 61 38 61 47
Site web : http://www.maymana.fr/
Note Google : 4.6/5 (226 avis)
Google Maps : https://maps.google.com/?cid=15680244888644962501&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d72d$, true, 43.606507199999996, 1.4475289999999998, $d72a$9 Bd de Strasbourg$d72a$, $d72c$Toulouse$d72c$, $d72p$31000$d72p$, $d72g$ChIJV5ym2Z68rhIRxUjREqZrm9k$d72g$, 4.6, 226, $d72s$Gâteau événementiel$d72s$),
  ($d73n$Péché Mignon$d73n$, $d73d$Wedding cake à Toulouse.
Téléphone : 05 61 52 64 69
Site web : https://www.facebook.com/pechemignon_boulangerie-101445775711842/about/?ref=page_internal
Note Google : 4.5/5 (561 avis)
Google Maps : https://maps.google.com/?cid=17014084117231878969&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d73d$, true, 43.5986127, 1.4454371, $d73a$37 Rue du Languedoc$d73a$, $d73c$Toulouse$d73c$, $d73p$31000$d73p$, $d73g$ChIJHzSr3oK8rhIROcM4MlwrHuw$d73g$, 4.5, 561, $d73s$Wedding cake$d73s$),
  ($d74n$Salon Cacao'T$d74n$, $d74d$Pâtissier événementiel à Toulouse.
Téléphone : 09 51 00 63 42
Site web : https://saloncacaot.fr/
Note Google : 4.7/5 (973 avis)
Google Maps : https://maps.google.com/?cid=10889150876147289339&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d74d$, true, 43.606214, 1.4442978, $d74a$21 Rue Charles de Rémusat$d74a$, $d74c$Toulouse$d74c$, $d74p$31000$d74p$, $d74g$ChIJrftUEA-9rhIR-4xkVgcJHpc$d74g$, 4.7, 973, $d74s$Gâteau événementiel$d74s$),
  ($d75n$The Bakery Corner$d75n$, $d75d$Wedding cake à Toulouse.
Téléphone : 05 62 72 43 15
Site web : http://www.thebakerycorner.fr/
Note Google : 4.6/5 (350 avis)
Google Maps : https://maps.google.com/?cid=8483170177414919262&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d75d$, true, 43.5901481, 1.4458288, $d75a$108 Gd Rue Saint-Michel$d75a$, $d75c$Toulouse$d75c$, $d75p$31400$d75p$, $d75g$ChIJQ8jErXC9rhIRXvQAolRGunU$d75g$, 4.6, 350, $d75s$Wedding cake$d75s$),
  ($d76n$UN PETIT GÂTEAU$d76n$, $d76d$Pâtissier événementiel à Toulouse.
Téléphone : 05 61 52 39 54
Site web : http://www.unpetitgateau.com/
Note Google : 4.9/5 (272 avis)
Google Maps : https://maps.google.com/?cid=12204712151411330570&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d76d$, true, 43.6014859, 1.4426423, $d76a$3 Rue Temponières$d76a$, $d76c$Toulouse$d76c$, $d76p$31000$d76p$, $d76g$ChIJJxgxetK7rhIRCg7E0gnZX6k$d76g$, 4.9, 272, $d76s$Gâteau événementiel$d76s$),
  ($d77n$Un jour, un gateau$d77n$, $d77d$Pâtissier événementiel à Toulouse.
Téléphone : 06 34 56 02 25
Site web : https://www.un-jour-un-gateau.fr/
Note Google : 4.8/5 (144 avis)
Google Maps : https://maps.google.com/?cid=11493804811805413772&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d77d$, true, 43.640958999999995, 1.4678661, $d77a$proche royal buffet, lieu de, récupération des gâteau, 2 Av. d'Atlanta$d77a$, $d77c$Toulouse$d77c$, $d77p$31200$d77p$, $d77g$ChIJx9TdnTijrhIRjFFWXZQygp8$d77g$, 4.8, 144, $d77s$Gâteau événementiel$d77s$),
  ($d78n$Unicake.Toulouse : Gâteaux sur mesure, cake design, gâteaux d'anniversaire, mariage$d78n$, $d78d$Pâtissier événementiel à Colomiers.
Téléphone : 07 81 18 95 13
Site web : https://unicake-toulouse.fr/
Note Google : 5/5 (128 avis)
Google Maps : https://maps.google.com/?cid=14469159294112150935&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d78d$, true, 43.6119432, 1.3220554, $d78a$4 Bd de l'Ouest$d78a$, $d78c$Colomiers$d78c$, $d78p$31770$d78p$, $d78g$ChIJq6_9vIexrhIRl7UYlLfHzMg$d78g$, 5.0, 128, $d78s$Gâteau événementiel$d78s$),
  ($d79n$VAL JUSTAMANTE CAKE DESIGN TOULOUSE$d79n$, $d79d$Pâtissier événementiel à Toulouse.
Téléphone : 06 33 04 85 23
Site web : https://www.val-cakedesign-toulouse.com/
Note Google : 5/5 (139 avis)
Google Maps : https://maps.google.com/?cid=1911059997301713514&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d79d$, true, 43.589304, 1.446945, $d79a$Rue François Magendie$d79a$, $d79c$Toulouse$d79c$, $d79p$31400$d79p$, $d79g$ChIJA51y8XtmfAIRaqqgO_FyhRo$d79g$, 5.0, 139, $d79s$Gâteau événementiel$d79s$),
  ($d80n$Wedding Location Toulouse$d80n$, $d80d$Wedding cake à Toulouse.
Téléphone : 06 42 29 41 50
Note Google : 4.7/5 (13 avis)
Google Maps : https://maps.google.com/?cid=13154821909295637321&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d80d$, true, 43.6026507, 1.4414342999999998, $d80a$24 rue Léon Gametta Bureau 3$d80a$, $d80c$Toulouse$d80c$, $d80p$31000$d80p$, $d80g$ChIJye3lw3xbKWYRSaMXS9RQj7Y$d80g$, 4.7, 13, $d80s$Wedding cake$d80s$),
  ($d81n$Yves Jehanne Pâtisserie Boulangerie$d81n$, $d81d$Pièce montée à Balma.
Téléphone : 05 61 24 22 11
Site web : http://www.yvesjehanne.fr/
Note Google : 4.3/5 (487 avis)
Google Maps : https://maps.google.com/?cid=1432251129737605744&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d81d$, true, 43.6095709, 1.4943741, $d81a$10 Av. de Toulouse$d81a$, $d81c$Balma$d81c$, $d81p$31130$d81p$, $d81g$ChIJHWH8nj29rhIRcHIpadBg4BM$d81g$, 4.3, 487, $d81s$Pièce montée$d81s$),
  ($d82n$maison cinna$d82n$, $d82d$Wedding cake à Toulouse.
Téléphone : 07 83 54 33 50
Note Google : 4.7/5 (158 avis)
Google Maps : https://maps.google.com/?cid=8262226843870807414&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d82d$, true, 43.6045295, 1.4384388, $d82a$40 Rue Pargaminières$d82a$, $d82c$Toulouse$d82c$, $d82p$31000$d82p$, $d82g$ChIJueOLIQC7rhIRdsWdEopTqXI$d82g$, 4.7, 158, $d82s$Wedding cake$d82s$),
  ($d83n$Ô Donuts Toulouse$d83n$, $d83d$Wedding cake à Toulouse.
Téléphone : 09 53 56 62 23
Site web : https://instagram.com/odonuts_toulouse?igshid=YmMyMTA2M2Y=
Note Google : 4.9/5 (715 avis)
Google Maps : https://maps.google.com/?cid=17564026491860232027&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d83d$, true, 43.6022438, 1.4385421999999999, $d83a$2 Rue des Blanchers$d83a$, $d83c$Toulouse$d83c$, $d83p$31000$d83p$, $d83g$ChIJR6bLCBO7rhIRWyfhQAn1v_M$d83g$, 4.9, 715, $d83s$Wedding cake$d83s$)
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
  ($d0n$Art de Patisser$d0n$, $d0d$Pâtissier événementiel à Toulouse.
Téléphone : 05 62 75 57 26
Site web : https://www.artdepatisser.com/
Note Google : 5/5 (201 avis)
Google Maps : https://maps.google.com/?cid=3759409269329933507&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d0d$, true, 43.60543, 1.4461498, $d0a$3 Rue Caussette$d0a$, $d0c$Toulouse$d0c$, $d0p$31000$d0p$, $d0g$ChIJbxbMDbG9rhIRw7S4788aLDQ$d0g$, 5.0, 201, $d0s$Gâteau événementiel$d0s$),
  ($d1n$Artisan Boulanger Pâtissier "La Grignette"$d1n$, $d1d$Pièce montée à Toulouse.
Téléphone : 05 61 07 52 71
Site web : https://www.facebook.com/LaGrignetteEricetNatasha/
Note Google : 4.7/5 (290 avis)
Google Maps : https://maps.google.com/?cid=643300939721099029&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d1d$, true, 43.5575841, 1.3801687, $d1a$6 Rue Règuelongue$d1a$, $d1c$Toulouse$d1c$, $d1p$31100$d1p$, $d1g$ChIJn-XJDWK6rhIRFUfA28t27Qg$d1g$, 4.7, 290, $d1s$Pièce montée$d1s$),
  ($d2n$Artisan Traiteur Toulouse$d2n$, $d2d$Pâtissier événementiel à Toulouse.
Téléphone : 06 60 52 06 48
Site web : https://www.artisan-traiteur-toulouse.com/
Note Google : 4.7/5 (144 avis)
Google Maps : https://maps.google.com/?cid=4098027804351548142&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d2d$, true, 43.6096353, 1.4516381, $d2a$Rue Bertrand de Born$d2a$, $d2c$Toulouse$d2c$, $d2p$31000$d2p$, $d2g$ChIJoQuQ5Ze8rhIR7koMZpMe3zg$d2g$, 4.7, 144, $d2s$Gâteau événementiel$d2s$),
  ($d3n$Au Pain de mon Grand-Père$d3n$, $d3d$Pièce montée à Toulouse.
Téléphone : 05 62 80 99 90
Site web : http://www.aupaindemongrandpere.com/
Note Google : 4.4/5 (579 avis)
Google Maps : https://maps.google.com/?cid=3640533264598471553&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d3d$, true, 43.578990999999995, 1.4841924, $d3a$237 Av. Antoine de Saint-Exupéry$d3a$, $d3c$Toulouse$d3c$, $d3p$31400$d3p$, $d3g$ChIJb8L59LK9rhIRgZNiPbfFhTI$d3g$, 4.4, 579, $d3s$Pièce montée$d3s$),
  ($d4n$Au Poussin Bleu$d4n$, $d4d$Pâtissier événementiel à Toulouse.
Téléphone : 05 61 52 01 70
Site web : https://aupoussinbleu.fr/
Note Google : 4.2/5 (637 avis)
Google Maps : https://maps.google.com/?cid=11686510608447366003&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d4d$, true, 43.5989007, 1.4453312999999999, $d4a$45 Rue du Languedoc$d4a$, $d4c$Toulouse$d4c$, $d4p$31000$d4p$, $d4g$ChIJBY6Y3YK8rhIRc-NWCHvTLqI$d4g$, 4.2, 637, $d4s$Gâteau événementiel$d4s$),
  ($d5n$Au Poussin Rose$d5n$, $d5d$Pâtissier événementiel à Toulouse.
Téléphone : 05 61 62 58 37
Site web : https://aupoussinrose.fr/
Note Google : 4.6/5 (358 avis)
Google Maps : https://maps.google.com/?cid=7374981101799770163&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d5d$, true, 43.6088954, 1.4480355, $d5a$22 Rue de Bayard$d5a$, $d5c$Toulouse$d5c$, $d5p$31000$d5p$, $d5g$ChIJrSc9VJ-8rhIRM4j-3TwyWWY$d5g$, 4.6, 358, $d5s$Gâteau événementiel$d5s$),
  ($d6n$Aux Petits Fours, Pâtisserie Saint-Criq$d6n$, $d6d$Wedding cake à Toulouse.
Téléphone : 05 61 49 35 07
Site web : http://www.patisserie-saint-criq-toulouse.fr/
Note Google : 4/5 (906 avis)
Google Maps : https://maps.google.com/?cid=667817970865771228&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d6d$, true, 43.596706, 1.422744, $d6a$7 Pl. de la Patte d'Oie$d6a$, $d6c$Toulouse$d6c$, $d6p$31300$d6p$, $d6g$ChIJQ_znwQy7rhIR3JITAOiQRAk$d6g$, 4.0, 906, $d6s$Wedding cake$d6s$),
  ($d7n$BO délices$d7n$, $d7d$Wedding cake à Toulouse.
Note Google : 4.8/5 (81 avis)
Google Maps : https://maps.google.com/?cid=11698924186314520113&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d7d$, true, 43.5797455, 1.4499952, $d7a$70 Av. de l'U.R.S.S.$d7a$, $d7c$Toulouse$d7c$, $d7p$31400$d7p$, $d7g$ChIJVdhqeTq9rhIRMbaAW5DtWqI$d7g$, 4.8, 81, $d7s$Wedding cake$d7s$),
  ($d8n$Bapz salon de thé$d8n$, $d8d$Pâtissier événementiel à Toulouse.
Téléphone : 05 61 23 06 63
Site web : http://www.bapz.fr/
Note Google : 4.6/5 (1519 avis)
Google Maps : https://maps.google.com/?cid=15004475874446210328&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d8d$, true, 43.600609999999996, 1.442319, $d8a$13 Rue de la Bourse$d8a$, $d8c$Toulouse$d8c$, $d8p$31000$d8p$, $d8g$ChIJ336pv2K7rhIRGPVIiU-bOtA$d8g$, 4.6, 1519, $d8s$Gâteau événementiel$d8s$),
  ($d9n$Bergo$d9n$, $d9d$Pièce montée à Tournefeuille.
Téléphone : 05 61 07 09 57
Site web : http://www.patisseriebergo.fr/
Note Google : 4.8/5 (234 avis)
Google Maps : https://maps.google.com/?cid=10289319408947327608&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d9d$, true, 43.584123399999996, 1.3466352, $d9a$87 Rue Gaston Doumergue$d9a$, $d9c$Tournefeuille$d9c$, $d9p$31170$d9p$, $d9g$ChIJTeygJfOwrhIReHLWvnwBy44$d9g$, 4.8, 234, $d9s$Pièce montée$d9s$),
  ($d10n$Besties Bakery Toulouse$d10n$, $d10d$Pâtissier événementiel à Toulouse.
Téléphone : 09 86 60 78 90
Site web : https://bestiesbakery.fr/toulouse
Note Google : 4.4/5 (318 avis)
Google Maps : https://maps.google.com/?cid=16808007156828124110&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d10d$, true, 43.600901199999996, 1.4439031999999998, $d10a$16 Rue des Changes$d10a$, $d10c$Toulouse$d10c$, $d10p$31000$d10p$, $d10g$ChIJSbsVWkO9rhIRzrP23HQJQuk$d10g$, 4.4, 318, $d10s$Gâteau événementiel$d10s$),
  ($d11n$Bimbiz Food$d11n$, $d11d$Pâtissier événementiel à Toulouse.
Téléphone : 06 11 57 24 77
Site web : https://www.bimbiz-food.com/
Note Google : 4.9/5 (280 avis)
Google Maps : https://maps.google.com/?cid=8445339914862053047&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d11d$, true, 43.604442, 1.4439161999999999, $d11a$Pl. du Capitole$d11a$, $d11c$Toulouse$d11c$, $d11p$31000$d11p$, $d11g$ChIJoTqrX129rhIRt8bHQOjfM3U$d11g$, 4.9, 280, $d11s$Gâteau événementiel$d11s$),
  ($d12n$Boulangerie / Pâtisserie Mirarosa$d12n$, $d12d$Pâtissier événementiel à Toulouse.
Téléphone : 05 34 46 59 75
Site web : http://www.mirarosa.fr/
Note Google : 4.6/5 (377 avis)
Google Maps : https://maps.google.com/?cid=12252177243534374862&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d12d$, true, 43.587734600000005, 1.4464204999999999, $d12a$65 Gd Rue Saint-Michel$d12a$, $d12c$Toulouse$d12c$, $d12p$31400$d12p$, $d12g$ChIJp42hucK7rhIRzrf9xUl6CKo$d12g$, 4.6, 377, $d12s$Gâteau événementiel$d12s$),
  ($d13n$Boulangerie Pâtisserie "Cyprien"$d13n$, $d13d$Wedding cake à Toulouse.
Téléphone : 05 34 51 06 60
Site web : http://boulangerie-cyprien.fr/
Note Google : 4.6/5 (898 avis)
Google Maps : https://maps.google.com/?cid=9011403559026157736&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d13d$, true, 43.598257, 1.432544, $d13a$55 Rue de la République$d13a$, $d13c$Toulouse$d13c$, $d13p$31300$d13p$, $d13g$ChIJq6oeQnC7rhIRqOhx38rvDn0$d13g$, 4.6, 898, $d13s$Wedding cake$d13s$),
  ($d14n$Boulangerie Pâtisserie "Cyprien"$d14n$, $d14d$Wedding cake à Toulouse.
Téléphone : 05 34 57 20 09
Site web : http://boulangerie-cyprien.fr/
Note Google : 4.5/5 (82 avis)
Google Maps : https://maps.google.com/?cid=13802269739176787772&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d14d$, true, 43.5930501, 1.43393, $d14a$7 Pl. du Fer À Cheval$d14a$, $d14c$Toulouse$d14c$, $d14p$31300$d14p$, $d14g$ChIJuzRTYQC7rhIRPH_BQTODi78$d14g$, 4.5, 82, $d14s$Wedding cake$d14s$),
  ($d15n$Boulangerie Pâtisserie MAGDA$d15n$, $d15d$Wedding cake à Toulouse.
Téléphone : 05 64 72 34 49
Note Google : 4.6/5 (79 avis)
Google Maps : https://maps.google.com/?cid=8749615856845733467&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d15d$, true, 43.590942299999995, 1.4692522, $d15a$154 Av. Jean Rieux$d15a$, $d15c$Toulouse$d15c$, $d15p$31500$d15p$, $d15g$ChIJ-0OlQsG9rhIRWz5qrEPhbHk$d15g$, 4.6, 79, $d15s$Wedding cake$d15s$),
  ($d16n$Boulangerie Pâtisserie MAGDA$d16n$, $d16d$Pièce montée à Toulouse.
Téléphone : 09 83 22 37 68
Site web : https://www.facebook.com/Boulangerie-Patisserie-Magda-101508834927023/
Note Google : 4.4/5 (197 avis)
Google Maps : https://maps.google.com/?cid=4814150912260718067&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d16d$, true, 43.5850359, 1.4668915, $d16a$86 Av. Antoine de Saint-Exupéry$d16a$, $d16c$Toulouse$d16c$, $d16p$31400$d16p$, $d16g$ChIJ88tDKH-9rhIR8z1sjL9Mz0I$d16g$, 4.4, 197, $d16s$Pièce montée$d16s$),
  ($d17n$Boulangerie Saint Sauveur$d17n$, $d17d$Pièce montée à Toulouse.
Téléphone : 05 61 52 89 23
Note Google : 4.3/5 (276 avis)
Google Maps : https://maps.google.com/?cid=2950428291326008059&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d17d$, true, 43.594018000000005, 1.4560089999999999, $d17a$37 All. des Soupirs$d17a$, $d17c$Toulouse$d17c$, $d17p$31000$d17p$, $d17g$ChIJPXUOL4m8rhIR-9q_H-YG8ig$d17g$, 4.3, 276, $d17s$Pièce montée$d17s$),
  ($d18n$Boulangerie Saint Sernin$d18n$, $d18d$Pâtisserie personnalisée à Toulouse.
Note Google : 4.8/5 (167 avis)
Google Maps : https://maps.google.com/?cid=7625766606975604089&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d18d$, true, 43.607753699999996, 1.4420431000000002, $d18a$64 Rue du Taur$d18a$, $d18c$Toulouse$d18c$, $d18p$31000$d18p$, $d18g$ChIJoTDQRmC7rhIReRXRdFMq1Gk$d18g$, 4.8, 167, $d18s$Pâtisserie personnalisée$d18s$),
  ($d19n$Boulangerie Terra Maïr Saint-Georges$d19n$, $d19d$Wedding cake à Toulouse.
Téléphone : 05 64 72 13 19
Site web : https://www.terramair.com/
Note Google : 4.8/5 (53 avis)
Google Maps : https://maps.google.com/?cid=9672783631807793820&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d19d$, true, 43.601075099999996, 1.4483684, $d19a$6 R. d'Astorg$d19a$, $d19c$Toulouse$d19c$, $d19p$31000$d19p$, $d19g$ChIJr2Ggi829rhIRnMod63ahPIY$d19g$, 4.8, 53, $d19s$Wedding cake$d19s$),
  ($d20n$Boulangerie de la Cartoucherie$d20n$, $d20d$Pièce montée à Toulouse.
Téléphone : 05 61 72 51 16
Site web : https://boulangerie-de-la-cartoucherie.eatbu.com/
Note Google : 3/5 (184 avis)
Google Maps : https://maps.google.com/?cid=11280510986374520861&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d20d$, true, 43.6020013, 1.4080544, $d20a$1 Place de la Charte des Libertés Communales$d20a$, $d20c$Toulouse$d20c$, $d20p$31300$d20p$, $d20g$ChIJD1m5Vuq7rhIRHaC-s_lsjJw$d20g$, 3.0, 184, $d20s$Pièce montée$d20s$),
  ($d21n$Cook Shop$d21n$, $d21d$Pâtissier événementiel à Portet-sur-Garonne.
Téléphone : 09 81 72 51 36
Site web : http://facebook.com/275863815896506?utm_source=gmb
Note Google : 4.4/5 (411 avis)
Google Maps : https://maps.google.com/?cid=2506514030254252112&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d21d$, true, 43.5297134, 1.4039352999999999, $d21a$3 Bd de l'Europe$d21a$, $d21c$Portet-sur-Garonne$d21c$, $d21p$31120$d21p$, $d21g$ChIJRY3wj6C5rhIRUGDW_TrtyCI$d21g$, 4.4, 411, $d21s$Gâteau événementiel$d21s$),
  ($d22n$Cours de cuisine Toulouse - Amis & Fines Herbes$d22n$, $d22d$Pâtissier événementiel à Toulouse.
Téléphone : 06 73 81 54 08
Site web : http://www.cook-meeting.fr/
Note Google : 5/5 (682 avis)
Google Maps : https://maps.google.com/?cid=8238977516898704858&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d22d$, true, 43.620081299999995, 1.4224503, $d22a$125 Chem. du Sang de Serp$d22a$, $d22c$Toulouse$d22c$, $d22p$31200$d22p$, $d22g$ChIJVzwkG7GkrhIR2l0tT2a6VnI$d22g$, 5.0, 682, $d22s$Gâteau événementiel$d22s$),
  ($d23n$Cours de pâtisserie — Johan — Toulouse$d23n$, $d23d$Wedding cake à Toulouse.
Téléphone : 07 69 44 50 11
Site web : https://cours-patisserie.fr/
Note Google : 4.7/5 (69 avis)
Google Maps : https://maps.google.com/?cid=8727256046276332843&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d23d$, true, 43.599497199999995, 1.4848909, $d23a$21 Rue Claudius Rougenet$d23a$, $d23c$Toulouse$d23c$, $d23p$31500$d23p$, $d23g$ChIJUS3t0Ry9rhIRK00uliJxHXk$d23g$, 4.7, 69, $d23s$Wedding cake$d23s$),
  ($d24n$Cyndie Benelli-Wedding Cake sur Mesure (Au pays de Cyndie)$d24n$, $d24d$Wedding cake à Lagarde.
Téléphone : 06 74 41 39 31
Site web : https://www.aupaysdecyndie.com/
Note Google : 5/5 (65 avis)
Google Maps : https://maps.google.com/?cid=4645559011285560629&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d24d$, true, 43.3457639, 1.7123070999999999, $d24a$139 Rue de la Prison$d24a$, $d24c$Lagarde$d24c$, $d24p$31290$d24p$, $d24g$ChIJcz7xqsmVrhIRNW3Kuk5XeEA$d24g$, 5.0, 65, $d24s$Wedding cake$d24s$),
  ($d25n$Dantras Maxime$d25n$, $d25d$Pâtissier événementiel à Toulouse.
Téléphone : 05 61 48 84 65
Site web : https://www.aubonquignon.com/
Note Google : 4.4/5 (272 avis)
Google Maps : https://maps.google.com/?cid=4521500383020794228&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d25d$, true, 43.6227778, 1.4619444, $d25a$76 Av. de Lavaur$d25a$, $d25c$Toulouse$d25c$, $d25p$31500$d25p$, $d25g$ChIJxTrCDba8rhIRdEG_daSYvz4$d25g$, 4.4, 272, $d25s$Gâteau événementiel$d25s$),
  ($d26n$DeVilmar$d26n$, $d26d$Wedding cake à Toulouse.
Téléphone : 05 62 80 62 11
Site web : https://www.instagram.com/devilmar_/
Note Google : 4.9/5 (593 avis)
Google Maps : https://maps.google.com/?cid=7584244648047796434&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d26d$, true, 43.605106000000006, 1.4421378000000002, $d26a$5 Rue des Lois$d26a$, $d26c$Toulouse$d26c$, $d26p$31000$d26p$, $d26g$ChIJOdbLl1m7rhIR0uCLCFOmQGk$d26g$, 4.9, 593, $d26s$Wedding cake$d26s$),
  ($d27n$Des Sens pâtisserie$d27n$, $d27d$Pâtissier événementiel à Toulouse.
Téléphone : 05 62 30 04 56
Note Google : 4.9/5 (180 avis)
Google Maps : https://maps.google.com/?cid=4352205683735877062&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d27d$, true, 43.6079607, 1.4491893999999998, $d27a$24 Rue Denfert Rochereau$d27a$, $d27c$Toulouse$d27c$, $d27p$31000$d27p$, $d27g$ChIJyxOdpaa9rhIRxlWDqAIkZjw$d27g$, 4.9, 180, $d27s$Gâteau événementiel$d27s$),
  ($d28n$Entremets - Pâtisserie Créative$d28n$, $d28d$Pâtissier événementiel à Toulouse.
Téléphone : 05 61 75 88 66
Site web : https://www.entremets-toulouse.fr/
Note Google : 4.9/5 (426 avis)
Google Maps : https://maps.google.com/?cid=13309813435040366189&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d28d$, true, 43.596094099999995, 1.4441456, $d28a$21 Rue Pharaon$d28a$, $d28c$Toulouse$d28c$, $d28p$31000$d28p$, $d28g$ChIJ-fBmcya9rhIRbX5N_sz0tbg$d28g$, 4.9, 426, $d28s$Gâteau événementiel$d28s$),
  ($d29n$Event Ewa Wedding Planner$d29n$, $d29d$Wedding cake à Toulouse.
Téléphone : 06 41 47 45 75
Site web : http://www.eventewa.com/
Note Google : 5/5 (109 avis)
Google Maps : https://maps.google.com/?cid=4750811451348019079&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d29d$, true, 43.6157666, 1.4496412, $d29a$27 Rue des Jumeaux$d29a$, $d29c$Toulouse$d29c$, $d29p$31200$d29p$, $d29g$ChIJARkbhmCjrhIRh-d0GNhF7kE$d29g$, 5.0, 109, $d29s$Wedding cake$d29s$),
  ($d30n$FLANFLAN$d30n$, $d30d$Pâtissier événementiel à Toulouse.
Note Google : 4.5/5 (346 avis)
Google Maps : https://maps.google.com/?cid=12902867539834092016&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d30d$, true, 43.6013205, 1.4451121999999998, $d30a$60 Rue des Tourneurs$d30a$, $d30c$Toulouse$d30c$, $d30p$31000$d30p$, $d30g$ChIJAQfeigi9rhIR8Lm6R6oxELM$d30g$, 4.5, 346, $d30s$Gâteau événementiel$d30s$),
  ($d31n$Flagrant Délice$d31n$, $d31d$Pâtissier événementiel à Toulouse.
Téléphone : 05 61 48 05 27
Site web : https://www.flagrant-delice.fr/
Note Google : 4.4/5 (451 avis)
Google Maps : https://maps.google.com/?cid=6678957813635015444&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d31d$, true, 43.6163388, 1.472953, $d31a$119 Rue Louis Plana$d31a$, $d31c$Toulouse$d31c$, $d31p$31000$d31p$, $d31g$ChIJF4Iw19q8rhIRFOOIr75ssFw$d31g$, 4.4, 451, $d31s$Gâteau événementiel$d31s$),
  ($d32n$Florian's Coffee$d32n$, $d32d$Pâtissier événementiel à Toulouse.
Téléphone : 06 09 52 25 67
Site web : https://www.florianscoffee.com/
Note Google : 4.9/5 (358 avis)
Google Maps : https://maps.google.com/?cid=11191997710234153233&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d32d$, true, 43.6044877, 1.4455209999999998, $d32a$Métro Capitole, Rue du Poids de l'Huile$d32a$, $d32c$Toulouse$d32c$, $d32p$31000$d32p$, $d32g$ChIJb_wufp68rhIREfF9pZ72UZs$d32g$, 4.9, 358, $d32s$Gâteau événementiel$d32s$),
  ($d33n$Gentina$d33n$, $d33d$Pâtissier événementiel à Toulouse.
Téléphone : 09 73 58 64 90
Site web : http://www.maison-gentina.com/
Note Google : 4.6/5 (240 avis)
Google Maps : https://maps.google.com/?cid=2126185887759730918&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d33d$, true, 43.603569, 1.4541610999999999, $d33a$39 Rue Pierre-Paul Riquet$d33a$, $d33c$Toulouse$d33c$, $d33p$31000$d33p$, $d33g$ChIJFd8A4Jm8rhIR5ghexsy6gR0$d33g$, 4.6, 240, $d33s$Gâteau événementiel$d33s$),
  ($d34n$Gourmandista$d34n$, $d34d$Pâtisserie personnalisée à Plaisance-du-Touch.
Téléphone : 06 80 11 83 28
Site web : https://www.gourmandista.fr/
Note Google : 5/5 (44 avis)
Google Maps : https://maps.google.com/?cid=12360397182919540035&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d34d$, true, 43.568853, 1.307629, $d34a$5 bis Rue Pierre Loti$d34a$, $d34c$Plaisance-du-Touch$d34c$, $d34p$31830$d34p$, $d34g$ChIJM3oMcSe7rhIRQ32o6r_ziKs$d34g$, 5.0, 44, $d34s$Pâtisserie personnalisée$d34s$),
  ($d35n$KUMO PATISSERIE$d35n$, $d35d$Wedding cake à Toulouse.
Téléphone : 05 61 22 19 31
Site web : https://www.kumo-patisserie.com/
Note Google : 4.6/5 (201 avis)
Google Maps : https://maps.google.com/?cid=9493700932395579914&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d35d$, true, 43.603046899999995, 1.4447708, $d35a$3 Rue Saint-Pantaléon$d35a$, $d35c$Toulouse$d35c$, $d35p$31000$d35p$, $d35g$ChIJARPfgRe9rhIRCro7v7JmwIM$d35g$, 4.6, 201, $d35s$Wedding cake$d35s$),
  ($d36n$L' Atelier Des Gourmandises$d36n$, $d36d$Pâtissier événementiel à Toulouse.
Téléphone : 06 88 29 01 24
Site web : https://latelierdesgourmandises.com/
Note Google : 5/5 (173 avis)
Google Maps : https://maps.google.com/?cid=13666647936404457841&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d36d$, true, 43.6308587, 1.4486735, $d36a$14 Rue de la Marquise de Sévigné$d36a$, $d36c$Toulouse$d36c$, $d36p$31200$d36p$, $d36g$ChIJH0W0Bx6jrhIRcYm2n-Ovqb0$d36g$, 5.0, 173, $d36s$Gâteau événementiel$d36s$),
  ($d37n$L'atelier des chefs$d37n$, $d37d$Pâtissier événementiel à Toulouse.
Téléphone : 05 61 47 71 23
Site web : https://www.atelierdeschefs.fr/fr/concept/ateliers-cuisine/46-toulouse.php
Note Google : 4.7/5 (524 avis)
Google Maps : https://maps.google.com/?cid=12288764495109761980&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d37d$, true, 43.60116420000001, 1.4529831, $d37a$5 R. Antoine Idrac$d37a$, $d37c$Toulouse$d37c$, $d37p$31000$d37p$, $d37g$ChIJz-ISnJq8rhIRvCtzGzN2iqo$d37g$, 4.7, 524, $d37s$Gâteau événementiel$d37s$),
  ($d38n$L'invitation$d38n$, $d38d$Wedding cake à Toulouse.
Téléphone : 07 53 45 88 83
Site web : https://linvitationtoulouse.fr/
Note Google : 4.7/5 (39 avis)
Google Maps : https://maps.google.com/?cid=11825252951227025274&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d38d$, true, 43.5989529, 1.4362583, $d38a$3 Rue de la République$d38a$, $d38c$Toulouse$d38c$, $d38p$31300$d38p$, $d38g$ChIJ7_XtVQww9E4RescGAei8G6Q$d38g$, 4.7, 39, $d38s$Wedding cake$d38s$),
  ($d39n$LE FOURNIL DES FILLES$d39n$, $d39d$Pièce montée à Toulouse.
Téléphone : 05 61 26 40 87
Site web : https://www.campaillette.com/
Note Google : 3.5/5 (16 avis)
Google Maps : https://maps.google.com/?cid=6072025744753020568&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d39d$, true, 43.6176155, 1.4551498999999999, $d39a$34 Rue du Faubourg Bonnefoy$d39a$, $d39c$Toulouse$d39c$, $d39p$31500$d39p$, $d39g$ChIJuybujLq8rhIRmM4Hbz4rRFQ$d39g$, 3.5, 16, $d39s$Pièce montée$d39s$),
  ($d40n$La Gourmandine - Côté Marché$d40n$, $d40d$Pâtissier événementiel à Toulouse.
Téléphone : 05 61 22 78 84
Site web : http://www.la-gourmandine.fr/
Note Google : 4.5/5 (2034 avis)
Google Maps : https://maps.google.com/?cid=271710180779426851&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d40d$, true, 43.6059191, 1.4463171, $d40a$17 Pl. Victor Hugo$d40a$, $d40c$Toulouse$d40c$, $d40p$31000$d40p$, $d40g$ChIJE8Pk8Z68rhIRIwQ3R_hOxQM$d40g$, 4.5, 2034, $d40s$Gâteau événementiel$d40s$),
  ($d41n$La Rose de Tunis - Toulouse$d41n$, $d41d$Pâtissier événementiel à Toulouse.
Téléphone : 05 61 29 82 83
Site web : https://larosedetunis.com/
Note Google : 3.5/5 (641 avis)
Google Maps : https://maps.google.com/?cid=1238891784411935431&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d41d$, true, 43.609353000000006, 1.4445797999999999, $d41a$51 Bd de Strasbourg$d41a$, $d41c$Toulouse$d41c$, $d41p$31000$d41p$, $d41g$ChIJgefPH6C8rhIRx_IFlYNtMRE$d41g$, 3.5, 641, $d41s$Gâteau événementiel$d41s$),
  ($d42n$Labo&Gato Toulouse$d42n$, $d42d$Pâtissier événementiel à Toulouse.
Téléphone : 05 31 98 03 00
Site web : https://www.laboetgato.fr/
Note Google : 4.5/5 (206 avis)
Google Maps : https://maps.google.com/?cid=18171443359369073839&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d42d$, true, 43.6059973, 1.4452623, $d42a$12 Rue Rivals$d42a$, $d42c$Toulouse$d42c$, $d42p$31000$d42p$, $d42g$ChIJQRG2RJ68rhIRrxRTe3XvLfw$d42g$, 4.5, 206, $d42s$Gâteau événementiel$d42s$),
  ($d43n$Le Comptoir de Mathilde$d43n$, $d43d$Wedding cake à Toulouse.
Téléphone : 05 34 30 01 79
Site web : https://www.lecomptoirdemathilde.com/fr/
Note Google : 4.4/5 (243 avis)
Google Maps : https://maps.google.com/?cid=14488117346584982197&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d43d$, true, 43.6050778, 1.4443361, $d43a$5 Rue Lafayette$d43a$, $d43c$Toulouse$d43c$, $d43p$31000$d43p$, $d43g$ChIJAe3bEZ68rhIRtXJfI_chEMk$d43g$, 4.4, 243, $d43s$Wedding cake$d43s$),
  ($d44n$Le Panier ROYAL$d44n$, $d44d$Wedding cake à Toulouse.
Téléphone : 09 87 70 16 12
Site web : https://lepanierroyal31.fr/fr
Note Google : 4.4/5 (331 avis)
Google Maps : https://maps.google.com/?cid=9466249063639786235&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d44d$, true, 43.613491700000004, 1.4607672999999999, $d44a$22 Ave Léon Blum$d44a$, $d44c$Toulouse$d44c$, $d44p$31500$d44p$, $d44g$ChIJtVsuyLi8rhIR-6KfeV7fXoM$d44g$, 4.4, 331, $d44s$Wedding cake$d44s$),
  ($d45n$Le Panivore$d45n$, $d45d$Pièce montée à Toulouse.
Téléphone : 05 61 42 68 14
Note Google : 4.4/5 (251 avis)
Google Maps : https://maps.google.com/?cid=9519185747105435074&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d45d$, true, 43.597345499999996, 1.4288927999999999, $d45a$11 Av. Etienne Billières$d45a$, $d45c$Toulouse$d45c$, $d45p$31300$d45p$, $d45g$ChIJvaA0K3K7rhIRwk0ujwDxGoQ$d45g$, 4.4, 251, $d45s$Pièce montée$d45s$),
  ($d46n$Le Paradis Gourmand$d46n$, $d46d$Pâtissier événementiel à Toulouse.
Téléphone : 05 61 22 05 77
Site web : https://leparadisgourmand.fr/
Note Google : 4/5 (140 avis)
Google Maps : https://maps.google.com/?cid=3009170890127718428&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d46d$, true, 43.6009706, 1.4449965, $d46a$45 Rue des Tourneurs$d46a$, $d46c$Toulouse$d46c$, $d46p$31000$d46p$, $d46g$ChIJA1c6o6m9rhIRHDiCNvu4wik$d46g$, 4.0, 140, $d46s$Gâteau événementiel$d46s$),
  ($d47n$Le Salon d'Eugénie$d47n$, $d47d$Pâtissier événementiel à Toulouse.
Téléphone : 05 62 30 84 52
Site web : http://lesalondeugenie.fr/
Note Google : 4.4/5 (1503 avis)
Google Maps : https://maps.google.com/?cid=16875875090434489732&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d47d$, true, 43.605350099999995, 1.4421249, $d47a$16 Rue des Lois$d47a$, $d47c$Toulouse$d47c$, $d47p$31000$d47p$, $d47g$ChIJD-tklGG7rhIRhP01h_smM-o$d47g$, 4.4, 1503, $d47s$Gâteau événementiel$d47s$),
  ($d48n$Le régal oriental$d48n$, $d48d$Wedding cake à Toulouse.
Téléphone : 05 61 21 81 50
Note Google : 4.5/5 (313 avis)
Google Maps : https://maps.google.com/?cid=16422249833332807652&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d48d$, true, 43.6064833, 1.4448832, $d48a$38 Rue Charles de Rémusat$d48a$, $d48c$Toulouse$d48c$, $d48p$31000$d48p$, $d48g$ChIJzyJH3GG9rhIR5BeF8DaN5-M$d48g$, 4.5, 313, $d48s$Wedding cake$d48s$),
  ($d49n$Les douceurs de Daniel$d49n$, $d49d$Wedding cake à Villaudric.
Téléphone : 06 16 67 00 47
Site web : http://lesdouceursdedaniel.com/
Note Google : 4.8/5 (142 avis)
Google Maps : https://maps.google.com/?cid=11251664228918947995&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d49d$, true, 43.821835799999995, 1.4487147999999999, $d49a$41 Rte de Villematier$d49a$, $d49c$Villaudric$d49c$, $d49p$31620$d49p$, $d49g$ChIJQ4acCocerBIRm_CumADxJZw$d49g$, 4.8, 142, $d49s$Wedding cake$d49s$),
  ($d50n$Les délices d’Emily$d50n$, $d50d$Pâtissier événementiel à Toulouse.
Téléphone : 06 02 83 64 07
Note Google : 3.8/5 (410 avis)
Google Maps : https://maps.google.com/?cid=6420001641059583434&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d50d$, true, 43.5967972, 1.4241237, $d50a$68 Av. Etienne Billières$d50a$, $d50c$Toulouse$d50c$, $d50p$31300$d50p$, $d50g$ChIJD2x7sGGlrhIRygXIWHptGFk$d50g$, 3.8, 410, $d50s$Gâteau événementiel$d50s$),
  ($d51n$Les gourmandises d'Olivier$d51n$, $d51d$Pièce montée à Toulouse.
Téléphone : 06 70 18 74 93
Site web : https://www.lesgourmandisesdolivier-patissier.fr/contact-les-gourmandises-d-olivier-patissier-a-toulouse
Note Google : 4.3/5 (9 avis)
Google Maps : https://maps.google.com/?cid=10452570284213429443&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d51d$, true, 43.599709, 1.3854594999999998, $d51a$6 Rue Aymé Kunc$d51a$, $d51c$Toulouse$d51c$, $d51p$31300$d51p$, $d51g$ChIJ__9DTY26rhIRw2RYHEv9DpE$d51g$, 4.3, 9, $d51s$Pièce montée$d51s$),
  ($d52n$Les gourmandises de Mathis$d52n$, $d52d$Wedding cake à Toulouse.
Téléphone : 05 61 21 35 64
Note Google : 3.9/5 (366 avis)
Google Maps : https://maps.google.com/?cid=2733350936997921685&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d52d$, true, 43.605772699999996, 1.4279625, $d52a$1bis Av. Paul Séjourné$d52a$, $d52c$Toulouse$d52c$, $d52p$31000$d52p$, $d52g$ChIJg8zDw2u7rhIRlQM-_jHQ7iU$d52g$, 3.9, 366, $d52s$Wedding cake$d52s$),
  ($d53n$Les romances de Marie$d53n$, $d53d$Wedding cake à Toulouse.
Téléphone : 06 95 58 80 87
Site web : https://www.lesromancesdemarie.com/
Note Google : 4.9/5 (43 avis)
Google Maps : https://maps.google.com/?cid=11132913657492177013&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d53d$, true, 43.611019999999996, 1.447706, $d53a$18 Rue de l'Orient$d53a$, $d53c$Toulouse$d53c$, $d53p$31000$d53p$, $d53g$ChIJERdyerO9rhIRdYDqnfwNgJo$d53g$, 4.9, 43, $d53s$Wedding cake$d53s$),
  ($d54n$L’écureuil Gourmand$d54n$, $d54d$Wedding cake à Toulouse.
Téléphone : 05 34 33 69 13
Site web : https://www.instagram.com/lecureuilgourmand?igsh=dTVnY3Y1MXJzN2Fh&utm_source=qr
Note Google : 4.1/5 (190 avis)
Google Maps : https://maps.google.com/?cid=18168184073645114214&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d54d$, true, 43.606082199999996, 1.4459653, $d54a$16 Rue Rivals$d54a$, $d54c$Toulouse$d54c$, $d54p$31000$d54p$, $d54g$ChIJT49xKAC9rhIRZsOG4ydbIvw$d54g$, 4.1, 190, $d54s$Wedding cake$d54s$),
  ($d55n$MC Macarons - Cake Design - Gâteaux personnalisés$d55n$, $d55d$Pâtisserie personnalisée à Lherm.
Téléphone : 06 73 74 48 65
Site web : https://www.instagram.com/mc.macarons/
Note Google : 5/5 (53 avis)
Google Maps : https://maps.google.com/?cid=17579632074113434345&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d55d$, true, 43.435704, 1.2256213, $d55a$4 bis Rue de l'Anguille$d55a$, $d55c$Lherm$d55c$, $d55p$31600$d55p$, $d55g$ChIJo-aoL9zlWioR6UKYAztm9_M$d55g$, 5.0, 53, $d55s$Pâtisserie personnalisée$d55s$),
  ($d56n$Maison De Oliveira$d56n$, $d56d$Pièce montée à Toulouse.
Téléphone : 05 62 48 00 74
Note Google : 3.2/5 (228 avis)
Google Maps : https://maps.google.com/?cid=8034878591542246610&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d56d$, true, 43.5977162, 1.4294284, $d56a$2 Av. Etienne Billières$d56a$, $d56c$Toulouse$d56c$, $d56p$31300$d56p$, $d56g$ChIJVZ2nhHG7rhIR0jxEJoKfgW8$d56g$, 3.2, 228, $d56s$Pièce montée$d56s$),
  ($d57n$Maison Pillon Capitole$d57n$, $d57d$Wedding cake à Toulouse.
Téléphone : 05 25 24 00 30
Site web : https://www.maison-pillon.fr/
Note Google : 4.1/5 (236 avis)
Google Maps : https://maps.google.com/?cid=3112550951645974675&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d57d$, true, 43.6037542, 1.4437144, $d57a$3 Pl. du Capitole$d57a$, $d57c$Toulouse$d57c$, $d57p$31000$d57p$, $d57g$ChIJuYXJcv29rhIRk5ApepkAMis$d57g$, 4.1, 236, $d57s$Wedding cake$d57s$),
  ($d58n$Maison Pillon Ozenne$d58n$, $d58d$Pâtissier événementiel à Toulouse.
Téléphone : 05 61 52 68 14
Site web : http://www.maison-pillon.fr/
Note Google : 4.2/5 (514 avis)
Google Maps : https://maps.google.com/?cid=14696535599207318003&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d58d$, true, 43.5974722, 1.4457346, $d58a$2 Rue Théodore Ozenne$d58a$, $d58c$Toulouse$d58c$, $d58p$31000$d58p$, $d58g$ChIJo7KB-4K8rhIR84GiC0OV9Ms$d58g$, 4.2, 514, $d58s$Gâteau événementiel$d58s$),
  ($d59n$Maison Pillon Wilson$d59n$, $d59d$Pâtissier événementiel à Toulouse.
Téléphone : 05 61 21 96 51
Site web : http://www.maison-pillon.fr/
Note Google : 4/5 (362 avis)
Google Maps : https://maps.google.com/?cid=7726346162149214986&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d59d$, true, 43.605555599999995, 1.4475, $d59a$2 Rue d'Austerlitz$d59a$, $d59c$Toulouse$d59c$, $d59p$31000$d59p$, $d59g$ChIJc3Pyu568rhIRCkubBuZ-OWs$d59g$, 4.0, 362, $d59s$Gâteau événementiel$d59s$),
  ($d60n$Oh My Cooks Carmes - Cookies à Toulouse$d60n$, $d60d$Pâtissier événementiel à Toulouse.
Téléphone : 07 56 84 86 17
Site web : http://www.ohmycooks.fr/
Note Google : 4.9/5 (506 avis)
Google Maps : https://maps.google.com/?cid=14870176770484614574&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d60d$, true, 43.5982169, 1.4469870999999999, $d60a$13 Pl. Mage$d60a$, $d60c$Toulouse$d60c$, $d60p$31000$d60p$, $d60g$ChIJdatdqea9rhIRrjUAuPx6Xc4$d60g$, 4.9, 506, $d60s$Gâteau événementiel$d60s$),
  ($d61n$PERLETTE$d61n$, $d61d$Pâtissier événementiel à Toulouse.
Téléphone : 09 83 80 80 60
Site web : http://www.perlette.fr/
Note Google : 4.1/5 (239 avis)
Google Maps : https://maps.google.com/?cid=11080492662589347641&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d61d$, true, 43.6042434, 1.4463038000000001, $d61a$5 Rue du Poids de l'Huile$d61a$, $d61c$Toulouse$d61c$, $d61p$31000$d61p$, $d61g$ChIJKWOG-n29rhIROdf1oV7RxZk$d61g$, 4.1, 239, $d61s$Gâteau événementiel$d61s$),
  ($d62n$Patisserie B.Authié Saint Orens$d62n$, $d62d$Pièce montée à Saint-Orens-de-Gameville.
Téléphone : 05 62 24 87 74
Site web : http://www.patisserie-authie.fr/?utm_source=gmb
Note Google : 4.7/5 (113 avis)
Google Maps : https://maps.google.com/?cid=5864219213648648300&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d62d$, true, 43.563148299999995, 1.5162273, $d62a$10 Rue des Tilleuls$d62a$, $d62c$Saint-Orens-de-Gameville$d62c$, $d62p$31650$d62p$, $d62g$ChIJ1QBS0va9rhIRbFiMCk7kYVE$d62g$, 4.7, 113, $d62s$Pièce montée$d62s$),
  ($d63n$Pepite Cookie - Toulouse$d63n$, $d63d$Wedding cake à Toulouse.
Téléphone : 05 61 22 03 88
Site web : https://pepite-cookie.fr/
Note Google : 4.9/5 (381 avis)
Google Maps : https://maps.google.com/?cid=10380274530813877619&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d63d$, true, 43.6059522, 1.4445204999999999, $d63a$24 Rue Charles de Rémusat$d63a$, $d63c$Toulouse$d63c$, $d63p$31000$d63p$, $d63g$ChIJIQR0UCS9rhIRcx0yULAkDpA$d63g$, 4.9, 381, $d63s$Wedding cake$d63s$),
  ($d64n$Perlette$d64n$, $d64d$Pâtissier événementiel à Toulouse.
Téléphone : 05 61 21 67 60
Site web : http://perlette.fr/
Note Google : 4.1/5 (1936 avis)
Google Maps : https://maps.google.com/?cid=15292850807546927927&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d64d$, true, 43.6014826, 1.4424223999999999, $d64a$2 Pl. de la Bourse$d64a$, $d64c$Toulouse$d64c$, $d64p$31000$d64p$, $d64g$ChIJPw9ipJ68rhIRN1vh0sgeO9Q$d64g$, 4.1, 1936, $d64s$Gâteau événementiel$d64s$),
  ($d65n$Perlette$d65n$, $d65d$Wedding cake à Toulouse.
Téléphone : 09 82 36 60 46
Site web : http://www.perlette.fr/
Note Google : 4.2/5 (331 avis)
Google Maps : https://maps.google.com/?cid=18133314579137960369&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d65d$, true, 43.5997067, 1.4438167000000002, $d65a$57 Rue des Filatiers$d65a$, $d65c$Toulouse$d65c$, $d65p$31000$d65p$, $d65g$ChIJd5ob2Aa9rhIRsRnuCYl5pvs$d65g$, 4.2, 331, $d65s$Wedding cake$d65s$),
  ($d66n$Perlette goûter$d66n$, $d66d$Wedding cake à Toulouse.
Téléphone : 09 83 64 60 29
Site web : http://www.perlette.fr/
Note Google : 3.9/5 (343 avis)
Google Maps : https://maps.google.com/?cid=69108691138961807&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d66d$, true, 43.6033641, 1.4419823, $d66a$27 Rue Léon Gambetta$d66a$, $d66c$Toulouse$d66c$, $d66p$31000$d66p$, $d66g$ChIJL1L8vL-7rhIRj-E6Cv2F9QA$d66g$, 3.9, 343, $d66s$Wedding cake$d66s$),
  ($d67n$Pâtisserie B.Authié l'Union$d67n$, $d67d$Pièce montée à L'Union.
Téléphone : 05 62 10 66 80
Site web : http://www.patisserie-authie.fr/
Note Google : 4.5/5 (138 avis)
Google Maps : https://maps.google.com/?cid=1248668419399427987&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d67d$, true, 43.6557217, 1.4792014, $d67a$L, 15 Centre Commercial St Caprais$d67a$, $d67c$L'Union$d67c$, $d67p$31240$d67p$, $d67g$ChIJcwE5wxyjrhIRkyeNzE8pVBE$d67g$, 4.5, 138, $d67s$Pièce montée$d67s$),
  ($d68n$Pâtisserie Chocolaterie Antoine FOR NARA$d68n$, $d68d$Pâtissier événementiel à Toulouse.
Téléphone : 05 61 22 53 42
Site web : https://antoinefornara.fr/
Note Google : 4.5/5 (1035 avis)
Google Maps : https://maps.google.com/?cid=5009323128750145459&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d68d$, true, 43.6185256, 1.4362167, $d68a$31 Av. des Minimes$d68a$, $d68c$Toulouse$d68c$, $d68p$31200$d68p$, $d68g$ChIJE1FVhlq7rhIRs_9MVtiwhEU$d68g$, 4.5, 1035, $d68s$Gâteau événementiel$d68s$),
  ($d69n$Pâtisserie Chocolaterie Antoine Fornara - Place Dupuy$d69n$, $d69d$Pâtissier événementiel à Toulouse.
Téléphone : 05 61 45 98 08
Site web : https://antoinefornara.fr/
Note Google : 4.4/5 (253 avis)
Google Maps : https://maps.google.com/?cid=15934021670642743721&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d69d$, true, 43.5997863, 1.453713, $d69a$24 Pl. Dupuy$d69a$, $d69c$Toulouse$d69c$, $d69p$31000$d69p$, $d69g$ChIJm7WomfC9rhIRqXkJkkkEId0$d69g$, 4.4, 253, $d69s$Gâteau événementiel$d69s$),
  ($d70n$Pâtisserie Conté$d70n$, $d70d$Pâtissier événementiel à Toulouse.
Téléphone : 05 61 52 06 73
Site web : https://www.patisserieconte.com/
Note Google : 4.5/5 (1083 avis)
Google Maps : https://maps.google.com/?cid=16050307840186964486&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d70d$, true, 43.5997213, 1.4480115, $d70a$37 Rue Croix Baragnon$d70a$, $d70c$Toulouse$d70c$, $d70p$31000$d70p$, $d70g$ChIJp1BRqpy8rhIRBtoCRvElvt4$d70g$, 4.5, 1083, $d70s$Gâteau événementiel$d70s$),
  ($d71n$Pâtisserie Georgette$d71n$, $d71d$Pâtissier événementiel à Toulouse.
Téléphone : 06 19 81 53 90
Site web : http://www.patisserie-georgette.com/
Note Google : 4.7/5 (318 avis)
Google Maps : https://maps.google.com/?cid=14653517415806708508&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d71d$, true, 43.5856505, 1.4655428, $d71a$62 Av. Antoine de Saint-Exupéry$d71a$, $d71c$Toulouse$d71c$, $d71p$31400$d71p$, $d71g$ChIJ_QRea3y9rhIRHKsot3PAW8s$d71g$, 4.7, 318, $d71s$Gâteau événementiel$d71s$),
  ($d72n$Pâtisserie Marocaine et orientale & Epicerie Fine Maymana France$d72n$, $d72d$Pâtissier événementiel à Toulouse.
Téléphone : 05 61 38 61 47
Site web : http://www.maymana.fr/
Note Google : 4.6/5 (226 avis)
Google Maps : https://maps.google.com/?cid=15680244888644962501&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d72d$, true, 43.606507199999996, 1.4475289999999998, $d72a$9 Bd de Strasbourg$d72a$, $d72c$Toulouse$d72c$, $d72p$31000$d72p$, $d72g$ChIJV5ym2Z68rhIRxUjREqZrm9k$d72g$, 4.6, 226, $d72s$Gâteau événementiel$d72s$),
  ($d73n$Péché Mignon$d73n$, $d73d$Wedding cake à Toulouse.
Téléphone : 05 61 52 64 69
Site web : https://www.facebook.com/pechemignon_boulangerie-101445775711842/about/?ref=page_internal
Note Google : 4.5/5 (561 avis)
Google Maps : https://maps.google.com/?cid=17014084117231878969&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d73d$, true, 43.5986127, 1.4454371, $d73a$37 Rue du Languedoc$d73a$, $d73c$Toulouse$d73c$, $d73p$31000$d73p$, $d73g$ChIJHzSr3oK8rhIROcM4MlwrHuw$d73g$, 4.5, 561, $d73s$Wedding cake$d73s$),
  ($d74n$Salon Cacao'T$d74n$, $d74d$Pâtissier événementiel à Toulouse.
Téléphone : 09 51 00 63 42
Site web : https://saloncacaot.fr/
Note Google : 4.7/5 (973 avis)
Google Maps : https://maps.google.com/?cid=10889150876147289339&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d74d$, true, 43.606214, 1.4442978, $d74a$21 Rue Charles de Rémusat$d74a$, $d74c$Toulouse$d74c$, $d74p$31000$d74p$, $d74g$ChIJrftUEA-9rhIR-4xkVgcJHpc$d74g$, 4.7, 973, $d74s$Gâteau événementiel$d74s$),
  ($d75n$The Bakery Corner$d75n$, $d75d$Wedding cake à Toulouse.
Téléphone : 05 62 72 43 15
Site web : http://www.thebakerycorner.fr/
Note Google : 4.6/5 (350 avis)
Google Maps : https://maps.google.com/?cid=8483170177414919262&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d75d$, true, 43.5901481, 1.4458288, $d75a$108 Gd Rue Saint-Michel$d75a$, $d75c$Toulouse$d75c$, $d75p$31400$d75p$, $d75g$ChIJQ8jErXC9rhIRXvQAolRGunU$d75g$, 4.6, 350, $d75s$Wedding cake$d75s$),
  ($d76n$UN PETIT GÂTEAU$d76n$, $d76d$Pâtissier événementiel à Toulouse.
Téléphone : 05 61 52 39 54
Site web : http://www.unpetitgateau.com/
Note Google : 4.9/5 (272 avis)
Google Maps : https://maps.google.com/?cid=12204712151411330570&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d76d$, true, 43.6014859, 1.4426423, $d76a$3 Rue Temponières$d76a$, $d76c$Toulouse$d76c$, $d76p$31000$d76p$, $d76g$ChIJJxgxetK7rhIRCg7E0gnZX6k$d76g$, 4.9, 272, $d76s$Gâteau événementiel$d76s$),
  ($d77n$Un jour, un gateau$d77n$, $d77d$Pâtissier événementiel à Toulouse.
Téléphone : 06 34 56 02 25
Site web : https://www.un-jour-un-gateau.fr/
Note Google : 4.8/5 (144 avis)
Google Maps : https://maps.google.com/?cid=11493804811805413772&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d77d$, true, 43.640958999999995, 1.4678661, $d77a$proche royal buffet, lieu de, récupération des gâteau, 2 Av. d'Atlanta$d77a$, $d77c$Toulouse$d77c$, $d77p$31200$d77p$, $d77g$ChIJx9TdnTijrhIRjFFWXZQygp8$d77g$, 4.8, 144, $d77s$Gâteau événementiel$d77s$),
  ($d78n$Unicake.Toulouse : Gâteaux sur mesure, cake design, gâteaux d'anniversaire, mariage$d78n$, $d78d$Pâtissier événementiel à Colomiers.
Téléphone : 07 81 18 95 13
Site web : https://unicake-toulouse.fr/
Note Google : 5/5 (128 avis)
Google Maps : https://maps.google.com/?cid=14469159294112150935&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d78d$, true, 43.6119432, 1.3220554, $d78a$4 Bd de l'Ouest$d78a$, $d78c$Colomiers$d78c$, $d78p$31770$d78p$, $d78g$ChIJq6_9vIexrhIRl7UYlLfHzMg$d78g$, 5.0, 128, $d78s$Gâteau événementiel$d78s$),
  ($d79n$VAL JUSTAMANTE CAKE DESIGN TOULOUSE$d79n$, $d79d$Pâtissier événementiel à Toulouse.
Téléphone : 06 33 04 85 23
Site web : https://www.val-cakedesign-toulouse.com/
Note Google : 5/5 (139 avis)
Google Maps : https://maps.google.com/?cid=1911059997301713514&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d79d$, true, 43.589304, 1.446945, $d79a$Rue François Magendie$d79a$, $d79c$Toulouse$d79c$, $d79p$31400$d79p$, $d79g$ChIJA51y8XtmfAIRaqqgO_FyhRo$d79g$, 5.0, 139, $d79s$Gâteau événementiel$d79s$),
  ($d80n$Wedding Location Toulouse$d80n$, $d80d$Wedding cake à Toulouse.
Téléphone : 06 42 29 41 50
Note Google : 4.7/5 (13 avis)
Google Maps : https://maps.google.com/?cid=13154821909295637321&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d80d$, true, 43.6026507, 1.4414342999999998, $d80a$24 rue Léon Gametta Bureau 3$d80a$, $d80c$Toulouse$d80c$, $d80p$31000$d80p$, $d80g$ChIJye3lw3xbKWYRSaMXS9RQj7Y$d80g$, 4.7, 13, $d80s$Wedding cake$d80s$),
  ($d81n$Yves Jehanne Pâtisserie Boulangerie$d81n$, $d81d$Pièce montée à Balma.
Téléphone : 05 61 24 22 11
Site web : http://www.yvesjehanne.fr/
Note Google : 4.3/5 (487 avis)
Google Maps : https://maps.google.com/?cid=1432251129737605744&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d81d$, true, 43.6095709, 1.4943741, $d81a$10 Av. de Toulouse$d81a$, $d81c$Balma$d81c$, $d81p$31130$d81p$, $d81g$ChIJHWH8nj29rhIRcHIpadBg4BM$d81g$, 4.3, 487, $d81s$Pièce montée$d81s$),
  ($d82n$maison cinna$d82n$, $d82d$Wedding cake à Toulouse.
Téléphone : 07 83 54 33 50
Note Google : 4.7/5 (158 avis)
Google Maps : https://maps.google.com/?cid=8262226843870807414&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d82d$, true, 43.6045295, 1.4384388, $d82a$40 Rue Pargaminières$d82a$, $d82c$Toulouse$d82c$, $d82p$31000$d82p$, $d82g$ChIJueOLIQC7rhIRdsWdEopTqXI$d82g$, 4.7, 158, $d82s$Wedding cake$d82s$),
  ($d83n$Ô Donuts Toulouse$d83n$, $d83d$Wedding cake à Toulouse.
Téléphone : 09 53 56 62 23
Site web : https://instagram.com/odonuts_toulouse?igshid=YmMyMTA2M2Y=
Note Google : 4.9/5 (715 avis)
Google Maps : https://maps.google.com/?cid=17564026491860232027&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d83d$, true, 43.6022438, 1.4385421999999999, $d83a$2 Rue des Blanchers$d83a$, $d83c$Toulouse$d83c$, $d83p$31000$d83p$, $d83g$ChIJR6bLCBO7rhIRWyfhQAn1v_M$d83g$, 4.9, 715, $d83s$Wedding cake$d83s$)
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
    where google_place_id in ($d0id$ChIJbxbMDbG9rhIRw7S4788aLDQ$d0id$, $d1id$ChIJn-XJDWK6rhIRFUfA28t27Qg$d1id$, $d2id$ChIJoQuQ5Ze8rhIR7koMZpMe3zg$d2id$, $d3id$ChIJb8L59LK9rhIRgZNiPbfFhTI$d3id$, $d4id$ChIJBY6Y3YK8rhIRc-NWCHvTLqI$d4id$, $d5id$ChIJrSc9VJ-8rhIRM4j-3TwyWWY$d5id$, $d6id$ChIJQ_znwQy7rhIR3JITAOiQRAk$d6id$, $d7id$ChIJVdhqeTq9rhIRMbaAW5DtWqI$d7id$, $d8id$ChIJ336pv2K7rhIRGPVIiU-bOtA$d8id$, $d9id$ChIJTeygJfOwrhIReHLWvnwBy44$d9id$, $d10id$ChIJSbsVWkO9rhIRzrP23HQJQuk$d10id$, $d11id$ChIJoTqrX129rhIRt8bHQOjfM3U$d11id$, $d12id$ChIJp42hucK7rhIRzrf9xUl6CKo$d12id$, $d13id$ChIJq6oeQnC7rhIRqOhx38rvDn0$d13id$, $d14id$ChIJuzRTYQC7rhIRPH_BQTODi78$d14id$, $d15id$ChIJ-0OlQsG9rhIRWz5qrEPhbHk$d15id$, $d16id$ChIJ88tDKH-9rhIR8z1sjL9Mz0I$d16id$, $d17id$ChIJPXUOL4m8rhIR-9q_H-YG8ig$d17id$, $d18id$ChIJoTDQRmC7rhIReRXRdFMq1Gk$d18id$, $d19id$ChIJr2Ggi829rhIRnMod63ahPIY$d19id$, $d20id$ChIJD1m5Vuq7rhIRHaC-s_lsjJw$d20id$, $d21id$ChIJRY3wj6C5rhIRUGDW_TrtyCI$d21id$, $d22id$ChIJVzwkG7GkrhIR2l0tT2a6VnI$d22id$, $d23id$ChIJUS3t0Ry9rhIRK00uliJxHXk$d23id$, $d24id$ChIJcz7xqsmVrhIRNW3Kuk5XeEA$d24id$, $d25id$ChIJxTrCDba8rhIRdEG_daSYvz4$d25id$, $d26id$ChIJOdbLl1m7rhIR0uCLCFOmQGk$d26id$, $d27id$ChIJyxOdpaa9rhIRxlWDqAIkZjw$d27id$, $d28id$ChIJ-fBmcya9rhIRbX5N_sz0tbg$d28id$, $d29id$ChIJARkbhmCjrhIRh-d0GNhF7kE$d29id$, $d30id$ChIJAQfeigi9rhIR8Lm6R6oxELM$d30id$, $d31id$ChIJF4Iw19q8rhIRFOOIr75ssFw$d31id$, $d32id$ChIJb_wufp68rhIREfF9pZ72UZs$d32id$, $d33id$ChIJFd8A4Jm8rhIR5ghexsy6gR0$d33id$, $d34id$ChIJM3oMcSe7rhIRQ32o6r_ziKs$d34id$, $d35id$ChIJARPfgRe9rhIRCro7v7JmwIM$d35id$, $d36id$ChIJH0W0Bx6jrhIRcYm2n-Ovqb0$d36id$, $d37id$ChIJz-ISnJq8rhIRvCtzGzN2iqo$d37id$, $d38id$ChIJ7_XtVQww9E4RescGAei8G6Q$d38id$, $d39id$ChIJuybujLq8rhIRmM4Hbz4rRFQ$d39id$, $d40id$ChIJE8Pk8Z68rhIRIwQ3R_hOxQM$d40id$, $d41id$ChIJgefPH6C8rhIRx_IFlYNtMRE$d41id$, $d42id$ChIJQRG2RJ68rhIRrxRTe3XvLfw$d42id$, $d43id$ChIJAe3bEZ68rhIRtXJfI_chEMk$d43id$, $d44id$ChIJtVsuyLi8rhIR-6KfeV7fXoM$d44id$, $d45id$ChIJvaA0K3K7rhIRwk0ujwDxGoQ$d45id$, $d46id$ChIJA1c6o6m9rhIRHDiCNvu4wik$d46id$, $d47id$ChIJD-tklGG7rhIRhP01h_smM-o$d47id$, $d48id$ChIJzyJH3GG9rhIR5BeF8DaN5-M$d48id$, $d49id$ChIJQ4acCocerBIRm_CumADxJZw$d49id$, $d50id$ChIJD2x7sGGlrhIRygXIWHptGFk$d50id$, $d51id$ChIJ__9DTY26rhIRw2RYHEv9DpE$d51id$, $d52id$ChIJg8zDw2u7rhIRlQM-_jHQ7iU$d52id$, $d53id$ChIJERdyerO9rhIRdYDqnfwNgJo$d53id$, $d54id$ChIJT49xKAC9rhIRZsOG4ydbIvw$d54id$, $d55id$ChIJo-aoL9zlWioR6UKYAztm9_M$d55id$, $d56id$ChIJVZ2nhHG7rhIR0jxEJoKfgW8$d56id$, $d57id$ChIJuYXJcv29rhIRk5ApepkAMis$d57id$, $d58id$ChIJo7KB-4K8rhIR84GiC0OV9Ms$d58id$, $d59id$ChIJc3Pyu568rhIRCkubBuZ-OWs$d59id$, $d60id$ChIJdatdqea9rhIRrjUAuPx6Xc4$d60id$, $d61id$ChIJKWOG-n29rhIROdf1oV7RxZk$d61id$, $d62id$ChIJ1QBS0va9rhIRbFiMCk7kYVE$d62id$, $d63id$ChIJIQR0UCS9rhIRcx0yULAkDpA$d63id$, $d64id$ChIJPw9ipJ68rhIRN1vh0sgeO9Q$d64id$, $d65id$ChIJd5ob2Aa9rhIRsRnuCYl5pvs$d65id$, $d66id$ChIJL1L8vL-7rhIRj-E6Cv2F9QA$d66id$, $d67id$ChIJcwE5wxyjrhIRkyeNzE8pVBE$d67id$, $d68id$ChIJE1FVhlq7rhIRs_9MVtiwhEU$d68id$, $d69id$ChIJm7WomfC9rhIRqXkJkkkEId0$d69id$, $d70id$ChIJp1BRqpy8rhIRBtoCRvElvt4$d70id$, $d71id$ChIJ_QRea3y9rhIRHKsot3PAW8s$d71id$, $d72id$ChIJV5ym2Z68rhIRxUjREqZrm9k$d72id$, $d73id$ChIJHzSr3oK8rhIROcM4MlwrHuw$d73id$, $d74id$ChIJrftUEA-9rhIR-4xkVgcJHpc$d74id$, $d75id$ChIJQ8jErXC9rhIRXvQAolRGunU$d75id$, $d76id$ChIJJxgxetK7rhIRCg7E0gnZX6k$d76id$, $d77id$ChIJx9TdnTijrhIRjFFWXZQygp8$d77id$, $d78id$ChIJq6_9vIexrhIRl7UYlLfHzMg$d78id$, $d79id$ChIJA51y8XtmfAIRaqqgO_FyhRo$d79id$, $d80id$ChIJye3lw3xbKWYRSaMXS9RQj7Y$d80id$, $d81id$ChIJHWH8nj29rhIRcHIpadBg4BM$d81id$, $d82id$ChIJueOLIQC7rhIRdsWdEopTqXI$d82id$, $d83id$ChIJR6bLCBO7rhIRWyfhQAn1v_M$d83id$)
      and latitude is not null
      and longitude is not null
      and location is null;
  elsif location_type like 'geometry%' then
    update public.craftsmans
    set location = ST_SetSRID(ST_MakePoint(longitude, latitude), 4326)
    where google_place_id in ($d0id$ChIJbxbMDbG9rhIRw7S4788aLDQ$d0id$, $d1id$ChIJn-XJDWK6rhIRFUfA28t27Qg$d1id$, $d2id$ChIJoQuQ5Ze8rhIR7koMZpMe3zg$d2id$, $d3id$ChIJb8L59LK9rhIRgZNiPbfFhTI$d3id$, $d4id$ChIJBY6Y3YK8rhIRc-NWCHvTLqI$d4id$, $d5id$ChIJrSc9VJ-8rhIRM4j-3TwyWWY$d5id$, $d6id$ChIJQ_znwQy7rhIR3JITAOiQRAk$d6id$, $d7id$ChIJVdhqeTq9rhIRMbaAW5DtWqI$d7id$, $d8id$ChIJ336pv2K7rhIRGPVIiU-bOtA$d8id$, $d9id$ChIJTeygJfOwrhIReHLWvnwBy44$d9id$, $d10id$ChIJSbsVWkO9rhIRzrP23HQJQuk$d10id$, $d11id$ChIJoTqrX129rhIRt8bHQOjfM3U$d11id$, $d12id$ChIJp42hucK7rhIRzrf9xUl6CKo$d12id$, $d13id$ChIJq6oeQnC7rhIRqOhx38rvDn0$d13id$, $d14id$ChIJuzRTYQC7rhIRPH_BQTODi78$d14id$, $d15id$ChIJ-0OlQsG9rhIRWz5qrEPhbHk$d15id$, $d16id$ChIJ88tDKH-9rhIR8z1sjL9Mz0I$d16id$, $d17id$ChIJPXUOL4m8rhIR-9q_H-YG8ig$d17id$, $d18id$ChIJoTDQRmC7rhIReRXRdFMq1Gk$d18id$, $d19id$ChIJr2Ggi829rhIRnMod63ahPIY$d19id$, $d20id$ChIJD1m5Vuq7rhIRHaC-s_lsjJw$d20id$, $d21id$ChIJRY3wj6C5rhIRUGDW_TrtyCI$d21id$, $d22id$ChIJVzwkG7GkrhIR2l0tT2a6VnI$d22id$, $d23id$ChIJUS3t0Ry9rhIRK00uliJxHXk$d23id$, $d24id$ChIJcz7xqsmVrhIRNW3Kuk5XeEA$d24id$, $d25id$ChIJxTrCDba8rhIRdEG_daSYvz4$d25id$, $d26id$ChIJOdbLl1m7rhIR0uCLCFOmQGk$d26id$, $d27id$ChIJyxOdpaa9rhIRxlWDqAIkZjw$d27id$, $d28id$ChIJ-fBmcya9rhIRbX5N_sz0tbg$d28id$, $d29id$ChIJARkbhmCjrhIRh-d0GNhF7kE$d29id$, $d30id$ChIJAQfeigi9rhIR8Lm6R6oxELM$d30id$, $d31id$ChIJF4Iw19q8rhIRFOOIr75ssFw$d31id$, $d32id$ChIJb_wufp68rhIREfF9pZ72UZs$d32id$, $d33id$ChIJFd8A4Jm8rhIR5ghexsy6gR0$d33id$, $d34id$ChIJM3oMcSe7rhIRQ32o6r_ziKs$d34id$, $d35id$ChIJARPfgRe9rhIRCro7v7JmwIM$d35id$, $d36id$ChIJH0W0Bx6jrhIRcYm2n-Ovqb0$d36id$, $d37id$ChIJz-ISnJq8rhIRvCtzGzN2iqo$d37id$, $d38id$ChIJ7_XtVQww9E4RescGAei8G6Q$d38id$, $d39id$ChIJuybujLq8rhIRmM4Hbz4rRFQ$d39id$, $d40id$ChIJE8Pk8Z68rhIRIwQ3R_hOxQM$d40id$, $d41id$ChIJgefPH6C8rhIRx_IFlYNtMRE$d41id$, $d42id$ChIJQRG2RJ68rhIRrxRTe3XvLfw$d42id$, $d43id$ChIJAe3bEZ68rhIRtXJfI_chEMk$d43id$, $d44id$ChIJtVsuyLi8rhIR-6KfeV7fXoM$d44id$, $d45id$ChIJvaA0K3K7rhIRwk0ujwDxGoQ$d45id$, $d46id$ChIJA1c6o6m9rhIRHDiCNvu4wik$d46id$, $d47id$ChIJD-tklGG7rhIRhP01h_smM-o$d47id$, $d48id$ChIJzyJH3GG9rhIR5BeF8DaN5-M$d48id$, $d49id$ChIJQ4acCocerBIRm_CumADxJZw$d49id$, $d50id$ChIJD2x7sGGlrhIRygXIWHptGFk$d50id$, $d51id$ChIJ__9DTY26rhIRw2RYHEv9DpE$d51id$, $d52id$ChIJg8zDw2u7rhIRlQM-_jHQ7iU$d52id$, $d53id$ChIJERdyerO9rhIRdYDqnfwNgJo$d53id$, $d54id$ChIJT49xKAC9rhIRZsOG4ydbIvw$d54id$, $d55id$ChIJo-aoL9zlWioR6UKYAztm9_M$d55id$, $d56id$ChIJVZ2nhHG7rhIR0jxEJoKfgW8$d56id$, $d57id$ChIJuYXJcv29rhIRk5ApepkAMis$d57id$, $d58id$ChIJo7KB-4K8rhIR84GiC0OV9Ms$d58id$, $d59id$ChIJc3Pyu568rhIRCkubBuZ-OWs$d59id$, $d60id$ChIJdatdqea9rhIRrjUAuPx6Xc4$d60id$, $d61id$ChIJKWOG-n29rhIROdf1oV7RxZk$d61id$, $d62id$ChIJ1QBS0va9rhIRbFiMCk7kYVE$d62id$, $d63id$ChIJIQR0UCS9rhIRcx0yULAkDpA$d63id$, $d64id$ChIJPw9ipJ68rhIRN1vh0sgeO9Q$d64id$, $d65id$ChIJd5ob2Aa9rhIRsRnuCYl5pvs$d65id$, $d66id$ChIJL1L8vL-7rhIRj-E6Cv2F9QA$d66id$, $d67id$ChIJcwE5wxyjrhIRkyeNzE8pVBE$d67id$, $d68id$ChIJE1FVhlq7rhIRs_9MVtiwhEU$d68id$, $d69id$ChIJm7WomfC9rhIRqXkJkkkEId0$d69id$, $d70id$ChIJp1BRqpy8rhIRBtoCRvElvt4$d70id$, $d71id$ChIJ_QRea3y9rhIRHKsot3PAW8s$d71id$, $d72id$ChIJV5ym2Z68rhIRxUjREqZrm9k$d72id$, $d73id$ChIJHzSr3oK8rhIROcM4MlwrHuw$d73id$, $d74id$ChIJrftUEA-9rhIR-4xkVgcJHpc$d74id$, $d75id$ChIJQ8jErXC9rhIRXvQAolRGunU$d75id$, $d76id$ChIJJxgxetK7rhIRCg7E0gnZX6k$d76id$, $d77id$ChIJx9TdnTijrhIRjFFWXZQygp8$d77id$, $d78id$ChIJq6_9vIexrhIRl7UYlLfHzMg$d78id$, $d79id$ChIJA51y8XtmfAIRaqqgO_FyhRo$d79id$, $d80id$ChIJye3lw3xbKWYRSaMXS9RQj7Y$d80id$, $d81id$ChIJHWH8nj29rhIRcHIpadBg4BM$d81id$, $d82id$ChIJueOLIQC7rhIRdsWdEopTqXI$d82id$, $d83id$ChIJR6bLCBO7rhIRWyfhQAn1v_M$d83id$)
      and latitude is not null
      and longitude is not null
      and location is null;
  end if;
end $$;
