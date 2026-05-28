import { Component, inject, OnInit } from '@angular/core';
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
export class ConsumerFavorites implements OnInit {
  protected readonly favorites = inject(ConsumerFavoritesService);

  protected readonly craftsmen = this.favorites.favoriteCraftsmen;
  protected readonly loading = this.favorites.isLoading;

  ngOnInit(): void {
    void this.favorites.load();
  }
}
