import { CraftsmanRealisation } from '@trouvermontraiteur/models';

/** Build gallery images for mock craftsmen. */
export function mockRealisations(
  slug: string,
  captions: string[],
  imageUrls?: readonly string[],
): CraftsmanRealisation[] {
  return captions.map((caption, index) => ({
    id: `${slug}-real-${index + 1}`,
    imageUrl:
      imageUrls?.[index % imageUrls.length] ??
      `https://picsum.photos/seed/${slug}-real-${index + 1}/900/650`,
    caption,
  }));
}
