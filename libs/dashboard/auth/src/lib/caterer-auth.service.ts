import { Injectable, computed, inject, signal } from '@angular/core';
import { Router } from '@angular/router';
import { AuthError, Session, User } from '@supabase/supabase-js';
import { SUPABASE_CLIENT } from '@trouvermontraiteur/api';
import {
  USER_TYPE,
  getUserType,
  isConsumerUser,
  isProUser,
  proUserMetadata,
} from '@trouvermontraiteur/models';
import { consumeAuthIntent, setAuthIntent } from './auth-intent.storage';
import { WRONG_PORTAL_ERROR_CODE, wrongPortalAuthError } from './auth.errors';
import { AUTH_REDIRECT_BASE } from './auth-redirect.token';

@Injectable({ providedIn: 'root' })
export class CatererAuthService {
  private readonly supabase = inject(SUPABASE_CLIENT);
  private readonly router = inject(Router);
  private readonly redirectBase = inject(AUTH_REDIRECT_BASE);

  private readonly session = signal<Session | null>(null);
  private readonly initialized = signal(false);

  readonly user = computed<User | null>(() => this.session()?.user ?? null);
  readonly userType = computed(() =>
    getUserType(this.user()?.user_metadata),
  );
  readonly isConsumer = computed(() =>
    isConsumerUser(this.user()?.user_metadata),
  );
  readonly isPro = computed(
    () => this.isAuthenticated() && isProUser(this.user()?.user_metadata),
  );
  readonly isAuthenticated = computed(
    () => this.initialized() && this.session() !== null,
  );
  readonly isReady = computed(() => this.initialized());

  constructor() {
    void this.bootstrap();
  }

  whenReady(): Promise<void> {
    if (this.initialized()) {
      return Promise.resolve();
    }
    return new Promise((resolve) => {
      const tick = (): void => {
        if (this.initialized()) {
          resolve();
          return;
        }
        requestAnimationFrame(tick);
      };
      tick();
    });
  }

  private async bootstrap(): Promise<void> {
    const { data } = await this.supabase.auth.getSession();
    this.session.set(data.session);
    this.initialized.set(true);

    this.supabase.auth.onAuthStateChange((_event, session) => {
      this.session.set(session);
    });
  }

  private redirectUrl(path: string): string {
    const base = this.redirectBase.replace(/\/$/, '');
    return `${base}${path.startsWith('/') ? path : `/${path}`}`;
  }

  private patchSessionUser(user: User): void {
    const current = this.session();
    if (!current) {
      return;
    }
    this.session.set({ ...current, user });
  }

  private async refreshSession(): Promise<void> {
    const { data, error } = await this.supabase.auth.refreshSession();
    if (!error && data.session) {
      this.session.set(data.session);
      return;
    }

    const { data: userData, error: userError } =
      await this.supabase.auth.getUser();
    if (!userError && userData.user) {
      this.patchSessionUser(userData.user);
      return;
    }

    const { data: sessionData } = await this.supabase.auth.getSession();
    this.session.set(sessionData.session);
  }

  /** Ensures the signed-in user may use the pro dashboard. */
  async ensureProAccess(): Promise<AuthError | null> {
    const user = this.user();
    if (!user) {
      return null;
    }

    const type = getUserType(user.user_metadata);

    if (type === USER_TYPE.consumer) {
      await this.supabase.auth.signOut();
      this.session.set(null);
      return wrongPortalAuthError();
    }

    if (type === USER_TYPE.pro) {
      return null;
    }

    const { data, error } = await this.supabase.auth.updateUser({
      data: proUserMetadata(),
    });
    if (error) {
      return error;
    }

    if (data.user) {
      this.patchSessionUser(data.user);
    }
    await this.refreshSession();
    return null;
  }

