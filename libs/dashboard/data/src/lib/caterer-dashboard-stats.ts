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
  viewsSeries: DailyMetric[];
  topKeywords: string[];
  recentActivity: DashboardActivity[];
}

export interface ProfileCompleteness {
  score: number;
  missing: string[];
}
