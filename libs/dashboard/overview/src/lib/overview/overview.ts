import { Component, computed, inject, signal } from '@angular/core';
import { RouterLink } from '@angular/router';
import { FormsModule } from '@angular/forms';
import {
  CatererProfileService,
  CatererStatsService,
  PROFILE_VIEWS_PERIOD_HINTS,
  PROFILE_VIEWS_PERIOD_LABELS,
  ProfileViewsPeriod,
  StatTrend,
} from '@trouvermontraiteur/dashboard-data';
import { colors } from '@trouvermontraiteur/theme';
import { UIChart } from 'primeng/chart';
import { Select } from 'primeng/select';
import { Tag } from 'primeng/tag';

const PROFILE_VIEWS_PERIODS: ProfileViewsPeriod[] = [
  'day',
  'week',
  'month',
  'year',
];

@Component({
  selector: 'tmt-dashboard-overview',
  imports: [RouterLink, FormsModule, Tag, UIChart, Select],
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

  protected readonly viewsPeriods = PROFILE_VIEWS_PERIODS;
  protected readonly viewsPeriodOptions = this.viewsPeriods.map((period) => ({
    label: PROFILE_VIEWS_PERIOD_LABELS[period],
    value: period,
  }));
  protected readonly selectedViewsPeriod = signal<ProfileViewsPeriod>('day');

  protected readonly viewsSeries = computed(
    () =>
      this.stats.viewsSeriesByPeriod[this.selectedViewsPeriod()],
  );

  protected readonly viewsChartTitle = computed(() => {
    const hint = PROFILE_VIEWS_PERIOD_HINTS[this.selectedViewsPeriod()];
    return `Vues du profil (${hint})`;
  });

  protected readonly viewsChartData = computed(() => {
    const series = this.viewsSeries();
    return {
      labels: series.map((d) => d.label),
      datasets: [
        {
          label: 'Vues du profil',
          data: series.map((d) => d.views),
          borderColor: colors.terracotta,
          backgroundColor: 'rgba(196, 98, 45, 0.1)',
          fill: true,
          tension: 0.35,
          borderWidth: 2,
          pointRadius: this.selectedViewsPeriod() === 'year' ? 4 : 3,
          pointHoverRadius: 6,
          pointBackgroundColor: colors.terracotta,
          pointBorderColor: '#fffdfb',
          pointBorderWidth: 2,
          pointHoverBackgroundColor: colors.terracottaLight,
          pointHoverBorderColor: '#fffdfb',
        },
      ],
    };
  });

  protected readonly viewsChartOptions = computed(() => ({
    maintainAspectRatio: false,
    interaction: {
      mode: 'index' as const,
      intersect: false,
    },
    plugins: {
      legend: { display: false },
      tooltip: {
        backgroundColor: colors.charcoal,
        titleColor: colors.cream,
        bodyColor: colors.cream,
        padding: 12,
        cornerRadius: 10,
        displayColors: false,
        callbacks: {
          label: (ctx: { parsed: { y: number } }) =>
            `${new Intl.NumberFormat('fr-FR').format(ctx.parsed.y)} vues`,
        },
      },
    },
    scales: {
      x: {
        grid: { display: false },
        border: { display: false },
        ticks: {
          color: colors.muted,
          font: { size: 11, weight: '500' as const },
          maxRotation: 0,
          autoSkip: true,
          maxTicksLimit:
            this.selectedViewsPeriod() === 'month' ? 12 : undefined,
        },
      },
      y: {
        beginAtZero: true,
        grid: {
          color: 'rgba(42, 34, 25, 0.06)',
          drawTicks: false,
        },
        border: { display: false },
        ticks: {
          color: colors.muted,
          font: { size: 11 },
          padding: 8,
          precision: 0,
          callback: (value: string | number) =>
            new Intl.NumberFormat('fr-FR', {
              notation: 'compact',
              compactDisplay: 'short',
            }).format(Number(value)),
        },
      },
    },
  }));

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
        trend: { value: c?.rating ?? 0, delta: 0 },
        hint: `${c?.reviewCount ?? 0} avis sur l'app`,
      },
    ] as const;
  });

  protected selectViewsPeriod(period: ProfileViewsPeriod): void {
    this.selectedViewsPeriod.set(period);
  }

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
