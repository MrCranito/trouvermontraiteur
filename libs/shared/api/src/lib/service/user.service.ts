import { inject, Injectable } from '@angular/core';
import { User } from '@trouvermontraiteur/models';
import { SUPABASE_CLIENT } from '../supabase/supabase.token';
import { UserRow } from './user-row';

@Injectable({ providedIn: 'root' })
export class UserService {
  private readonly supabase = inject(SUPABASE_CLIENT);

  async getUser(id: string): Promise<User | null> {
    const { data, error } = await this.supabase
      .from('users')
      .select(
        'id, email, password, first_name, last_name, created_at, updated_at',
      )
      .eq('id', id)
      .maybeSingle();

    if (error) {
      throw error;
    }

    return data ? this.mapRowToUser(data as UserRow) : null;
  }

  private mapRowToUser(row: UserRow): User {
    return {
      id: row.id,
      email: row.email,
      password: row.password,
      firstName: row.first_name,
      lastName: row.last_name,
      createdAt: new Date(row.created_at),
      updatedAt: new Date(row.updated_at),
    };
  }
}
