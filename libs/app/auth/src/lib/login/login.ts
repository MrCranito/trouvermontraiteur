import { Component, inject, signal } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';
import { PrimeTemplate } from 'primeng/api';
import { Button } from 'primeng/button';
import { InputText } from 'primeng/inputtext';
import { Password } from 'primeng/password';
import { ConsumerAuthService } from '../consumer-auth.service';
import { WRONG_PORTAL_ERROR_CODE } from '../auth.errors';
import { GoogleIcon } from '../google-icon/google-icon';

@Component({
  selector: 'tmt-consumer-login',
  imports: [
    FormsModule,
    RouterLink,
    Button,
    InputText,
    Password,
    PrimeTemplate,
    GoogleIcon,
  ],
  templateUrl: './login.html',
  styleUrl: '../auth-form.scss',
})
export class Login {
  private readonly auth = inject(ConsumerAuthService);
  private readonly router = inject(Router);
  private readonly route = inject(ActivatedRoute);

  protected email = '';
  protected password = '';
  protected loading = signal(false);
  protected error = signal('');

  constructor() {
    const code = this.route.snapshot.queryParamMap.get('error');
    if (code === WRONG_PORTAL_ERROR_CODE) {
      this.error.set(
        ConsumerAuthService.messageForError({
          message: WRONG_PORTAL_ERROR_CODE,
        } as import('@supabase/supabase-js').AuthError),
      );
    }
  }

  protected async onSubmit(event: Event): Promise<void> {
    event.preventDefault();
    this.error.set('');
    this.loading.set(true);

    const err = await this.auth.signInWithEmail(this.email, this.password);
    this.loading.set(false);

    if (err) {
      this.error.set(ConsumerAuthService.messageForError(err));
      return;
    }

    const returnUrl = this.route.snapshot.queryParamMap.get('returnUrl');
    await this.router.navigateByUrl(
      returnUrl?.startsWith('/') ? returnUrl : '/',
    );
  }

  protected async onGoogle(): Promise<void> {
    this.error.set('');
    this.loading.set(true);
    const err = await this.auth.signInWithGoogle();
    this.loading.set(false);
    if (err) {
      this.error.set(ConsumerAuthService.messageForError(err));
    }
  }
}
