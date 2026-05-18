import { CatererDashboardStats } from './caterer-dashboard-stats';

export const MOCK_DASHBOARD_STATS: CatererDashboardStats = {
  periodLabel: '30 derniers jours',
  profileViews: { value: 1247, delta: 12.4 },
  searchImpressions: { value: 3892, delta: 8.1 },
  profileClicks: { value: 456, delta: -2.3 },
  contactRequests: { value: 23, delta: 15.0 },
  savedCount: { value: 89, delta: 6.7 },
  viewsSeries: [
    { date: '2026-05-11', label: 'Lun', views: 142 },
    { date: '2026-05-12', label: 'Mar', views: 168 },
    { date: '2026-05-13', label: 'Mer', views: 155 },
    { date: '2026-05-14', label: 'Jeu', views: 201 },
    { date: '2026-05-15', label: 'Ven', views: 189 },
    { date: '2026-05-16', label: 'Sam', views: 224 },
    { date: '2026-05-17', label: 'Dim', views: 168 },
  ],
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
