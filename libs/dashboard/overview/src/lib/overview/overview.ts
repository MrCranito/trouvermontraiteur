import { Component, computed, inject } from '@angular/core';
import { RouterLink } from '@angular/router';
import {
  CatererProfileService,
  CatererStatsService,
  StatTrend,
} from '@trouvermontraiteur/dashboard-data';
import { Button } from 'primeng/button';
import { Tag } from 'primeng/tag';

@Component({
  selector: 'tmt-dashboard-overview',
  imports: [RouterLink, Button, Tag],
  templateUrl: './overview.html',
  styleUrl: './overview.scss',
})
export class DashboardOverview {
  private readonly statsService = inject(CatererStatsService);
  private readonly profileService = inject(CatererProfileService);

  protected readonly stats = this.statsService.getStats();
  protected readonly caterer = this.profileService.profileSignal;
  protected readonly completeness = computed(() =>
    this.profileService.getCompleteness(),
  );

  protected readonly maxViews = computed(() =>
    Math.max(...this.stats.viewsSeries.map((d) => d.views), 1),
  );

  protected readonly statCards = computed(() => {
    const s = this.stats;
    const c = this.caterer();
    return [
      {
        key: 'views',
        label: 'Vues du profil',
        icon: 'pi pi-eye',
        accent: 'terracotta',
        trend: s.profileViews,
        hint: s.periodLabel,
      },
      {
        key: 'search',
        label: 'Apparitions recherche',
        icon: 'pi pi-search',
        accent: 'gold',
        trend: s.searchImpressions,
        hint: s.periodLabel,
      },
      {
        key: 'clicks',
        label: 'Clics sur la fiche',
        icon: 'pi pi-arrow-right',
        accent: 'sage',
        trend: s.profileClicks,
        hint: s.periodLabel,
      },
      {
        key: 'contacts',
        label: 'Demandes de contact',
        icon: 'pi pi-envelope',
        accent: 'terracotta',
        trend: s.contactRequests,
        hint: s.periodLabel,
      },
      {
        key: 'saved',
        label: 'Favoris',
        icon: 'pi pi-heart',
        accent: 'gold',
        trend: s.savedCount,
        hint: 'Total enregistrements',
      },
      {
        key: 'rating',
        label: 'Note publique',
        icon: 'pi pi-star-fill',
        accent: 'sage',
        trend: { value: c.rating, delta: 0 },
        hint: `${c.reviewCount} avis sur l'app`,
      },
    ] as const;
  });

  protected formatTrend(trend: StatTrend, isRating = false): string {
    if (isRating) {
      return trend.value.toFixed(1).replace('.', ',');
    }
    return new Intl.NumberFormat('fr-FR').format(trend.value);
  }

  protected trendLabel(delta: number): string | null {
    if (delta === 0) {
      return null;
    }
    const sign = delta > 0 ? '+' : '';
    return `${sign}${delta.toFixed(1)} %`;
  }

  protected trendClass(delta: number): string {
    if (delta > 0) {
      return 'dash-overview__trend--up';
    }
    if (delta < 0) {
      return 'dash-overview__trend--down';
    }
    return 'dash-overview__trend--flat';
  }
}
