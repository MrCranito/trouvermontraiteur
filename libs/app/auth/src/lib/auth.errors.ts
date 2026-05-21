import { AuthError } from '@supabase/supabase-js';

export const WRONG_PORTAL_ERROR_CODE = 'wrong_portal_pro';

export function wrongPortalAuthError(): AuthError {
  return {
    name: 'AuthError',
    message: WRONG_PORTAL_ERROR_CODE,
    status: 403,
  } as AuthError;
}
