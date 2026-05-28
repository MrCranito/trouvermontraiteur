import { Component, computed, input } from '@angular/core';
import { RouterLink } from '@angular/router';

export interface FooterLink {
  label: string;
  routerLink?: string | string[];
  href?: string;
  external?: boolean;
}

export interface FooterLinkGroup {
  title: string;
  links: FooterLink[];
}

@Component({
  selector: 'tmt-footer',
  imports: [RouterLink],
  templateUrl: './footer.html',
  styleUrl: './footer.scss',
})
export class TmtFooter {
  /** Lien interne (router) vers l’accueil. */
  readonly homeLink = input<string | string[]>('/');
  /** Lien externe vers l’accueil (prioritaire sur homeLink si défini). */
  readonly homeHref = input<string | null>(null);
  readonly searchHref = input<string | null>(null);
  readonly dashboardHref = input<string | null>(null);
  readonly tagline = input(
    'Trouvez l’artisan idéal pour tous vos projets, partout en France.',
  );

  protected readonly currentYear = new Date().getFullYear();

  protected readonly linkGroups = computed((): FooterLinkGroup[] => {
    const search = this.searchHref();
    const dashboard = this.dashboardHref();

    return [
      {
        title: 'Plateforme',
        links: [
          this.homeHref()
            ? { label: 'Accueil', href: this.homeHref()!, external: true }
            : { label: 'Accueil', routerLink: this.homeLink() },
          search
            ? { label: 'Rechercher un artisan', href: search, external: true }
            : { label: 'Rechercher un artisan', routerLink: '/explorer' },
          { label: 'Comment ça marche' },
          { label: 'Nos engagements' },
        ],
      },
      {
        title: 'Artisans',
        links: [
          dashboard
            ? { label: 'Devenir artisan partenaire', href: dashboard, external: true }
            : { label: 'Devenir artisan partenaire' },
          dashboard
            ? { label: 'Espace professionnel', href: dashboard, external: true }
            : { label: 'Espace professionnel' },
          { label: 'Tarifs et abonnements' },
        ],
      },
      {
        title: 'Aide',
        links: [
          { label: 'Centre d’aide' },
          { label: 'Nous contacter' },
          { label: 'FAQ' },
          { label: 'Signaler un problème' },
        ],
      },
      {
        title: 'Informations légales',
        links: [
          { label: 'Mentions légales' },
          { label: 'Politique de confidentialité' },
          { label: "Conditions générales d'utilisation" },
          { label: 'Politique cookies' },
          { label: 'Accessibilité' },
        ],
      },
    ];
  });

  protected onPlaceholderLink(event: Event): void {
    event.preventDefault();
  }
}
