import { Component, inject, OnInit, signal } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Router, RouterLink } from '@angular/router';
import { Button } from 'primeng/button';
import { Password } from 'primeng/password';
import { ConsumerAuthService } from '../consumer-auth.service';

@Component({
  selector: 'tmt-consumer-reset-password',
  imports: [FormsModule, RouterLink, Button, Password],
  templateUrl: './reset-password.html',
  styleUrl: '../auth-form.scss',
})
export class ResetPassword implements OnInit {
  private readonly auth = inject(ConsumerAuthService);
  private readonly router = inject(Router);

  protected password = '';
  protected confirmPassword = '';
  protected loading = signal(false);
  protected error = signal('');
  protected success = signal('');
  protected readonly recoveryReady = signal(false);

  async ngOnInit(): Promise<void> {
    await this.auth.whenReady();
    if (window.location.hash || window.location.search.includes('code=')) {
      await this.auth.handleAuthCallback();
    }
    this.recoveryReady.set(
      this.auth.isRecoveryFlow() || this.auth.isAuthenticated(),
    );
  }

  protected async onSubmit(event: Event): Promise<void> {
    event.preventDefault();
    this.error.set('');
    this.success.set('');

    if (this.password.length < 8) {
      this.error.set('Le mot de passe doit contenir au moins 8 caractères.');
      return;
    }

    if (this.password !== this.confirmPassword) {
      this.error.set('Les mots de passe ne correspondent pas.');
      return;
    }

    this.loading.set(true);
    const err = await this.auth.updatePassword(this.password);
    this.loading.set(false);

    if (err) {
      this.error.set(ConsumerAuthService.messageForError(err));
      return;
    }

    this.success.set('Mot de passe mis à jour. Vous pouvez vous connecter.');
    setTimeout(() => void this.router.navigate(['/auth/connexion']), 2000);
  }
}
