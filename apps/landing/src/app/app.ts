import { Component, inject } from '@angular/core';
import { RouterModule } from '@angular/router';
import { buildAppUrl, DASHBOARD_APP_URL, PUBLIC_APP_URL } from '@trouvermontraiteur/data';
import { TmtTopbar } from '@trouvermontraiteur/topbar';

@Component({
  imports: [RouterModule, TmtTopbar],
  selector: 'app-root',
  templateUrl: './app.html',
  styleUrl: './app.scss',
})
export class App {
  private readonly searchAppBase = inject(PUBLIC_APP_URL);
  private readonly dashboardAppBase = inject(DASHBOARD_APP_URL);

  protected readonly searchAppUrl = buildAppUrl(this.searchAppBase);
  protected readonly dashboardAppUrl = buildAppUrl(this.dashboardAppBase);
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
