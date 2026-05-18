import { Injectable } from '@angular/core';
import { CatererDashboardStats } from './caterer-dashboard-stats';
import { MOCK_DASHBOARD_STATS } from './mock-dashboard-stats';

@Injectable({ providedIn: 'root' })
export class CatererStatsService {
  getStats(): CatererDashboardStats {
    return MOCK_DASHBOARD_STATS;
  }
}
