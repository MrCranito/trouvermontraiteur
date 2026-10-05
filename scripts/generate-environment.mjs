import { existsSync, writeFileSync } from 'node:fs';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';

const root = join(dirname(fileURLToPath(import.meta.url)), '..');
const target = join(root, 'env', 'environment.ts');

if (existsSync(target)) {
  console.log('env/environment.ts already exists, leaving it unchanged.');
  process.exit(0);
}

const required = ['SUPABASE_URL', 'SUPABASE_KEY', 'GOOGLE_MAPS_API_KEY'];
const missing = required.filter((name) => !process.env[name]);

if (missing.length > 0) {
  console.error(
    `Cannot create env/environment.ts. Missing: ${missing.join(', ')}.`,
  );
  console.error(
    'Set those variables in Netlify (Site configuration → Environment variables), using the values from your local .env/environment.ts.',
  );
  process.exit(1);
}

const appUrl = process.env.APP_URL || process.env.URL || 'http://localhost:4200';
const environment = {
  production: process.env.CONTEXT === 'production',
  appUrl,
  appPreviewUrl: process.env.APP_PREVIEW_URL || process.env.DEPLOY_PRIME_URL || appUrl,
  dashboardUrl: process.env.DASHBOARD_URL || 'http://localhost:4300',
  landingUrl: process.env.LANDING_URL || appUrl,
  supabase_url: process.env.SUPABASE_URL,
  supabase_key: process.env.SUPABASE_KEY,
  googleMapsApiKey: process.env.GOOGLE_MAPS_API_KEY,
};

const source = `import type { Environment } from './environment.types';

export const environment: Environment = ${JSON.stringify(environment, null, 2)};
`;

writeFileSync(target, source);
console.log(`Wrote ${target}`);
