import { UserProContractStatus } from '@trouvermontraiteur/models';

export interface UsersProContractRow {
  id: string;
  owner_user_id: string;
  title: string | null;
  client_name: string;
  client_email: string | null;
  client_phone: string | null;
  event_type: string | null;
  event_date: string | null;
  guest_count: number | null;
  amount_cents: number | null;
  currency: string;
  status: UserProContractStatus;
  notes: string | null;
  signed_at: string | null;
  created_at: string;
  updated_at: string;
}
