import { Component, inject, signal } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { RouterLink } from '@angular/router';
import { Button } from 'primeng/button';
import { InputText } from 'primeng/inputtext';
import { ConsumerAuthService } from '../consumer-auth.service';

@Component({
  selector: 'tmt-consumer-forgot-password',
  imports: [FormsModule, RouterLink, Button, InputText],
  templateUrl: './forgot-password.html',
  styleUrl: '../auth-form.scss',
})
export class ForgotPassword {
  private readonly auth = inject(ConsumerAuthService);

  protected email = '';
  protected loading = signal(false);
  protected error = signal('');
  protected success = signal('');

  protected async onSubmit(event: Event): Promise<void> {
    event.preventDefault();
    this.error.set('');
    this.success.set('');
    this.loading.set(true);

    const err = await this.auth.sendPasswordResetEmail(this.email);
    this.loading.set(false);

    if (err) {
      this.error.set(ConsumerAuthService.messageForError(err));
      return;
    }

    this.success.set(
      'Si un compte existe pour cet e-mail, vous recevrez un lien pour réinitialiser votre mot de passe.',
    );
  }
}
