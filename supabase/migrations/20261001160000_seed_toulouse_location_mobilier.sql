-- Seed event furniture, tableware, tent, and equipment rentals around Toulouse.
-- Only these google_place_id values are linked to Location & Mobilier subcategories.

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
  ($d0n$A.B.C. Location$d0n$, $d0d$Location de tables et chaises à Toulouse.
Téléphone : 05 34 36 03 04
Site web : https://www.abclocation.com/
Note Google : 4.5/5 (28 avis)
Google Maps : https://maps.google.com/?cid=18317896959075787154&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d0d$, true, 43.6026696, 1.358722, $d0a$6 Rue Gaye Marie$d0a$, $d0c$Toulouse$d0c$, $d0p$31300$d0p$, $d0g$ChIJy1nt0KaxrhIRkqHrXTs-Nv4$d0g$, 4.5, 28, $d0s$Tables & chaises$d0s$),
  ($d1n$Agence YE - Agence événementielle & de communication$d1n$, $d1d$Location de mobilier événementiel à Toulouse.
Téléphone : 05 61 38 75 19
Site web : http://www.agence-ye.fr/
Note Google : 5/5 (31 avis)
Google Maps : https://maps.google.com/?cid=548548209091323574&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d1d$, true, 43.5988494, 1.4541457, $d1a$32 Rue des Potiers$d1a$, $d1c$Toulouse$d1c$, $d1p$31000$d1p$, $d1g$ChIJz50K62K7rhIRtqYQmbDVnAc$d1g$, 5.0, 31, $d1s$Mobilier$d1s$),
  ($d2n$Agence événementielle Ideal - Toulouse$d2n$, $d2d$Location de mobilier événementiel à Toulouse.
Téléphone : 05 36 09 00 77
Site web : https://group-ideal.fr/
Note Google : 4.3/5 (28 avis)
Google Maps : https://maps.google.com/?cid=5836899623519981551&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d2d$, true, 43.6090936, 1.4456023, $d2a$44 Bd de Strasbourg$d2a$, $d2c$Toulouse$d2c$, $d2p$31000$d2p$, $d2g$ChIJ4S6l1saWrhIR7w-FSUjVAFE$d2g$, 4.3, 28, $d2s$Mobilier$d2s$),
  ($d3n$Animad'OC Location, jeux sportifs, jeux gonflables, patinoire écologique, team builging, BDE$d3n$, $d3d$Location de tentes et structures à Daux.
Téléphone : 06 64 92 22 48
Site web : https://www.animadoc.info/
Note Google : 4.9/5 (19 avis)
Google Maps : https://maps.google.com/?cid=13253288798360994741&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d3d$, true, 43.678487, 1.253514, $d3a$389 Chem. de Guerguy$d3a$, $d3c$Daux$d3c$, $d3p$31700$d3p$, $d3g$ChIJ94wArj6srhIRtYP4c_Ej7bc$d3g$, 4.9, 19, $d3s$Tentes & structures$d3s$),
  ($d4n$Artilect FabLab Toulouse - Impression 3D, Coworking, Formation, Location de salle, Team Building$d4n$, $d4d$Location de vaisselle événementielle à Toulouse.
Téléphone : 05 31 61 61 41
Site web : https://artilect.fr/
Note Google : 4.6/5 (162 avis)
Google Maps : https://maps.google.com/?cid=15483177686630327737&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d4d$, true, 43.6017406, 1.4429481, $d4a$10 Rue Tripière$d4a$, $d4c$Toulouse$d4c$, $d4p$31000$d4p$, $d4g$ChIJX37AmAu7rhIRueXalRJM39Y$d4g$, 4.6, 162, $d4s$Vaisselle$d4s$),
  ($d5n$Atelier Camus - Faire-part - Decoration Mariage - Wedding Designer$d5n$, $d5d$Location de vaisselle événementielle à Toulouse.
Téléphone : 06 43 61 22 89
Site web : https://www.atelier-camus.com/
Note Google : 4.9/5 (119 avis)
Google Maps : https://maps.google.com/?cid=17487502430677092984&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d5d$, true, 43.5953476, 1.4196346, $d5a$52 Bd Gabriel Koenigs$d5a$, $d5c$Toulouse$d5c$, $d5p$31300$d5p$, $d5g$ChIJ9c-6AAy7rhIReMpJ1c4WsPI$d5g$, 4.9, 119, $d5s$Vaisselle$d5s$),
  ($d6n$BOOST Evenement$d6n$, $d6d$Location de tentes et structures à Nailloux.
Téléphone : 06 87 99 67 45
Site web : http://boost-evenement.com/
Note Google : 4.9/5 (81 avis)
Google Maps : https://maps.google.com/?cid=2380799185136516282&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d6d$, true, 43.353110699999995, 1.6225318000000002, $d6a$8 All. Erasme$d6a$, $d6c$Nailloux$d6c$, $d6p$31560$d6p$, $d6g$ChIJD7D1nx7vrhIRuvyZrz5MCiE$d6g$, 4.9, 81, $d6s$Tentes & structures$d6s$),
  ($d7n$BURO Club$d7n$, $d7d$Location de tentes et structures à Toulouse.
Téléphone : 05 62 15 04 00
Site web : https://www.buro.com/centre/toulouse-compans/
Note Google : 4.9/5 (77 avis)
Google Maps : https://maps.google.com/?cid=17627245761450049584&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d7d$, true, 43.6111174, 1.4363191, $d7a$1 Espace Compans Caffarelli$d7a$, $d7c$Toulouse$d7c$, $d7p$31000$d7p$, $d7g$ChIJQbbGp127rhIRMIC9e6COoPQ$d7g$, 4.9, 77, $d7s$Tentes & structures$d7s$),
  ($d8n$Barnum Location$d8n$, $d8d$Location de tentes et structures à Fenouillet.
Téléphone : 09 81 87 70 19
Site web : https://www.barnum-location.fr/
Note Google : 4.4/5 (26 avis)
Google Maps : https://maps.google.com/?cid=10118482616071077790&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d8d$, true, 43.6717456, 1.4014274, $d8a$5 All. des Seignous$d8a$, $d8c$Fenouillet$d8c$, $d8p$31150$d8p$, $d8g$ChIJUxoIzhSkrhIRnr_hTFQSbIw$d8g$, 4.4, 26, $d8s$Tentes & structures$d8s$),
  ($d9n$Be Lounge Toulouse - Location tente et mobilier de réception$d9n$, $d9d$Location de tentes et structures à Bessières.
Téléphone : 05 32 11 13 48
Site web : https://www.be-lounge.com/fr/
Note Google : 4.9/5 (49 avis)
Google Maps : https://maps.google.com/?cid=5363769089610048489&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d9d$, true, 43.7957755, 1.6062402999999998, $d9a$469 Av. de la Gare$d9a$, $d9c$Bessières$d9c$, $d9p$31660$d9p$, $d9g$ChIJd-kvDiy9rhIR6WNti5Hvb0o$d9g$, 4.9, 49, $d9s$Tentes & structures$d9s$),
  ($d10n$Bouigues evenement$d10n$, $d10d$Location de mobilier événementiel à Lherm.
Téléphone : 06 98 70 61 51
Site web : http://www.bouiguesevenement.fr/
Note Google : 5/5 (130 avis)
Google Maps : https://maps.google.com/?cid=13694223333311479149&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d10d$, true, 43.4274278, 1.2373227, $d10a$Proche muret et toulouse, 92 Rte de Saint-Hilaire$d10a$, $d10c$Lherm$d10c$, $d10p$31600$d10p$, $d10g$ChIJ69YqM3zLrhIRbX3lCJGnC74$d10g$, 5.0, 130, $d10s$Mobilier$d10s$),
  ($d11n$By Evos$d11n$, $d11d$Location de tentes et structures à Toulouse.
Téléphone : 05 82 95 24 69
Site web : https://byevos.fr/?utm_source=google&utm_medium=organic&utm_campaign=gmb
Note Google : 5/5 (142 avis)
Google Maps : https://maps.google.com/?cid=10035723017108967526&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d11d$, true, 43.6065299, 1.3905687, $d11a$82 Rue de Maubec$d11a$, $d11c$Toulouse$d11c$, $d11p$31300$d11p$, $d11g$ChIJq6paBZyirhIRZtD9mukMRos$d11g$, 5.0, 142, $d11s$Tentes & structures$d11s$),
  ($d12n$C'est deux euros Toulouse - Jeanne d'Arc$d12n$, $d12d$Location de vaisselle événementielle à Toulouse.
Téléphone : 05 61 21 26 80
Site web : https://www.cestdeuxeuros.com/?utm_source=gmb
Note Google : 4.4/5 (219 avis)
Google Maps : https://maps.google.com/?cid=7495380569118676253&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d12d$, true, 43.608435, 1.4455117, $d12a$37 Bd de Strasbourg$d12a$, $d12c$Toulouse$d12c$, $d12p$31000$d12p$, $d12g$ChIJ8w45pc-9rhIRHRWvVurwBGg$d12g$, 4.4, 219, $d12s$Vaisselle$d12s$),
  ($d13n$C.D.S EVENT$d13n$, $d13d$Location de tentes et structures à Toulouse.
Téléphone : 06 26 35 71 38
Site web : https://www.cds-event.fr/
Note Google : 5/5 (24 avis)
Google Maps : https://maps.google.com/?cid=1943565442038118753&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d13d$, true, 43.561208099999995, 1.4039762, $d13a$12 Rue de Rimont$d13a$, $d13c$Toulouse$d13c$, $d13p$31100$d13p$, $d13g$ChIJZdWdcsGlrhIRYTlo2nju-Bo$d13g$, 5.0, 24, $d13s$Tentes & structures$d13s$),
  ($d14n$CHAPITEAU BAUER location barnum structure tables, chaises, sol, parquet - événementielle Haute-Garonne 31 Toulouse Montauban$d14n$, $d14d$Location de tentes et structures à Le Burgaud.
Téléphone : 06 41 81 04 09
Site web : https://locationbarnumschapiteaux31.fr/
Note Google : 4.8/5 (21 avis)
Google Maps : https://maps.google.com/?cid=9007627825439627944&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d14d$, true, 43.786072999999995, 1.1339109, $d14a$Pouchot$d14a$, $d14c$Le Burgaud$d14c$, $d14p$31330$d14p$, $d14g$ChIJE3BRVDP9qxIRqNpAZMiFAX0$d14g$, 4.8, 21, $d14s$Tentes & structures$d14s$),
  ($d15n$Cameleon en fete GRAMONT$d15n$, $d15d$Location de vaisselle événementielle à Toulouse.
Téléphone : 05 61 26 09 18
Site web : https://www.cameleonenfete.fr/?utm_source=gmb
Note Google : 4.1/5 (609 avis)
Google Maps : https://maps.google.com/?cid=541331332169996002&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d15d$, true, 43.6326214, 1.4825983999999999, $d15a$Za Gramont, 52 Chem. de Gabardie$d15a$, $d15c$Toulouse$d15c$, $d15p$31200$d15p$, $d15g$ChIJXxrw_CmjrhIR4hbIf_oxgwc$d15g$, 4.1, 609, $d15s$Vaisselle$d15s$),
  ($d16n$Cubevents Toulouse - Albi - Rodez$d16n$, $d16d$Location de mobilier événementiel à Saint-Jean.
Téléphone : 05 63 81 00 95
Site web : http://cubevents.fr/
Note Google : 3.5/5 (26 avis)
Google Maps : https://maps.google.com/?cid=5489564045856287225&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d16d$, true, 43.6500816, 1.513998, $d16a$11 Bd Ratalens$d16a$, $d16c$Saint-Jean$d16c$, $d16p$31240$d16p$, $d16g$ChIJqxv4ktuirhIR-SkFLWrZLkw$d16g$, 3.5, 26, $d16s$Mobilier$d16s$),
  ($d17n$Domaine de Preissac$d17n$, $d17d$Location de tentes et structures à Castelmaurou.
Téléphone : 05 61 37 53 75
Site web : http://www.domainedepreissac.fr/
Note Google : 4.5/5 (883 avis)
Google Maps : https://maps.google.com/?cid=3316828359614302325&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d17d$, true, 43.675182299999996, 1.5051435000000002, $d17a$2 Rte du Clos du Loup$d17a$, $d17c$Castelmaurou$d17c$, $d17p$31180$d17p$, $d17g$ChIJQ-ccPnCirhIRdYjA29G9By4$d17g$, 4.5, 883, $d17s$Tentes & structures$d17s$),
  ($d18n$Déco Ballons Services / Tout pour la fête !$d18n$, $d18d$Location de vaisselle événementielle à Fenouillet.
Téléphone : 05 61 47 58 59
Site web : http://www.decoballons.com/
Note Google : 4.2/5 (231 avis)
Google Maps : https://maps.google.com/?cid=470443014410269332&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d18d$, true, 43.6737737, 1.4087116, $d18a$56 Rte de Paris$d18a$, $d18c$Fenouillet$d18c$, $d18p$31150$d18p$, $d18g$ChIJK4aQX1GkrhIRlPL82G1ZhwY$d18g$, 4.2, 231, $d18s$Vaisselle$d18s$),
  ($d19n$ExtraNoche Location Matériel Evènementiel Toulouse ✨ barnum, tente de réception, château gonflable$d19n$, $d19d$Location de tentes et structures à Ayguesvives.
Téléphone : 06 19 61 78 00
Site web : https://extranoche.fr/
Note Google : 5/5 (125 avis)
Google Maps : https://maps.google.com/?cid=12343695914186093807&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d19d$, true, 43.432134, 1.599659, $d19a$1 bis Rte de Nailloux$d19a$, $d19c$Ayguesvives$d19c$, $d19p$31450$d19p$, $d19g$ChIJkTx2hvrtrhIR77SAxAieTas$d19g$, 5.0, 125, $d19s$Tentes & structures$d19s$),
  ($d20n$Grisby : le jeu business$d20n$, $d20d$Location de tentes et structures à Toulouse.
Téléphone : 06 73 29 90 67
Site web : https://www.grisby.fun/
Note Google : 5/5 (18 avis)
Google Maps : https://maps.google.com/?cid=3257355399152525828&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d20d$, true, 43.6061938, 1.4555764, $d20a$38 Rue Gabriel Péri$d20a$, $d20c$Toulouse$d20c$, $d20p$31000$d20p$, $d20g$ChIJR7WAI4i9rhIRBOKvMXpzNC0$d20g$, 5.0, 18, $d20s$Tentes & structures$d20s$),
  ($d21n$Hōc Diē - Agence Événementielle & Wedding Planner Toulouse$d21n$, $d21d$Location de tentes et structures à Saint-Jory.
Téléphone : 05 54 54 74 48
Site web : https://www.hocdie.com/
Note Google : 4.8/5 (56 avis)
Google Maps : https://maps.google.com/?cid=4308829256576810291&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d21d$, true, 43.7280421, 1.3835750999999998, $d21a$7 Chem. de Casselevres$d21a$, $d21c$Saint-Jory$d21c$, $d21p$31790$d21p$, $d21g$ChIJXYYS2aWnrhIRMz0SNGEJzDs$d21g$, 4.8, 56, $d21s$Tentes & structures$d21s$),
  ($d22n$Jour de Fête$d22n$, $d22d$Location de vaisselle événementielle à Portet-sur-Garonne.
Téléphone : 05 34 64 12 09
Site web : https://www.boutique-jourdefete.com/magasin-portet-sur-garonne/?utm_source=GMB&utm_campaign=Multidiffusion&utm_medium=local&utm_content=PSG&origin=GMB
Note Google : 4/5 (648 avis)
Google Maps : https://maps.google.com/?cid=13389522622888652245&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d22d$, true, 43.5322628, 1.3976179, $d22a$17 Bd de l'Europe$d22a$, $d22c$Portet-sur-Garonne$d22c$, $d22p$31120$d22p$, $d22g$ChIJe_zxeKK5rhIR1a1VgeIj0bk$d22g$, 4.0, 648, $d22s$Vaisselle$d22s$),
  ($d23n$Jumpy's Party Locations & Prestations$d23n$, $d23d$Location de tentes et structures à Seysses.
Téléphone : 06 64 42 56 32
Site web : https://www.jumpyspartyjeugonfable.com/
Note Google : 4.5/5 (28 avis)
Google Maps : https://maps.google.com/?cid=17143203139263534882&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d23d$, true, 43.4917489, 1.3154701, $d23a$Zac Segla$d23a$, $d23c$Seysses$d23c$, $d23p$31600$d23p$, $d23g$ChIJ5WjA4lijrhIRIhcqNG3k6O0$d23g$, 4.5, 28, $d23s$Tentes & structures$d23s$),
  ($d24n$KRD Audiovisuel$d24n$, $d24d$Location de tentes et structures à Montrabé.
Téléphone : 05 82 95 02 56
Site web : https://www.krd-audiovisuel.fr/
Note Google : 4.9/5 (82 avis)
Google Maps : https://maps.google.com/?cid=15626722254261330398&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d24d$, true, 43.645119199999996, 1.5140837999999999, $d24a$2 Rue de l'Europe$d24a$, $d24c$Montrabé$d24c$, $d24p$31850$d24p$, $d24g$ChIJB0hP7AqWrhIR3iHwqBhF3dg$d24g$, 4.9, 82, $d24s$Tentes & structures$d24s$),
  ($d25n$L'ESPACE 111$d25n$, $d25d$Location de tentes et structures à Toulouse.
Note Google : 4.3/5 (21 avis)
Google Maps : https://maps.google.com/?cid=1749708244379717202&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d25d$, true, 43.579087699999995, 1.4055887, $d25a$111 Rue Nicolas Louis Vauquelin$d25a$, $d25c$Toulouse$d25c$, $d25p$31100$d25p$, $d25g$ChIJb3rH-aa7rhIRUk7TvmA2SBg$d25g$, 4.3, 21, $d25s$Tentes & structures$d25s$),
  ($d26n$La Vaisselle de Léontine$d26n$, $d26d$Location de vaisselle événementielle à Toulouse.
Téléphone : 07 69 19 39 58
Site web : http://www.lavaisselledeleontine.com/
Note Google : 2.3/5 (3 avis)
Google Maps : https://maps.google.com/?cid=8836138749024523275&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d26d$, true, 43.6087201, 1.4514173, $d26a$10 Rue de Belfort$d26a$, $d26c$Toulouse$d26c$, $d26p$31000$d26p$, $d26g$ChIJVYjmjEa9rhIRC9SrWWBFoHo$d26g$, 2.3, 3, $d26s$Vaisselle$d26s$),
  ($d27n$Laguiole Galerie Toulouse | Boutique Forge de Laguiole$d27n$, $d27d$Location de vaisselle événementielle à Toulouse.
Téléphone : 05 61 23 51 37
Site web : http://www.forge-de-laguiole.com/
Note Google : 4.6/5 (34 avis)
Google Maps : https://maps.google.com/?cid=13411632214277947618&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d27d$, true, 43.59997430000001, 1.4486282, $d27a$4 Rue Boulbonne$d27a$, $d27c$Toulouse$d27c$, $d27p$31000$d27p$, $d27g$ChIJ0xBV8py8rhIR4gA55nCwH7o$d27g$, 4.6, 34, $d27s$Vaisselle$d27s$),
  ($d28n$Lahille SAS$d28n$, $d28d$Location de tentes et structures à Saint-Jean.
Téléphone : 05 61 24 10 79
Site web : https://www.lahille.com/
Note Google : 4.7/5 (93 avis)
Google Maps : https://maps.google.com/?cid=12140024623339629582&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d28d$, true, 43.6528632, 1.518864, $d28a$10 Rue Jean Monnet$d28a$, $d28c$Saint-Jean$d28c$, $d28p$31240$d28p$, $d28g$ChIJERJeMJyirhIRDmynBhMIeqg$d28g$, 4.7, 93, $d28s$Tentes & structures$d28s$),
  ($d29n$Le Labo Ephémère$d29n$, $d29d$Location de tentes et structures à Toulouse.
Téléphone : 06 66 33 09 01
Site web : http://www.lelabo-ephemere.com/
Note Google : 5/5 (68 avis)
Google Maps : https://maps.google.com/?cid=15786890460739778871&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d29d$, true, 43.6029055, 1.4447591, $d29a$1 Pl. Roger Salengro$d29a$, $d29c$Toulouse$d29c$, $d29p$31000$d29p$, $d29g$ChIJOSitgpy8rhIRN7llRDtNFts$d29g$, 5.0, 68, $d29s$Tentes & structures$d29s$),
  ($d30n$Le Mur Interactif Occitanie$d30n$, $d30d$Location de tentes et structures à Toulouse.
Téléphone : 06 12 09 48 43
Site web : https://lemurinteractifoccitanie.com/
Note Google : 5/5 (28 avis)
Google Maps : https://maps.google.com/?cid=13648246430271808143&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d30d$, true, 43.6111205, 1.4399113, $d30a$19 Bd d'Arcole$d30a$, $d30c$Toulouse$d30c$, $d30p$31000$d30p$, $d30g$ChIJSWXb1h5Ax6sRjyJYG9FPaL0$d30g$, 5.0, 28, $d30s$Tentes & structures$d30s$),
  ($d31n$Les Salons d'Albert : location Séminaire, Popup Store, Expositions au centre ville de Toulouse$d31n$, $d31d$Location de tentes et structures à Toulouse.
Téléphone : 05 61 21 17 91
Site web : https://www.hotel-albert1.com/pop-up-store/
Note Google : 4.9/5 (31 avis)
Google Maps : https://maps.google.com/?cid=5775861618941220085&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d31d$, true, 43.605769599999995, 1.4448343, $d31a$5 Rue John-Fitzgerald Kennedy$d31a$, $d31c$Toulouse$d31c$, $d31p$31000$d31p$, $d31g$ChIJHY-LQJ68rhIR9dTNZIr7J1A$d31g$, 4.9, 31, $d31s$Tentes & structures$d31s$),
  ($d32n$Lign'E$d32n$, $d32d$Location de mobilier événementiel à Toulouse.
Téléphone : 05 62 75 99 30
Site web : https://lign-e.com/
Note Google : 4.4/5 (24 avis)
Google Maps : https://maps.google.com/?cid=13863063624266482518&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d32d$, true, 43.629253999999996, 1.409481, $d32a$2 allée Charles Gandia$d32a$, $d32c$Toulouse$d32c$, $d32p$31200$d32p$, $d32g$ChIJSTNRq8mkrhIRVgMLp-p-Y8A$d32g$, 4.4, 24, $d32s$Mobilier$d32s$),
  ($d33n$Loc Events 31$d33n$, $d33d$Location de mobilier événementiel à Le Fauga.
Téléphone : 06 42 85 42 18
Site web : https://locevents31.fr/
Note Google : 4.9/5 (30 avis)
Google Maps : https://maps.google.com/?cid=17796124310935633282&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d33d$, true, 43.3989889, 1.2856992999999999, $d33a$18 Chem. de Cuqs$d33a$, $d33c$Le Fauga$d33c$, $d33p$31410$d33p$, $d33g$ChIJbRUMkdDNrhIRgv0C3MWI-PY$d33g$, 4.9, 30, $d33s$Mobilier$d33s$),
  ($d34n$Loc'housses - Location de matériel de réception - mobilier - Vaisselle$d34n$, $d34d$Location de vaisselle événementielle à Aucamville.
Téléphone : 05 82 95 74 35
Site web : https://www.loc-housses.com/
Note Google : 4.9/5 (121 avis)
Google Maps : https://maps.google.com/?cid=6354733101696988170&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d34d$, true, 43.674322499999995, 1.4200597, $d34a$3 Bis Imp. Muratet$d34a$, $d34c$Aucamville$d34c$, $d34p$31140$d34p$, $d34g$ChIJjb6jjyWmrhIRCrQQURaMMFg$d34g$, 4.9, 121, $d34s$Vaisselle$d34s$),
  ($d35n$Loc2lux Events - Location Matériels pour évènements ( Mariage, Baby shower, Fêtes privés... )$d35n$, $d35d$Location de tables et chaises à Cugnaux.
Téléphone : 09 70 70 85 45
Site web : http://www.loc2lux.fr/
Note Google : 5/5 (202 avis)
Google Maps : https://maps.google.com/?cid=392456138578651466&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d35d$, true, 43.5363318, 1.3610045, $d35a$4bis Rue Alfred Sauvy$d35a$, $d35c$Cugnaux$d35c$, $d35p$31270$d35p$, $d35g$ChIJ2WPAH7y5rhIRSunmWcdIcgU$d35g$, 5.0, 202, $d35s$Tables & chaises$d35s$),
  ($d36n$Location Salle Toulouse - La péniche Saint-Louis$d36n$, $d36d$Location de tentes et structures à Toulouse.
Téléphone : 07 61 92 39 57
Site web : https://peniche-saint-louis.fr/
Note Google : 4.4/5 (121 avis)
Google Maps : https://maps.google.com/?cid=16771155122751893834&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d36d$, true, 43.594414799999996, 1.457247, $d36a$35 Bd Griffoul Dorval$d36a$, $d36c$Toulouse$d36c$, $d36p$31400$d36p$, $d36g$ChIJg6H1MGC8rhIRSnGZDLocv-g$d36g$, 4.4, 121, $d36s$Tentes & structures$d36s$),
  ($d37n$MYCOMM$d37n$, $d37d$Location de tentes et structures à Toulouse.
Téléphone : 05 36 09 06 90
Site web : https://www.mycomm.fr/
Note Google : 4.3/5 (21 avis)
Google Maps : https://maps.google.com/?cid=16613033395793725406&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d37d$, true, 43.651944, 1.4388953000000002, $d37a$Sporting Village, 272 Rte de Launaguet$d37a$, $d37c$Toulouse$d37c$, $d37p$31200$d37p$, $d37g$ChIJEX_TFta9rhIR3of8ldpZjeY$d37g$, 4.3, 21, $d37s$Tentes & structures$d37s$),
  ($d38n$Margotte Vintage$d38n$, $d38d$Location de mobilier événementiel à Montgiscard.
Téléphone : 07 50 30 16 27
Site web : http://margotte-vintage.fr/
Note Google : 5/5 (84 avis)
Google Maps : https://maps.google.com/?cid=11800724786568835668&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d38d$, true, 43.4532636, 1.5805132, $d38a$1 Chem. Delmont$d38a$, $d38c$Montgiscard$d38c$, $d38p$31450$d38p$, $d38g$ChIJf9NDzwZcQ2YRVDKVo6uYxKM$d38g$, 5.0, 84, $d38s$Mobilier$d38s$),
  ($d39n$Marthe et Maurice$d39n$, $d39d$Location de vaisselle événementielle à Beaumont-sur-Lèze.
Téléphone : 06 84 20 99 08
Site web : http://marthe-et-maurice.fr/
Note Google : 5/5 (24 avis)
Google Maps : https://maps.google.com/?cid=7003907959076887880&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d39d$, true, 43.375672, 1.3335622, $d39a$274 Garouste$d39a$, $d39c$Beaumont-sur-Lèze$d39c$, $d39p$31870$d39p$, $d39g$ChIJ4WcOBNsCgIQRSB1PNC7hMmE$d39g$, 5.0, 24, $d39s$Vaisselle$d39s$),
  ($d40n$Meeting Lab$d40n$, $d40d$Location de tentes et structures à Toulouse.
Téléphone : 05 34 25 33 00
Site web : http://www.meetinglab-europa.com/
Note Google : 4.8/5 (190 avis)
Google Maps : https://maps.google.com/?cid=17739177409258066208&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d40d$, true, 43.603321, 1.444356, $d40a$5 Rue Saint-Pantaléon$d40a$, $d40c$Toulouse$d40c$, $d40p$31000$d40p$, $d40g$ChIJVRBLk528rhIRIBF2Ft43LvY$d40g$, 4.8, 190, $d40s$Tentes & structures$d40s$),
  ($d41n$Midica$d41n$, $d41d$Location de vaisselle événementielle à Toulouse.
Téléphone : 05 61 14 82 82
Site web : https://www.midica.fr/
Note Google : 4.1/5 (3781 avis)
Google Maps : https://maps.google.com/?cid=4964318236176163890&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d41d$, true, 43.6002033, 1.4449967, $d41a$13 Pl. Etienne Esquirol$d41a$, $d41c$Toulouse$d41c$, $d41p$31000$d41p$, $d41g$ChIJWYQLR528rhIRMiRGOyLN5EQ$d41g$, 4.1, 3781, $d41s$Vaisselle$d41s$),
  ($d42n$Options Toulouse - Location de matériel événementiel$d42n$, $d42d$Location de tables et chaises à Toulouse.
Téléphone : 05 34 25 11 00
Site web : https://www.options.fr/options-toulouse?utm_campaign=fiche_gmb_roulouse&utm_medium=organic&utm_source=google_business_profil
Note Google : 4.6/5 (150 avis)
Google Maps : https://maps.google.com/?cid=18102982770450422569&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d42d$, true, 43.6026696, 1.358722, $d42a$6 Rue Gaye Marie zac de$d42a$, $d42c$Toulouse$d42c$, $d42p$31300$d42p$, $d42g$ChIJD49fBXaYrhIRKdu2f-q2Ovs$d42g$, 4.6, 150, $d42s$Tables & chaises$d42s$),
  ($d43n$Pops Location - Toulouse$d43n$, $d43d$Location de mobilier événementiel à Toulouse.
Téléphone : 01 34 92 20 00
Site web : https://www.pops-location.fr/pops-toulouse
Note Google : 5/5 (1 avis)
Google Maps : https://maps.google.com/?cid=13511444006789224190&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d43d$, true, 43.6026696, 1.358722, $d43a$6 Rue Gaye Marie zac de$d43a$, $d43c$Toulouse$d43c$, $d43p$31300$d43p$, $d43g$ChIJSaLGKpqxrhIR_pZAy7xKgrs$d43g$, 5.0, 1, $d43s$Mobilier$d43s$),
  ($d44n$Psb Lounge$d44n$, $d44d$Location de mobilier événementiel à Verdun-sur-Garonne.
Téléphone : 05 61 50 80 07
Site web : https://www.psb-lounge.fr/
Note Google : 5/5 (100 avis)
Google Maps : https://maps.google.com/?cid=13199251655021109432&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d44d$, true, 43.822493, 1.2443074, $d44a$ZI la FAOUQUETTE, 45 rue Hélène boucher$d44a$, $d44c$Verdun-sur-Garonne$d44c$, $d44p$82600$d44p$, $d44g$ChIJJREC7DOYrhIRuCCFlnIpLbc$d44g$, 5.0, 100, $d44s$Mobilier$d44s$),
  ($d45n$Rosea Plena Events$d45n$, $d45d$Location de tentes et structures à Toulouse.
Téléphone : 06 46 21 56 05
Site web : http://www.roseaplena-events.fr/
Note Google : 5/5 (20 avis)
Google Maps : https://maps.google.com/?cid=2151285044530341099&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d45d$, true, 43.5794522, 1.3933556, $d45a$216 Rte de Saint-Simon$d45a$, $d45c$Toulouse$d45c$, $d45p$31100$d45p$, $d45g$ChIJTSgnxF2xrhIR62TXmVnm2h0$d45g$, 5.0, 20, $d45s$Tentes & structures$d45s$),
  ($d46n$SLR Location$d46n$, $d46d$Location de mobilier événementiel à Seysses.
Téléphone : 05 62 20 05 85
Site web : https://slrlocation.fr/
Note Google : 4.3/5 (55 avis)
Google Maps : https://maps.google.com/?cid=11056195912031579344&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d46d$, true, 43.4911899, 1.3142342999999999, $d46a$ZA LA PICHE, 1 Pl. Lucien Cassagne$d46a$, $d46c$Seysses$d46c$, $d46p$31600$d46p$, $d46g$ChIJu53VLRi2rhIR0KzEj5p_b5k$d46g$, 4.3, 55, $d46s$Mobilier$d46s$),
  ($d47n$Saint Elix Location - Matériel événementiel$d47n$, $d47d$Location de mobilier événementiel à Saint-Élix-le-Château.
Téléphone : 06 73 58 35 92
Site web : http://www.st-elix-location.com/
Note Google : 4.9/5 (107 avis)
Google Maps : https://maps.google.com/?cid=9621816325605244056&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d47d$, true, 43.2806746, 1.1362173, $d47a$Le Communal$d47a$, $d47c$Saint-Élix-le-Château$d47c$, $d47p$31430$d47p$, $d47g$ChIJe5rmGSosqRIRmDzBNfiOh4U$d47g$, 4.9, 107, $d47s$Mobilier$d47s$),
  ($d48n$Sicre Evènements$d48n$, $d48d$Location de mobilier événementiel à Toulouse.
Téléphone : 05 63 02 02 77
Site web : http://www.sicre-evenements.com/
Google Maps : https://maps.google.com/?cid=14232654298681967462&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d48d$, true, 43.5793666, 1.4689994, $d48a$109 Av. de Lespinet Bât A 1 Er Ét$d48a$, $d48c$Toulouse$d48c$, $d48p$31400$d48p$, $d48g$ChIJJ0HJuES8rhIRZgPgQ62LhMU$d48g$, 0, 0, $d48s$Mobilier$d48s$),
  ($d49n$Social Events (Photobooth - Vidéobooth 360° - Karaoké - Réalité Virtuelle - Social Wall - Totem intéractifs)$d49n$, $d49d$Location de tentes et structures à Toulouse.
Téléphone : 06 82 34 56 16
Site web : https://www.social-events.fr/
Note Google : 5/5 (101 avis)
Google Maps : https://maps.google.com/?cid=10432302518615698188&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d49d$, true, 43.6311335, 1.4324177, $d49a$78 Av. des États-Unis$d49a$, $d49c$Toulouse$d49c$, $d49p$31200$d49p$, $d49g$ChIJUb0CX7KkrhIRDGuAM977xpA$d49g$, 5.0, 101, $d49s$Tentes & structures$d49s$),
  ($d50n$Solution Mobilier$d50n$, $d50d$Location de mobilier événementiel à Le Fauga.
Téléphone : 05 34 49 19 01
Site web : https://www.solution-mobilier.fr/
Note Google : 3.7/5 (18 avis)
Google Maps : https://maps.google.com/?cid=9722296520798286894&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d50d$, true, 43.39444170000001, 1.2892010999999999, $d50a$25 Rue du Luxembourg$d50a$, $d50c$Le Fauga$d50c$, $d50p$31410$d50p$, $d50g$ChIJoyR9XazNrhIRLrQyuyyJ7IY$d50g$, 3.7, 18, $d50s$Mobilier$d50s$),
  ($d51n$Souchon Reception$d51n$, $d51d$Location de tables et chaises à Toulouse.
Téléphone : 05 34 27 04 03
Site web : http://www.souchon-reception.com/
Note Google : 3.8/5 (38 avis)
Google Maps : https://maps.google.com/?cid=3047978422266029840&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d51d$, true, 43.5439438, 1.4049441, $d51a$19 r Gaston Evrard Ctre De Gros Larrieu$d51a$, $d51c$Toulouse$d51c$, $d51p$31100$d51p$, $d51g$ChIJT9UNzIK5rhIREOc45jmYTCo$d51g$, 3.8, 38, $d51s$Tables & chaises$d51s$),
  ($d52n$Structura - Location de chapiteaux, barnums, tentes, mobilier, vaisselle, nappage, parquet$d52n$, $d52d$Location de tentes et structures à Aucamville.
Téléphone : 05 62 75 18 62
Site web : https://www.structura.fr/
Note Google : 4.6/5 (44 avis)
Google Maps : https://maps.google.com/?cid=5610485186213138232&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d52d$, true, 43.6761925, 1.4089268, $d52a$77 bis Rte de Paris$d52a$, $d52c$Aucamville$d52c$, $d52p$31140$d52p$, $d52g$ChIJkYzYssGlrhIROE_THY1y3E0$d52g$, 4.6, 44, $d52s$Tentes & structures$d52s$),
  ($d53n$TOAL.fr$d53n$, $d53d$Location de mobilier événementiel à Toulouse.
Téléphone : 07 69 46 87 68
Site web : https://toal.fr/
Note Google : 5/5 (2 avis)
Google Maps : https://maps.google.com/?cid=13004666000858314767&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d53d$, true, 43.6260857, 1.4592587, $d53a$160 Rue du Faubourg Bonnefoy$d53a$, $d53c$Toulouse$d53c$, $d53p$31500$d53p$, $d53g$ChIJN37bb2W9rhIRD3jCe9PaebQ$d53g$, 5.0, 2, $d53s$Mobilier$d53s$),
  ($d54n$Tentes événementielles - Organic Concept Toulouse$d54n$, $d54d$Location de tentes et structures à Villeneuve-Tolosane.
Téléphone : 05 61 31 61 59
Site web : http://organic-concept-toulouse.fr/
Note Google : 5/5 (42 avis)
Google Maps : https://maps.google.com/?cid=11972139805418280687&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d54d$, true, 43.5251618, 1.3740933, $d54a$115 Rte de Portet$d54a$, $d54c$Villeneuve-Tolosane$d54c$, $d54p$31270$d54p$, $d54g$ChIJsWw-e9O7rhIR71ZFz7iVJaY$d54g$, 5.0, 42, $d54s$Tentes & structures$d54s$),
  ($d55n$Thouron SARL - Location de chapiteaux et tentes$d55n$, $d55d$Location de tentes et structures à L'Union.
Téléphone : 05 65 30 33 03
Site web : https://www.thouron.fr/
Note Google : 4.9/5 (22 avis)
Google Maps : https://maps.google.com/?cid=12693308691166064371&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d55d$, true, 43.6621971, 1.4611234000000002, $d55a$COLORADO PARK, 4 Imp. de l'Hers$d55a$, $d55c$L'Union$d55c$, $d55p$31240$d55p$, $d55g$ChIJjQbwgaKirhIR8-5UqQCxJ7A$d55g$, 4.9, 22, $d55s$Tentes & structures$d55s$),
  ($d56n$Toul'events$d56n$, $d56d$Location de tentes et structures à Toulouse.
Téléphone : 09 80 83 96 89
Site web : https://toulevents.com/
Note Google : 4.7/5 (33 avis)
Google Maps : https://maps.google.com/?cid=12513516268678019019&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d56d$, true, 43.598851599999996, 1.4539449, $d56a$27 Rue des Potiers$d56a$, $d56c$Toulouse$d56c$, $d56p$31000$d56p$, $d56g$ChIJnWBWvvq8rhIRy_efNb_wqK0$d56g$, 4.7, 33, $d56s$Tentes & structures$d56s$),
  ($d57n$Toul'événement$d57n$, $d57d$Location de tables et chaises à Toulouse.
Téléphone : 05 82 95 65 65
Site web : https://www.toulevenement.fr/
Note Google : 4.5/5 (306 avis)
Google Maps : https://maps.google.com/?cid=17063197772961868751&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d57d$, true, 43.6014713, 1.3894567, $d57a$17 Rue du Général Lionel de Marmier$d57a$, $d57c$Toulouse$d57c$, $d57p$31300$d57p$, $d57g$ChIJxZvS0Am7rhIRz-ugRfinzOw$d57g$, 4.5, 306, $d57s$Tables & chaises$d57s$),
  ($d58n$Univers Events$d58n$, $d58d$Location de mobilier événementiel à Aucamville.
Téléphone : 05 61 13 91 70
Site web : https://www.chalet-pliable.fr/
Note Google : 5/5 (9 avis)
Google Maps : https://maps.google.com/?cid=11955681205865510801&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d58d$, true, 43.676522299999995, 1.4104416, $d58a$3 Imp. du Héron Cendré$d58a$, $d58c$Aucamville$d58c$, $d58p$31140$d58p$, $d58g$ChIJ0cMWCYmkrhIRkXdte7Yc66U$d58g$, 5.0, 9, $d58s$Mobilier$d58s$),
  ($d59n$VR Show - Agence Réalité virtuelle$d59n$, $d59d$Location de tentes et structures à Toulouse.
Téléphone : 06 07 24 01 05
Site web : http://www.vr-show.fr/
Note Google : 4.8/5 (42 avis)
Google Maps : https://maps.google.com/?cid=13023814667326170229&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d59d$, true, 43.6322083, 1.4321203999999998, $d59a$94 Av. des États-Unis$d59a$, $d59c$Toulouse$d59c$, $d59p$31200$d59p$, $d59g$ChIJQYV9aby8rhIRdaR_0m_ivbQ$d59g$, 4.8, 42, $d59s$Tentes & structures$d59s$),
  ($d60n$la fête parfaite$d60n$, $d60d$Location de tentes et structures à Seysses.
Téléphone : 06 73 62 49 62
Site web : https://www.lafeteparfaite.fr/
Note Google : 5/5 (89 avis)
Google Maps : https://maps.google.com/?cid=9036888426074936270&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d60d$, true, 43.483652, 1.2969058999999998, $d60a$1570 Chem. de Gay$d60a$, $d60c$Seysses$d60c$, $d60p$31600$d60p$, $d60g$ChIJvdtLaXm3rhIRzhMJ3yR6aX0$d60g$, 5.0, 89, $d60s$Tentes & structures$d60s$),
  ($d61n$les chaises roses Toulouse - Location de mobilier et vaisselle$d61n$, $d61d$Location de vaisselle événementielle à Drémil-Lafage.
Téléphone : 05 61 24 54 96
Site web : https://www.leschaisesroses.fr/
Note Google : 4.4/5 (128 avis)
Google Maps : https://maps.google.com/?cid=5468485260058458553&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d61d$, true, 43.595132299999996, 1.5894164, $d61a$13 Av. de la Mouyssaguese$d61a$, $d61c$Drémil-Lafage$d61c$, $d61p$31280$d61p$, $d61g$ChIJ2xtEidKQrhIRuXk-6V7240s$d61g$, 4.4, 128, $d61s$Vaisselle$d61s$),
  ($d62n$tls31$d62n$, $d62d$Location de tables et chaises à Toulouse.
Téléphone : 06 25 79 20 48
Site web : https://tls31.fr/
Note Google : 4.8/5 (47 avis)
Google Maps : https://maps.google.com/?cid=784806160759312562&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d62d$, true, 43.5821466, 1.4738757999999998, $d62a$Parking sur la droite du bâtiment, 184 Av. Antoine de Saint-Exupéry$d62a$, $d62c$Toulouse$d62c$, $d62p$31400$d62p$, $d62g$ChIJt4ca-z6lrhIRstCYjQsx5Ao$d62g$, 4.8, 47, $d62s$Tables & chaises$d62s$)
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
  ($d0n$A.B.C. Location$d0n$, $d0d$Location de tables et chaises à Toulouse.
Téléphone : 05 34 36 03 04
Site web : https://www.abclocation.com/
Note Google : 4.5/5 (28 avis)
Google Maps : https://maps.google.com/?cid=18317896959075787154&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d0d$, true, 43.6026696, 1.358722, $d0a$6 Rue Gaye Marie$d0a$, $d0c$Toulouse$d0c$, $d0p$31300$d0p$, $d0g$ChIJy1nt0KaxrhIRkqHrXTs-Nv4$d0g$, 4.5, 28, $d0s$Tables & chaises$d0s$),
  ($d1n$Agence YE - Agence événementielle & de communication$d1n$, $d1d$Location de mobilier événementiel à Toulouse.
Téléphone : 05 61 38 75 19
Site web : http://www.agence-ye.fr/
Note Google : 5/5 (31 avis)
Google Maps : https://maps.google.com/?cid=548548209091323574&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d1d$, true, 43.5988494, 1.4541457, $d1a$32 Rue des Potiers$d1a$, $d1c$Toulouse$d1c$, $d1p$31000$d1p$, $d1g$ChIJz50K62K7rhIRtqYQmbDVnAc$d1g$, 5.0, 31, $d1s$Mobilier$d1s$),
  ($d2n$Agence événementielle Ideal - Toulouse$d2n$, $d2d$Location de mobilier événementiel à Toulouse.
Téléphone : 05 36 09 00 77
Site web : https://group-ideal.fr/
Note Google : 4.3/5 (28 avis)
Google Maps : https://maps.google.com/?cid=5836899623519981551&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d2d$, true, 43.6090936, 1.4456023, $d2a$44 Bd de Strasbourg$d2a$, $d2c$Toulouse$d2c$, $d2p$31000$d2p$, $d2g$ChIJ4S6l1saWrhIR7w-FSUjVAFE$d2g$, 4.3, 28, $d2s$Mobilier$d2s$),
  ($d3n$Animad'OC Location, jeux sportifs, jeux gonflables, patinoire écologique, team builging, BDE$d3n$, $d3d$Location de tentes et structures à Daux.
Téléphone : 06 64 92 22 48
Site web : https://www.animadoc.info/
Note Google : 4.9/5 (19 avis)
Google Maps : https://maps.google.com/?cid=13253288798360994741&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d3d$, true, 43.678487, 1.253514, $d3a$389 Chem. de Guerguy$d3a$, $d3c$Daux$d3c$, $d3p$31700$d3p$, $d3g$ChIJ94wArj6srhIRtYP4c_Ej7bc$d3g$, 4.9, 19, $d3s$Tentes & structures$d3s$),
  ($d4n$Artilect FabLab Toulouse - Impression 3D, Coworking, Formation, Location de salle, Team Building$d4n$, $d4d$Location de vaisselle événementielle à Toulouse.
Téléphone : 05 31 61 61 41
Site web : https://artilect.fr/
Note Google : 4.6/5 (162 avis)
Google Maps : https://maps.google.com/?cid=15483177686630327737&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d4d$, true, 43.6017406, 1.4429481, $d4a$10 Rue Tripière$d4a$, $d4c$Toulouse$d4c$, $d4p$31000$d4p$, $d4g$ChIJX37AmAu7rhIRueXalRJM39Y$d4g$, 4.6, 162, $d4s$Vaisselle$d4s$),
  ($d5n$Atelier Camus - Faire-part - Decoration Mariage - Wedding Designer$d5n$, $d5d$Location de vaisselle événementielle à Toulouse.
Téléphone : 06 43 61 22 89
Site web : https://www.atelier-camus.com/
Note Google : 4.9/5 (119 avis)
Google Maps : https://maps.google.com/?cid=17487502430677092984&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d5d$, true, 43.5953476, 1.4196346, $d5a$52 Bd Gabriel Koenigs$d5a$, $d5c$Toulouse$d5c$, $d5p$31300$d5p$, $d5g$ChIJ9c-6AAy7rhIReMpJ1c4WsPI$d5g$, 4.9, 119, $d5s$Vaisselle$d5s$),
  ($d6n$BOOST Evenement$d6n$, $d6d$Location de tentes et structures à Nailloux.
Téléphone : 06 87 99 67 45
Site web : http://boost-evenement.com/
Note Google : 4.9/5 (81 avis)
Google Maps : https://maps.google.com/?cid=2380799185136516282&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d6d$, true, 43.353110699999995, 1.6225318000000002, $d6a$8 All. Erasme$d6a$, $d6c$Nailloux$d6c$, $d6p$31560$d6p$, $d6g$ChIJD7D1nx7vrhIRuvyZrz5MCiE$d6g$, 4.9, 81, $d6s$Tentes & structures$d6s$),
  ($d7n$BURO Club$d7n$, $d7d$Location de tentes et structures à Toulouse.
Téléphone : 05 62 15 04 00
Site web : https://www.buro.com/centre/toulouse-compans/
Note Google : 4.9/5 (77 avis)
Google Maps : https://maps.google.com/?cid=17627245761450049584&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d7d$, true, 43.6111174, 1.4363191, $d7a$1 Espace Compans Caffarelli$d7a$, $d7c$Toulouse$d7c$, $d7p$31000$d7p$, $d7g$ChIJQbbGp127rhIRMIC9e6COoPQ$d7g$, 4.9, 77, $d7s$Tentes & structures$d7s$),
  ($d8n$Barnum Location$d8n$, $d8d$Location de tentes et structures à Fenouillet.
Téléphone : 09 81 87 70 19
Site web : https://www.barnum-location.fr/
Note Google : 4.4/5 (26 avis)
Google Maps : https://maps.google.com/?cid=10118482616071077790&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d8d$, true, 43.6717456, 1.4014274, $d8a$5 All. des Seignous$d8a$, $d8c$Fenouillet$d8c$, $d8p$31150$d8p$, $d8g$ChIJUxoIzhSkrhIRnr_hTFQSbIw$d8g$, 4.4, 26, $d8s$Tentes & structures$d8s$),
  ($d9n$Be Lounge Toulouse - Location tente et mobilier de réception$d9n$, $d9d$Location de tentes et structures à Bessières.
Téléphone : 05 32 11 13 48
Site web : https://www.be-lounge.com/fr/
Note Google : 4.9/5 (49 avis)
Google Maps : https://maps.google.com/?cid=5363769089610048489&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d9d$, true, 43.7957755, 1.6062402999999998, $d9a$469 Av. de la Gare$d9a$, $d9c$Bessières$d9c$, $d9p$31660$d9p$, $d9g$ChIJd-kvDiy9rhIR6WNti5Hvb0o$d9g$, 4.9, 49, $d9s$Tentes & structures$d9s$),
  ($d10n$Bouigues evenement$d10n$, $d10d$Location de mobilier événementiel à Lherm.
Téléphone : 06 98 70 61 51
Site web : http://www.bouiguesevenement.fr/
Note Google : 5/5 (130 avis)
Google Maps : https://maps.google.com/?cid=13694223333311479149&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d10d$, true, 43.4274278, 1.2373227, $d10a$Proche muret et toulouse, 92 Rte de Saint-Hilaire$d10a$, $d10c$Lherm$d10c$, $d10p$31600$d10p$, $d10g$ChIJ69YqM3zLrhIRbX3lCJGnC74$d10g$, 5.0, 130, $d10s$Mobilier$d10s$),
  ($d11n$By Evos$d11n$, $d11d$Location de tentes et structures à Toulouse.
Téléphone : 05 82 95 24 69
Site web : https://byevos.fr/?utm_source=google&utm_medium=organic&utm_campaign=gmb
Note Google : 5/5 (142 avis)
Google Maps : https://maps.google.com/?cid=10035723017108967526&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d11d$, true, 43.6065299, 1.3905687, $d11a$82 Rue de Maubec$d11a$, $d11c$Toulouse$d11c$, $d11p$31300$d11p$, $d11g$ChIJq6paBZyirhIRZtD9mukMRos$d11g$, 5.0, 142, $d11s$Tentes & structures$d11s$),
  ($d12n$C'est deux euros Toulouse - Jeanne d'Arc$d12n$, $d12d$Location de vaisselle événementielle à Toulouse.
Téléphone : 05 61 21 26 80
Site web : https://www.cestdeuxeuros.com/?utm_source=gmb
Note Google : 4.4/5 (219 avis)
Google Maps : https://maps.google.com/?cid=7495380569118676253&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d12d$, true, 43.608435, 1.4455117, $d12a$37 Bd de Strasbourg$d12a$, $d12c$Toulouse$d12c$, $d12p$31000$d12p$, $d12g$ChIJ8w45pc-9rhIRHRWvVurwBGg$d12g$, 4.4, 219, $d12s$Vaisselle$d12s$),
  ($d13n$C.D.S EVENT$d13n$, $d13d$Location de tentes et structures à Toulouse.
Téléphone : 06 26 35 71 38
Site web : https://www.cds-event.fr/
Note Google : 5/5 (24 avis)
Google Maps : https://maps.google.com/?cid=1943565442038118753&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d13d$, true, 43.561208099999995, 1.4039762, $d13a$12 Rue de Rimont$d13a$, $d13c$Toulouse$d13c$, $d13p$31100$d13p$, $d13g$ChIJZdWdcsGlrhIRYTlo2nju-Bo$d13g$, 5.0, 24, $d13s$Tentes & structures$d13s$),
  ($d14n$CHAPITEAU BAUER location barnum structure tables, chaises, sol, parquet - événementielle Haute-Garonne 31 Toulouse Montauban$d14n$, $d14d$Location de tentes et structures à Le Burgaud.
Téléphone : 06 41 81 04 09
Site web : https://locationbarnumschapiteaux31.fr/
Note Google : 4.8/5 (21 avis)
Google Maps : https://maps.google.com/?cid=9007627825439627944&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d14d$, true, 43.786072999999995, 1.1339109, $d14a$Pouchot$d14a$, $d14c$Le Burgaud$d14c$, $d14p$31330$d14p$, $d14g$ChIJE3BRVDP9qxIRqNpAZMiFAX0$d14g$, 4.8, 21, $d14s$Tentes & structures$d14s$),
  ($d15n$Cameleon en fete GRAMONT$d15n$, $d15d$Location de vaisselle événementielle à Toulouse.
Téléphone : 05 61 26 09 18
Site web : https://www.cameleonenfete.fr/?utm_source=gmb
Note Google : 4.1/5 (609 avis)
Google Maps : https://maps.google.com/?cid=541331332169996002&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d15d$, true, 43.6326214, 1.4825983999999999, $d15a$Za Gramont, 52 Chem. de Gabardie$d15a$, $d15c$Toulouse$d15c$, $d15p$31200$d15p$, $d15g$ChIJXxrw_CmjrhIR4hbIf_oxgwc$d15g$, 4.1, 609, $d15s$Vaisselle$d15s$),
  ($d16n$Cubevents Toulouse - Albi - Rodez$d16n$, $d16d$Location de mobilier événementiel à Saint-Jean.
Téléphone : 05 63 81 00 95
Site web : http://cubevents.fr/
Note Google : 3.5/5 (26 avis)
Google Maps : https://maps.google.com/?cid=5489564045856287225&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d16d$, true, 43.6500816, 1.513998, $d16a$11 Bd Ratalens$d16a$, $d16c$Saint-Jean$d16c$, $d16p$31240$d16p$, $d16g$ChIJqxv4ktuirhIR-SkFLWrZLkw$d16g$, 3.5, 26, $d16s$Mobilier$d16s$),
  ($d17n$Domaine de Preissac$d17n$, $d17d$Location de tentes et structures à Castelmaurou.
Téléphone : 05 61 37 53 75
Site web : http://www.domainedepreissac.fr/
Note Google : 4.5/5 (883 avis)
Google Maps : https://maps.google.com/?cid=3316828359614302325&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d17d$, true, 43.675182299999996, 1.5051435000000002, $d17a$2 Rte du Clos du Loup$d17a$, $d17c$Castelmaurou$d17c$, $d17p$31180$d17p$, $d17g$ChIJQ-ccPnCirhIRdYjA29G9By4$d17g$, 4.5, 883, $d17s$Tentes & structures$d17s$),
  ($d18n$Déco Ballons Services / Tout pour la fête !$d18n$, $d18d$Location de vaisselle événementielle à Fenouillet.
Téléphone : 05 61 47 58 59
Site web : http://www.decoballons.com/
Note Google : 4.2/5 (231 avis)
Google Maps : https://maps.google.com/?cid=470443014410269332&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d18d$, true, 43.6737737, 1.4087116, $d18a$56 Rte de Paris$d18a$, $d18c$Fenouillet$d18c$, $d18p$31150$d18p$, $d18g$ChIJK4aQX1GkrhIRlPL82G1ZhwY$d18g$, 4.2, 231, $d18s$Vaisselle$d18s$),
  ($d19n$ExtraNoche Location Matériel Evènementiel Toulouse ✨ barnum, tente de réception, château gonflable$d19n$, $d19d$Location de tentes et structures à Ayguesvives.
Téléphone : 06 19 61 78 00
Site web : https://extranoche.fr/
Note Google : 5/5 (125 avis)
Google Maps : https://maps.google.com/?cid=12343695914186093807&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d19d$, true, 43.432134, 1.599659, $d19a$1 bis Rte de Nailloux$d19a$, $d19c$Ayguesvives$d19c$, $d19p$31450$d19p$, $d19g$ChIJkTx2hvrtrhIR77SAxAieTas$d19g$, 5.0, 125, $d19s$Tentes & structures$d19s$),
  ($d20n$Grisby : le jeu business$d20n$, $d20d$Location de tentes et structures à Toulouse.
Téléphone : 06 73 29 90 67
Site web : https://www.grisby.fun/
Note Google : 5/5 (18 avis)
Google Maps : https://maps.google.com/?cid=3257355399152525828&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d20d$, true, 43.6061938, 1.4555764, $d20a$38 Rue Gabriel Péri$d20a$, $d20c$Toulouse$d20c$, $d20p$31000$d20p$, $d20g$ChIJR7WAI4i9rhIRBOKvMXpzNC0$d20g$, 5.0, 18, $d20s$Tentes & structures$d20s$),
  ($d21n$Hōc Diē - Agence Événementielle & Wedding Planner Toulouse$d21n$, $d21d$Location de tentes et structures à Saint-Jory.
Téléphone : 05 54 54 74 48
Site web : https://www.hocdie.com/
Note Google : 4.8/5 (56 avis)
Google Maps : https://maps.google.com/?cid=4308829256576810291&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d21d$, true, 43.7280421, 1.3835750999999998, $d21a$7 Chem. de Casselevres$d21a$, $d21c$Saint-Jory$d21c$, $d21p$31790$d21p$, $d21g$ChIJXYYS2aWnrhIRMz0SNGEJzDs$d21g$, 4.8, 56, $d21s$Tentes & structures$d21s$),
  ($d22n$Jour de Fête$d22n$, $d22d$Location de vaisselle événementielle à Portet-sur-Garonne.
Téléphone : 05 34 64 12 09
Site web : https://www.boutique-jourdefete.com/magasin-portet-sur-garonne/?utm_source=GMB&utm_campaign=Multidiffusion&utm_medium=local&utm_content=PSG&origin=GMB
Note Google : 4/5 (648 avis)
Google Maps : https://maps.google.com/?cid=13389522622888652245&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d22d$, true, 43.5322628, 1.3976179, $d22a$17 Bd de l'Europe$d22a$, $d22c$Portet-sur-Garonne$d22c$, $d22p$31120$d22p$, $d22g$ChIJe_zxeKK5rhIR1a1VgeIj0bk$d22g$, 4.0, 648, $d22s$Vaisselle$d22s$),
  ($d23n$Jumpy's Party Locations & Prestations$d23n$, $d23d$Location de tentes et structures à Seysses.
Téléphone : 06 64 42 56 32
Site web : https://www.jumpyspartyjeugonfable.com/
Note Google : 4.5/5 (28 avis)
Google Maps : https://maps.google.com/?cid=17143203139263534882&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d23d$, true, 43.4917489, 1.3154701, $d23a$Zac Segla$d23a$, $d23c$Seysses$d23c$, $d23p$31600$d23p$, $d23g$ChIJ5WjA4lijrhIRIhcqNG3k6O0$d23g$, 4.5, 28, $d23s$Tentes & structures$d23s$),
  ($d24n$KRD Audiovisuel$d24n$, $d24d$Location de tentes et structures à Montrabé.
Téléphone : 05 82 95 02 56
Site web : https://www.krd-audiovisuel.fr/
Note Google : 4.9/5 (82 avis)
Google Maps : https://maps.google.com/?cid=15626722254261330398&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d24d$, true, 43.645119199999996, 1.5140837999999999, $d24a$2 Rue de l'Europe$d24a$, $d24c$Montrabé$d24c$, $d24p$31850$d24p$, $d24g$ChIJB0hP7AqWrhIR3iHwqBhF3dg$d24g$, 4.9, 82, $d24s$Tentes & structures$d24s$),
  ($d25n$L'ESPACE 111$d25n$, $d25d$Location de tentes et structures à Toulouse.
Note Google : 4.3/5 (21 avis)
Google Maps : https://maps.google.com/?cid=1749708244379717202&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d25d$, true, 43.579087699999995, 1.4055887, $d25a$111 Rue Nicolas Louis Vauquelin$d25a$, $d25c$Toulouse$d25c$, $d25p$31100$d25p$, $d25g$ChIJb3rH-aa7rhIRUk7TvmA2SBg$d25g$, 4.3, 21, $d25s$Tentes & structures$d25s$),
  ($d26n$La Vaisselle de Léontine$d26n$, $d26d$Location de vaisselle événementielle à Toulouse.
Téléphone : 07 69 19 39 58
Site web : http://www.lavaisselledeleontine.com/
Note Google : 2.3/5 (3 avis)
Google Maps : https://maps.google.com/?cid=8836138749024523275&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d26d$, true, 43.6087201, 1.4514173, $d26a$10 Rue de Belfort$d26a$, $d26c$Toulouse$d26c$, $d26p$31000$d26p$, $d26g$ChIJVYjmjEa9rhIRC9SrWWBFoHo$d26g$, 2.3, 3, $d26s$Vaisselle$d26s$),
  ($d27n$Laguiole Galerie Toulouse | Boutique Forge de Laguiole$d27n$, $d27d$Location de vaisselle événementielle à Toulouse.
Téléphone : 05 61 23 51 37
Site web : http://www.forge-de-laguiole.com/
Note Google : 4.6/5 (34 avis)
Google Maps : https://maps.google.com/?cid=13411632214277947618&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d27d$, true, 43.59997430000001, 1.4486282, $d27a$4 Rue Boulbonne$d27a$, $d27c$Toulouse$d27c$, $d27p$31000$d27p$, $d27g$ChIJ0xBV8py8rhIR4gA55nCwH7o$d27g$, 4.6, 34, $d27s$Vaisselle$d27s$),
  ($d28n$Lahille SAS$d28n$, $d28d$Location de tentes et structures à Saint-Jean.
Téléphone : 05 61 24 10 79
Site web : https://www.lahille.com/
Note Google : 4.7/5 (93 avis)
Google Maps : https://maps.google.com/?cid=12140024623339629582&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d28d$, true, 43.6528632, 1.518864, $d28a$10 Rue Jean Monnet$d28a$, $d28c$Saint-Jean$d28c$, $d28p$31240$d28p$, $d28g$ChIJERJeMJyirhIRDmynBhMIeqg$d28g$, 4.7, 93, $d28s$Tentes & structures$d28s$),
  ($d29n$Le Labo Ephémère$d29n$, $d29d$Location de tentes et structures à Toulouse.
Téléphone : 06 66 33 09 01
Site web : http://www.lelabo-ephemere.com/
Note Google : 5/5 (68 avis)
Google Maps : https://maps.google.com/?cid=15786890460739778871&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d29d$, true, 43.6029055, 1.4447591, $d29a$1 Pl. Roger Salengro$d29a$, $d29c$Toulouse$d29c$, $d29p$31000$d29p$, $d29g$ChIJOSitgpy8rhIRN7llRDtNFts$d29g$, 5.0, 68, $d29s$Tentes & structures$d29s$),
  ($d30n$Le Mur Interactif Occitanie$d30n$, $d30d$Location de tentes et structures à Toulouse.
Téléphone : 06 12 09 48 43
Site web : https://lemurinteractifoccitanie.com/
Note Google : 5/5 (28 avis)
Google Maps : https://maps.google.com/?cid=13648246430271808143&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d30d$, true, 43.6111205, 1.4399113, $d30a$19 Bd d'Arcole$d30a$, $d30c$Toulouse$d30c$, $d30p$31000$d30p$, $d30g$ChIJSWXb1h5Ax6sRjyJYG9FPaL0$d30g$, 5.0, 28, $d30s$Tentes & structures$d30s$),
  ($d31n$Les Salons d'Albert : location Séminaire, Popup Store, Expositions au centre ville de Toulouse$d31n$, $d31d$Location de tentes et structures à Toulouse.
Téléphone : 05 61 21 17 91
Site web : https://www.hotel-albert1.com/pop-up-store/
Note Google : 4.9/5 (31 avis)
Google Maps : https://maps.google.com/?cid=5775861618941220085&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d31d$, true, 43.605769599999995, 1.4448343, $d31a$5 Rue John-Fitzgerald Kennedy$d31a$, $d31c$Toulouse$d31c$, $d31p$31000$d31p$, $d31g$ChIJHY-LQJ68rhIR9dTNZIr7J1A$d31g$, 4.9, 31, $d31s$Tentes & structures$d31s$),
  ($d32n$Lign'E$d32n$, $d32d$Location de mobilier événementiel à Toulouse.
Téléphone : 05 62 75 99 30
Site web : https://lign-e.com/
Note Google : 4.4/5 (24 avis)
Google Maps : https://maps.google.com/?cid=13863063624266482518&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d32d$, true, 43.629253999999996, 1.409481, $d32a$2 allée Charles Gandia$d32a$, $d32c$Toulouse$d32c$, $d32p$31200$d32p$, $d32g$ChIJSTNRq8mkrhIRVgMLp-p-Y8A$d32g$, 4.4, 24, $d32s$Mobilier$d32s$),
  ($d33n$Loc Events 31$d33n$, $d33d$Location de mobilier événementiel à Le Fauga.
Téléphone : 06 42 85 42 18
Site web : https://locevents31.fr/
Note Google : 4.9/5 (30 avis)
Google Maps : https://maps.google.com/?cid=17796124310935633282&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d33d$, true, 43.3989889, 1.2856992999999999, $d33a$18 Chem. de Cuqs$d33a$, $d33c$Le Fauga$d33c$, $d33p$31410$d33p$, $d33g$ChIJbRUMkdDNrhIRgv0C3MWI-PY$d33g$, 4.9, 30, $d33s$Mobilier$d33s$),
  ($d34n$Loc'housses - Location de matériel de réception - mobilier - Vaisselle$d34n$, $d34d$Location de vaisselle événementielle à Aucamville.
Téléphone : 05 82 95 74 35
Site web : https://www.loc-housses.com/
Note Google : 4.9/5 (121 avis)
Google Maps : https://maps.google.com/?cid=6354733101696988170&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d34d$, true, 43.674322499999995, 1.4200597, $d34a$3 Bis Imp. Muratet$d34a$, $d34c$Aucamville$d34c$, $d34p$31140$d34p$, $d34g$ChIJjb6jjyWmrhIRCrQQURaMMFg$d34g$, 4.9, 121, $d34s$Vaisselle$d34s$),
  ($d35n$Loc2lux Events - Location Matériels pour évènements ( Mariage, Baby shower, Fêtes privés... )$d35n$, $d35d$Location de tables et chaises à Cugnaux.
Téléphone : 09 70 70 85 45
Site web : http://www.loc2lux.fr/
Note Google : 5/5 (202 avis)
Google Maps : https://maps.google.com/?cid=392456138578651466&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d35d$, true, 43.5363318, 1.3610045, $d35a$4bis Rue Alfred Sauvy$d35a$, $d35c$Cugnaux$d35c$, $d35p$31270$d35p$, $d35g$ChIJ2WPAH7y5rhIRSunmWcdIcgU$d35g$, 5.0, 202, $d35s$Tables & chaises$d35s$),
  ($d36n$Location Salle Toulouse - La péniche Saint-Louis$d36n$, $d36d$Location de tentes et structures à Toulouse.
Téléphone : 07 61 92 39 57
Site web : https://peniche-saint-louis.fr/
Note Google : 4.4/5 (121 avis)
Google Maps : https://maps.google.com/?cid=16771155122751893834&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d36d$, true, 43.594414799999996, 1.457247, $d36a$35 Bd Griffoul Dorval$d36a$, $d36c$Toulouse$d36c$, $d36p$31400$d36p$, $d36g$ChIJg6H1MGC8rhIRSnGZDLocv-g$d36g$, 4.4, 121, $d36s$Tentes & structures$d36s$),
  ($d37n$MYCOMM$d37n$, $d37d$Location de tentes et structures à Toulouse.
Téléphone : 05 36 09 06 90
Site web : https://www.mycomm.fr/
Note Google : 4.3/5 (21 avis)
Google Maps : https://maps.google.com/?cid=16613033395793725406&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d37d$, true, 43.651944, 1.4388953000000002, $d37a$Sporting Village, 272 Rte de Launaguet$d37a$, $d37c$Toulouse$d37c$, $d37p$31200$d37p$, $d37g$ChIJEX_TFta9rhIR3of8ldpZjeY$d37g$, 4.3, 21, $d37s$Tentes & structures$d37s$),
  ($d38n$Margotte Vintage$d38n$, $d38d$Location de mobilier événementiel à Montgiscard.
Téléphone : 07 50 30 16 27
Site web : http://margotte-vintage.fr/
Note Google : 5/5 (84 avis)
Google Maps : https://maps.google.com/?cid=11800724786568835668&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d38d$, true, 43.4532636, 1.5805132, $d38a$1 Chem. Delmont$d38a$, $d38c$Montgiscard$d38c$, $d38p$31450$d38p$, $d38g$ChIJf9NDzwZcQ2YRVDKVo6uYxKM$d38g$, 5.0, 84, $d38s$Mobilier$d38s$),
  ($d39n$Marthe et Maurice$d39n$, $d39d$Location de vaisselle événementielle à Beaumont-sur-Lèze.
Téléphone : 06 84 20 99 08
Site web : http://marthe-et-maurice.fr/
Note Google : 5/5 (24 avis)
Google Maps : https://maps.google.com/?cid=7003907959076887880&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d39d$, true, 43.375672, 1.3335622, $d39a$274 Garouste$d39a$, $d39c$Beaumont-sur-Lèze$d39c$, $d39p$31870$d39p$, $d39g$ChIJ4WcOBNsCgIQRSB1PNC7hMmE$d39g$, 5.0, 24, $d39s$Vaisselle$d39s$),
  ($d40n$Meeting Lab$d40n$, $d40d$Location de tentes et structures à Toulouse.
Téléphone : 05 34 25 33 00
Site web : http://www.meetinglab-europa.com/
Note Google : 4.8/5 (190 avis)
Google Maps : https://maps.google.com/?cid=17739177409258066208&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d40d$, true, 43.603321, 1.444356, $d40a$5 Rue Saint-Pantaléon$d40a$, $d40c$Toulouse$d40c$, $d40p$31000$d40p$, $d40g$ChIJVRBLk528rhIRIBF2Ft43LvY$d40g$, 4.8, 190, $d40s$Tentes & structures$d40s$),
  ($d41n$Midica$d41n$, $d41d$Location de vaisselle événementielle à Toulouse.
Téléphone : 05 61 14 82 82
Site web : https://www.midica.fr/
Note Google : 4.1/5 (3781 avis)
Google Maps : https://maps.google.com/?cid=4964318236176163890&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d41d$, true, 43.6002033, 1.4449967, $d41a$13 Pl. Etienne Esquirol$d41a$, $d41c$Toulouse$d41c$, $d41p$31000$d41p$, $d41g$ChIJWYQLR528rhIRMiRGOyLN5EQ$d41g$, 4.1, 3781, $d41s$Vaisselle$d41s$),
  ($d42n$Options Toulouse - Location de matériel événementiel$d42n$, $d42d$Location de tables et chaises à Toulouse.
Téléphone : 05 34 25 11 00
Site web : https://www.options.fr/options-toulouse?utm_campaign=fiche_gmb_roulouse&utm_medium=organic&utm_source=google_business_profil
Note Google : 4.6/5 (150 avis)
Google Maps : https://maps.google.com/?cid=18102982770450422569&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d42d$, true, 43.6026696, 1.358722, $d42a$6 Rue Gaye Marie zac de$d42a$, $d42c$Toulouse$d42c$, $d42p$31300$d42p$, $d42g$ChIJD49fBXaYrhIRKdu2f-q2Ovs$d42g$, 4.6, 150, $d42s$Tables & chaises$d42s$),
  ($d43n$Pops Location - Toulouse$d43n$, $d43d$Location de mobilier événementiel à Toulouse.
Téléphone : 01 34 92 20 00
Site web : https://www.pops-location.fr/pops-toulouse
Note Google : 5/5 (1 avis)
Google Maps : https://maps.google.com/?cid=13511444006789224190&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d43d$, true, 43.6026696, 1.358722, $d43a$6 Rue Gaye Marie zac de$d43a$, $d43c$Toulouse$d43c$, $d43p$31300$d43p$, $d43g$ChIJSaLGKpqxrhIR_pZAy7xKgrs$d43g$, 5.0, 1, $d43s$Mobilier$d43s$),
  ($d44n$Psb Lounge$d44n$, $d44d$Location de mobilier événementiel à Verdun-sur-Garonne.
Téléphone : 05 61 50 80 07
Site web : https://www.psb-lounge.fr/
Note Google : 5/5 (100 avis)
Google Maps : https://maps.google.com/?cid=13199251655021109432&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d44d$, true, 43.822493, 1.2443074, $d44a$ZI la FAOUQUETTE, 45 rue Hélène boucher$d44a$, $d44c$Verdun-sur-Garonne$d44c$, $d44p$82600$d44p$, $d44g$ChIJJREC7DOYrhIRuCCFlnIpLbc$d44g$, 5.0, 100, $d44s$Mobilier$d44s$),
  ($d45n$Rosea Plena Events$d45n$, $d45d$Location de tentes et structures à Toulouse.
Téléphone : 06 46 21 56 05
Site web : http://www.roseaplena-events.fr/
Note Google : 5/5 (20 avis)
Google Maps : https://maps.google.com/?cid=2151285044530341099&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d45d$, true, 43.5794522, 1.3933556, $d45a$216 Rte de Saint-Simon$d45a$, $d45c$Toulouse$d45c$, $d45p$31100$d45p$, $d45g$ChIJTSgnxF2xrhIR62TXmVnm2h0$d45g$, 5.0, 20, $d45s$Tentes & structures$d45s$),
  ($d46n$SLR Location$d46n$, $d46d$Location de mobilier événementiel à Seysses.
Téléphone : 05 62 20 05 85
Site web : https://slrlocation.fr/
Note Google : 4.3/5 (55 avis)
Google Maps : https://maps.google.com/?cid=11056195912031579344&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d46d$, true, 43.4911899, 1.3142342999999999, $d46a$ZA LA PICHE, 1 Pl. Lucien Cassagne$d46a$, $d46c$Seysses$d46c$, $d46p$31600$d46p$, $d46g$ChIJu53VLRi2rhIR0KzEj5p_b5k$d46g$, 4.3, 55, $d46s$Mobilier$d46s$),
  ($d47n$Saint Elix Location - Matériel événementiel$d47n$, $d47d$Location de mobilier événementiel à Saint-Élix-le-Château.
Téléphone : 06 73 58 35 92
Site web : http://www.st-elix-location.com/
Note Google : 4.9/5 (107 avis)
Google Maps : https://maps.google.com/?cid=9621816325605244056&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d47d$, true, 43.2806746, 1.1362173, $d47a$Le Communal$d47a$, $d47c$Saint-Élix-le-Château$d47c$, $d47p$31430$d47p$, $d47g$ChIJe5rmGSosqRIRmDzBNfiOh4U$d47g$, 4.9, 107, $d47s$Mobilier$d47s$),
  ($d48n$Sicre Evènements$d48n$, $d48d$Location de mobilier événementiel à Toulouse.
Téléphone : 05 63 02 02 77
Site web : http://www.sicre-evenements.com/
Google Maps : https://maps.google.com/?cid=14232654298681967462&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d48d$, true, 43.5793666, 1.4689994, $d48a$109 Av. de Lespinet Bât A 1 Er Ét$d48a$, $d48c$Toulouse$d48c$, $d48p$31400$d48p$, $d48g$ChIJJ0HJuES8rhIRZgPgQ62LhMU$d48g$, 0, 0, $d48s$Mobilier$d48s$),
  ($d49n$Social Events (Photobooth - Vidéobooth 360° - Karaoké - Réalité Virtuelle - Social Wall - Totem intéractifs)$d49n$, $d49d$Location de tentes et structures à Toulouse.
Téléphone : 06 82 34 56 16
Site web : https://www.social-events.fr/
Note Google : 5/5 (101 avis)
Google Maps : https://maps.google.com/?cid=10432302518615698188&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d49d$, true, 43.6311335, 1.4324177, $d49a$78 Av. des États-Unis$d49a$, $d49c$Toulouse$d49c$, $d49p$31200$d49p$, $d49g$ChIJUb0CX7KkrhIRDGuAM977xpA$d49g$, 5.0, 101, $d49s$Tentes & structures$d49s$),
  ($d50n$Solution Mobilier$d50n$, $d50d$Location de mobilier événementiel à Le Fauga.
Téléphone : 05 34 49 19 01
Site web : https://www.solution-mobilier.fr/
Note Google : 3.7/5 (18 avis)
Google Maps : https://maps.google.com/?cid=9722296520798286894&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d50d$, true, 43.39444170000001, 1.2892010999999999, $d50a$25 Rue du Luxembourg$d50a$, $d50c$Le Fauga$d50c$, $d50p$31410$d50p$, $d50g$ChIJoyR9XazNrhIRLrQyuyyJ7IY$d50g$, 3.7, 18, $d50s$Mobilier$d50s$),
  ($d51n$Souchon Reception$d51n$, $d51d$Location de tables et chaises à Toulouse.
Téléphone : 05 34 27 04 03
Site web : http://www.souchon-reception.com/
Note Google : 3.8/5 (38 avis)
Google Maps : https://maps.google.com/?cid=3047978422266029840&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d51d$, true, 43.5439438, 1.4049441, $d51a$19 r Gaston Evrard Ctre De Gros Larrieu$d51a$, $d51c$Toulouse$d51c$, $d51p$31100$d51p$, $d51g$ChIJT9UNzIK5rhIREOc45jmYTCo$d51g$, 3.8, 38, $d51s$Tables & chaises$d51s$),
  ($d52n$Structura - Location de chapiteaux, barnums, tentes, mobilier, vaisselle, nappage, parquet$d52n$, $d52d$Location de tentes et structures à Aucamville.
Téléphone : 05 62 75 18 62
Site web : https://www.structura.fr/
Note Google : 4.6/5 (44 avis)
Google Maps : https://maps.google.com/?cid=5610485186213138232&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d52d$, true, 43.6761925, 1.4089268, $d52a$77 bis Rte de Paris$d52a$, $d52c$Aucamville$d52c$, $d52p$31140$d52p$, $d52g$ChIJkYzYssGlrhIROE_THY1y3E0$d52g$, 4.6, 44, $d52s$Tentes & structures$d52s$),
  ($d53n$TOAL.fr$d53n$, $d53d$Location de mobilier événementiel à Toulouse.
Téléphone : 07 69 46 87 68
Site web : https://toal.fr/
Note Google : 5/5 (2 avis)
Google Maps : https://maps.google.com/?cid=13004666000858314767&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d53d$, true, 43.6260857, 1.4592587, $d53a$160 Rue du Faubourg Bonnefoy$d53a$, $d53c$Toulouse$d53c$, $d53p$31500$d53p$, $d53g$ChIJN37bb2W9rhIRD3jCe9PaebQ$d53g$, 5.0, 2, $d53s$Mobilier$d53s$),
  ($d54n$Tentes événementielles - Organic Concept Toulouse$d54n$, $d54d$Location de tentes et structures à Villeneuve-Tolosane.
Téléphone : 05 61 31 61 59
Site web : http://organic-concept-toulouse.fr/
Note Google : 5/5 (42 avis)
Google Maps : https://maps.google.com/?cid=11972139805418280687&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d54d$, true, 43.5251618, 1.3740933, $d54a$115 Rte de Portet$d54a$, $d54c$Villeneuve-Tolosane$d54c$, $d54p$31270$d54p$, $d54g$ChIJsWw-e9O7rhIR71ZFz7iVJaY$d54g$, 5.0, 42, $d54s$Tentes & structures$d54s$),
  ($d55n$Thouron SARL - Location de chapiteaux et tentes$d55n$, $d55d$Location de tentes et structures à L'Union.
Téléphone : 05 65 30 33 03
Site web : https://www.thouron.fr/
Note Google : 4.9/5 (22 avis)
Google Maps : https://maps.google.com/?cid=12693308691166064371&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d55d$, true, 43.6621971, 1.4611234000000002, $d55a$COLORADO PARK, 4 Imp. de l'Hers$d55a$, $d55c$L'Union$d55c$, $d55p$31240$d55p$, $d55g$ChIJjQbwgaKirhIR8-5UqQCxJ7A$d55g$, 4.9, 22, $d55s$Tentes & structures$d55s$),
  ($d56n$Toul'events$d56n$, $d56d$Location de tentes et structures à Toulouse.
Téléphone : 09 80 83 96 89
Site web : https://toulevents.com/
Note Google : 4.7/5 (33 avis)
Google Maps : https://maps.google.com/?cid=12513516268678019019&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d56d$, true, 43.598851599999996, 1.4539449, $d56a$27 Rue des Potiers$d56a$, $d56c$Toulouse$d56c$, $d56p$31000$d56p$, $d56g$ChIJnWBWvvq8rhIRy_efNb_wqK0$d56g$, 4.7, 33, $d56s$Tentes & structures$d56s$),
  ($d57n$Toul'événement$d57n$, $d57d$Location de tables et chaises à Toulouse.
Téléphone : 05 82 95 65 65
Site web : https://www.toulevenement.fr/
Note Google : 4.5/5 (306 avis)
Google Maps : https://maps.google.com/?cid=17063197772961868751&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d57d$, true, 43.6014713, 1.3894567, $d57a$17 Rue du Général Lionel de Marmier$d57a$, $d57c$Toulouse$d57c$, $d57p$31300$d57p$, $d57g$ChIJxZvS0Am7rhIRz-ugRfinzOw$d57g$, 4.5, 306, $d57s$Tables & chaises$d57s$),
  ($d58n$Univers Events$d58n$, $d58d$Location de mobilier événementiel à Aucamville.
Téléphone : 05 61 13 91 70
Site web : https://www.chalet-pliable.fr/
Note Google : 5/5 (9 avis)
Google Maps : https://maps.google.com/?cid=11955681205865510801&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d58d$, true, 43.676522299999995, 1.4104416, $d58a$3 Imp. du Héron Cendré$d58a$, $d58c$Aucamville$d58c$, $d58p$31140$d58p$, $d58g$ChIJ0cMWCYmkrhIRkXdte7Yc66U$d58g$, 5.0, 9, $d58s$Mobilier$d58s$),
  ($d59n$VR Show - Agence Réalité virtuelle$d59n$, $d59d$Location de tentes et structures à Toulouse.
Téléphone : 06 07 24 01 05
Site web : http://www.vr-show.fr/
Note Google : 4.8/5 (42 avis)
Google Maps : https://maps.google.com/?cid=13023814667326170229&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d59d$, true, 43.6322083, 1.4321203999999998, $d59a$94 Av. des États-Unis$d59a$, $d59c$Toulouse$d59c$, $d59p$31200$d59p$, $d59g$ChIJQYV9aby8rhIRdaR_0m_ivbQ$d59g$, 4.8, 42, $d59s$Tentes & structures$d59s$),
  ($d60n$la fête parfaite$d60n$, $d60d$Location de tentes et structures à Seysses.
Téléphone : 06 73 62 49 62
Site web : https://www.lafeteparfaite.fr/
Note Google : 5/5 (89 avis)
Google Maps : https://maps.google.com/?cid=9036888426074936270&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d60d$, true, 43.483652, 1.2969058999999998, $d60a$1570 Chem. de Gay$d60a$, $d60c$Seysses$d60c$, $d60p$31600$d60p$, $d60g$ChIJvdtLaXm3rhIRzhMJ3yR6aX0$d60g$, 5.0, 89, $d60s$Tentes & structures$d60s$),
  ($d61n$les chaises roses Toulouse - Location de mobilier et vaisselle$d61n$, $d61d$Location de vaisselle événementielle à Drémil-Lafage.
Téléphone : 05 61 24 54 96
Site web : https://www.leschaisesroses.fr/
Note Google : 4.4/5 (128 avis)
Google Maps : https://maps.google.com/?cid=5468485260058458553&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d61d$, true, 43.595132299999996, 1.5894164, $d61a$13 Av. de la Mouyssaguese$d61a$, $d61c$Drémil-Lafage$d61c$, $d61p$31280$d61p$, $d61g$ChIJ2xtEidKQrhIRuXk-6V7240s$d61g$, 4.4, 128, $d61s$Vaisselle$d61s$),
  ($d62n$tls31$d62n$, $d62d$Location de tables et chaises à Toulouse.
Téléphone : 06 25 79 20 48
Site web : https://tls31.fr/
Note Google : 4.8/5 (47 avis)
Google Maps : https://maps.google.com/?cid=784806160759312562&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d62d$, true, 43.5821466, 1.4738757999999998, $d62a$Parking sur la droite du bâtiment, 184 Av. Antoine de Saint-Exupéry$d62a$, $d62c$Toulouse$d62c$, $d62p$31400$d62p$, $d62g$ChIJt4ca-z6lrhIRstCYjQsx5Ao$d62g$, 4.8, 47, $d62s$Tables & chaises$d62s$)
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
    where google_place_id in ($d0id$ChIJy1nt0KaxrhIRkqHrXTs-Nv4$d0id$, $d1id$ChIJz50K62K7rhIRtqYQmbDVnAc$d1id$, $d2id$ChIJ4S6l1saWrhIR7w-FSUjVAFE$d2id$, $d3id$ChIJ94wArj6srhIRtYP4c_Ej7bc$d3id$, $d4id$ChIJX37AmAu7rhIRueXalRJM39Y$d4id$, $d5id$ChIJ9c-6AAy7rhIReMpJ1c4WsPI$d5id$, $d6id$ChIJD7D1nx7vrhIRuvyZrz5MCiE$d6id$, $d7id$ChIJQbbGp127rhIRMIC9e6COoPQ$d7id$, $d8id$ChIJUxoIzhSkrhIRnr_hTFQSbIw$d8id$, $d9id$ChIJd-kvDiy9rhIR6WNti5Hvb0o$d9id$, $d10id$ChIJ69YqM3zLrhIRbX3lCJGnC74$d10id$, $d11id$ChIJq6paBZyirhIRZtD9mukMRos$d11id$, $d12id$ChIJ8w45pc-9rhIRHRWvVurwBGg$d12id$, $d13id$ChIJZdWdcsGlrhIRYTlo2nju-Bo$d13id$, $d14id$ChIJE3BRVDP9qxIRqNpAZMiFAX0$d14id$, $d15id$ChIJXxrw_CmjrhIR4hbIf_oxgwc$d15id$, $d16id$ChIJqxv4ktuirhIR-SkFLWrZLkw$d16id$, $d17id$ChIJQ-ccPnCirhIRdYjA29G9By4$d17id$, $d18id$ChIJK4aQX1GkrhIRlPL82G1ZhwY$d18id$, $d19id$ChIJkTx2hvrtrhIR77SAxAieTas$d19id$, $d20id$ChIJR7WAI4i9rhIRBOKvMXpzNC0$d20id$, $d21id$ChIJXYYS2aWnrhIRMz0SNGEJzDs$d21id$, $d22id$ChIJe_zxeKK5rhIR1a1VgeIj0bk$d22id$, $d23id$ChIJ5WjA4lijrhIRIhcqNG3k6O0$d23id$, $d24id$ChIJB0hP7AqWrhIR3iHwqBhF3dg$d24id$, $d25id$ChIJb3rH-aa7rhIRUk7TvmA2SBg$d25id$, $d26id$ChIJVYjmjEa9rhIRC9SrWWBFoHo$d26id$, $d27id$ChIJ0xBV8py8rhIR4gA55nCwH7o$d27id$, $d28id$ChIJERJeMJyirhIRDmynBhMIeqg$d28id$, $d29id$ChIJOSitgpy8rhIRN7llRDtNFts$d29id$, $d30id$ChIJSWXb1h5Ax6sRjyJYG9FPaL0$d30id$, $d31id$ChIJHY-LQJ68rhIR9dTNZIr7J1A$d31id$, $d32id$ChIJSTNRq8mkrhIRVgMLp-p-Y8A$d32id$, $d33id$ChIJbRUMkdDNrhIRgv0C3MWI-PY$d33id$, $d34id$ChIJjb6jjyWmrhIRCrQQURaMMFg$d34id$, $d35id$ChIJ2WPAH7y5rhIRSunmWcdIcgU$d35id$, $d36id$ChIJg6H1MGC8rhIRSnGZDLocv-g$d36id$, $d37id$ChIJEX_TFta9rhIR3of8ldpZjeY$d37id$, $d38id$ChIJf9NDzwZcQ2YRVDKVo6uYxKM$d38id$, $d39id$ChIJ4WcOBNsCgIQRSB1PNC7hMmE$d39id$, $d40id$ChIJVRBLk528rhIRIBF2Ft43LvY$d40id$, $d41id$ChIJWYQLR528rhIRMiRGOyLN5EQ$d41id$, $d42id$ChIJD49fBXaYrhIRKdu2f-q2Ovs$d42id$, $d43id$ChIJSaLGKpqxrhIR_pZAy7xKgrs$d43id$, $d44id$ChIJJREC7DOYrhIRuCCFlnIpLbc$d44id$, $d45id$ChIJTSgnxF2xrhIR62TXmVnm2h0$d45id$, $d46id$ChIJu53VLRi2rhIR0KzEj5p_b5k$d46id$, $d47id$ChIJe5rmGSosqRIRmDzBNfiOh4U$d47id$, $d48id$ChIJJ0HJuES8rhIRZgPgQ62LhMU$d48id$, $d49id$ChIJUb0CX7KkrhIRDGuAM977xpA$d49id$, $d50id$ChIJoyR9XazNrhIRLrQyuyyJ7IY$d50id$, $d51id$ChIJT9UNzIK5rhIREOc45jmYTCo$d51id$, $d52id$ChIJkYzYssGlrhIROE_THY1y3E0$d52id$, $d53id$ChIJN37bb2W9rhIRD3jCe9PaebQ$d53id$, $d54id$ChIJsWw-e9O7rhIR71ZFz7iVJaY$d54id$, $d55id$ChIJjQbwgaKirhIR8-5UqQCxJ7A$d55id$, $d56id$ChIJnWBWvvq8rhIRy_efNb_wqK0$d56id$, $d57id$ChIJxZvS0Am7rhIRz-ugRfinzOw$d57id$, $d58id$ChIJ0cMWCYmkrhIRkXdte7Yc66U$d58id$, $d59id$ChIJQYV9aby8rhIRdaR_0m_ivbQ$d59id$, $d60id$ChIJvdtLaXm3rhIRzhMJ3yR6aX0$d60id$, $d61id$ChIJ2xtEidKQrhIRuXk-6V7240s$d61id$, $d62id$ChIJt4ca-z6lrhIRstCYjQsx5Ao$d62id$)
      and latitude is not null
      and longitude is not null
      and location is null;
  elsif location_type like 'geometry%' then
    update public.craftsmans
    set location = ST_SetSRID(ST_MakePoint(longitude, latitude), 4326)
    where google_place_id in ($d0id$ChIJy1nt0KaxrhIRkqHrXTs-Nv4$d0id$, $d1id$ChIJz50K62K7rhIRtqYQmbDVnAc$d1id$, $d2id$ChIJ4S6l1saWrhIR7w-FSUjVAFE$d2id$, $d3id$ChIJ94wArj6srhIRtYP4c_Ej7bc$d3id$, $d4id$ChIJX37AmAu7rhIRueXalRJM39Y$d4id$, $d5id$ChIJ9c-6AAy7rhIReMpJ1c4WsPI$d5id$, $d6id$ChIJD7D1nx7vrhIRuvyZrz5MCiE$d6id$, $d7id$ChIJQbbGp127rhIRMIC9e6COoPQ$d7id$, $d8id$ChIJUxoIzhSkrhIRnr_hTFQSbIw$d8id$, $d9id$ChIJd-kvDiy9rhIR6WNti5Hvb0o$d9id$, $d10id$ChIJ69YqM3zLrhIRbX3lCJGnC74$d10id$, $d11id$ChIJq6paBZyirhIRZtD9mukMRos$d11id$, $d12id$ChIJ8w45pc-9rhIRHRWvVurwBGg$d12id$, $d13id$ChIJZdWdcsGlrhIRYTlo2nju-Bo$d13id$, $d14id$ChIJE3BRVDP9qxIRqNpAZMiFAX0$d14id$, $d15id$ChIJXxrw_CmjrhIR4hbIf_oxgwc$d15id$, $d16id$ChIJqxv4ktuirhIR-SkFLWrZLkw$d16id$, $d17id$ChIJQ-ccPnCirhIRdYjA29G9By4$d17id$, $d18id$ChIJK4aQX1GkrhIRlPL82G1ZhwY$d18id$, $d19id$ChIJkTx2hvrtrhIR77SAxAieTas$d19id$, $d20id$ChIJR7WAI4i9rhIRBOKvMXpzNC0$d20id$, $d21id$ChIJXYYS2aWnrhIRMz0SNGEJzDs$d21id$, $d22id$ChIJe_zxeKK5rhIR1a1VgeIj0bk$d22id$, $d23id$ChIJ5WjA4lijrhIRIhcqNG3k6O0$d23id$, $d24id$ChIJB0hP7AqWrhIR3iHwqBhF3dg$d24id$, $d25id$ChIJb3rH-aa7rhIRUk7TvmA2SBg$d25id$, $d26id$ChIJVYjmjEa9rhIRC9SrWWBFoHo$d26id$, $d27id$ChIJ0xBV8py8rhIR4gA55nCwH7o$d27id$, $d28id$ChIJERJeMJyirhIRDmynBhMIeqg$d28id$, $d29id$ChIJOSitgpy8rhIRN7llRDtNFts$d29id$, $d30id$ChIJSWXb1h5Ax6sRjyJYG9FPaL0$d30id$, $d31id$ChIJHY-LQJ68rhIR9dTNZIr7J1A$d31id$, $d32id$ChIJSTNRq8mkrhIRVgMLp-p-Y8A$d32id$, $d33id$ChIJbRUMkdDNrhIRgv0C3MWI-PY$d33id$, $d34id$ChIJjb6jjyWmrhIRCrQQURaMMFg$d34id$, $d35id$ChIJ2WPAH7y5rhIRSunmWcdIcgU$d35id$, $d36id$ChIJg6H1MGC8rhIRSnGZDLocv-g$d36id$, $d37id$ChIJEX_TFta9rhIR3of8ldpZjeY$d37id$, $d38id$ChIJf9NDzwZcQ2YRVDKVo6uYxKM$d38id$, $d39id$ChIJ4WcOBNsCgIQRSB1PNC7hMmE$d39id$, $d40id$ChIJVRBLk528rhIRIBF2Ft43LvY$d40id$, $d41id$ChIJWYQLR528rhIRMiRGOyLN5EQ$d41id$, $d42id$ChIJD49fBXaYrhIRKdu2f-q2Ovs$d42id$, $d43id$ChIJSaLGKpqxrhIR_pZAy7xKgrs$d43id$, $d44id$ChIJJREC7DOYrhIRuCCFlnIpLbc$d44id$, $d45id$ChIJTSgnxF2xrhIR62TXmVnm2h0$d45id$, $d46id$ChIJu53VLRi2rhIR0KzEj5p_b5k$d46id$, $d47id$ChIJe5rmGSosqRIRmDzBNfiOh4U$d47id$, $d48id$ChIJJ0HJuES8rhIRZgPgQ62LhMU$d48id$, $d49id$ChIJUb0CX7KkrhIRDGuAM977xpA$d49id$, $d50id$ChIJoyR9XazNrhIRLrQyuyyJ7IY$d50id$, $d51id$ChIJT9UNzIK5rhIREOc45jmYTCo$d51id$, $d52id$ChIJkYzYssGlrhIROE_THY1y3E0$d52id$, $d53id$ChIJN37bb2W9rhIRD3jCe9PaebQ$d53id$, $d54id$ChIJsWw-e9O7rhIR71ZFz7iVJaY$d54id$, $d55id$ChIJjQbwgaKirhIR8-5UqQCxJ7A$d55id$, $d56id$ChIJnWBWvvq8rhIRy_efNb_wqK0$d56id$, $d57id$ChIJxZvS0Am7rhIRz-ugRfinzOw$d57id$, $d58id$ChIJ0cMWCYmkrhIRkXdte7Yc66U$d58id$, $d59id$ChIJQYV9aby8rhIRdaR_0m_ivbQ$d59id$, $d60id$ChIJvdtLaXm3rhIRzhMJ3yR6aX0$d60id$, $d61id$ChIJ2xtEidKQrhIRuXk-6V7240s$d61id$, $d62id$ChIJt4ca-z6lrhIRstCYjQsx5Ao$d62id$)
      and latitude is not null
      and longitude is not null
      and location is null;
  end if;
end $$;
