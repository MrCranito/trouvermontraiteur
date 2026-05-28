import { inject, Injectable } from '@angular/core';
import { User, UserRecord } from '@trouvermontraiteur/models';
import { SUPABASE_CLIENT } from '../../supabase/supabase.token';
import { UserRow } from '../user-row';

@Injectable({ providedIn: 'root' })
export class UserService {
  private readonly supabase = inject(SUPABASE_CLIENT);

  async getAll(): Promise<UserRecord[]> {
    const { data, error } = await this.supabase
      .from('users')
      .select(
        'id, email, phone, first_name, last_name, full_name, avatar_url, created_at, updated_at',
      );

    if (error) {
      throw error;
    }

    return (data as UserRow[] | null)?.map((row) => this.mapRowToRecord(row)) ?? [];
  }

  async getUser(id: string): Promise<User | null> {
    const { data, error } = await this.supabase
      .from('users')
      .select(
        'id, email, phone, first_name, last_name, full_name, avatar_url, created_at, updated_at',
      )
      .eq('id', id)
      .maybeSingle();

    if (error) {
      throw error;
    }

    return data ? this.mapRowToUser(data as UserRow) : null;
  }

  private mapRowToRecord(row: UserRow): UserRecord {
    return {
      id: row.id,
      email: row.email,
      phone: row.phone,
      firstName: row.first_name,
      lastName: row.last_name,
      fullName: row.full_name,
      avatarUrl: row.avatar_url,
      createdAt: new Date(row.created_at),
      updatedAt: new Date(row.updated_at),
    };
  }

  private mapRowToUser(row: UserRow): User {
    return {
      id: row.id,
      email: row.email,
      firstName: row.first_name ?? '',
      lastName: row.last_name ?? '',
      favorites: [],
      createdAt: new Date(row.created_at),
      updatedAt: new Date(row.updated_at),
    };
  }
}
