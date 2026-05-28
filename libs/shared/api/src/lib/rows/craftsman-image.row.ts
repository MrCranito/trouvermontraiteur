export interface CraftsmanImageRow {
  id: string;
  storage_path: string;
  sort_order: number;
  created_at?: string;
  craftsman_id?: string;
  /** Legacy typo in some schemas */
  craftman_id?: string;
}
