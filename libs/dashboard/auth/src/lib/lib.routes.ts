import { Route } from '@angular/router';
import { authGuestGuard } from './auth-guest.guard';
import { authGuard } from './auth.guard';
import { AuthLayout } from './auth-layout/auth-layout';
import { AuthCallback } from './auth-callback/auth-callback';
import { ForgotPassword } from './forgot-password/forgot-password';
import { Login } from './login/login';
import { ResetPassword } from './reset-password/reset-password';
import { Signup } from './signup/signup';
import { UpdateEmail } from './update-email/update-email';

export const authRoutes: Route[] = [
  {
    path: '',
    component: AuthLayout,
    canActivate: [authGuestGuard],
    children: [
      { path: 'connexion', component: Login },
      { path: 'inscription', component: Signup },
      { path: 'mot-de-passe-oublie', component: ForgotPassword },
      { path: 'nouveau-mot-de-passe', component: ResetPassword },
      { path: 'callback', component: AuthCallback },
      { path: '', redirectTo: 'connexion', pathMatch: 'full' },
    ],
  },
  {
    path: 'changer-email',
    component: AuthLayout,
    canActivate: [authGuard],
    children: [{ path: '', component: UpdateEmail }],
  },
];
