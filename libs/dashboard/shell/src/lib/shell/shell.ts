import { Component, computed, inject } from '@angular/core';
import { RouterLink, RouterLinkActive, RouterOutlet } from '@angular/router';
import {
  APP_PREVIEW_URL,
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
  private readonly appPreviewUrl = inject(APP_PREVIEW_URL);

  protected readonly caterer = this.profileService.profileSignal;
  protected readonly completeness = computed(() =>
    this.profileService.getCompleteness(),
  );

  protected readonly previewUrl = computed(() => {
    const base = this.appPreviewUrl.replace(/\/$/, '');
    return `${base}/traiteurs/${this.caterer().slug}`;
  });

  protected readonly newDevisCount = this.devisService.newCount;

  protected readonly navItems: {
    label: string;
    icon: string;
    route: string;
    badge?: boolean;
  }[] = [
    { label: "Vue d'ensemble", icon: 'pi pi-chart-bar', route: '/apercu' },
    { label: 'Devis', icon: 'pi pi-file-edit', route: '/devis', badge: true },
    {
      label: 'Disponibilités',
      icon: 'pi pi-calendar',
      route: '/disponibilites',
    },
    {
      label: 'Personnalisation',
      icon: 'pi pi-id-card',
      route: '/profil',
    },
  ];

  protected signOut(): void {
    void this.auth.signOut();
  }
}
