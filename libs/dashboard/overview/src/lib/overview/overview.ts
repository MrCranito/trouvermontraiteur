import { Component, computed, inject, signal } from '@angular/core';
import { RouterLink } from '@angular/router';
import {
  CatererDevisService,
  CatererProfileService,
  CatererQuoteRequest,
  CatererStatsService,
  QuoteRequestStatus,
} from '@trouvermontraiteur/dashboard-data';
import { PUBLIC_APP_URL } from '@trouvermontraiteur/data';

type QuoteTabId = 'all' | 'new' | 'progress' | 'done';

type StatusVisual = {
  label: string;
  bg: string;
  fg: string;
  group: Exclude<QuoteTabId, 'all'>;
};

const STATUS_VISUAL: Record<QuoteRequestStatus, StatusVisual> = {
  new: { label: 'Nouvelle', bg: '#F6E6DC', fg: '#8F3A10', group: 'new' },
  viewed: {
    label: 'En discussion',
    bg: '#EFEAE2',
    fg: '#4A433D',
    group: 'progress',
  },
  answered: {
    label: 'Devis envoyé',
    bg: '#E2EAF2',
    fg: '#2F4F70',
    group: 'progress',
  },
  archived: { label: 'Terminée', bg: '#F0EDEA', fg: '#6B625A', group: 'done' },
};

const FREE_VIEWS_BARS = [
  31, 36, 42, 33, 38, 49, 58, 40, 37, 45, 44, 39, 52, 61, 41, 46, 48, 42, 47, 59,
  66, 44, 49, 51, 43, 55, 63, 70, 49, 53,
];

@Component({
  selector: 'tmt-dashboard-overview',
  imports: [RouterLink],
  templateUrl: './overview.html',
  styleUrl: './overview.scss',
})
export class DashboardOverview {
  private readonly statsService = inject(CatererStatsService);
  private readonly profileService = inject(CatererProfileService);
  private readonly devisService = inject(CatererDevisService);
  private readonly publicAppUrl = inject(PUBLIC_APP_URL, { optional: true });

  protected readonly stats = this.statsService.getStats();
  protected readonly caterer = this.profileService.profileSignal;
  protected readonly isPremium = signal(false);
  protected readonly activeTab = signal<QuoteTabId>('all');

  protected readonly completeness = computed(() =>
    this.profileService.getCompleteness(),
  );

  protected readonly greetingName = computed(() => {
    const profile = this.caterer();
    return profile?.name ?? 'Artisan';
  });

  protected readonly publicPageUrl = computed(() => {
    const profile = this.caterer();
    const base = this.publicAppUrl?.replace(/\/$/, '');
    if (!profile || !base) {
      return null;
    }
    return `${base}/artisans/${profile.id}`;
  });

  protected readonly kpis = computed(() => {
    const s = this.stats;
    const c = this.caterer();
    const format = (n: number) => new Intl.NumberFormat('fr-FR').format(n);

    return [
      {
        key: 'views',
        label: 'Vues de la page',
        value: format(s.profileViews.value),
        trend: this.formatDelta(s.profileViews.delta, '% vs mois dernier'),
        up: s.profileViews.delta > 0,
      },
      {
        key: 'quotes',
        label: 'Demandes de devis',
        value: format(s.contactRequests.value),
        trend: this.formatDelta(s.contactRequests.delta, ' vs mois dernier', true),
        up: s.contactRequests.delta > 0,
      },
      {
        key: 'response',
        label: 'Taux de réponse',
        value: '92 %',
        trend: 'Répond en 4 h en moyenne',
        up: null as boolean | null,
      },
      {
        key: 'rating',
        label: 'Note moyenne',
        value: `${(c?.rating ?? 4.9).toFixed(1).replace('.', ',')} ★`,
        trend: `${c?.reviewCount ?? 15} avis · 2 nouveaux`,
        up: null as boolean | null,
      },
    ];
  });

  protected readonly quoteTabs = computed(() => {
    const all = this.devisService.requestsSignal();
    const tab = this.activeTab();
    const defs: { id: QuoteTabId; label: string }[] = [
      { id: 'all', label: 'Toutes' },
      { id: 'new', label: 'Nouvelles' },
      { id: 'progress', label: 'En cours' },
      { id: 'done', label: 'Terminées' },
    ];
    return defs.map((d) => ({
      ...d,
      count: all.filter((r) => this.matchesTab(r, d.id)).length,
      selected: tab === d.id,
    }));
  });

