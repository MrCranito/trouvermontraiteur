import { inject, Injectable } from '@angular/core';
import { importLibrary, setOptions } from '@googlemaps/js-api-loader';
import { GOOGLE_MAPS_API_KEY } from './google-maps-api-key.token';

@Injectable({ providedIn: 'root' })
export class GoogleMapsLoaderService {
  private readonly apiKey = inject(GOOGLE_MAPS_API_KEY);
  private loadPromise: Promise<typeof google.maps> | null = null;
  private optionsSet = false;

  isConfigured(): boolean {
    return this.apiKey.trim().length > 0;
  }

  load(): Promise<typeof google.maps> {
    if (typeof google !== 'undefined' && google.maps) {
      return Promise.resolve(google.maps);
    }

    if (!this.isConfigured()) {
      return Promise.reject(
        new Error('Google Maps API key is not configured'),
      );
    }

    if (!this.optionsSet) {
      setOptions({
        key: this.apiKey,
        v: 'weekly',
        language: 'fr',
        region: 'FR',
      });
      this.optionsSet = true;
    }

    this.loadPromise ??= importLibrary('maps').then(() => google.maps);

    return this.loadPromise;
  }
}
