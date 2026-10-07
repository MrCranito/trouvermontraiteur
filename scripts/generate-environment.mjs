import { existsSync, mkdirSync, writeFileSync } from 'node:fs';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';

// Netlify site variables: SUPABASE_URL, SUPABASE_KEY, GOOGLE_MAPS_API_KEY.
// Optional: APP_URL, DASHBOARD_URL, LANDING_URL, APP_PREVIEW_URL.
// Netlify also sets URL, DEPLOY_PRIME_URL, and CONTEXT.

const root = join(dirname(fileURLToPath(import.meta.url)), '..');
const envDir = join(root, 'env');
const target = join(envDir, 'environment.ts');
const typesTarget = join(envDir, 'environment.types.ts');

const typesSource = `export interface Environment {
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
`;

mkdirSync(envDir, { recursive: true });
writeFileSync(typesTarget, typesSource);

if (existsSync(target) && !process.env.NETLIFY) {
  console.log('env/environment.ts already exists, leaving it unchanged.');
  process.exit(0);
}

const appUrl =
  process.env.APP_URL ||
  process.env.DEPLOY_PRIME_URL ||
  process.env.URL ||
  '';

const environment = {
  production: process.env.CONTEXT === 'production',
  appUrl,
  appPreviewUrl:
    process.env.APP_PREVIEW_URL || process.env.DEPLOY_PRIME_URL || appUrl,
  dashboardUrl:
    process.env.DASHBOARD_URL ||
    (appUrl ? `${appUrl.replace(/\/$/, '')}/dashboard` : ''),
  landingUrl: process.env.LANDING_URL || appUrl,
  supabase_url: process.env.SUPABASE_URL || '',
  supabase_key: process.env.SUPABASE_KEY || '',
  googleMapsApiKey: process.env.GOOGLE_MAPS_API_KEY || '',
};

const missing = [
  ['APP_URL (or Netlify URL)', environment.appUrl],
  ['SUPABASE_URL', environment.supabase_url],
  ['SUPABASE_KEY', environment.supabase_key],
  ['GOOGLE_MAPS_API_KEY', environment.googleMapsApiKey],
]
  .filter(([, value]) => !value)
  .map(([name]) => name);

if (missing.length > 0) {
  console.error(
    `Cannot create env/environment.ts. Missing: ${missing.join(', ')}.`,
  );
  process.exit(1);
}

const source = `import type { Environment } from './environment.types';

export const environment: Environment = ${JSON.stringify(environment, null, 2)};
`;

writeFileSync(target, source);
console.log(`Wrote ${target}`);