  private async applyOAuthIntent(): Promise<AuthError | null> {
    const intent = consumeAuthIntent();
    if (intent !== USER_TYPE.pro) {
      return this.ensureProAccess();
    }

    const user = this.user();
    if (!user) {
      return null;
    }

    const type = getUserType(user.user_metadata);
    if (type === USER_TYPE.consumer) {
      await this.supabase.auth.signOut();
      this.session.set(null);
      return wrongPortalAuthError();
    }

    if (type !== USER_TYPE.pro) {
      const { data, error } = await this.supabase.auth.updateUser({
        data: proUserMetadata(),
      });
      if (error) {
        return error;
      }
      if (data.user) {
        this.patchSessionUser(data.user);
      }
      await this.refreshSession();
    }

    return null;
  }

  async signInWithEmail(email: string, password: string): Promise<AuthError | null> {
    const { error } = await this.supabase.auth.signInWithPassword({
      email: email.trim(),
      password,
    });
    if (error) {
      return error;
    }

    return this.ensureProAccess();
  }

  async signUpWithEmail(
    email: string,
    password: string,
  ): Promise<{ error: AuthError | null; needsEmailConfirmation: boolean }> {
    const { data, error } = await this.supabase.auth.signUp({
      email: email.trim(),
      password,
      options: {
        data: proUserMetadata(),
        emailRedirectTo: this.redirectUrl('/auth/callback'),
      },
    });

    const needsEmailConfirmation =
      !error && !!data.user && data.session === null;

    return { error, needsEmailConfirmation };
  }

  async signInWithGoogle(): Promise<AuthError | null> {
    setAuthIntent(USER_TYPE.pro);

    const { error } = await this.supabase.auth.signInWithOAuth({
      provider: 'google',
      options: {
        redirectTo: this.redirectUrl('/auth/callback'),
      },
    });
    return error;
  }

  async clearSession(): Promise<void> {
    await this.supabase.auth.signOut();
    this.session.set(null);
  }

  async signOut(): Promise<void> {
    await this.clearSession();
    await this.router.navigate(['/auth/connexion']);
  }

  async sendPasswordResetEmail(email: string): Promise<AuthError | null> {
    const { error } = await this.supabase.auth.resetPasswordForEmail(
      email.trim(),
      { redirectTo: this.redirectUrl('/auth/nouveau-mot-de-passe') },
    );
    return error;
  }

  async updatePassword(newPassword: string): Promise<AuthError | null> {
    const { error } = await this.supabase.auth.updateUser({
      password: newPassword,
    });
    return error;
  }

  async updateEmail(newEmail: string): Promise<AuthError | null> {
    const { error } = await this.supabase.auth.updateUser({
      email: newEmail.trim(),
    });
    return error;
  }

  async handleAuthCallback(): Promise<AuthError | null> {
    const params = new URLSearchParams(window.location.search);
    const code = params.get('code');

    if (code) {
      const { error } = await this.supabase.auth.exchangeCodeForSession(code);
      if (error) {
        return error;
      }
    } else {
      const { error } = await this.supabase.auth.getSession();
      if (error) {
        return error;
      }
    }

    return this.applyOAuthIntent();
  }

  isRecoveryFlow(): boolean {
    const hash = window.location.hash;
    if (hash.includes('type=recovery')) {
      return true;
    }
    const params = new URLSearchParams(window.location.search);
    return params.get('type') === 'recovery';
  }

  static messageForError(error: AuthError | null): string {
    if (!error) {
      return '';
    }
    const map: Record<string, string> = {
      invalid_credentials: 'E-mail ou mot de passe incorrect.',
      user_already_registered: 'Un compte existe déjà avec cet e-mail.',
      email_not_confirmed:
        'Confirmez votre adresse e-mail avant de vous connecter.',
      weak_password: 'Le mot de passe est trop faible (8 caractères minimum).',
      [WRONG_PORTAL_ERROR_CODE]:
        'Ce compte est un compte particulier. Utilisez l’application publique pour vous connecter.',
    };
    return map[error.message] ?? error.message;
  }
}
