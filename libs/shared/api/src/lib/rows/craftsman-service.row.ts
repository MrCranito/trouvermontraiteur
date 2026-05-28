export interface CraftsmanServiceRow {
  id: number;
  name: string;
  description: string | null;
  price: number;
  created_at: string;
  owner_craftsman_id: string;
}
