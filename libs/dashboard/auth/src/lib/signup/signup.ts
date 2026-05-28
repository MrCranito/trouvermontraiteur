import { Component, inject, signal } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Router, RouterLink } from '@angular/router';
import { PrimeTemplate } from 'primeng/api';
import { Button } from 'primeng/button';
import { InputText } from 'primeng/inputtext';
import { Password } from 'primeng/password';
import { CatererAuthService } from '../caterer-auth.service';
import { GoogleIcon } from '../google-icon/google-icon';

@Component({
  selector: 'tmt-signup',
  imports: [
    FormsModule,
    RouterLink,
    Button,
    InputText,
    Password,
    PrimeTemplate,
    GoogleIcon,
  ],
  templateUrl: './signup.html',
  styleUrl: '../auth-form.scss',
})
export class Signup {
  private readonly auth = inject(CatererAuthService);
  private readonly router = inject(Router);

  protected email = '';
  protected password = '';
  protected confirmPassword = '';
  protected loading = signal(false);
  protected error = signal('');
  protected success = signal('');

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
    const { error, needsEmailConfirmation } = await this.auth.signUpWithEmail(
      this.email,
      this.password,
    );
    this.loading.set(false);

    if (error) {
      this.error.set(CatererAuthService.messageForError(error));
      return;
    }

    if (needsEmailConfirmation) {
      this.success.set(
        'Un e-mail de confirmation vous a été envoyé. Cliquez sur le lien pour activer votre compte.',
      );
      return;
    }

    await this.router.navigate(['/setup-business']);
  }

  protected async onGoogle(): Promise<void> {
    this.error.set('');
    this.loading.set(true);
    const err = await this.auth.signInWithGoogle();
    this.loading.set(false);
    if (err) {
      this.error.set(CatererAuthService.messageForError(err));
    }
  }
}
