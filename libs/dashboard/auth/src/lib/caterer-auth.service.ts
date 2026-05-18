import { Injectable, computed, inject, signal } from '@angular/core';
import { Router } from '@angular/router';
import { AuthError, Session, User } from '@supabase/supabase-js';
import { SUPABASE_CLIENT } from '@trouvermontraiteur/api';
import { AUTH_REDIRECT_BASE } from './auth-redirect.token';

@Injectable({ providedIn: 'root' })
export class CatererAuthService {
  private readonly supabase = inject(SUPABASE_CLIENT);
  private readonly router = inject(Router);
  private readonly redirectBase = inject(AUTH_REDIRECT_BASE);

  private readonly session = signal<Session | null>(null);
  private readonly initialized = signal(false);

  readonly user = computed<User | null>(() => this.session()?.user ?? null);
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

  async signInWithEmail(email: string, password: string): Promise<AuthError | null> {
    const { error } = await this.supabase.auth.signInWithPassword({
      email: email.trim(),
      password,
    });
    return error;
  }

  async signUpWithEmail(
    email: string,
    password: string,
  ): Promise<{ error: AuthError | null; needsEmailConfirmation: boolean }> {
    const { data, error } = await this.supabase.auth.signUp({
      email: email.trim(),
      password,
      options: {
        emailRedirectTo: this.redirectUrl('/auth/callback'),
      },
    });

    const needsEmailConfirmation =
      !error && !!data.user && data.session === null;

    return { error, needsEmailConfirmation };
  }

  async signInWithGoogle(): Promise<AuthError | null> {
    const { error } = await this.supabase.auth.signInWithOAuth({
      provider: 'google',
      options: {
        redirectTo: this.redirectUrl('/auth/callback'),
      },
    });
    return error;
  }

  async signOut(): Promise<void> {
    await this.supabase.auth.signOut();
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
      return error;
    }

    const { error } = await this.supabase.auth.getSession();
    return error;
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
    };
    return map[error.message] ?? error.message;
  }
}
