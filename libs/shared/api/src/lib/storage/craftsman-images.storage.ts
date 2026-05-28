import type { SupabaseClient } from '@supabase/supabase-js';

/** Supabase Storage bucket for `craftsmans_images.storage_path` object keys. */
export const CRAFTSMAN_IMAGES_BUCKET = 'craftsmans_images';

/**
 * Builds a public URL for a craftsman image object key.
 * Accepts full http(s) URLs (mocks / legacy) unchanged.
 */
export function toCraftsmanImagePublicUrl(
  supabase: SupabaseClient,
  storagePath: string,
  bucket = CRAFTSMAN_IMAGES_BUCKET,
): string {
  const path = storagePath?.trim();
  if (!path) {
    return '';
  }
  if (/^https?:\/\//i.test(path)) {
    return path;
  }

  let objectPath = path.replace(/^\//, '');
  for (const prefix of [`${bucket}/`, 'craftsmans_images/', 'craftsmans-images/']) {
    if (objectPath.startsWith(prefix)) {
      objectPath = objectPath.slice(prefix.length);
      break;
    }
  }

  const { data } = supabase.storage.from(bucket).getPublicUrl(objectPath);
  return data.publicUrl;
}
