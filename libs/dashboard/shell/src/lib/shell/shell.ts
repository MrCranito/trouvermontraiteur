import { Component, computed, inject } from '@angular/core';
import { RouterLink, RouterLinkActive, RouterOutlet } from '@angular/router';
import {
  CatererDevisService,
  CatererProfileService,
} from '@trouvermontraiteur/dashboard-data';
import { CatererAuthService } from '@trouvermontraiteur/dashboard-auth';
import { Button } from 'primeng/button';

@Component({
  selector: 'tmt-dashboard-shell',
  imports: [RouterOutlet, RouterLink, RouterLinkActive, Button],
  templateUrl: './shell.html',
  styleUrl: './shell.scss',
})
export class DashboardShell {
  private readonly profileService = inject(CatererProfileService);
  private readonly devisService = inject(CatererDevisService);
  private readonly auth = inject(CatererAuthService);

  protected readonly caterer = this.profileService.profileSignal;

  protected readonly showCompleteProfileCta = computed(() => {
    const profile = this.caterer();
    return profile !== null && !profile.published;
  });

  protected readonly newDevisCount = this.devisService.newCount;

  protected readonly navItems = computed<
    { label: string; icon: string; route: string; badge?: boolean }[]
  >(() => {
    return [
      { label: "Vue d'ensemble", icon: 'pi pi-chart-bar', route: '/apercu' },
      { label: 'Devis', icon: 'pi pi-file-edit', route: '/devis', badge: true },
      {
        label: 'Personnalisation',
        icon: 'pi pi-id-card',
        route: '/custom-details',
      },
    ];
  });

  protected signOut(): void {
    void this.auth.signOut();
  }
}
