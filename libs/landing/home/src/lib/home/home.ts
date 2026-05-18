import { Component, inject } from '@angular/core';
import { RouterLink } from '@angular/router';
import { Button } from 'primeng/button';
import { PUBLIC_APP_URL } from '@trouvermontraiteur/data';

@Component({
  selector: 'tmt-home',
  imports: [Button, RouterLink],
  templateUrl: './home.html',
  styleUrl: './home.scss',
})
export class Home {
  private readonly searchAppUrl = inject(PUBLIC_APP_URL) ?? '';

  protected searchUrl(query?: Record<string, string>): string {
    const qs = query
      ? new URLSearchParams(query).toString()
      : '';
    const base = this.searchAppUrl.replace(/\/$/, '') || '';

    if (base.startsWith('http://') || base.startsWith('https://')) {
      const url = new URL(base);
      if (qs) {
        url.search = qs;
      }
      return url.toString();
    }

    const path = base || '/';
    return qs ? `${path}?${qs}` : path;
  }

  protected readonly stats = [
    { value: '8+', label: 'Traiteurs à Paris' },
    { value: '4,7', label: 'Note moyenne' },
    { value: '6', label: "Types d'événements" },
    { value: '24h', label: 'Réponse estimée' },
  ] as const;

  protected readonly prestations = [
    {
      key: 'mariage',
      label: 'Mariage',
      icon: 'pi pi-heart',
      blurb: 'Menus assis, buffets et service traiteur le jour J',
      accent: 'terracotta',
    },
    {
      key: 'anniversaire',
      label: 'Anniversaire & fête',
      icon: 'pi pi-gift',
      blurb: 'Cocktails, pièces salées et formules conviviales',
      accent: 'gold',
    },
    {
      key: 'cocktail',
      label: 'Cocktail & réception',
      icon: 'pi pi-glass',
      blurb: 'Bouchées, bar mobile et animations gourmandes',
      accent: 'sage',
    },
    {
      key: 'entreprise',
      label: 'Séminaire & entreprise',
      icon: 'pi pi-briefcase',
      blurb: 'Petit-déjeuner, déjeuner et pauses café sur site',
      accent: 'terracotta',
    },
    {
      key: 'brunch',
      label: 'Brunch',
      icon: 'pi pi-sun',
      blurb: 'Formules douces, jus pressés et viennoiseries',
      accent: 'gold',
    },
    {
      key: 'famille',
      label: 'Baptême & famille',
      icon: 'pi pi-users',
      blurb: 'Buffets partagés et menus adaptés à tous les âges',
      accent: 'sage',
    },
  ] as const;

  protected readonly benefits = [
    {
      icon: 'pi pi-verified',
      title: 'Sélection locale',
      description:
        'Des artisans parisiens choisis pour la qualité de leurs prestations et de leur accueil.',
    },
    {
      icon: 'pi pi-sliders-h',
      title: 'Filtres précis',
      description:
        'Ville, note minimale et catégories — affinez votre recherche en quelques clics.',
    },
    {
      icon: 'pi pi-map',
      title: 'Vue carte',
      description:
        'Visualisez la zone d’intervention et comparez les traiteurs autour de votre lieu.',
    },
    {
      icon: 'pi pi-book',
      title: 'Menus détaillés',
      description:
        'Tarifs, descriptions et catégories de plats avant de contacter le traiteur.',
    },
  ] as const;

  protected readonly steps = [
    {
      num: '01',
      icon: 'pi pi-search',
      title: 'Recherchez',
      description: 'Par ville, note ou type de prestation.',
    },
    {
      num: '02',
      icon: 'pi pi-th-large',
      title: 'Comparez',
      description: 'Grille, liste ou carte — à vous de choisir.',
    },
    {
      num: '03',
      icon: 'pi pi-calendar',
      title: 'Réservez',
      description: 'Consultez le menu et contactez le traiteur.',
    },
  ] as const;

  protected readonly proPerks = [
    {
      icon: 'pi pi-id-card',
      title: 'Profil professionnel',
      description:
        'Présentez votre carte, vos menus, tarifs et zone d’intervention en un seul endroit.',
    },
    {
      icon: 'pi pi-users',
      title: 'Clients qualifiés',
      description:
        'Touchez des organisateurs qui cherchent activement un traiteur pour leur événement.',
    },
    {
      icon: 'pi pi-bolt',
      title: 'Mise en ligne rapide',
      description:
        'Créez votre compte en quelques minutes et commencez à recevoir des demandes.',
    },
  ] as const;
}
