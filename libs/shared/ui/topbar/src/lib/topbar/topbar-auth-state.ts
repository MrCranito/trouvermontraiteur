export interface TopbarAuthState {
  authenticated: boolean;
  email: string;
  /** Profile picture URL (e.g. Google OAuth). */
  avatarUrl?: string | null;
}
