import { Component, computed, inject, signal } from '@angular/core';
import { RouterLink, RouterLinkActive, RouterOutlet } from '@angular/router';
import {
  CatererDevisService,
} from '@trouvermontraiteur/dashboard-data';
import { CatererAuthService } from '@trouvermontraiteur/dashboard-auth';

export type DashNavItem = {
  id: string;
  label: string;
  route?: string;
  badge?: boolean;
  locked?: boolean;
  exact?: boolean;
  /** When false, link navigates but never shows as active. */
  markActive?: boolean;
};

@Component({
  selector: 'tmt-dashboard-shell',
  imports: [RouterOutlet, RouterLink, RouterLinkActive],
  templateUrl: './shell.html',
  styleUrl: './shell.scss',
})
export class DashboardShell {
  private readonly devisService = inject(CatererDevisService);
  private readonly auth = inject(CatererAuthService);

  /** Free tier by default — Premium unlocks calendar & advanced stats. */
  protected readonly isPremium = signal(false);

  protected readonly newDevisCount = this.devisService.newCount;

  protected readonly navItems = computed<DashNavItem[]>(() => {
    const premium = this.isPremium();
    return [
      {
        id: 'overview',
        label: 'Tableau de bord',
        route: '/apercu',
        exact: true,
      },
      {
        id: 'devis',
        label: 'Demandes de devis',
        route: '/devis',
        badge: true,
      },
      {
        id: 'calendar',
        label: 'Calendrier',
        locked: !premium,
        route: premium ? '/disponibilites' : undefined,
      },
      {
        id: 'stats',
        label: 'Statistiques',
        route: '/apercu',
        markActive: false,
      },
      {
        id: 'reviews',
        label: 'Avis clients',
      },
      {
        id: 'page',
        label: 'Ma page',
        route: '/custom-details',
      },
      {
        id: 'billing',
        label: 'Abonnement',
      },
    ];
  });

  protected signOut(): void {
    void this.auth.signOut();
  }
}
