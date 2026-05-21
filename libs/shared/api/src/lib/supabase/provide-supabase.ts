import { EnvironmentProviders, makeEnvironmentProviders } from '@angular/core';
import { createClient, SupabaseClientOptions } from '@supabase/supabase-js';
import { SUPABASE_CLIENT } from './supabase.token';

export function provideSupabase(
  supabase_url: string,
  supabase_key: string,
  options?: SupabaseClientOptions<'public'>,
): EnvironmentProviders {
  return makeEnvironmentProviders([
    {
      provide: SUPABASE_CLIENT,
      useValue: createClient(supabase_url, supabase_key, options),
    },
  ]);
}
