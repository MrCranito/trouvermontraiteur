import { USER_TYPE, type UserType } from '@trouvermontraiteur/models';

const STORAGE_KEY = 'tmt_app_auth_user_type';

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
