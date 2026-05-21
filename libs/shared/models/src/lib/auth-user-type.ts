/** Key stored in Supabase `user_metadata` (and `raw_user_meta_data`). */
export const USER_TYPE_METADATA_KEY = 'user_type' as const;

export type UserType = 'pro' | 'consumer';

export const USER_TYPE = {
  pro: 'pro',
  consumer: 'consumer',
} as const satisfies Record<string, UserType>;

export type UserMetadataLike = Record<string, unknown> | undefined;

export function getUserType(
  metadata: UserMetadataLike,
): UserType | null {
  const value = metadata?.[USER_TYPE_METADATA_KEY];
  if (value === USER_TYPE.pro || value === USER_TYPE.consumer) {
    return value;
  }
  return null;
}

export function isProUser(metadata: UserMetadataLike): boolean {
  return getUserType(metadata) === USER_TYPE.pro;
}

export function isConsumerUser(metadata: UserMetadataLike): boolean {
  return getUserType(metadata) === USER_TYPE.consumer;
}

export function proUserMetadata(): Record<string, string> {
  return { [USER_TYPE_METADATA_KEY]: USER_TYPE.pro };
}

export function consumerUserMetadata(): Record<string, string> {
  return { [USER_TYPE_METADATA_KEY]: USER_TYPE.consumer };
}
