import { existsSync, readFileSync, writeFileSync } from 'node:fs';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';

const root = join(dirname(fileURLToPath(import.meta.url)), '..');
const target = join(root, 'env', 'environment.ts');
const defaultsPath = join(root, 'env', 'environment.ci.json');

if (existsSync(target) && !process.env.NETLIFY) {
  console.log('env/environment.ts already exists, leaving it unchanged.');
  process.exit(0);
}

const defaults = existsSync(defaultsPath)
  ? JSON.parse(readFileSync(defaultsPath, 'utf8'))
  : {};

const appUrl =
  process.env.APP_URL ||
  process.env.DEPLOY_PRIME_URL ||
  process.env.URL ||
  defaults.appUrl;

const environment = {
  production: process.env.CONTEXT === 'production' || defaults.production === true,
  appUrl,
  appPreviewUrl:
    process.env.APP_PREVIEW_URL || process.env.DEPLOY_PRIME_URL || appUrl,
  dashboardUrl: process.env.DASHBOARD_URL || defaults.dashboardUrl,
  landingUrl: process.env.LANDING_URL || appUrl,
  supabase_url: process.env.SUPABASE_URL || defaults.supabase_url,
  supabase_key: process.env.SUPABASE_KEY || defaults.supabase_key,
  googleMapsApiKey: process.env.GOOGLE_MAPS_API_KEY || defaults.googleMapsApiKey,
};

const missing = Object.entries({
  appUrl: environment.appUrl,
  supabase_url: environment.supabase_url,
  supabase_key: environment.supabase_key,
  googleMapsApiKey: environment.googleMapsApiKey,
})
  .filter(([, value]) => !value)
  .map(([key]) => key);

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
