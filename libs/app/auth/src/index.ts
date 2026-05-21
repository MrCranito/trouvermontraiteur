export * from './lib/lib.routes';
export { ConsumerAuthService } from './lib/consumer-auth.service';
export { AUTH_REDIRECT_BASE } from './lib/auth-redirect.token';
export { authGuard } from './lib/auth.guard';
export { authGuestGuard } from './lib/auth-guest.guard';
export { AuthLayout } from './lib/auth-layout/auth-layout';
export { Login } from './lib/login/login';
export { Signup } from './lib/signup/signup';
export { WRONG_PORTAL_ERROR_CODE } from './lib/auth.errors';
export {
  USER_TYPE,
  USER_TYPE_METADATA_KEY,
  consumerUserMetadata,
  getUserType,
  isConsumerUser,
  isProUser,
  proUserMetadata,
  type UserType,
} from '@trouvermontraiteur/models';
