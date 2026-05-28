import { inject, Injectable } from '@angular/core';
import { UserFavorite } from '@trouvermontraiteur/models';
import { SUPABASE_CLIENT } from '../../supabase/supabase.token';
import { UserFavoriteRow } from '../../rows/user-favorite.row';

@Injectable({ providedIn: 'root' })
export class FavoriteService {
  private readonly supabase = inject(SUPABASE_CLIENT);

  async getAll(): Promise<UserFavorite[]> {
    const { data, error } = await this.supabase
      .from('users_favorites')
      .select('id, created_at, owner_user_id, craftsman_id');

    if (error) {
      throw error;
    }

    return (data as UserFavoriteRow[] | null)?.map((row) => this.mapRow(row)) ?? [];
  }

  async add(craftsmanId: string): Promise<void> {
    // owner_user_id is set by Postgres (default auth.uid()) — do not send from the client.
    const { error } = await this.supabase.from('users_favorites').insert({
      craftsman_id: craftsmanId,
    });

    if (error) {
      throw error;
    }
  }

  async remove(craftsmanId: string): Promise<void> {
    const { error } = await this.supabase
      .from('users_favorites')
      .delete()
      .eq('craftsman_id', craftsmanId);

    if (error) {
      throw error;
    }
  }

  private mapRow(row: UserFavoriteRow): UserFavorite {
    return {
      id: row.id,
      ownerUserId: row.owner_user_id,
      craftsmanId: row.craftsman_id,
      createdAt: new Date(row.created_at),
    };
  }
}
