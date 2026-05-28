/** Builds a verified Unsplash image URL (IDs tested for HTTP 200). */
function unsplash(photoId: string, width = 800, height = 600): string {
  return `https://images.unsplash.com/${photoId}?auto=format&fit=crop&w=${width}&h=${height}&q=80`;
}

function covers(...photoIds: string[]): readonly string[] {
  return photoIds.map((id) => unsplash(id));
}

/** 10 images distinctes par famille (1 par artisan mock). */
export const FAMILY_MOCK_IMAGES: Record<string, { covers: readonly string[] }> = {
  batiments: {
    covers: covers(
      'photo-1541888946425-d81bb19240f5',
      'photo-1503387762-592deb58ef4e',
      'photo-1558618666-fcd25c85cd64',
      'photo-1560518883-ce09059eeffa',
      'photo-1554995207-c18c203602cb',
      'photo-1497366216548-37526070297c',
      'photo-1497366754035-f200968a6e72',
      'photo-1497215842964-222b430dc094',
      'photo-1504384308090-c894fdcc538d',
      'photo-1521791136064-7986c2920216',
    ),
  },
  reparation: {
    covers: covers(
      'photo-1621905251189-08b45d6a269e',
      'photo-1581092160562-40aa08e78837',
      'photo-1560179707-f14e90ef3623',
      'photo-1600880292203-757bb62b4baf',
      'photo-1512941937669-90a1b58e7e9c',
      'photo-1556761175-5973dc0f32e7',
      'photo-1553877522-43269d4ea984',
      'photo-1522071820081-009f0129c71c',
      'photo-1571019613454-1cb2f99b2d8b',
      'photo-1516035069371-29a1b244cc32',
    ),
  },
  mobilite: {
    covers: covers(
      'photo-1492144534655-ae79c964c9d7',
      'photo-1556742049-0cfed4f6a45d',
      'photo-1559339352-11d035aa65de',
      'photo-1523275335684-37898b6baf30',
      'photo-1553877522-43269d4ea984',
      'photo-1581092160562-40aa08e78837',
      'photo-1560179707-f14e90ef3623',
      'photo-1556761175-5973dc0f32e7',
      'photo-1522071820081-009f0129c71c',
      'photo-1512941937669-90a1b58e7e9c',
    ),
  },
  alimentation: {
    covers: covers(
      'photo-1509440159596-0249088772ff',
      'photo-1542838132-92c53300491e',
      'photo-1517248135467-4c7edcad34c4',
      'photo-1556910103-1c02745aae4d',
      'photo-1531058020387-3be344556be6',
      'photo-1565299624946-b28f40a0ae38',
      'photo-1559339352-11d035aa65de',
      'photo-1556742049-0cfed4f6a45d',
      'photo-1558904541-efa843a96f01',
      'photo-1571019613454-1cb2f99b2d8b',
    ),
  },
  beaute: {
    covers: covers(
      'photo-1560066984-138dadb4c035',
      'photo-1522337360788-8b13dee7a37e',
      'photo-1582719478250-c89cae4dc85b',
      'photo-1596462502278-27bfdc403348',
      'photo-1573496359142-b8d87734a5a2',
      'photo-1441986300917-64674bd600d8',
      'photo-1558904541-efa843a96f01',
      'photo-1600880292203-757bb62b4baf',
      'photo-1512941937669-90a1b58e7e9c',
      'photo-1522071820081-009f0129c71c',
    ),
  },
  mode: {
    covers: covers(
      'photo-1441986300917-64674bd600d8',
      'photo-1523275335684-37898b6baf30',
      'photo-1586023492125-27b2c045efd7',
      'photo-1573496359142-b8d87734a5a2',
      'photo-1556761175-5973dc0f32e7',
      'photo-1516321318423-f06f85e504b3',
      'photo-1600585154340-be6161a56a0c',
      'photo-1600607687939-ce8a6c25118c',
      'photo-1616486338812-3dadae4b4ace',
      'photo-1554995207-c18c203602cb',
    ),
  },
  decoration: {
    covers: covers(
      'photo-1616486338812-3dadae4b4ace',
      'photo-1600585154340-be6161a56a0c',
      'photo-1600607687939-ce8a6c25118c',
      'photo-1586023492125-27b2c045efd7',
      'photo-1554995207-c18c203602cb',
      'photo-1497366216548-37526070297c',
      'photo-1504384308090-c894fdcc538d',
      'photo-1560518883-ce09059eeffa',
      'photo-1521791136064-7986c2920216',
      'photo-1497215842964-222b430dc094',
    ),
  },
  jardin: {
    covers: covers(
      'photo-1625246333195-78d9c38ad449',
      'photo-1558904541-efa843a96f01',
      'photo-1506905925346-21bda4d32df4',
      'photo-1469474968028-56623f02e42e',
      'photo-1542838132-92c53300491e',
      'photo-1565299624946-b28f40a0ae38',
      'photo-1497366754035-f200968a6e72',
      'photo-1509440159596-0249088772ff',
      'photo-1531058020387-3be344556be6',
      'photo-1556910103-1c02745aae4d',
    ),
  },
  audiovisuel: {
    covers: covers(
      'photo-1516035069371-29a1b244cc32',
      'photo-1516321318423-f06f85e504b3',
      'photo-1512941937669-90a1b58e7e9c',
      'photo-1573496359142-b8d87734a5a2',
      'photo-1522071820081-009f0129c71c',
      'photo-1556761175-5973dc0f32e7',
      'photo-1553877522-43269d4ea984',
      'photo-1600880292203-757bb62b4baf',
      'photo-1497215842964-222b430dc094',
      'photo-1504384308090-c894fdcc538d',
    ),
  },
};

export function getFamilyCoverImage(familyId: string, index: number): string {
  const covers = FAMILY_MOCK_IMAGES[familyId]?.covers ?? FAMILY_MOCK_IMAGES['batiments'].covers;
  return covers[index % covers.length];
}

/** 3 images de galerie distinctes pour un artisan (autres couvertures de la famille). */
export function getFamilyGalleryImages(
  familyId: string,
  index: number,
): readonly string[] {
  const covers = FAMILY_MOCK_IMAGES[familyId]?.covers ?? FAMILY_MOCK_IMAGES['batiments'].covers;
  const len = covers.length;
  return [
    covers[(index + 1) % len],
    covers[(index + 2) % len],
    covers[(index + 3) % len],
  ];
}
