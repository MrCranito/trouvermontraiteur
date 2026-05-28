import { inject, Injectable } from '@angular/core';
import { UserEstimate } from '@trouvermontraiteur/models';
import { SUPABASE_CLIENT } from '../../supabase/supabase.token';
import { UserEstimateRow } from '../../rows/user-estimate.row';

@Injectable({ providedIn: 'root' })
export class EstimateService {
  private readonly supabase = inject(SUPABASE_CLIENT);

  async getAll(): Promise<UserEstimate[]> {
    const { data, error } = await this.supabase
      .from('users_estimates')
      .select('id, created_at, owner_user_id, owner_craftsman_id');

    if (error) {
      throw error;
    }

    return (data as UserEstimateRow[] | null)?.map(this.mapRow) ?? [];
  }

  private mapRow(row: UserEstimateRow): UserEstimate {
    return {
      id: row.id,
      ownerUserId: row.owner_user_id,
      ownerCraftsmanId: row.owner_craftsman_id,
      createdAt: new Date(row.created_at),
    };
  }
}
