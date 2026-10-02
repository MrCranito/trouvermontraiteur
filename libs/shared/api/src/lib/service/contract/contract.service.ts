import { inject, Injectable } from '@angular/core';
import { UserProContract } from '@trouvermontraiteur/models';
import { SUPABASE_CLIENT } from '../../supabase/supabase.token';
import { UsersProContractRow } from '../../rows/users-pro-contract.row';

const CONTRACT_SELECT =
  'id, owner_user_id, title, client_name, client_email, client_phone, event_type, event_date, guest_count, amount_cents, currency, status, notes, signed_at, created_at, updated_at';

@Injectable({ providedIn: 'root' })
export class ContractService {
  private readonly supabase = inject(SUPABASE_CLIENT);

  /** Contrats du pro connecté (RLS: owner_user_id = auth.uid()). */
  async getMine(): Promise<UserProContract[]> {
    const { data, error } = await this.supabase
      .from('users_pro_contract')
      .select(CONTRACT_SELECT)
      .order('created_at', { ascending: false });

    if (error) {
      throw error;
    }

    return (data as UsersProContractRow[] | null)?.map((row) => this.mapRow(row)) ?? [];
  }

  private mapRow(row: UsersProContractRow): UserProContract {
    return {
      id: row.id,
      ownerUserId: row.owner_user_id,
      title: row.title,
      clientName: row.client_name,
      clientEmail: row.client_email,
      clientPhone: row.client_phone,
      eventType: row.event_type,
      eventDate: row.event_date,
      guestCount: row.guest_count,
      amountCents: row.amount_cents,
      currency: row.currency,
      status: row.status,
      notes: row.notes,
      signedAt: row.signed_at ? new Date(row.signed_at) : null,
      createdAt: new Date(row.created_at),
      updatedAt: new Date(row.updated_at),
    };
  }
}
