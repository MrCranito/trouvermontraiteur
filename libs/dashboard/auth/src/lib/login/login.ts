import { Component, inject, signal } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Router, RouterLink } from '@angular/router';
import { Button } from 'primeng/button';
import { InputText } from 'primeng/inputtext';
import { Password } from 'primeng/password';
import { CatererAuthService } from '../caterer-auth.service';

@Component({
  selector: 'tmt-login',
  imports: [FormsModule, RouterLink, Button, InputText, Password],
  templateUrl: './login.html',
  styleUrl: '../auth-form.scss',
})
export class Login {
  private readonly auth = inject(CatererAuthService);
  private readonly router = inject(Router);

  protected email = '';
  protected password = '';
  protected loading = signal(false);
  protected error = signal('');

  protected async onSubmit(event: Event): Promise<void> {
    event.preventDefault();
    this.error.set('');
    this.loading.set(true);

    const err = await this.auth.signInWithEmail(this.email, this.password);
    this.loading.set(false);

    if (err) {
      this.error.set(CatererAuthService.messageForError(err));
      return;
    }

    await this.router.navigate(['/apercu']);
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
