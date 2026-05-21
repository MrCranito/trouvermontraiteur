import { USER_TYPE, type UserType } from '@trouvermontraiteur/models';

const STORAGE_KEY = 'tmt_auth_user_type';

/** Remember intended account type before OAuth redirect. */
export function setAuthIntent(userType: UserType): void {
  sessionStorage.setItem(STORAGE_KEY, userType);
}

export function consumeAuthIntent(): UserType | null {
  const value = sessionStorage.getItem(STORAGE_KEY);
  sessionStorage.removeItem(STORAGE_KEY);
  if (value === USER_TYPE.pro || value === USER_TYPE.consumer) {
    return value;
  }
  return null;
}