  protected readonly quoteRows = computed(() => {
    const tab = this.activeTab();
    return this.devisService
      .requestsSignal()
      .filter((r) => this.matchesTab(r, tab))
      .sort((a, b) => b.requestedAtMs - a.requestedAtMs)
      .slice(0, 6)
      .map((r) => {
        const visual = STATUS_VISUAL[r.status];
        return {
          ...r,
          statusLabel: visual.label,
          statusBg: visual.bg,
          statusFg: visual.fg,
          nameWeight: r.status === 'new' ? 600 : 500,
          guestsLabel: this.formatGuests(r.guestCount),
          budgetLabel: r.budgetHint ?? 'Non précisé',
          receivedLabel: r.requestedAt.replace(/^Il y a /i, 'il y a '),
        };
      });
  });

  protected readonly calendarCells = computed(() => {
    // Demo grid for Oct 2026 (starts Thursday) — locked behind Premium.
    const booked = new Set([3, 10, 24]);
    const pending = new Set([14, 17]);
    const off = new Set([30, 31]);
    const cells: {
      label: string;
      bg: string;
      fg: string;
      bd: string;
      weight: number;
    }[] = [];

    for (let i = 0; i < 3; i++) {
      cells.push({
        label: '',
        bg: 'transparent',
        fg: '#2A2420',
        bd: 'transparent',
        weight: 400,
      });
    }
    for (let d = 1; d <= 31; d++) {
      const c = {
        label: String(d),
        bg: 'transparent',
        fg: '#2A2420',
        bd: 'transparent',
        weight: 400,
      };
      if (booked.has(d)) {
        c.bg = '#B04A17';
        c.fg = '#FFFFFF';
        c.weight = 600;
      } else if (pending.has(d)) {
        c.bg = '#F6E6DC';
        c.fg = '#8F3A10';
        c.bd = '#B04A17';
        c.weight = 600;
      } else if (off.has(d)) {
        c.bg = '#E5DFD6';
        c.fg = '#6B625A';
      }
      if (d === 1) {
        c.bd = '#2A2420';
        c.weight = 600;
      }
      cells.push(c);
    }
    cells.push({
      label: '',
      bg: 'transparent',
      fg: '#2A2420',
      bd: 'transparent',
      weight: 400,
    });
    return cells;
  });

  protected readonly weekdays = ['L', 'M', 'M', 'J', 'V', 'S', 'D'];

  protected readonly viewBars = computed(() => {
    const max = Math.max(...FREE_VIEWS_BARS);
    return FREE_VIEWS_BARS.map((v, i) => ({
      height: `${Math.round((v / max) * 100)}%`,
      tip: `${v} vues`,
      accent: i === FREE_VIEWS_BARS.length - 1,
    }));
  });

  protected readonly funnel = [
    { label: 'Vues de la page', value: '2 846', rate: '', w: '100%' },
    {
      label: 'Clics « Demander un devis »',
      value: '358',
      rate: '12,6 %',
      w: '42%',
    },
    { label: 'Demandes envoyées', value: '41', rate: '11,5 %', w: '22%' },
    { label: 'Devis acceptés', value: '12', rate: '29 %', w: '9%' },
  ];

  protected readonly sources = [
    { label: 'Recherche sur le site', pct: '48%' },
    { label: 'Mise en avant', pct: '27%' },
    { label: 'Carte', pct: '15%' },
    { label: 'Lien partagé', pct: '10%' },
  ];

  protected readonly bench = [
    { label: 'Taux de conversion', you: '1,4 %', avg: '0,9 %' },
    { label: 'Temps de réponse', you: '3 h', avg: '11 h' },
    { label: "Prix moyen d'un devis", you: '2 850 €', avg: '2 400 €' },
  ];

  protected selectTab(id: QuoteTabId): void {
    this.activeTab.set(id);
  }

  private matchesTab(request: CatererQuoteRequest, tab: QuoteTabId): boolean {
    if (tab === 'all') {
      return true;
    }
    return STATUS_VISUAL[request.status].group === tab;
  }

  private formatDelta(
    delta: number,
    suffix: string,
    absolute = false,
  ): string {
    const sign = delta > 0 ? '+' : '';
    if (absolute) {
      const approx = Math.round(Math.abs(delta) / 4);
      return `${sign}${approx || 1}${suffix}`;
    }
    return `${sign}${delta.toFixed(0).replace('.', ',')} ${suffix}`;
  }

  private formatGuests(count: number | null): string {
    if (count == null) {
      return '—';
    }
    if (count < 50) {
      return '< 50';
    }
    if (count < 100) {
      return '50–100';
    }
    if (count < 250) {
      return '100–250';
    }
    return '250 +';
  }
}
