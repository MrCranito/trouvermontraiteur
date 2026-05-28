import { Component } from '@angular/core';
import { RouterLink } from '@angular/router';
import { Button } from 'primeng/button';

@Component({
  selector: 'tmt-pro-signup',
  imports: [Button, RouterLink],
  template: `
    <div class="pro-signup-page">
      <a routerLink="/" class="pro-signup-page__back">
        <i class="pi pi-arrow-left"></i> Retour à l'accueil
      </a>
      <h1>Inscription professionnelle</h1>
      <p>
        L'espace artisan arrive très bientôt. En attendant, contactez-nous pour
        rejoindre la plateforme en avant-première.
      </p>
      <p-button label="Retour à l'accueil" icon="pi pi-home" routerLink="/" />
    </div>
  `,
  styles: `
    .pro-signup-page {
      max-width: 32rem;
      margin: 0 auto;
      padding: 4rem 1.5rem;
      text-align: center;
    }
    .pro-signup-page__back {
      display: inline-flex;
      align-items: center;
      gap: 0.35rem;
      margin-bottom: 2rem;
      color: var(--p-primary-color);
      text-decoration: none;
      font-weight: 500;
    }
    h1 {
      margin: 0 0 1rem;
      font-size: 1.75rem;
    }
    p {
      margin: 0 0 1.5rem;
      line-height: 1.6;
      color: var(--p-text-muted-color);
    }
  `,
})
export class ProSignup {}
