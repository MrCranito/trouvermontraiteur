import { CatererRealisation } from '@trouvermontraiteur/models';

/** Build placeholder gallery images for mock caterers. */
export function mockRealisations(
  slug: string,
  captions: string[],
): CatererRealisation[] {
  return captions.map((caption, index) => ({
    id: `${slug}-real-${index + 1}`,
    imageUrl: `https://picsum.photos/seed/${slug}-real-${index + 1}/900/650`,
    caption,
  }));
}
