export const environment = {
  production: false,
  appPreviewUrl: 'http://localhost:4200',
  /**
   * Supabase project URL and anon key.
   * Configure in Supabase Dashboard → Authentication → URL Configuration:
   * - Site URL: http://localhost:4400
   * - Redirect URLs: http://localhost:4400/auth/callback, http://localhost:4400/auth/nouveau-mot-de-passe
   * Enable Google provider under Authentication → Providers.
   */
  supabaseUrl: 'https://YOUR_PROJECT.supabase.co',
  supabaseAnonKey: 'YOUR_SUPABASE_ANON_KEY',
};
