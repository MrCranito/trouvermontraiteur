import { Component } from '@angular/core';
import { RouterLink, RouterLinkActive } from '@angular/router';

@Component({
  selector: 'tmt-profile-nav',
  imports: [RouterLink, RouterLinkActive],
  templateUrl: './profile-nav.html',
  styleUrl: './profile-nav.scss',
})
export class ProfileNav {}
