-- Seed event DJs, bands, musicians, and singers around Toulouse.
-- Only these google_place_id values are linked to Musique & DJ subcategories.

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
  ($d0n$AGENCE LPC - TOULOUSE DJ$d0n$, $d0d$DJ à Launaguet.
Téléphone : 06 80 01 23 75
Site web : https://agencelpc.fr/
Note Google : 4.9/5 (309 avis)
Google Maps : https://maps.google.com/?cid=14374829293947870917&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d0d$, true, 43.6546129, 1.4535323999999998, $d0a$12 All. des Sablettes$d0a$, $d0c$Launaguet$d0c$, $d0p$31140$d0p$, $d0g$ChIJu5mGY2ilrhIRxV6k7BSnfcc$d0g$, 4.9, 309, $d0s$DJ$d0s$),
  ($d1n$ALOHA DISCO : DJ & Karaoke$d1n$, $d1d$DJ à Colomiers.
Téléphone : 06 89 68 14 73
Site web : https://www.facebook.com/share/1F2FibYTrd/?mibextid=wwXIfr
Note Google : 4.8/5 (19 avis)
Google Maps : https://maps.google.com/?cid=16424692205041720618&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d1d$, true, 43.5987516, 1.3263893, $d1a$14 All. des Calanques$d1a$, $d1c$Colomiers$d1c$, $d1p$31770$d1p$, $d1g$ChIJuXccIK2xrhIRKp2j6ok68OM$d1g$, 4.8, 19, $d1s$DJ$d1s$),
  ($d2n$ARTE GIPSY toulouse musique gitan$d2n$, $d2d$Musicien à Colomiers.
Téléphone : 06 50 39 39 93
Site web : http://www.artegipsy.fr/
Note Google : 5/5 (3 avis)
Google Maps : https://maps.google.com/?cid=11849290873388222210&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d2d$, true, 43.6083358, 1.3274228, $d2a$77 bis All. du Comminges$d2a$, $d2c$Colomiers$d2c$, $d2p$31770$d2p$, $d2g$ChIJSetty46UfgcRAkeV5EQjcaQ$d2g$, 5.0, 3, $d2s$Musicien$d2s$),
  ($d3n$Acoustic Color$d3n$, $d3d$Musicien à Toulouse.
Téléphone : 06 25 79 20 48
Site web : http://acoustic-color.com/
Note Google : 4.9/5 (19 avis)
Google Maps : https://maps.google.com/?cid=1078640958809459267&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d3d$, true, 43.5820976, 1.4738617999999999, $d3a$184 Av. Antoine de Saint-Exupéry$d3a$, $d3c$Toulouse$d3c$, $d3p$31400$d3p$, $d3g$ChIJCeX6qFWjrhIRQ0oGtjwa-A4$d3g$, 4.9, 19, $d3s$Musicien$d3s$),
  ($d4n$Amande & Miel | Groupe de Jazz | Toulouse$d4n$, $d4d$Groupe de musique à Toulouse.
Téléphone : 06 30 41 17 99
Site web : http://www.amandemielmusic.com/
Note Google : 5/5 (33 avis)
Google Maps : https://maps.google.com/?cid=211454091457242735&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d4d$, true, 43.61996620000001, 1.4354890999999999, $d4a$5 Rue du Caillou Gris$d4a$, $d4c$Toulouse$d4c$, $d4p$31200$d4p$, $d4g$ChIJtUnjaFC7rhIRb6acN2A87wI$d4g$, 5.0, 33, $d4s$Groupe de musique$d4s$),
  ($d5n$Aphrodite : Groupe de musique mariage$d5n$, $d5d$Groupe de musique à Toulouse.
Téléphone : 06 64 13 94 63
Site web : https://www.chanteusemariage.com/
Note Google : 5/5 (3 avis)
Google Maps : https://maps.google.com/?cid=12394223441949579860&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d5d$, true, 43.616422, 1.42963, $d5a$Av. Jean Dagnaux$d5a$, $d5c$Toulouse$d5c$, $d5p$31200$d5p$, $d5g$ChIJ59F41Lm7rhIRVFo5lI0gAaw$d5g$, 5.0, 3, $d5s$Groupe de musique$d5s$),
  ($d6n$CHOEUR LA DAURADE$d6n$, $d6d$Chanteur à Toulouse.
Site web : https://www.choeurladaurade.fr/
Google Maps : https://maps.google.com/?cid=5688261478062784192&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d6d$, true, 43.574763999999995, 1.4542150999999999, $d6a$4 Av. des Écoles Jules Julien$d6a$, $d6c$Toulouse$d6c$, $d6p$31400$d6p$, $d6g$ChIJL4GHRwC9rhIRwH54Na3D8E4$d6g$, 0, 0, $d6s$Chanteur$d6s$),
  ($d7n$Captain Star Band$d7n$, $d7d$Groupe de musique à Toulouse.
Téléphone : 06 17 19 47 87
Site web : https://www.captainstar.fr/
Note Google : 5/5 (9 avis)
Google Maps : https://maps.google.com/?cid=3408477750381735201&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d7d$, true, 43.570279899999996, 1.4518377, $d7a$13 Rue Louis Eydoux$d7a$, $d7c$Toulouse$d7c$, $d7p$31400$d7p$, $d7g$ChIJD6NL6ni9rhIRIW1TgHRYTS8$d7g$, 5.0, 9, $d7s$Groupe de musique$d7s$),
  ($d8n$Choeur Toulouse Garonne$d8n$, $d8d$Chanteur à Toulouse.
Téléphone : 06 21 28 02 91
Site web : http://www.choeurtoulousegaronne.fr/
Note Google : 4.7/5 (13 avis)
Google Maps : https://maps.google.com/?cid=9702045512656081472&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d8d$, true, 43.5990989, 1.4691037, $d8a$61 Av. Raymond Naves$d8a$, $d8c$Toulouse$d8c$, $d8p$31500$d8p$, $d8g$ChIJaVZ1H1y7rhIRQNKJeP2WpIY$d8g$, 4.7, 13, $d8s$Chanteur$d8s$),
  ($d9n$Chorale Choeur Tolosa$d9n$, $d9d$Chanteur à Toulouse.
Site web : http://choeur-tolosa.org/
Note Google : 5/5 (2 avis)
Google Maps : https://maps.google.com/?cid=17972392668076279121&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d9d$, true, 43.583349, 1.4755099999999999, $d9a$24 Rue Louis Blanc$d9a$, $d9c$Toulouse$d9c$, $d9p$31400$d9p$, $d9g$ChIJU0ZUF1G8rhIRUYWF6OjDavk$d9g$, 5.0, 2, $d9s$Chanteur$d9s$),
  ($d10n$Chorale Populaire de Toulouse$d10n$, $d10d$Chanteur à Toulouse.
Téléphone : 06 75 85 33 60
Site web : http://chorale-toulouse.org/
Note Google : 4.3/5 (3 avis)
Google Maps : https://maps.google.com/?cid=17147886911327896067&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d10d$, true, 43.58405260000001, 1.477711, $d10a$254 Av. Jean Rieux$d10a$, $d10c$Toulouse$d10c$, $d10p$31400$d10p$, $d10g$ChIJC87M_HS7rhIRAwJF3kqI-e0$d10g$, 4.3, 3, $d10s$Chanteur$d10s$),
  ($d11n$Chorale Uniisson Toulouse$d11n$, $d11d$Chanteur à Toulouse.
Site web : https://www.uniisson.com/
Note Google : 3.8/5 (6 avis)
Google Maps : https://maps.google.com/?cid=5264048781500409098&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d11d$, true, 43.5646352, 1.4074413, $d11a$8 Imp. André Marestan$d11a$, $d11c$Toulouse$d11c$, $d11p$31400$d11p$, $d11g$ChIJY-1jlTG9rhIRCuWoBXqoDUk$d11g$, 3.8, 6, $d11s$Chanteur$d11s$),
  ($d12n$DJ Dømi, expert en musiques pour évènements$d12n$, $d12d$DJ à Toulouse.
Téléphone : 06 51 93 99 11
Site web : https://d0mi.fr/
Note Google : 5/5 (34 avis)
Google Maps : https://maps.google.com/?cid=3903801735804244827&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d12d$, true, 43.5761739, 1.4795842, $d12a$72 Chem. Carrosse$d12a$, $d12c$Toulouse$d12c$, $d12p$31400$d12p$, $d12g$ChIJo7tM_fy9rhIRW1Mq2P4WLTY$d12g$, 5.0, 34, $d12s$DJ$d12s$),
  ($d13n$DJ EVEN$d13n$, $d13d$DJ à Toulouse.
Téléphone : 06 49 44 81 88
Site web : http://djeven.com/
Note Google : 5/5 (202 avis)
Google Maps : https://maps.google.com/?cid=9867887533146063450&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d13d$, true, 43.6112034, 1.4356655999999999, $d13a$5 Esp. Compans Caffarelli$d13a$, $d13c$Toulouse$d13c$, $d13p$31000$d13p$, $d13g$ChIJpw-RX_m9rhIRWkKt2G3H8Yg$d13g$, 5.0, 202, $d13s$DJ$d13s$),
  ($d14n$DJ GAR-L$d14n$, $d14d$DJ à Mons.
Téléphone : 06 50 51 12 65
Site web : https://djgar-l.over-blog.com/
Note Google : 5/5 (11 avis)
Google Maps : https://maps.google.com/?cid=15770214959190980732&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d14d$, true, 43.611559299999996, 1.5670940999999998, $d14a$Av. du Lauragais$d14a$, $d14c$Mons$d14c$, $d14p$31280$d14p$, $d14g$ChIJLdKcqQ2XrhIRfDghgvMO29o$d14g$, 5.0, 11, $d14s$DJ$d14s$),
  ($d15n$DJ JONATHAN$d15n$, $d15d$DJ à Toulouse.
Téléphone : 07 89 97 21 29
Site web : https://linkr.bio/jojo_31500
Note Google : 1/5 (1 avis)
Google Maps : https://maps.google.com/?cid=4847629474587078332&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d15d$, true, 43.6035599, 1.4356246, $d15a$Pl. Saint-Pierre$d15a$, $d15c$Toulouse$d15c$, $d15p$31000$d15p$, $d15g$ChIJ06uUY4G9rhIRvO55w1I9RkM$d15g$, 1.0, 1, $d15s$DJ$d15s$),
  ($d16n$DJ Madame T-Relo / DJ professionnelle à Toulouse / DJ Toulouse Animation Mariage Haute Garonne 31$d16n$, $d16d$DJ à Toulouse.
Téléphone : 06 82 32 11 47
Site web : https://www.dj-madame-t-relo.fr/
Note Google : 5/5 (62 avis)
Google Maps : https://maps.google.com/?cid=7453870252634393039&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d16d$, true, 43.6343195, 1.4514395999999998, $d16a$29 Av. Maurice Bourgès-Maunoury$d16a$, $d16c$Toulouse$d16c$, $d16p$31200$d16p$, $d16g$ChIJQy6tvVKjrhIRz8kfooB3cWc$d16g$, 5.0, 62, $d16s$DJ$d16s$),
  ($d17n$DJ Mario Animation Mariage Toulouse : DJ Mario Animation à Montauban ,Muret. Fêtes locales ,CE, anniversaire$d17n$, $d17d$DJ à Montjoire.
Téléphone : 06 11 68 94 25
Site web : http://www.mario-animation.com/
Note Google : 4.4/5 (16 avis)
Google Maps : https://maps.google.com/?cid=451512510512809067&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d17d$, true, 43.758437, 1.505266, $d17a$87 Chem. du Buffevent$d17a$, $d17c$Montjoire$d17c$, $d17p$31380$d17p$, $d17g$ChIJ61Om7D6grhIRa8TCcDwYRAY$d17g$, 4.4, 16, $d17s$DJ$d17s$),
  ($d18n$DJ OTAVA, animation de mariages$d18n$, $d18d$DJ à Labarthe-sur-Lèze.
Téléphone : 06 10 23 73 03
Site web : https://djotava.com/
Note Google : 5/5 (45 avis)
Google Maps : https://maps.google.com/?cid=14473458859974919458&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d18d$, true, 43.4529259, 1.3980043, $d18a$Pl. Vincent Auriol$d18a$, $d18c$Labarthe-sur-Lèze$d18c$, $d18p$31860$d18p$, $d18g$ChIJo2-VbqHHrhIRIgUJRCYO3Mg$d18g$, 5.0, 45, $d18s$DJ$d18s$),
  ($d19n$DJ PAT ANIMATION - DISCO MOBILE -REGION OCCITANIE$d19n$, $d19d$DJ à Soueix-Rogalle.
Téléphone : 06 86 99 71 03
Site web : http://djpatanimation.fr/
Note Google : 4.8/5 (48 avis)
Google Maps : https://maps.google.com/?cid=16108826073036198575&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d19d$, true, 42.904365399999996, 1.2053926, $d19a$9 chemin de la frête$d19a$, $d19c$Soueix-Rogalle$d19c$, $d19p$09140$d19p$, $d19g$ChIJP0c4QojLqBIRr5LfF_cLjt8$d19g$, 4.8, 48, $d19s$DJ$d19s$),
  ($d20n$DJ RICO ANIMATIONS$d20n$, $d20d$DJ à Muret.
Téléphone : 06 28 48 93 82
Site web : https://www.djrico-animations.com/?utm_source=google&utm_medium=wix_google_business_profile&utm_campaign=1333026566455155609
Google Maps : https://maps.google.com/?cid=17570286640656449954&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d20d$, true, 43.4694521, 1.3295643, $d20a$58 Av. Jacques Douzans$d20a$, $d20c$Muret$d20c$, $d20p$31600$d20p$, $d20g$ChIJRcSsZxpi7ocRooEeupsy1vM$d20g$, 0, 0, $d20s$DJ$d20s$),
  ($d21n$DJ Toulouse - Guillaume B - Guillaume BAUDRAND$d21n$, $d21d$DJ à Toulouse.
Téléphone : 06 47 00 83 64
Site web : https://www.instagram.com/glmb.dj/?hl=fr
Note Google : 5/5 (42 avis)
Google Maps : https://maps.google.com/?cid=18426292422040780043&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d21d$, true, 43.617200499999996, 1.4120688, $d21a$$d21a$, $d21c$Toulouse$d21c$, $d21p$31200$d21p$, $d21g$ChIJqawAhdEtmAsRC302x1RXt_8$d21g$, 5.0, 42, $d21s$DJ$d21s$),
  ($d22n$DJ Toulouse Une belle soirée$d22n$, $d22d$DJ à Launaguet.
Téléphone : 06 98 72 64 00
Site web : https://unebellesoiree.fr/
Note Google : 5/5 (23 avis)
Google Maps : https://maps.google.com/?cid=10674854737122030104&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d22d$, true, 43.6546129, 1.4535323999999998, $d22a$12 All. des Sablettes$d22a$, $d22c$Launaguet$d22c$, $d22p$31140$d22p$, $d22g$ChIJh255mIG7rhIRGPINW9OzJJQ$d22g$, 5.0, 23, $d22s$DJ$d22s$),
  ($d23n$DJ animateur professionnel - CRE ZIK$d23n$, $d23d$DJ à Toulouse.
Téléphone : 06 89 14 05 64
Site web : https://crezik.fr/
Note Google : 4.7/5 (3 avis)
Google Maps : https://maps.google.com/?cid=8428675480354677439&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d23d$, true, 43.5810794, 1.4442903, $d23a$109 Rue Saint-Roch$d23a$, $d23c$Toulouse$d23c$, $d23p$31400$d23p$, $d23g$ChIJ1wh-PRIgrBIRv-KVPbGr-HQ$d23g$, 4.7, 3, $d23s$DJ$d23s$),
  ($d24n$DJM events - DJ Mariage Midi Pyrénées Toulouse$d24n$, $d24d$DJ à Launaguet.
Téléphone : 06 74 79 74 89
Site web : http://www.djmevents.fr/
Note Google : 5/5 (68 avis)
Google Maps : https://maps.google.com/?cid=6999908580318081690&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d24d$, true, 43.6708652, 1.4451492, $d24a$4 Imp. Albert Camus$d24a$, $d24c$Launaguet$d24c$, $d24p$31140$d24p$, $d24g$ChIJD0gzxYCjrhIRmnIRRsSrJGE$d24g$, 5.0, 68, $d24s$DJ$d24s$),
  ($d25n$Dj Event’s La Peña 31$d25n$, $d25d$DJ à Cornebarrieu.
Téléphone : 06 26 73 17 08
Site web : https://www.djmariagetoulouse.fr/
Note Google : 5/5 (27 avis)
Google Maps : https://maps.google.com/?cid=18230773997386882431&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d25d$, true, 43.656146899999996, 1.3032898, $d25a$Rue Biscons$d25a$, $d25c$Cornebarrieu$d25c$, $d25p$31700$d25p$, $d25g$ChIJRwhSqmqvrhIRf12sHly4AP0$d25g$, 5.0, 27, $d25s$DJ$d25s$),
  ($d26n$Duo Hyperstène- Groupe de musique saxophone piano$d26n$, $d26d$Groupe de musique à Toulouse.
Téléphone : 06 64 33 57 61
Google Maps : https://maps.google.com/?cid=14118177220556566066&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d26d$, true, 43.622433, 1.4631269999999998, $d26a$92 Av. de Lavaur$d26a$, $d26c$Toulouse$d26c$, $d26p$31500$d26p$, $d26g$ChIJUzu0JQa9rhIRMi5Je2HX7cM$d26g$, 0, 0, $d26s$Groupe de musique$d26s$),
  ($d27n$Fanfare Les Open Bardes$d27n$, $d27d$Groupe de musique à Toulouse.
Téléphone : 07 78 54 77 17
Site web : https://www.openbardes.fr/
Note Google : 5/5 (13 avis)
Google Maps : https://maps.google.com/?cid=8608458805741134236&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d27d$, true, 43.6038238, 1.4442055999999999, $d27a$1 Pl. du Capitole E5$d27a$, $d27c$Toulouse$d27c$, $d27p$31000$d27p$, $d27g$ChIJTRPHLYNzg2ERnKHIm6xjd3c$d27g$, 5.0, 13, $d27s$Groupe de musique$d27s$),
  ($d28n$Idylle Trio - Groupe musique Mariage Toulouse, entreprises,soirées privées$d28n$, $d28d$Groupe de musique à Bazus.
Téléphone : 06 87 43 86 04
Site web : http://www.idylle-trio.fr/
Note Google : 5/5 (28 avis)
Google Maps : https://maps.google.com/?cid=4993185812772002722&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d28d$, true, 43.734110199999996, 1.5294302, $d28a$100 Chem. Saint-Paul$d28a$, $d28c$Bazus$d28c$, $d28p$31380$d28p$, $d28g$ChIJbYXzk8eZrhIRopvLqwpcS0U$d28g$, 5.0, 28, $d28s$Groupe de musique$d28s$),
  ($d29n$Il était une voix$d29n$, $d29d$Chanteur à Toulouse.
Site web : http://chorale-rangueil.fr/
Google Maps : https://maps.google.com/?cid=7403898555312407189&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d29d$, true, 43.5744816, 1.4639509, $d29a$19 Rue Claude de Forbin$d29a$, $d29c$Toulouse$d29c$, $d29p$31400$d29p$, $d29g$ChIJaVrAKxC9rhIRlYJsLoLuv2Y$d29g$, 0, 0, $d29s$Chanteur$d29s$),
  ($d30n$Karanim Disco$d30n$, $d30d$DJ à Toulouse.
Téléphone : 06 89 32 23 85
Site web : http://www.karanim.fr/
Note Google : 5/5 (138 avis)
Google Maps : https://maps.google.com/?cid=13205519199758376779&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d30d$, true, 43.5999815, 1.4240530999999998, $d30a$5 Rue du Dr Émile Calmette$d30a$, $d30c$Toulouse$d30c$, $d30p$31000$d30p$, $d30g$ChIJYb03sxH9qBIRS98yEL9tQ7c$d30g$, 5.0, 138, $d30s$DJ$d30s$),
  ($d31n$Karanim disco, DJ professionel à Toulouse et Saint Gaudens$d31n$, $d31d$DJ à Toulouse.
Téléphone : 06 89 32 23 85
Note Google : 4.6/5 (12 avis)
Google Maps : https://maps.google.com/?cid=15623477690473723624&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d31d$, true, 43.6078773, 1.4413384999999999, $d31a$Ctre ville, Pl. Saint-Sernin$d31a$, $d31c$Toulouse$d31c$, $d31p$31000$d31p$, $d31g$ChIJbQXdQo78qBIR6DbtyC6-0dg$d31g$, 4.6, 12, $d31s$DJ$d31s$),
  ($d32n$Kriis'B Production - Votre DJ à Toulouse et en Haute-Garonne$d32n$, $d32d$DJ à Plaisance-du-Touch.
Téléphone : 06 80 13 67 93
Site web : https://dj-toulouse.fr/
Note Google : 4.9/5 (131 avis)
Google Maps : https://maps.google.com/?cid=11739979266795187985&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d32d$, true, 43.560904799999996, 1.2866297, $d32a$25 Rue des Sœurs Monié$d32a$, $d32c$Plaisance-du-Touch$d32c$, $d32p$31830$d32p$, $d32g$ChIJDa1u_vyzrhIRES_HK_HI7KI$d32g$, 4.9, 131, $d32s$DJ$d32s$),
  ($d33n$Lady L Trio - Groupe de Jazz pour Mariage et évènements$d33n$, $d33d$Groupe de musique à Toulouse.
Téléphone : 06 87 90 86 60
Site web : https://ladyltrio.fr/
Note Google : 5/5 (68 avis)
Google Maps : https://maps.google.com/?cid=2247264532373826008&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d33d$, true, 43.6412304, 1.4664266000000001, $d33a$193 Rte d'Albi$d33a$, $d33c$Toulouse$d33c$, $d33p$31200$d33p$, $d33g$ChIJUa6t1S-jrhIR2Ol5iC_jLx8$d33g$, 5.0, 68, $d33s$Groupe de musique$d33s$),
  ($d34n$Les Grands Interprètes$d34n$, $d34d$Groupe de musique à Toulouse.
Téléphone : 05 61 21 09 00
Site web : http://www.grandsinterpretes.com/
Note Google : 4.3/5 (22 avis)
Google Maps : https://maps.google.com/?cid=13980456865333987180&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d34d$, true, 43.603498699999996, 1.4446394999999999, $d34a$61 Rue de la Pomme$d34a$, $d34c$Toulouse$d34c$, $d34p$31000$d34p$, $d34g$ChIJs-bswZ28rhIRbEfnh3KPBMI$d34g$, 4.3, 22, $d34s$Groupe de musique$d34s$),
  ($d35n$Les Jolies Musiques$d35n$, $d35d$Musicien à Toulouse.
Téléphone : 05 61 80 67 17
Site web : http://www.lesjoliesmusiques.fr/
Note Google : 5/5 (62 avis)
Google Maps : https://maps.google.com/?cid=4149321145981225948&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d35d$, true, 43.5477048, 1.3967722, $d35a$5 Imp. Boudeville$d35a$, $d35c$Toulouse$d35c$, $d35p$31100$d35p$, $d35g$ChIJPbg0pIS9rhIR3Es6JZlZlTk$d35g$, 5.0, 62, $d35s$Musicien$d35s$),
  ($d36n$Les Petites Pépites dj$d36n$, $d36d$DJ à Toulouse.
Téléphone : 06 31 41 26 11
Site web : http://les-petites-pepites.fr/
Note Google : 5/5 (151 avis)
Google Maps : https://maps.google.com/?cid=17161826223137761101&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d36d$, true, 43.5987194, 1.4361055, $d36a$8 Rue de la République$d36a$, $d36c$Toulouse$d36c$, $d36p$31300$d36p$, $d36g$ChIJWUgF33q7rhIRTScczwUOK-4$d36g$, 5.0, 151, $d36s$DJ$d36s$),
  ($d37n$Lionel RIGAL - Dj Toulouse$d37n$, $d37d$DJ à Aucamville.
Téléphone : 06 13 25 54 04
Note Google : 5/5 (9 avis)
Google Maps : https://maps.google.com/?cid=14444199820821797935&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d37d$, true, 43.663533799999996, 1.4293696999999999, $d37a$angle, 9 Chem. André Salvy$d37a$, $d37c$Aucamville$d37c$, $d37p$31140$d37p$, $d37g$ChIJA2fLZomkrhIRLxzYWDUbdMg$d37g$, 5.0, 9, $d37s$DJ$d37s$),
  ($d38n$LÈV Animation musicale à l'église 31$d38n$, $d38d$Musicien à Toulouse.
Téléphone : 06 02 05 26 52
Site web : https://lev.music31.fr/
Note Google : 5/5 (84 avis)
Google Maps : https://maps.google.com/?cid=4037697623075415053&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d38d$, true, 43.58101, 1.4578906999999999, $d38a$115 Rue Bonnat$d38a$, $d38c$Toulouse$d38c$, $d38p$31400$d38p$, $d38g$ChIJkQ6uL329rhIRDWTZdZjICDg$d38g$, 5.0, 84, $d38s$Musicien$d38s$),
  ($d39n$Léon le DJ$d39n$, $d39d$DJ à Castanet-Tolosan.
Téléphone : 06 76 54 10 81
Note Google : 5/5 (12 avis)
Google Maps : https://maps.google.com/?cid=8796654174826536224&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d39d$, true, 43.519892299999995, 1.5096124, $d39a$3 Imp. du Brabant$d39a$, $d39c$Castanet-Tolosan$d39c$, $d39p$31320$d39p$, $d39g$ChIJ0cemofW_rhIRIB1-hl3-E3o$d39g$, 5.0, 12, $d39s$DJ$d39s$),
  ($d40n$Madame Léon - Groupe de Jazz Toulouse$d40n$, $d40d$Groupe de musique à Toulouse.
Téléphone : 06 73 34 02 68
Site web : http://madameleon.fr/
Note Google : 5/5 (18 avis)
Google Maps : https://maps.google.com/?cid=16105006037126293363&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d40d$, true, 43.626457099999996, 1.464639, $d40a$3 Rue de Briançon$d40a$, $d40c$Toulouse$d40c$, $d40p$31500$d40p$, $d40g$ChIJl9cBWki7rhIRcydvrKl5gN8$d40g$, 5.0, 18, $d40s$Groupe de musique$d40s$),
  ($d41n$Miar | Groupe de musique | Animation musicale | Musique live$d41n$, $d41d$Groupe de musique à Cugnaux.
Téléphone : 06 79 04 95 33
Site web : http://www.miar-music.com/
Note Google : 4.8/5 (21 avis)
Google Maps : https://maps.google.com/?cid=14091331128570387032&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d41d$, true, 43.5374318, 1.3445802999999998, $d41a$2 Pl. de l'Église$d41a$, $d41c$Cugnaux$d41c$, $d41p$31270$d41p$, $d41g$ChIJNcLnxTe3rhIRWJrXmgB3jsM$d41g$, 4.8, 21, $d41s$Groupe de musique$d41s$),
  ($d42n$Mon Dj Antillais$d42n$, $d42d$DJ à Toulouse.
Téléphone : 06 51 39 14 24
Site web : http://mondjantillais.com/
Google Maps : https://maps.google.com/?cid=7024217458497315869&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d42d$, true, 43.618537800000006, 1.3976901, $d42a$262 Av. de Casselardit$d42a$, $d42c$Toulouse$d42c$, $d42p$31300$d42p$, $d42g$ChIJAwolYtq6rhIRHWTUBpAIe2E$d42g$, 0, 0, $d42s$DJ$d42s$),
  ($d43n$Nanobox - DJ Mariage Toulouse | Animation Événementielle$d43n$, $d43d$DJ à Toulouse.
Téléphone : 09 66 86 00 40
Site web : https://www.nanobox.fr/
Note Google : 5/5 (194 avis)
Google Maps : https://maps.google.com/?cid=13244494322622694494&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d43d$, true, 43.6450252, 1.4445681000000001, $d43a$49 Rue Durand$d43a$, $d43c$Toulouse$d43c$, $d43p$31200$d43p$, $d43g$ChIJwelkVoe8rhIRXoSaAWrlzbc$d43g$, 5.0, 194, $d43s$DJ$d43s$),
  ($d44n$Newton Discomobile - Dj sur Toulouse 31$d44n$, $d44d$DJ à Toulouse.
Téléphone : 06 13 25 54 04
Site web : http://www.newtondiscomobile.com/
Note Google : 4.4/5 (7 avis)
Google Maps : https://maps.google.com/?cid=9354074000038774782&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d44d$, true, 43.6079801, 1.4534398, $d44a$78 All. Jean Jaurès$d44a$, $d44c$Toulouse$d44c$, $d44p$31000$d44p$, $d44g$ChIJsc9uHJi8rhIR_kcHN75Y0IE$d44g$, 4.4, 7, $d44s$DJ$d44s$),
  ($d45n$SONG/ Soul Of New Gospel$d45n$, $d45d$Chanteur à Toulouse.
Site web : https://soulofnewgospel31.wixsite.com/song
Note Google : 5/5 (8 avis)
Google Maps : https://maps.google.com/?cid=263745406476792233&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d45d$, true, 43.5853002, 1.4476767, $d45a$18 Gr Saint-Michel$d45a$, $d45c$Toulouse$d45c$, $d45p$31400$d45p$, $d45g$ChIJ02aQsn68rhIRqbEwwAwDqQM$d45g$, 5.0, 8, $d45s$Chanteur$d45s$),
  ($d46n$SPARKS - Groupe de Musique à Toulouse$d46n$, $d46d$Groupe de musique à Plaisance-du-Touch.
Téléphone : 07 60 81 97 42
Site web : https://www.sparksprivatemusic.com/
Note Google : 5/5 (1 avis)
Google Maps : https://maps.google.com/?cid=13369217887684912089&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d46d$, true, 43.5912474, 1.2963866, $d46a$3 Rue du Dr Charcot$d46a$, $d46c$Plaisance-du-Touch$d46c$, $d46p$31830$d46p$, $d46g$ChIJ56Sio2SxrhIR2eNB8NUAibk$d46g$, 5.0, 1, $d46s$Groupe de musique$d46s$),
  ($d47n$Samba Résille$d47n$, $d47d$Groupe de musique à Toulouse.
Téléphone : 05 34 41 62 16
Site web : http://www.samba-resille.org/
Note Google : 4.6/5 (63 avis)
Google Maps : https://maps.google.com/?cid=3269167087290340956&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d47d$, true, 43.6113125, 1.4466158999999998, $d47a$38 Rue Roquelaine$d47a$, $d47c$Toulouse$d47c$, $d47p$31000$d47p$, $d47g$ChIJQ_9Ip6G8rhIRXNZWJSVqXi0$d47g$, 4.6, 63, $d47s$Groupe de musique$d47s$),
  ($d48n$Singer Mix Event (by DJ Francis) ex DJ Esméralda Toulouse$d48n$, $d48d$DJ à Saint-Loup-Cammas.
Téléphone : 07 68 53 65 08
Note Google : 5/5 (7 avis)
Google Maps : https://maps.google.com/?cid=10354560477907563326&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d48d$, true, 43.6969463, 1.4756297, $d48a$All. des Bosquets$d48a$, $d48c$Saint-Loup-Cammas$d48c$, $d48p$31140$d48p$, $d48g$ChIJ2dw-OTWjrhIRPrP60uTJso8$d48g$, 5.0, 7, $d48s$DJ$d48s$),
  ($d49n$Soulshine voices gospel choir$d49n$, $d49d$Chanteur à Toulouse.
Téléphone : 07 67 72 46 29
Site web : https://soulshinevoices-gospel.com/
Note Google : 5/5 (10 avis)
Google Maps : https://maps.google.com/?cid=17140243550514669139&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d49d$, true, 43.6045899, 1.4442198, $d49a$25 Rue des Couteliers$d49a$, $d49c$Toulouse$d49c$, $d49p$31000$d49p$, $d49g$ChIJqfOr_ra9rhIRU2YbQLJg3u0$d49g$, 5.0, 10, $d49s$Chanteur$d49s$),
  ($d50n$The Band from New York$d50n$, $d50d$Groupe de musique à Toulouse.
Téléphone : 05 61 42 95 07
Site web : http://thebandfromnewyork.com/
Note Google : 5/5 (12 avis)
Google Maps : https://maps.google.com/?cid=14221767402262241945&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d50d$, true, 43.584442200000005, 1.4276197, $d50a$123 Av. de Muret 31 300$d50a$, $d50c$Toulouse$d50c$, $d50p$31300$d50p$, $d50g$ChIJjfhxIHi7rhIRmSISKhreXcU$d50g$, 5.0, 12, $d50s$Groupe de musique$d50s$),
  ($d51n$The Brandy Boys Trio$d51n$, $d51d$Groupe de musique à Toulouse.
Site web : https://linkaband.com/the-brandy-bbys-trio
Note Google : 5/5 (7 avis)
Google Maps : https://maps.google.com/?cid=5325424013007982772&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d51d$, true, 43.610351800000004, 1.4229967, $d51a$12 Imp. Simone Dutemps$d51a$, $d51c$Toulouse$d51c$, $d51p$31000$d51p$, $d51g$ChIJR2UVi5e8rhIRtBCtrey050k$d51g$, 5.0, 7, $d51s$Groupe de musique$d51s$),
  ($d52n$Un Dj Chez Vous - Animation de Mariage à Toulouse$d52n$, $d52d$DJ à Toulouse.
Téléphone : 06 51 39 14 24
Note Google : 5/5 (6 avis)
Google Maps : https://maps.google.com/?cid=18029977837410497991&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d52d$, true, 43.6185377, 1.3976901, $d52a$262 Av. de Casselardit$d52a$, $d52c$Toulouse$d52c$, $d52p$31300$d52p$, $d52g$ChIJAQolYtq6rhIRx7UE81BZN_o$d52g$, 5.0, 6, $d52s$DJ$d52s$),
  ($d53n$ZeBigTeuf - DJ Animation mariages et soirées Toulouse et région 31$d53n$, $d53d$DJ à Toulouse.
Téléphone : 06 88 20 10 00
Site web : https://www.zebigteuf.com/?utm_medium=referral&utm_source=gmb&utm_campaign=lnk-gmb
Note Google : 4.7/5 (68 avis)
Google Maps : https://maps.google.com/?cid=14553129114867874150&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d53d$, true, 43.5808548, 1.4903494, $d53a$5 Rue Pons Capdenier$d53a$, $d53c$Toulouse$d53c$, $d53p$31500$d53p$, $d53g$ChIJkya97X68rhIRZjkY_tIZ98k$d53g$, 4.7, 68, $d53s$DJ$d53s$),
  ($d54n$dj événementiel, sonorisation & éclairage, Mariage, anniversaire.$d54n$, $d54d$DJ à Castelmaurou.
Téléphone : 06 61 75 88 29
Site web : https://www.djrsonorisation.fr/
Note Google : 5/5 (7 avis)
Google Maps : https://maps.google.com/?cid=11651679639480570528&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d54d$, true, 43.674272599999995, 1.5293211000000002, $d54a$16 Rue des Cévennes$d54a$, $d54c$Castelmaurou$d54c$, $d54p$31180$d54p$, $d54g$ChIJNeBavBvINogRoBLkG-YUs6E$d54g$, 5.0, 7, $d54s$DJ$d54s$),
  ($d55n$le Cri du Chœur$d55n$, $d55d$Chanteur à Toulouse.
Téléphone : 05 61 57 89 54
Site web : http://www.lecriduchoeur.org/
Note Google : 5/5 (4 avis)
Google Maps : https://maps.google.com/?cid=14037305548091108603&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d55d$, true, 43.6046493, 1.4564959, $d55a$All. Antonio Machado$d55a$, $d55c$Toulouse$d55c$, $d55p$31100$d55p$, $d55g$ChIJg6GryZa8rhIR-yyX7QWHzsI$d55g$, 5.0, 4, $d55s$Chanteur$d55s$),
  ($d56n$toulouse DJ$d56n$, $d56d$DJ à Seysses.
Téléphone : 06 76 54 10 81
Site web : http://toulousedj.fr/
Note Google : 5/5 (114 avis)
Google Maps : https://maps.google.com/?cid=14065872323942187009&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d56d$, true, 43.5039321, 1.261485, $d56a$891 Chem. de la Bourdasse$d56a$, $d56c$Seysses$d56c$, $d56p$31600$d56p$, $d56g$ChIJVwrIzsq_rhIRAYCSvFoENMM$d56g$, 5.0, 114, $d56s$DJ$d56s$)
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
  ($d0n$AGENCE LPC - TOULOUSE DJ$d0n$, $d0d$DJ à Launaguet.
Téléphone : 06 80 01 23 75
Site web : https://agencelpc.fr/
Note Google : 4.9/5 (309 avis)
Google Maps : https://maps.google.com/?cid=14374829293947870917&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d0d$, true, 43.6546129, 1.4535323999999998, $d0a$12 All. des Sablettes$d0a$, $d0c$Launaguet$d0c$, $d0p$31140$d0p$, $d0g$ChIJu5mGY2ilrhIRxV6k7BSnfcc$d0g$, 4.9, 309, $d0s$DJ$d0s$),
  ($d1n$ALOHA DISCO : DJ & Karaoke$d1n$, $d1d$DJ à Colomiers.
Téléphone : 06 89 68 14 73
Site web : https://www.facebook.com/share/1F2FibYTrd/?mibextid=wwXIfr
Note Google : 4.8/5 (19 avis)
Google Maps : https://maps.google.com/?cid=16424692205041720618&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d1d$, true, 43.5987516, 1.3263893, $d1a$14 All. des Calanques$d1a$, $d1c$Colomiers$d1c$, $d1p$31770$d1p$, $d1g$ChIJuXccIK2xrhIRKp2j6ok68OM$d1g$, 4.8, 19, $d1s$DJ$d1s$),
  ($d2n$ARTE GIPSY toulouse musique gitan$d2n$, $d2d$Musicien à Colomiers.
Téléphone : 06 50 39 39 93
Site web : http://www.artegipsy.fr/
Note Google : 5/5 (3 avis)
Google Maps : https://maps.google.com/?cid=11849290873388222210&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d2d$, true, 43.6083358, 1.3274228, $d2a$77 bis All. du Comminges$d2a$, $d2c$Colomiers$d2c$, $d2p$31770$d2p$, $d2g$ChIJSetty46UfgcRAkeV5EQjcaQ$d2g$, 5.0, 3, $d2s$Musicien$d2s$),
  ($d3n$Acoustic Color$d3n$, $d3d$Musicien à Toulouse.
Téléphone : 06 25 79 20 48
Site web : http://acoustic-color.com/
Note Google : 4.9/5 (19 avis)
Google Maps : https://maps.google.com/?cid=1078640958809459267&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d3d$, true, 43.5820976, 1.4738617999999999, $d3a$184 Av. Antoine de Saint-Exupéry$d3a$, $d3c$Toulouse$d3c$, $d3p$31400$d3p$, $d3g$ChIJCeX6qFWjrhIRQ0oGtjwa-A4$d3g$, 4.9, 19, $d3s$Musicien$d3s$),
  ($d4n$Amande & Miel | Groupe de Jazz | Toulouse$d4n$, $d4d$Groupe de musique à Toulouse.
Téléphone : 06 30 41 17 99
Site web : http://www.amandemielmusic.com/
Note Google : 5/5 (33 avis)
Google Maps : https://maps.google.com/?cid=211454091457242735&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d4d$, true, 43.61996620000001, 1.4354890999999999, $d4a$5 Rue du Caillou Gris$d4a$, $d4c$Toulouse$d4c$, $d4p$31200$d4p$, $d4g$ChIJtUnjaFC7rhIRb6acN2A87wI$d4g$, 5.0, 33, $d4s$Groupe de musique$d4s$),
  ($d5n$Aphrodite : Groupe de musique mariage$d5n$, $d5d$Groupe de musique à Toulouse.
Téléphone : 06 64 13 94 63
Site web : https://www.chanteusemariage.com/
Note Google : 5/5 (3 avis)
Google Maps : https://maps.google.com/?cid=12394223441949579860&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d5d$, true, 43.616422, 1.42963, $d5a$Av. Jean Dagnaux$d5a$, $d5c$Toulouse$d5c$, $d5p$31200$d5p$, $d5g$ChIJ59F41Lm7rhIRVFo5lI0gAaw$d5g$, 5.0, 3, $d5s$Groupe de musique$d5s$),
  ($d6n$CHOEUR LA DAURADE$d6n$, $d6d$Chanteur à Toulouse.
Site web : https://www.choeurladaurade.fr/
Google Maps : https://maps.google.com/?cid=5688261478062784192&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d6d$, true, 43.574763999999995, 1.4542150999999999, $d6a$4 Av. des Écoles Jules Julien$d6a$, $d6c$Toulouse$d6c$, $d6p$31400$d6p$, $d6g$ChIJL4GHRwC9rhIRwH54Na3D8E4$d6g$, 0, 0, $d6s$Chanteur$d6s$),
  ($d7n$Captain Star Band$d7n$, $d7d$Groupe de musique à Toulouse.
Téléphone : 06 17 19 47 87
Site web : https://www.captainstar.fr/
Note Google : 5/5 (9 avis)
Google Maps : https://maps.google.com/?cid=3408477750381735201&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d7d$, true, 43.570279899999996, 1.4518377, $d7a$13 Rue Louis Eydoux$d7a$, $d7c$Toulouse$d7c$, $d7p$31400$d7p$, $d7g$ChIJD6NL6ni9rhIRIW1TgHRYTS8$d7g$, 5.0, 9, $d7s$Groupe de musique$d7s$),
  ($d8n$Choeur Toulouse Garonne$d8n$, $d8d$Chanteur à Toulouse.
Téléphone : 06 21 28 02 91
Site web : http://www.choeurtoulousegaronne.fr/
Note Google : 4.7/5 (13 avis)
Google Maps : https://maps.google.com/?cid=9702045512656081472&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d8d$, true, 43.5990989, 1.4691037, $d8a$61 Av. Raymond Naves$d8a$, $d8c$Toulouse$d8c$, $d8p$31500$d8p$, $d8g$ChIJaVZ1H1y7rhIRQNKJeP2WpIY$d8g$, 4.7, 13, $d8s$Chanteur$d8s$),
  ($d9n$Chorale Choeur Tolosa$d9n$, $d9d$Chanteur à Toulouse.
Site web : http://choeur-tolosa.org/
Note Google : 5/5 (2 avis)
Google Maps : https://maps.google.com/?cid=17972392668076279121&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d9d$, true, 43.583349, 1.4755099999999999, $d9a$24 Rue Louis Blanc$d9a$, $d9c$Toulouse$d9c$, $d9p$31400$d9p$, $d9g$ChIJU0ZUF1G8rhIRUYWF6OjDavk$d9g$, 5.0, 2, $d9s$Chanteur$d9s$),
  ($d10n$Chorale Populaire de Toulouse$d10n$, $d10d$Chanteur à Toulouse.
Téléphone : 06 75 85 33 60
Site web : http://chorale-toulouse.org/
Note Google : 4.3/5 (3 avis)
Google Maps : https://maps.google.com/?cid=17147886911327896067&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d10d$, true, 43.58405260000001, 1.477711, $d10a$254 Av. Jean Rieux$d10a$, $d10c$Toulouse$d10c$, $d10p$31400$d10p$, $d10g$ChIJC87M_HS7rhIRAwJF3kqI-e0$d10g$, 4.3, 3, $d10s$Chanteur$d10s$),
  ($d11n$Chorale Uniisson Toulouse$d11n$, $d11d$Chanteur à Toulouse.
Site web : https://www.uniisson.com/
Note Google : 3.8/5 (6 avis)
Google Maps : https://maps.google.com/?cid=5264048781500409098&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d11d$, true, 43.5646352, 1.4074413, $d11a$8 Imp. André Marestan$d11a$, $d11c$Toulouse$d11c$, $d11p$31400$d11p$, $d11g$ChIJY-1jlTG9rhIRCuWoBXqoDUk$d11g$, 3.8, 6, $d11s$Chanteur$d11s$),
  ($d12n$DJ Dømi, expert en musiques pour évènements$d12n$, $d12d$DJ à Toulouse.
Téléphone : 06 51 93 99 11
Site web : https://d0mi.fr/
Note Google : 5/5 (34 avis)
Google Maps : https://maps.google.com/?cid=3903801735804244827&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d12d$, true, 43.5761739, 1.4795842, $d12a$72 Chem. Carrosse$d12a$, $d12c$Toulouse$d12c$, $d12p$31400$d12p$, $d12g$ChIJo7tM_fy9rhIRW1Mq2P4WLTY$d12g$, 5.0, 34, $d12s$DJ$d12s$),
  ($d13n$DJ EVEN$d13n$, $d13d$DJ à Toulouse.
Téléphone : 06 49 44 81 88
Site web : http://djeven.com/
Note Google : 5/5 (202 avis)
Google Maps : https://maps.google.com/?cid=9867887533146063450&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d13d$, true, 43.6112034, 1.4356655999999999, $d13a$5 Esp. Compans Caffarelli$d13a$, $d13c$Toulouse$d13c$, $d13p$31000$d13p$, $d13g$ChIJpw-RX_m9rhIRWkKt2G3H8Yg$d13g$, 5.0, 202, $d13s$DJ$d13s$),
  ($d14n$DJ GAR-L$d14n$, $d14d$DJ à Mons.
Téléphone : 06 50 51 12 65
Site web : https://djgar-l.over-blog.com/
Note Google : 5/5 (11 avis)
Google Maps : https://maps.google.com/?cid=15770214959190980732&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d14d$, true, 43.611559299999996, 1.5670940999999998, $d14a$Av. du Lauragais$d14a$, $d14c$Mons$d14c$, $d14p$31280$d14p$, $d14g$ChIJLdKcqQ2XrhIRfDghgvMO29o$d14g$, 5.0, 11, $d14s$DJ$d14s$),
  ($d15n$DJ JONATHAN$d15n$, $d15d$DJ à Toulouse.
Téléphone : 07 89 97 21 29
Site web : https://linkr.bio/jojo_31500
Note Google : 1/5 (1 avis)
Google Maps : https://maps.google.com/?cid=4847629474587078332&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d15d$, true, 43.6035599, 1.4356246, $d15a$Pl. Saint-Pierre$d15a$, $d15c$Toulouse$d15c$, $d15p$31000$d15p$, $d15g$ChIJ06uUY4G9rhIRvO55w1I9RkM$d15g$, 1.0, 1, $d15s$DJ$d15s$),
  ($d16n$DJ Madame T-Relo / DJ professionnelle à Toulouse / DJ Toulouse Animation Mariage Haute Garonne 31$d16n$, $d16d$DJ à Toulouse.
Téléphone : 06 82 32 11 47
Site web : https://www.dj-madame-t-relo.fr/
Note Google : 5/5 (62 avis)
Google Maps : https://maps.google.com/?cid=7453870252634393039&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d16d$, true, 43.6343195, 1.4514395999999998, $d16a$29 Av. Maurice Bourgès-Maunoury$d16a$, $d16c$Toulouse$d16c$, $d16p$31200$d16p$, $d16g$ChIJQy6tvVKjrhIRz8kfooB3cWc$d16g$, 5.0, 62, $d16s$DJ$d16s$),
  ($d17n$DJ Mario Animation Mariage Toulouse : DJ Mario Animation à Montauban ,Muret. Fêtes locales ,CE, anniversaire$d17n$, $d17d$DJ à Montjoire.
Téléphone : 06 11 68 94 25
Site web : http://www.mario-animation.com/
Note Google : 4.4/5 (16 avis)
Google Maps : https://maps.google.com/?cid=451512510512809067&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d17d$, true, 43.758437, 1.505266, $d17a$87 Chem. du Buffevent$d17a$, $d17c$Montjoire$d17c$, $d17p$31380$d17p$, $d17g$ChIJ61Om7D6grhIRa8TCcDwYRAY$d17g$, 4.4, 16, $d17s$DJ$d17s$),
  ($d18n$DJ OTAVA, animation de mariages$d18n$, $d18d$DJ à Labarthe-sur-Lèze.
Téléphone : 06 10 23 73 03
Site web : https://djotava.com/
Note Google : 5/5 (45 avis)
Google Maps : https://maps.google.com/?cid=14473458859974919458&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d18d$, true, 43.4529259, 1.3980043, $d18a$Pl. Vincent Auriol$d18a$, $d18c$Labarthe-sur-Lèze$d18c$, $d18p$31860$d18p$, $d18g$ChIJo2-VbqHHrhIRIgUJRCYO3Mg$d18g$, 5.0, 45, $d18s$DJ$d18s$),
  ($d19n$DJ PAT ANIMATION - DISCO MOBILE -REGION OCCITANIE$d19n$, $d19d$DJ à Soueix-Rogalle.
Téléphone : 06 86 99 71 03
Site web : http://djpatanimation.fr/
Note Google : 4.8/5 (48 avis)
Google Maps : https://maps.google.com/?cid=16108826073036198575&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d19d$, true, 42.904365399999996, 1.2053926, $d19a$9 chemin de la frête$d19a$, $d19c$Soueix-Rogalle$d19c$, $d19p$09140$d19p$, $d19g$ChIJP0c4QojLqBIRr5LfF_cLjt8$d19g$, 4.8, 48, $d19s$DJ$d19s$),
  ($d20n$DJ RICO ANIMATIONS$d20n$, $d20d$DJ à Muret.
Téléphone : 06 28 48 93 82
Site web : https://www.djrico-animations.com/?utm_source=google&utm_medium=wix_google_business_profile&utm_campaign=1333026566455155609
Google Maps : https://maps.google.com/?cid=17570286640656449954&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d20d$, true, 43.4694521, 1.3295643, $d20a$58 Av. Jacques Douzans$d20a$, $d20c$Muret$d20c$, $d20p$31600$d20p$, $d20g$ChIJRcSsZxpi7ocRooEeupsy1vM$d20g$, 0, 0, $d20s$DJ$d20s$),
  ($d21n$DJ Toulouse - Guillaume B - Guillaume BAUDRAND$d21n$, $d21d$DJ à Toulouse.
Téléphone : 06 47 00 83 64
Site web : https://www.instagram.com/glmb.dj/?hl=fr
Note Google : 5/5 (42 avis)
Google Maps : https://maps.google.com/?cid=18426292422040780043&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d21d$, true, 43.617200499999996, 1.4120688, $d21a$$d21a$, $d21c$Toulouse$d21c$, $d21p$31200$d21p$, $d21g$ChIJqawAhdEtmAsRC302x1RXt_8$d21g$, 5.0, 42, $d21s$DJ$d21s$),
  ($d22n$DJ Toulouse Une belle soirée$d22n$, $d22d$DJ à Launaguet.
Téléphone : 06 98 72 64 00
Site web : https://unebellesoiree.fr/
Note Google : 5/5 (23 avis)
Google Maps : https://maps.google.com/?cid=10674854737122030104&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d22d$, true, 43.6546129, 1.4535323999999998, $d22a$12 All. des Sablettes$d22a$, $d22c$Launaguet$d22c$, $d22p$31140$d22p$, $d22g$ChIJh255mIG7rhIRGPINW9OzJJQ$d22g$, 5.0, 23, $d22s$DJ$d22s$),
  ($d23n$DJ animateur professionnel - CRE ZIK$d23n$, $d23d$DJ à Toulouse.
Téléphone : 06 89 14 05 64
Site web : https://crezik.fr/
Note Google : 4.7/5 (3 avis)
Google Maps : https://maps.google.com/?cid=8428675480354677439&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d23d$, true, 43.5810794, 1.4442903, $d23a$109 Rue Saint-Roch$d23a$, $d23c$Toulouse$d23c$, $d23p$31400$d23p$, $d23g$ChIJ1wh-PRIgrBIRv-KVPbGr-HQ$d23g$, 4.7, 3, $d23s$DJ$d23s$),
  ($d24n$DJM events - DJ Mariage Midi Pyrénées Toulouse$d24n$, $d24d$DJ à Launaguet.
Téléphone : 06 74 79 74 89
Site web : http://www.djmevents.fr/
Note Google : 5/5 (68 avis)
Google Maps : https://maps.google.com/?cid=6999908580318081690&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d24d$, true, 43.6708652, 1.4451492, $d24a$4 Imp. Albert Camus$d24a$, $d24c$Launaguet$d24c$, $d24p$31140$d24p$, $d24g$ChIJD0gzxYCjrhIRmnIRRsSrJGE$d24g$, 5.0, 68, $d24s$DJ$d24s$),
  ($d25n$Dj Event’s La Peña 31$d25n$, $d25d$DJ à Cornebarrieu.
Téléphone : 06 26 73 17 08
Site web : https://www.djmariagetoulouse.fr/
Note Google : 5/5 (27 avis)
Google Maps : https://maps.google.com/?cid=18230773997386882431&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d25d$, true, 43.656146899999996, 1.3032898, $d25a$Rue Biscons$d25a$, $d25c$Cornebarrieu$d25c$, $d25p$31700$d25p$, $d25g$ChIJRwhSqmqvrhIRf12sHly4AP0$d25g$, 5.0, 27, $d25s$DJ$d25s$),
  ($d26n$Duo Hyperstène- Groupe de musique saxophone piano$d26n$, $d26d$Groupe de musique à Toulouse.
Téléphone : 06 64 33 57 61
Google Maps : https://maps.google.com/?cid=14118177220556566066&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d26d$, true, 43.622433, 1.4631269999999998, $d26a$92 Av. de Lavaur$d26a$, $d26c$Toulouse$d26c$, $d26p$31500$d26p$, $d26g$ChIJUzu0JQa9rhIRMi5Je2HX7cM$d26g$, 0, 0, $d26s$Groupe de musique$d26s$),
  ($d27n$Fanfare Les Open Bardes$d27n$, $d27d$Groupe de musique à Toulouse.
Téléphone : 07 78 54 77 17
Site web : https://www.openbardes.fr/
Note Google : 5/5 (13 avis)
Google Maps : https://maps.google.com/?cid=8608458805741134236&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d27d$, true, 43.6038238, 1.4442055999999999, $d27a$1 Pl. du Capitole E5$d27a$, $d27c$Toulouse$d27c$, $d27p$31000$d27p$, $d27g$ChIJTRPHLYNzg2ERnKHIm6xjd3c$d27g$, 5.0, 13, $d27s$Groupe de musique$d27s$),
  ($d28n$Idylle Trio - Groupe musique Mariage Toulouse, entreprises,soirées privées$d28n$, $d28d$Groupe de musique à Bazus.
Téléphone : 06 87 43 86 04
Site web : http://www.idylle-trio.fr/
Note Google : 5/5 (28 avis)
Google Maps : https://maps.google.com/?cid=4993185812772002722&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d28d$, true, 43.734110199999996, 1.5294302, $d28a$100 Chem. Saint-Paul$d28a$, $d28c$Bazus$d28c$, $d28p$31380$d28p$, $d28g$ChIJbYXzk8eZrhIRopvLqwpcS0U$d28g$, 5.0, 28, $d28s$Groupe de musique$d28s$),
  ($d29n$Il était une voix$d29n$, $d29d$Chanteur à Toulouse.
Site web : http://chorale-rangueil.fr/
Google Maps : https://maps.google.com/?cid=7403898555312407189&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d29d$, true, 43.5744816, 1.4639509, $d29a$19 Rue Claude de Forbin$d29a$, $d29c$Toulouse$d29c$, $d29p$31400$d29p$, $d29g$ChIJaVrAKxC9rhIRlYJsLoLuv2Y$d29g$, 0, 0, $d29s$Chanteur$d29s$),
  ($d30n$Karanim Disco$d30n$, $d30d$DJ à Toulouse.
Téléphone : 06 89 32 23 85
Site web : http://www.karanim.fr/
Note Google : 5/5 (138 avis)
Google Maps : https://maps.google.com/?cid=13205519199758376779&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d30d$, true, 43.5999815, 1.4240530999999998, $d30a$5 Rue du Dr Émile Calmette$d30a$, $d30c$Toulouse$d30c$, $d30p$31000$d30p$, $d30g$ChIJYb03sxH9qBIRS98yEL9tQ7c$d30g$, 5.0, 138, $d30s$DJ$d30s$),
  ($d31n$Karanim disco, DJ professionel à Toulouse et Saint Gaudens$d31n$, $d31d$DJ à Toulouse.
Téléphone : 06 89 32 23 85
Note Google : 4.6/5 (12 avis)
Google Maps : https://maps.google.com/?cid=15623477690473723624&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d31d$, true, 43.6078773, 1.4413384999999999, $d31a$Ctre ville, Pl. Saint-Sernin$d31a$, $d31c$Toulouse$d31c$, $d31p$31000$d31p$, $d31g$ChIJbQXdQo78qBIR6DbtyC6-0dg$d31g$, 4.6, 12, $d31s$DJ$d31s$),
  ($d32n$Kriis'B Production - Votre DJ à Toulouse et en Haute-Garonne$d32n$, $d32d$DJ à Plaisance-du-Touch.
Téléphone : 06 80 13 67 93
Site web : https://dj-toulouse.fr/
Note Google : 4.9/5 (131 avis)
Google Maps : https://maps.google.com/?cid=11739979266795187985&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d32d$, true, 43.560904799999996, 1.2866297, $d32a$25 Rue des Sœurs Monié$d32a$, $d32c$Plaisance-du-Touch$d32c$, $d32p$31830$d32p$, $d32g$ChIJDa1u_vyzrhIRES_HK_HI7KI$d32g$, 4.9, 131, $d32s$DJ$d32s$),
  ($d33n$Lady L Trio - Groupe de Jazz pour Mariage et évènements$d33n$, $d33d$Groupe de musique à Toulouse.
Téléphone : 06 87 90 86 60
Site web : https://ladyltrio.fr/
Note Google : 5/5 (68 avis)
Google Maps : https://maps.google.com/?cid=2247264532373826008&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d33d$, true, 43.6412304, 1.4664266000000001, $d33a$193 Rte d'Albi$d33a$, $d33c$Toulouse$d33c$, $d33p$31200$d33p$, $d33g$ChIJUa6t1S-jrhIR2Ol5iC_jLx8$d33g$, 5.0, 68, $d33s$Groupe de musique$d33s$),
  ($d34n$Les Grands Interprètes$d34n$, $d34d$Groupe de musique à Toulouse.
Téléphone : 05 61 21 09 00
Site web : http://www.grandsinterpretes.com/
Note Google : 4.3/5 (22 avis)
Google Maps : https://maps.google.com/?cid=13980456865333987180&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d34d$, true, 43.603498699999996, 1.4446394999999999, $d34a$61 Rue de la Pomme$d34a$, $d34c$Toulouse$d34c$, $d34p$31000$d34p$, $d34g$ChIJs-bswZ28rhIRbEfnh3KPBMI$d34g$, 4.3, 22, $d34s$Groupe de musique$d34s$),
  ($d35n$Les Jolies Musiques$d35n$, $d35d$Musicien à Toulouse.
Téléphone : 05 61 80 67 17
Site web : http://www.lesjoliesmusiques.fr/
Note Google : 5/5 (62 avis)
Google Maps : https://maps.google.com/?cid=4149321145981225948&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d35d$, true, 43.5477048, 1.3967722, $d35a$5 Imp. Boudeville$d35a$, $d35c$Toulouse$d35c$, $d35p$31100$d35p$, $d35g$ChIJPbg0pIS9rhIR3Es6JZlZlTk$d35g$, 5.0, 62, $d35s$Musicien$d35s$),
  ($d36n$Les Petites Pépites dj$d36n$, $d36d$DJ à Toulouse.
Téléphone : 06 31 41 26 11
Site web : http://les-petites-pepites.fr/
Note Google : 5/5 (151 avis)
Google Maps : https://maps.google.com/?cid=17161826223137761101&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d36d$, true, 43.5987194, 1.4361055, $d36a$8 Rue de la République$d36a$, $d36c$Toulouse$d36c$, $d36p$31300$d36p$, $d36g$ChIJWUgF33q7rhIRTScczwUOK-4$d36g$, 5.0, 151, $d36s$DJ$d36s$),
  ($d37n$Lionel RIGAL - Dj Toulouse$d37n$, $d37d$DJ à Aucamville.
Téléphone : 06 13 25 54 04
Note Google : 5/5 (9 avis)
Google Maps : https://maps.google.com/?cid=14444199820821797935&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d37d$, true, 43.663533799999996, 1.4293696999999999, $d37a$angle, 9 Chem. André Salvy$d37a$, $d37c$Aucamville$d37c$, $d37p$31140$d37p$, $d37g$ChIJA2fLZomkrhIRLxzYWDUbdMg$d37g$, 5.0, 9, $d37s$DJ$d37s$),
  ($d38n$LÈV Animation musicale à l'église 31$d38n$, $d38d$Musicien à Toulouse.
Téléphone : 06 02 05 26 52
Site web : https://lev.music31.fr/
Note Google : 5/5 (84 avis)
Google Maps : https://maps.google.com/?cid=4037697623075415053&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d38d$, true, 43.58101, 1.4578906999999999, $d38a$115 Rue Bonnat$d38a$, $d38c$Toulouse$d38c$, $d38p$31400$d38p$, $d38g$ChIJkQ6uL329rhIRDWTZdZjICDg$d38g$, 5.0, 84, $d38s$Musicien$d38s$),
  ($d39n$Léon le DJ$d39n$, $d39d$DJ à Castanet-Tolosan.
Téléphone : 06 76 54 10 81
Note Google : 5/5 (12 avis)
Google Maps : https://maps.google.com/?cid=8796654174826536224&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d39d$, true, 43.519892299999995, 1.5096124, $d39a$3 Imp. du Brabant$d39a$, $d39c$Castanet-Tolosan$d39c$, $d39p$31320$d39p$, $d39g$ChIJ0cemofW_rhIRIB1-hl3-E3o$d39g$, 5.0, 12, $d39s$DJ$d39s$),
  ($d40n$Madame Léon - Groupe de Jazz Toulouse$d40n$, $d40d$Groupe de musique à Toulouse.
Téléphone : 06 73 34 02 68
Site web : http://madameleon.fr/
Note Google : 5/5 (18 avis)
Google Maps : https://maps.google.com/?cid=16105006037126293363&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d40d$, true, 43.626457099999996, 1.464639, $d40a$3 Rue de Briançon$d40a$, $d40c$Toulouse$d40c$, $d40p$31500$d40p$, $d40g$ChIJl9cBWki7rhIRcydvrKl5gN8$d40g$, 5.0, 18, $d40s$Groupe de musique$d40s$),
  ($d41n$Miar | Groupe de musique | Animation musicale | Musique live$d41n$, $d41d$Groupe de musique à Cugnaux.
Téléphone : 06 79 04 95 33
Site web : http://www.miar-music.com/
Note Google : 4.8/5 (21 avis)
Google Maps : https://maps.google.com/?cid=14091331128570387032&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d41d$, true, 43.5374318, 1.3445802999999998, $d41a$2 Pl. de l'Église$d41a$, $d41c$Cugnaux$d41c$, $d41p$31270$d41p$, $d41g$ChIJNcLnxTe3rhIRWJrXmgB3jsM$d41g$, 4.8, 21, $d41s$Groupe de musique$d41s$),
  ($d42n$Mon Dj Antillais$d42n$, $d42d$DJ à Toulouse.
Téléphone : 06 51 39 14 24
Site web : http://mondjantillais.com/
Google Maps : https://maps.google.com/?cid=7024217458497315869&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d42d$, true, 43.618537800000006, 1.3976901, $d42a$262 Av. de Casselardit$d42a$, $d42c$Toulouse$d42c$, $d42p$31300$d42p$, $d42g$ChIJAwolYtq6rhIRHWTUBpAIe2E$d42g$, 0, 0, $d42s$DJ$d42s$),
  ($d43n$Nanobox - DJ Mariage Toulouse | Animation Événementielle$d43n$, $d43d$DJ à Toulouse.
Téléphone : 09 66 86 00 40
Site web : https://www.nanobox.fr/
Note Google : 5/5 (194 avis)
Google Maps : https://maps.google.com/?cid=13244494322622694494&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d43d$, true, 43.6450252, 1.4445681000000001, $d43a$49 Rue Durand$d43a$, $d43c$Toulouse$d43c$, $d43p$31200$d43p$, $d43g$ChIJwelkVoe8rhIRXoSaAWrlzbc$d43g$, 5.0, 194, $d43s$DJ$d43s$),
  ($d44n$Newton Discomobile - Dj sur Toulouse 31$d44n$, $d44d$DJ à Toulouse.
Téléphone : 06 13 25 54 04
Site web : http://www.newtondiscomobile.com/
Note Google : 4.4/5 (7 avis)
Google Maps : https://maps.google.com/?cid=9354074000038774782&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d44d$, true, 43.6079801, 1.4534398, $d44a$78 All. Jean Jaurès$d44a$, $d44c$Toulouse$d44c$, $d44p$31000$d44p$, $d44g$ChIJsc9uHJi8rhIR_kcHN75Y0IE$d44g$, 4.4, 7, $d44s$DJ$d44s$),
  ($d45n$SONG/ Soul Of New Gospel$d45n$, $d45d$Chanteur à Toulouse.
Site web : https://soulofnewgospel31.wixsite.com/song
Note Google : 5/5 (8 avis)
Google Maps : https://maps.google.com/?cid=263745406476792233&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d45d$, true, 43.5853002, 1.4476767, $d45a$18 Gr Saint-Michel$d45a$, $d45c$Toulouse$d45c$, $d45p$31400$d45p$, $d45g$ChIJ02aQsn68rhIRqbEwwAwDqQM$d45g$, 5.0, 8, $d45s$Chanteur$d45s$),
  ($d46n$SPARKS - Groupe de Musique à Toulouse$d46n$, $d46d$Groupe de musique à Plaisance-du-Touch.
Téléphone : 07 60 81 97 42
Site web : https://www.sparksprivatemusic.com/
Note Google : 5/5 (1 avis)
Google Maps : https://maps.google.com/?cid=13369217887684912089&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d46d$, true, 43.5912474, 1.2963866, $d46a$3 Rue du Dr Charcot$d46a$, $d46c$Plaisance-du-Touch$d46c$, $d46p$31830$d46p$, $d46g$ChIJ56Sio2SxrhIR2eNB8NUAibk$d46g$, 5.0, 1, $d46s$Groupe de musique$d46s$),
  ($d47n$Samba Résille$d47n$, $d47d$Groupe de musique à Toulouse.
Téléphone : 05 34 41 62 16
Site web : http://www.samba-resille.org/
Note Google : 4.6/5 (63 avis)
Google Maps : https://maps.google.com/?cid=3269167087290340956&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d47d$, true, 43.6113125, 1.4466158999999998, $d47a$38 Rue Roquelaine$d47a$, $d47c$Toulouse$d47c$, $d47p$31000$d47p$, $d47g$ChIJQ_9Ip6G8rhIRXNZWJSVqXi0$d47g$, 4.6, 63, $d47s$Groupe de musique$d47s$),
  ($d48n$Singer Mix Event (by DJ Francis) ex DJ Esméralda Toulouse$d48n$, $d48d$DJ à Saint-Loup-Cammas.
Téléphone : 07 68 53 65 08
Note Google : 5/5 (7 avis)
Google Maps : https://maps.google.com/?cid=10354560477907563326&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d48d$, true, 43.6969463, 1.4756297, $d48a$All. des Bosquets$d48a$, $d48c$Saint-Loup-Cammas$d48c$, $d48p$31140$d48p$, $d48g$ChIJ2dw-OTWjrhIRPrP60uTJso8$d48g$, 5.0, 7, $d48s$DJ$d48s$),
  ($d49n$Soulshine voices gospel choir$d49n$, $d49d$Chanteur à Toulouse.
Téléphone : 07 67 72 46 29
Site web : https://soulshinevoices-gospel.com/
Note Google : 5/5 (10 avis)
Google Maps : https://maps.google.com/?cid=17140243550514669139&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d49d$, true, 43.6045899, 1.4442198, $d49a$25 Rue des Couteliers$d49a$, $d49c$Toulouse$d49c$, $d49p$31000$d49p$, $d49g$ChIJqfOr_ra9rhIRU2YbQLJg3u0$d49g$, 5.0, 10, $d49s$Chanteur$d49s$),
  ($d50n$The Band from New York$d50n$, $d50d$Groupe de musique à Toulouse.
Téléphone : 05 61 42 95 07
Site web : http://thebandfromnewyork.com/
Note Google : 5/5 (12 avis)
Google Maps : https://maps.google.com/?cid=14221767402262241945&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d50d$, true, 43.584442200000005, 1.4276197, $d50a$123 Av. de Muret 31 300$d50a$, $d50c$Toulouse$d50c$, $d50p$31300$d50p$, $d50g$ChIJjfhxIHi7rhIRmSISKhreXcU$d50g$, 5.0, 12, $d50s$Groupe de musique$d50s$),
  ($d51n$The Brandy Boys Trio$d51n$, $d51d$Groupe de musique à Toulouse.
Site web : https://linkaband.com/the-brandy-bbys-trio
Note Google : 5/5 (7 avis)
Google Maps : https://maps.google.com/?cid=5325424013007982772&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d51d$, true, 43.610351800000004, 1.4229967, $d51a$12 Imp. Simone Dutemps$d51a$, $d51c$Toulouse$d51c$, $d51p$31000$d51p$, $d51g$ChIJR2UVi5e8rhIRtBCtrey050k$d51g$, 5.0, 7, $d51s$Groupe de musique$d51s$),
  ($d52n$Un Dj Chez Vous - Animation de Mariage à Toulouse$d52n$, $d52d$DJ à Toulouse.
Téléphone : 06 51 39 14 24
Note Google : 5/5 (6 avis)
Google Maps : https://maps.google.com/?cid=18029977837410497991&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d52d$, true, 43.6185377, 1.3976901, $d52a$262 Av. de Casselardit$d52a$, $d52c$Toulouse$d52c$, $d52p$31300$d52p$, $d52g$ChIJAQolYtq6rhIRx7UE81BZN_o$d52g$, 5.0, 6, $d52s$DJ$d52s$),
  ($d53n$ZeBigTeuf - DJ Animation mariages et soirées Toulouse et région 31$d53n$, $d53d$DJ à Toulouse.
Téléphone : 06 88 20 10 00
Site web : https://www.zebigteuf.com/?utm_medium=referral&utm_source=gmb&utm_campaign=lnk-gmb
Note Google : 4.7/5 (68 avis)
Google Maps : https://maps.google.com/?cid=14553129114867874150&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d53d$, true, 43.5808548, 1.4903494, $d53a$5 Rue Pons Capdenier$d53a$, $d53c$Toulouse$d53c$, $d53p$31500$d53p$, $d53g$ChIJkya97X68rhIRZjkY_tIZ98k$d53g$, 4.7, 68, $d53s$DJ$d53s$),
  ($d54n$dj événementiel, sonorisation & éclairage, Mariage, anniversaire.$d54n$, $d54d$DJ à Castelmaurou.
Téléphone : 06 61 75 88 29
Site web : https://www.djrsonorisation.fr/
Note Google : 5/5 (7 avis)
Google Maps : https://maps.google.com/?cid=11651679639480570528&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d54d$, true, 43.674272599999995, 1.5293211000000002, $d54a$16 Rue des Cévennes$d54a$, $d54c$Castelmaurou$d54c$, $d54p$31180$d54p$, $d54g$ChIJNeBavBvINogRoBLkG-YUs6E$d54g$, 5.0, 7, $d54s$DJ$d54s$),
  ($d55n$le Cri du Chœur$d55n$, $d55d$Chanteur à Toulouse.
Téléphone : 05 61 57 89 54
Site web : http://www.lecriduchoeur.org/
Note Google : 5/5 (4 avis)
Google Maps : https://maps.google.com/?cid=14037305548091108603&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d55d$, true, 43.6046493, 1.4564959, $d55a$All. Antonio Machado$d55a$, $d55c$Toulouse$d55c$, $d55p$31100$d55p$, $d55g$ChIJg6GryZa8rhIR-yyX7QWHzsI$d55g$, 5.0, 4, $d55s$Chanteur$d55s$),
  ($d56n$toulouse DJ$d56n$, $d56d$DJ à Seysses.
Téléphone : 06 76 54 10 81
Site web : http://toulousedj.fr/
Note Google : 5/5 (114 avis)
Google Maps : https://maps.google.com/?cid=14065872323942187009&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d56d$, true, 43.5039321, 1.261485, $d56a$891 Chem. de la Bourdasse$d56a$, $d56c$Seysses$d56c$, $d56p$31600$d56p$, $d56g$ChIJVwrIzsq_rhIRAYCSvFoENMM$d56g$, 5.0, 114, $d56s$DJ$d56s$)
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
    where google_place_id in ($d0id$ChIJu5mGY2ilrhIRxV6k7BSnfcc$d0id$, $d1id$ChIJuXccIK2xrhIRKp2j6ok68OM$d1id$, $d2id$ChIJSetty46UfgcRAkeV5EQjcaQ$d2id$, $d3id$ChIJCeX6qFWjrhIRQ0oGtjwa-A4$d3id$, $d4id$ChIJtUnjaFC7rhIRb6acN2A87wI$d4id$, $d5id$ChIJ59F41Lm7rhIRVFo5lI0gAaw$d5id$, $d6id$ChIJL4GHRwC9rhIRwH54Na3D8E4$d6id$, $d7id$ChIJD6NL6ni9rhIRIW1TgHRYTS8$d7id$, $d8id$ChIJaVZ1H1y7rhIRQNKJeP2WpIY$d8id$, $d9id$ChIJU0ZUF1G8rhIRUYWF6OjDavk$d9id$, $d10id$ChIJC87M_HS7rhIRAwJF3kqI-e0$d10id$, $d11id$ChIJY-1jlTG9rhIRCuWoBXqoDUk$d11id$, $d12id$ChIJo7tM_fy9rhIRW1Mq2P4WLTY$d12id$, $d13id$ChIJpw-RX_m9rhIRWkKt2G3H8Yg$d13id$, $d14id$ChIJLdKcqQ2XrhIRfDghgvMO29o$d14id$, $d15id$ChIJ06uUY4G9rhIRvO55w1I9RkM$d15id$, $d16id$ChIJQy6tvVKjrhIRz8kfooB3cWc$d16id$, $d17id$ChIJ61Om7D6grhIRa8TCcDwYRAY$d17id$, $d18id$ChIJo2-VbqHHrhIRIgUJRCYO3Mg$d18id$, $d19id$ChIJP0c4QojLqBIRr5LfF_cLjt8$d19id$, $d20id$ChIJRcSsZxpi7ocRooEeupsy1vM$d20id$, $d21id$ChIJqawAhdEtmAsRC302x1RXt_8$d21id$, $d22id$ChIJh255mIG7rhIRGPINW9OzJJQ$d22id$, $d23id$ChIJ1wh-PRIgrBIRv-KVPbGr-HQ$d23id$, $d24id$ChIJD0gzxYCjrhIRmnIRRsSrJGE$d24id$, $d25id$ChIJRwhSqmqvrhIRf12sHly4AP0$d25id$, $d26id$ChIJUzu0JQa9rhIRMi5Je2HX7cM$d26id$, $d27id$ChIJTRPHLYNzg2ERnKHIm6xjd3c$d27id$, $d28id$ChIJbYXzk8eZrhIRopvLqwpcS0U$d28id$, $d29id$ChIJaVrAKxC9rhIRlYJsLoLuv2Y$d29id$, $d30id$ChIJYb03sxH9qBIRS98yEL9tQ7c$d30id$, $d31id$ChIJbQXdQo78qBIR6DbtyC6-0dg$d31id$, $d32id$ChIJDa1u_vyzrhIRES_HK_HI7KI$d32id$, $d33id$ChIJUa6t1S-jrhIR2Ol5iC_jLx8$d33id$, $d34id$ChIJs-bswZ28rhIRbEfnh3KPBMI$d34id$, $d35id$ChIJPbg0pIS9rhIR3Es6JZlZlTk$d35id$, $d36id$ChIJWUgF33q7rhIRTScczwUOK-4$d36id$, $d37id$ChIJA2fLZomkrhIRLxzYWDUbdMg$d37id$, $d38id$ChIJkQ6uL329rhIRDWTZdZjICDg$d38id$, $d39id$ChIJ0cemofW_rhIRIB1-hl3-E3o$d39id$, $d40id$ChIJl9cBWki7rhIRcydvrKl5gN8$d40id$, $d41id$ChIJNcLnxTe3rhIRWJrXmgB3jsM$d41id$, $d42id$ChIJAwolYtq6rhIRHWTUBpAIe2E$d42id$, $d43id$ChIJwelkVoe8rhIRXoSaAWrlzbc$d43id$, $d44id$ChIJsc9uHJi8rhIR_kcHN75Y0IE$d44id$, $d45id$ChIJ02aQsn68rhIRqbEwwAwDqQM$d45id$, $d46id$ChIJ56Sio2SxrhIR2eNB8NUAibk$d46id$, $d47id$ChIJQ_9Ip6G8rhIRXNZWJSVqXi0$d47id$, $d48id$ChIJ2dw-OTWjrhIRPrP60uTJso8$d48id$, $d49id$ChIJqfOr_ra9rhIRU2YbQLJg3u0$d49id$, $d50id$ChIJjfhxIHi7rhIRmSISKhreXcU$d50id$, $d51id$ChIJR2UVi5e8rhIRtBCtrey050k$d51id$, $d52id$ChIJAQolYtq6rhIRx7UE81BZN_o$d52id$, $d53id$ChIJkya97X68rhIRZjkY_tIZ98k$d53id$, $d54id$ChIJNeBavBvINogRoBLkG-YUs6E$d54id$, $d55id$ChIJg6GryZa8rhIR-yyX7QWHzsI$d55id$, $d56id$ChIJVwrIzsq_rhIRAYCSvFoENMM$d56id$)
      and latitude is not null
      and longitude is not null
      and location is null;
  elsif location_type like 'geometry%' then
    update public.craftsmans
    set location = ST_SetSRID(ST_MakePoint(longitude, latitude), 4326)
    where google_place_id in ($d0id$ChIJu5mGY2ilrhIRxV6k7BSnfcc$d0id$, $d1id$ChIJuXccIK2xrhIRKp2j6ok68OM$d1id$, $d2id$ChIJSetty46UfgcRAkeV5EQjcaQ$d2id$, $d3id$ChIJCeX6qFWjrhIRQ0oGtjwa-A4$d3id$, $d4id$ChIJtUnjaFC7rhIRb6acN2A87wI$d4id$, $d5id$ChIJ59F41Lm7rhIRVFo5lI0gAaw$d5id$, $d6id$ChIJL4GHRwC9rhIRwH54Na3D8E4$d6id$, $d7id$ChIJD6NL6ni9rhIRIW1TgHRYTS8$d7id$, $d8id$ChIJaVZ1H1y7rhIRQNKJeP2WpIY$d8id$, $d9id$ChIJU0ZUF1G8rhIRUYWF6OjDavk$d9id$, $d10id$ChIJC87M_HS7rhIRAwJF3kqI-e0$d10id$, $d11id$ChIJY-1jlTG9rhIRCuWoBXqoDUk$d11id$, $d12id$ChIJo7tM_fy9rhIRW1Mq2P4WLTY$d12id$, $d13id$ChIJpw-RX_m9rhIRWkKt2G3H8Yg$d13id$, $d14id$ChIJLdKcqQ2XrhIRfDghgvMO29o$d14id$, $d15id$ChIJ06uUY4G9rhIRvO55w1I9RkM$d15id$, $d16id$ChIJQy6tvVKjrhIRz8kfooB3cWc$d16id$, $d17id$ChIJ61Om7D6grhIRa8TCcDwYRAY$d17id$, $d18id$ChIJo2-VbqHHrhIRIgUJRCYO3Mg$d18id$, $d19id$ChIJP0c4QojLqBIRr5LfF_cLjt8$d19id$, $d20id$ChIJRcSsZxpi7ocRooEeupsy1vM$d20id$, $d21id$ChIJqawAhdEtmAsRC302x1RXt_8$d21id$, $d22id$ChIJh255mIG7rhIRGPINW9OzJJQ$d22id$, $d23id$ChIJ1wh-PRIgrBIRv-KVPbGr-HQ$d23id$, $d24id$ChIJD0gzxYCjrhIRmnIRRsSrJGE$d24id$, $d25id$ChIJRwhSqmqvrhIRf12sHly4AP0$d25id$, $d26id$ChIJUzu0JQa9rhIRMi5Je2HX7cM$d26id$, $d27id$ChIJTRPHLYNzg2ERnKHIm6xjd3c$d27id$, $d28id$ChIJbYXzk8eZrhIRopvLqwpcS0U$d28id$, $d29id$ChIJaVrAKxC9rhIRlYJsLoLuv2Y$d29id$, $d30id$ChIJYb03sxH9qBIRS98yEL9tQ7c$d30id$, $d31id$ChIJbQXdQo78qBIR6DbtyC6-0dg$d31id$, $d32id$ChIJDa1u_vyzrhIRES_HK_HI7KI$d32id$, $d33id$ChIJUa6t1S-jrhIR2Ol5iC_jLx8$d33id$, $d34id$ChIJs-bswZ28rhIRbEfnh3KPBMI$d34id$, $d35id$ChIJPbg0pIS9rhIR3Es6JZlZlTk$d35id$, $d36id$ChIJWUgF33q7rhIRTScczwUOK-4$d36id$, $d37id$ChIJA2fLZomkrhIRLxzYWDUbdMg$d37id$, $d38id$ChIJkQ6uL329rhIRDWTZdZjICDg$d38id$, $d39id$ChIJ0cemofW_rhIRIB1-hl3-E3o$d39id$, $d40id$ChIJl9cBWki7rhIRcydvrKl5gN8$d40id$, $d41id$ChIJNcLnxTe3rhIRWJrXmgB3jsM$d41id$, $d42id$ChIJAwolYtq6rhIRHWTUBpAIe2E$d42id$, $d43id$ChIJwelkVoe8rhIRXoSaAWrlzbc$d43id$, $d44id$ChIJsc9uHJi8rhIR_kcHN75Y0IE$d44id$, $d45id$ChIJ02aQsn68rhIRqbEwwAwDqQM$d45id$, $d46id$ChIJ56Sio2SxrhIR2eNB8NUAibk$d46id$, $d47id$ChIJQ_9Ip6G8rhIRXNZWJSVqXi0$d47id$, $d48id$ChIJ2dw-OTWjrhIRPrP60uTJso8$d48id$, $d49id$ChIJqfOr_ra9rhIRU2YbQLJg3u0$d49id$, $d50id$ChIJjfhxIHi7rhIRmSISKhreXcU$d50id$, $d51id$ChIJR2UVi5e8rhIRtBCtrey050k$d51id$, $d52id$ChIJAQolYtq6rhIRx7UE81BZN_o$d52id$, $d53id$ChIJkya97X68rhIRZjkY_tIZ98k$d53id$, $d54id$ChIJNeBavBvINogRoBLkG-YUs6E$d54id$, $d55id$ChIJg6GryZa8rhIR-yyX7QWHzsI$d55id$, $d56id$ChIJVwrIzsq_rhIRAYCSvFoENMM$d56id$)
      and latitude is not null
      and longitude is not null
      and location is null;
  end if;
end $$;
