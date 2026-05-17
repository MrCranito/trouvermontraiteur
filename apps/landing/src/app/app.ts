import { Component } from '@angular/core';
import { RouterLink, RouterModule } from '@angular/router';
import { MenuItem } from 'primeng/api';
import { Menubar } from 'primeng/menubar';

@Component({
  imports: [RouterModule, RouterLink, Menubar],
  selector: 'app-root',
  templateUrl: './app.html',
  styleUrl: './app.scss',
})
export class App {
  protected readonly currentYear = new Date().getFullYear();

  protected readonly menuItems: MenuItem[] = [
    {
      label: 'Accueil',
      icon: 'pi pi-home',
      routerLink: '/',
    },
    {
      label: 'Rechercher',
      icon: 'pi pi-search',
      routerLink: '/recherche',
    },
  ];

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
