import { EnvironmentProviders, makeEnvironmentProviders } from '@angular/core';
import { createClient, SupabaseClientOptions } from '@supabase/supabase-js';
import { SUPABASE_CLIENT } from './supabase.token';

export function provideSupabase(
  url: string,
  key: string,
  options?: SupabaseClientOptions<'public'>,
): EnvironmentProviders {
  return makeEnvironmentProviders([
    {
      provide: SUPABASE_CLIENT,
      useValue: createClient(url, key, options),
    },
  ]);
}
