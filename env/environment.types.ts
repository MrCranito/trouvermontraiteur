export interface Environment {
  production: boolean;
  appPreviewUrl: string;
  appUrl: string;
  dashboardUrl: string;
  landingUrl: string;
  supabase_url: string;
  supabase_key: string;
  /** Google Maps JavaScript API key (Google Cloud Console). */
  googleMapsApiKey: string;
}
