import { Component, inject } from '@angular/core';
import { RouterLink, RouterOutlet } from '@angular/router';
import { buildAppUrl } from '@trouvermontraiteur/data';
import { TmtFooter } from '@trouvermontraiteur/footer';
import { CONSUMER_DASHBOARD_APP_URL } from '../dashboard-app-url.token';

@Component({
  selector: 'tmt-consumer-auth-layout',
  imports: [RouterLink, RouterOutlet, TmtFooter],
  templateUrl: './auth-layout.html',
  styleUrl: './auth-layout.scss',
})
export class AuthLayout {
  private readonly dashboardAppBase = inject(CONSUMER_DASHBOARD_APP_URL);

  protected readonly dashboardUrl = buildAppUrl(this.dashboardAppBase);
}
