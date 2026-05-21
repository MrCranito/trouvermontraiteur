import { Component, inject } from '@angular/core';
import { RouterLink } from '@angular/router';
import { ConsumerFavoritesService } from '@trouvermontraiteur/app-consumer-data';
import { SearchListing } from '@trouvermontraiteur/search';
import { Button } from 'primeng/button';

@Component({
  selector: 'tmt-consumer-favorites',
  imports: [RouterLink, Button, SearchListing],
  templateUrl: './consumer-favorites.html',
  styleUrl: './consumer-favorites.scss',
})
export class ConsumerFavorites {
  protected readonly favorites = inject(ConsumerFavoritesService);

  protected readonly caterers = this.favorites.favoriteCaterers;
}
