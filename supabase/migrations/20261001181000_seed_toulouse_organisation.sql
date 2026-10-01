-- Seed event organisers, wedding planners, and event planners around Toulouse.
-- Only these google_place_id values are linked to Organisation subcategories.

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
  ($d0n$AGENCE LEAD$d0n$, $d0d$Organisateur d'événement à Toulouse.
Téléphone : 05 34 67 28 74
Site web : http://www.agence-lead.fr/
Note Google : 5/5 (29 avis)
Google Maps : https://maps.google.com/?cid=9718907593472179525&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d0d$, true, 43.6053844, 1.4378438, $d0a$34 Rue Valade$d0a$, $d0c$Toulouse$d0c$, $d0p$31000$d0p$, $d0g$ChIJ8zea62K7rhIRRX3BmfZ-4IY$d0g$, 5.0, 29, $d0s$Organisation d'événement$d0s$),
  ($d1n$ATT EVENTS$d1n$, $d1d$Event planner à Portet-sur-Garonne.
Site web : https://attevents.fr/
Note Google : 5/5 (24 avis)
Google Maps : https://maps.google.com/?cid=12526782075298969375&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d1d$, true, 43.524751699999996, 1.3769581, $d1a$48 Rte de Villeneuve$d1a$, $d1c$Portet-sur-Garonne$d1c$, $d1p$31120$d1p$, $d1g$ChIJE0rC9eu5rhIRH_fsgO0R2K0$d1g$, 5.0, 24, $d1s$Event planner$d1s$),
  ($d2n$ATevenements - bar événementiel$d2n$, $d2d$Organisateur d'événement à Toulouse.
Téléphone : 06 70 47 93 44
Site web : https://www.atevenements.fr/
Note Google : 5/5 (61 avis)
Google Maps : https://maps.google.com/?cid=10790396157759150696&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d2d$, true, 43.635672199999995, 1.4691836, $d2a$21 Rue Auguste Renoir$d2a$, $d2c$Toulouse$d2c$, $d2p$31200$d2p$, $d2g$ChIJj00BjEWjrhIRaFr5sCIwv5U$d2g$, 5.0, 61, $d2s$Organisation d'événement$d2s$),
  ($d3n$Agence 24 Events$d3n$, $d3d$Organisateur d'événement à Toulouse.
Téléphone : 06 78 43 55 16
Site web : https://www.agence24events.fr/
Note Google : 5/5 (58 avis)
Google Maps : https://maps.google.com/?cid=5518544325540381697&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d3d$, true, 43.601145599999995, 1.4421553999999999, $d3a$19 Pl. de la Bourse$d3a$, $d3c$Toulouse$d3c$, $d3p$31000$d3p$, $d3g$ChIJDQvv4Ji8rhIRAQQVWdPOlUw$d3g$, 5.0, 58, $d3s$Organisation d'événement$d3s$),
  ($d4n$Agence Brins d'Ivresse - Wedding Planner$d4n$, $d4d$Wedding planner à Toulouse.
Téléphone : 06 85 04 23 41
Site web : https://brinsdivresse.fr/
Note Google : 5/5 (38 avis)
Google Maps : https://maps.google.com/?cid=7033898939703137402&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d4d$, true, 43.5876417, 1.4690655, $d4a$1 Av. des Alpes$d4a$, $d4c$Toulouse$d4c$, $d4p$31400$d4p$, $d4g$ChIJ41f7EnhhrhIRepQAh9FtnWE$d4g$, 5.0, 38, $d4s$Wedding planner$d4s$),
  ($d5n$Agence Voulez-Vous$d5n$, $d5d$Organisateur d'événement à Toulouse.
Téléphone : 06 74 13 53 86
Site web : https://www.agence-voulez-vous.fr/
Note Google : 4.7/5 (75 avis)
Google Maps : https://maps.google.com/?cid=17175288622605988984&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d5d$, true, 43.602439, 1.4699168000000002, $d5a$Rue Salgues$d5a$, $d5c$Toulouse$d5c$, $d5p$31000$d5p$, $d5g$ChIJ9YHW11u9rhIRePQ88QDiWu4$d5g$, 4.7, 75, $d5s$Organisation d'événement$d5s$),
  ($d6n$Agence YE - Agence événementielle & de communication$d6n$, $d6d$Organisateur d'événement à Toulouse.
Téléphone : 05 61 38 75 19
Site web : http://www.agence-ye.fr/
Note Google : 5/5 (31 avis)
Google Maps : https://maps.google.com/?cid=548548209091323574&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d6d$, true, 43.5988494, 1.4541457, $d6a$32 Rue des Potiers$d6a$, $d6c$Toulouse$d6c$, $d6p$31000$d6p$, $d6g$ChIJz50K62K7rhIRtqYQmbDVnAc$d6g$, 5.0, 31, $d6s$Organisation d'événement$d6s$),
  ($d7n$Agence événementielle Ideal - Toulouse$d7n$, $d7d$Organisateur d'événement à Toulouse.
Téléphone : 05 36 09 00 77
Site web : https://group-ideal.fr/
Note Google : 4.3/5 (28 avis)
Google Maps : https://maps.google.com/?cid=5836899623519981551&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d7d$, true, 43.6090936, 1.4456023, $d7a$44 Bd de Strasbourg$d7a$, $d7c$Toulouse$d7c$, $d7p$31000$d7p$, $d7g$ChIJ4S6l1saWrhIR7w-FSUjVAFE$d7g$, 4.3, 28, $d7s$Organisation d'événement$d7s$),
  ($d8n$Anne-Laure Wedding + Design - Wedding planner Toulouse, Occitanie$d8n$, $d8d$Wedding planner à Toulouse.
Téléphone : 07 87 50 24 85
Site web : http://www.annelaureweddings.com/
Note Google : 5/5 (1 avis)
Google Maps : https://maps.google.com/?cid=8531555850597365774&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d8d$, true, 43.593799999999995, 1.4279319, $d8a$18 Rue Gazagne$d8a$, $d8c$Toulouse$d8c$, $d8p$31300$d8p$, $d8g$ChIJc8d-6Ja7rhIRDvhCENgsZnY$d8g$, 5.0, 1, $d8s$Wedding planner$d8s$),
  ($d9n$Atelier Camus - Faire-part - Decoration Mariage - Wedding Designer$d9n$, $d9d$Wedding planner à Toulouse.
Téléphone : 06 43 61 22 89
Site web : https://www.atelier-camus.com/
Note Google : 4.9/5 (119 avis)
Google Maps : https://maps.google.com/?cid=17487502430677092984&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d9d$, true, 43.5953476, 1.4196346, $d9a$52 Bd Gabriel Koenigs$d9a$, $d9c$Toulouse$d9c$, $d9p$31300$d9p$, $d9g$ChIJ9c-6AAy7rhIReMpJ1c4WsPI$d9g$, 4.9, 119, $d9s$Wedding planner$d9s$),
  ($d10n$Atypical Event$d10n$, $d10d$Wedding planner à L'Union.
Téléphone : 06 62 90 45 49
Site web : http://www.atypicalevent.fr/
Note Google : 5/5 (13 avis)
Google Maps : https://maps.google.com/?cid=17088838646276798958&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d10d$, true, 43.6625918, 1.4875587, $d10a$30 Rue de l'Autan Noir$d10a$, $d10c$L'Union$d10c$, $d10p$31240$d10p$, $d10g$ChIJS5uQrQSjrhIR7rlLTzXAJ-0$d10g$, 5.0, 13, $d10s$Wedding planner$d10s$),
  ($d11n$BPM Agency - Agence Evénementielle$d11n$, $d11d$Organisateur d'événement à Portet-sur-Garonne.
Téléphone : 05 82 99 12 69
Site web : http://www.bpmagency.fr/
Note Google : 5/5 (32 avis)
Google Maps : https://maps.google.com/?cid=9302729373981895848&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d11d$, true, 43.54295, 1.402827, $d11a$14 Rue Gaston Evrard$d11a$, $d11c$Portet-sur-Garonne$d11c$, $d11p$31120$d11p$, $d11g$ChIJKbTHqGK5rhIRqGzI4RPvGYE$d11g$, 5.0, 32, $d11s$Organisation d'événement$d11s$),
  ($d12n$Be Lounge Toulouse - Location tente et mobilier de réception$d12n$, $d12d$Event planner à Bessières.
Téléphone : 05 32 11 13 48
Site web : https://www.be-lounge.com/fr/
Note Google : 4.9/5 (49 avis)
Google Maps : https://maps.google.com/?cid=5363769089610048489&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d12d$, true, 43.7957755, 1.6062402999999998, $d12a$469 Av. de la Gare$d12a$, $d12c$Bessières$d12c$, $d12p$31660$d12p$, $d12g$ChIJd-kvDiy9rhIR6WNti5Hvb0o$d12g$, 4.9, 49, $d12s$Event planner$d12s$),
  ($d13n$Boum etc. | Mélanie | Wedding planner$d13n$, $d13d$Wedding planner à Toulouse.
Téléphone : 07 45 30 69 29
Site web : https://www.boumetc.fr/
Note Google : 5/5 (24 avis)
Google Maps : https://maps.google.com/?cid=10755459107052370514&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d13d$, true, 43.591534499999995, 1.4695555999999999, $d13a$5 Bd Deltour$d13a$, $d13c$Toulouse$d13c$, $d13p$31500$d13p$, $d13g$ChIJIzJSA0nwOSURUroYsBIRQ5U$d13g$, 5.0, 24, $d13s$Wedding planner$d13s$),
  ($d14n$By Evos$d14n$, $d14d$Organisateur d'événement à Toulouse.
Téléphone : 05 82 95 24 69
Site web : https://byevos.fr/?utm_source=google&utm_medium=organic&utm_campaign=gmb
Note Google : 5/5 (142 avis)
Google Maps : https://maps.google.com/?cid=10035723017108967526&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d14d$, true, 43.6065299, 1.3905687, $d14a$82 Rue de Maubec$d14a$, $d14c$Toulouse$d14c$, $d14p$31300$d14p$, $d14g$ChIJq6paBZyirhIRZtD9mukMRos$d14g$, 5.0, 142, $d14s$Organisation d'événement$d14s$),
  ($d15n$CE JOUR COMPTE - Toulouse$d15n$, $d15d$Organisateur d'événement à Le Fauga.
Téléphone : 06 71 60 57 86
Site web : https://cejourcompte.fr/
Note Google : 5/5 (63 avis)
Google Maps : https://maps.google.com/?cid=18016572876769919480&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d15d$, true, 43.404067399999995, 1.3047347999999999, $d15a$Imp. La Fontaine$d15a$, $d15c$Le Fauga$d15c$, $d15p$31410$d15p$, $d15g$ChIJsZfxWaSrgW8R-AHPVZO5B_o$d15g$, 5.0, 63, $d15s$Organisation d'événement$d15s$),
  ($d16n$Connexion Club$d16n$, $d16d$Organisateur d'événement à Toulouse.
Téléphone : 06 42 82 77 89
Site web : https://connexionclub.com/
Note Google : 5/5 (35 avis)
Google Maps : https://maps.google.com/?cid=14584987939077995503&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d16d$, true, 43.6282092, 1.44827, $d16a$8 Av. Maurice Bourgès-Maunoury$d16a$, $d16c$Toulouse$d16c$, $d16p$31200$d16p$, $d16g$ChIJAQAj5gy7rhIR77sZikFJaMo$d16g$, 5.0, 35, $d16s$Organisation d'événement$d16s$),
  ($d17n$D Day Wedding Planner Toulouse$d17n$, $d17d$Wedding planner à Balma.
Téléphone : 06 46 86 36 31
Site web : https://organisation-dday.com/wedding-planner/toulouse
Note Google : 5/5 (20 avis)
Google Maps : https://maps.google.com/?cid=8355052972353268130&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d17d$, true, 43.6261529, 1.4931710999999999, $d17a$27 Rue Joseph Hubert$d17a$, $d17c$Balma$d17c$, $d17p$31130$d17p$, $d17g$ChIJI1a4JzTuWaoRoimwUGkc83M$d17g$, 5.0, 20, $d17s$Wedding planner$d17s$),
  ($d18n$D-WE: Delphine - Wedding Events - Delphine GOUDY$d18n$, $d18d$Wedding planner à Tournefeuille.
Téléphone : 06 22 69 03 92
Site web : https://d-we.fr/
Note Google : 5/5 (40 avis)
Google Maps : https://maps.google.com/?cid=16128210538424451780&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d18d$, true, 43.5780095, 1.3364819, $d18a$32 Rue des Catalpas$d18a$, $d18c$Tournefeuille$d18c$, $d18p$31170$d18p$, $d18g$ChIJl2hO7OWwrhIRxEKApQjq0t8$d18g$, 5.0, 40, $d18s$Wedding planner$d18s$),
  ($d19n$DJ Dømi, expert en musiques pour évènements$d19n$, $d19d$Organisateur d'événement à Toulouse.
Téléphone : 06 51 93 99 11
Site web : https://d0mi.fr/
Note Google : 5/5 (34 avis)
Google Maps : https://maps.google.com/?cid=3903801735804244827&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d19d$, true, 43.5761739, 1.4795842, $d19a$72 Chem. Carrosse$d19a$, $d19c$Toulouse$d19c$, $d19p$31400$d19p$, $d19g$ChIJo7tM_fy9rhIRW1Mq2P4WLTY$d19g$, 5.0, 34, $d19s$Organisation d'événement$d19s$),
  ($d20n$DJ EVEN$d20n$, $d20d$Organisateur d'événement à Toulouse.
Téléphone : 06 49 44 81 88
Site web : http://djeven.com/
Note Google : 5/5 (202 avis)
Google Maps : https://maps.google.com/?cid=9867887533146063450&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d20d$, true, 43.6112034, 1.4356655999999999, $d20a$5 Esp. Compans Caffarelli$d20a$, $d20c$Toulouse$d20c$, $d20p$31000$d20p$, $d20g$ChIJpw-RX_m9rhIRWkKt2G3H8Yg$d20g$, 5.0, 202, $d20s$Organisation d'événement$d20s$),
  ($d21n$DJ Madame T-Relo / DJ professionnelle à Toulouse / DJ Toulouse Animation Mariage Haute Garonne 31$d21n$, $d21d$Organisateur d'événement à Toulouse.
Téléphone : 06 82 32 11 47
Site web : https://www.dj-madame-t-relo.fr/
Note Google : 5/5 (62 avis)
Google Maps : https://maps.google.com/?cid=7453870252634393039&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d21d$, true, 43.6343195, 1.4514395999999998, $d21a$29 Av. Maurice Bourgès-Maunoury$d21a$, $d21c$Toulouse$d21c$, $d21p$31200$d21p$, $d21g$ChIJQy6tvVKjrhIRz8kfooB3cWc$d21g$, 5.0, 62, $d21s$Organisation d'événement$d21s$),
  ($d22n$DJ Toulouse - Guillaume B - Guillaume BAUDRAND$d22n$, $d22d$Organisateur d'événement à Toulouse.
Téléphone : 06 47 00 83 64
Site web : https://www.instagram.com/glmb.dj/?hl=fr
Note Google : 5/5 (42 avis)
Google Maps : https://maps.google.com/?cid=18426292422040780043&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d22d$, true, 43.617200499999996, 1.4120688, $d22a$$d22a$, $d22c$Toulouse$d22c$, $d22p$31200$d22p$, $d22g$ChIJqawAhdEtmAsRC302x1RXt_8$d22g$, 5.0, 42, $d22s$Organisation d'événement$d22s$),
  ($d23n$Domaine du T$d23n$, $d23d$Wedding planner à Balma.
Téléphone : 06 80 65 69 71
Site web : https://www.domainedut.fr/?utm_source=Clic_Gmb&utm_medium=Gmb_To_Website&utm_campaign=Clic_Gmb
Note Google : 4.9/5 (244 avis)
Google Maps : https://maps.google.com/?cid=1723346778660126393&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d23d$, true, 43.6289558, 1.5116030999999999, $d23a$86 Rte du Chapitre$d23a$, $d23c$Balma$d23c$, $d23p$31130$d23p$, $d23g$ChIJH0h4aK2irhIRub7ZtsOO6hc$d23g$, 4.9, 244, $d23s$Wedding planner$d23s$),
  ($d24n$Décoratrice Mariage Toulouse - L'atelier de Mathild'$d24n$, $d24d$Wedding planner à Toulouse.
Téléphone : 06 67 60 83 36
Site web : https://www.atelier-mathild.fr/
Google Maps : https://maps.google.com/?cid=17988259558857271782&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d24d$, true, 43.6125579, 1.4021126, $d24a$109 Av. de Casselardit$d24a$, $d24c$Toulouse$d24c$, $d24p$31300$d24p$, $d24g$ChIJoRgoDyq7rhIR5mk2TcMio_k$d24g$, 0, 0, $d24s$Wedding planner$d24s$),
  ($d25n$Ellie Wedding$d25n$, $d25d$Wedding planner à Escalquens.
Téléphone : 06 98 36 39 24
Site web : https://www.elliewedding.fr/
Note Google : 5/5 (13 avis)
Google Maps : https://maps.google.com/?cid=14743207895532816364&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d25d$, true, 43.5185992, 1.5466970999999998, $d25a$Av. de Toulouse$d25a$, $d25c$Escalquens$d25c$, $d25p$31750$d25p$, $d25g$ChIJk8FVSJeVrhIR7Mf31ndlmsw$d25g$, 5.0, 13, $d25s$Wedding planner$d25s$),
  ($d26n$Eric Lempernesse$d26n$, $d26d$Event planner à Balma.
Téléphone : 06 83 47 39 36
Site web : https://ericlempernesse.com/?utm_source=Clic_GMB&utm_medium=GMB_To_Website&utm_campaign=Clic_GMB
Note Google : 5/5 (28 avis)
Google Maps : https://maps.google.com/?cid=3728206584541812028&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d26d$, true, 43.6136796, 1.4943501, $d26a$1 Rue Germinal$d26a$, $d26c$Balma$d26c$, $d26p$31130$d26p$, $d26g$ChIJGx1lFoG7rhIRPBXjwCJAvTM$d26g$, 5.0, 28, $d26s$Event planner$d26s$),
  ($d27n$Event Ewa Wedding Planner$d27n$, $d27d$Wedding planner à Toulouse.
Téléphone : 06 41 47 45 75
Site web : http://www.eventewa.com/
Note Google : 5/5 (109 avis)
Google Maps : https://maps.google.com/?cid=4750811451348019079&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d27d$, true, 43.6157666, 1.4496412, $d27a$27 Rue des Jumeaux$d27a$, $d27c$Toulouse$d27c$, $d27p$31200$d27p$, $d27g$ChIJARkbhmCjrhIRh-d0GNhF7kE$d27g$, 5.0, 109, $d27s$Wedding planner$d27s$),
  ($d28n$FIT GROUP Sport et Management$d28n$, $d28d$Event planner à Toulouse.
Site web : https://fitgroup.fr/
Note Google : 5/5 (7 avis)
Google Maps : https://maps.google.com/?cid=13292572588181725356&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d28d$, true, 43.6054592, 1.4069502999999999, $d28a$1 Imp. Mader$d28a$, $d28c$Toulouse$d28c$, $d28p$31300$d28p$, $d28g$ChIJ2416rEu7rhIRrKCqhVe0eLg$d28g$, 5.0, 7, $d28s$Event planner$d28s$),
  ($d29n$Fanka - Team Building Percussion Toulouse$d29n$, $d29d$Organisateur d'événement à Toulouse.
Téléphone : 06 63 69 48 92
Site web : https://www.fanka.fr/
Note Google : 5/5 (77 avis)
Google Maps : https://maps.google.com/?cid=11994112373434803394&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d29d$, true, 43.6026631, 1.4607367999999998, $d29a$7 Rue Saint-Ligory$d29a$, $d29c$Toulouse$d29c$, $d29p$31500$d29p$, $d29g$ChIJNXu0Qc-9rhIRwuSy9qelc6Y$d29g$, 5.0, 77, $d29s$Organisation d'événement$d29s$),
  ($d30n$Flex'events$d30n$, $d30d$Event planner à Toulouse.
Téléphone : 06 69 98 95 30
Site web : http://flex-events.fr/
Google Maps : https://maps.google.com/?cid=17948572363484898817&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d30d$, true, 43.57066280000001, 1.4273878, $d30a$20 Imp. Camille Langlade$d30a$, $d30c$Toulouse$d30c$, $d30p$31100$d30p$, $d30g$ChIJCadqMeu7rhIRASbpDngjFvk$d30g$, 0, 0, $d30s$Event planner$d30s$),
  ($d31n$Fêtes Nous Confiance$d31n$, $d31d$Wedding planner à Toulouse.
Téléphone : 06 31 42 58 60
Note Google : 4.6/5 (8 avis)
Google Maps : https://maps.google.com/?cid=13375805498674169143&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d31d$, true, 43.6139462, 1.4811657999999999, $d31a$38 Av. de l'Hers$d31a$, $d31c$Toulouse$d31c$, $d31p$31500$d31p$, $d31g$ChIJ-f-_tti8rhIRN8UwpTtooLk$d31g$, 4.6, 8, $d31s$Wedding planner$d31s$),
  ($d32n$HARMONIE MARIAGE$d32n$, $d32d$Wedding planner à Toulouse.
Téléphone : 06 36 48 98 10
Google Maps : https://maps.google.com/?cid=3430988976303541648&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d32d$, true, 43.618146599999996, 1.4541648999999999, $d32a$11 Rue de Turin$d32a$, $d32c$Toulouse$d32c$, $d32p$31500$d32p$, $d32g$ChIJfZH577q9rhIRkI3auEtSnS8$d32g$, 0, 0, $d32s$Wedding planner$d32s$),
  ($d33n$HRP Booking & Events$d33n$, $d33d$Event planner à Toulouse.
Google Maps : https://maps.google.com/?cid=2277307677360939762&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d33d$, true, 43.5973687, 1.4475939, $d33a$10 Rue Mage$d33a$, $d33c$Toulouse$d33c$, $d33p$31000$d33p$, $d33g$ChIJ6WGz2Ky9rhIR8mJeUUSfmh8$d33g$, 0, 0, $d33s$Event planner$d33s$),
  ($d34n$Halloween Agency - Toulouse$d34n$, $d34d$Organisateur d'événement à Toulouse.
Téléphone : 05 61 62 78 78
Site web : https://halloween.fr/
Note Google : 4.9/5 (62 avis)
Google Maps : https://maps.google.com/?cid=3097394340232454680&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d34d$, true, 43.597847, 1.4539453999999998, $d34a$16bis Rue des Potiers$d34a$, $d34c$Toulouse$d34c$, $d34p$31000$d34p$, $d34g$ChIJc-L70HK9rhIRGGLc4r0n_Co$d34g$, 4.9, 62, $d34s$Organisation d'événement$d34s$),
  ($d35n$Hōc Diē - Agence Événementielle & Wedding Planner Toulouse$d35n$, $d35d$Wedding planner à Saint-Jory.
Téléphone : 05 54 54 74 48
Site web : https://www.hocdie.com/
Note Google : 4.8/5 (56 avis)
Google Maps : https://maps.google.com/?cid=4308829256576810291&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d35d$, true, 43.7280421, 1.3835750999999998, $d35a$7 Chem. de Casselevres$d35a$, $d35c$Saint-Jory$d35c$, $d35p$31790$d35p$, $d35g$ChIJXYYS2aWnrhIRMz0SNGEJzDs$d35g$, 4.8, 56, $d35s$Wedding planner$d35s$),
  ($d36n$Impact Evolution - Cabinet de communication à Balma Toulouse$d36n$, $d36d$Organisateur d'événement à Balma.
Téléphone : 05 61 24 32 89
Site web : https://impact-evolution.fr/?utm_source=Clic_Gmb&utm_medium=Gmb_To_Website&utm_campaign=Clic_Gmb
Note Google : 4.8/5 (63 avis)
Google Maps : https://maps.google.com/?cid=17898477219094759066&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d36d$, true, 43.6133892, 1.5021338000000002, $d36a$7 Rte de Pin Balma$d36a$, $d36c$Balma$d36c$, $d36p$31130$d36p$, $d36g$ChIJ1X8ETEe9rhIRmoaQWDMqZPg$d36g$, 4.8, 63, $d36s$Organisation d'événement$d36s$),
  ($d37n$Instants Pétillants - Wedding Planner$d37n$, $d37d$Wedding planner à Toulouse.
Téléphone : 06 58 65 84 15
Site web : https://instantspetillantstl.wixsite.com/website-6
Note Google : 4/5 (4 avis)
Google Maps : https://maps.google.com/?cid=16881892900554641011&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d37d$, true, 43.600243899999995, 1.4080074999999999, $d37a$9 Rue André Savès$d37a$, $d37c$Toulouse$d37c$, $d37p$31300$d37p$, $d37g$ChIJrfwzlDa7rhIRc46_ISaISOo$d37g$, 4.0, 4, $d37s$Wedding planner$d37s$),
  ($d38n$J'ose et vous - agence d'événementiel & de communication$d38n$, $d38d$Event planner à Castelginest.
Téléphone : 06 26 33 56 06
Site web : http://jose-et-vous.fr/
Note Google : 5/5 (42 avis)
Google Maps : https://maps.google.com/?cid=10232735533661412719&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d38d$, true, 43.6977403, 1.4280864, $d38a$4 Imp. Nauze de l'Église$d38a$, $d38c$Castelginest$d38c$, $d38p$31780$d38p$, $d38g$ChIJL-c_5m6cCQ4Rb91npMD6AY4$d38g$, 5.0, 42, $d38s$Event planner$d38s$),
  ($d39n$L' Appart Toulouse$d39n$, $d39d$Organisateur d'événement à Toulouse.
Téléphone : 06 72 45 72 12
Site web : http://lappart-toulouse.fr/
Note Google : 4.9/5 (47 avis)
Google Maps : https://maps.google.com/?cid=2764617167042965529&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d39d$, true, 43.6006873, 1.4493079, $d39a$37 Rue de Metz$d39a$, $d39c$Toulouse$d39c$, $d39p$31000$d39p$, $d39g$ChIJZ_gGapu8rhIRGfCKdarkXSY$d39g$, 4.9, 47, $d39s$Organisation d'événement$d39s$),
  ($d40n$L'Atelier du Bonheur$d40n$, $d40d$Wedding planner à Toulouse.
Note Google : 3.9/5 (7 avis)
Google Maps : https://maps.google.com/?cid=15663270746586687140&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d40d$, true, 43.5865696, 1.4299188, $d40a$174 Av. de Muret$d40a$, $d40c$Toulouse$d40c$, $d40p$31300$d40p$, $d40g$ChIJq1zMKna7rhIRpCYRp8EdX9k$d40g$, 3.9, 7, $d40s$Wedding planner$d40s$),
  ($d41n$L'entourloutre$d41n$, $d41d$Organisateur d'événement à Toulouse.
Téléphone : 07 82 98 25 52
Site web : https://lentourloutre.fr/
Note Google : 5/5 (58 avis)
Google Maps : https://maps.google.com/?cid=6337138821150044428&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d41d$, true, 43.602768600000005, 1.4373004000000003, $d41a$34 Rue des Blanchers$d41a$, $d41c$Toulouse$d41c$, $d41p$31000$d41p$, $d41g$ChIJZSYVjpW7rhIRDHH8pi4K8lc$d41g$, 5.0, 58, $d41s$Organisation d'événement$d41s$),
  ($d42n$L'ÎLE DE TARA Domaine de réception - Mariages & Séminaires$d42n$, $d42d$Wedding planner à Eaunes.
Téléphone : 06 06 77 31 31
Site web : https://iledetara.com/
Note Google : 4.7/5 (152 avis)
Google Maps : https://maps.google.com/?cid=15500048653396370483&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d42d$, true, 43.444326, 1.370376, $d42a$1685 Chem. du Tucaut$d42a$, $d42c$Eaunes$d42c$, $d42p$31600$d42p$, $d42g$ChIJf_Ec3tbHrhIRM2T2oiA8G9c$d42g$, 4.7, 152, $d42s$Wedding planner$d42s$),
  ($d43n$La Dolce Vita - Wedding Planner et organisatrice de mariage à Toulouse$d43n$, $d43d$Wedding planner à Muret.
Téléphone : 06 10 77 33 62
Site web : https://www.la-dolce-vita.fr/
Note Google : 5/5 (81 avis)
Google Maps : https://maps.google.com/?cid=8327604406527959837&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d43d$, true, 43.4729607, 1.3227273, $d43a$Bd de Peyramont$d43a$, $d43c$Muret$d43c$, $d43p$31600$d43p$, $d43g$ChIJzQMKkWOurhIRHaMTERaYkXM$d43g$, 5.0, 81, $d43s$Wedding planner$d43s$),
  ($d44n$La Mariée Enjouée$d44n$, $d44d$Wedding planner à Rouffiac-Tolosan.
Site web : https://lamarieeenjouee.com/
Note Google : 5/5 (44 avis)
Google Maps : https://maps.google.com/?cid=6202285835586168774&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d44d$, true, 43.6647055, 1.5242392999999999, $d44a$5 All. des Platanes$d44a$, $d44c$Rouffiac-Tolosan$d44c$, $d44p$31180$d44p$, $d44g$ChIJtdb-zb-jrhIRxueMORvyElY$d44g$, 5.0, 44, $d44s$Wedding planner$d44s$),
  ($d45n$La Noche Voyages : Organisation de séjours étudiants !$d45n$, $d45d$Organisateur d'événement à Toulouse.
Téléphone : 05 31 47 90 53
Site web : https://www.lanochevoyages.com/
Note Google : 4.8/5 (856 avis)
Google Maps : https://maps.google.com/?cid=12260750142644409105&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d45d$, true, 43.570661, 1.4273878, $d45a$20 Imp. Camille Langlade$d45a$, $d45c$Toulouse$d45c$, $d45p$31100$d45p$, $d45g$ChIJo7Uq5Ja8rhIREdMjZEvvJqo$d45g$, 4.8, 856, $d45s$Organisation d'événement$d45s$),
  ($d46n$Le Grand Barathon - Toulouse$d46n$, $d46d$Organisateur d'événement à Toulouse.
Site web : https://legrandbarathon.com/toulouse/
Note Google : 5/5 (67 avis)
Google Maps : https://maps.google.com/?cid=3496289113286062876&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d46d$, true, 43.6090519, 1.4445629, $d46a$22 Rue Saint-Bernard$d46a$, $d46c$Toulouse$d46c$, $d46p$31000$d46p$, $d46g$ChIJ_4as-RS9rhIRHDN7pWxQhTA$d46g$, 5.0, 67, $d46s$Organisation d'événement$d46s$),
  ($d47n$Le Labo Ephémère$d47n$, $d47d$Organisateur d'événement à Toulouse.
Téléphone : 06 66 33 09 01
Site web : http://www.lelabo-ephemere.com/
Note Google : 5/5 (68 avis)
Google Maps : https://maps.google.com/?cid=15786890460739778871&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d47d$, true, 43.6029055, 1.4447591, $d47a$1 Pl. Roger Salengro$d47a$, $d47c$Toulouse$d47c$, $d47p$31000$d47p$, $d47g$ChIJOSitgpy8rhIRN7llRDtNFts$d47g$, 5.0, 68, $d47s$Organisation d'événement$d47s$),
  ($d48n$Le Showroom • bis$d48n$, $d48d$Wedding planner à Toulouse.
Téléphone : 06 52 09 66 89
Note Google : 5/5 (18 avis)
Google Maps : https://maps.google.com/?cid=12473895167823958965&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d48d$, true, 43.6096978, 1.4437124, $d48a$1 Rue de l'Arc$d48a$, $d48c$Toulouse$d48c$, $d48p$31000$d48p$, $d48g$ChIJo97mxOK9rhIRtdOby5AtHK0$d48g$, 5.0, 18, $d48s$Wedding planner$d48s$),
  ($d49n$Les Banquets Nature$d49n$, $d49d$Event planner à Toulouse.
Téléphone : 06 10 77 10 52
Note Google : 5/5 (1 avis)
Google Maps : https://maps.google.com/?cid=17071722394882350862&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d49d$, true, 43.6471855, 1.4391802999999999, $d49a$Rte de Launaguet$d49a$, $d49c$Toulouse$d49c$, $d49p$31200$d49p$, $d49g$ChIJWY8TG0WlrhIRDh8LexHx6uw$d49g$, 5.0, 1, $d49s$Event planner$d49s$),
  ($d50n$Les Compagnons du Fromage$d50n$, $d50d$Organisateur d'événement à Toulouse.
Téléphone : 06 46 46 30 86
Site web : http://lescompagnonsdufromage.com/
Note Google : 5/5 (398 avis)
Google Maps : https://maps.google.com/?cid=18382719201773867753&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d50d$, true, 43.594966799999995, 1.4441661, $d50a$23 Pl. du Salin$d50a$, $d50c$Toulouse$d50c$, $d50p$31000$d50p$, $d50g$ChIJ3T2nRjm4XwcR6dJ727eJHP8$d50g$, 5.0, 398, $d50s$Organisation d'événement$d50s$),
  ($d51n$Les Petites Pépites dj$d51n$, $d51d$Organisateur d'événement à Toulouse.
Téléphone : 06 31 41 26 11
Site web : http://les-petites-pepites.fr/
Note Google : 5/5 (151 avis)
Google Maps : https://maps.google.com/?cid=17161826223137761101&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d51d$, true, 43.5987194, 1.4361055, $d51a$8 Rue de la République$d51a$, $d51c$Toulouse$d51c$, $d51p$31300$d51p$, $d51g$ChIJWUgF33q7rhIRTScczwUOK-4$d51g$, 5.0, 151, $d51s$Organisation d'événement$d51s$),
  ($d52n$Les Prémices De M$d52n$, $d52d$Wedding planner à Villeneuve-Tolosane.
Téléphone : 06 98 83 18 84
Site web : https://lespremicesdem.fr/
Note Google : 4.8/5 (48 avis)
Google Maps : https://maps.google.com/?cid=9862534960289341111&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d52d$, true, 43.5265961, 1.3244171999999999, $d52a$1 Rue des Jonquilles$d52a$, $d52c$Villeneuve-Tolosane$d52c$, $d52p$31270$d52p$, $d52g$ChIJp4dgp-O2rhIRt97q3ErD3og$d52g$, 4.8, 48, $d52s$Wedding planner$d52s$),
  ($d53n$Les romances de Marie$d53n$, $d53d$Wedding planner à Toulouse.
Téléphone : 06 95 58 80 87
Site web : https://www.lesromancesdemarie.com/
Note Google : 4.9/5 (43 avis)
Google Maps : https://maps.google.com/?cid=11132913657492177013&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d53d$, true, 43.611019999999996, 1.447706, $d53a$18 Rue de l'Orient$d53a$, $d53c$Toulouse$d53c$, $d53p$31000$d53p$, $d53g$ChIJERdyerO9rhIRdYDqnfwNgJo$d53g$, 4.9, 43, $d53s$Wedding planner$d53s$),
  ($d54n$Les rêves d'Aurore$d54n$, $d54d$Wedding planner à Toulouse.
Téléphone : 07 62 67 30 00
Site web : https://www.lesrevesdaurore.com/?utm_source=google&utm_medium=wix_google_business_profile&utm_campaign=9333137602507018426
Note Google : 5/5 (4 avis)
Google Maps : https://maps.google.com/?cid=1127399887454208595&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d54d$, true, 43.5631522, 1.3792923, $d54a$38 Chem. de Liffard$d54a$, $d54c$Toulouse$d54c$, $d54p$31100$d54p$, $d54g$ChIJhZJ7dAW7rhIRUwKGczlUpQ8$d54g$, 5.0, 4, $d54s$Wedding planner$d54s$),
  ($d55n$Loc2lux Events - Location Matériels pour évènements ( Mariage, Baby shower, Fêtes privés... )$d55n$, $d55d$Wedding planner à Cugnaux.
Téléphone : 09 70 70 85 45
Site web : http://www.loc2lux.fr/
Note Google : 5/5 (202 avis)
Google Maps : https://maps.google.com/?cid=392456138578651466&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d55d$, true, 43.5363318, 1.3610045, $d55a$4bis Rue Alfred Sauvy$d55a$, $d55c$Cugnaux$d55c$, $d55p$31270$d55p$, $d55g$ChIJ2WPAH7y5rhIRSunmWcdIcgU$d55g$, 5.0, 202, $d55s$Wedding planner$d55s$),
  ($d56n$Location Salle Toulouse - La péniche Saint-Louis$d56n$, $d56d$Organisateur d'événement à Toulouse.
Téléphone : 07 61 92 39 57
Site web : https://peniche-saint-louis.fr/
Note Google : 4.4/5 (121 avis)
Google Maps : https://maps.google.com/?cid=16771155122751893834&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d56d$, true, 43.594414799999996, 1.457247, $d56a$35 Bd Griffoul Dorval$d56a$, $d56c$Toulouse$d56c$, $d56p$31400$d56p$, $d56g$ChIJg6H1MGC8rhIRSnGZDLocv-g$d56g$, 4.4, 121, $d56s$Organisation d'événement$d56s$),
  ($d57n$MAM Events$d57n$, $d57d$Wedding planner à Cornebarrieu.
Téléphone : 06 56 66 60 70
Site web : https://mamevents.com/
Note Google : 5/5 (33 avis)
Google Maps : https://maps.google.com/?cid=16049213482455494049&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d57d$, true, 43.6466494, 1.3209899, $d57a$2 Chem. des Syndics$d57a$, $d57c$Cornebarrieu$d57c$, $d57p$31700$d57p$, $d57g$ChIJFxUUUGS6rhIRoW0rQqFCut4$d57g$, 5.0, 33, $d57s$Wedding planner$d57s$),
  ($d58n$Madame Etincelle - Wedding & Event planner$d58n$, $d58d$Wedding planner à Saint-Jory.
Téléphone : 06 30 16 98 40
Site web : http://www.madame-etincelle.fr/
Note Google : 5/5 (25 avis)
Google Maps : https://maps.google.com/?cid=9069027741764056395&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d58d$, true, 43.734428799999996, 1.3616979, $d58a$10 Chem. de la Claou$d58a$, $d58c$Saint-Jory$d58c$, $d58p$31790$d58p$, $d58g$ChIJlTuK4BaL328RS3UCbq6o230$d58g$, 5.0, 25, $d58s$Wedding planner$d58s$),
  ($d59n$Madaré$d59n$, $d59d$Organisateur d'événement à Toulouse.
Téléphone : 05 34 26 00 39
Site web : http://madare.com/fr
Note Google : 4.9/5 (35 avis)
Google Maps : https://maps.google.com/?cid=13557442763923445955&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d59d$, true, 43.6061421, 1.4236771, $d59a$51 Rue des Amidonniers$d59a$, $d59c$Toulouse$d59c$, $d59p$31000$d59p$, $d59g$ChIJMdTPPDO6rhIRw9hYBl22Jbw$d59g$, 4.9, 35, $d59s$Organisation d'événement$d59s$),
  ($d60n$Maison Alchimie - Collectif prestataire mariage à Toulouse$d60n$, $d60d$Wedding planner à Toulouse.
Téléphone : 06 09 54 82 17
Site web : https://maisonalchimie-mariage.com/
Note Google : 5/5 (9 avis)
Google Maps : https://maps.google.com/?cid=2099585814969751283&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d60d$, true, 43.6023012, 1.4472171, $d60a$14 Pl. Saint-Georges$d60a$, $d60c$Toulouse$d60c$, $d60p$31000$d60p$, $d60g$ChIJNW-z33S9rhIR85a4tCw6Ix0$d60g$, 5.0, 9, $d60s$Wedding planner$d60s$),
  ($d61n$Mc2 Mon Amour Toulouse$d61n$, $d61d$Wedding planner à Fonbeauzard.
Téléphone : 06 17 31 48 73
Site web : https://mc2monamour-toulouse.com/
Note Google : 5/5 (18 avis)
Google Maps : https://maps.google.com/?cid=5235153636528686930&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d61d$, true, 43.6775765, 1.43296, $d61a$62 Chem. de Raudelauzette$d61a$, $d61c$Fonbeauzard$d61c$, $d61p$31140$d61p$, $d61g$ChIJ-xqRMAulrhIRUgfj0X4Ap0g$d61g$, 5.0, 18, $d61s$Wedding planner$d61s$),
  ($d62n$Meeting Lab$d62n$, $d62d$Organisateur d'événement à Toulouse.
Téléphone : 05 34 25 33 00
Site web : http://www.meetinglab-europa.com/
Note Google : 4.8/5 (190 avis)
Google Maps : https://maps.google.com/?cid=17739177409258066208&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d62d$, true, 43.603321, 1.444356, $d62a$5 Rue Saint-Pantaléon$d62a$, $d62c$Toulouse$d62c$, $d62p$31000$d62p$, $d62g$ChIJVRBLk528rhIRIBF2Ft43LvY$d62g$, 4.8, 190, $d62s$Organisation d'événement$d62s$),
  ($d63n$Merci Mumu$d63n$, $d63d$Event planner à Toulouse.
Téléphone : 07 88 29 03 30
Site web : http://mercimumu.com/
Note Google : 5/5 (1 avis)
Google Maps : https://maps.google.com/?cid=80774513397222030&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d63d$, true, 43.6012785, 1.4481887, $d63a$1 R. d'Astorg$d63a$, $d63c$Toulouse$d63c$, $d63p$31000$d63p$, $d63g$ChIJM3xuZ5S9rhIRjkry8f33HgE$d63g$, 5.0, 1, $d63s$Event planner$d63s$),
  ($d64n$Mersin Organisation$d64n$, $d64d$Wedding planner à Toulouse.
Téléphone : 07 68 00 31 30
Note Google : 5/5 (1 avis)
Google Maps : https://maps.google.com/?cid=4997222389513635305&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d64d$, true, 43.6250029, 1.4302621, $d64a$66 Bd Silvio Trentin$d64a$, $d64c$Toulouse$d64c$, $d64p$31200$d64p$, $d64g$ChIJqXvcFcG7rhIR6cWWbkmzWUU$d64g$, 5.0, 1, $d64s$Wedding planner$d64s$),
  ($d65n$Momento Event$d65n$, $d65d$Organisateur d'événement à Toulouse.
Téléphone : 05 31 47 90 53
Site web : https://momento-event.com/
Note Google : 5/5 (28 avis)
Google Maps : https://maps.google.com/?cid=2615123694331950331&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d65d$, true, 43.570661, 1.4273878, $d65a$20 Imp. Camille Langlade$d65a$, $d65c$Toulouse$d65c$, $d65p$31100$d65p$, $d65g$ChIJDVFeshO7rhIR-_Rc_CTJSiQ$d65g$, 5.0, 28, $d65s$Organisation d'événement$d65s$),
  ($d66n$Nana Event’s$d66n$, $d66d$Wedding planner à Fenouillet.
Téléphone : 06 85 90 97 38
Note Google : 5/5 (1 avis)
Google Maps : https://maps.google.com/?cid=4093935663196713590&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d66d$, true, 43.6817165, 1.3921214000000002, $d66a$Rue Étienne Billières$d66a$, $d66c$Fenouillet$d66c$, $d66p$31150$d66p$, $d66g$ChIJFT3lFtKlrhIRdrIkisuU0Dg$d66g$, 5.0, 1, $d66s$Wedding planner$d66s$),
  ($d67n$Noces Uchroniques - Wedding Planner$d67n$, $d67d$Wedding planner à Toulouse.
Téléphone : 06 71 91 66 75
Site web : https://www.noces-uchroniques.fr/
Note Google : 5/5 (1 avis)
Google Maps : https://maps.google.com/?cid=2874895500475595950&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d67d$, true, 43.6346576, 1.4294932, $d67a$1 Rue de la Louisiane$d67a$, $d67c$Toulouse$d67c$, $d67p$31200$d67p$, $d67g$ChIJ2QXXKY9nvK0Rrnw30Dmu5Sc$d67g$, 5.0, 1, $d67s$Wedding planner$d67s$),
  ($d68n$Notre Envie Mariage$d68n$, $d68d$Wedding planner à Toulouse.
Téléphone : 06 61 94 78 30
Site web : https://www.notreenvie.com/
Note Google : 4.9/5 (35 avis)
Google Maps : https://maps.google.com/?cid=13542642792455522222&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d68d$, true, 43.642508899999996, 1.4562852, $d68a$26 Chem. de Borderouge$d68a$, $d68c$Toulouse$d68c$, $d68p$31200$d68p$, $d68g$ChIJSWB_1OS7rhIRrsdQJN4h8bs$d68g$, 4.9, 35, $d68s$Wedding planner$d68s$),
  ($d69n$OandB - Billetterie en ligne$d69n$, $d69d$Organisateur d'événement à Toulouse.
Téléphone : 05 37 07 33 34
Site web : http://www.oandb.fr/
Note Google : 5/5 (72 avis)
Google Maps : https://maps.google.com/?cid=13998989253732605611&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d69d$, true, 43.596958, 1.4458107999999998, $d69a$34 Rue du Languedoc$d69a$, $d69c$Toulouse$d69c$, $d69p$31000$d69p$, $d69g$ChIJp3an4gu-rhIRqx4-c45mRsI$d69g$, 5.0, 72, $d69s$Organisation d'événement$d69s$),
  ($d70n$Oui Wedding - Wedding Planner Toulouse$d70n$, $d70d$Wedding planner à Bruguières.
Téléphone : 06 67 43 38 78
Site web : https://www.oui-agencewedding.fr/?utm_source=google&utm_medium=wix_google_business_profile&utm_campaign=2675525400859659903
Note Google : 5/5 (2 avis)
Google Maps : https://maps.google.com/?cid=56820393313702668&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d70d$, true, 43.7326299, 1.4045147, $d70a$18 Rue de la Briqueterie$d70a$, $d70c$Bruguières$d70c$, $d70p$31150$d70p$, $d70g$ChIJOUJOIEchcUgRDBN2v9jdyQA$d70g$, 5.0, 2, $d70s$Wedding planner$d70s$),
  ($d71n$PADJ.fr$d71n$, $d71d$Organisateur d'événement à Toulouse.
Téléphone : 07 67 27 36 62
Site web : https://padj.fr/
Note Google : 4.9/5 (52 avis)
Google Maps : https://maps.google.com/?cid=292272301547093635&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d71d$, true, 43.597670799999996, 1.4196271, $d71a$91 Bd Gabriel Koenigs$d71a$, $d71c$Toulouse$d71c$, $d71p$31300$d71p$, $d71g$ChIJ80KRAh27rhIRg35mFxxcDgQ$d71g$, 4.9, 52, $d71s$Organisation d'événement$d71s$),
  ($d72n$PUR'events L'agence événementielle créative et engagée$d72n$, $d72d$Organisateur d'événement à L'Union.
Téléphone : 05 34 25 68 30
Site web : http://www.purevents.fr/
Note Google : 5/5 (177 avis)
Google Maps : https://maps.google.com/?cid=18321021455671889774&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d72d$, true, 43.655864799999996, 1.4772736, $d72a$Les Ambassadeurs, 2 All. des Nymphéas Bât A3$d72a$, $d72c$L'Union$d72c$, $d72p$31240$d72p$, $d72g$ChIJ8QQvYRujrhIRbg-i6_FXQf4$d72g$, 5.0, 177, $d72s$Organisation d'événement$d72s$),
  ($d73n$Pack Arbre de Noel$d73n$, $d73d$Event planner à Toulouse.
Téléphone : 05 82 95 80 69
Site web : https://www.packarbredenoel.com/animation-de-noel-toulouse/
Google Maps : https://maps.google.com/?cid=16105001123136477543&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d73d$, true, 43.602528, 1.452102, $d73a$18 Bd Lazare Carnot$d73a$, $d73c$Toulouse$d73c$, $d73p$31000$d73p$, $d73g$ChIJjSOuW7O6rhIRZxnRizF1gN8$d73g$, 0, 0, $d73s$Event planner$d73s$),
  ($d74n$Platines et Cocktails | Bar à cocktails mobile • Atelier cocktails • Sonorisation$d74n$, $d74d$Organisateur d'événement à Toulouse.
Téléphone : 06 63 10 69 34
Site web : https://platinesetcocktails.fr/
Note Google : 5/5 (313 avis)
Google Maps : https://maps.google.com/?cid=13748741930471737053&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d74d$, true, 43.6182941, 1.4537346999999998, $d74a$5 Rue de Turin$d74a$, $d74c$Toulouse$d74c$, $d74p$31500$d74p$, $d74g$ChIJB7usnVi7rhIR3UZJGvFXzb4$d74g$, 5.0, 313, $d74s$Organisation d'événement$d74s$),
  ($d75n$Psb Lounge$d75n$, $d75d$Organisateur d'événement à Verdun-sur-Garonne.
Téléphone : 05 61 50 80 07
Site web : https://www.psb-lounge.fr/
Note Google : 5/5 (100 avis)
Google Maps : https://maps.google.com/?cid=13199251655021109432&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d75d$, true, 43.822493, 1.2443074, $d75a$ZI la FAOUQUETTE, 45 rue Hélène boucher$d75a$, $d75c$Verdun-sur-Garonne$d75c$, $d75p$82600$d75p$, $d75g$ChIJJREC7DOYrhIRuCCFlnIpLbc$d75g$, 5.0, 100, $d75s$Organisation d'événement$d75s$),
  ($d76n$Rk Event$d76n$, $d76d$Organisateur d'événement à Toulouse.
Téléphone : 06 69 74 77 62
Site web : https://www.dj-rk.fr/
Note Google : 5/5 (34 avis)
Google Maps : https://maps.google.com/?cid=1077661185843294509&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d76d$, true, 43.610039799999996, 1.4438031000000002, $d76a$Rue de la Pomme$d76a$, $d76c$Toulouse$d76c$, $d76p$31000$d76p$, $d76g$ChIJXzzM0AW9rhIRLXFqiiOf9A4$d76g$, 5.0, 34, $d76s$Organisation d'événement$d76s$),
  ($d77n$Rêves en Fête - Agence événementielle et décoration$d77n$, $d77d$Organisateur d'événement à Fontenilles.
Téléphone : 06 74 28 74 12
Site web : https://www.reves-en-fete.fr/
Note Google : 4.6/5 (38 avis)
Google Maps : https://maps.google.com/?cid=15701618364604079806&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d77d$, true, 43.558887399999996, 1.1747435, $d77a$2 bis Av. de Gascogne$d77a$, $d77c$Fontenilles$d77c$, $d77p$31470$d77p$, $d77g$ChIJQyTIXV2xrhIRvt75PLZa59k$d77g$, 4.6, 38, $d77s$Organisation d'événement$d77s$),
  ($d78n$Social Events (Photobooth - Vidéobooth 360° - Karaoké - Réalité Virtuelle - Social Wall - Totem intéractifs)$d78n$, $d78d$Organisateur d'événement à Toulouse.
Téléphone : 06 82 34 56 16
Site web : https://www.social-events.fr/
Note Google : 5/5 (101 avis)
Google Maps : https://maps.google.com/?cid=10432302518615698188&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d78d$, true, 43.6311335, 1.4324177, $d78a$78 Av. des États-Unis$d78a$, $d78c$Toulouse$d78c$, $d78p$31200$d78p$, $d78g$ChIJUb0CX7KkrhIRDGuAM977xpA$d78g$, 5.0, 101, $d78s$Organisation d'événement$d78s$),
  ($d79n$Stand up comedy Toulouse$d79n$, $d79d$Organisateur d'événement à Toulouse.
Téléphone : 06 88 01 39 64
Site web : https://www.toulousecomedy.com/
Note Google : 5/5 (47 avis)
Google Maps : https://maps.google.com/?cid=17750151418063542545&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d79d$, true, 43.6145205, 1.4244169000000002, $d79a$43 Rue Roland Garros Centre Eloha$d79a$, $d79c$Toulouse$d79c$, $d79p$31200$d79p$, $d79g$ChIJp-sUzO-9rhIREdkSn6s0VfY$d79g$, 5.0, 47, $d79s$Organisation d'événement$d79s$),
  ($d80n$Team Cohésion - Team Building - Coaching Professionnel - Evènementiel$d80n$, $d80d$Event planner à Balma.
Téléphone : 05 62 24 96 86
Site web : http://www.team-cohesion.com/
Note Google : 4.8/5 (4 avis)
Google Maps : https://maps.google.com/?cid=1490462671571441524&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d80d$, true, 43.6132079, 1.4946442, $d80a$28 Rue Saint-Jean$d80a$, $d80c$Balma$d80c$, $d80p$31130$d80p$, $d80g$ChIJUUgbep2irhIRdNf-KecvrxQ$d80g$, 4.8, 4, $d80s$Event planner$d80s$),
  ($d81n$The Most Beautiful Days - Wedding Planner Toulouse$d81n$, $d81d$Wedding planner à Péchaudier.
Téléphone : 06 65 93 17 35
Site web : https://themostbeautifuldays.com/
Note Google : 5/5 (23 avis)
Google Maps : https://maps.google.com/?cid=12951069654140568897&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d81d$, true, 43.538002999999996, 1.9389706, $d81a$1 Chem. de la Fedougne$d81a$, $d81c$Péchaudier$d81c$, $d81p$81470$d81p$, $d81g$ChIJYVXC_6W7rhIRQcVjlDtxu7M$d81g$, 5.0, 23, $d81s$Wedding planner$d81s$),
  ($d82n$Toul'events$d82n$, $d82d$Organisateur d'événement à Toulouse.
Téléphone : 09 80 83 96 89
Site web : https://toulevents.com/
Note Google : 4.7/5 (33 avis)
Google Maps : https://maps.google.com/?cid=12513516268678019019&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d82d$, true, 43.598851599999996, 1.4539449, $d82a$27 Rue des Potiers$d82a$, $d82c$Toulouse$d82c$, $d82p$31000$d82p$, $d82g$ChIJnWBWvvq8rhIRy_efNb_wqK0$d82g$, 4.7, 33, $d82s$Organisation d'événement$d82s$),
  ($d83n$Twist n'Chic Events Wedding planner Toulouse$d83n$, $d83d$Wedding planner à Pibrac.
Téléphone : 06 86 74 89 50
Site web : http://www.twistandchic.fr/
Note Google : 4.9/5 (42 avis)
Google Maps : https://maps.google.com/?cid=18061311006282551900&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d83d$, true, 43.6163637, 1.2765685, $d83a$Rue des Abeilles$d83a$, $d83c$Pibrac$d83c$, $d83p$31820$d83p$, $d83g$ChIJX_zHlHmzrhIRXBJT06qqpvo$d83g$, 4.9, 42, $d83s$Wedding planner$d83s$),
  ($d84n$VR Show - Agence Réalité virtuelle$d84n$, $d84d$Organisateur d'événement à Toulouse.
Téléphone : 06 07 24 01 05
Site web : http://www.vr-show.fr/
Note Google : 4.8/5 (42 avis)
Google Maps : https://maps.google.com/?cid=13023814667326170229&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d84d$, true, 43.6322083, 1.4321203999999998, $d84a$94 Av. des États-Unis$d84a$, $d84c$Toulouse$d84c$, $d84p$31200$d84p$, $d84g$ChIJQYV9aby8rhIRdaR_0m_ivbQ$d84g$, 4.8, 42, $d84s$Organisation d'événement$d84s$),
  ($d85n$ZeBigTeuf - DJ Animation mariages et soirées Toulouse et région 31$d85n$, $d85d$Organisateur d'événement à Toulouse.
Téléphone : 06 88 20 10 00
Site web : https://www.zebigteuf.com/?utm_medium=referral&utm_source=gmb&utm_campaign=lnk-gmb
Note Google : 4.7/5 (68 avis)
Google Maps : https://maps.google.com/?cid=14553129114867874150&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d85d$, true, 43.5808548, 1.4903494, $d85a$5 Rue Pons Capdenier$d85a$, $d85c$Toulouse$d85c$, $d85p$31500$d85p$, $d85g$ChIJkya97X68rhIRZjkY_tIZ98k$d85g$, 4.7, 68, $d85s$Organisation d'événement$d85s$),
  ($d86n$nextERA$d86n$, $d86d$Event planner à Toulouse.
Google Maps : https://maps.google.com/?cid=11008343902778492823&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d86d$, true, 43.6041415, 1.447207, $d86a$6 Pl. du Président Thomas Wilson$d86a$, $d86c$Toulouse$d86c$, $d86p$31000$d86p$, $d86g$ChIJeS2x8aa9rhIRlwdzcnR-xZg$d86g$, 0, 0, $d86s$Event planner$d86s$),
  ($d87n$Ô fil de l'eau évènements$d87n$, $d87d$Event planner à Grépiac.
Téléphone : 06 72 86 65 68
Site web : https://ofildeleauevenements.fr/
Note Google : 5/5 (239 avis)
Google Maps : https://maps.google.com/?cid=3950272997160557149&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d87d$, true, 43.410122699999995, 1.4441386999999999, $d87a$1 Rte de Venerque$d87a$, $d87c$Grépiac$d87c$, $d87p$31190$d87p$, $d87g$ChIJI-SCoXWLa4oRXZqSiVww0jY$d87g$, 5.0, 239, $d87s$Event planner$d87s$)
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
  ($d0n$AGENCE LEAD$d0n$, $d0d$Organisateur d'événement à Toulouse.
Téléphone : 05 34 67 28 74
Site web : http://www.agence-lead.fr/
Note Google : 5/5 (29 avis)
Google Maps : https://maps.google.com/?cid=9718907593472179525&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d0d$, true, 43.6053844, 1.4378438, $d0a$34 Rue Valade$d0a$, $d0c$Toulouse$d0c$, $d0p$31000$d0p$, $d0g$ChIJ8zea62K7rhIRRX3BmfZ-4IY$d0g$, 5.0, 29, $d0s$Organisation d'événement$d0s$),
  ($d1n$ATT EVENTS$d1n$, $d1d$Event planner à Portet-sur-Garonne.
Site web : https://attevents.fr/
Note Google : 5/5 (24 avis)
Google Maps : https://maps.google.com/?cid=12526782075298969375&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d1d$, true, 43.524751699999996, 1.3769581, $d1a$48 Rte de Villeneuve$d1a$, $d1c$Portet-sur-Garonne$d1c$, $d1p$31120$d1p$, $d1g$ChIJE0rC9eu5rhIRH_fsgO0R2K0$d1g$, 5.0, 24, $d1s$Event planner$d1s$),
  ($d2n$ATevenements - bar événementiel$d2n$, $d2d$Organisateur d'événement à Toulouse.
Téléphone : 06 70 47 93 44
Site web : https://www.atevenements.fr/
Note Google : 5/5 (61 avis)
Google Maps : https://maps.google.com/?cid=10790396157759150696&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d2d$, true, 43.635672199999995, 1.4691836, $d2a$21 Rue Auguste Renoir$d2a$, $d2c$Toulouse$d2c$, $d2p$31200$d2p$, $d2g$ChIJj00BjEWjrhIRaFr5sCIwv5U$d2g$, 5.0, 61, $d2s$Organisation d'événement$d2s$),
  ($d3n$Agence 24 Events$d3n$, $d3d$Organisateur d'événement à Toulouse.
Téléphone : 06 78 43 55 16
Site web : https://www.agence24events.fr/
Note Google : 5/5 (58 avis)
Google Maps : https://maps.google.com/?cid=5518544325540381697&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d3d$, true, 43.601145599999995, 1.4421553999999999, $d3a$19 Pl. de la Bourse$d3a$, $d3c$Toulouse$d3c$, $d3p$31000$d3p$, $d3g$ChIJDQvv4Ji8rhIRAQQVWdPOlUw$d3g$, 5.0, 58, $d3s$Organisation d'événement$d3s$),
  ($d4n$Agence Brins d'Ivresse - Wedding Planner$d4n$, $d4d$Wedding planner à Toulouse.
Téléphone : 06 85 04 23 41
Site web : https://brinsdivresse.fr/
Note Google : 5/5 (38 avis)
Google Maps : https://maps.google.com/?cid=7033898939703137402&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d4d$, true, 43.5876417, 1.4690655, $d4a$1 Av. des Alpes$d4a$, $d4c$Toulouse$d4c$, $d4p$31400$d4p$, $d4g$ChIJ41f7EnhhrhIRepQAh9FtnWE$d4g$, 5.0, 38, $d4s$Wedding planner$d4s$),
  ($d5n$Agence Voulez-Vous$d5n$, $d5d$Organisateur d'événement à Toulouse.
Téléphone : 06 74 13 53 86
Site web : https://www.agence-voulez-vous.fr/
Note Google : 4.7/5 (75 avis)
Google Maps : https://maps.google.com/?cid=17175288622605988984&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d5d$, true, 43.602439, 1.4699168000000002, $d5a$Rue Salgues$d5a$, $d5c$Toulouse$d5c$, $d5p$31000$d5p$, $d5g$ChIJ9YHW11u9rhIRePQ88QDiWu4$d5g$, 4.7, 75, $d5s$Organisation d'événement$d5s$),
  ($d6n$Agence YE - Agence événementielle & de communication$d6n$, $d6d$Organisateur d'événement à Toulouse.
Téléphone : 05 61 38 75 19
Site web : http://www.agence-ye.fr/
Note Google : 5/5 (31 avis)
Google Maps : https://maps.google.com/?cid=548548209091323574&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d6d$, true, 43.5988494, 1.4541457, $d6a$32 Rue des Potiers$d6a$, $d6c$Toulouse$d6c$, $d6p$31000$d6p$, $d6g$ChIJz50K62K7rhIRtqYQmbDVnAc$d6g$, 5.0, 31, $d6s$Organisation d'événement$d6s$),
  ($d7n$Agence événementielle Ideal - Toulouse$d7n$, $d7d$Organisateur d'événement à Toulouse.
Téléphone : 05 36 09 00 77
Site web : https://group-ideal.fr/
Note Google : 4.3/5 (28 avis)
Google Maps : https://maps.google.com/?cid=5836899623519981551&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d7d$, true, 43.6090936, 1.4456023, $d7a$44 Bd de Strasbourg$d7a$, $d7c$Toulouse$d7c$, $d7p$31000$d7p$, $d7g$ChIJ4S6l1saWrhIR7w-FSUjVAFE$d7g$, 4.3, 28, $d7s$Organisation d'événement$d7s$),
  ($d8n$Anne-Laure Wedding + Design - Wedding planner Toulouse, Occitanie$d8n$, $d8d$Wedding planner à Toulouse.
Téléphone : 07 87 50 24 85
Site web : http://www.annelaureweddings.com/
Note Google : 5/5 (1 avis)
Google Maps : https://maps.google.com/?cid=8531555850597365774&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d8d$, true, 43.593799999999995, 1.4279319, $d8a$18 Rue Gazagne$d8a$, $d8c$Toulouse$d8c$, $d8p$31300$d8p$, $d8g$ChIJc8d-6Ja7rhIRDvhCENgsZnY$d8g$, 5.0, 1, $d8s$Wedding planner$d8s$),
  ($d9n$Atelier Camus - Faire-part - Decoration Mariage - Wedding Designer$d9n$, $d9d$Wedding planner à Toulouse.
Téléphone : 06 43 61 22 89
Site web : https://www.atelier-camus.com/
Note Google : 4.9/5 (119 avis)
Google Maps : https://maps.google.com/?cid=17487502430677092984&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d9d$, true, 43.5953476, 1.4196346, $d9a$52 Bd Gabriel Koenigs$d9a$, $d9c$Toulouse$d9c$, $d9p$31300$d9p$, $d9g$ChIJ9c-6AAy7rhIReMpJ1c4WsPI$d9g$, 4.9, 119, $d9s$Wedding planner$d9s$),
  ($d10n$Atypical Event$d10n$, $d10d$Wedding planner à L'Union.
Téléphone : 06 62 90 45 49
Site web : http://www.atypicalevent.fr/
Note Google : 5/5 (13 avis)
Google Maps : https://maps.google.com/?cid=17088838646276798958&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d10d$, true, 43.6625918, 1.4875587, $d10a$30 Rue de l'Autan Noir$d10a$, $d10c$L'Union$d10c$, $d10p$31240$d10p$, $d10g$ChIJS5uQrQSjrhIR7rlLTzXAJ-0$d10g$, 5.0, 13, $d10s$Wedding planner$d10s$),
  ($d11n$BPM Agency - Agence Evénementielle$d11n$, $d11d$Organisateur d'événement à Portet-sur-Garonne.
Téléphone : 05 82 99 12 69
Site web : http://www.bpmagency.fr/
Note Google : 5/5 (32 avis)
Google Maps : https://maps.google.com/?cid=9302729373981895848&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d11d$, true, 43.54295, 1.402827, $d11a$14 Rue Gaston Evrard$d11a$, $d11c$Portet-sur-Garonne$d11c$, $d11p$31120$d11p$, $d11g$ChIJKbTHqGK5rhIRqGzI4RPvGYE$d11g$, 5.0, 32, $d11s$Organisation d'événement$d11s$),
  ($d12n$Be Lounge Toulouse - Location tente et mobilier de réception$d12n$, $d12d$Event planner à Bessières.
Téléphone : 05 32 11 13 48
Site web : https://www.be-lounge.com/fr/
Note Google : 4.9/5 (49 avis)
Google Maps : https://maps.google.com/?cid=5363769089610048489&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d12d$, true, 43.7957755, 1.6062402999999998, $d12a$469 Av. de la Gare$d12a$, $d12c$Bessières$d12c$, $d12p$31660$d12p$, $d12g$ChIJd-kvDiy9rhIR6WNti5Hvb0o$d12g$, 4.9, 49, $d12s$Event planner$d12s$),
  ($d13n$Boum etc. | Mélanie | Wedding planner$d13n$, $d13d$Wedding planner à Toulouse.
Téléphone : 07 45 30 69 29
Site web : https://www.boumetc.fr/
Note Google : 5/5 (24 avis)
Google Maps : https://maps.google.com/?cid=10755459107052370514&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d13d$, true, 43.591534499999995, 1.4695555999999999, $d13a$5 Bd Deltour$d13a$, $d13c$Toulouse$d13c$, $d13p$31500$d13p$, $d13g$ChIJIzJSA0nwOSURUroYsBIRQ5U$d13g$, 5.0, 24, $d13s$Wedding planner$d13s$),
  ($d14n$By Evos$d14n$, $d14d$Organisateur d'événement à Toulouse.
Téléphone : 05 82 95 24 69
Site web : https://byevos.fr/?utm_source=google&utm_medium=organic&utm_campaign=gmb
Note Google : 5/5 (142 avis)
Google Maps : https://maps.google.com/?cid=10035723017108967526&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d14d$, true, 43.6065299, 1.3905687, $d14a$82 Rue de Maubec$d14a$, $d14c$Toulouse$d14c$, $d14p$31300$d14p$, $d14g$ChIJq6paBZyirhIRZtD9mukMRos$d14g$, 5.0, 142, $d14s$Organisation d'événement$d14s$),
  ($d15n$CE JOUR COMPTE - Toulouse$d15n$, $d15d$Organisateur d'événement à Le Fauga.
Téléphone : 06 71 60 57 86
Site web : https://cejourcompte.fr/
Note Google : 5/5 (63 avis)
Google Maps : https://maps.google.com/?cid=18016572876769919480&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d15d$, true, 43.404067399999995, 1.3047347999999999, $d15a$Imp. La Fontaine$d15a$, $d15c$Le Fauga$d15c$, $d15p$31410$d15p$, $d15g$ChIJsZfxWaSrgW8R-AHPVZO5B_o$d15g$, 5.0, 63, $d15s$Organisation d'événement$d15s$),
  ($d16n$Connexion Club$d16n$, $d16d$Organisateur d'événement à Toulouse.
Téléphone : 06 42 82 77 89
Site web : https://connexionclub.com/
Note Google : 5/5 (35 avis)
Google Maps : https://maps.google.com/?cid=14584987939077995503&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d16d$, true, 43.6282092, 1.44827, $d16a$8 Av. Maurice Bourgès-Maunoury$d16a$, $d16c$Toulouse$d16c$, $d16p$31200$d16p$, $d16g$ChIJAQAj5gy7rhIR77sZikFJaMo$d16g$, 5.0, 35, $d16s$Organisation d'événement$d16s$),
  ($d17n$D Day Wedding Planner Toulouse$d17n$, $d17d$Wedding planner à Balma.
Téléphone : 06 46 86 36 31
Site web : https://organisation-dday.com/wedding-planner/toulouse
Note Google : 5/5 (20 avis)
Google Maps : https://maps.google.com/?cid=8355052972353268130&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d17d$, true, 43.6261529, 1.4931710999999999, $d17a$27 Rue Joseph Hubert$d17a$, $d17c$Balma$d17c$, $d17p$31130$d17p$, $d17g$ChIJI1a4JzTuWaoRoimwUGkc83M$d17g$, 5.0, 20, $d17s$Wedding planner$d17s$),
  ($d18n$D-WE: Delphine - Wedding Events - Delphine GOUDY$d18n$, $d18d$Wedding planner à Tournefeuille.
Téléphone : 06 22 69 03 92
Site web : https://d-we.fr/
Note Google : 5/5 (40 avis)
Google Maps : https://maps.google.com/?cid=16128210538424451780&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d18d$, true, 43.5780095, 1.3364819, $d18a$32 Rue des Catalpas$d18a$, $d18c$Tournefeuille$d18c$, $d18p$31170$d18p$, $d18g$ChIJl2hO7OWwrhIRxEKApQjq0t8$d18g$, 5.0, 40, $d18s$Wedding planner$d18s$),
  ($d19n$DJ Dømi, expert en musiques pour évènements$d19n$, $d19d$Organisateur d'événement à Toulouse.
Téléphone : 06 51 93 99 11
Site web : https://d0mi.fr/
Note Google : 5/5 (34 avis)
Google Maps : https://maps.google.com/?cid=3903801735804244827&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d19d$, true, 43.5761739, 1.4795842, $d19a$72 Chem. Carrosse$d19a$, $d19c$Toulouse$d19c$, $d19p$31400$d19p$, $d19g$ChIJo7tM_fy9rhIRW1Mq2P4WLTY$d19g$, 5.0, 34, $d19s$Organisation d'événement$d19s$),
  ($d20n$DJ EVEN$d20n$, $d20d$Organisateur d'événement à Toulouse.
Téléphone : 06 49 44 81 88
Site web : http://djeven.com/
Note Google : 5/5 (202 avis)
Google Maps : https://maps.google.com/?cid=9867887533146063450&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d20d$, true, 43.6112034, 1.4356655999999999, $d20a$5 Esp. Compans Caffarelli$d20a$, $d20c$Toulouse$d20c$, $d20p$31000$d20p$, $d20g$ChIJpw-RX_m9rhIRWkKt2G3H8Yg$d20g$, 5.0, 202, $d20s$Organisation d'événement$d20s$),
  ($d21n$DJ Madame T-Relo / DJ professionnelle à Toulouse / DJ Toulouse Animation Mariage Haute Garonne 31$d21n$, $d21d$Organisateur d'événement à Toulouse.
Téléphone : 06 82 32 11 47
Site web : https://www.dj-madame-t-relo.fr/
Note Google : 5/5 (62 avis)
Google Maps : https://maps.google.com/?cid=7453870252634393039&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d21d$, true, 43.6343195, 1.4514395999999998, $d21a$29 Av. Maurice Bourgès-Maunoury$d21a$, $d21c$Toulouse$d21c$, $d21p$31200$d21p$, $d21g$ChIJQy6tvVKjrhIRz8kfooB3cWc$d21g$, 5.0, 62, $d21s$Organisation d'événement$d21s$),
  ($d22n$DJ Toulouse - Guillaume B - Guillaume BAUDRAND$d22n$, $d22d$Organisateur d'événement à Toulouse.
Téléphone : 06 47 00 83 64
Site web : https://www.instagram.com/glmb.dj/?hl=fr
Note Google : 5/5 (42 avis)
Google Maps : https://maps.google.com/?cid=18426292422040780043&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d22d$, true, 43.617200499999996, 1.4120688, $d22a$$d22a$, $d22c$Toulouse$d22c$, $d22p$31200$d22p$, $d22g$ChIJqawAhdEtmAsRC302x1RXt_8$d22g$, 5.0, 42, $d22s$Organisation d'événement$d22s$),
  ($d23n$Domaine du T$d23n$, $d23d$Wedding planner à Balma.
Téléphone : 06 80 65 69 71
Site web : https://www.domainedut.fr/?utm_source=Clic_Gmb&utm_medium=Gmb_To_Website&utm_campaign=Clic_Gmb
Note Google : 4.9/5 (244 avis)
Google Maps : https://maps.google.com/?cid=1723346778660126393&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d23d$, true, 43.6289558, 1.5116030999999999, $d23a$86 Rte du Chapitre$d23a$, $d23c$Balma$d23c$, $d23p$31130$d23p$, $d23g$ChIJH0h4aK2irhIRub7ZtsOO6hc$d23g$, 4.9, 244, $d23s$Wedding planner$d23s$),
  ($d24n$Décoratrice Mariage Toulouse - L'atelier de Mathild'$d24n$, $d24d$Wedding planner à Toulouse.
Téléphone : 06 67 60 83 36
Site web : https://www.atelier-mathild.fr/
Google Maps : https://maps.google.com/?cid=17988259558857271782&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d24d$, true, 43.6125579, 1.4021126, $d24a$109 Av. de Casselardit$d24a$, $d24c$Toulouse$d24c$, $d24p$31300$d24p$, $d24g$ChIJoRgoDyq7rhIR5mk2TcMio_k$d24g$, 0, 0, $d24s$Wedding planner$d24s$),
  ($d25n$Ellie Wedding$d25n$, $d25d$Wedding planner à Escalquens.
Téléphone : 06 98 36 39 24
Site web : https://www.elliewedding.fr/
Note Google : 5/5 (13 avis)
Google Maps : https://maps.google.com/?cid=14743207895532816364&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d25d$, true, 43.5185992, 1.5466970999999998, $d25a$Av. de Toulouse$d25a$, $d25c$Escalquens$d25c$, $d25p$31750$d25p$, $d25g$ChIJk8FVSJeVrhIR7Mf31ndlmsw$d25g$, 5.0, 13, $d25s$Wedding planner$d25s$),
  ($d26n$Eric Lempernesse$d26n$, $d26d$Event planner à Balma.
Téléphone : 06 83 47 39 36
Site web : https://ericlempernesse.com/?utm_source=Clic_GMB&utm_medium=GMB_To_Website&utm_campaign=Clic_GMB
Note Google : 5/5 (28 avis)
Google Maps : https://maps.google.com/?cid=3728206584541812028&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d26d$, true, 43.6136796, 1.4943501, $d26a$1 Rue Germinal$d26a$, $d26c$Balma$d26c$, $d26p$31130$d26p$, $d26g$ChIJGx1lFoG7rhIRPBXjwCJAvTM$d26g$, 5.0, 28, $d26s$Event planner$d26s$),
  ($d27n$Event Ewa Wedding Planner$d27n$, $d27d$Wedding planner à Toulouse.
Téléphone : 06 41 47 45 75
Site web : http://www.eventewa.com/
Note Google : 5/5 (109 avis)
Google Maps : https://maps.google.com/?cid=4750811451348019079&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d27d$, true, 43.6157666, 1.4496412, $d27a$27 Rue des Jumeaux$d27a$, $d27c$Toulouse$d27c$, $d27p$31200$d27p$, $d27g$ChIJARkbhmCjrhIRh-d0GNhF7kE$d27g$, 5.0, 109, $d27s$Wedding planner$d27s$),
  ($d28n$FIT GROUP Sport et Management$d28n$, $d28d$Event planner à Toulouse.
Site web : https://fitgroup.fr/
Note Google : 5/5 (7 avis)
Google Maps : https://maps.google.com/?cid=13292572588181725356&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d28d$, true, 43.6054592, 1.4069502999999999, $d28a$1 Imp. Mader$d28a$, $d28c$Toulouse$d28c$, $d28p$31300$d28p$, $d28g$ChIJ2416rEu7rhIRrKCqhVe0eLg$d28g$, 5.0, 7, $d28s$Event planner$d28s$),
  ($d29n$Fanka - Team Building Percussion Toulouse$d29n$, $d29d$Organisateur d'événement à Toulouse.
Téléphone : 06 63 69 48 92
Site web : https://www.fanka.fr/
Note Google : 5/5 (77 avis)
Google Maps : https://maps.google.com/?cid=11994112373434803394&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d29d$, true, 43.6026631, 1.4607367999999998, $d29a$7 Rue Saint-Ligory$d29a$, $d29c$Toulouse$d29c$, $d29p$31500$d29p$, $d29g$ChIJNXu0Qc-9rhIRwuSy9qelc6Y$d29g$, 5.0, 77, $d29s$Organisation d'événement$d29s$),
  ($d30n$Flex'events$d30n$, $d30d$Event planner à Toulouse.
Téléphone : 06 69 98 95 30
Site web : http://flex-events.fr/
Google Maps : https://maps.google.com/?cid=17948572363484898817&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d30d$, true, 43.57066280000001, 1.4273878, $d30a$20 Imp. Camille Langlade$d30a$, $d30c$Toulouse$d30c$, $d30p$31100$d30p$, $d30g$ChIJCadqMeu7rhIRASbpDngjFvk$d30g$, 0, 0, $d30s$Event planner$d30s$),
  ($d31n$Fêtes Nous Confiance$d31n$, $d31d$Wedding planner à Toulouse.
Téléphone : 06 31 42 58 60
Note Google : 4.6/5 (8 avis)
Google Maps : https://maps.google.com/?cid=13375805498674169143&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d31d$, true, 43.6139462, 1.4811657999999999, $d31a$38 Av. de l'Hers$d31a$, $d31c$Toulouse$d31c$, $d31p$31500$d31p$, $d31g$ChIJ-f-_tti8rhIRN8UwpTtooLk$d31g$, 4.6, 8, $d31s$Wedding planner$d31s$),
  ($d32n$HARMONIE MARIAGE$d32n$, $d32d$Wedding planner à Toulouse.
Téléphone : 06 36 48 98 10
Google Maps : https://maps.google.com/?cid=3430988976303541648&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d32d$, true, 43.618146599999996, 1.4541648999999999, $d32a$11 Rue de Turin$d32a$, $d32c$Toulouse$d32c$, $d32p$31500$d32p$, $d32g$ChIJfZH577q9rhIRkI3auEtSnS8$d32g$, 0, 0, $d32s$Wedding planner$d32s$),
  ($d33n$HRP Booking & Events$d33n$, $d33d$Event planner à Toulouse.
Google Maps : https://maps.google.com/?cid=2277307677360939762&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d33d$, true, 43.5973687, 1.4475939, $d33a$10 Rue Mage$d33a$, $d33c$Toulouse$d33c$, $d33p$31000$d33p$, $d33g$ChIJ6WGz2Ky9rhIR8mJeUUSfmh8$d33g$, 0, 0, $d33s$Event planner$d33s$),
  ($d34n$Halloween Agency - Toulouse$d34n$, $d34d$Organisateur d'événement à Toulouse.
Téléphone : 05 61 62 78 78
Site web : https://halloween.fr/
Note Google : 4.9/5 (62 avis)
Google Maps : https://maps.google.com/?cid=3097394340232454680&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d34d$, true, 43.597847, 1.4539453999999998, $d34a$16bis Rue des Potiers$d34a$, $d34c$Toulouse$d34c$, $d34p$31000$d34p$, $d34g$ChIJc-L70HK9rhIRGGLc4r0n_Co$d34g$, 4.9, 62, $d34s$Organisation d'événement$d34s$),
  ($d35n$Hōc Diē - Agence Événementielle & Wedding Planner Toulouse$d35n$, $d35d$Wedding planner à Saint-Jory.
Téléphone : 05 54 54 74 48
Site web : https://www.hocdie.com/
Note Google : 4.8/5 (56 avis)
Google Maps : https://maps.google.com/?cid=4308829256576810291&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d35d$, true, 43.7280421, 1.3835750999999998, $d35a$7 Chem. de Casselevres$d35a$, $d35c$Saint-Jory$d35c$, $d35p$31790$d35p$, $d35g$ChIJXYYS2aWnrhIRMz0SNGEJzDs$d35g$, 4.8, 56, $d35s$Wedding planner$d35s$),
  ($d36n$Impact Evolution - Cabinet de communication à Balma Toulouse$d36n$, $d36d$Organisateur d'événement à Balma.
Téléphone : 05 61 24 32 89
Site web : https://impact-evolution.fr/?utm_source=Clic_Gmb&utm_medium=Gmb_To_Website&utm_campaign=Clic_Gmb
Note Google : 4.8/5 (63 avis)
Google Maps : https://maps.google.com/?cid=17898477219094759066&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d36d$, true, 43.6133892, 1.5021338000000002, $d36a$7 Rte de Pin Balma$d36a$, $d36c$Balma$d36c$, $d36p$31130$d36p$, $d36g$ChIJ1X8ETEe9rhIRmoaQWDMqZPg$d36g$, 4.8, 63, $d36s$Organisation d'événement$d36s$),
  ($d37n$Instants Pétillants - Wedding Planner$d37n$, $d37d$Wedding planner à Toulouse.
Téléphone : 06 58 65 84 15
Site web : https://instantspetillantstl.wixsite.com/website-6
Note Google : 4/5 (4 avis)
Google Maps : https://maps.google.com/?cid=16881892900554641011&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d37d$, true, 43.600243899999995, 1.4080074999999999, $d37a$9 Rue André Savès$d37a$, $d37c$Toulouse$d37c$, $d37p$31300$d37p$, $d37g$ChIJrfwzlDa7rhIRc46_ISaISOo$d37g$, 4.0, 4, $d37s$Wedding planner$d37s$),
  ($d38n$J'ose et vous - agence d'événementiel & de communication$d38n$, $d38d$Event planner à Castelginest.
Téléphone : 06 26 33 56 06
Site web : http://jose-et-vous.fr/
Note Google : 5/5 (42 avis)
Google Maps : https://maps.google.com/?cid=10232735533661412719&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d38d$, true, 43.6977403, 1.4280864, $d38a$4 Imp. Nauze de l'Église$d38a$, $d38c$Castelginest$d38c$, $d38p$31780$d38p$, $d38g$ChIJL-c_5m6cCQ4Rb91npMD6AY4$d38g$, 5.0, 42, $d38s$Event planner$d38s$),
  ($d39n$L' Appart Toulouse$d39n$, $d39d$Organisateur d'événement à Toulouse.
Téléphone : 06 72 45 72 12
Site web : http://lappart-toulouse.fr/
Note Google : 4.9/5 (47 avis)
Google Maps : https://maps.google.com/?cid=2764617167042965529&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d39d$, true, 43.6006873, 1.4493079, $d39a$37 Rue de Metz$d39a$, $d39c$Toulouse$d39c$, $d39p$31000$d39p$, $d39g$ChIJZ_gGapu8rhIRGfCKdarkXSY$d39g$, 4.9, 47, $d39s$Organisation d'événement$d39s$),
  ($d40n$L'Atelier du Bonheur$d40n$, $d40d$Wedding planner à Toulouse.
Note Google : 3.9/5 (7 avis)
Google Maps : https://maps.google.com/?cid=15663270746586687140&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d40d$, true, 43.5865696, 1.4299188, $d40a$174 Av. de Muret$d40a$, $d40c$Toulouse$d40c$, $d40p$31300$d40p$, $d40g$ChIJq1zMKna7rhIRpCYRp8EdX9k$d40g$, 3.9, 7, $d40s$Wedding planner$d40s$),
  ($d41n$L'entourloutre$d41n$, $d41d$Organisateur d'événement à Toulouse.
Téléphone : 07 82 98 25 52
Site web : https://lentourloutre.fr/
Note Google : 5/5 (58 avis)
Google Maps : https://maps.google.com/?cid=6337138821150044428&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d41d$, true, 43.602768600000005, 1.4373004000000003, $d41a$34 Rue des Blanchers$d41a$, $d41c$Toulouse$d41c$, $d41p$31000$d41p$, $d41g$ChIJZSYVjpW7rhIRDHH8pi4K8lc$d41g$, 5.0, 58, $d41s$Organisation d'événement$d41s$),
  ($d42n$L'ÎLE DE TARA Domaine de réception - Mariages & Séminaires$d42n$, $d42d$Wedding planner à Eaunes.
Téléphone : 06 06 77 31 31
Site web : https://iledetara.com/
Note Google : 4.7/5 (152 avis)
Google Maps : https://maps.google.com/?cid=15500048653396370483&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d42d$, true, 43.444326, 1.370376, $d42a$1685 Chem. du Tucaut$d42a$, $d42c$Eaunes$d42c$, $d42p$31600$d42p$, $d42g$ChIJf_Ec3tbHrhIRM2T2oiA8G9c$d42g$, 4.7, 152, $d42s$Wedding planner$d42s$),
  ($d43n$La Dolce Vita - Wedding Planner et organisatrice de mariage à Toulouse$d43n$, $d43d$Wedding planner à Muret.
Téléphone : 06 10 77 33 62
Site web : https://www.la-dolce-vita.fr/
Note Google : 5/5 (81 avis)
Google Maps : https://maps.google.com/?cid=8327604406527959837&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d43d$, true, 43.4729607, 1.3227273, $d43a$Bd de Peyramont$d43a$, $d43c$Muret$d43c$, $d43p$31600$d43p$, $d43g$ChIJzQMKkWOurhIRHaMTERaYkXM$d43g$, 5.0, 81, $d43s$Wedding planner$d43s$),
  ($d44n$La Mariée Enjouée$d44n$, $d44d$Wedding planner à Rouffiac-Tolosan.
Site web : https://lamarieeenjouee.com/
Note Google : 5/5 (44 avis)
Google Maps : https://maps.google.com/?cid=6202285835586168774&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d44d$, true, 43.6647055, 1.5242392999999999, $d44a$5 All. des Platanes$d44a$, $d44c$Rouffiac-Tolosan$d44c$, $d44p$31180$d44p$, $d44g$ChIJtdb-zb-jrhIRxueMORvyElY$d44g$, 5.0, 44, $d44s$Wedding planner$d44s$),
  ($d45n$La Noche Voyages : Organisation de séjours étudiants !$d45n$, $d45d$Organisateur d'événement à Toulouse.
Téléphone : 05 31 47 90 53
Site web : https://www.lanochevoyages.com/
Note Google : 4.8/5 (856 avis)
Google Maps : https://maps.google.com/?cid=12260750142644409105&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d45d$, true, 43.570661, 1.4273878, $d45a$20 Imp. Camille Langlade$d45a$, $d45c$Toulouse$d45c$, $d45p$31100$d45p$, $d45g$ChIJo7Uq5Ja8rhIREdMjZEvvJqo$d45g$, 4.8, 856, $d45s$Organisation d'événement$d45s$),
  ($d46n$Le Grand Barathon - Toulouse$d46n$, $d46d$Organisateur d'événement à Toulouse.
Site web : https://legrandbarathon.com/toulouse/
Note Google : 5/5 (67 avis)
Google Maps : https://maps.google.com/?cid=3496289113286062876&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d46d$, true, 43.6090519, 1.4445629, $d46a$22 Rue Saint-Bernard$d46a$, $d46c$Toulouse$d46c$, $d46p$31000$d46p$, $d46g$ChIJ_4as-RS9rhIRHDN7pWxQhTA$d46g$, 5.0, 67, $d46s$Organisation d'événement$d46s$),
  ($d47n$Le Labo Ephémère$d47n$, $d47d$Organisateur d'événement à Toulouse.
Téléphone : 06 66 33 09 01
Site web : http://www.lelabo-ephemere.com/
Note Google : 5/5 (68 avis)
Google Maps : https://maps.google.com/?cid=15786890460739778871&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d47d$, true, 43.6029055, 1.4447591, $d47a$1 Pl. Roger Salengro$d47a$, $d47c$Toulouse$d47c$, $d47p$31000$d47p$, $d47g$ChIJOSitgpy8rhIRN7llRDtNFts$d47g$, 5.0, 68, $d47s$Organisation d'événement$d47s$),
  ($d48n$Le Showroom • bis$d48n$, $d48d$Wedding planner à Toulouse.
Téléphone : 06 52 09 66 89
Note Google : 5/5 (18 avis)
Google Maps : https://maps.google.com/?cid=12473895167823958965&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d48d$, true, 43.6096978, 1.4437124, $d48a$1 Rue de l'Arc$d48a$, $d48c$Toulouse$d48c$, $d48p$31000$d48p$, $d48g$ChIJo97mxOK9rhIRtdOby5AtHK0$d48g$, 5.0, 18, $d48s$Wedding planner$d48s$),
  ($d49n$Les Banquets Nature$d49n$, $d49d$Event planner à Toulouse.
Téléphone : 06 10 77 10 52
Note Google : 5/5 (1 avis)
Google Maps : https://maps.google.com/?cid=17071722394882350862&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d49d$, true, 43.6471855, 1.4391802999999999, $d49a$Rte de Launaguet$d49a$, $d49c$Toulouse$d49c$, $d49p$31200$d49p$, $d49g$ChIJWY8TG0WlrhIRDh8LexHx6uw$d49g$, 5.0, 1, $d49s$Event planner$d49s$),
  ($d50n$Les Compagnons du Fromage$d50n$, $d50d$Organisateur d'événement à Toulouse.
Téléphone : 06 46 46 30 86
Site web : http://lescompagnonsdufromage.com/
Note Google : 5/5 (398 avis)
Google Maps : https://maps.google.com/?cid=18382719201773867753&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d50d$, true, 43.594966799999995, 1.4441661, $d50a$23 Pl. du Salin$d50a$, $d50c$Toulouse$d50c$, $d50p$31000$d50p$, $d50g$ChIJ3T2nRjm4XwcR6dJ727eJHP8$d50g$, 5.0, 398, $d50s$Organisation d'événement$d50s$),
  ($d51n$Les Petites Pépites dj$d51n$, $d51d$Organisateur d'événement à Toulouse.
Téléphone : 06 31 41 26 11
Site web : http://les-petites-pepites.fr/
Note Google : 5/5 (151 avis)
Google Maps : https://maps.google.com/?cid=17161826223137761101&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d51d$, true, 43.5987194, 1.4361055, $d51a$8 Rue de la République$d51a$, $d51c$Toulouse$d51c$, $d51p$31300$d51p$, $d51g$ChIJWUgF33q7rhIRTScczwUOK-4$d51g$, 5.0, 151, $d51s$Organisation d'événement$d51s$),
  ($d52n$Les Prémices De M$d52n$, $d52d$Wedding planner à Villeneuve-Tolosane.
Téléphone : 06 98 83 18 84
Site web : https://lespremicesdem.fr/
Note Google : 4.8/5 (48 avis)
Google Maps : https://maps.google.com/?cid=9862534960289341111&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d52d$, true, 43.5265961, 1.3244171999999999, $d52a$1 Rue des Jonquilles$d52a$, $d52c$Villeneuve-Tolosane$d52c$, $d52p$31270$d52p$, $d52g$ChIJp4dgp-O2rhIRt97q3ErD3og$d52g$, 4.8, 48, $d52s$Wedding planner$d52s$),
  ($d53n$Les romances de Marie$d53n$, $d53d$Wedding planner à Toulouse.
Téléphone : 06 95 58 80 87
Site web : https://www.lesromancesdemarie.com/
Note Google : 4.9/5 (43 avis)
Google Maps : https://maps.google.com/?cid=11132913657492177013&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d53d$, true, 43.611019999999996, 1.447706, $d53a$18 Rue de l'Orient$d53a$, $d53c$Toulouse$d53c$, $d53p$31000$d53p$, $d53g$ChIJERdyerO9rhIRdYDqnfwNgJo$d53g$, 4.9, 43, $d53s$Wedding planner$d53s$),
  ($d54n$Les rêves d'Aurore$d54n$, $d54d$Wedding planner à Toulouse.
Téléphone : 07 62 67 30 00
Site web : https://www.lesrevesdaurore.com/?utm_source=google&utm_medium=wix_google_business_profile&utm_campaign=9333137602507018426
Note Google : 5/5 (4 avis)
Google Maps : https://maps.google.com/?cid=1127399887454208595&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d54d$, true, 43.5631522, 1.3792923, $d54a$38 Chem. de Liffard$d54a$, $d54c$Toulouse$d54c$, $d54p$31100$d54p$, $d54g$ChIJhZJ7dAW7rhIRUwKGczlUpQ8$d54g$, 5.0, 4, $d54s$Wedding planner$d54s$),
  ($d55n$Loc2lux Events - Location Matériels pour évènements ( Mariage, Baby shower, Fêtes privés... )$d55n$, $d55d$Wedding planner à Cugnaux.
Téléphone : 09 70 70 85 45
Site web : http://www.loc2lux.fr/
Note Google : 5/5 (202 avis)
Google Maps : https://maps.google.com/?cid=392456138578651466&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d55d$, true, 43.5363318, 1.3610045, $d55a$4bis Rue Alfred Sauvy$d55a$, $d55c$Cugnaux$d55c$, $d55p$31270$d55p$, $d55g$ChIJ2WPAH7y5rhIRSunmWcdIcgU$d55g$, 5.0, 202, $d55s$Wedding planner$d55s$),
  ($d56n$Location Salle Toulouse - La péniche Saint-Louis$d56n$, $d56d$Organisateur d'événement à Toulouse.
Téléphone : 07 61 92 39 57
Site web : https://peniche-saint-louis.fr/
Note Google : 4.4/5 (121 avis)
Google Maps : https://maps.google.com/?cid=16771155122751893834&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d56d$, true, 43.594414799999996, 1.457247, $d56a$35 Bd Griffoul Dorval$d56a$, $d56c$Toulouse$d56c$, $d56p$31400$d56p$, $d56g$ChIJg6H1MGC8rhIRSnGZDLocv-g$d56g$, 4.4, 121, $d56s$Organisation d'événement$d56s$),
  ($d57n$MAM Events$d57n$, $d57d$Wedding planner à Cornebarrieu.
Téléphone : 06 56 66 60 70
Site web : https://mamevents.com/
Note Google : 5/5 (33 avis)
Google Maps : https://maps.google.com/?cid=16049213482455494049&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d57d$, true, 43.6466494, 1.3209899, $d57a$2 Chem. des Syndics$d57a$, $d57c$Cornebarrieu$d57c$, $d57p$31700$d57p$, $d57g$ChIJFxUUUGS6rhIRoW0rQqFCut4$d57g$, 5.0, 33, $d57s$Wedding planner$d57s$),
  ($d58n$Madame Etincelle - Wedding & Event planner$d58n$, $d58d$Wedding planner à Saint-Jory.
Téléphone : 06 30 16 98 40
Site web : http://www.madame-etincelle.fr/
Note Google : 5/5 (25 avis)
Google Maps : https://maps.google.com/?cid=9069027741764056395&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d58d$, true, 43.734428799999996, 1.3616979, $d58a$10 Chem. de la Claou$d58a$, $d58c$Saint-Jory$d58c$, $d58p$31790$d58p$, $d58g$ChIJlTuK4BaL328RS3UCbq6o230$d58g$, 5.0, 25, $d58s$Wedding planner$d58s$),
  ($d59n$Madaré$d59n$, $d59d$Organisateur d'événement à Toulouse.
Téléphone : 05 34 26 00 39
Site web : http://madare.com/fr
Note Google : 4.9/5 (35 avis)
Google Maps : https://maps.google.com/?cid=13557442763923445955&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d59d$, true, 43.6061421, 1.4236771, $d59a$51 Rue des Amidonniers$d59a$, $d59c$Toulouse$d59c$, $d59p$31000$d59p$, $d59g$ChIJMdTPPDO6rhIRw9hYBl22Jbw$d59g$, 4.9, 35, $d59s$Organisation d'événement$d59s$),
  ($d60n$Maison Alchimie - Collectif prestataire mariage à Toulouse$d60n$, $d60d$Wedding planner à Toulouse.
Téléphone : 06 09 54 82 17
Site web : https://maisonalchimie-mariage.com/
Note Google : 5/5 (9 avis)
Google Maps : https://maps.google.com/?cid=2099585814969751283&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d60d$, true, 43.6023012, 1.4472171, $d60a$14 Pl. Saint-Georges$d60a$, $d60c$Toulouse$d60c$, $d60p$31000$d60p$, $d60g$ChIJNW-z33S9rhIR85a4tCw6Ix0$d60g$, 5.0, 9, $d60s$Wedding planner$d60s$),
  ($d61n$Mc2 Mon Amour Toulouse$d61n$, $d61d$Wedding planner à Fonbeauzard.
Téléphone : 06 17 31 48 73
Site web : https://mc2monamour-toulouse.com/
Note Google : 5/5 (18 avis)
Google Maps : https://maps.google.com/?cid=5235153636528686930&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d61d$, true, 43.6775765, 1.43296, $d61a$62 Chem. de Raudelauzette$d61a$, $d61c$Fonbeauzard$d61c$, $d61p$31140$d61p$, $d61g$ChIJ-xqRMAulrhIRUgfj0X4Ap0g$d61g$, 5.0, 18, $d61s$Wedding planner$d61s$),
  ($d62n$Meeting Lab$d62n$, $d62d$Organisateur d'événement à Toulouse.
Téléphone : 05 34 25 33 00
Site web : http://www.meetinglab-europa.com/
Note Google : 4.8/5 (190 avis)
Google Maps : https://maps.google.com/?cid=17739177409258066208&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d62d$, true, 43.603321, 1.444356, $d62a$5 Rue Saint-Pantaléon$d62a$, $d62c$Toulouse$d62c$, $d62p$31000$d62p$, $d62g$ChIJVRBLk528rhIRIBF2Ft43LvY$d62g$, 4.8, 190, $d62s$Organisation d'événement$d62s$),
  ($d63n$Merci Mumu$d63n$, $d63d$Event planner à Toulouse.
Téléphone : 07 88 29 03 30
Site web : http://mercimumu.com/
Note Google : 5/5 (1 avis)
Google Maps : https://maps.google.com/?cid=80774513397222030&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d63d$, true, 43.6012785, 1.4481887, $d63a$1 R. d'Astorg$d63a$, $d63c$Toulouse$d63c$, $d63p$31000$d63p$, $d63g$ChIJM3xuZ5S9rhIRjkry8f33HgE$d63g$, 5.0, 1, $d63s$Event planner$d63s$),
  ($d64n$Mersin Organisation$d64n$, $d64d$Wedding planner à Toulouse.
Téléphone : 07 68 00 31 30
Note Google : 5/5 (1 avis)
Google Maps : https://maps.google.com/?cid=4997222389513635305&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d64d$, true, 43.6250029, 1.4302621, $d64a$66 Bd Silvio Trentin$d64a$, $d64c$Toulouse$d64c$, $d64p$31200$d64p$, $d64g$ChIJqXvcFcG7rhIR6cWWbkmzWUU$d64g$, 5.0, 1, $d64s$Wedding planner$d64s$),
  ($d65n$Momento Event$d65n$, $d65d$Organisateur d'événement à Toulouse.
Téléphone : 05 31 47 90 53
Site web : https://momento-event.com/
Note Google : 5/5 (28 avis)
Google Maps : https://maps.google.com/?cid=2615123694331950331&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d65d$, true, 43.570661, 1.4273878, $d65a$20 Imp. Camille Langlade$d65a$, $d65c$Toulouse$d65c$, $d65p$31100$d65p$, $d65g$ChIJDVFeshO7rhIR-_Rc_CTJSiQ$d65g$, 5.0, 28, $d65s$Organisation d'événement$d65s$),
  ($d66n$Nana Event’s$d66n$, $d66d$Wedding planner à Fenouillet.
Téléphone : 06 85 90 97 38
Note Google : 5/5 (1 avis)
Google Maps : https://maps.google.com/?cid=4093935663196713590&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d66d$, true, 43.6817165, 1.3921214000000002, $d66a$Rue Étienne Billières$d66a$, $d66c$Fenouillet$d66c$, $d66p$31150$d66p$, $d66g$ChIJFT3lFtKlrhIRdrIkisuU0Dg$d66g$, 5.0, 1, $d66s$Wedding planner$d66s$),
  ($d67n$Noces Uchroniques - Wedding Planner$d67n$, $d67d$Wedding planner à Toulouse.
Téléphone : 06 71 91 66 75
Site web : https://www.noces-uchroniques.fr/
Note Google : 5/5 (1 avis)
Google Maps : https://maps.google.com/?cid=2874895500475595950&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d67d$, true, 43.6346576, 1.4294932, $d67a$1 Rue de la Louisiane$d67a$, $d67c$Toulouse$d67c$, $d67p$31200$d67p$, $d67g$ChIJ2QXXKY9nvK0Rrnw30Dmu5Sc$d67g$, 5.0, 1, $d67s$Wedding planner$d67s$),
  ($d68n$Notre Envie Mariage$d68n$, $d68d$Wedding planner à Toulouse.
Téléphone : 06 61 94 78 30
Site web : https://www.notreenvie.com/
Note Google : 4.9/5 (35 avis)
Google Maps : https://maps.google.com/?cid=13542642792455522222&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d68d$, true, 43.642508899999996, 1.4562852, $d68a$26 Chem. de Borderouge$d68a$, $d68c$Toulouse$d68c$, $d68p$31200$d68p$, $d68g$ChIJSWB_1OS7rhIRrsdQJN4h8bs$d68g$, 4.9, 35, $d68s$Wedding planner$d68s$),
  ($d69n$OandB - Billetterie en ligne$d69n$, $d69d$Organisateur d'événement à Toulouse.
Téléphone : 05 37 07 33 34
Site web : http://www.oandb.fr/
Note Google : 5/5 (72 avis)
Google Maps : https://maps.google.com/?cid=13998989253732605611&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d69d$, true, 43.596958, 1.4458107999999998, $d69a$34 Rue du Languedoc$d69a$, $d69c$Toulouse$d69c$, $d69p$31000$d69p$, $d69g$ChIJp3an4gu-rhIRqx4-c45mRsI$d69g$, 5.0, 72, $d69s$Organisation d'événement$d69s$),
  ($d70n$Oui Wedding - Wedding Planner Toulouse$d70n$, $d70d$Wedding planner à Bruguières.
Téléphone : 06 67 43 38 78
Site web : https://www.oui-agencewedding.fr/?utm_source=google&utm_medium=wix_google_business_profile&utm_campaign=2675525400859659903
Note Google : 5/5 (2 avis)
Google Maps : https://maps.google.com/?cid=56820393313702668&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d70d$, true, 43.7326299, 1.4045147, $d70a$18 Rue de la Briqueterie$d70a$, $d70c$Bruguières$d70c$, $d70p$31150$d70p$, $d70g$ChIJOUJOIEchcUgRDBN2v9jdyQA$d70g$, 5.0, 2, $d70s$Wedding planner$d70s$),
  ($d71n$PADJ.fr$d71n$, $d71d$Organisateur d'événement à Toulouse.
Téléphone : 07 67 27 36 62
Site web : https://padj.fr/
Note Google : 4.9/5 (52 avis)
Google Maps : https://maps.google.com/?cid=292272301547093635&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d71d$, true, 43.597670799999996, 1.4196271, $d71a$91 Bd Gabriel Koenigs$d71a$, $d71c$Toulouse$d71c$, $d71p$31300$d71p$, $d71g$ChIJ80KRAh27rhIRg35mFxxcDgQ$d71g$, 4.9, 52, $d71s$Organisation d'événement$d71s$),
  ($d72n$PUR'events L'agence événementielle créative et engagée$d72n$, $d72d$Organisateur d'événement à L'Union.
Téléphone : 05 34 25 68 30
Site web : http://www.purevents.fr/
Note Google : 5/5 (177 avis)
Google Maps : https://maps.google.com/?cid=18321021455671889774&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d72d$, true, 43.655864799999996, 1.4772736, $d72a$Les Ambassadeurs, 2 All. des Nymphéas Bât A3$d72a$, $d72c$L'Union$d72c$, $d72p$31240$d72p$, $d72g$ChIJ8QQvYRujrhIRbg-i6_FXQf4$d72g$, 5.0, 177, $d72s$Organisation d'événement$d72s$),
  ($d73n$Pack Arbre de Noel$d73n$, $d73d$Event planner à Toulouse.
Téléphone : 05 82 95 80 69
Site web : https://www.packarbredenoel.com/animation-de-noel-toulouse/
Google Maps : https://maps.google.com/?cid=16105001123136477543&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d73d$, true, 43.602528, 1.452102, $d73a$18 Bd Lazare Carnot$d73a$, $d73c$Toulouse$d73c$, $d73p$31000$d73p$, $d73g$ChIJjSOuW7O6rhIRZxnRizF1gN8$d73g$, 0, 0, $d73s$Event planner$d73s$),
  ($d74n$Platines et Cocktails | Bar à cocktails mobile • Atelier cocktails • Sonorisation$d74n$, $d74d$Organisateur d'événement à Toulouse.
Téléphone : 06 63 10 69 34
Site web : https://platinesetcocktails.fr/
Note Google : 5/5 (313 avis)
Google Maps : https://maps.google.com/?cid=13748741930471737053&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d74d$, true, 43.6182941, 1.4537346999999998, $d74a$5 Rue de Turin$d74a$, $d74c$Toulouse$d74c$, $d74p$31500$d74p$, $d74g$ChIJB7usnVi7rhIR3UZJGvFXzb4$d74g$, 5.0, 313, $d74s$Organisation d'événement$d74s$),
  ($d75n$Psb Lounge$d75n$, $d75d$Organisateur d'événement à Verdun-sur-Garonne.
Téléphone : 05 61 50 80 07
Site web : https://www.psb-lounge.fr/
Note Google : 5/5 (100 avis)
Google Maps : https://maps.google.com/?cid=13199251655021109432&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d75d$, true, 43.822493, 1.2443074, $d75a$ZI la FAOUQUETTE, 45 rue Hélène boucher$d75a$, $d75c$Verdun-sur-Garonne$d75c$, $d75p$82600$d75p$, $d75g$ChIJJREC7DOYrhIRuCCFlnIpLbc$d75g$, 5.0, 100, $d75s$Organisation d'événement$d75s$),
  ($d76n$Rk Event$d76n$, $d76d$Organisateur d'événement à Toulouse.
Téléphone : 06 69 74 77 62
Site web : https://www.dj-rk.fr/
Note Google : 5/5 (34 avis)
Google Maps : https://maps.google.com/?cid=1077661185843294509&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d76d$, true, 43.610039799999996, 1.4438031000000002, $d76a$Rue de la Pomme$d76a$, $d76c$Toulouse$d76c$, $d76p$31000$d76p$, $d76g$ChIJXzzM0AW9rhIRLXFqiiOf9A4$d76g$, 5.0, 34, $d76s$Organisation d'événement$d76s$),
  ($d77n$Rêves en Fête - Agence événementielle et décoration$d77n$, $d77d$Organisateur d'événement à Fontenilles.
Téléphone : 06 74 28 74 12
Site web : https://www.reves-en-fete.fr/
Note Google : 4.6/5 (38 avis)
Google Maps : https://maps.google.com/?cid=15701618364604079806&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d77d$, true, 43.558887399999996, 1.1747435, $d77a$2 bis Av. de Gascogne$d77a$, $d77c$Fontenilles$d77c$, $d77p$31470$d77p$, $d77g$ChIJQyTIXV2xrhIRvt75PLZa59k$d77g$, 4.6, 38, $d77s$Organisation d'événement$d77s$),
  ($d78n$Social Events (Photobooth - Vidéobooth 360° - Karaoké - Réalité Virtuelle - Social Wall - Totem intéractifs)$d78n$, $d78d$Organisateur d'événement à Toulouse.
Téléphone : 06 82 34 56 16
Site web : https://www.social-events.fr/
Note Google : 5/5 (101 avis)
Google Maps : https://maps.google.com/?cid=10432302518615698188&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d78d$, true, 43.6311335, 1.4324177, $d78a$78 Av. des États-Unis$d78a$, $d78c$Toulouse$d78c$, $d78p$31200$d78p$, $d78g$ChIJUb0CX7KkrhIRDGuAM977xpA$d78g$, 5.0, 101, $d78s$Organisation d'événement$d78s$),
  ($d79n$Stand up comedy Toulouse$d79n$, $d79d$Organisateur d'événement à Toulouse.
Téléphone : 06 88 01 39 64
Site web : https://www.toulousecomedy.com/
Note Google : 5/5 (47 avis)
Google Maps : https://maps.google.com/?cid=17750151418063542545&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d79d$, true, 43.6145205, 1.4244169000000002, $d79a$43 Rue Roland Garros Centre Eloha$d79a$, $d79c$Toulouse$d79c$, $d79p$31200$d79p$, $d79g$ChIJp-sUzO-9rhIREdkSn6s0VfY$d79g$, 5.0, 47, $d79s$Organisation d'événement$d79s$),
  ($d80n$Team Cohésion - Team Building - Coaching Professionnel - Evènementiel$d80n$, $d80d$Event planner à Balma.
Téléphone : 05 62 24 96 86
Site web : http://www.team-cohesion.com/
Note Google : 4.8/5 (4 avis)
Google Maps : https://maps.google.com/?cid=1490462671571441524&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d80d$, true, 43.6132079, 1.4946442, $d80a$28 Rue Saint-Jean$d80a$, $d80c$Balma$d80c$, $d80p$31130$d80p$, $d80g$ChIJUUgbep2irhIRdNf-KecvrxQ$d80g$, 4.8, 4, $d80s$Event planner$d80s$),
  ($d81n$The Most Beautiful Days - Wedding Planner Toulouse$d81n$, $d81d$Wedding planner à Péchaudier.
Téléphone : 06 65 93 17 35
Site web : https://themostbeautifuldays.com/
Note Google : 5/5 (23 avis)
Google Maps : https://maps.google.com/?cid=12951069654140568897&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d81d$, true, 43.538002999999996, 1.9389706, $d81a$1 Chem. de la Fedougne$d81a$, $d81c$Péchaudier$d81c$, $d81p$81470$d81p$, $d81g$ChIJYVXC_6W7rhIRQcVjlDtxu7M$d81g$, 5.0, 23, $d81s$Wedding planner$d81s$),
  ($d82n$Toul'events$d82n$, $d82d$Organisateur d'événement à Toulouse.
Téléphone : 09 80 83 96 89
Site web : https://toulevents.com/
Note Google : 4.7/5 (33 avis)
Google Maps : https://maps.google.com/?cid=12513516268678019019&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d82d$, true, 43.598851599999996, 1.4539449, $d82a$27 Rue des Potiers$d82a$, $d82c$Toulouse$d82c$, $d82p$31000$d82p$, $d82g$ChIJnWBWvvq8rhIRy_efNb_wqK0$d82g$, 4.7, 33, $d82s$Organisation d'événement$d82s$),
  ($d83n$Twist n'Chic Events Wedding planner Toulouse$d83n$, $d83d$Wedding planner à Pibrac.
Téléphone : 06 86 74 89 50
Site web : http://www.twistandchic.fr/
Note Google : 4.9/5 (42 avis)
Google Maps : https://maps.google.com/?cid=18061311006282551900&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d83d$, true, 43.6163637, 1.2765685, $d83a$Rue des Abeilles$d83a$, $d83c$Pibrac$d83c$, $d83p$31820$d83p$, $d83g$ChIJX_zHlHmzrhIRXBJT06qqpvo$d83g$, 4.9, 42, $d83s$Wedding planner$d83s$),
  ($d84n$VR Show - Agence Réalité virtuelle$d84n$, $d84d$Organisateur d'événement à Toulouse.
Téléphone : 06 07 24 01 05
Site web : http://www.vr-show.fr/
Note Google : 4.8/5 (42 avis)
Google Maps : https://maps.google.com/?cid=13023814667326170229&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d84d$, true, 43.6322083, 1.4321203999999998, $d84a$94 Av. des États-Unis$d84a$, $d84c$Toulouse$d84c$, $d84p$31200$d84p$, $d84g$ChIJQYV9aby8rhIRdaR_0m_ivbQ$d84g$, 4.8, 42, $d84s$Organisation d'événement$d84s$),
  ($d85n$ZeBigTeuf - DJ Animation mariages et soirées Toulouse et région 31$d85n$, $d85d$Organisateur d'événement à Toulouse.
Téléphone : 06 88 20 10 00
Site web : https://www.zebigteuf.com/?utm_medium=referral&utm_source=gmb&utm_campaign=lnk-gmb
Note Google : 4.7/5 (68 avis)
Google Maps : https://maps.google.com/?cid=14553129114867874150&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d85d$, true, 43.5808548, 1.4903494, $d85a$5 Rue Pons Capdenier$d85a$, $d85c$Toulouse$d85c$, $d85p$31500$d85p$, $d85g$ChIJkya97X68rhIRZjkY_tIZ98k$d85g$, 4.7, 68, $d85s$Organisation d'événement$d85s$),
  ($d86n$nextERA$d86n$, $d86d$Event planner à Toulouse.
Google Maps : https://maps.google.com/?cid=11008343902778492823&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d86d$, true, 43.6041415, 1.447207, $d86a$6 Pl. du Président Thomas Wilson$d86a$, $d86c$Toulouse$d86c$, $d86p$31000$d86p$, $d86g$ChIJeS2x8aa9rhIRlwdzcnR-xZg$d86g$, 0, 0, $d86s$Event planner$d86s$),
  ($d87n$Ô fil de l'eau évènements$d87n$, $d87d$Event planner à Grépiac.
Téléphone : 06 72 86 65 68
Site web : https://ofildeleauevenements.fr/
Note Google : 5/5 (239 avis)
Google Maps : https://maps.google.com/?cid=3950272997160557149&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d87d$, true, 43.410122699999995, 1.4441386999999999, $d87a$1 Rte de Venerque$d87a$, $d87c$Grépiac$d87c$, $d87p$31190$d87p$, $d87g$ChIJI-SCoXWLa4oRXZqSiVww0jY$d87g$, 5.0, 239, $d87s$Event planner$d87s$)
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
    where google_place_id in ($d0id$ChIJ8zea62K7rhIRRX3BmfZ-4IY$d0id$, $d1id$ChIJE0rC9eu5rhIRH_fsgO0R2K0$d1id$, $d2id$ChIJj00BjEWjrhIRaFr5sCIwv5U$d2id$, $d3id$ChIJDQvv4Ji8rhIRAQQVWdPOlUw$d3id$, $d4id$ChIJ41f7EnhhrhIRepQAh9FtnWE$d4id$, $d5id$ChIJ9YHW11u9rhIRePQ88QDiWu4$d5id$, $d6id$ChIJz50K62K7rhIRtqYQmbDVnAc$d6id$, $d7id$ChIJ4S6l1saWrhIR7w-FSUjVAFE$d7id$, $d8id$ChIJc8d-6Ja7rhIRDvhCENgsZnY$d8id$, $d9id$ChIJ9c-6AAy7rhIReMpJ1c4WsPI$d9id$, $d10id$ChIJS5uQrQSjrhIR7rlLTzXAJ-0$d10id$, $d11id$ChIJKbTHqGK5rhIRqGzI4RPvGYE$d11id$, $d12id$ChIJd-kvDiy9rhIR6WNti5Hvb0o$d12id$, $d13id$ChIJIzJSA0nwOSURUroYsBIRQ5U$d13id$, $d14id$ChIJq6paBZyirhIRZtD9mukMRos$d14id$, $d15id$ChIJsZfxWaSrgW8R-AHPVZO5B_o$d15id$, $d16id$ChIJAQAj5gy7rhIR77sZikFJaMo$d16id$, $d17id$ChIJI1a4JzTuWaoRoimwUGkc83M$d17id$, $d18id$ChIJl2hO7OWwrhIRxEKApQjq0t8$d18id$, $d19id$ChIJo7tM_fy9rhIRW1Mq2P4WLTY$d19id$, $d20id$ChIJpw-RX_m9rhIRWkKt2G3H8Yg$d20id$, $d21id$ChIJQy6tvVKjrhIRz8kfooB3cWc$d21id$, $d22id$ChIJqawAhdEtmAsRC302x1RXt_8$d22id$, $d23id$ChIJH0h4aK2irhIRub7ZtsOO6hc$d23id$, $d24id$ChIJoRgoDyq7rhIR5mk2TcMio_k$d24id$, $d25id$ChIJk8FVSJeVrhIR7Mf31ndlmsw$d25id$, $d26id$ChIJGx1lFoG7rhIRPBXjwCJAvTM$d26id$, $d27id$ChIJARkbhmCjrhIRh-d0GNhF7kE$d27id$, $d28id$ChIJ2416rEu7rhIRrKCqhVe0eLg$d28id$, $d29id$ChIJNXu0Qc-9rhIRwuSy9qelc6Y$d29id$, $d30id$ChIJCadqMeu7rhIRASbpDngjFvk$d30id$, $d31id$ChIJ-f-_tti8rhIRN8UwpTtooLk$d31id$, $d32id$ChIJfZH577q9rhIRkI3auEtSnS8$d32id$, $d33id$ChIJ6WGz2Ky9rhIR8mJeUUSfmh8$d33id$, $d34id$ChIJc-L70HK9rhIRGGLc4r0n_Co$d34id$, $d35id$ChIJXYYS2aWnrhIRMz0SNGEJzDs$d35id$, $d36id$ChIJ1X8ETEe9rhIRmoaQWDMqZPg$d36id$, $d37id$ChIJrfwzlDa7rhIRc46_ISaISOo$d37id$, $d38id$ChIJL-c_5m6cCQ4Rb91npMD6AY4$d38id$, $d39id$ChIJZ_gGapu8rhIRGfCKdarkXSY$d39id$, $d40id$ChIJq1zMKna7rhIRpCYRp8EdX9k$d40id$, $d41id$ChIJZSYVjpW7rhIRDHH8pi4K8lc$d41id$, $d42id$ChIJf_Ec3tbHrhIRM2T2oiA8G9c$d42id$, $d43id$ChIJzQMKkWOurhIRHaMTERaYkXM$d43id$, $d44id$ChIJtdb-zb-jrhIRxueMORvyElY$d44id$, $d45id$ChIJo7Uq5Ja8rhIREdMjZEvvJqo$d45id$, $d46id$ChIJ_4as-RS9rhIRHDN7pWxQhTA$d46id$, $d47id$ChIJOSitgpy8rhIRN7llRDtNFts$d47id$, $d48id$ChIJo97mxOK9rhIRtdOby5AtHK0$d48id$, $d49id$ChIJWY8TG0WlrhIRDh8LexHx6uw$d49id$, $d50id$ChIJ3T2nRjm4XwcR6dJ727eJHP8$d50id$, $d51id$ChIJWUgF33q7rhIRTScczwUOK-4$d51id$, $d52id$ChIJp4dgp-O2rhIRt97q3ErD3og$d52id$, $d53id$ChIJERdyerO9rhIRdYDqnfwNgJo$d53id$, $d54id$ChIJhZJ7dAW7rhIRUwKGczlUpQ8$d54id$, $d55id$ChIJ2WPAH7y5rhIRSunmWcdIcgU$d55id$, $d56id$ChIJg6H1MGC8rhIRSnGZDLocv-g$d56id$, $d57id$ChIJFxUUUGS6rhIRoW0rQqFCut4$d57id$, $d58id$ChIJlTuK4BaL328RS3UCbq6o230$d58id$, $d59id$ChIJMdTPPDO6rhIRw9hYBl22Jbw$d59id$, $d60id$ChIJNW-z33S9rhIR85a4tCw6Ix0$d60id$, $d61id$ChIJ-xqRMAulrhIRUgfj0X4Ap0g$d61id$, $d62id$ChIJVRBLk528rhIRIBF2Ft43LvY$d62id$, $d63id$ChIJM3xuZ5S9rhIRjkry8f33HgE$d63id$, $d64id$ChIJqXvcFcG7rhIR6cWWbkmzWUU$d64id$, $d65id$ChIJDVFeshO7rhIR-_Rc_CTJSiQ$d65id$, $d66id$ChIJFT3lFtKlrhIRdrIkisuU0Dg$d66id$, $d67id$ChIJ2QXXKY9nvK0Rrnw30Dmu5Sc$d67id$, $d68id$ChIJSWB_1OS7rhIRrsdQJN4h8bs$d68id$, $d69id$ChIJp3an4gu-rhIRqx4-c45mRsI$d69id$, $d70id$ChIJOUJOIEchcUgRDBN2v9jdyQA$d70id$, $d71id$ChIJ80KRAh27rhIRg35mFxxcDgQ$d71id$, $d72id$ChIJ8QQvYRujrhIRbg-i6_FXQf4$d72id$, $d73id$ChIJjSOuW7O6rhIRZxnRizF1gN8$d73id$, $d74id$ChIJB7usnVi7rhIR3UZJGvFXzb4$d74id$, $d75id$ChIJJREC7DOYrhIRuCCFlnIpLbc$d75id$, $d76id$ChIJXzzM0AW9rhIRLXFqiiOf9A4$d76id$, $d77id$ChIJQyTIXV2xrhIRvt75PLZa59k$d77id$, $d78id$ChIJUb0CX7KkrhIRDGuAM977xpA$d78id$, $d79id$ChIJp-sUzO-9rhIREdkSn6s0VfY$d79id$, $d80id$ChIJUUgbep2irhIRdNf-KecvrxQ$d80id$, $d81id$ChIJYVXC_6W7rhIRQcVjlDtxu7M$d81id$, $d82id$ChIJnWBWvvq8rhIRy_efNb_wqK0$d82id$, $d83id$ChIJX_zHlHmzrhIRXBJT06qqpvo$d83id$, $d84id$ChIJQYV9aby8rhIRdaR_0m_ivbQ$d84id$, $d85id$ChIJkya97X68rhIRZjkY_tIZ98k$d85id$, $d86id$ChIJeS2x8aa9rhIRlwdzcnR-xZg$d86id$, $d87id$ChIJI-SCoXWLa4oRXZqSiVww0jY$d87id$)
      and latitude is not null
      and longitude is not null
      and location is null;
  elsif location_type like 'geometry%' then
    update public.craftsmans
    set location = ST_SetSRID(ST_MakePoint(longitude, latitude), 4326)
    where google_place_id in ($d0id$ChIJ8zea62K7rhIRRX3BmfZ-4IY$d0id$, $d1id$ChIJE0rC9eu5rhIRH_fsgO0R2K0$d1id$, $d2id$ChIJj00BjEWjrhIRaFr5sCIwv5U$d2id$, $d3id$ChIJDQvv4Ji8rhIRAQQVWdPOlUw$d3id$, $d4id$ChIJ41f7EnhhrhIRepQAh9FtnWE$d4id$, $d5id$ChIJ9YHW11u9rhIRePQ88QDiWu4$d5id$, $d6id$ChIJz50K62K7rhIRtqYQmbDVnAc$d6id$, $d7id$ChIJ4S6l1saWrhIR7w-FSUjVAFE$d7id$, $d8id$ChIJc8d-6Ja7rhIRDvhCENgsZnY$d8id$, $d9id$ChIJ9c-6AAy7rhIReMpJ1c4WsPI$d9id$, $d10id$ChIJS5uQrQSjrhIR7rlLTzXAJ-0$d10id$, $d11id$ChIJKbTHqGK5rhIRqGzI4RPvGYE$d11id$, $d12id$ChIJd-kvDiy9rhIR6WNti5Hvb0o$d12id$, $d13id$ChIJIzJSA0nwOSURUroYsBIRQ5U$d13id$, $d14id$ChIJq6paBZyirhIRZtD9mukMRos$d14id$, $d15id$ChIJsZfxWaSrgW8R-AHPVZO5B_o$d15id$, $d16id$ChIJAQAj5gy7rhIR77sZikFJaMo$d16id$, $d17id$ChIJI1a4JzTuWaoRoimwUGkc83M$d17id$, $d18id$ChIJl2hO7OWwrhIRxEKApQjq0t8$d18id$, $d19id$ChIJo7tM_fy9rhIRW1Mq2P4WLTY$d19id$, $d20id$ChIJpw-RX_m9rhIRWkKt2G3H8Yg$d20id$, $d21id$ChIJQy6tvVKjrhIRz8kfooB3cWc$d21id$, $d22id$ChIJqawAhdEtmAsRC302x1RXt_8$d22id$, $d23id$ChIJH0h4aK2irhIRub7ZtsOO6hc$d23id$, $d24id$ChIJoRgoDyq7rhIR5mk2TcMio_k$d24id$, $d25id$ChIJk8FVSJeVrhIR7Mf31ndlmsw$d25id$, $d26id$ChIJGx1lFoG7rhIRPBXjwCJAvTM$d26id$, $d27id$ChIJARkbhmCjrhIRh-d0GNhF7kE$d27id$, $d28id$ChIJ2416rEu7rhIRrKCqhVe0eLg$d28id$, $d29id$ChIJNXu0Qc-9rhIRwuSy9qelc6Y$d29id$, $d30id$ChIJCadqMeu7rhIRASbpDngjFvk$d30id$, $d31id$ChIJ-f-_tti8rhIRN8UwpTtooLk$d31id$, $d32id$ChIJfZH577q9rhIRkI3auEtSnS8$d32id$, $d33id$ChIJ6WGz2Ky9rhIR8mJeUUSfmh8$d33id$, $d34id$ChIJc-L70HK9rhIRGGLc4r0n_Co$d34id$, $d35id$ChIJXYYS2aWnrhIRMz0SNGEJzDs$d35id$, $d36id$ChIJ1X8ETEe9rhIRmoaQWDMqZPg$d36id$, $d37id$ChIJrfwzlDa7rhIRc46_ISaISOo$d37id$, $d38id$ChIJL-c_5m6cCQ4Rb91npMD6AY4$d38id$, $d39id$ChIJZ_gGapu8rhIRGfCKdarkXSY$d39id$, $d40id$ChIJq1zMKna7rhIRpCYRp8EdX9k$d40id$, $d41id$ChIJZSYVjpW7rhIRDHH8pi4K8lc$d41id$, $d42id$ChIJf_Ec3tbHrhIRM2T2oiA8G9c$d42id$, $d43id$ChIJzQMKkWOurhIRHaMTERaYkXM$d43id$, $d44id$ChIJtdb-zb-jrhIRxueMORvyElY$d44id$, $d45id$ChIJo7Uq5Ja8rhIREdMjZEvvJqo$d45id$, $d46id$ChIJ_4as-RS9rhIRHDN7pWxQhTA$d46id$, $d47id$ChIJOSitgpy8rhIRN7llRDtNFts$d47id$, $d48id$ChIJo97mxOK9rhIRtdOby5AtHK0$d48id$, $d49id$ChIJWY8TG0WlrhIRDh8LexHx6uw$d49id$, $d50id$ChIJ3T2nRjm4XwcR6dJ727eJHP8$d50id$, $d51id$ChIJWUgF33q7rhIRTScczwUOK-4$d51id$, $d52id$ChIJp4dgp-O2rhIRt97q3ErD3og$d52id$, $d53id$ChIJERdyerO9rhIRdYDqnfwNgJo$d53id$, $d54id$ChIJhZJ7dAW7rhIRUwKGczlUpQ8$d54id$, $d55id$ChIJ2WPAH7y5rhIRSunmWcdIcgU$d55id$, $d56id$ChIJg6H1MGC8rhIRSnGZDLocv-g$d56id$, $d57id$ChIJFxUUUGS6rhIRoW0rQqFCut4$d57id$, $d58id$ChIJlTuK4BaL328RS3UCbq6o230$d58id$, $d59id$ChIJMdTPPDO6rhIRw9hYBl22Jbw$d59id$, $d60id$ChIJNW-z33S9rhIR85a4tCw6Ix0$d60id$, $d61id$ChIJ-xqRMAulrhIRUgfj0X4Ap0g$d61id$, $d62id$ChIJVRBLk528rhIRIBF2Ft43LvY$d62id$, $d63id$ChIJM3xuZ5S9rhIRjkry8f33HgE$d63id$, $d64id$ChIJqXvcFcG7rhIR6cWWbkmzWUU$d64id$, $d65id$ChIJDVFeshO7rhIR-_Rc_CTJSiQ$d65id$, $d66id$ChIJFT3lFtKlrhIRdrIkisuU0Dg$d66id$, $d67id$ChIJ2QXXKY9nvK0Rrnw30Dmu5Sc$d67id$, $d68id$ChIJSWB_1OS7rhIRrsdQJN4h8bs$d68id$, $d69id$ChIJp3an4gu-rhIRqx4-c45mRsI$d69id$, $d70id$ChIJOUJOIEchcUgRDBN2v9jdyQA$d70id$, $d71id$ChIJ80KRAh27rhIRg35mFxxcDgQ$d71id$, $d72id$ChIJ8QQvYRujrhIRbg-i6_FXQf4$d72id$, $d73id$ChIJjSOuW7O6rhIRZxnRizF1gN8$d73id$, $d74id$ChIJB7usnVi7rhIR3UZJGvFXzb4$d74id$, $d75id$ChIJJREC7DOYrhIRuCCFlnIpLbc$d75id$, $d76id$ChIJXzzM0AW9rhIRLXFqiiOf9A4$d76id$, $d77id$ChIJQyTIXV2xrhIRvt75PLZa59k$d77id$, $d78id$ChIJUb0CX7KkrhIRDGuAM977xpA$d78id$, $d79id$ChIJp-sUzO-9rhIREdkSn6s0VfY$d79id$, $d80id$ChIJUUgbep2irhIRdNf-KecvrxQ$d80id$, $d81id$ChIJYVXC_6W7rhIRQcVjlDtxu7M$d81id$, $d82id$ChIJnWBWvvq8rhIRy_efNb_wqK0$d82id$, $d83id$ChIJX_zHlHmzrhIRXBJT06qqpvo$d83id$, $d84id$ChIJQYV9aby8rhIRdaR_0m_ivbQ$d84id$, $d85id$ChIJkya97X68rhIRZjkY_tIZ98k$d85id$, $d86id$ChIJeS2x8aa9rhIRlwdzcnR-xZg$d86id$, $d87id$ChIJI-SCoXWLa4oRXZqSiVww0jY$d87id$)
      and latitude is not null
      and longitude is not null
      and location is null;
  end if;
end $$;
