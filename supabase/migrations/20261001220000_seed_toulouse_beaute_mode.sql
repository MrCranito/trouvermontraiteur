-- Seed event hair, makeup, outfits, and accessories around Toulouse.
-- Only these google_place_id values are linked to Beauté & Mode subcategories.

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
  ($d0n$AJ Makeup Artist$d0n$, $d0d$Maquilleur à Toulouse.
Téléphone : 06 76 06 76 40
Site web : https://bio.site/AJMakeupArtist
Note Google : 5/5 (11 avis)
Google Maps : https://maps.google.com/?cid=8751029686170546490&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d0d$, true, 43.5786912, 1.4806221, $d0a$70 Av. Louis Breguet$d0a$, $d0c$Toulouse$d0c$, $d0p$31400$d0p$, $d0g$ChIJGQKTH03sG6MROvEXdyLncXk$d0g$, 5.0, 11, $d0s$Maquilleur$d0s$),
  ($d1n$AMARIA - Robe de mariée Toulouse$d1n$, $d1d$Tenues à Rouffiac-Tolosan.
Téléphone : 09 83 65 12 11
Site web : http://www.amaria.fr/
Note Google : 4.7/5 (352 avis)
Google Maps : https://maps.google.com/?cid=6999057034649588367&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d1d$, true, 43.6687305, 1.5124148, $d1a$4 Imp. du Clos du Loup$d1a$, $d1c$Rouffiac-Tolosan$d1c$, $d1p$31180$d1p$, $d1g$ChIJfYrhxHyirhIRj9L8WEqlIWE$d1g$, 4.7, 352, $d1s$Tenues$d1s$),
  ($d2n$AMBRENCE - Salon de coiffure$d2n$, $d2d$Coiffeur à Toulouse.
Téléphone : 06 37 25 39 13
Site web : https://ambrence.com/
Note Google : 4.6/5 (234 avis)
Google Maps : https://maps.google.com/?cid=9127642125496713300&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d2d$, true, 43.5993749, 1.4470404, $d2a$7 Rue Tolosane$d2a$, $d2c$Toulouse$d2c$, $d2p$31000$d2p$, $d2g$ChIJ5d0oh-W7rhIRVIAfHyfmq34$d2g$, 4.6, 234, $d2s$Coiffeur$d2s$),
  ($d3n$AU TEMPLE DE LA MARIEE$d3n$, $d3d$Tenues à Toulouse.
Téléphone : 06 41 43 12 31
Site web : https://temple-de-la-mariee.lovable.app/
Note Google : 3.7/5 (59 avis)
Google Maps : https://maps.google.com/?cid=14684549341084699651&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d3d$, true, 43.715393899999995, 1.4484907999999999, $d3a$31 Rue Eugène Labiche$d3a$, $d3c$Toulouse$d3c$, $d3p$31200$d3p$, $d3g$ChIJ1WzI7AC7rhIRA8wM2tL_ycs$d3g$, 3.7, 59, $d3s$Tenues$d3s$),
  ($d4n$Addict Coiffure$d4n$, $d4d$Coiffeur à Toulouse.
Téléphone : 05 61 22 59 33
Note Google : 4.7/5 (149 avis)
Google Maps : https://maps.google.com/?cid=15928768387859654597&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d4d$, true, 43.602617300000006, 1.4473479, $d4a$6 Rue Saint-Antoine du T$d4a$, $d4c$Toulouse$d4c$, $d4p$31000$d4p$, $d4g$ChIJhVfIaJy8rhIRxafYW3RaDt0$d4g$, 4.7, 149, $d4s$Coiffeur$d4s$),
  ($d5n$Anges et Reves, Robe De Mariée À Toulouse$d5n$, $d5d$Tenues à Montrabé.
Téléphone : 09 61 60 00 54
Site web : https://www.angesetreves.fr/
Note Google : 4.8/5 (160 avis)
Google Maps : https://maps.google.com/?cid=6967849387226209431&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d5d$, true, 43.644588, 1.5451173, $d5a$All. du Luberon Centre Commercial$d5a$, $d5c$Montrabé$d5c$, $d5p$31850$d5p$, $d5g$ChIJc9fd0jGKrhIRl5wKthnGsmA$d5g$, 4.8, 160, $d5s$Tenues$d5s$),
  ($d6n$AngéliqueSMUA - Maquilleuse professionnelle à Toulouse$d6n$, $d6d$Maquilleur à Donneville.
Téléphone : 06 74 99 88 52
Site web : https://www.instagram.com/angeliquesmua/
Note Google : 5/5 (136 avis)
Google Maps : https://maps.google.com/?cid=12695770179344562166&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d6d$, true, 43.473605, 1.5488567, $d6a$4 Rue de la Voie Romaine$d6a$, $d6c$Donneville$d6c$, $d6p$31450$d6p$, $d6g$ChIJVxH3KK2VrhIR9nfUibZvMLA$d6g$, 5.0, 136, $d6s$Maquilleur$d6s$),
  ($d7n$Atelier Claire Colle - Robes de mariée uniques et sur mesure$d7n$, $d7d$Tenues à Toulouse.
Téléphone : 06 60 39 03 49
Google Maps : https://maps.google.com/?cid=10530294174913633768&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d7d$, true, 43.618683, 1.4221863, $d7a$3 Rue Jacob Insel$d7a$, $d7c$Toulouse$d7c$, $d7p$31200$d7p$, $d7g$ChIJI3IlLzi7rhIR6J0XnMIeI5I$d7g$, 0, 0, $d7s$Tenues$d7s$),
  ($d8n$Atelier Stellmach joaillerie$d8n$, $d8d$Accessoires à Toulouse.
Téléphone : 05 67 22 76 49
Site web : https://pin.it/53sgjGx
Note Google : 4.4/5 (10 avis)
Google Maps : https://maps.google.com/?cid=439955784627556501&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d8d$, true, 43.6044195, 1.4520328999999998, $d8a$13 Rue de la Colombette$d8a$, $d8c$Toulouse$d8c$, $d8p$31000$d8p$, $d8g$ChIJVwbJipm8rhIRlZCag3QJGwY$d8g$, 4.4, 10, $d8s$Accessoires$d8s$),
  ($d9n$Aureus Atelier Bijouterie Joaillerie$d9n$, $d9d$Accessoires à Toulouse.
Téléphone : 07 87 75 10 30
Site web : https://www.atelieraureus.com/
Note Google : 5/5 (10 avis)
Google Maps : https://maps.google.com/?cid=5275685303039954338&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d9d$, true, 43.597621, 1.4320496, $d9a$23 Rue Joseph Vie$d9a$, $d9c$Toulouse$d9c$, $d9p$31300$d9p$, $d9g$ChIJpe8JQ9i7rhIRog1y0tT_Nkk$d9g$, 5.0, 10, $d9s$Accessoires$d9s$),
  ($d10n$Autrement coiffure$d10n$, $d10d$Coiffeur à Toulouse.
Téléphone : 05 32 59 10 22
Site web : https://autrement-coiffure.fr/
Note Google : 4.9/5 (117 avis)
Google Maps : https://maps.google.com/?cid=10347506402710390266&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d10d$, true, 43.611837799999996, 1.4376173, $d10a$9 Rue de Toul$d10a$, $d10c$Toulouse$d10c$, $d10p$31000$d10p$, $d10g$ChIJk9ypY8G7rhIR-gWi9D-6mY8$d10g$, 4.9, 117, $d10s$Coiffeur$d10s$),
  ($d11n$BARBER LOUNGE$d11n$, $d11d$Coiffeur à Toulouse.
Téléphone : 06 67 04 74 50
Note Google : 4.9/5 (152 avis)
Google Maps : https://maps.google.com/?cid=15947515456303745060&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d11d$, true, 43.600679899999996, 1.4406185999999999, $d11a$19 Rue Peyrolières$d11a$, $d11c$Toulouse$d11c$, $d11p$31000$d11p$, $d11g$ChIJF-bLM_i7rhIRJEgJX9D0UN0$d11g$, 4.9, 152, $d11s$Coiffeur$d11s$),
  ($d12n$BIJOUTERIE DU CAPITOLE$d12n$, $d12d$Accessoires à Toulouse.
Téléphone : 05 61 21 12 72
Site web : http://www.bijouterie-du-capitole.fr/?utm_source=gmb
Note Google : 3.1/5 (55 avis)
Google Maps : https://maps.google.com/?cid=18304389150565059442&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d12d$, true, 43.6043406, 1.4426037, $d12a$12 Pl. du Capitole$d12a$, $d12c$Toulouse$d12c$, $d12p$31000$d12p$, $d12g$ChIJZ8onHWK7rhIRcsvxnfNABv4$d12g$, 3.1, 55, $d12s$Accessoires$d12s$),
  ($d13n$Bea Mothes Coiffeuse visagiste spécialisée dans le mariage et le chignon Montastruc la conseillère$d13n$, $d13d$Coiffeur à Montastruc-la-Conseillère.
Téléphone : 06 18 43 55 27
Site web : http://beamothes.fr/
Note Google : 5/5 (161 avis)
Google Maps : https://maps.google.com/?cid=11794776212015628012&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d13d$, true, 43.7183327, 1.5774466, $d13a$1293 D888 D888$d13a$, $d13c$Montastruc-la-Conseillère$d13c$, $d13p$31380$d13p$, $d13g$ChIJNXVTyL2erhIR7D5rMnl2r6M$d13g$, 5.0, 161, $d13s$Coiffeur$d13s$),
  ($d14n$Beautymakeup maquilleuse Toulouse$d14n$, $d14d$Maquilleur à Saint-Jean.
Téléphone : 06 10 92 85 14
Site web : https://www.beautymakeup.fr/
Note Google : 4.9/5 (28 avis)
Google Maps : https://maps.google.com/?cid=7878384522481038960&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d14d$, true, 43.6651296, 1.493968, $d14a$19 Chem. de Verdale$d14a$, $d14c$Saint-Jean$d14c$, $d14p$31240$d14p$, $d14g$ChIJhcWAsmGkrhIRcPZqUvukVW0$d14g$, 4.9, 28, $d14s$Maquilleur$d14s$),
  ($d15n$Bijouterie AMOR$d15n$, $d15d$Accessoires à Toulouse.
Téléphone : 05 62 87 93 18
Site web : http://bijouterieamor.fr/
Note Google : 4.7/5 (53 avis)
Google Maps : https://maps.google.com/?cid=6753199104713322818&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d15d$, true, 43.5977555, 1.4291339, $d15a$6 Av. Etienne Billières$d15a$, $d15c$Toulouse$d15c$, $d15p$31300$d15p$, $d15g$ChIJM-ONdfa7rhIRQnHsRc4uuF0$d15g$, 4.7, 53, $d15s$Accessoires$d15s$),
  ($d16n$Bijouterie Joaillerie Mohedano$d16n$, $d16d$Accessoires à Toulouse.
Téléphone : 05 61 23 04 82
Site web : https://www.j-mohedano.com/
Note Google : 4.6/5 (181 avis)
Google Maps : https://maps.google.com/?cid=15063665690011767895&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d16d$, true, 43.6009318, 1.4451355, $d16a$46 Rue des Tourneurs$d16a$, $d16c$Toulouse$d16c$, $d16p$31000$d16p$, $d16g$ChIJXWUtFp28rhIRVxRkZCLkDNE$d16g$, 4.6, 181, $d16s$Accessoires$d16s$),
  ($d17n$Bijouterie Pujol$d17n$, $d17d$Accessoires à Toulouse.
Téléphone : 05 62 73 70 70
Site web : http://bijouteriepujol.fr/
Note Google : 4.5/5 (593 avis)
Google Maps : https://maps.google.com/?cid=9556570923531229226&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d17d$, true, 43.609164, 1.4459819, $d17a$3 Pl. Jeanne d'Arc$d17a$, $d17c$Toulouse$d17c$, $d17p$31000$d17p$, $d17g$ChIJhWFe2aG8rhIRKtjnP5_Cn4Q$d17g$, 4.5, 593, $d17s$Accessoires$d17s$),
  ($d18n$Bijouterie Subra, Guilde des Orfèvres$d18n$, $d18d$Accessoires à Toulouse.
Téléphone : 05 61 23 51 42
Site web : https://guildedesorfevres.fr/bijouterie/toulouse-1554M
Note Google : 4.6/5 (106 avis)
Google Maps : https://maps.google.com/?cid=17373261812219780591&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d18d$, true, 43.606973, 1.4459410000000001, $d18a$3 Rue du Salé$d18a$, $d18c$Toulouse$d18c$, $d18p$31000$d18p$, $d18g$ChIJiTicqp-8rhIR7x04G5I5GvE$d18g$, 4.6, 106, $d18s$Accessoires$d18s$),
  ($d19n$Bijoutier Joaillier$d19n$, $d19d$Accessoires à Toulouse.
Téléphone : 06 27 59 04 09
Note Google : 5/5 (5 avis)
Google Maps : https://maps.google.com/?cid=10316076603406235963&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d19d$, true, 43.606222599999995, 1.445009, $d19a$7 Rue Rivals$d19a$, $d19c$Toulouse$d19c$, $d19p$31000$d19p$, $d19g$ChIJtaz5RZ68rhIROzm_jQMRKo8$d19g$, 5.0, 5, $d19s$Accessoires$d19s$),
  ($d20n$Bijoux D Hier et D Aujourd Hui$d20n$, $d20d$Accessoires à Toulouse.
Téléphone : 05 61 21 96 79
Site web : https://www.bijouxdhieretdaujourdhui.fr/?utm_source=gmb
Note Google : 4.8/5 (50 avis)
Google Maps : https://maps.google.com/?cid=10838756603170390170&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d20d$, true, 43.601057399999995, 1.4449037999999998, $d20a$45 Rue des Tourneurs$d20a$, $d20c$Toulouse$d20c$, $d20p$31000$d20p$, $d20g$ChIJC2onFZ28rhIRmgDkUrT_apY$d20g$, 4.8, 50, $d20s$Accessoires$d20s$),
  ($d21n$Bérangère A. - Créatrice Robes de Mariée sur mesure à Toulouse$d21n$, $d21d$Tenues à Toulouse.
Téléphone : 06 51 16 42 47
Site web : http://www.berangere-a.com/?utm_source=google&utm_medium=wix_google_business_profile&utm_campaign=14526656863062538736
Note Google : 4.9/5 (38 avis)
Google Maps : https://maps.google.com/?cid=10743381584513177368&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d21d$, true, 43.548860499999996, 1.3835129, $d21a$56 Chem. de Tucaut$d21a$, $d21c$Toulouse$d21c$, $d21p$31100$d21p$, $d21g$ChIJCwY2kvS5rhIRGJdhV6EoGJU$d21g$, 4.9, 38, $d21s$Tenues$d21s$),
  ($d22n$Camille Albane - Coiffeur Toulouse rémusat$d22n$, $d22d$Coiffeur à Toulouse.
Téléphone : 05 62 27 03 93
Site web : https://salon.camillealbane.com/fr/salon-coiffure/toulouse-remusat?utm_campaign=MyBusinessYext&utm_medium=HP&utm_source=157301&y_source=1_MTUxMDAyNzctNzE1LWxvY2F0aW9uLndlYnNpdGU%3D
Note Google : 4.4/5 (101 avis)
Google Maps : https://maps.google.com/?cid=16028499018312799984&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d22d$, true, 43.606744, 1.4450999999999998, $d22a$42 Rue Charles de Rémusat$d22a$, $d22c$Toulouse$d22c$, $d22p$31000$d22p$, $d22g$ChIJgzdxS568rhIR8FY7Pe-qcN4$d22g$, 4.4, 101, $d22s$Coiffeur$d22s$),
  ($d23n$Camille Albane - Coiffeur Toulouse-ozenne$d23n$, $d23d$Coiffeur à Toulouse.
Téléphone : 05 34 31 24 97
Site web : https://salon.camillealbane.com/coiffeur/toulouse-ozenne/?utm_campaign=MyBusinessYext&utm_medium=HP&utm_source=150235&y_source=1_MTUxMDAxMjQtNzE1LWxvY2F0aW9uLndlYnNpdGU%3D
Note Google : 4.5/5 (94 avis)
Google Maps : https://maps.google.com/?cid=16375596876088671812&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d23d$, true, 43.596334299999995, 1.4474017, $d23a$19 Rue Théodore Ozenne$d23a$, $d23c$Toulouse$d23c$, $d23p$31000$d23p$, $d23g$ChIJuSFolIO8rhIRRP5C4JjOQeM$d23g$, 4.5, 94, $d23s$Coiffeur$d23s$),
  ($d24n$Carrière Mariage - Robes de Mariée$d24n$, $d24d$Tenues à Villefranche-de-Lauragais.
Téléphone : 05 61 81 64 04
Site web : https://www.carriere-mariage.com/
Note Google : 4.7/5 (509 avis)
Google Maps : https://maps.google.com/?cid=6983342255684854575&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d24d$, true, 43.39799, 1.7182857, $d24a$4 Rue Pierre Bélinguier$d24a$, $d24c$Villefranche-de-Lauragais$d24c$, $d24p$31290$d24p$, $d24g$ChIJuSWDDNTzrhIRLyMSP8jQ6WA$d24g$, 4.7, 509, $d24s$Tenues$d24s$),
  ($d25n$Christophe Versolato - Salon de coiffure & Concept Store$d25n$, $d25d$Coiffeur à Toulouse.
Téléphone : 05 61 21 24 13
Site web : http://www.christopheversolato.com/
Note Google : 4.4/5 (250 avis)
Google Maps : https://maps.google.com/?cid=8414873936767077107&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d25d$, true, 43.602917999999995, 1.4472231, $d25a$9 Rue Saint-Antoine du T$d25a$, $d25c$Toulouse$d25c$, $d25p$31000$d25p$, $d25g$ChIJxXHnQ5y8rhIR88qx9kKjx3Q$d25g$, 4.4, 250, $d25s$Coiffeur$d25s$),
  ($d26n$Clémence CL Maquilleuse$d26n$, $d26d$Maquilleur à L'Union.
Téléphone : 07 49 20 72 91
Site web : https://www.clemencecl.fr/
Note Google : 5/5 (31 avis)
Google Maps : https://maps.google.com/?cid=16729148211986898634&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d26d$, true, 43.659768899999996, 1.4723051, $d26a$22 Rue des Tilleuls$d26a$, $d26c$L'Union$d26c$, $d26p$31240$d26p$, $d26g$ChIJD3b5HxEiYGoRyh5X-qnfKeg$d26g$, 5.0, 31, $d26s$Maquilleur$d26s$),
  ($d27n$Coiffure du Monde$d27n$, $d27d$Coiffeur à Toulouse.
Téléphone : 05 61 12 28 83
Site web : https://www.jca-community.fr/
Note Google : 4/5 (390 avis)
Google Maps : https://maps.google.com/?cid=4496674782846743883&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d27d$, true, 43.6057203, 1.4441479, $d27a$15 Rue Charles de Rémusat$d27a$, $d27c$Toulouse$d27c$, $d27p$31000$d27p$, $d27g$ChIJnZQQPZ68rhIRS3UJ_uNlZz4$d27g$, 4.0, 390, $d27s$Coiffeur$d27s$),
  ($d28n$Couture & Mariage Robe de mariée Toulouse$d28n$, $d28d$Tenues à Plaisance-du-Touch.
Téléphone : 07 70 52 70 02
Site web : http://www.couture-mariage.com/
Note Google : 4.9/5 (91 avis)
Google Maps : https://maps.google.com/?cid=4493945790812349531&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d28d$, true, 43.5651685, 1.2967304, $d28a$5 Rue de la Pradette$d28a$, $d28c$Plaisance-du-Touch$d28c$, $d28p$31830$d28p$, $d28g$ChIJXx_u4um6rhIRW2Q7BeOzXT4$d28g$, 4.9, 91, $d28s$Tenues$d28s$),
  ($d29n$Créations Laurie Elma : Créations robe de mariée Toulouse$d29n$, $d29d$Tenues à Toulouse.
Téléphone : 07 81 17 04 04
Site web : https://www.creationslaurieelma.com/
Note Google : 5/5 (20 avis)
Google Maps : https://maps.google.com/?cid=10626719810798458162&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d29d$, true, 43.597904299999996, 1.4192300999999998, $d29a$43 Av. de Grande Bretagne$d29a$, $d29c$Toulouse$d29c$, $d29p$31300$d29p$, $d29g$ChIJLbKdMHC7rhIRMpU_el2xeZM$d29g$, 5.0, 20, $d29s$Tenues$d29s$),
  ($d30n$Cymbeline Toulouse - Robe de mariée$d30n$, $d30d$Tenues à Toulouse.
Téléphone : 05 61 62 65 38
Site web : https://cymbeline.com/fr/stores/cymbeline-toulouse-6/?utm_source=GoogleMaps
Note Google : 4.7/5 (211 avis)
Google Maps : https://maps.google.com/?cid=7142657287450909701&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d30d$, true, 43.600151499999996, 1.4552543000000002, $d30a$3 Rue de la Charité$d30a$, $d30c$Toulouse$d30c$, $d30p$31000$d30p$, $d30g$ChIJiasYMpC8rhIRBdzdovXQH2M$d30g$, 4.7, 211, $d30s$Tenues$d30s$),
  ($d31n$D-JI HAIR EVOLUTION Toulouse$d31n$, $d31d$Coiffeur à Toulouse.
Téléphone : 06 58 14 08 54
Note Google : 4.9/5 (148 avis)
Google Maps : https://maps.google.com/?cid=7257570945568933668&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d31d$, true, 43.5971514, 1.4568419, $d31a$36 Port Saint-Sauveur$d31a$, $d31c$Toulouse$d31c$, $d31p$31000$d31p$, $d31g$ChIJXeP8-Ge9rhIRJAfVnlISuGQ$d31g$, 4.9, 148, $d31s$Coiffeur$d31s$),
  ($d32n$DESSANGE - Coiffeur Toulouse$d32n$, $d32d$Coiffeur à Toulouse.
Téléphone : 05 61 62 91 31
Site web : https://salon.dessange.com/fr/salon-coiffure/toulouse-baragnon/
Note Google : 4.4/5 (152 avis)
Google Maps : https://maps.google.com/?cid=6031247552007816908&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d32d$, true, 43.599843, 1.44651, $d32a$8 Rue Croix Baragnon$d32a$, $d32c$Toulouse$d32c$, $d32p$31000$d32p$, $d32g$ChIJNXPE0py8rhIRzMbekbFLs1M$d32g$, 4.4, 152, $d32s$Coiffeur$d32s$),
  ($d33n$DMM 212 - Dans Mon Monde // Coiffeur mixte à Toulouse$d33n$, $d33d$Coiffeur à Toulouse.
Téléphone : 05 34 65 74 47
Site web : https://www.planity.com/dmm-212-31400-toulouse
Note Google : 4.7/5 (160 avis)
Google Maps : https://maps.google.com/?cid=16109467567419121890&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d33d$, true, 43.597553999999995, 1.4584563, $d33a$71 Rue Louis Vitet$d33a$, $d33c$Toulouse$d33c$, $d33p$31400$d33p$, $d33g$ChIJt-g_6HW9rhIR4mCxpGZTkN8$d33g$, 4.7, 160, $d33s$Coiffeur$d33s$),
  ($d34n$Delphine Josse — Créatrice de Robes de Mariée & Sur-Mesure • Toulouse$d34n$, $d34d$Tenues à Toulouse.
Téléphone : 06 22 06 28 15
Site web : https://delphinejosse.com/
Note Google : 5/5 (65 avis)
Google Maps : https://maps.google.com/?cid=12709967385264337541&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d34d$, true, 43.598054, 1.448859, $d34a$9 Pl. Saintes-Scarbes$d34a$, $d34c$Toulouse$d34c$, $d34p$31000$d34p$, $d34g$ChIJabh_DH-8rhIRhTJ7If_fYrA$d34g$, 5.0, 65, $d34s$Tenues$d34s$),
  ($d35n$Diva la mariée$d35n$, $d35d$Tenues à Toulouse.
Téléphone : 05 61 23 97 58
Site web : https://www.diva-la-mariee.fr/
Note Google : 3.8/5 (65 avis)
Google Maps : https://maps.google.com/?cid=14114612195295957194&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d35d$, true, 43.602134299999996, 1.4411185, $d35a$54 Rue Peyrolières$d35a$, $d35c$Toulouse$d35c$, $d35p$31000$d35p$, $d35g$ChIJqQ4PU2K7rhIRyhADWwIt4cM$d35g$, 3.8, 65, $d35s$Tenues$d35s$),
  ($d36n$Dorise Joaillier$d36n$, $d36d$Accessoires à Toulouse.
Téléphone : 05 61 52 38 03
Site web : http://www.dorise-joaillier.com/
Note Google : 4.3/5 (125 avis)
Google Maps : https://maps.google.com/?cid=8013574631137244845&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d36d$, true, 43.5996545, 1.4482355, $d36a$41 Rue Croix Baragnon$d36a$, $d36c$Toulouse$d36c$, $d36p$31000$d36p$, $d36g$ChIJJzZjVZu8rhIRrXYEVqvvNW8$d36g$, 4.3, 125, $d36s$Accessoires$d36s$),
  ($d37n$Eliz Maquilleuse professionel - Eliz Makeup Artist$d37n$, $d37d$Maquilleur à Toulouse.
Téléphone : 07 61 50 01 99
Site web : https://www.instagram.com/eliz_make_up_artist/
Note Google : 5/5 (14 avis)
Google Maps : https://maps.google.com/?cid=16073777680440481763&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d37d$, true, 43.566065099999996, 1.4985963, $d37a$Rue Rolande Trempé$d37a$, $d37c$Toulouse$d37c$, $d37p$31400$d37p$, $d37g$ChIJlef7odO9rhIR49dBSaOHEd8$d37g$, 5.0, 14, $d37s$Maquilleur$d37s$),
  ($d38n$Flawless touch - maquilleuse Toulouse$d38n$, $d38d$Maquilleur à Toulouse.
Téléphone : 06 82 99 63 08
Site web : https://flawless-touch-studio31.as.me/
Note Google : 5/5 (9 avis)
Google Maps : https://maps.google.com/?cid=9800066126407353431&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d38d$, true, 43.6362764, 1.4464237, $d38a$155 Chem. de Lanusse$d38a$, $d38c$Toulouse$d38c$, $d38p$31200$d38p$, $d38g$ChIJOZC18r6jrhIRV0TZDzjUAIg$d38g$, 5.0, 9, $d38s$Maquilleur$d38s$),
  ($d39n$Franck Provost - Coiffeur Toulouse$d39n$, $d39d$Coiffeur à Toulouse.
Téléphone : 05 61 62 62 47
Site web : https://www.franckprovost.com/salons/2-rue-d-aubuisson-31000-toulouse?utm_campaign=gbp_siteweb_P0260&utm_id=gbp_siteweb&utm_medium=siteweb&utm_source=gbp
Note Google : 4.7/5 (515 avis)
Google Maps : https://maps.google.com/?cid=1977081751397525511&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d39d$, true, 43.6037734, 1.4510874999999999, $d39a$2 Rue d'Aubuisson$d39a$, $d39c$Toulouse$d39c$, $d39p$31000$d39p$, $d39g$ChIJcbqgiuO6rhIRB-j0u2ABcBs$d39g$, 4.7, 515, $d39s$Coiffeur$d39s$),
  ($d40n$Frayssinet Joaillier$d40n$, $d40d$Accessoires à Toulouse.
Téléphone : 05 61 53 99 04
Site web : http://www.frayssinet-joaillier.fr/
Note Google : 4.4/5 (141 avis)
Google Maps : https://maps.google.com/?cid=6729414046637403470&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d40d$, true, 43.5984203, 1.4454072999999998, $d40a$33 Rue du Languedoc$d40a$, $d40c$Toulouse$d40c$, $d40p$31000$d40p$, $d40g$ChIJBY6Y3YK8rhIRTq1Y5GuuY10$d40g$, 4.4, 141, $d40s$Accessoires$d40s$),
  ($d41n$Frayssinet Joaillier Capitole$d41n$, $d41d$Accessoires à Toulouse.
Téléphone : 05 61 53 99 04
Site web : http://www.frayssinet-joaillier.fr/
Note Google : 4.6/5 (54 avis)
Google Maps : https://maps.google.com/?cid=510440365194060234&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d41d$, true, 43.6038521, 1.4443791, $d41a$73 Rue de la Pomme$d41a$, $d41c$Toulouse$d41c$, $d41p$31000$d41p$, $d41g$ChIJjSwa5p28rhIRyqFpxs5yFQc$d41g$, 4.6, 54, $d41s$Accessoires$d41s$),
  ($d42n$Gabriel Joaillier$d42n$, $d42d$Accessoires à Toulouse.
Téléphone : 09 73 54 89 43
Site web : https://www.gabriel-joaillier.com/
Note Google : 4.9/5 (220 avis)
Google Maps : https://maps.google.com/?cid=3454626604603104745&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d42d$, true, 43.60746830000001, 1.4464434, $d42a$27 Bd de Strasbourg 2 étage$d42a$, $d42c$Toulouse$d42c$, $d42p$31000$d42p$, $d42g$ChIJL-ZvT-i9rhIR6V377pdM8S8$d42g$, 4.9, 220, $d42s$Accessoires$d42s$),
  ($d43n$Graines de Beau M - bijoux$d43n$, $d43d$Accessoires à Toulouse.
Téléphone : 06 85 23 99 01
Site web : http://www.grainesdebeaum.fr/
Note Google : 5/5 (131 avis)
Google Maps : https://maps.google.com/?cid=5299521771302979299&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d43d$, true, 43.604839, 1.4538993999999998, $d43a$4 Rue Albanie Regourd$d43a$, $d43c$Toulouse$d43c$, $d43p$31000$d43p$, $d43g$ChIJ1TbwgJ28rhIR44b2Efmui0k$d43g$, 5.0, 131, $d43s$Accessoires$d43s$),
  ($d44n$Hair Mind$d44n$, $d44d$Coiffeur à Toulouse.
Téléphone : 05 61 23 42 75
Site web : https://www.salonhairmind.com/
Note Google : 4.6/5 (255 avis)
Google Maps : https://maps.google.com/?cid=12975111161291258098&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d44d$, true, 43.6047988, 1.4418651, $d44a$4 Rue Jean-Antoine Romiguières$d44a$, $d44c$Toulouse$d44c$, $d44p$31000$d44p$, $d44g$ChIJTcX-i2G7rhIR8rj4KdvaELQ$d44g$, 4.6, 255, $d44s$Coiffeur$d44s$),
  ($d45n$JOSLAYHAIR & BEAUTY$d45n$, $d45d$Coiffeur à Toulouse.
Téléphone : 05 34 30 07 77
Site web : https://www.joslayhairbeauty.com/
Note Google : 4.7/5 (240 avis)
Google Maps : https://maps.google.com/?cid=1495192557402580674&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d45d$, true, 43.635312, 1.4726074, $d45a$24 Rue André Vasseur$d45a$, $d45c$Toulouse$d45c$, $d45p$31200$d45p$, $d45g$ChIJfwtn1TGjrhIRwubJhrX9vxQ$d45g$, 4.7, 240, $d45s$Coiffeur$d45s$),
  ($d46n$Joaillerie Gemmyo - Toulouse$d46n$, $d46d$Accessoires à Toulouse.
Téléphone : 01 42 46 90 89
Site web : https://www.gemmyo.com/
Note Google : 4.7/5 (113 avis)
Google Maps : https://maps.google.com/?cid=1975240862250822451&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d46d$, true, 43.6010287, 1.448083, $d46a$36 Rue Boulbonne$d46a$, $d46c$Toulouse$d46c$, $d46p$31000$d46p$, $d46g$ChIJpYUEU6-9rhIRM-tLVBl3aRs$d46g$, 4.7, 113, $d46s$Accessoires$d46s$),
  ($d47n$Joaillerie Hucteau$d47n$, $d47d$Accessoires à Toulouse.
Téléphone : 05 61 55 22 82
Site web : https://joailleriehucteau.com/
Note Google : 5/5 (17 avis)
Google Maps : https://maps.google.com/?cid=15337997045728814506&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d47d$, true, 43.5974672, 1.4485097, $d47a$20 Rue Perchepinte$d47a$, $d47c$Toulouse$d47c$, $d47p$31000$d47p$, $d47g$ChIJM7-Myra9rhIRqiWohAyD29Q$d47g$, 5.0, 17, $d47s$Accessoires$d47s$),
  ($d48n$Joaillerie PIQUEMAL BARON SARL CARLA$d48n$, $d48d$Accessoires à Toulouse.
Téléphone : 05 61 52 77 47
Site web : https://www.joailleriepiquemalbaron.com/
Note Google : 4.5/5 (68 avis)
Google Maps : https://maps.google.com/?cid=439830332723433765&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d48d$, true, 43.5996652, 1.4474806999999998, $d48a$27 Rue Croix Baragnon$d48a$, $d48c$Toulouse$d48c$, $d48p$31000$d48p$, $d48g$ChIJEdd1s5y8rhIRJRFsd1uXGgY$d48g$, 4.5, 68, $d48s$Accessoires$d48s$),
  ($d49n$Joaillerie Zeina Toulouse$d49n$, $d49d$Accessoires à Toulouse.
Téléphone : 05 82 95 09 00
Site web : https://www.zeina-alliances.com/pages/boutique/toulouse?utm_source=googlebusinessprofile&utm_medium=organic&utm_campaign=toulouse
Note Google : 4.7/5 (177 avis)
Google Maps : https://maps.google.com/?cid=3520553124417566117&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d49d$, true, 43.5999859, 1.4472817, $d49a$4 Rue des Arts$d49a$, $d49c$Toulouse$d49c$, $d49p$31000$d49p$, $d49g$ChIJHYHytpy8rhIRpfXM-WmE2zA$d49g$, 4.7, 177, $d49s$Accessoires$d49s$),
  ($d50n$Jollof Coiffure Afro - Européen$d50n$, $d50d$Coiffeur à Toulouse.
Téléphone : 09 83 54 26 32
Note Google : 4.7/5 (75 avis)
Google Maps : https://maps.google.com/?cid=5609699888103578417&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d50d$, true, 43.5986814, 1.433521, $d50a$12 Rue Reclusane$d50a$, $d50c$Toulouse$d50c$, $d50p$31300$d50p$, $d50g$ChIJe56GltC7rhIRMVv2plOo2U0$d50g$, 4.7, 75, $d50s$Coiffeur$d50s$),
  ($d51n$L'Institut de Coiffure$d51n$, $d51d$Coiffeur à Toulouse.
Téléphone : 05 61 21 64 04
Note Google : 4.4/5 (107 avis)
Google Maps : https://maps.google.com/?cid=12947111050404594795&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d51d$, true, 43.605201699999995, 1.4436238, $d51a$3 Rue Charles de Rémusat$d51a$, $d51c$Toulouse$d51c$, $d51p$31000$d51p$, $d51g$ChIJTUNVHJ68rhIRa4TmUudgrbM$d51g$, 4.4, 107, $d51s$Coiffeur$d51s$),
  ($d52n$LA VILLA SORIANO • Coiffure & Esthétique$d52n$, $d52d$Coiffeur à Toulouse.
Téléphone : 05 34 33 53 03
Site web : https://www.lavillasoriano.fr/
Note Google : 4.5/5 (314 avis)
Google Maps : https://maps.google.com/?cid=4249942750708488846&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d52d$, true, 43.6017848, 1.4468497999999999, $d52a$17 Rue des Arts$d52a$, $d52c$Toulouse$d52c$, $d52p$31000$d52p$, $d52g$ChIJlYnN9Zy8rhIRjtq5I2rU-jo$d52g$, 4.5, 314, $d52s$Coiffeur$d52s$),
  ($d53n$LE STUDIO (anciennement Art Coiffure)$d53n$, $d53d$Coiffeur à Toulouse.
Téléphone : 05 61 23 42 60
Site web : https://www.joslayhair.com/studio-coiffure-coloration-soins-boucles-toulouse
Note Google : 4.7/5 (74 avis)
Google Maps : https://maps.google.com/?cid=286201737097198433&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d53d$, true, 43.607208, 1.4311099999999999, $d53a$10 Bd Maréchal Leclerc$d53a$, $d53c$Toulouse$d53c$, $d53p$31000$d53p$, $d53g$ChIJ4-VKCGm7rhIRYTvHqfbK-AM$d53g$, 4.7, 74, $d53s$Coiffeur$d53s$),
  ($d54n$LIUQI | Robe de mariée | Robe de soirée sur-mesure$d54n$, $d54d$Tenues à Toulouse.
Site web : https://www.liuqi-toulouse.com/
Note Google : 5/5 (1 avis)
Google Maps : https://maps.google.com/?cid=8895990987945294748&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d54d$, true, 43.6396498, 1.4689914, $d54a$FR, 2 Imp. Petit Jacques$d54a$, $d54c$Toulouse$d54c$, $d54p$31200$d54p$, $d54g$ChIJC2KD16y_rhIRnDuOqavodHs$d54g$, 5.0, 1, $d54s$Tenues$d54s$),
  ($d55n$La Belle Boucle Toulouse - Boutique et salon de coiffure cheveux bouclés, ondulés, frisés, crépus$d55n$, $d55d$Coiffeur à Toulouse.
Site web : https://labelleboucle.fr/pages/boutique/la-belle-boucle-studio-toulouse?utm_source=gmb
Note Google : 4.8/5 (535 avis)
Google Maps : https://maps.google.com/?cid=14617620906228940438&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d55d$, true, 43.6022616, 1.4420058, $d55a$13 Rue Sainte-Ursule$d55a$, $d55c$Toulouse$d55c$, $d55p$31000$d55p$, $d55g$ChIJCT2yHwC7rhIRln4ZScQ43Mo$d55g$, 4.8, 535, $d55s$Coiffeur$d55s$),
  ($d56n$La Brigade du Tif salon de coiffure végétal et tarification non genrés$d56n$, $d56d$Coiffeur à Toulouse.
Téléphone : 06 70 24 34 09
Site web : http://labrigadedutif.com/
Note Google : 4.7/5 (196 avis)
Google Maps : https://maps.google.com/?cid=18294589318446211689&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d56d$, true, 43.6078152, 1.4284903, $d56a$24 Av. Paul Séjourné$d56a$, $d56c$Toulouse$d56c$, $d56p$31000$d56p$, $d56g$ChIJwdvkJGq7rhIRaWKkZQ5w4_0$d56g$, 4.7, 196, $d56s$Coiffeur$d56s$),
  ($d57n$La Suite Le coiffeur$d57n$, $d57d$Coiffeur à L'Union.
Téléphone : 06 40 32 07 61
Site web : http://www.lasuitelecoiffeur.com/
Note Google : 4.9/5 (178 avis)
Google Maps : https://maps.google.com/?cid=16815748692035387304&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d57d$, true, 43.6621364, 1.4781339999999998, $d57a$7 bis Chem. du Sablet$d57a$, $d57c$L'Union$d57c$, $d57p$31240$d57p$, $d57g$ChIJlZwZCDejrhIRqD8CfVeKXek$d57g$, 4.9, 178, $d57s$Coiffeur$d57s$),
  ($d58n$Lazorthes Coiffure$d58n$, $d58d$Coiffeur à Toulouse.
Téléphone : 05 61 22 72 03
Site web : https://lazorthes.com/
Note Google : 4.7/5 (193 avis)
Google Maps : https://maps.google.com/?cid=10062672372652184075&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d58d$, true, 43.60733, 1.4460575, $d58a$27 Rue du Rem Matabiau$d58a$, $d58c$Toulouse$d58c$, $d58p$31000$d58p$, $d58g$ChIJy14FDJ-8rhIRCxISZzXLpYs$d58g$, 4.7, 193, $d58s$Coiffeur$d58s$),
  ($d59n$Le Coven de Hele (Salon de coiffure privé)$d59n$, $d59d$Coiffeur à Toulouse.
Téléphone : 06 08 55 98 32
Site web : https://www.lecovendehele.fr/
Note Google : 4.8/5 (101 avis)
Google Maps : https://maps.google.com/?cid=133214368349365248&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d59d$, true, 43.6395108, 1.4541737, $d59a$8 Rue Bertran$d59a$, $d59c$Toulouse$d59c$, $d59p$31200$d59p$, $d59g$ChIJQ4I-a9OlrhIRACRxIMNF2QE$d59g$, 4.8, 101, $d59s$Coiffeur$d59s$),
  ($d60n$Le Royaume de l'Homme Coiffure Delagarde$d60n$, $d60d$Coiffeur à Toulouse.
Téléphone : 09 83 67 63 77
Site web : https://www.planity.com/le-royaume-de-lhomme-31000-toulouse
Note Google : 4.9/5 (80 avis)
Google Maps : https://maps.google.com/?cid=713548344249737544&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d60d$, true, 43.6057054, 1.4344578, $d60a$1 Bd Armand Duportal$d60a$, $d60c$Toulouse$d60c$, $d60p$31000$d60p$, $d60g$ChIJ0QaOJXi7rhIRSOESRXAI5wk$d60g$, 4.9, 80, $d60s$Coiffeur$d60s$),
  ($d61n$Les Comètes tenues mariée et cérémonie / Sur rendez vous$d61n$, $d61d$Tenues à Toulouse.
Téléphone : 06 99 04 90 77
Site web : https://lescometes-mariage.fr/
Note Google : 5/5 (20 avis)
Google Maps : https://maps.google.com/?cid=5948849191504361108&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d61d$, true, 43.614135399999995, 1.4444010999999999, $d61a$39 Rue du Printemps$d61a$, $d61c$Toulouse$d61c$, $d61p$31000$d61p$, $d61g$ChIJgUff_ba9rhIRlLb8QdKOjlI$d61g$, 5.0, 20, $d61s$Tenues$d61s$),
  ($d62n$Les Mariées de Julie$d62n$, $d62d$Tenues à Toulouse.
Téléphone : 07 71 59 59 83
Site web : https://www.lesmarieesdejulie.com/
Note Google : 5/5 (14 avis)
Google Maps : https://maps.google.com/?cid=16484073977896961944&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d62d$, true, 43.6054983, 1.4457889, $d62a$36 Rue d'Alsace Lorraine$d62a$, $d62c$Toulouse$d62c$, $d62p$31000$d62p$, $d62g$ChIJ0xNmTby9rhIRmAfPT_Ixw-Q$d62g$, 5.0, 14, $d62s$Tenues$d62s$),
  ($d63n$Les Mariées de Sandrillon$d63n$, $d63d$Tenues à Aucamville.
Téléphone : 06 43 69 53 23
Site web : https://les-mariees-de-sandrillon.fr/
Note Google : 5/5 (80 avis)
Google Maps : https://maps.google.com/?cid=13499820955406271412&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d63d$, true, 43.802935399999996, 1.2151911, $d63a$8 Pl. de la Liberté$d63a$, $d63c$Aucamville$d63c$, $d63p$82600$d63p$, $d63g$ChIJgU82evoBrBIRtINdQqL_WLs$d63g$, 5.0, 80, $d63s$Tenues$d63s$),
  ($d64n$Les Roses de Louise - Robes de mariées & Sur-mesure Toulouse$d64n$, $d64d$Tenues à Toulouse.
Téléphone : 06 61 24 99 83
Site web : https://www.lesrosesdelouise.fr/sur-mesure/
Note Google : 5/5 (45 avis)
Google Maps : https://maps.google.com/?cid=413334358924559394&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d64d$, true, 43.6207796, 1.4407546999999998, $d64a$6 Imp. Belou$d64a$, $d64c$Toulouse$d64c$, $d64p$31200$d64p$, $d64g$ChIJVVVVVem6rhIRIoQp1Wh1vAU$d64g$, 5.0, 45, $d64s$Tenues$d64s$),
  ($d65n$Lola Nt maquilleuse professionnelle$d65n$, $d65d$Maquilleur à Toulouse.
Site web : https://instagram.com/lolant_makeuppro?igshid=ts0d64ku8r5m
Note Google : 5/5 (191 avis)
Google Maps : https://maps.google.com/?cid=17274934651464340747&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d65d$, true, 43.5737484, 1.4870096000000002, $d65a$44 Rue Emile Lecrivain$d65a$, $d65c$Toulouse$d65c$, $d65p$31400$d65p$, $d65g$ChIJ3cEReFC9rhIRC1We-onlvO8$d65g$, 5.0, 191, $d65s$Maquilleur$d65s$),
  ($d66n$Louise Dentelle - Robe de Mariée$d66n$, $d66d$Tenues à Toulouse.
Téléphone : 06 47 94 76 02
Site web : https://louisedentelle.com/
Note Google : 5/5 (50 avis)
Google Maps : https://maps.google.com/?cid=4349181532927157019&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d66d$, true, 43.5955723, 1.4707542999999998, $d66a$13 Rue Saint-Paër$d66a$, $d66c$Toulouse$d66c$, $d66p$31500$d66p$, $d66g$ChIJ6a-bMLO9rhIRG-PPrY9lWzw$d66g$, 5.0, 50, $d66s$Tenues$d66s$),
  ($d67n$Léa Paloma - Créatrice robe de Mariée$d67n$, $d67d$Tenues à Toulouse.
Téléphone : 06 87 00 95 38
Site web : https://www.leapaloma.com/
Note Google : 5/5 (3 avis)
Google Maps : https://maps.google.com/?cid=16365802505511394154&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d67d$, true, 43.597700200000006, 1.4441581, $d67a$9 Pl. des Carmes$d67a$, $d67c$Toulouse$d67c$, $d67p$31000$d67p$, $d67g$ChIJt8NW6XS9rhIRals0RasCH-M$d67g$, 5.0, 3, $d67s$Tenues$d67s$),
  ($d68n$MB COIFFURE$d68n$, $d68d$Coiffeur à Toulouse.
Téléphone : 05 62 83 69 04
Site web : https://www.planity.com/mb-coiffure-31300-toulouse
Note Google : 4.7/5 (524 avis)
Google Maps : https://maps.google.com/?cid=1930626160187573206&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d68d$, true, 43.602385, 1.4082367, $d68a$1 Place de la Charte des Libertés Communales$d68a$, $d68c$Toulouse$d68c$, $d68p$31300$d68p$, $d68g$ChIJswisqJy7rhIR1oMOiEP2yho$d68g$, 4.7, 524, $d68s$Coiffeur$d68s$),
  ($d69n$Magasin Robe De Mariee$d69n$, $d69d$Tenues à Toulouse.
Note Google : 5/5 (1 avis)
Google Maps : https://maps.google.com/?cid=5758124931898443586&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d69d$, true, 43.5953476, 1.4196346, $d69a$52 Bd Gabriel Koenigs$d69a$, $d69c$Toulouse$d69c$, $d69p$31300$d69p$, $d69g$ChIJS-vCAAy7rhIRQocgIh746E8$d69g$, 5.0, 1, $d69s$Tenues$d69s$),
  ($d70n$Mains d’Or - Barber - Toulouse$d70n$, $d70d$Coiffeur à Toulouse.
Téléphone : 09 54 04 75 01
Note Google : 4.6/5 (303 avis)
Google Maps : https://maps.google.com/?cid=4418709568954415346&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d70d$, true, 43.607506, 1.4444572, $d70a$3 Rue de Périgord$d70a$, $d70c$Toulouse$d70c$, $d70p$31000$d70p$, $d70g$ChIJkVOt44C9rhIR8rglD_FoUj0$d70g$, 4.6, 303, $d70s$Coiffeur$d70s$),
  ($d71n$Maison C Robe de mariée Toulouse$d71n$, $d71d$Tenues à Toulouse.
Téléphone : 07 50 29 73 89
Site web : https://www.cynthia-renolde-robedemariee.fr/
Note Google : 5/5 (11 avis)
Google Maps : https://maps.google.com/?cid=16317736481477736675&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d71d$, true, 43.6023012, 1.4472171, $d71a$14 Pl. Saint-Georges$d71a$, $d71c$Toulouse$d71c$, $d71p$31000$d71p$, $d71g$ChIJB6R66Xy9rhIR47jp9N8-dOI$d71g$, 5.0, 11, $d71s$Tenues$d71s$),
  ($d72n$Maison Muses Coiffure$d72n$, $d72d$Coiffeur à Toulouse.
Site web : https://www.maison-muses.fr/
Note Google : 4.9/5 (232 avis)
Google Maps : https://maps.google.com/?cid=135247409171634300&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d72d$, true, 43.606701799999996, 1.4507478999999999, $d72a$48 All. Jean Jaurès$d72a$, $d72c$Toulouse$d72c$, $d72p$31000$d72p$, $d72g$ChIJxUV3IHy9rhIRfJh3VM1-4AE$d72g$, 4.9, 232, $d72s$Coiffeur$d72s$),
  ($d73n$Maison Sublime - Studio Maquillage & Bien Être$d73n$, $d73d$Maquilleur à Toulouse.
Téléphone : 06 46 62 42 71
Site web : https://www.planity.com/maison-sublime-31300-toulouse
Note Google : 5/5 (24 avis)
Google Maps : https://maps.google.com/?cid=13361899811898280662&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d73d$, true, 43.597421399999995, 1.427578, $d73a$28 Av. Etienne Billières$d73a$, $d73c$Toulouse$d73c$, $d73p$31300$d73p$, $d73g$ChIJoWKPC-reM0MR1kqOpBUBb7k$d73g$, 5.0, 24, $d73s$Maquilleur$d73s$),
  ($d74n$Maquillage enfants Toulouse Sandie Mille Couleurs$d74n$, $d74d$Maquilleur à Rabastens.
Téléphone : 06 76 56 76 14
Site web : https://www.maquillagesandie.com/
Note Google : 5/5 (33 avis)
Google Maps : https://maps.google.com/?cid=2042118099062680951&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d74d$, true, 43.8411562, 1.7595823, $d74a$Plaine de Fongrave$d74a$, $d74c$Rabastens$d74c$, $d74p$81800$d74p$, $d74g$ChIJG7-aErIrrBIRd-0GbJcPVxw$d74g$, 5.0, 33, $d74s$Maquilleur$d74s$),
  ($d75n$Marc Alexandre Frezal artisan metier d'art en horlogerie, bijouterie.$d75n$, $d75d$Accessoires à Toulouse.
Téléphone : 05 61 62 97 30
Note Google : 4.7/5 (55 avis)
Google Maps : https://maps.google.com/?cid=8322045663874067354&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d75d$, true, 43.604552, 1.451795, $d75a$24 Rue de la Colombette$d75a$, $d75c$Toulouse$d75c$, $d75p$31000$d75p$, $d75g$ChIJab63i5m8rhIRmivLb3DYfXM$d75g$, 4.7, 55, $d75s$Accessoires$d75s$),
  ($d76n$Marine Sicard Le studio de coiffure$d76n$, $d76d$Coiffeur à Toulouse.
Téléphone : 06 75 50 54 62
Site web : https://www.marinesicard.fr/fr/
Note Google : 4.9/5 (147 avis)
Google Maps : https://maps.google.com/?cid=15752045303142379938&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d76d$, true, 43.5991164, 1.446115, $d76a$13 Rue Bouquières$d76a$, $d76c$Toulouse$d76c$, $d76p$31000$d76p$, $d76g$ChIJp5qIIru9rhIRonGpy76Bmto$d76g$, 4.9, 147, $d76s$Coiffeur$d76s$),
  ($d77n$Mariée Du Sud$d77n$, $d77d$Tenues à Toulouse.
Téléphone : 06 95 31 08 53
Site web : https://www.marieedusud.com/
Note Google : 4.9/5 (147 avis)
Google Maps : https://maps.google.com/?cid=15375966296152125161&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d77d$, true, 43.5996321, 1.4479372, $d77a$37 Rue Croix Baragnon$d77a$, $d77c$Toulouse$d77c$, $d77p$31000$d77p$, $d77g$ChIJwQiWOIm6rhIR6a6GiOFnYtU$d77g$, 4.9, 147, $d77s$Tenues$d77s$),
  ($d78n$Miailhes Joailliers$d78n$, $d78d$Accessoires à Toulouse.
Téléphone : 05 61 48 05 66
Site web : https://miailhes.fr/
Note Google : 4.8/5 (51 avis)
Google Maps : https://maps.google.com/?cid=9893059030413801912&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d78d$, true, 43.6353926, 1.4640024, $d78a$114 Rte d'Albi$d78a$, $d78c$Toulouse$d78c$, $d78p$31200$d78p$, $d78g$ChIJZRKtyjejrhIRuPnIwcU0S4k$d78g$, 4.8, 51, $d78s$Accessoires$d78s$),
  ($d79n$Mille et une mariées$d79n$, $d79d$Tenues à Toulouse.
Téléphone : 07 81 86 20 47
Note Google : 4.6/5 (125 avis)
Google Maps : https://maps.google.com/?cid=9003814988521097880&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d79d$, true, 43.5629337, 1.4079544, $d79a$route de FACE BOUCHERIE et FEU ROUGE ( boutique rosé poudré, 180 Rte de Seysses$d79a$, $d79c$Toulouse$d79c$, $d79p$31100$d79p$, $d79g$ChIJh61tvc27rhIRmEojHgf683w$d79g$, 4.6, 125, $d79s$Tenues$d79s$),
  ($d80n$Mily Cuts Coiffure$d80n$, $d80d$Coiffeur à Toulouse.
Téléphone : 06 88 80 56 27
Site web : https://www.milycuts-coiffure.com/
Note Google : 4.9/5 (74 avis)
Google Maps : https://maps.google.com/?cid=13785797041361190556&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d80d$, true, 43.600893899999996, 1.4345983999999998, $d80a$45 Rue Charles Viguerie$d80a$, $d80c$Toulouse$d80c$, $d80p$31300$d80p$, $d80g$ChIJO2BoQmW7rhIRnP72a179UL8$d80g$, 4.9, 74, $d80s$Coiffeur$d80s$),
  ($d81n$Monsieur Le Joaillier$d81n$, $d81d$Accessoires à Toulouse.
Téléphone : 09 75 53 31 84
Note Google : 5/5 (57 avis)
Google Maps : https://maps.google.com/?cid=2297328062596893803&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d81d$, true, 43.6043392, 1.4508508999999998, $d81a$3 Rue de la Colombette$d81a$, $d81c$Toulouse$d81c$, $d81p$31000$d81p$, $d81g$ChIJ-Q0dgJm8rhIRa8yff7O_4R8$d81g$, 5.0, 57, $d81s$Accessoires$d81s$),
  ($d82n$Muriel Prando Créatrice - Robes de mariée Toulouse$d82n$, $d82d$Tenues à Toulouse.
Téléphone : 05 61 99 35 67
Site web : http://www.murielprando.com/
Note Google : 4.7/5 (124 avis)
Google Maps : https://maps.google.com/?cid=7562201478981045532&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d82d$, true, 43.605473499999995, 1.458326, $d82a$9 Av. de la Gloire$d82a$, $d82c$Toulouse$d82c$, $d82p$31500$d82p$, $d82g$ChIJU9GAGJS8rhIRHE2Zyi1W8mg$d82g$, 4.7, 124, $d82s$Tenues$d82s$),
  ($d83n$NSV Coiffure$d83n$, $d83d$Coiffeur à Toulouse.
Téléphone : 05 61 29 80 67
Note Google : 4.9/5 (182 avis)
Google Maps : https://maps.google.com/?cid=12263209873608678256&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d83d$, true, 43.601075699999996, 1.4486168, $d83a$12 R. d'Astorg$d83a$, $d83c$Toulouse$d83c$, $d83p$31000$d83p$, $d83g$ChIJucFdYZu8rhIRcBuCImisL6o$d83g$, 4.9, 182, $d83s$Coiffeur$d83s$),
  ($d84n$NV Joailliers$d84n$, $d84d$Accessoires à Toulouse.
Téléphone : 05 62 26 76 02
Site web : https://nvjoailliers.fr/
Note Google : 4.8/5 (92 avis)
Google Maps : https://maps.google.com/?cid=4559935951062123777&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d84d$, true, 43.599973899999995, 1.4454985999999999, $d84a$7 Rue d'Alsace Lorraine$d84a$, $d84c$Toulouse$d84c$, $d84p$31000$d84p$, $d84g$ChIJfajELp28rhIRAUWXgZYlSD8$d84g$, 4.8, 92, $d84s$Accessoires$d84s$),
  ($d85n$NZAMBE COIFFURE$d85n$, $d85d$Coiffeur à Toulouse.
Téléphone : 07 83 34 72 88
Site web : https://instagram.com/ya_nzambe__coiffure?utm_medium=copy_link
Note Google : 4.6/5 (133 avis)
Google Maps : https://maps.google.com/?cid=11539271603404462373&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d85d$, true, 43.601526299999996, 1.458234, $d85a$40 Rue du Pont Guilheméry$d85a$, $d85c$Toulouse$d85c$, $d85p$31500$d85p$, $d85g$ChIJ3fp8__q9rhIRJdmst2K6I6A$d85g$, 4.6, 133, $d85s$Coiffeur$d85s$),
  ($d86n$Nicolas Tourrel - Joaillier TOULOUSE - Meilleur Ouvrier de France$d86n$, $d86d$Accessoires à Toulouse.
Téléphone : 05 61 52 48 32
Site web : https://tourrel-joaillier.fr/
Note Google : 4.8/5 (38 avis)
Google Maps : https://maps.google.com/?cid=1487465833184140528&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d86d$, true, 43.6003033, 1.4481887, $d86a$13 Rue Boulbonne$d86a$, $d86c$Toulouse$d86c$, $d86p$31000$d86p$, $d86g$ChIJLdGFp5y8rhIR8Jx4WkuKpBQ$d86g$, 4.8, 38, $d86s$Accessoires$d86s$),
  ($d87n$Plumetis - Robes de mariée Toulouse$d87n$, $d87d$Tenues à Toulouse.
Téléphone : 05 61 53 49 22
Site web : https://www.plumetis-toulouse.fr/
Note Google : 4.8/5 (196 avis)
Google Maps : https://maps.google.com/?cid=11469357944997788069&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d87d$, true, 43.6029136, 1.4472384, $d87a$9 Rue Saint-Antoine du T$d87a$, $d87c$Toulouse$d87c$, $d87p$31000$d87p$, $d87g$ChIJuaSyiQa7rhIRpblloUhYK58$d87g$, 4.8, 196, $d87s$Tenues$d87s$),
  ($d88n$Prestige Flow Barber shop$d88n$, $d88d$Coiffeur à Toulouse.
Téléphone : 07 66 40 83 77
Site web : https://www.instagram.com/prestige_flow_barber_shop?igsh=emxiMjNhdG5rNGww
Note Google : 4.9/5 (182 avis)
Google Maps : https://maps.google.com/?cid=17595043890409615794&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d88d$, true, 43.5963765, 1.4443789, $d88a$1 bis Rue des Régans$d88a$, $d88c$Toulouse$d88c$, $d88p$31000$d88p$, $d88g$ChIJuTKEiQu9rhIRsrFFHzInLvQ$d88g$, 4.9, 182, $d88s$Coiffeur$d88s$),
  ($d89n$REVOLUCION Coiffure sur Mesure$d89n$, $d89d$Coiffeur à Toulouse.
Téléphone : 09 52 66 72 06
Site web : https://www.planity.com/revolucion-coiffeur-sur-mesure-31000-toulouse
Note Google : 4.8/5 (324 avis)
Google Maps : https://maps.google.com/?cid=9366809138069803139&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d89d$, true, 43.605416, 1.45332, $d89a$16 Rue Maury$d89a$, $d89c$Toulouse$d89c$, $d89p$31000$d89p$, $d89g$ChIJ09-5XZe8rhIRg5CImUiX_YE$d89g$, 4.8, 324, $d89s$Coiffeur$d89s$),
  ($d90n$Rieunier Joailliers$d90n$, $d90d$Accessoires à Toulouse.
Téléphone : 05 61 25 26 06
Site web : http://rieunier-joailliers-horlogers.com/?utm_source=gmb
Note Google : 4.5/5 (30 avis)
Google Maps : https://maps.google.com/?cid=13676373025424651442&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d90d$, true, 43.599911999999996, 1.4477350999999998, $d90a$22 Rue Croix Baragnon$d90a$, $d90c$Toulouse$d90c$, $d90p$31000$d90p$, $d90g$ChIJUW3ZsZy8rhIRsrQrXM48zL0$d90g$, 4.5, 30, $d90s$Accessoires$d90s$),
  ($d91n$Robe Elysée - Robes de mariée à Toulouse$d91n$, $d91d$Tenues à Toulouse.
Téléphone : 06 56 66 60 08
Site web : https://www.robedemarieetoulouse.fr/
Note Google : 5/5 (162 avis)
Google Maps : https://maps.google.com/?cid=10436698750106666509&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d91d$, true, 43.6001404, 1.447706, $d91a$22 Rue Croix Baragnon$d91a$, $d91c$Toulouse$d91c$, $d91p$31000$d91p$, $d91g$ChIJtxqOwR69rhIRDQbfmzea1pA$d91g$, 5.0, 162, $d91s$Tenues$d91s$),
  ($d92n$SOPHIE GAMARD : COIFFEUR EXPERT COLORISTE balayage olaplex et shu uemura soin ybera$d92n$, $d92d$Coiffeur à Toulouse.
Téléphone : 09 67 34 04 75
Site web : http://sophiegamard.fr/
Note Google : 4.7/5 (208 avis)
Google Maps : https://maps.google.com/?cid=1919210148031406852&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d92d$, true, 43.604439199999995, 1.4533243999999998, $d92a$33 Rue de la Colombette$d92a$, $d92c$Toulouse$d92c$, $d92p$31000$d92p$, $d92g$ChIJC_1UVJe8rhIRBKO8EnZnoho$d92g$, 4.7, 208, $d92s$Coiffeur$d92s$),
  ($d93n$Salon By karen Coiffure et Esthétique$d93n$, $d93d$Coiffeur à Toulouse.
Téléphone : 05 61 80 57 43
Site web : http://salonbykaren.com/
Note Google : 4.7/5 (175 avis)
Google Maps : https://maps.google.com/?cid=8635327144881493825&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d93d$, true, 43.5964788, 1.4614992, $d93a$50 Av. Jean Rieux$d93a$, $d93c$Toulouse$d93c$, $d93p$31500$d93p$, $d93g$ChIJY7ioc468rhIRQRfzTUnY1nc$d93g$, 4.7, 175, $d93s$Coiffeur$d93s$),
  ($d94n$Salon de coiffure Bio Madame Sans Gêne à Toulouse quartier saint cyprien$d94n$, $d94d$Coiffeur à Toulouse.
Téléphone : 09 81 25 31 83
Site web : http://www.madamesansgene.fr/
Note Google : 4.6/5 (337 avis)
Google Maps : https://maps.google.com/?cid=676819174023563932&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d94d$, true, 43.5985091, 1.435358, $d94a$28 Rue de la République$d94a$, $d94c$Toulouse$d94c$, $d94p$31300$d94p$, $d94g$ChIJ9WSdiqC8rhIRnArZ7HOLZAk$d94g$, 4.6, 337, $d94s$Coiffeur$d94s$),
  ($d95n$Sarah Calvayrac Création Styliste Robes de Mariées$d95n$, $d95d$Tenues à Toulouse.
Téléphone : 07 71 74 94 94
Note Google : 5/5 (5 avis)
Google Maps : https://maps.google.com/?cid=9151178333601367255&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d95d$, true, 43.604858899999996, 1.482084, $d95a$4 Imp. Jean Chaubet bat b appart 31$d95a$, $d95c$Toulouse$d95c$, $d95p$31500$d95p$, $d95g$ChIJib7USjG9rhIR14SPmjWE_34$d95g$, 5.0, 5, $d95s$Tenues$d95s$),
  ($d96n$Sarah Fekir Coiffeuse-Maquilleuse$d96n$, $d96d$Maquilleur à Toulouse.
Téléphone : 06 58 35 56 03
Site web : http://www.maquillagetoulouse.com/
Note Google : 5/5 (43 avis)
Google Maps : https://maps.google.com/?cid=8202488500340412321&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d96d$, true, 43.6096978, 1.4437124, $d96a$1 Rue de l'Arc$d96a$, $d96c$Toulouse$d96c$, $d96p$31000$d96p$, $d96g$ChIJW4v_nM-9rhIRoU8EGdUX1XE$d96g$, 5.0, 43, $d96s$Maquilleur$d96s$),
  ($d97n$So In Love - Créatrices de robes de mariée sur mesure$d97n$, $d97d$Tenues à Toulouse.
Téléphone : 07 82 53 36 60
Site web : https://so-inlove.fr/
Note Google : 5/5 (39 avis)
Google Maps : https://maps.google.com/?cid=15959494833241981097&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d97d$, true, 43.6141351, 1.4444137, $d97a$39 Rue du Printemps$d97a$, $d97c$Toulouse$d97c$, $d97p$31000$d97p$, $d97g$ChIJG0KWpr68rhIRqQASav6De90$d97g$, 5.0, 39, $d97s$Tenues$d97s$),
  ($d98n$Swatoa - Conseillère en image & Maquilleuse professionnelle$d98n$, $d98d$Maquilleur à Saubens.
Téléphone : 06 62 96 96 25
Site web : https://www.instagram.com/swatoa.studio?igsh=cDM2MXFtN3NxeW4z
Note Google : 5/5 (42 avis)
Google Maps : https://maps.google.com/?cid=16443232653769423180&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d98d$, true, 43.4785275, 1.3542843999999998, $d98a$Rue Eole$d98a$, $d98c$Saubens$d98c$, $d98p$31600$d98p$, $d98g$ChIJAwdJjVW7rhIRTLkHh_oYMuQ$d98g$, 5.0, 42, $d98s$Maquilleur$d98s$),
  ($d99n$Tania Todorova - Robe de mariée/soirée Toulouse Showroom Sur Rendez-vous uniquement$d99n$, $d99d$Tenues à Toulouse.
Téléphone : 06 95 60 74 66
Site web : https://www.instagram.com/taniatodorova_/?hl=fr
Note Google : 5/5 (7 avis)
Google Maps : https://maps.google.com/?cid=5298520326068735025&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d99d$, true, 43.589998099999995, 1.4443374, $d99a$89 Rue Achille Viadieu$d99a$, $d99c$Toulouse$d99c$, $d99p$31400$d99p$, $d99g$ChIJh-xGlDG9rhIRMYyD7ikgiEk$d99g$, 5.0, 7, $d99s$Tenues$d99s$),
  ($d100n$Un Jour Un Costume | Location de costumes$d100n$, $d100d$Tenues à Toulouse.
Téléphone : 05 32 09 07 20
Site web : https://www.unjouruncostume.com/
Note Google : 4.9/5 (185 avis)
Google Maps : https://maps.google.com/?cid=14185592270870096937&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d100d$, true, 43.6050447, 1.4451359, $d100a$19 Rue Lafayette$d100a$, $d100c$Toulouse$d100c$, $d100p$31000$d100p$, $d100g$ChIJvxRAMdG9rhIRKSy9CQNZ3cQ$d100g$, 4.9, 185, $d100s$Tenues$d100s$),
  ($d101n$Valentin artisan coiffeur$d101n$, $d101d$Coiffeur à Toulouse.
Téléphone : 06 18 48 69 89
Site web : https://www.planity.com/valentin-artisan-coiffeur-31000-toulouse
Note Google : 4.9/5 (83 avis)
Google Maps : https://maps.google.com/?cid=8039715571233313249&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d101d$, true, 43.5992041, 1.4429607, $d101a$2 Rue du Coq d'Inde$d101a$, $d101c$Toulouse$d101c$, $d101p$31000$d101p$, $d101g$ChIJcyXydca7rhIR4dGJPrfOkm8$d101g$, 4.9, 83, $d101s$Coiffeur$d101s$),
  ($d102n$Violette & Rose - Accessoires pour cheveux$d102n$, $d102d$Accessoires à Toulouse.
Site web : http://www.violetteetrose.fr/
Note Google : 5/5 (4 avis)
Google Maps : https://maps.google.com/?cid=730786660918459638&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d102d$, true, 43.633854500000005, 1.472686, $d102a$5 Rue Paul Estival$d102a$, $d102c$Toulouse$d102c$, $d102p$31200$d102p$, $d102g$ChIJvQNfva2hrhIR9nyjophGJAo$d102g$, 5.0, 4, $d102s$Accessoires$d102s$),
  ($d103n$Yj Coiffure$d103n$, $d103d$Coiffeur à Toulouse.
Téléphone : 06 99 59 20 28
Note Google : 4.5/5 (122 avis)
Google Maps : https://maps.google.com/?cid=5596567038219876763&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d103d$, true, 43.6028649, 1.4419795000000002, $d103a$21 Rue Sainte-Ursule$d103a$, $d103c$Toulouse$d103c$, $d103p$31000$d103p$, $d103g$ChIJHy-PQ2K7rhIRm3nBwhEAq00$d103g$, 4.5, 122, $d103s$Coiffeur$d103s$),
  ($d104n$coiffeur Tia gigi$d104n$, $d104d$Coiffeur à Toulouse.
Téléphone : 05 62 26 36 86
Site web : http://www.tiagigi.fr/
Note Google : 5/5 (107 avis)
Google Maps : https://maps.google.com/?cid=2335651509215306411&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d104d$, true, 43.612566799999996, 1.4458421000000001, $d104a$46 Rue de la Concorde$d104a$, $d104c$Toulouse$d104c$, $d104p$31000$d104p$, $d104g$ChIJt3_QwBa9rhIRqyLiPazmaSA$d104g$, 5.0, 107, $d104s$Coiffeur$d104s$),
  ($d105n$l'ECHO - Outlet de robes de mariée$d105n$, $d105d$Tenues à Toulouse.
Téléphone : 05 62 84 49 32
Site web : http://www.lecho-mariage.fr/
Note Google : 5/5 (35 avis)
Google Maps : https://maps.google.com/?cid=2294670644501670910&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d105d$, true, 43.5975013, 1.4420815, $d105a$35 Rue de la Dalbade$d105a$, $d105c$Toulouse$d105c$, $d105p$31000$d105p$, $d105g$ChIJmd3T7Ze7rhIR_usJIstO2B8$d105g$, 5.0, 35, $d105s$Tenues$d105s$)
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
  ($d0n$AJ Makeup Artist$d0n$, $d0d$Maquilleur à Toulouse.
Téléphone : 06 76 06 76 40
Site web : https://bio.site/AJMakeupArtist
Note Google : 5/5 (11 avis)
Google Maps : https://maps.google.com/?cid=8751029686170546490&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d0d$, true, 43.5786912, 1.4806221, $d0a$70 Av. Louis Breguet$d0a$, $d0c$Toulouse$d0c$, $d0p$31400$d0p$, $d0g$ChIJGQKTH03sG6MROvEXdyLncXk$d0g$, 5.0, 11, $d0s$Maquilleur$d0s$),
  ($d1n$AMARIA - Robe de mariée Toulouse$d1n$, $d1d$Tenues à Rouffiac-Tolosan.
Téléphone : 09 83 65 12 11
Site web : http://www.amaria.fr/
Note Google : 4.7/5 (352 avis)
Google Maps : https://maps.google.com/?cid=6999057034649588367&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d1d$, true, 43.6687305, 1.5124148, $d1a$4 Imp. du Clos du Loup$d1a$, $d1c$Rouffiac-Tolosan$d1c$, $d1p$31180$d1p$, $d1g$ChIJfYrhxHyirhIRj9L8WEqlIWE$d1g$, 4.7, 352, $d1s$Tenues$d1s$),
  ($d2n$AMBRENCE - Salon de coiffure$d2n$, $d2d$Coiffeur à Toulouse.
Téléphone : 06 37 25 39 13
Site web : https://ambrence.com/
Note Google : 4.6/5 (234 avis)
Google Maps : https://maps.google.com/?cid=9127642125496713300&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d2d$, true, 43.5993749, 1.4470404, $d2a$7 Rue Tolosane$d2a$, $d2c$Toulouse$d2c$, $d2p$31000$d2p$, $d2g$ChIJ5d0oh-W7rhIRVIAfHyfmq34$d2g$, 4.6, 234, $d2s$Coiffeur$d2s$),
  ($d3n$AU TEMPLE DE LA MARIEE$d3n$, $d3d$Tenues à Toulouse.
Téléphone : 06 41 43 12 31
Site web : https://temple-de-la-mariee.lovable.app/
Note Google : 3.7/5 (59 avis)
Google Maps : https://maps.google.com/?cid=14684549341084699651&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d3d$, true, 43.715393899999995, 1.4484907999999999, $d3a$31 Rue Eugène Labiche$d3a$, $d3c$Toulouse$d3c$, $d3p$31200$d3p$, $d3g$ChIJ1WzI7AC7rhIRA8wM2tL_ycs$d3g$, 3.7, 59, $d3s$Tenues$d3s$),
  ($d4n$Addict Coiffure$d4n$, $d4d$Coiffeur à Toulouse.
Téléphone : 05 61 22 59 33
Note Google : 4.7/5 (149 avis)
Google Maps : https://maps.google.com/?cid=15928768387859654597&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d4d$, true, 43.602617300000006, 1.4473479, $d4a$6 Rue Saint-Antoine du T$d4a$, $d4c$Toulouse$d4c$, $d4p$31000$d4p$, $d4g$ChIJhVfIaJy8rhIRxafYW3RaDt0$d4g$, 4.7, 149, $d4s$Coiffeur$d4s$),
  ($d5n$Anges et Reves, Robe De Mariée À Toulouse$d5n$, $d5d$Tenues à Montrabé.
Téléphone : 09 61 60 00 54
Site web : https://www.angesetreves.fr/
Note Google : 4.8/5 (160 avis)
Google Maps : https://maps.google.com/?cid=6967849387226209431&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d5d$, true, 43.644588, 1.5451173, $d5a$All. du Luberon Centre Commercial$d5a$, $d5c$Montrabé$d5c$, $d5p$31850$d5p$, $d5g$ChIJc9fd0jGKrhIRl5wKthnGsmA$d5g$, 4.8, 160, $d5s$Tenues$d5s$),
  ($d6n$AngéliqueSMUA - Maquilleuse professionnelle à Toulouse$d6n$, $d6d$Maquilleur à Donneville.
Téléphone : 06 74 99 88 52
Site web : https://www.instagram.com/angeliquesmua/
Note Google : 5/5 (136 avis)
Google Maps : https://maps.google.com/?cid=12695770179344562166&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d6d$, true, 43.473605, 1.5488567, $d6a$4 Rue de la Voie Romaine$d6a$, $d6c$Donneville$d6c$, $d6p$31450$d6p$, $d6g$ChIJVxH3KK2VrhIR9nfUibZvMLA$d6g$, 5.0, 136, $d6s$Maquilleur$d6s$),
  ($d7n$Atelier Claire Colle - Robes de mariée uniques et sur mesure$d7n$, $d7d$Tenues à Toulouse.
Téléphone : 06 60 39 03 49
Google Maps : https://maps.google.com/?cid=10530294174913633768&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d7d$, true, 43.618683, 1.4221863, $d7a$3 Rue Jacob Insel$d7a$, $d7c$Toulouse$d7c$, $d7p$31200$d7p$, $d7g$ChIJI3IlLzi7rhIR6J0XnMIeI5I$d7g$, 0, 0, $d7s$Tenues$d7s$),
  ($d8n$Atelier Stellmach joaillerie$d8n$, $d8d$Accessoires à Toulouse.
Téléphone : 05 67 22 76 49
Site web : https://pin.it/53sgjGx
Note Google : 4.4/5 (10 avis)
Google Maps : https://maps.google.com/?cid=439955784627556501&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d8d$, true, 43.6044195, 1.4520328999999998, $d8a$13 Rue de la Colombette$d8a$, $d8c$Toulouse$d8c$, $d8p$31000$d8p$, $d8g$ChIJVwbJipm8rhIRlZCag3QJGwY$d8g$, 4.4, 10, $d8s$Accessoires$d8s$),
  ($d9n$Aureus Atelier Bijouterie Joaillerie$d9n$, $d9d$Accessoires à Toulouse.
Téléphone : 07 87 75 10 30
Site web : https://www.atelieraureus.com/
Note Google : 5/5 (10 avis)
Google Maps : https://maps.google.com/?cid=5275685303039954338&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d9d$, true, 43.597621, 1.4320496, $d9a$23 Rue Joseph Vie$d9a$, $d9c$Toulouse$d9c$, $d9p$31300$d9p$, $d9g$ChIJpe8JQ9i7rhIRog1y0tT_Nkk$d9g$, 5.0, 10, $d9s$Accessoires$d9s$),
  ($d10n$Autrement coiffure$d10n$, $d10d$Coiffeur à Toulouse.
Téléphone : 05 32 59 10 22
Site web : https://autrement-coiffure.fr/
Note Google : 4.9/5 (117 avis)
Google Maps : https://maps.google.com/?cid=10347506402710390266&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d10d$, true, 43.611837799999996, 1.4376173, $d10a$9 Rue de Toul$d10a$, $d10c$Toulouse$d10c$, $d10p$31000$d10p$, $d10g$ChIJk9ypY8G7rhIR-gWi9D-6mY8$d10g$, 4.9, 117, $d10s$Coiffeur$d10s$),
  ($d11n$BARBER LOUNGE$d11n$, $d11d$Coiffeur à Toulouse.
Téléphone : 06 67 04 74 50
Note Google : 4.9/5 (152 avis)
Google Maps : https://maps.google.com/?cid=15947515456303745060&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d11d$, true, 43.600679899999996, 1.4406185999999999, $d11a$19 Rue Peyrolières$d11a$, $d11c$Toulouse$d11c$, $d11p$31000$d11p$, $d11g$ChIJF-bLM_i7rhIRJEgJX9D0UN0$d11g$, 4.9, 152, $d11s$Coiffeur$d11s$),
  ($d12n$BIJOUTERIE DU CAPITOLE$d12n$, $d12d$Accessoires à Toulouse.
Téléphone : 05 61 21 12 72
Site web : http://www.bijouterie-du-capitole.fr/?utm_source=gmb
Note Google : 3.1/5 (55 avis)
Google Maps : https://maps.google.com/?cid=18304389150565059442&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d12d$, true, 43.6043406, 1.4426037, $d12a$12 Pl. du Capitole$d12a$, $d12c$Toulouse$d12c$, $d12p$31000$d12p$, $d12g$ChIJZ8onHWK7rhIRcsvxnfNABv4$d12g$, 3.1, 55, $d12s$Accessoires$d12s$),
  ($d13n$Bea Mothes Coiffeuse visagiste spécialisée dans le mariage et le chignon Montastruc la conseillère$d13n$, $d13d$Coiffeur à Montastruc-la-Conseillère.
Téléphone : 06 18 43 55 27
Site web : http://beamothes.fr/
Note Google : 5/5 (161 avis)
Google Maps : https://maps.google.com/?cid=11794776212015628012&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d13d$, true, 43.7183327, 1.5774466, $d13a$1293 D888 D888$d13a$, $d13c$Montastruc-la-Conseillère$d13c$, $d13p$31380$d13p$, $d13g$ChIJNXVTyL2erhIR7D5rMnl2r6M$d13g$, 5.0, 161, $d13s$Coiffeur$d13s$),
  ($d14n$Beautymakeup maquilleuse Toulouse$d14n$, $d14d$Maquilleur à Saint-Jean.
Téléphone : 06 10 92 85 14
Site web : https://www.beautymakeup.fr/
Note Google : 4.9/5 (28 avis)
Google Maps : https://maps.google.com/?cid=7878384522481038960&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d14d$, true, 43.6651296, 1.493968, $d14a$19 Chem. de Verdale$d14a$, $d14c$Saint-Jean$d14c$, $d14p$31240$d14p$, $d14g$ChIJhcWAsmGkrhIRcPZqUvukVW0$d14g$, 4.9, 28, $d14s$Maquilleur$d14s$),
  ($d15n$Bijouterie AMOR$d15n$, $d15d$Accessoires à Toulouse.
Téléphone : 05 62 87 93 18
Site web : http://bijouterieamor.fr/
Note Google : 4.7/5 (53 avis)
Google Maps : https://maps.google.com/?cid=6753199104713322818&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d15d$, true, 43.5977555, 1.4291339, $d15a$6 Av. Etienne Billières$d15a$, $d15c$Toulouse$d15c$, $d15p$31300$d15p$, $d15g$ChIJM-ONdfa7rhIRQnHsRc4uuF0$d15g$, 4.7, 53, $d15s$Accessoires$d15s$),
  ($d16n$Bijouterie Joaillerie Mohedano$d16n$, $d16d$Accessoires à Toulouse.
Téléphone : 05 61 23 04 82
Site web : https://www.j-mohedano.com/
Note Google : 4.6/5 (181 avis)
Google Maps : https://maps.google.com/?cid=15063665690011767895&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d16d$, true, 43.6009318, 1.4451355, $d16a$46 Rue des Tourneurs$d16a$, $d16c$Toulouse$d16c$, $d16p$31000$d16p$, $d16g$ChIJXWUtFp28rhIRVxRkZCLkDNE$d16g$, 4.6, 181, $d16s$Accessoires$d16s$),
  ($d17n$Bijouterie Pujol$d17n$, $d17d$Accessoires à Toulouse.
Téléphone : 05 62 73 70 70
Site web : http://bijouteriepujol.fr/
Note Google : 4.5/5 (593 avis)
Google Maps : https://maps.google.com/?cid=9556570923531229226&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d17d$, true, 43.609164, 1.4459819, $d17a$3 Pl. Jeanne d'Arc$d17a$, $d17c$Toulouse$d17c$, $d17p$31000$d17p$, $d17g$ChIJhWFe2aG8rhIRKtjnP5_Cn4Q$d17g$, 4.5, 593, $d17s$Accessoires$d17s$),
  ($d18n$Bijouterie Subra, Guilde des Orfèvres$d18n$, $d18d$Accessoires à Toulouse.
Téléphone : 05 61 23 51 42
Site web : https://guildedesorfevres.fr/bijouterie/toulouse-1554M
Note Google : 4.6/5 (106 avis)
Google Maps : https://maps.google.com/?cid=17373261812219780591&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d18d$, true, 43.606973, 1.4459410000000001, $d18a$3 Rue du Salé$d18a$, $d18c$Toulouse$d18c$, $d18p$31000$d18p$, $d18g$ChIJiTicqp-8rhIR7x04G5I5GvE$d18g$, 4.6, 106, $d18s$Accessoires$d18s$),
  ($d19n$Bijoutier Joaillier$d19n$, $d19d$Accessoires à Toulouse.
Téléphone : 06 27 59 04 09
Note Google : 5/5 (5 avis)
Google Maps : https://maps.google.com/?cid=10316076603406235963&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d19d$, true, 43.606222599999995, 1.445009, $d19a$7 Rue Rivals$d19a$, $d19c$Toulouse$d19c$, $d19p$31000$d19p$, $d19g$ChIJtaz5RZ68rhIROzm_jQMRKo8$d19g$, 5.0, 5, $d19s$Accessoires$d19s$),
  ($d20n$Bijoux D Hier et D Aujourd Hui$d20n$, $d20d$Accessoires à Toulouse.
Téléphone : 05 61 21 96 79
Site web : https://www.bijouxdhieretdaujourdhui.fr/?utm_source=gmb
Note Google : 4.8/5 (50 avis)
Google Maps : https://maps.google.com/?cid=10838756603170390170&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d20d$, true, 43.601057399999995, 1.4449037999999998, $d20a$45 Rue des Tourneurs$d20a$, $d20c$Toulouse$d20c$, $d20p$31000$d20p$, $d20g$ChIJC2onFZ28rhIRmgDkUrT_apY$d20g$, 4.8, 50, $d20s$Accessoires$d20s$),
  ($d21n$Bérangère A. - Créatrice Robes de Mariée sur mesure à Toulouse$d21n$, $d21d$Tenues à Toulouse.
Téléphone : 06 51 16 42 47
Site web : http://www.berangere-a.com/?utm_source=google&utm_medium=wix_google_business_profile&utm_campaign=14526656863062538736
Note Google : 4.9/5 (38 avis)
Google Maps : https://maps.google.com/?cid=10743381584513177368&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d21d$, true, 43.548860499999996, 1.3835129, $d21a$56 Chem. de Tucaut$d21a$, $d21c$Toulouse$d21c$, $d21p$31100$d21p$, $d21g$ChIJCwY2kvS5rhIRGJdhV6EoGJU$d21g$, 4.9, 38, $d21s$Tenues$d21s$),
  ($d22n$Camille Albane - Coiffeur Toulouse rémusat$d22n$, $d22d$Coiffeur à Toulouse.
Téléphone : 05 62 27 03 93
Site web : https://salon.camillealbane.com/fr/salon-coiffure/toulouse-remusat?utm_campaign=MyBusinessYext&utm_medium=HP&utm_source=157301&y_source=1_MTUxMDAyNzctNzE1LWxvY2F0aW9uLndlYnNpdGU%3D
Note Google : 4.4/5 (101 avis)
Google Maps : https://maps.google.com/?cid=16028499018312799984&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d22d$, true, 43.606744, 1.4450999999999998, $d22a$42 Rue Charles de Rémusat$d22a$, $d22c$Toulouse$d22c$, $d22p$31000$d22p$, $d22g$ChIJgzdxS568rhIR8FY7Pe-qcN4$d22g$, 4.4, 101, $d22s$Coiffeur$d22s$),
  ($d23n$Camille Albane - Coiffeur Toulouse-ozenne$d23n$, $d23d$Coiffeur à Toulouse.
Téléphone : 05 34 31 24 97
Site web : https://salon.camillealbane.com/coiffeur/toulouse-ozenne/?utm_campaign=MyBusinessYext&utm_medium=HP&utm_source=150235&y_source=1_MTUxMDAxMjQtNzE1LWxvY2F0aW9uLndlYnNpdGU%3D
Note Google : 4.5/5 (94 avis)
Google Maps : https://maps.google.com/?cid=16375596876088671812&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d23d$, true, 43.596334299999995, 1.4474017, $d23a$19 Rue Théodore Ozenne$d23a$, $d23c$Toulouse$d23c$, $d23p$31000$d23p$, $d23g$ChIJuSFolIO8rhIRRP5C4JjOQeM$d23g$, 4.5, 94, $d23s$Coiffeur$d23s$),
  ($d24n$Carrière Mariage - Robes de Mariée$d24n$, $d24d$Tenues à Villefranche-de-Lauragais.
Téléphone : 05 61 81 64 04
Site web : https://www.carriere-mariage.com/
Note Google : 4.7/5 (509 avis)
Google Maps : https://maps.google.com/?cid=6983342255684854575&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d24d$, true, 43.39799, 1.7182857, $d24a$4 Rue Pierre Bélinguier$d24a$, $d24c$Villefranche-de-Lauragais$d24c$, $d24p$31290$d24p$, $d24g$ChIJuSWDDNTzrhIRLyMSP8jQ6WA$d24g$, 4.7, 509, $d24s$Tenues$d24s$),
  ($d25n$Christophe Versolato - Salon de coiffure & Concept Store$d25n$, $d25d$Coiffeur à Toulouse.
Téléphone : 05 61 21 24 13
Site web : http://www.christopheversolato.com/
Note Google : 4.4/5 (250 avis)
Google Maps : https://maps.google.com/?cid=8414873936767077107&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d25d$, true, 43.602917999999995, 1.4472231, $d25a$9 Rue Saint-Antoine du T$d25a$, $d25c$Toulouse$d25c$, $d25p$31000$d25p$, $d25g$ChIJxXHnQ5y8rhIR88qx9kKjx3Q$d25g$, 4.4, 250, $d25s$Coiffeur$d25s$),
  ($d26n$Clémence CL Maquilleuse$d26n$, $d26d$Maquilleur à L'Union.
Téléphone : 07 49 20 72 91
Site web : https://www.clemencecl.fr/
Note Google : 5/5 (31 avis)
Google Maps : https://maps.google.com/?cid=16729148211986898634&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d26d$, true, 43.659768899999996, 1.4723051, $d26a$22 Rue des Tilleuls$d26a$, $d26c$L'Union$d26c$, $d26p$31240$d26p$, $d26g$ChIJD3b5HxEiYGoRyh5X-qnfKeg$d26g$, 5.0, 31, $d26s$Maquilleur$d26s$),
  ($d27n$Coiffure du Monde$d27n$, $d27d$Coiffeur à Toulouse.
Téléphone : 05 61 12 28 83
Site web : https://www.jca-community.fr/
Note Google : 4/5 (390 avis)
Google Maps : https://maps.google.com/?cid=4496674782846743883&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d27d$, true, 43.6057203, 1.4441479, $d27a$15 Rue Charles de Rémusat$d27a$, $d27c$Toulouse$d27c$, $d27p$31000$d27p$, $d27g$ChIJnZQQPZ68rhIRS3UJ_uNlZz4$d27g$, 4.0, 390, $d27s$Coiffeur$d27s$),
  ($d28n$Couture & Mariage Robe de mariée Toulouse$d28n$, $d28d$Tenues à Plaisance-du-Touch.
Téléphone : 07 70 52 70 02
Site web : http://www.couture-mariage.com/
Note Google : 4.9/5 (91 avis)
Google Maps : https://maps.google.com/?cid=4493945790812349531&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d28d$, true, 43.5651685, 1.2967304, $d28a$5 Rue de la Pradette$d28a$, $d28c$Plaisance-du-Touch$d28c$, $d28p$31830$d28p$, $d28g$ChIJXx_u4um6rhIRW2Q7BeOzXT4$d28g$, 4.9, 91, $d28s$Tenues$d28s$),
  ($d29n$Créations Laurie Elma : Créations robe de mariée Toulouse$d29n$, $d29d$Tenues à Toulouse.
Téléphone : 07 81 17 04 04
Site web : https://www.creationslaurieelma.com/
Note Google : 5/5 (20 avis)
Google Maps : https://maps.google.com/?cid=10626719810798458162&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d29d$, true, 43.597904299999996, 1.4192300999999998, $d29a$43 Av. de Grande Bretagne$d29a$, $d29c$Toulouse$d29c$, $d29p$31300$d29p$, $d29g$ChIJLbKdMHC7rhIRMpU_el2xeZM$d29g$, 5.0, 20, $d29s$Tenues$d29s$),
  ($d30n$Cymbeline Toulouse - Robe de mariée$d30n$, $d30d$Tenues à Toulouse.
Téléphone : 05 61 62 65 38
Site web : https://cymbeline.com/fr/stores/cymbeline-toulouse-6/?utm_source=GoogleMaps
Note Google : 4.7/5 (211 avis)
Google Maps : https://maps.google.com/?cid=7142657287450909701&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d30d$, true, 43.600151499999996, 1.4552543000000002, $d30a$3 Rue de la Charité$d30a$, $d30c$Toulouse$d30c$, $d30p$31000$d30p$, $d30g$ChIJiasYMpC8rhIRBdzdovXQH2M$d30g$, 4.7, 211, $d30s$Tenues$d30s$),
  ($d31n$D-JI HAIR EVOLUTION Toulouse$d31n$, $d31d$Coiffeur à Toulouse.
Téléphone : 06 58 14 08 54
Note Google : 4.9/5 (148 avis)
Google Maps : https://maps.google.com/?cid=7257570945568933668&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d31d$, true, 43.5971514, 1.4568419, $d31a$36 Port Saint-Sauveur$d31a$, $d31c$Toulouse$d31c$, $d31p$31000$d31p$, $d31g$ChIJXeP8-Ge9rhIRJAfVnlISuGQ$d31g$, 4.9, 148, $d31s$Coiffeur$d31s$),
  ($d32n$DESSANGE - Coiffeur Toulouse$d32n$, $d32d$Coiffeur à Toulouse.
Téléphone : 05 61 62 91 31
Site web : https://salon.dessange.com/fr/salon-coiffure/toulouse-baragnon/
Note Google : 4.4/5 (152 avis)
Google Maps : https://maps.google.com/?cid=6031247552007816908&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d32d$, true, 43.599843, 1.44651, $d32a$8 Rue Croix Baragnon$d32a$, $d32c$Toulouse$d32c$, $d32p$31000$d32p$, $d32g$ChIJNXPE0py8rhIRzMbekbFLs1M$d32g$, 4.4, 152, $d32s$Coiffeur$d32s$),
  ($d33n$DMM 212 - Dans Mon Monde // Coiffeur mixte à Toulouse$d33n$, $d33d$Coiffeur à Toulouse.
Téléphone : 05 34 65 74 47
Site web : https://www.planity.com/dmm-212-31400-toulouse
Note Google : 4.7/5 (160 avis)
Google Maps : https://maps.google.com/?cid=16109467567419121890&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d33d$, true, 43.597553999999995, 1.4584563, $d33a$71 Rue Louis Vitet$d33a$, $d33c$Toulouse$d33c$, $d33p$31400$d33p$, $d33g$ChIJt-g_6HW9rhIR4mCxpGZTkN8$d33g$, 4.7, 160, $d33s$Coiffeur$d33s$),
  ($d34n$Delphine Josse — Créatrice de Robes de Mariée & Sur-Mesure • Toulouse$d34n$, $d34d$Tenues à Toulouse.
Téléphone : 06 22 06 28 15
Site web : https://delphinejosse.com/
Note Google : 5/5 (65 avis)
Google Maps : https://maps.google.com/?cid=12709967385264337541&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d34d$, true, 43.598054, 1.448859, $d34a$9 Pl. Saintes-Scarbes$d34a$, $d34c$Toulouse$d34c$, $d34p$31000$d34p$, $d34g$ChIJabh_DH-8rhIRhTJ7If_fYrA$d34g$, 5.0, 65, $d34s$Tenues$d34s$),
  ($d35n$Diva la mariée$d35n$, $d35d$Tenues à Toulouse.
Téléphone : 05 61 23 97 58
Site web : https://www.diva-la-mariee.fr/
Note Google : 3.8/5 (65 avis)
Google Maps : https://maps.google.com/?cid=14114612195295957194&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d35d$, true, 43.602134299999996, 1.4411185, $d35a$54 Rue Peyrolières$d35a$, $d35c$Toulouse$d35c$, $d35p$31000$d35p$, $d35g$ChIJqQ4PU2K7rhIRyhADWwIt4cM$d35g$, 3.8, 65, $d35s$Tenues$d35s$),
  ($d36n$Dorise Joaillier$d36n$, $d36d$Accessoires à Toulouse.
Téléphone : 05 61 52 38 03
Site web : http://www.dorise-joaillier.com/
Note Google : 4.3/5 (125 avis)
Google Maps : https://maps.google.com/?cid=8013574631137244845&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d36d$, true, 43.5996545, 1.4482355, $d36a$41 Rue Croix Baragnon$d36a$, $d36c$Toulouse$d36c$, $d36p$31000$d36p$, $d36g$ChIJJzZjVZu8rhIRrXYEVqvvNW8$d36g$, 4.3, 125, $d36s$Accessoires$d36s$),
  ($d37n$Eliz Maquilleuse professionel - Eliz Makeup Artist$d37n$, $d37d$Maquilleur à Toulouse.
Téléphone : 07 61 50 01 99
Site web : https://www.instagram.com/eliz_make_up_artist/
Note Google : 5/5 (14 avis)
Google Maps : https://maps.google.com/?cid=16073777680440481763&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d37d$, true, 43.566065099999996, 1.4985963, $d37a$Rue Rolande Trempé$d37a$, $d37c$Toulouse$d37c$, $d37p$31400$d37p$, $d37g$ChIJlef7odO9rhIR49dBSaOHEd8$d37g$, 5.0, 14, $d37s$Maquilleur$d37s$),
  ($d38n$Flawless touch - maquilleuse Toulouse$d38n$, $d38d$Maquilleur à Toulouse.
Téléphone : 06 82 99 63 08
Site web : https://flawless-touch-studio31.as.me/
Note Google : 5/5 (9 avis)
Google Maps : https://maps.google.com/?cid=9800066126407353431&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d38d$, true, 43.6362764, 1.4464237, $d38a$155 Chem. de Lanusse$d38a$, $d38c$Toulouse$d38c$, $d38p$31200$d38p$, $d38g$ChIJOZC18r6jrhIRV0TZDzjUAIg$d38g$, 5.0, 9, $d38s$Maquilleur$d38s$),
  ($d39n$Franck Provost - Coiffeur Toulouse$d39n$, $d39d$Coiffeur à Toulouse.
Téléphone : 05 61 62 62 47
Site web : https://www.franckprovost.com/salons/2-rue-d-aubuisson-31000-toulouse?utm_campaign=gbp_siteweb_P0260&utm_id=gbp_siteweb&utm_medium=siteweb&utm_source=gbp
Note Google : 4.7/5 (515 avis)
Google Maps : https://maps.google.com/?cid=1977081751397525511&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d39d$, true, 43.6037734, 1.4510874999999999, $d39a$2 Rue d'Aubuisson$d39a$, $d39c$Toulouse$d39c$, $d39p$31000$d39p$, $d39g$ChIJcbqgiuO6rhIRB-j0u2ABcBs$d39g$, 4.7, 515, $d39s$Coiffeur$d39s$),
  ($d40n$Frayssinet Joaillier$d40n$, $d40d$Accessoires à Toulouse.
Téléphone : 05 61 53 99 04
Site web : http://www.frayssinet-joaillier.fr/
Note Google : 4.4/5 (141 avis)
Google Maps : https://maps.google.com/?cid=6729414046637403470&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d40d$, true, 43.5984203, 1.4454072999999998, $d40a$33 Rue du Languedoc$d40a$, $d40c$Toulouse$d40c$, $d40p$31000$d40p$, $d40g$ChIJBY6Y3YK8rhIRTq1Y5GuuY10$d40g$, 4.4, 141, $d40s$Accessoires$d40s$),
  ($d41n$Frayssinet Joaillier Capitole$d41n$, $d41d$Accessoires à Toulouse.
Téléphone : 05 61 53 99 04
Site web : http://www.frayssinet-joaillier.fr/
Note Google : 4.6/5 (54 avis)
Google Maps : https://maps.google.com/?cid=510440365194060234&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d41d$, true, 43.6038521, 1.4443791, $d41a$73 Rue de la Pomme$d41a$, $d41c$Toulouse$d41c$, $d41p$31000$d41p$, $d41g$ChIJjSwa5p28rhIRyqFpxs5yFQc$d41g$, 4.6, 54, $d41s$Accessoires$d41s$),
  ($d42n$Gabriel Joaillier$d42n$, $d42d$Accessoires à Toulouse.
Téléphone : 09 73 54 89 43
Site web : https://www.gabriel-joaillier.com/
Note Google : 4.9/5 (220 avis)
Google Maps : https://maps.google.com/?cid=3454626604603104745&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d42d$, true, 43.60746830000001, 1.4464434, $d42a$27 Bd de Strasbourg 2 étage$d42a$, $d42c$Toulouse$d42c$, $d42p$31000$d42p$, $d42g$ChIJL-ZvT-i9rhIR6V377pdM8S8$d42g$, 4.9, 220, $d42s$Accessoires$d42s$),
  ($d43n$Graines de Beau M - bijoux$d43n$, $d43d$Accessoires à Toulouse.
Téléphone : 06 85 23 99 01
Site web : http://www.grainesdebeaum.fr/
Note Google : 5/5 (131 avis)
Google Maps : https://maps.google.com/?cid=5299521771302979299&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d43d$, true, 43.604839, 1.4538993999999998, $d43a$4 Rue Albanie Regourd$d43a$, $d43c$Toulouse$d43c$, $d43p$31000$d43p$, $d43g$ChIJ1TbwgJ28rhIR44b2Efmui0k$d43g$, 5.0, 131, $d43s$Accessoires$d43s$),
  ($d44n$Hair Mind$d44n$, $d44d$Coiffeur à Toulouse.
Téléphone : 05 61 23 42 75
Site web : https://www.salonhairmind.com/
Note Google : 4.6/5 (255 avis)
Google Maps : https://maps.google.com/?cid=12975111161291258098&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d44d$, true, 43.6047988, 1.4418651, $d44a$4 Rue Jean-Antoine Romiguières$d44a$, $d44c$Toulouse$d44c$, $d44p$31000$d44p$, $d44g$ChIJTcX-i2G7rhIR8rj4KdvaELQ$d44g$, 4.6, 255, $d44s$Coiffeur$d44s$),
  ($d45n$JOSLAYHAIR & BEAUTY$d45n$, $d45d$Coiffeur à Toulouse.
Téléphone : 05 34 30 07 77
Site web : https://www.joslayhairbeauty.com/
Note Google : 4.7/5 (240 avis)
Google Maps : https://maps.google.com/?cid=1495192557402580674&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d45d$, true, 43.635312, 1.4726074, $d45a$24 Rue André Vasseur$d45a$, $d45c$Toulouse$d45c$, $d45p$31200$d45p$, $d45g$ChIJfwtn1TGjrhIRwubJhrX9vxQ$d45g$, 4.7, 240, $d45s$Coiffeur$d45s$),
  ($d46n$Joaillerie Gemmyo - Toulouse$d46n$, $d46d$Accessoires à Toulouse.
Téléphone : 01 42 46 90 89
Site web : https://www.gemmyo.com/
Note Google : 4.7/5 (113 avis)
Google Maps : https://maps.google.com/?cid=1975240862250822451&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d46d$, true, 43.6010287, 1.448083, $d46a$36 Rue Boulbonne$d46a$, $d46c$Toulouse$d46c$, $d46p$31000$d46p$, $d46g$ChIJpYUEU6-9rhIRM-tLVBl3aRs$d46g$, 4.7, 113, $d46s$Accessoires$d46s$),
  ($d47n$Joaillerie Hucteau$d47n$, $d47d$Accessoires à Toulouse.
Téléphone : 05 61 55 22 82
Site web : https://joailleriehucteau.com/
Note Google : 5/5 (17 avis)
Google Maps : https://maps.google.com/?cid=15337997045728814506&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d47d$, true, 43.5974672, 1.4485097, $d47a$20 Rue Perchepinte$d47a$, $d47c$Toulouse$d47c$, $d47p$31000$d47p$, $d47g$ChIJM7-Myra9rhIRqiWohAyD29Q$d47g$, 5.0, 17, $d47s$Accessoires$d47s$),
  ($d48n$Joaillerie PIQUEMAL BARON SARL CARLA$d48n$, $d48d$Accessoires à Toulouse.
Téléphone : 05 61 52 77 47
Site web : https://www.joailleriepiquemalbaron.com/
Note Google : 4.5/5 (68 avis)
Google Maps : https://maps.google.com/?cid=439830332723433765&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d48d$, true, 43.5996652, 1.4474806999999998, $d48a$27 Rue Croix Baragnon$d48a$, $d48c$Toulouse$d48c$, $d48p$31000$d48p$, $d48g$ChIJEdd1s5y8rhIRJRFsd1uXGgY$d48g$, 4.5, 68, $d48s$Accessoires$d48s$),
  ($d49n$Joaillerie Zeina Toulouse$d49n$, $d49d$Accessoires à Toulouse.
Téléphone : 05 82 95 09 00
Site web : https://www.zeina-alliances.com/pages/boutique/toulouse?utm_source=googlebusinessprofile&utm_medium=organic&utm_campaign=toulouse
Note Google : 4.7/5 (177 avis)
Google Maps : https://maps.google.com/?cid=3520553124417566117&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d49d$, true, 43.5999859, 1.4472817, $d49a$4 Rue des Arts$d49a$, $d49c$Toulouse$d49c$, $d49p$31000$d49p$, $d49g$ChIJHYHytpy8rhIRpfXM-WmE2zA$d49g$, 4.7, 177, $d49s$Accessoires$d49s$),
  ($d50n$Jollof Coiffure Afro - Européen$d50n$, $d50d$Coiffeur à Toulouse.
Téléphone : 09 83 54 26 32
Note Google : 4.7/5 (75 avis)
Google Maps : https://maps.google.com/?cid=5609699888103578417&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d50d$, true, 43.5986814, 1.433521, $d50a$12 Rue Reclusane$d50a$, $d50c$Toulouse$d50c$, $d50p$31300$d50p$, $d50g$ChIJe56GltC7rhIRMVv2plOo2U0$d50g$, 4.7, 75, $d50s$Coiffeur$d50s$),
  ($d51n$L'Institut de Coiffure$d51n$, $d51d$Coiffeur à Toulouse.
Téléphone : 05 61 21 64 04
Note Google : 4.4/5 (107 avis)
Google Maps : https://maps.google.com/?cid=12947111050404594795&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d51d$, true, 43.605201699999995, 1.4436238, $d51a$3 Rue Charles de Rémusat$d51a$, $d51c$Toulouse$d51c$, $d51p$31000$d51p$, $d51g$ChIJTUNVHJ68rhIRa4TmUudgrbM$d51g$, 4.4, 107, $d51s$Coiffeur$d51s$),
  ($d52n$LA VILLA SORIANO • Coiffure & Esthétique$d52n$, $d52d$Coiffeur à Toulouse.
Téléphone : 05 34 33 53 03
Site web : https://www.lavillasoriano.fr/
Note Google : 4.5/5 (314 avis)
Google Maps : https://maps.google.com/?cid=4249942750708488846&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d52d$, true, 43.6017848, 1.4468497999999999, $d52a$17 Rue des Arts$d52a$, $d52c$Toulouse$d52c$, $d52p$31000$d52p$, $d52g$ChIJlYnN9Zy8rhIRjtq5I2rU-jo$d52g$, 4.5, 314, $d52s$Coiffeur$d52s$),
  ($d53n$LE STUDIO (anciennement Art Coiffure)$d53n$, $d53d$Coiffeur à Toulouse.
Téléphone : 05 61 23 42 60
Site web : https://www.joslayhair.com/studio-coiffure-coloration-soins-boucles-toulouse
Note Google : 4.7/5 (74 avis)
Google Maps : https://maps.google.com/?cid=286201737097198433&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d53d$, true, 43.607208, 1.4311099999999999, $d53a$10 Bd Maréchal Leclerc$d53a$, $d53c$Toulouse$d53c$, $d53p$31000$d53p$, $d53g$ChIJ4-VKCGm7rhIRYTvHqfbK-AM$d53g$, 4.7, 74, $d53s$Coiffeur$d53s$),
  ($d54n$LIUQI | Robe de mariée | Robe de soirée sur-mesure$d54n$, $d54d$Tenues à Toulouse.
Site web : https://www.liuqi-toulouse.com/
Note Google : 5/5 (1 avis)
Google Maps : https://maps.google.com/?cid=8895990987945294748&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d54d$, true, 43.6396498, 1.4689914, $d54a$FR, 2 Imp. Petit Jacques$d54a$, $d54c$Toulouse$d54c$, $d54p$31200$d54p$, $d54g$ChIJC2KD16y_rhIRnDuOqavodHs$d54g$, 5.0, 1, $d54s$Tenues$d54s$),
  ($d55n$La Belle Boucle Toulouse - Boutique et salon de coiffure cheveux bouclés, ondulés, frisés, crépus$d55n$, $d55d$Coiffeur à Toulouse.
Site web : https://labelleboucle.fr/pages/boutique/la-belle-boucle-studio-toulouse?utm_source=gmb
Note Google : 4.8/5 (535 avis)
Google Maps : https://maps.google.com/?cid=14617620906228940438&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d55d$, true, 43.6022616, 1.4420058, $d55a$13 Rue Sainte-Ursule$d55a$, $d55c$Toulouse$d55c$, $d55p$31000$d55p$, $d55g$ChIJCT2yHwC7rhIRln4ZScQ43Mo$d55g$, 4.8, 535, $d55s$Coiffeur$d55s$),
  ($d56n$La Brigade du Tif salon de coiffure végétal et tarification non genrés$d56n$, $d56d$Coiffeur à Toulouse.
Téléphone : 06 70 24 34 09
Site web : http://labrigadedutif.com/
Note Google : 4.7/5 (196 avis)
Google Maps : https://maps.google.com/?cid=18294589318446211689&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d56d$, true, 43.6078152, 1.4284903, $d56a$24 Av. Paul Séjourné$d56a$, $d56c$Toulouse$d56c$, $d56p$31000$d56p$, $d56g$ChIJwdvkJGq7rhIRaWKkZQ5w4_0$d56g$, 4.7, 196, $d56s$Coiffeur$d56s$),
  ($d57n$La Suite Le coiffeur$d57n$, $d57d$Coiffeur à L'Union.
Téléphone : 06 40 32 07 61
Site web : http://www.lasuitelecoiffeur.com/
Note Google : 4.9/5 (178 avis)
Google Maps : https://maps.google.com/?cid=16815748692035387304&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d57d$, true, 43.6621364, 1.4781339999999998, $d57a$7 bis Chem. du Sablet$d57a$, $d57c$L'Union$d57c$, $d57p$31240$d57p$, $d57g$ChIJlZwZCDejrhIRqD8CfVeKXek$d57g$, 4.9, 178, $d57s$Coiffeur$d57s$),
  ($d58n$Lazorthes Coiffure$d58n$, $d58d$Coiffeur à Toulouse.
Téléphone : 05 61 22 72 03
Site web : https://lazorthes.com/
Note Google : 4.7/5 (193 avis)
Google Maps : https://maps.google.com/?cid=10062672372652184075&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d58d$, true, 43.60733, 1.4460575, $d58a$27 Rue du Rem Matabiau$d58a$, $d58c$Toulouse$d58c$, $d58p$31000$d58p$, $d58g$ChIJy14FDJ-8rhIRCxISZzXLpYs$d58g$, 4.7, 193, $d58s$Coiffeur$d58s$),
  ($d59n$Le Coven de Hele (Salon de coiffure privé)$d59n$, $d59d$Coiffeur à Toulouse.
Téléphone : 06 08 55 98 32
Site web : https://www.lecovendehele.fr/
Note Google : 4.8/5 (101 avis)
Google Maps : https://maps.google.com/?cid=133214368349365248&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d59d$, true, 43.6395108, 1.4541737, $d59a$8 Rue Bertran$d59a$, $d59c$Toulouse$d59c$, $d59p$31200$d59p$, $d59g$ChIJQ4I-a9OlrhIRACRxIMNF2QE$d59g$, 4.8, 101, $d59s$Coiffeur$d59s$),
  ($d60n$Le Royaume de l'Homme Coiffure Delagarde$d60n$, $d60d$Coiffeur à Toulouse.
Téléphone : 09 83 67 63 77
Site web : https://www.planity.com/le-royaume-de-lhomme-31000-toulouse
Note Google : 4.9/5 (80 avis)
Google Maps : https://maps.google.com/?cid=713548344249737544&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d60d$, true, 43.6057054, 1.4344578, $d60a$1 Bd Armand Duportal$d60a$, $d60c$Toulouse$d60c$, $d60p$31000$d60p$, $d60g$ChIJ0QaOJXi7rhIRSOESRXAI5wk$d60g$, 4.9, 80, $d60s$Coiffeur$d60s$),
  ($d61n$Les Comètes tenues mariée et cérémonie / Sur rendez vous$d61n$, $d61d$Tenues à Toulouse.
Téléphone : 06 99 04 90 77
Site web : https://lescometes-mariage.fr/
Note Google : 5/5 (20 avis)
Google Maps : https://maps.google.com/?cid=5948849191504361108&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d61d$, true, 43.614135399999995, 1.4444010999999999, $d61a$39 Rue du Printemps$d61a$, $d61c$Toulouse$d61c$, $d61p$31000$d61p$, $d61g$ChIJgUff_ba9rhIRlLb8QdKOjlI$d61g$, 5.0, 20, $d61s$Tenues$d61s$),
  ($d62n$Les Mariées de Julie$d62n$, $d62d$Tenues à Toulouse.
Téléphone : 07 71 59 59 83
Site web : https://www.lesmarieesdejulie.com/
Note Google : 5/5 (14 avis)
Google Maps : https://maps.google.com/?cid=16484073977896961944&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d62d$, true, 43.6054983, 1.4457889, $d62a$36 Rue d'Alsace Lorraine$d62a$, $d62c$Toulouse$d62c$, $d62p$31000$d62p$, $d62g$ChIJ0xNmTby9rhIRmAfPT_Ixw-Q$d62g$, 5.0, 14, $d62s$Tenues$d62s$),
  ($d63n$Les Mariées de Sandrillon$d63n$, $d63d$Tenues à Aucamville.
Téléphone : 06 43 69 53 23
Site web : https://les-mariees-de-sandrillon.fr/
Note Google : 5/5 (80 avis)
Google Maps : https://maps.google.com/?cid=13499820955406271412&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d63d$, true, 43.802935399999996, 1.2151911, $d63a$8 Pl. de la Liberté$d63a$, $d63c$Aucamville$d63c$, $d63p$82600$d63p$, $d63g$ChIJgU82evoBrBIRtINdQqL_WLs$d63g$, 5.0, 80, $d63s$Tenues$d63s$),
  ($d64n$Les Roses de Louise - Robes de mariées & Sur-mesure Toulouse$d64n$, $d64d$Tenues à Toulouse.
Téléphone : 06 61 24 99 83
Site web : https://www.lesrosesdelouise.fr/sur-mesure/
Note Google : 5/5 (45 avis)
Google Maps : https://maps.google.com/?cid=413334358924559394&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d64d$, true, 43.6207796, 1.4407546999999998, $d64a$6 Imp. Belou$d64a$, $d64c$Toulouse$d64c$, $d64p$31200$d64p$, $d64g$ChIJVVVVVem6rhIRIoQp1Wh1vAU$d64g$, 5.0, 45, $d64s$Tenues$d64s$),
  ($d65n$Lola Nt maquilleuse professionnelle$d65n$, $d65d$Maquilleur à Toulouse.
Site web : https://instagram.com/lolant_makeuppro?igshid=ts0d64ku8r5m
Note Google : 5/5 (191 avis)
Google Maps : https://maps.google.com/?cid=17274934651464340747&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d65d$, true, 43.5737484, 1.4870096000000002, $d65a$44 Rue Emile Lecrivain$d65a$, $d65c$Toulouse$d65c$, $d65p$31400$d65p$, $d65g$ChIJ3cEReFC9rhIRC1We-onlvO8$d65g$, 5.0, 191, $d65s$Maquilleur$d65s$),
  ($d66n$Louise Dentelle - Robe de Mariée$d66n$, $d66d$Tenues à Toulouse.
Téléphone : 06 47 94 76 02
Site web : https://louisedentelle.com/
Note Google : 5/5 (50 avis)
Google Maps : https://maps.google.com/?cid=4349181532927157019&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d66d$, true, 43.5955723, 1.4707542999999998, $d66a$13 Rue Saint-Paër$d66a$, $d66c$Toulouse$d66c$, $d66p$31500$d66p$, $d66g$ChIJ6a-bMLO9rhIRG-PPrY9lWzw$d66g$, 5.0, 50, $d66s$Tenues$d66s$),
  ($d67n$Léa Paloma - Créatrice robe de Mariée$d67n$, $d67d$Tenues à Toulouse.
Téléphone : 06 87 00 95 38
Site web : https://www.leapaloma.com/
Note Google : 5/5 (3 avis)
Google Maps : https://maps.google.com/?cid=16365802505511394154&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d67d$, true, 43.597700200000006, 1.4441581, $d67a$9 Pl. des Carmes$d67a$, $d67c$Toulouse$d67c$, $d67p$31000$d67p$, $d67g$ChIJt8NW6XS9rhIRals0RasCH-M$d67g$, 5.0, 3, $d67s$Tenues$d67s$),
  ($d68n$MB COIFFURE$d68n$, $d68d$Coiffeur à Toulouse.
Téléphone : 05 62 83 69 04
Site web : https://www.planity.com/mb-coiffure-31300-toulouse
Note Google : 4.7/5 (524 avis)
Google Maps : https://maps.google.com/?cid=1930626160187573206&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d68d$, true, 43.602385, 1.4082367, $d68a$1 Place de la Charte des Libertés Communales$d68a$, $d68c$Toulouse$d68c$, $d68p$31300$d68p$, $d68g$ChIJswisqJy7rhIR1oMOiEP2yho$d68g$, 4.7, 524, $d68s$Coiffeur$d68s$),
  ($d69n$Magasin Robe De Mariee$d69n$, $d69d$Tenues à Toulouse.
Note Google : 5/5 (1 avis)
Google Maps : https://maps.google.com/?cid=5758124931898443586&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d69d$, true, 43.5953476, 1.4196346, $d69a$52 Bd Gabriel Koenigs$d69a$, $d69c$Toulouse$d69c$, $d69p$31300$d69p$, $d69g$ChIJS-vCAAy7rhIRQocgIh746E8$d69g$, 5.0, 1, $d69s$Tenues$d69s$),
  ($d70n$Mains d’Or - Barber - Toulouse$d70n$, $d70d$Coiffeur à Toulouse.
Téléphone : 09 54 04 75 01
Note Google : 4.6/5 (303 avis)
Google Maps : https://maps.google.com/?cid=4418709568954415346&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d70d$, true, 43.607506, 1.4444572, $d70a$3 Rue de Périgord$d70a$, $d70c$Toulouse$d70c$, $d70p$31000$d70p$, $d70g$ChIJkVOt44C9rhIR8rglD_FoUj0$d70g$, 4.6, 303, $d70s$Coiffeur$d70s$),
  ($d71n$Maison C Robe de mariée Toulouse$d71n$, $d71d$Tenues à Toulouse.
Téléphone : 07 50 29 73 89
Site web : https://www.cynthia-renolde-robedemariee.fr/
Note Google : 5/5 (11 avis)
Google Maps : https://maps.google.com/?cid=16317736481477736675&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d71d$, true, 43.6023012, 1.4472171, $d71a$14 Pl. Saint-Georges$d71a$, $d71c$Toulouse$d71c$, $d71p$31000$d71p$, $d71g$ChIJB6R66Xy9rhIR47jp9N8-dOI$d71g$, 5.0, 11, $d71s$Tenues$d71s$),
  ($d72n$Maison Muses Coiffure$d72n$, $d72d$Coiffeur à Toulouse.
Site web : https://www.maison-muses.fr/
Note Google : 4.9/5 (232 avis)
Google Maps : https://maps.google.com/?cid=135247409171634300&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d72d$, true, 43.606701799999996, 1.4507478999999999, $d72a$48 All. Jean Jaurès$d72a$, $d72c$Toulouse$d72c$, $d72p$31000$d72p$, $d72g$ChIJxUV3IHy9rhIRfJh3VM1-4AE$d72g$, 4.9, 232, $d72s$Coiffeur$d72s$),
  ($d73n$Maison Sublime - Studio Maquillage & Bien Être$d73n$, $d73d$Maquilleur à Toulouse.
Téléphone : 06 46 62 42 71
Site web : https://www.planity.com/maison-sublime-31300-toulouse
Note Google : 5/5 (24 avis)
Google Maps : https://maps.google.com/?cid=13361899811898280662&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d73d$, true, 43.597421399999995, 1.427578, $d73a$28 Av. Etienne Billières$d73a$, $d73c$Toulouse$d73c$, $d73p$31300$d73p$, $d73g$ChIJoWKPC-reM0MR1kqOpBUBb7k$d73g$, 5.0, 24, $d73s$Maquilleur$d73s$),
  ($d74n$Maquillage enfants Toulouse Sandie Mille Couleurs$d74n$, $d74d$Maquilleur à Rabastens.
Téléphone : 06 76 56 76 14
Site web : https://www.maquillagesandie.com/
Note Google : 5/5 (33 avis)
Google Maps : https://maps.google.com/?cid=2042118099062680951&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d74d$, true, 43.8411562, 1.7595823, $d74a$Plaine de Fongrave$d74a$, $d74c$Rabastens$d74c$, $d74p$81800$d74p$, $d74g$ChIJG7-aErIrrBIRd-0GbJcPVxw$d74g$, 5.0, 33, $d74s$Maquilleur$d74s$),
  ($d75n$Marc Alexandre Frezal artisan metier d'art en horlogerie, bijouterie.$d75n$, $d75d$Accessoires à Toulouse.
Téléphone : 05 61 62 97 30
Note Google : 4.7/5 (55 avis)
Google Maps : https://maps.google.com/?cid=8322045663874067354&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d75d$, true, 43.604552, 1.451795, $d75a$24 Rue de la Colombette$d75a$, $d75c$Toulouse$d75c$, $d75p$31000$d75p$, $d75g$ChIJab63i5m8rhIRmivLb3DYfXM$d75g$, 4.7, 55, $d75s$Accessoires$d75s$),
  ($d76n$Marine Sicard Le studio de coiffure$d76n$, $d76d$Coiffeur à Toulouse.
Téléphone : 06 75 50 54 62
Site web : https://www.marinesicard.fr/fr/
Note Google : 4.9/5 (147 avis)
Google Maps : https://maps.google.com/?cid=15752045303142379938&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d76d$, true, 43.5991164, 1.446115, $d76a$13 Rue Bouquières$d76a$, $d76c$Toulouse$d76c$, $d76p$31000$d76p$, $d76g$ChIJp5qIIru9rhIRonGpy76Bmto$d76g$, 4.9, 147, $d76s$Coiffeur$d76s$),
  ($d77n$Mariée Du Sud$d77n$, $d77d$Tenues à Toulouse.
Téléphone : 06 95 31 08 53
Site web : https://www.marieedusud.com/
Note Google : 4.9/5 (147 avis)
Google Maps : https://maps.google.com/?cid=15375966296152125161&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d77d$, true, 43.5996321, 1.4479372, $d77a$37 Rue Croix Baragnon$d77a$, $d77c$Toulouse$d77c$, $d77p$31000$d77p$, $d77g$ChIJwQiWOIm6rhIR6a6GiOFnYtU$d77g$, 4.9, 147, $d77s$Tenues$d77s$),
  ($d78n$Miailhes Joailliers$d78n$, $d78d$Accessoires à Toulouse.
Téléphone : 05 61 48 05 66
Site web : https://miailhes.fr/
Note Google : 4.8/5 (51 avis)
Google Maps : https://maps.google.com/?cid=9893059030413801912&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d78d$, true, 43.6353926, 1.4640024, $d78a$114 Rte d'Albi$d78a$, $d78c$Toulouse$d78c$, $d78p$31200$d78p$, $d78g$ChIJZRKtyjejrhIRuPnIwcU0S4k$d78g$, 4.8, 51, $d78s$Accessoires$d78s$),
  ($d79n$Mille et une mariées$d79n$, $d79d$Tenues à Toulouse.
Téléphone : 07 81 86 20 47
Note Google : 4.6/5 (125 avis)
Google Maps : https://maps.google.com/?cid=9003814988521097880&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d79d$, true, 43.5629337, 1.4079544, $d79a$route de FACE BOUCHERIE et FEU ROUGE ( boutique rosé poudré, 180 Rte de Seysses$d79a$, $d79c$Toulouse$d79c$, $d79p$31100$d79p$, $d79g$ChIJh61tvc27rhIRmEojHgf683w$d79g$, 4.6, 125, $d79s$Tenues$d79s$),
  ($d80n$Mily Cuts Coiffure$d80n$, $d80d$Coiffeur à Toulouse.
Téléphone : 06 88 80 56 27
Site web : https://www.milycuts-coiffure.com/
Note Google : 4.9/5 (74 avis)
Google Maps : https://maps.google.com/?cid=13785797041361190556&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d80d$, true, 43.600893899999996, 1.4345983999999998, $d80a$45 Rue Charles Viguerie$d80a$, $d80c$Toulouse$d80c$, $d80p$31300$d80p$, $d80g$ChIJO2BoQmW7rhIRnP72a179UL8$d80g$, 4.9, 74, $d80s$Coiffeur$d80s$),
  ($d81n$Monsieur Le Joaillier$d81n$, $d81d$Accessoires à Toulouse.
Téléphone : 09 75 53 31 84
Note Google : 5/5 (57 avis)
Google Maps : https://maps.google.com/?cid=2297328062596893803&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d81d$, true, 43.6043392, 1.4508508999999998, $d81a$3 Rue de la Colombette$d81a$, $d81c$Toulouse$d81c$, $d81p$31000$d81p$, $d81g$ChIJ-Q0dgJm8rhIRa8yff7O_4R8$d81g$, 5.0, 57, $d81s$Accessoires$d81s$),
  ($d82n$Muriel Prando Créatrice - Robes de mariée Toulouse$d82n$, $d82d$Tenues à Toulouse.
Téléphone : 05 61 99 35 67
Site web : http://www.murielprando.com/
Note Google : 4.7/5 (124 avis)
Google Maps : https://maps.google.com/?cid=7562201478981045532&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d82d$, true, 43.605473499999995, 1.458326, $d82a$9 Av. de la Gloire$d82a$, $d82c$Toulouse$d82c$, $d82p$31500$d82p$, $d82g$ChIJU9GAGJS8rhIRHE2Zyi1W8mg$d82g$, 4.7, 124, $d82s$Tenues$d82s$),
  ($d83n$NSV Coiffure$d83n$, $d83d$Coiffeur à Toulouse.
Téléphone : 05 61 29 80 67
Note Google : 4.9/5 (182 avis)
Google Maps : https://maps.google.com/?cid=12263209873608678256&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d83d$, true, 43.601075699999996, 1.4486168, $d83a$12 R. d'Astorg$d83a$, $d83c$Toulouse$d83c$, $d83p$31000$d83p$, $d83g$ChIJucFdYZu8rhIRcBuCImisL6o$d83g$, 4.9, 182, $d83s$Coiffeur$d83s$),
  ($d84n$NV Joailliers$d84n$, $d84d$Accessoires à Toulouse.
Téléphone : 05 62 26 76 02
Site web : https://nvjoailliers.fr/
Note Google : 4.8/5 (92 avis)
Google Maps : https://maps.google.com/?cid=4559935951062123777&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d84d$, true, 43.599973899999995, 1.4454985999999999, $d84a$7 Rue d'Alsace Lorraine$d84a$, $d84c$Toulouse$d84c$, $d84p$31000$d84p$, $d84g$ChIJfajELp28rhIRAUWXgZYlSD8$d84g$, 4.8, 92, $d84s$Accessoires$d84s$),
  ($d85n$NZAMBE COIFFURE$d85n$, $d85d$Coiffeur à Toulouse.
Téléphone : 07 83 34 72 88
Site web : https://instagram.com/ya_nzambe__coiffure?utm_medium=copy_link
Note Google : 4.6/5 (133 avis)
Google Maps : https://maps.google.com/?cid=11539271603404462373&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d85d$, true, 43.601526299999996, 1.458234, $d85a$40 Rue du Pont Guilheméry$d85a$, $d85c$Toulouse$d85c$, $d85p$31500$d85p$, $d85g$ChIJ3fp8__q9rhIRJdmst2K6I6A$d85g$, 4.6, 133, $d85s$Coiffeur$d85s$),
  ($d86n$Nicolas Tourrel - Joaillier TOULOUSE - Meilleur Ouvrier de France$d86n$, $d86d$Accessoires à Toulouse.
Téléphone : 05 61 52 48 32
Site web : https://tourrel-joaillier.fr/
Note Google : 4.8/5 (38 avis)
Google Maps : https://maps.google.com/?cid=1487465833184140528&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d86d$, true, 43.6003033, 1.4481887, $d86a$13 Rue Boulbonne$d86a$, $d86c$Toulouse$d86c$, $d86p$31000$d86p$, $d86g$ChIJLdGFp5y8rhIR8Jx4WkuKpBQ$d86g$, 4.8, 38, $d86s$Accessoires$d86s$),
  ($d87n$Plumetis - Robes de mariée Toulouse$d87n$, $d87d$Tenues à Toulouse.
Téléphone : 05 61 53 49 22
Site web : https://www.plumetis-toulouse.fr/
Note Google : 4.8/5 (196 avis)
Google Maps : https://maps.google.com/?cid=11469357944997788069&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d87d$, true, 43.6029136, 1.4472384, $d87a$9 Rue Saint-Antoine du T$d87a$, $d87c$Toulouse$d87c$, $d87p$31000$d87p$, $d87g$ChIJuaSyiQa7rhIRpblloUhYK58$d87g$, 4.8, 196, $d87s$Tenues$d87s$),
  ($d88n$Prestige Flow Barber shop$d88n$, $d88d$Coiffeur à Toulouse.
Téléphone : 07 66 40 83 77
Site web : https://www.instagram.com/prestige_flow_barber_shop?igsh=emxiMjNhdG5rNGww
Note Google : 4.9/5 (182 avis)
Google Maps : https://maps.google.com/?cid=17595043890409615794&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d88d$, true, 43.5963765, 1.4443789, $d88a$1 bis Rue des Régans$d88a$, $d88c$Toulouse$d88c$, $d88p$31000$d88p$, $d88g$ChIJuTKEiQu9rhIRsrFFHzInLvQ$d88g$, 4.9, 182, $d88s$Coiffeur$d88s$),
  ($d89n$REVOLUCION Coiffure sur Mesure$d89n$, $d89d$Coiffeur à Toulouse.
Téléphone : 09 52 66 72 06
Site web : https://www.planity.com/revolucion-coiffeur-sur-mesure-31000-toulouse
Note Google : 4.8/5 (324 avis)
Google Maps : https://maps.google.com/?cid=9366809138069803139&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d89d$, true, 43.605416, 1.45332, $d89a$16 Rue Maury$d89a$, $d89c$Toulouse$d89c$, $d89p$31000$d89p$, $d89g$ChIJ09-5XZe8rhIRg5CImUiX_YE$d89g$, 4.8, 324, $d89s$Coiffeur$d89s$),
  ($d90n$Rieunier Joailliers$d90n$, $d90d$Accessoires à Toulouse.
Téléphone : 05 61 25 26 06
Site web : http://rieunier-joailliers-horlogers.com/?utm_source=gmb
Note Google : 4.5/5 (30 avis)
Google Maps : https://maps.google.com/?cid=13676373025424651442&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d90d$, true, 43.599911999999996, 1.4477350999999998, $d90a$22 Rue Croix Baragnon$d90a$, $d90c$Toulouse$d90c$, $d90p$31000$d90p$, $d90g$ChIJUW3ZsZy8rhIRsrQrXM48zL0$d90g$, 4.5, 30, $d90s$Accessoires$d90s$),
  ($d91n$Robe Elysée - Robes de mariée à Toulouse$d91n$, $d91d$Tenues à Toulouse.
Téléphone : 06 56 66 60 08
Site web : https://www.robedemarieetoulouse.fr/
Note Google : 5/5 (162 avis)
Google Maps : https://maps.google.com/?cid=10436698750106666509&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d91d$, true, 43.6001404, 1.447706, $d91a$22 Rue Croix Baragnon$d91a$, $d91c$Toulouse$d91c$, $d91p$31000$d91p$, $d91g$ChIJtxqOwR69rhIRDQbfmzea1pA$d91g$, 5.0, 162, $d91s$Tenues$d91s$),
  ($d92n$SOPHIE GAMARD : COIFFEUR EXPERT COLORISTE balayage olaplex et shu uemura soin ybera$d92n$, $d92d$Coiffeur à Toulouse.
Téléphone : 09 67 34 04 75
Site web : http://sophiegamard.fr/
Note Google : 4.7/5 (208 avis)
Google Maps : https://maps.google.com/?cid=1919210148031406852&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d92d$, true, 43.604439199999995, 1.4533243999999998, $d92a$33 Rue de la Colombette$d92a$, $d92c$Toulouse$d92c$, $d92p$31000$d92p$, $d92g$ChIJC_1UVJe8rhIRBKO8EnZnoho$d92g$, 4.7, 208, $d92s$Coiffeur$d92s$),
  ($d93n$Salon By karen Coiffure et Esthétique$d93n$, $d93d$Coiffeur à Toulouse.
Téléphone : 05 61 80 57 43
Site web : http://salonbykaren.com/
Note Google : 4.7/5 (175 avis)
Google Maps : https://maps.google.com/?cid=8635327144881493825&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d93d$, true, 43.5964788, 1.4614992, $d93a$50 Av. Jean Rieux$d93a$, $d93c$Toulouse$d93c$, $d93p$31500$d93p$, $d93g$ChIJY7ioc468rhIRQRfzTUnY1nc$d93g$, 4.7, 175, $d93s$Coiffeur$d93s$),
  ($d94n$Salon de coiffure Bio Madame Sans Gêne à Toulouse quartier saint cyprien$d94n$, $d94d$Coiffeur à Toulouse.
Téléphone : 09 81 25 31 83
Site web : http://www.madamesansgene.fr/
Note Google : 4.6/5 (337 avis)
Google Maps : https://maps.google.com/?cid=676819174023563932&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d94d$, true, 43.5985091, 1.435358, $d94a$28 Rue de la République$d94a$, $d94c$Toulouse$d94c$, $d94p$31300$d94p$, $d94g$ChIJ9WSdiqC8rhIRnArZ7HOLZAk$d94g$, 4.6, 337, $d94s$Coiffeur$d94s$),
  ($d95n$Sarah Calvayrac Création Styliste Robes de Mariées$d95n$, $d95d$Tenues à Toulouse.
Téléphone : 07 71 74 94 94
Note Google : 5/5 (5 avis)
Google Maps : https://maps.google.com/?cid=9151178333601367255&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d95d$, true, 43.604858899999996, 1.482084, $d95a$4 Imp. Jean Chaubet bat b appart 31$d95a$, $d95c$Toulouse$d95c$, $d95p$31500$d95p$, $d95g$ChIJib7USjG9rhIR14SPmjWE_34$d95g$, 5.0, 5, $d95s$Tenues$d95s$),
  ($d96n$Sarah Fekir Coiffeuse-Maquilleuse$d96n$, $d96d$Maquilleur à Toulouse.
Téléphone : 06 58 35 56 03
Site web : http://www.maquillagetoulouse.com/
Note Google : 5/5 (43 avis)
Google Maps : https://maps.google.com/?cid=8202488500340412321&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d96d$, true, 43.6096978, 1.4437124, $d96a$1 Rue de l'Arc$d96a$, $d96c$Toulouse$d96c$, $d96p$31000$d96p$, $d96g$ChIJW4v_nM-9rhIRoU8EGdUX1XE$d96g$, 5.0, 43, $d96s$Maquilleur$d96s$),
  ($d97n$So In Love - Créatrices de robes de mariée sur mesure$d97n$, $d97d$Tenues à Toulouse.
Téléphone : 07 82 53 36 60
Site web : https://so-inlove.fr/
Note Google : 5/5 (39 avis)
Google Maps : https://maps.google.com/?cid=15959494833241981097&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d97d$, true, 43.6141351, 1.4444137, $d97a$39 Rue du Printemps$d97a$, $d97c$Toulouse$d97c$, $d97p$31000$d97p$, $d97g$ChIJG0KWpr68rhIRqQASav6De90$d97g$, 5.0, 39, $d97s$Tenues$d97s$),
  ($d98n$Swatoa - Conseillère en image & Maquilleuse professionnelle$d98n$, $d98d$Maquilleur à Saubens.
Téléphone : 06 62 96 96 25
Site web : https://www.instagram.com/swatoa.studio?igsh=cDM2MXFtN3NxeW4z
Note Google : 5/5 (42 avis)
Google Maps : https://maps.google.com/?cid=16443232653769423180&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d98d$, true, 43.4785275, 1.3542843999999998, $d98a$Rue Eole$d98a$, $d98c$Saubens$d98c$, $d98p$31600$d98p$, $d98g$ChIJAwdJjVW7rhIRTLkHh_oYMuQ$d98g$, 5.0, 42, $d98s$Maquilleur$d98s$),
  ($d99n$Tania Todorova - Robe de mariée/soirée Toulouse Showroom Sur Rendez-vous uniquement$d99n$, $d99d$Tenues à Toulouse.
Téléphone : 06 95 60 74 66
Site web : https://www.instagram.com/taniatodorova_/?hl=fr
Note Google : 5/5 (7 avis)
Google Maps : https://maps.google.com/?cid=5298520326068735025&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d99d$, true, 43.589998099999995, 1.4443374, $d99a$89 Rue Achille Viadieu$d99a$, $d99c$Toulouse$d99c$, $d99p$31400$d99p$, $d99g$ChIJh-xGlDG9rhIRMYyD7ikgiEk$d99g$, 5.0, 7, $d99s$Tenues$d99s$),
  ($d100n$Un Jour Un Costume | Location de costumes$d100n$, $d100d$Tenues à Toulouse.
Téléphone : 05 32 09 07 20
Site web : https://www.unjouruncostume.com/
Note Google : 4.9/5 (185 avis)
Google Maps : https://maps.google.com/?cid=14185592270870096937&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d100d$, true, 43.6050447, 1.4451359, $d100a$19 Rue Lafayette$d100a$, $d100c$Toulouse$d100c$, $d100p$31000$d100p$, $d100g$ChIJvxRAMdG9rhIRKSy9CQNZ3cQ$d100g$, 4.9, 185, $d100s$Tenues$d100s$),
  ($d101n$Valentin artisan coiffeur$d101n$, $d101d$Coiffeur à Toulouse.
Téléphone : 06 18 48 69 89
Site web : https://www.planity.com/valentin-artisan-coiffeur-31000-toulouse
Note Google : 4.9/5 (83 avis)
Google Maps : https://maps.google.com/?cid=8039715571233313249&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d101d$, true, 43.5992041, 1.4429607, $d101a$2 Rue du Coq d'Inde$d101a$, $d101c$Toulouse$d101c$, $d101p$31000$d101p$, $d101g$ChIJcyXydca7rhIR4dGJPrfOkm8$d101g$, 4.9, 83, $d101s$Coiffeur$d101s$),
  ($d102n$Violette & Rose - Accessoires pour cheveux$d102n$, $d102d$Accessoires à Toulouse.
Site web : http://www.violetteetrose.fr/
Note Google : 5/5 (4 avis)
Google Maps : https://maps.google.com/?cid=730786660918459638&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d102d$, true, 43.633854500000005, 1.472686, $d102a$5 Rue Paul Estival$d102a$, $d102c$Toulouse$d102c$, $d102p$31200$d102p$, $d102g$ChIJvQNfva2hrhIR9nyjophGJAo$d102g$, 5.0, 4, $d102s$Accessoires$d102s$),
  ($d103n$Yj Coiffure$d103n$, $d103d$Coiffeur à Toulouse.
Téléphone : 06 99 59 20 28
Note Google : 4.5/5 (122 avis)
Google Maps : https://maps.google.com/?cid=5596567038219876763&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d103d$, true, 43.6028649, 1.4419795000000002, $d103a$21 Rue Sainte-Ursule$d103a$, $d103c$Toulouse$d103c$, $d103p$31000$d103p$, $d103g$ChIJHy-PQ2K7rhIRm3nBwhEAq00$d103g$, 4.5, 122, $d103s$Coiffeur$d103s$),
  ($d104n$coiffeur Tia gigi$d104n$, $d104d$Coiffeur à Toulouse.
Téléphone : 05 62 26 36 86
Site web : http://www.tiagigi.fr/
Note Google : 5/5 (107 avis)
Google Maps : https://maps.google.com/?cid=2335651509215306411&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d104d$, true, 43.612566799999996, 1.4458421000000001, $d104a$46 Rue de la Concorde$d104a$, $d104c$Toulouse$d104c$, $d104p$31000$d104p$, $d104g$ChIJt3_QwBa9rhIRqyLiPazmaSA$d104g$, 5.0, 107, $d104s$Coiffeur$d104s$),
  ($d105n$l'ECHO - Outlet de robes de mariée$d105n$, $d105d$Tenues à Toulouse.
Téléphone : 05 62 84 49 32
Site web : http://www.lecho-mariage.fr/
Note Google : 5/5 (35 avis)
Google Maps : https://maps.google.com/?cid=2294670644501670910&g_mp=Cidnb29nbGUubWFwcy5wbGFjZXMudjEuUGxhY2VzLlNlYXJjaFRleHQQAhgEIAA$d105d$, true, 43.5975013, 1.4420815, $d105a$35 Rue de la Dalbade$d105a$, $d105c$Toulouse$d105c$, $d105p$31000$d105p$, $d105g$ChIJmd3T7Ze7rhIR_usJIstO2B8$d105g$, 5.0, 35, $d105s$Tenues$d105s$)
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
    where google_place_id in ($d0id$ChIJGQKTH03sG6MROvEXdyLncXk$d0id$, $d1id$ChIJfYrhxHyirhIRj9L8WEqlIWE$d1id$, $d2id$ChIJ5d0oh-W7rhIRVIAfHyfmq34$d2id$, $d3id$ChIJ1WzI7AC7rhIRA8wM2tL_ycs$d3id$, $d4id$ChIJhVfIaJy8rhIRxafYW3RaDt0$d4id$, $d5id$ChIJc9fd0jGKrhIRl5wKthnGsmA$d5id$, $d6id$ChIJVxH3KK2VrhIR9nfUibZvMLA$d6id$, $d7id$ChIJI3IlLzi7rhIR6J0XnMIeI5I$d7id$, $d8id$ChIJVwbJipm8rhIRlZCag3QJGwY$d8id$, $d9id$ChIJpe8JQ9i7rhIRog1y0tT_Nkk$d9id$, $d10id$ChIJk9ypY8G7rhIR-gWi9D-6mY8$d10id$, $d11id$ChIJF-bLM_i7rhIRJEgJX9D0UN0$d11id$, $d12id$ChIJZ8onHWK7rhIRcsvxnfNABv4$d12id$, $d13id$ChIJNXVTyL2erhIR7D5rMnl2r6M$d13id$, $d14id$ChIJhcWAsmGkrhIRcPZqUvukVW0$d14id$, $d15id$ChIJM-ONdfa7rhIRQnHsRc4uuF0$d15id$, $d16id$ChIJXWUtFp28rhIRVxRkZCLkDNE$d16id$, $d17id$ChIJhWFe2aG8rhIRKtjnP5_Cn4Q$d17id$, $d18id$ChIJiTicqp-8rhIR7x04G5I5GvE$d18id$, $d19id$ChIJtaz5RZ68rhIROzm_jQMRKo8$d19id$, $d20id$ChIJC2onFZ28rhIRmgDkUrT_apY$d20id$, $d21id$ChIJCwY2kvS5rhIRGJdhV6EoGJU$d21id$, $d22id$ChIJgzdxS568rhIR8FY7Pe-qcN4$d22id$, $d23id$ChIJuSFolIO8rhIRRP5C4JjOQeM$d23id$, $d24id$ChIJuSWDDNTzrhIRLyMSP8jQ6WA$d24id$, $d25id$ChIJxXHnQ5y8rhIR88qx9kKjx3Q$d25id$, $d26id$ChIJD3b5HxEiYGoRyh5X-qnfKeg$d26id$, $d27id$ChIJnZQQPZ68rhIRS3UJ_uNlZz4$d27id$, $d28id$ChIJXx_u4um6rhIRW2Q7BeOzXT4$d28id$, $d29id$ChIJLbKdMHC7rhIRMpU_el2xeZM$d29id$, $d30id$ChIJiasYMpC8rhIRBdzdovXQH2M$d30id$, $d31id$ChIJXeP8-Ge9rhIRJAfVnlISuGQ$d31id$, $d32id$ChIJNXPE0py8rhIRzMbekbFLs1M$d32id$, $d33id$ChIJt-g_6HW9rhIR4mCxpGZTkN8$d33id$, $d34id$ChIJabh_DH-8rhIRhTJ7If_fYrA$d34id$, $d35id$ChIJqQ4PU2K7rhIRyhADWwIt4cM$d35id$, $d36id$ChIJJzZjVZu8rhIRrXYEVqvvNW8$d36id$, $d37id$ChIJlef7odO9rhIR49dBSaOHEd8$d37id$, $d38id$ChIJOZC18r6jrhIRV0TZDzjUAIg$d38id$, $d39id$ChIJcbqgiuO6rhIRB-j0u2ABcBs$d39id$, $d40id$ChIJBY6Y3YK8rhIRTq1Y5GuuY10$d40id$, $d41id$ChIJjSwa5p28rhIRyqFpxs5yFQc$d41id$, $d42id$ChIJL-ZvT-i9rhIR6V377pdM8S8$d42id$, $d43id$ChIJ1TbwgJ28rhIR44b2Efmui0k$d43id$, $d44id$ChIJTcX-i2G7rhIR8rj4KdvaELQ$d44id$, $d45id$ChIJfwtn1TGjrhIRwubJhrX9vxQ$d45id$, $d46id$ChIJpYUEU6-9rhIRM-tLVBl3aRs$d46id$, $d47id$ChIJM7-Myra9rhIRqiWohAyD29Q$d47id$, $d48id$ChIJEdd1s5y8rhIRJRFsd1uXGgY$d48id$, $d49id$ChIJHYHytpy8rhIRpfXM-WmE2zA$d49id$, $d50id$ChIJe56GltC7rhIRMVv2plOo2U0$d50id$, $d51id$ChIJTUNVHJ68rhIRa4TmUudgrbM$d51id$, $d52id$ChIJlYnN9Zy8rhIRjtq5I2rU-jo$d52id$, $d53id$ChIJ4-VKCGm7rhIRYTvHqfbK-AM$d53id$, $d54id$ChIJC2KD16y_rhIRnDuOqavodHs$d54id$, $d55id$ChIJCT2yHwC7rhIRln4ZScQ43Mo$d55id$, $d56id$ChIJwdvkJGq7rhIRaWKkZQ5w4_0$d56id$, $d57id$ChIJlZwZCDejrhIRqD8CfVeKXek$d57id$, $d58id$ChIJy14FDJ-8rhIRCxISZzXLpYs$d58id$, $d59id$ChIJQ4I-a9OlrhIRACRxIMNF2QE$d59id$, $d60id$ChIJ0QaOJXi7rhIRSOESRXAI5wk$d60id$, $d61id$ChIJgUff_ba9rhIRlLb8QdKOjlI$d61id$, $d62id$ChIJ0xNmTby9rhIRmAfPT_Ixw-Q$d62id$, $d63id$ChIJgU82evoBrBIRtINdQqL_WLs$d63id$, $d64id$ChIJVVVVVem6rhIRIoQp1Wh1vAU$d64id$, $d65id$ChIJ3cEReFC9rhIRC1We-onlvO8$d65id$, $d66id$ChIJ6a-bMLO9rhIRG-PPrY9lWzw$d66id$, $d67id$ChIJt8NW6XS9rhIRals0RasCH-M$d67id$, $d68id$ChIJswisqJy7rhIR1oMOiEP2yho$d68id$, $d69id$ChIJS-vCAAy7rhIRQocgIh746E8$d69id$, $d70id$ChIJkVOt44C9rhIR8rglD_FoUj0$d70id$, $d71id$ChIJB6R66Xy9rhIR47jp9N8-dOI$d71id$, $d72id$ChIJxUV3IHy9rhIRfJh3VM1-4AE$d72id$, $d73id$ChIJoWKPC-reM0MR1kqOpBUBb7k$d73id$, $d74id$ChIJG7-aErIrrBIRd-0GbJcPVxw$d74id$, $d75id$ChIJab63i5m8rhIRmivLb3DYfXM$d75id$, $d76id$ChIJp5qIIru9rhIRonGpy76Bmto$d76id$, $d77id$ChIJwQiWOIm6rhIR6a6GiOFnYtU$d77id$, $d78id$ChIJZRKtyjejrhIRuPnIwcU0S4k$d78id$, $d79id$ChIJh61tvc27rhIRmEojHgf683w$d79id$, $d80id$ChIJO2BoQmW7rhIRnP72a179UL8$d80id$, $d81id$ChIJ-Q0dgJm8rhIRa8yff7O_4R8$d81id$, $d82id$ChIJU9GAGJS8rhIRHE2Zyi1W8mg$d82id$, $d83id$ChIJucFdYZu8rhIRcBuCImisL6o$d83id$, $d84id$ChIJfajELp28rhIRAUWXgZYlSD8$d84id$, $d85id$ChIJ3fp8__q9rhIRJdmst2K6I6A$d85id$, $d86id$ChIJLdGFp5y8rhIR8Jx4WkuKpBQ$d86id$, $d87id$ChIJuaSyiQa7rhIRpblloUhYK58$d87id$, $d88id$ChIJuTKEiQu9rhIRsrFFHzInLvQ$d88id$, $d89id$ChIJ09-5XZe8rhIRg5CImUiX_YE$d89id$, $d90id$ChIJUW3ZsZy8rhIRsrQrXM48zL0$d90id$, $d91id$ChIJtxqOwR69rhIRDQbfmzea1pA$d91id$, $d92id$ChIJC_1UVJe8rhIRBKO8EnZnoho$d92id$, $d93id$ChIJY7ioc468rhIRQRfzTUnY1nc$d93id$, $d94id$ChIJ9WSdiqC8rhIRnArZ7HOLZAk$d94id$, $d95id$ChIJib7USjG9rhIR14SPmjWE_34$d95id$, $d96id$ChIJW4v_nM-9rhIRoU8EGdUX1XE$d96id$, $d97id$ChIJG0KWpr68rhIRqQASav6De90$d97id$, $d98id$ChIJAwdJjVW7rhIRTLkHh_oYMuQ$d98id$, $d99id$ChIJh-xGlDG9rhIRMYyD7ikgiEk$d99id$, $d100id$ChIJvxRAMdG9rhIRKSy9CQNZ3cQ$d100id$, $d101id$ChIJcyXydca7rhIR4dGJPrfOkm8$d101id$, $d102id$ChIJvQNfva2hrhIR9nyjophGJAo$d102id$, $d103id$ChIJHy-PQ2K7rhIRm3nBwhEAq00$d103id$, $d104id$ChIJt3_QwBa9rhIRqyLiPazmaSA$d104id$, $d105id$ChIJmd3T7Ze7rhIR_usJIstO2B8$d105id$)
      and latitude is not null
      and longitude is not null
      and location is null;
  elsif location_type like 'geometry%' then
    update public.craftsmans
    set location = ST_SetSRID(ST_MakePoint(longitude, latitude), 4326)
    where google_place_id in ($d0id$ChIJGQKTH03sG6MROvEXdyLncXk$d0id$, $d1id$ChIJfYrhxHyirhIRj9L8WEqlIWE$d1id$, $d2id$ChIJ5d0oh-W7rhIRVIAfHyfmq34$d2id$, $d3id$ChIJ1WzI7AC7rhIRA8wM2tL_ycs$d3id$, $d4id$ChIJhVfIaJy8rhIRxafYW3RaDt0$d4id$, $d5id$ChIJc9fd0jGKrhIRl5wKthnGsmA$d5id$, $d6id$ChIJVxH3KK2VrhIR9nfUibZvMLA$d6id$, $d7id$ChIJI3IlLzi7rhIR6J0XnMIeI5I$d7id$, $d8id$ChIJVwbJipm8rhIRlZCag3QJGwY$d8id$, $d9id$ChIJpe8JQ9i7rhIRog1y0tT_Nkk$d9id$, $d10id$ChIJk9ypY8G7rhIR-gWi9D-6mY8$d10id$, $d11id$ChIJF-bLM_i7rhIRJEgJX9D0UN0$d11id$, $d12id$ChIJZ8onHWK7rhIRcsvxnfNABv4$d12id$, $d13id$ChIJNXVTyL2erhIR7D5rMnl2r6M$d13id$, $d14id$ChIJhcWAsmGkrhIRcPZqUvukVW0$d14id$, $d15id$ChIJM-ONdfa7rhIRQnHsRc4uuF0$d15id$, $d16id$ChIJXWUtFp28rhIRVxRkZCLkDNE$d16id$, $d17id$ChIJhWFe2aG8rhIRKtjnP5_Cn4Q$d17id$, $d18id$ChIJiTicqp-8rhIR7x04G5I5GvE$d18id$, $d19id$ChIJtaz5RZ68rhIROzm_jQMRKo8$d19id$, $d20id$ChIJC2onFZ28rhIRmgDkUrT_apY$d20id$, $d21id$ChIJCwY2kvS5rhIRGJdhV6EoGJU$d21id$, $d22id$ChIJgzdxS568rhIR8FY7Pe-qcN4$d22id$, $d23id$ChIJuSFolIO8rhIRRP5C4JjOQeM$d23id$, $d24id$ChIJuSWDDNTzrhIRLyMSP8jQ6WA$d24id$, $d25id$ChIJxXHnQ5y8rhIR88qx9kKjx3Q$d25id$, $d26id$ChIJD3b5HxEiYGoRyh5X-qnfKeg$d26id$, $d27id$ChIJnZQQPZ68rhIRS3UJ_uNlZz4$d27id$, $d28id$ChIJXx_u4um6rhIRW2Q7BeOzXT4$d28id$, $d29id$ChIJLbKdMHC7rhIRMpU_el2xeZM$d29id$, $d30id$ChIJiasYMpC8rhIRBdzdovXQH2M$d30id$, $d31id$ChIJXeP8-Ge9rhIRJAfVnlISuGQ$d31id$, $d32id$ChIJNXPE0py8rhIRzMbekbFLs1M$d32id$, $d33id$ChIJt-g_6HW9rhIR4mCxpGZTkN8$d33id$, $d34id$ChIJabh_DH-8rhIRhTJ7If_fYrA$d34id$, $d35id$ChIJqQ4PU2K7rhIRyhADWwIt4cM$d35id$, $d36id$ChIJJzZjVZu8rhIRrXYEVqvvNW8$d36id$, $d37id$ChIJlef7odO9rhIR49dBSaOHEd8$d37id$, $d38id$ChIJOZC18r6jrhIRV0TZDzjUAIg$d38id$, $d39id$ChIJcbqgiuO6rhIRB-j0u2ABcBs$d39id$, $d40id$ChIJBY6Y3YK8rhIRTq1Y5GuuY10$d40id$, $d41id$ChIJjSwa5p28rhIRyqFpxs5yFQc$d41id$, $d42id$ChIJL-ZvT-i9rhIR6V377pdM8S8$d42id$, $d43id$ChIJ1TbwgJ28rhIR44b2Efmui0k$d43id$, $d44id$ChIJTcX-i2G7rhIR8rj4KdvaELQ$d44id$, $d45id$ChIJfwtn1TGjrhIRwubJhrX9vxQ$d45id$, $d46id$ChIJpYUEU6-9rhIRM-tLVBl3aRs$d46id$, $d47id$ChIJM7-Myra9rhIRqiWohAyD29Q$d47id$, $d48id$ChIJEdd1s5y8rhIRJRFsd1uXGgY$d48id$, $d49id$ChIJHYHytpy8rhIRpfXM-WmE2zA$d49id$, $d50id$ChIJe56GltC7rhIRMVv2plOo2U0$d50id$, $d51id$ChIJTUNVHJ68rhIRa4TmUudgrbM$d51id$, $d52id$ChIJlYnN9Zy8rhIRjtq5I2rU-jo$d52id$, $d53id$ChIJ4-VKCGm7rhIRYTvHqfbK-AM$d53id$, $d54id$ChIJC2KD16y_rhIRnDuOqavodHs$d54id$, $d55id$ChIJCT2yHwC7rhIRln4ZScQ43Mo$d55id$, $d56id$ChIJwdvkJGq7rhIRaWKkZQ5w4_0$d56id$, $d57id$ChIJlZwZCDejrhIRqD8CfVeKXek$d57id$, $d58id$ChIJy14FDJ-8rhIRCxISZzXLpYs$d58id$, $d59id$ChIJQ4I-a9OlrhIRACRxIMNF2QE$d59id$, $d60id$ChIJ0QaOJXi7rhIRSOESRXAI5wk$d60id$, $d61id$ChIJgUff_ba9rhIRlLb8QdKOjlI$d61id$, $d62id$ChIJ0xNmTby9rhIRmAfPT_Ixw-Q$d62id$, $d63id$ChIJgU82evoBrBIRtINdQqL_WLs$d63id$, $d64id$ChIJVVVVVem6rhIRIoQp1Wh1vAU$d64id$, $d65id$ChIJ3cEReFC9rhIRC1We-onlvO8$d65id$, $d66id$ChIJ6a-bMLO9rhIRG-PPrY9lWzw$d66id$, $d67id$ChIJt8NW6XS9rhIRals0RasCH-M$d67id$, $d68id$ChIJswisqJy7rhIR1oMOiEP2yho$d68id$, $d69id$ChIJS-vCAAy7rhIRQocgIh746E8$d69id$, $d70id$ChIJkVOt44C9rhIR8rglD_FoUj0$d70id$, $d71id$ChIJB6R66Xy9rhIR47jp9N8-dOI$d71id$, $d72id$ChIJxUV3IHy9rhIRfJh3VM1-4AE$d72id$, $d73id$ChIJoWKPC-reM0MR1kqOpBUBb7k$d73id$, $d74id$ChIJG7-aErIrrBIRd-0GbJcPVxw$d74id$, $d75id$ChIJab63i5m8rhIRmivLb3DYfXM$d75id$, $d76id$ChIJp5qIIru9rhIRonGpy76Bmto$d76id$, $d77id$ChIJwQiWOIm6rhIR6a6GiOFnYtU$d77id$, $d78id$ChIJZRKtyjejrhIRuPnIwcU0S4k$d78id$, $d79id$ChIJh61tvc27rhIRmEojHgf683w$d79id$, $d80id$ChIJO2BoQmW7rhIRnP72a179UL8$d80id$, $d81id$ChIJ-Q0dgJm8rhIRa8yff7O_4R8$d81id$, $d82id$ChIJU9GAGJS8rhIRHE2Zyi1W8mg$d82id$, $d83id$ChIJucFdYZu8rhIRcBuCImisL6o$d83id$, $d84id$ChIJfajELp28rhIRAUWXgZYlSD8$d84id$, $d85id$ChIJ3fp8__q9rhIRJdmst2K6I6A$d85id$, $d86id$ChIJLdGFp5y8rhIR8Jx4WkuKpBQ$d86id$, $d87id$ChIJuaSyiQa7rhIRpblloUhYK58$d87id$, $d88id$ChIJuTKEiQu9rhIRsrFFHzInLvQ$d88id$, $d89id$ChIJ09-5XZe8rhIRg5CImUiX_YE$d89id$, $d90id$ChIJUW3ZsZy8rhIRsrQrXM48zL0$d90id$, $d91id$ChIJtxqOwR69rhIRDQbfmzea1pA$d91id$, $d92id$ChIJC_1UVJe8rhIRBKO8EnZnoho$d92id$, $d93id$ChIJY7ioc468rhIRQRfzTUnY1nc$d93id$, $d94id$ChIJ9WSdiqC8rhIRnArZ7HOLZAk$d94id$, $d95id$ChIJib7USjG9rhIR14SPmjWE_34$d95id$, $d96id$ChIJW4v_nM-9rhIRoU8EGdUX1XE$d96id$, $d97id$ChIJG0KWpr68rhIRqQASav6De90$d97id$, $d98id$ChIJAwdJjVW7rhIRTLkHh_oYMuQ$d98id$, $d99id$ChIJh-xGlDG9rhIRMYyD7ikgiEk$d99id$, $d100id$ChIJvxRAMdG9rhIRKSy9CQNZ3cQ$d100id$, $d101id$ChIJcyXydca7rhIR4dGJPrfOkm8$d101id$, $d102id$ChIJvQNfva2hrhIR9nyjophGJAo$d102id$, $d103id$ChIJHy-PQ2K7rhIRm3nBwhEAq00$d103id$, $d104id$ChIJt3_QwBa9rhIRqyLiPazmaSA$d104id$, $d105id$ChIJmd3T7Ze7rhIR_usJIstO2B8$d105id$)
      and latitude is not null
      and longitude is not null
      and location is null;
  end if;
end $$;
