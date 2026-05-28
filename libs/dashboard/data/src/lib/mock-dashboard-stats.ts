import {
  CatererDashboardStats,
  DailyMetric,
  ProfileViewsPeriod,
} from './caterer-dashboard-stats';

const viewsDay: DailyMetric[] = [
  { date: '2026-05-20', label: 'Lun', views: 142 },
  { date: '2026-05-21', label: 'Mar', views: 168 },
  { date: '2026-05-22', label: 'Mer', views: 155 },
  { date: '2026-05-23', label: 'Jeu', views: 201 },
  { date: '2026-05-24', label: 'Ven', views: 189 },
  { date: '2026-05-25', label: 'Sam', views: 224 },
  { date: '2026-05-26', label: 'Dim', views: 168 },
];

const viewsWeek: DailyMetric[] = [
  { date: '2026-03-10', label: 'S1', views: 892 },
  { date: '2026-03-17', label: 'S2', views: 945 },
  { date: '2026-03-24', label: 'S3', views: 1012 },
  { date: '2026-03-31', label: 'S4', views: 978 },
  { date: '2026-04-07', label: 'S5', views: 1104 },
  { date: '2026-04-14', label: 'S6', views: 1056 },
  { date: '2026-04-21', label: 'S7', views: 1189 },
  { date: '2026-04-28', label: 'S8', views: 1123 },
  { date: '2026-05-05', label: 'S9', views: 1247 },
  { date: '2026-05-12', label: 'S10', views: 1198 },
  { date: '2026-05-19', label: 'S11', views: 1312 },
  { date: '2026-05-26', label: 'S12', views: 1284 },
];

const viewsMonth: DailyMetric[] = [
  { date: '2025-06-01', label: 'Juin', views: 3420 },
  { date: '2025-07-01', label: 'Juil.', views: 3890 },
  { date: '2025-08-01', label: 'Août', views: 2950 },
  { date: '2025-09-01', label: 'Sept.', views: 4120 },
  { date: '2025-10-01', label: 'Oct.', views: 4380 },
  { date: '2025-11-01', label: 'Nov.', views: 4010 },
  { date: '2025-12-01', label: 'Déc.', views: 5240 },
  { date: '2026-01-01', label: 'Janv.', views: 3680 },
  { date: '2026-02-01', label: 'Févr.', views: 3920 },
  { date: '2026-03-01', label: 'Mars', views: 4450 },
  { date: '2026-04-01', label: 'Avr.', views: 4680 },
  { date: '2026-05-01', label: 'Mai', views: 4890 },
];

const viewsYear: DailyMetric[] = [
  { date: '2022-01-01', label: '2022', views: 28400 },
  { date: '2023-01-01', label: '2023', views: 35600 },
  { date: '2024-01-01', label: '2024', views: 42100 },
  { date: '2025-01-01', label: '2025', views: 47800 },
  { date: '2026-01-01', label: '2026', views: 19200 },
];

const viewsSeriesByPeriod: Record<ProfileViewsPeriod, DailyMetric[]> = {
  day: viewsDay,
  week: viewsWeek,
  month: viewsMonth,
  year: viewsYear,
};

export const MOCK_DASHBOARD_STATS: CatererDashboardStats = {
  periodLabel: '30 derniers jours',
  profileViews: { value: 1247, delta: 12.4 },
  searchImpressions: { value: 3892, delta: 8.1 },
  profileClicks: { value: 456, delta: -2.3 },
  contactRequests: { value: 23, delta: 15.0 },
  savedCount: { value: 89, delta: 6.7 },
  viewsSeriesByPeriod,
  topKeywords: ['mariage paris', 'cocktail traiteur', 'buffet campagnard', '4e arrondissement'],
  recentActivity: [
    {
      id: 'a1',
      icon: 'pi pi-eye',
      title: 'Vue de profil',
      description: 'Un organisateur a consulté votre fiche depuis la recherche « mariage ».',
      timeAgo: 'Il y a 2 h',
    },
    {
      id: 'a2',
      icon: 'pi pi-envelope',
      title: 'Demande de contact',
      description: 'Nouvelle demande pour un cocktail — 80 personnes, juin 2026.',
      timeAgo: 'Il y a 5 h',
    },
    {
      id: 'a3',
      icon: 'pi pi-heart',
      title: 'Ajout aux favoris',
      description: 'Votre profil a été enregistré par un utilisateur.',
      timeAgo: 'Hier',
    },
    {
      id: 'a4',
      icon: 'pi pi-star',
      title: 'Nouvel avis',
      description: 'Note 5/5 — « Service impeccable et plateau fromages exceptionnel ».',
      timeAgo: 'Il y a 2 jours',
    },
  ],
};
