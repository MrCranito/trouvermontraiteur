import { Component, computed, input, output } from '@angular/core';
import { RouterLink } from '@angular/router';
import { MenuItem } from 'primeng/api';
import { Button } from 'primeng/button';
import { Menu } from 'primeng/menu';
import { TopbarAuthState } from './topbar-auth-state';

@Component({
  selector: 'tmt-topbar',
  imports: [RouterLink, Button, Menu],
  templateUrl: './topbar.html',
  styleUrl: './topbar.scss',
})
export class TmtTopbar {
  readonly dashboardUrl = input.required<string>();
  readonly brandName = input('Trouver mon artisan');
  readonly homeLink = input<string>('/');
  readonly auth = input<TopbarAuthState | null>(null);
  /** Router link for the login button when the user is not authenticated. */
  readonly loginHref = input<string | null>(null);

  readonly signOut = output<void>();
  readonly loginClick = output<Event>();

  protected readonly isAuthenticated = computed(
    () => this.auth()?.authenticated ?? false,
  );
  protected readonly avatarUrl = computed(
    () => this.auth()?.avatarUrl ?? null,
  );

  protected readonly accountMenuItems = computed((): MenuItem[] => [
    {
      label: 'Favoris',
      icon: 'pi pi-heart',
      routerLink: '/favoris',
    },
    {
      label: 'Devis',
      icon: 'pi pi-file-edit',
      routerLink: '/devis',
    },
    { separator: true },
    {
      label: 'Déconnexion',
      icon: 'pi pi-sign-out',
      command: () => this.signOut.emit(),
    },
  ]);
}
