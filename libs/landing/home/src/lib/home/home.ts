import { Component, inject } from '@angular/core';
import { Button } from 'primeng/button';
import {
  buildAppUrl,
  DASHBOARD_APP_URL,
  PUBLIC_APP_URL,
  TRADE_FAMILIES,
} from '@trouvermontraiteur/data';

const FAMILY_ICONS: Record<string, string> = {
  batiments: 'pi pi-building',
  reparation: 'pi pi-wrench',
  mobilite: 'pi pi-car',
  alimentation: 'pi pi-shopping-bag',
  beaute: 'pi pi-sparkles',
  mode: 'pi pi-tag',
  decoration: 'pi pi-palette',
  jardin: 'pi pi-sun',
  audiovisuel: 'pi pi-camera',
};

const FAMILY_BLURBS: Record<string, string> = {
  batiments: 'Gros œuvre, second œuvre et finitions',
  reparation: 'Dépannage et réparations du quotidien',
  mobilite: 'Auto, moto, vélo et contrôle technique',
  alimentation: 'Artisans du goût et de la restauration',
  beaute: 'Coiffure, bien-être et soins',
  mode: 'Couture, bijoux et accessoires',
  decoration: 'Décoration intérieure et arts décoratifs',
  jardin: 'Espaces verts, fleurs et piscines',
  audiovisuel: 'Photo et image',
};

const FAMILY_ACCENTS = ['terracotta', 'gold', 'sage'] as const;

@Component({
  selector: 'tmt-home',
  imports: [Button],
  templateUrl: './home.html',
  styleUrl: './home.scss',
})
export class Home {
  private readonly searchAppBase = inject(PUBLIC_APP_URL);
  private readonly dashboardAppBase = inject(DASHBOARD_APP_URL);

  protected searchUrl(query?: Record<string, string>, path = ''): string {
    const qs = query ? new URLSearchParams(query).toString() : '';
    const base = buildAppUrl(this.searchAppBase, path);

    if (base.startsWith('http://') || base.startsWith('https://')) {
      const url = new URL(base);
      if (qs) {
        url.search = qs;
      }
      return url.toString();
    }

    return qs ? `${base}?${qs}` : base;
  }

  protected familySearchUrl(familyId: string): string {
    const family = TRADE_FAMILIES.find((entry) => entry.id === familyId);
    if (!family) {
      return this.searchUrl(undefined, '/explorer');
    }

    const trades = [...new Set(family.trades.map((trade) => trade.id))].join(
      ',',
    );
    return this.searchUrl({ trades }, '/explorer');
  }

  protected dashboardUrl(path = ''): string {
    return buildAppUrl(this.dashboardAppBase, path);
  }

  protected readonly stats = [
    { value: '90+', label: 'Artisans référencés' },
    { value: '9', label: 'Familles de métiers' },
    { value: '4,7', label: 'Note moyenne' },
    { value: '24h', label: 'Réponse estimée' },
  ] as const;

  protected readonly tradeCategories = TRADE_FAMILIES.map((family, index) => ({
    key: family.id,
    label: family.label,
    icon: FAMILY_ICONS[family.id] ?? 'pi pi-briefcase',
    blurb: FAMILY_BLURBS[family.id] ?? family.label,
    accent: FAMILY_ACCENTS[index % FAMILY_ACCENTS.length],
  }));

  protected readonly benefits = [
    {
      icon: 'pi pi-verified',
      title: 'Artisans locaux',
      description:
        'Des professionnels de tous métiers, sélectionnés pour la qualité de leurs prestations.',
    },
    {
      icon: 'pi pi-sliders-h',
      title: 'Filtres précis',
      description:
        'Lieu, métier, note et type de projet — affinez votre recherche en quelques clics.',
    },
    {
      icon: 'pi pi-map',
      title: 'Vue carte',
      description:
        'Visualisez la zone d’intervention et comparez les artisans autour de chez vous.',
    },
    {
      icon: 'pi pi-wallet',
      title: 'Tarifs transparents',
      description:
        'Prestations et tarifs indicatifs avant de demander un devis personnalisé.',
    },
  ] as const;

  protected readonly steps = [
    {
      num: '01',
      icon: 'pi pi-search',
      title: 'Recherchez',
      description: 'Par ville, métier ou type de projet.',
    },
    {
      num: '02',
      icon: 'pi pi-th-large',
      title: 'Comparez',
      description: 'Grille, liste ou carte — à vous de choisir.',
    },
    {
      num: '03',
      icon: 'pi pi-envelope',
      title: 'Contactez',
      description: 'Consultez le profil et demandez un devis à l’artisan.',
    },
  ] as const;

  protected readonly proPerks = [
    {
      icon: 'pi pi-id-card',
      title: 'Profil professionnel',
      description:
        'Présentez vos prestations, tarifs et zone d’intervention en un seul endroit.',
    },
    {
      icon: 'pi pi-users',
      title: 'Clients qualifiés',
      description:
        'Touchez des particuliers et pros qui cherchent activement un artisan près de chez eux.',
    },
    {
      icon: 'pi pi-bolt',
      title: 'Mise en ligne rapide',
      description:
        'Créez votre compte en quelques minutes et commencez à recevoir des demandes.',
    },
  ] as const;
}
