import { Component, inject } from '@angular/core';
import { RouterLink, RouterModule } from '@angular/router';
import { Button } from 'primeng/button';
import { PUBLIC_APP_URL } from '@trouvermontraiteur/data';

@Component({
  imports: [RouterModule, RouterLink, Button],
  selector: 'app-root',
  templateUrl: './app.html',
  styleUrl: './app.scss',
})
export class App {
  protected readonly searchAppUrl = inject(PUBLIC_APP_URL) ?? '/';
  protected readonly currentYear = new Date().getFullYear();

  protected readonly legalLinks = [
    { label: 'Mentions légales' },
    { label: 'Politique de confidentialité' },
    { label: "Conditions générales d'utilisation" },
    { label: 'Politique cookies' },
  ] as const;

  protected onPlaceholderLink(event: Event): void {
    event.preventDefault();
  }
}
