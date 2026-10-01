import { Component, inject } from '@angular/core';
import { Router, RouterLink } from '@angular/router';
import { FavoriteLoginPromptService } from '@trouvermontraiteur/app-consumer-data';
import { Dialog } from 'primeng/dialog';

@Component({
  selector: 'tmt-favorite-login-dialog',
  imports: [Dialog, RouterLink],
  templateUrl: './favorite-login-dialog.html',
  styleUrl: './favorite-login-dialog.scss',
})
export class FavoriteLoginDialog {
  private readonly router = inject(Router);
  protected readonly prompt = inject(FavoriteLoginPromptService);

  protected loginLink(): string[] {
    return ['/auth/connexion'];
  }

  protected signupLink(): string[] {
    return ['/auth/inscription'];
  }

  protected returnUrl(): string {
    return this.router.url || '/';
  }

  protected close(): void {
    this.prompt.close();
  }
}
