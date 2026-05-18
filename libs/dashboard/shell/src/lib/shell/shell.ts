import { Component, computed, inject } from '@angular/core';
import { RouterLink, RouterLinkActive, RouterOutlet } from '@angular/router';
import { CatererProfileService, APP_PREVIEW_URL } from '@trouvermontraiteur/dashboard-data';
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
  private readonly auth = inject(CatererAuthService);
  private readonly appPreviewUrl = inject(APP_PREVIEW_URL);

  protected readonly userEmail = computed(
    () => this.auth.user()?.email ?? '',
  );

  protected readonly caterer = this.profileService.profileSignal;
  protected readonly completeness = computed(() =>
    this.profileService.getCompleteness(),
  );

  protected readonly previewUrl = computed(() => {
    const base = this.appPreviewUrl.replace(/\/$/, '');
    return `${base}/traiteurs/${this.caterer().slug}`;
  });

  protected readonly navItems = [
    { label: "Vue d'ensemble", icon: 'pi pi-chart-bar', route: '/apercu' },
    { label: 'Mon profil', icon: 'pi pi-id-card', route: '/profil' },
    { label: 'E-mail du compte', icon: 'pi pi-envelope', route: '/auth/changer-email' },
  ] as const;

  protected signOut(): void {
    void this.auth.signOut();
  }
}
