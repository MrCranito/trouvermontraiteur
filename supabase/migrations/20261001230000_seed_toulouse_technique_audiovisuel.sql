-- Seed event sound, lighting, screens, and stages around Toulouse.
-- Only these google_place_id values are linked to Technique & Audiovisuel subcategories.

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
  ($d0n$Audio-Lum$d0n$, $d0d$Sonorisation à Drémil-Lafage.
Téléphone : 05 61 83 82 36
Site web : https://audio-lum.fr/
Note Google : 4.7/5 (18 avis)
Google Maps : https://maps.google.com/?cid=12166968089173849635&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d0d$, true, 43.5973562, 1.5864702, $d0a$32 Av. de la Mouyssaguese$d0a$, $d0c$Drémil-Lafage$d0c$, $d0p$31280$d0p$, $d0g$ChIJpXy87y6XrhIRI3a4hAPB2ag$d0g$, 4.7, 18, $d0s$Sonorisation$d0s$),
  ($d1n$Audiotec$d1n$, $d1d$Sonorisation à Quint-Fonsegrives.
Téléphone : 05 62 57 14 15
Site web : http://www.audiotec.fr/
Note Google : 4.7/5 (86 avis)
Google Maps : https://maps.google.com/?cid=15608372711141015560&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d1d$, true, 43.581465099999996, 1.5142001999999999, $d1a$7 Rue du Château de Ribaute$d1a$, $d1c$Quint-Fonsegrives$d1c$, $d1p$31130$d1p$, $d1g$ChIJa1u0toW9rhIRCAB2uUgUnNg$d1g$, 4.7, 86, $d1s$Sonorisation$d1s$),
  ($d2n$Capitol Audio$d2n$, $d2d$Sonorisation à Toulouse.
Téléphone : 05 62 88 34 88
Site web : http://www.capitolaudio.fr/
Note Google : 4.9/5 (119 avis)
Google Maps : https://maps.google.com/?cid=17677175542967928859&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d2d$, true, 43.6022927, 1.4423598, $d2a$16 Rue Sainte-Ursule$d2a$, $d2c$Toulouse$d2c$, $d2p$31000$d2p$, $d2g$ChIJZxTIzvm7rhIRG4jTpn_xUfU$d2g$, 4.9, 119, $d2s$Sonorisation$d2s$),
  ($d3n$Deep Audio$d3n$, $d3d$Sonorisation à Toulouse.
Téléphone : 09 50 64 83 30
Site web : http://deepaudio.fr/
Note Google : 5/5 (15 avis)
Google Maps : https://maps.google.com/?cid=13125191562338364550&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d3d$, true, 43.5710668, 1.4192822999999999, $d3a$7 Rue Louis Courtois de Viçose$d3a$, $d3c$Toulouse$d3c$, $d3p$31100$d3p$, $d3g$ChIJR_N05k27rhIRhuwhii8MJrY$d3g$, 5.0, 15, $d3s$Sonorisation$d3s$),
  ($d4n$Ecran geant LED PEKASON$d4n$, $d4d$Écrans et vidéo à Castelnau-d'Estrétefonds.
Téléphone : 05 61 73 60 31
Site web : https://www.pekason.com/
Note Google : 4.4/5 (7 avis)
Google Maps : https://maps.google.com/?cid=3487013141736836370&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d4d$, true, 43.7765026, 1.3589877, $d4a$26 Av. de Toulouse$d4a$, $d4c$Castelnau-d'Estrétefonds$d4c$, $d4p$31620$d4p$, $d4g$ChIJZVITZQSorhIREs1XOPpbZDA$d4g$, 4.4, 7, $d4s$Écrans & vidéo$d4s$),
  ($d5n$France Ecran Location$d5n$, $d5d$Écrans et vidéo à Saint-Genis-Laval.
Téléphone : 04 28 29 63 88
Site web : https://france-ecran-location.fr/
Note Google : 4.9/5 (48 avis)
Google Maps : https://maps.google.com/?cid=17908454801804622578&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d5d$, true, 45.698234, 4.767536, $d5a$133 Chem. de Beauversant Batiment B$d5a$, $d5c$Saint-Genis-Laval$d5c$, $d5p$69230$d5p$, $d5g$ChIJ9XZ_D9Hu9EcR8vqzWcKch_g$d5g$, 4.9, 48, $d5s$Écrans & vidéo$d5s$),
  ($d6n$Helios Events | Prestataire technique événementiel spectacle$d6n$, $d6d$Sonorisation à Blagnac.
Téléphone : 05 61 30 46 95
Site web : http://www.helios-events.fr/
Note Google : 4.7/5 (7 avis)
Google Maps : https://maps.google.com/?cid=10592319172671974172&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d6d$, true, 43.6387958, 1.3965500000000002, $d6a$7 Chem. de Barrieu$d6a$, $d6c$Blagnac$d6c$, $d6p$31700$d6p$, $d6g$ChIJCw7KGEalrhIRHCuswip6_5I$d6g$, 4.7, 7, $d6s$Sonorisation$d6s$),
  ($d7n$KRD Audiovisuel$d7n$, $d7d$Sonorisation à Montrabé.
Téléphone : 05 82 95 02 56
Site web : https://www.krd-audiovisuel.fr/
Note Google : 4.9/5 (82 avis)
Google Maps : https://maps.google.com/?cid=15626722254261330398&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d7d$, true, 43.645119199999996, 1.5140837999999999, $d7a$2 Rue de l'Europe$d7a$, $d7c$Montrabé$d7c$, $d7p$31850$d7p$, $d7g$ChIJB0hP7AqWrhIR3iHwqBhF3dg$d7g$, 4.9, 82, $d7s$Sonorisation$d7s$),
  ($d8n$L'atelier de lumiere$d8n$, $d8d$Éclairage à Toulouse.
Téléphone : 07 56 81 14 58
Site web : https://www.atelierdelumiere.photos/
Note Google : 5/5 (10 avis)
Google Maps : https://maps.google.com/?cid=11039817159116777909&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d8d$, true, 43.637212000000005, 1.4389649999999998, $d8a$Rte de Launaguet$d8a$, $d8c$Toulouse$d8c$, $d8p$31200$d8p$, $d8g$ChIJSZtFEtOlrhIRtelq-jZPNZk$d8g$, 5.0, 10, $d8s$Éclairage$d8s$),
  ($d9n$Le Mur Interactif Occitanie$d9n$, $d9d$Écrans et vidéo à Toulouse.
Téléphone : 06 12 09 48 43
Site web : https://lemurinteractifoccitanie.com/
Note Google : 5/5 (28 avis)
Google Maps : https://maps.google.com/?cid=13648246430271808143&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d9d$, true, 43.6111205, 1.4399113, $d9a$19 Bd d'Arcole$d9a$, $d9c$Toulouse$d9c$, $d9p$31000$d9p$, $d9g$ChIJSWXb1h5Ax6sRjyJYG9FPaL0$d9g$, 5.0, 28, $d9s$Écrans & vidéo$d9s$),
  ($d10n$Lighting Dynamics$d10n$, $d10d$Éclairage à Toulouse.
Téléphone : 06 74 54 22 86
Site web : http://www.lighting-dynamics.fr/
Note Google : 5/5 (3 avis)
Google Maps : https://maps.google.com/?cid=1464602085796927217&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d10d$, true, 43.629007699999995, 1.4320198, $d10a$10 Rue Larade$d10a$, $d10c$Toulouse$d10c$, $d10p$31200$d10p$, $d10g$ChIJ_1IvzrKkrhIR8dY4VdZPUxQ$d10g$, 5.0, 3, $d10s$Éclairage$d10s$),
  ($d11n$Loc2lux Events - Location Matériels pour évènements ( Mariage, Baby shower, Fêtes privés... )$d11n$, $d11d$Éclairage à Cugnaux.
Téléphone : 09 70 70 85 45
Site web : http://www.loc2lux.fr/
Note Google : 5/5 (202 avis)
Google Maps : https://maps.google.com/?cid=392456138578651466&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d11d$, true, 43.5363318, 1.3610045, $d11a$4bis Rue Alfred Sauvy$d11a$, $d11c$Cugnaux$d11c$, $d11p$31270$d11p$, $d11g$ChIJ2WPAH7y5rhIRSunmWcdIcgU$d11g$, 5.0, 202, $d11s$Éclairage$d11s$),
  ($d12n$Smiley Musik Location : Sonorisation; Prestation Toulouse Haute -Garonne$d12n$, $d12d$Sonorisation à Toulouse.
Téléphone : 06 59 34 91 46
Site web : https://smklocation.com/
Note Google : 4.7/5 (105 avis)
Google Maps : https://maps.google.com/?cid=11189114340582915577&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d12d$, true, 43.635043599999996, 1.4311458, $d12a$130 Av. des États-Unis$d12a$, $d12c$Toulouse$d12c$, $d12p$31200$d12p$, $d12g$ChIJX7XSo5ykrhIR-X2s1TW4R5s$d12g$, 4.7, 105, $d12s$Sonorisation$d12s$),
  ($d13n$Sono Toulouse Communication$d13n$, $d13d$Sonorisation à Sainte-Foy-d'Aigrefeuille.
Téléphone : 05 62 71 05 50
Site web : https://www.sono-toulouse.com/
Google Maps : https://maps.google.com/?cid=5439360342424780403&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d13d$, true, 43.551493099999995, 1.5957983999999998, $d13a$ZA VAL DE SAUNE II, 14 Av. Maryse Bastié$d13a$, $d13c$Sainte-Foy-d'Aigrefeuille$d13c$, $d13p$31570$d13p$, $d13g$ChIJr3yWkCq-rhIRc36Tl2l9fEs$d13g$, 0, 0, $d13s$Sonorisation$d13s$),
  ($d14n$Sonopourtous$d14n$, $d14d$Sonorisation à Toulouse.
Note Google : 4/5 (1 avis)
Google Maps : https://maps.google.com/?cid=2769200606123731589&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d14d$, true, 43.6016465, 1.3893921999999999, $d14a$17 Rue du Général Lionel de Marmier$d14a$, $d14c$Toulouse$d14c$, $d14p$31300$d14p$, $d14g$ChIJqQn02_e7rhIRhSrNh0ctbiY$d14g$, 4.0, 1, $d14s$Sonorisation$d14s$),
  ($d15n$Sud Podium$d15n$, $d15d$Scène à Roques.
Téléphone : 06 18 09 74 07
Site web : http://www.sudpodium.com/
Google Maps : https://maps.google.com/?cid=14507178954157759963&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d15d$, true, 43.517097199999995, 1.3493382, $d15a$103 Rte de Villeneuve$d15a$, $d15c$Roques$d15c$, $d15p$31120$d15p$, $d15g$ChIJ500nVnS3rhIR252Yf2XaU8k$d15g$, 0, 0, $d15s$Scène$d15s$),
  ($d16n$Ultraline Events : Prestations techniques évènementielle Toulouse$d16n$, $d16d$Sonorisation à Toulouse.
Téléphone : 05 61 63 10 74
Site web : https://www.ultraline-events.com/
Note Google : 5/5 (9 avis)
Google Maps : https://maps.google.com/?cid=10586118960819939273&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d16d$, true, 43.644725, 1.4575323999999998, $d16a$84 Rue Edmond Rostand$d16a$, $d16c$Toulouse$d16c$, $d16p$31200$d16p$, $d16g$ChIJ8_BW_7WjrhIRySezcRtz6ZI$d16g$, 5.0, 9, $d16s$Sonorisation$d16s$),
  ($d17n$Équipe ATS : Atelier Technique Scène$d17n$, $d17d$Scène à Luc-la-Primaube.
Téléphone : 05 65 69 74 76
Site web : http://www.equipeats.fr/
Note Google : 4.9/5 (15 avis)
Google Maps : https://maps.google.com/?cid=12117582780270422044&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d17d$, true, 44.283836, 2.5437083, $d17a$163 Av. de Toulouse$d17a$, $d17c$Luc-la-Primaube$d17c$, $d17p$12450$d17p$, $d17g$ChIJUxxnvOR7shIRHKhoQlZNKqg$d17g$, 4.9, 15, $d17s$Scène$d17s$)
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
  ($d0n$Audio-Lum$d0n$, $d0d$Sonorisation à Drémil-Lafage.
Téléphone : 05 61 83 82 36
Site web : https://audio-lum.fr/
Note Google : 4.7/5 (18 avis)
Google Maps : https://maps.google.com/?cid=12166968089173849635&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d0d$, true, 43.5973562, 1.5864702, $d0a$32 Av. de la Mouyssaguese$d0a$, $d0c$Drémil-Lafage$d0c$, $d0p$31280$d0p$, $d0g$ChIJpXy87y6XrhIRI3a4hAPB2ag$d0g$, 4.7, 18, $d0s$Sonorisation$d0s$),
  ($d1n$Audiotec$d1n$, $d1d$Sonorisation à Quint-Fonsegrives.
Téléphone : 05 62 57 14 15
Site web : http://www.audiotec.fr/
Note Google : 4.7/5 (86 avis)
Google Maps : https://maps.google.com/?cid=15608372711141015560&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d1d$, true, 43.581465099999996, 1.5142001999999999, $d1a$7 Rue du Château de Ribaute$d1a$, $d1c$Quint-Fonsegrives$d1c$, $d1p$31130$d1p$, $d1g$ChIJa1u0toW9rhIRCAB2uUgUnNg$d1g$, 4.7, 86, $d1s$Sonorisation$d1s$),
  ($d2n$Capitol Audio$d2n$, $d2d$Sonorisation à Toulouse.
Téléphone : 05 62 88 34 88
Site web : http://www.capitolaudio.fr/
Note Google : 4.9/5 (119 avis)
Google Maps : https://maps.google.com/?cid=17677175542967928859&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d2d$, true, 43.6022927, 1.4423598, $d2a$16 Rue Sainte-Ursule$d2a$, $d2c$Toulouse$d2c$, $d2p$31000$d2p$, $d2g$ChIJZxTIzvm7rhIRG4jTpn_xUfU$d2g$, 4.9, 119, $d2s$Sonorisation$d2s$),
  ($d3n$Deep Audio$d3n$, $d3d$Sonorisation à Toulouse.
Téléphone : 09 50 64 83 30
Site web : http://deepaudio.fr/
Note Google : 5/5 (15 avis)
Google Maps : https://maps.google.com/?cid=13125191562338364550&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d3d$, true, 43.5710668, 1.4192822999999999, $d3a$7 Rue Louis Courtois de Viçose$d3a$, $d3c$Toulouse$d3c$, $d3p$31100$d3p$, $d3g$ChIJR_N05k27rhIRhuwhii8MJrY$d3g$, 5.0, 15, $d3s$Sonorisation$d3s$),
  ($d4n$Ecran geant LED PEKASON$d4n$, $d4d$Écrans et vidéo à Castelnau-d'Estrétefonds.
Téléphone : 05 61 73 60 31
Site web : https://www.pekason.com/
Note Google : 4.4/5 (7 avis)
Google Maps : https://maps.google.com/?cid=3487013141736836370&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d4d$, true, 43.7765026, 1.3589877, $d4a$26 Av. de Toulouse$d4a$, $d4c$Castelnau-d'Estrétefonds$d4c$, $d4p$31620$d4p$, $d4g$ChIJZVITZQSorhIREs1XOPpbZDA$d4g$, 4.4, 7, $d4s$Écrans & vidéo$d4s$),
  ($d5n$France Ecran Location$d5n$, $d5d$Écrans et vidéo à Saint-Genis-Laval.
Téléphone : 04 28 29 63 88
Site web : https://france-ecran-location.fr/
Note Google : 4.9/5 (48 avis)
Google Maps : https://maps.google.com/?cid=17908454801804622578&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d5d$, true, 45.698234, 4.767536, $d5a$133 Chem. de Beauversant Batiment B$d5a$, $d5c$Saint-Genis-Laval$d5c$, $d5p$69230$d5p$, $d5g$ChIJ9XZ_D9Hu9EcR8vqzWcKch_g$d5g$, 4.9, 48, $d5s$Écrans & vidéo$d5s$),
  ($d6n$Helios Events | Prestataire technique événementiel spectacle$d6n$, $d6d$Sonorisation à Blagnac.
Téléphone : 05 61 30 46 95
Site web : http://www.helios-events.fr/
Note Google : 4.7/5 (7 avis)
Google Maps : https://maps.google.com/?cid=10592319172671974172&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d6d$, true, 43.6387958, 1.3965500000000002, $d6a$7 Chem. de Barrieu$d6a$, $d6c$Blagnac$d6c$, $d6p$31700$d6p$, $d6g$ChIJCw7KGEalrhIRHCuswip6_5I$d6g$, 4.7, 7, $d6s$Sonorisation$d6s$),
  ($d7n$KRD Audiovisuel$d7n$, $d7d$Sonorisation à Montrabé.
Téléphone : 05 82 95 02 56
Site web : https://www.krd-audiovisuel.fr/
Note Google : 4.9/5 (82 avis)
Google Maps : https://maps.google.com/?cid=15626722254261330398&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d7d$, true, 43.645119199999996, 1.5140837999999999, $d7a$2 Rue de l'Europe$d7a$, $d7c$Montrabé$d7c$, $d7p$31850$d7p$, $d7g$ChIJB0hP7AqWrhIR3iHwqBhF3dg$d7g$, 4.9, 82, $d7s$Sonorisation$d7s$),
  ($d8n$L'atelier de lumiere$d8n$, $d8d$Éclairage à Toulouse.
Téléphone : 07 56 81 14 58
Site web : https://www.atelierdelumiere.photos/
Note Google : 5/5 (10 avis)
Google Maps : https://maps.google.com/?cid=11039817159116777909&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d8d$, true, 43.637212000000005, 1.4389649999999998, $d8a$Rte de Launaguet$d8a$, $d8c$Toulouse$d8c$, $d8p$31200$d8p$, $d8g$ChIJSZtFEtOlrhIRtelq-jZPNZk$d8g$, 5.0, 10, $d8s$Éclairage$d8s$),
  ($d9n$Le Mur Interactif Occitanie$d9n$, $d9d$Écrans et vidéo à Toulouse.
Téléphone : 06 12 09 48 43
Site web : https://lemurinteractifoccitanie.com/
Note Google : 5/5 (28 avis)
Google Maps : https://maps.google.com/?cid=13648246430271808143&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d9d$, true, 43.6111205, 1.4399113, $d9a$19 Bd d'Arcole$d9a$, $d9c$Toulouse$d9c$, $d9p$31000$d9p$, $d9g$ChIJSWXb1h5Ax6sRjyJYG9FPaL0$d9g$, 5.0, 28, $d9s$Écrans & vidéo$d9s$),
  ($d10n$Lighting Dynamics$d10n$, $d10d$Éclairage à Toulouse.
Téléphone : 06 74 54 22 86
Site web : http://www.lighting-dynamics.fr/
Note Google : 5/5 (3 avis)
Google Maps : https://maps.google.com/?cid=1464602085796927217&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d10d$, true, 43.629007699999995, 1.4320198, $d10a$10 Rue Larade$d10a$, $d10c$Toulouse$d10c$, $d10p$31200$d10p$, $d10g$ChIJ_1IvzrKkrhIR8dY4VdZPUxQ$d10g$, 5.0, 3, $d10s$Éclairage$d10s$),
  ($d11n$Loc2lux Events - Location Matériels pour évènements ( Mariage, Baby shower, Fêtes privés... )$d11n$, $d11d$Éclairage à Cugnaux.
Téléphone : 09 70 70 85 45
Site web : http://www.loc2lux.fr/
Note Google : 5/5 (202 avis)
Google Maps : https://maps.google.com/?cid=392456138578651466&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d11d$, true, 43.5363318, 1.3610045, $d11a$4bis Rue Alfred Sauvy$d11a$, $d11c$Cugnaux$d11c$, $d11p$31270$d11p$, $d11g$ChIJ2WPAH7y5rhIRSunmWcdIcgU$d11g$, 5.0, 202, $d11s$Éclairage$d11s$),
  ($d12n$Smiley Musik Location : Sonorisation; Prestation Toulouse Haute -Garonne$d12n$, $d12d$Sonorisation à Toulouse.
Téléphone : 06 59 34 91 46
Site web : https://smklocation.com/
Note Google : 4.7/5 (105 avis)
Google Maps : https://maps.google.com/?cid=11189114340582915577&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d12d$, true, 43.635043599999996, 1.4311458, $d12a$130 Av. des États-Unis$d12a$, $d12c$Toulouse$d12c$, $d12p$31200$d12p$, $d12g$ChIJX7XSo5ykrhIR-X2s1TW4R5s$d12g$, 4.7, 105, $d12s$Sonorisation$d12s$),
  ($d13n$Sono Toulouse Communication$d13n$, $d13d$Sonorisation à Sainte-Foy-d'Aigrefeuille.
Téléphone : 05 62 71 05 50
Site web : https://www.sono-toulouse.com/
Google Maps : https://maps.google.com/?cid=5439360342424780403&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d13d$, true, 43.551493099999995, 1.5957983999999998, $d13a$ZA VAL DE SAUNE II, 14 Av. Maryse Bastié$d13a$, $d13c$Sainte-Foy-d'Aigrefeuille$d13c$, $d13p$31570$d13p$, $d13g$ChIJr3yWkCq-rhIRc36Tl2l9fEs$d13g$, 0, 0, $d13s$Sonorisation$d13s$),
  ($d14n$Sonopourtous$d14n$, $d14d$Sonorisation à Toulouse.
Note Google : 4/5 (1 avis)
Google Maps : https://maps.google.com/?cid=2769200606123731589&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d14d$, true, 43.6016465, 1.3893921999999999, $d14a$17 Rue du Général Lionel de Marmier$d14a$, $d14c$Toulouse$d14c$, $d14p$31300$d14p$, $d14g$ChIJqQn02_e7rhIRhSrNh0ctbiY$d14g$, 4.0, 1, $d14s$Sonorisation$d14s$),
  ($d15n$Sud Podium$d15n$, $d15d$Scène à Roques.
Téléphone : 06 18 09 74 07
Site web : http://www.sudpodium.com/
Google Maps : https://maps.google.com/?cid=14507178954157759963&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d15d$, true, 43.517097199999995, 1.3493382, $d15a$103 Rte de Villeneuve$d15a$, $d15c$Roques$d15c$, $d15p$31120$d15p$, $d15g$ChIJ500nVnS3rhIR252Yf2XaU8k$d15g$, 0, 0, $d15s$Scène$d15s$),
  ($d16n$Ultraline Events : Prestations techniques évènementielle Toulouse$d16n$, $d16d$Sonorisation à Toulouse.
Téléphone : 05 61 63 10 74
Site web : https://www.ultraline-events.com/
Note Google : 5/5 (9 avis)
Google Maps : https://maps.google.com/?cid=10586118960819939273&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d16d$, true, 43.644725, 1.4575323999999998, $d16a$84 Rue Edmond Rostand$d16a$, $d16c$Toulouse$d16c$, $d16p$31200$d16p$, $d16g$ChIJ8_BW_7WjrhIRySezcRtz6ZI$d16g$, 5.0, 9, $d16s$Sonorisation$d16s$),
  ($d17n$Équipe ATS : Atelier Technique Scène$d17n$, $d17d$Scène à Luc-la-Primaube.
Téléphone : 05 65 69 74 76
Site web : http://www.equipeats.fr/
Note Google : 4.9/5 (15 avis)
Google Maps : https://maps.google.com/?cid=12117582780270422044&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d17d$, true, 44.283836, 2.5437083, $d17a$163 Av. de Toulouse$d17a$, $d17c$Luc-la-Primaube$d17c$, $d17p$12450$d17p$, $d17g$ChIJUxxnvOR7shIRHKhoQlZNKqg$d17g$, 4.9, 15, $d17s$Scène$d17s$)
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
    where google_place_id in ($d0id$ChIJpXy87y6XrhIRI3a4hAPB2ag$d0id$, $d1id$ChIJa1u0toW9rhIRCAB2uUgUnNg$d1id$, $d2id$ChIJZxTIzvm7rhIRG4jTpn_xUfU$d2id$, $d3id$ChIJR_N05k27rhIRhuwhii8MJrY$d3id$, $d4id$ChIJZVITZQSorhIREs1XOPpbZDA$d4id$, $d5id$ChIJ9XZ_D9Hu9EcR8vqzWcKch_g$d5id$, $d6id$ChIJCw7KGEalrhIRHCuswip6_5I$d6id$, $d7id$ChIJB0hP7AqWrhIR3iHwqBhF3dg$d7id$, $d8id$ChIJSZtFEtOlrhIRtelq-jZPNZk$d8id$, $d9id$ChIJSWXb1h5Ax6sRjyJYG9FPaL0$d9id$, $d10id$ChIJ_1IvzrKkrhIR8dY4VdZPUxQ$d10id$, $d11id$ChIJ2WPAH7y5rhIRSunmWcdIcgU$d11id$, $d12id$ChIJX7XSo5ykrhIR-X2s1TW4R5s$d12id$, $d13id$ChIJr3yWkCq-rhIRc36Tl2l9fEs$d13id$, $d14id$ChIJqQn02_e7rhIRhSrNh0ctbiY$d14id$, $d15id$ChIJ500nVnS3rhIR252Yf2XaU8k$d15id$, $d16id$ChIJ8_BW_7WjrhIRySezcRtz6ZI$d16id$, $d17id$ChIJUxxnvOR7shIRHKhoQlZNKqg$d17id$)
      and latitude is not null
      and longitude is not null
      and location is null;
  elsif location_type like 'geometry%' then
    update public.craftsmans
    set location = ST_SetSRID(ST_MakePoint(longitude, latitude), 4326)
    where google_place_id in ($d0id$ChIJpXy87y6XrhIRI3a4hAPB2ag$d0id$, $d1id$ChIJa1u0toW9rhIRCAB2uUgUnNg$d1id$, $d2id$ChIJZxTIzvm7rhIRG4jTpn_xUfU$d2id$, $d3id$ChIJR_N05k27rhIRhuwhii8MJrY$d3id$, $d4id$ChIJZVITZQSorhIREs1XOPpbZDA$d4id$, $d5id$ChIJ9XZ_D9Hu9EcR8vqzWcKch_g$d5id$, $d6id$ChIJCw7KGEalrhIRHCuswip6_5I$d6id$, $d7id$ChIJB0hP7AqWrhIR3iHwqBhF3dg$d7id$, $d8id$ChIJSZtFEtOlrhIRtelq-jZPNZk$d8id$, $d9id$ChIJSWXb1h5Ax6sRjyJYG9FPaL0$d9id$, $d10id$ChIJ_1IvzrKkrhIR8dY4VdZPUxQ$d10id$, $d11id$ChIJ2WPAH7y5rhIRSunmWcdIcgU$d11id$, $d12id$ChIJX7XSo5ykrhIR-X2s1TW4R5s$d12id$, $d13id$ChIJr3yWkCq-rhIRc36Tl2l9fEs$d13id$, $d14id$ChIJqQn02_e7rhIRhSrNh0ctbiY$d14id$, $d15id$ChIJ500nVnS3rhIR252Yf2XaU8k$d15id$, $d16id$ChIJ8_BW_7WjrhIRySezcRtz6ZI$d16id$, $d17id$ChIJUxxnvOR7shIRHKhoQlZNKqg$d17id$)
      and latitude is not null
      and longitude is not null
      and location is null;
  end if;
end $$;
