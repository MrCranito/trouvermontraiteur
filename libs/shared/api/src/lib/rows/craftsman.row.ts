export interface CraftsmanRow {
  id: string;
  name: string;
  description?: string | null;
  published: boolean;
  created_at: string;
  updated_at: string;
  deleted_at: string | null;
  owner_user_pro_id: string | null;
  latitude: number | null;
  longitude: number | null;
  address: string | null;
  city: string | null;
  postal_code: string | null;
}
