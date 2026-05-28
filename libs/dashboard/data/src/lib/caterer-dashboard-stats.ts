export interface StatTrend {
  value: number;
  /** Percent change vs previous period */
  delta: number;
}

export interface DailyMetric {
  date: string;
  label: string;
  views: number;
}

export type ProfileViewsPeriod = 'day' | 'week' | 'month' | 'year';

export const PROFILE_VIEWS_PERIOD_LABELS: Record<
  ProfileViewsPeriod,
  string
> = {
  day: 'Jour',
  week: 'Semaine',
  month: 'Mois',
  year: 'Année',
};

export const PROFILE_VIEWS_PERIOD_HINTS: Record<ProfileViewsPeriod, string> = {
  day: '7 derniers jours',
  week: '12 dernières semaines',
  month: '12 derniers mois',
  year: '5 dernières années',
};

export interface DashboardActivity {
  id: string;
  icon: string;
  title: string;
  description: string;
  timeAgo: string;
}

export interface CatererDashboardStats {
  periodLabel: string;
  profileViews: StatTrend;
  searchImpressions: StatTrend;
  profileClicks: StatTrend;
  contactRequests: StatTrend;
  savedCount: StatTrend;
  viewsSeriesByPeriod: Record<ProfileViewsPeriod, DailyMetric[]>;
  topKeywords: string[];
  recentActivity: DashboardActivity[];
}

export interface ProfileCompleteness {
  score: number;
  missing: string[];
}
