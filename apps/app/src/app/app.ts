import { Component, inject } from '@angular/core';
import { RouterModule } from '@angular/router';
import { ConsumerUserService } from '@trouvermontraiteur/app-consumer-data';

@Component({
  imports: [RouterModule],
  selector: 'app-root',
  templateUrl: './app.html',
  styleUrl: './app.scss',
})
export class App {
  constructor() {
    inject(ConsumerUserService);
  }
}
