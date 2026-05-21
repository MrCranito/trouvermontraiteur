import { EnvironmentProviders } from '@angular/core';
import { SupabaseClientOptions } from '@supabase/supabase-js';
import { provideSupabase } from './provide-supabase';

export type SupabaseEnvironmentConfig = Pick<
  { supabase_url: string; supabase_key: string },
  'supabase_url' | 'supabase_key'
>;

export function provideSupabaseFromEnvironment(
  env: SupabaseEnvironmentConfig,
  options?: SupabaseClientOptions<'public'>,
): EnvironmentProviders {
  return provideSupabase(env.supabase_url, env.supabase_key, options);
}
