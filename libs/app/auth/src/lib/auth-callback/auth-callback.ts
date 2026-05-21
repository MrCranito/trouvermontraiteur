import { Component, inject, OnInit, signal } from '@angular/core';
import { Router } from '@angular/router';
import { ConsumerAuthService } from '../consumer-auth.service';
import { WRONG_PORTAL_ERROR_CODE } from '../auth.errors';

@Component({
  selector: 'tmt-consumer-auth-callback',
  template: `
    <article class="auth-card">
      <p class="auth-card__eyebrow">Connexion</p>
      <h2>Finalisation…</h2>
      @if (error()) {
        <p class="auth-card__error" role="alert">{{ error() }}</p>
      } @else {
        <p class="auth-card__lead">Veuillez patienter pendant la connexion.</p>
      }
    </article>
  `,
  styleUrl: '../auth-form.scss',
})
export class AuthCallback implements OnInit {
  private readonly auth = inject(ConsumerAuthService);
  private readonly router = inject(Router);

  protected readonly error = signal('');

  async ngOnInit(): Promise<void> {
    const err = await this.auth.handleAuthCallback();

    if (err) {
      this.error.set(ConsumerAuthService.messageForError(err));
      if (err.message === WRONG_PORTAL_ERROR_CODE) {
        await this.router.navigate(['/auth/connexion'], {
          queryParams: { error: WRONG_PORTAL_ERROR_CODE },
        });
      }
      return;
    }

    if (this.auth.isRecoveryFlow()) {
      await this.router.navigate(['/auth/nouveau-mot-de-passe']);
      return;
    }

    await this.router.navigate(['/']);
  }
}
