import { Component, computed, inject, signal } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { RouterLink } from '@angular/router';
import { Button } from 'primeng/button';
import { InputText } from 'primeng/inputtext';
import { CatererAuthService } from '../caterer-auth.service';

@Component({
  selector: 'tmt-update-email',
  imports: [FormsModule, RouterLink, Button, InputText],
  templateUrl: './update-email.html',
  styleUrl: '../auth-form.scss',
})
export class UpdateEmail {
  private readonly auth = inject(CatererAuthService);

  protected newEmail = '';
  protected loading = signal(false);
  protected error = signal('');
  protected success = signal('');

  protected readonly currentEmail = computed(
    () => this.auth.user()?.email ?? '',
  );

  protected async onSubmit(event: Event): Promise<void> {
    event.preventDefault();
    this.error.set('');
    this.success.set('');
    this.loading.set(true);

    const err = await this.auth.updateEmail(this.newEmail);
    this.loading.set(false);

    if (err) {
      this.error.set(CatererAuthService.messageForError(err));
      return;
    }

    this.success.set(
      'Un e-mail de confirmation a été envoyé à votre nouvelle adresse.',
    );
  }
}
