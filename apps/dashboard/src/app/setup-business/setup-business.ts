import { Component, inject, OnInit, signal } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { CatererAuthService } from '@trouvermontraiteur/dashboard-auth';
import { Button } from 'primeng/button';
import { InputText } from 'primeng/inputtext';
import { Message } from 'primeng/message';
import {
  BusinessProfileFormValue,
  BusinessProfileService,
} from '../business-profile.service';

@Component({
  selector: 'tmt-setup-business',
  imports: [FormsModule, InputText, Button, Message],
  templateUrl: './setup-business.html',
  styleUrl: './setup-business.scss',
})
export class SetupBusiness implements OnInit {
  private readonly auth = inject(CatererAuthService);
  private readonly service = inject(BusinessProfileService);
  private readonly router = inject(Router);
  private readonly route = inject(ActivatedRoute);

  protected form: BusinessProfileFormValue = {
    businessName: '',
    address: '',
    city: '',
    postalCode: '',
    siret: '',
  };
  protected readonly loading = signal(false);
  protected readonly error = signal('');

  async ngOnInit(): Promise<void> {
    await this.auth.whenReady();
    if (!this.auth.isAuthenticated()) {
      await this.router.navigate(['/auth/connexion'], {
        queryParams: { returnUrl: '/setup-business' },
      });
    }
  }

  protected async submit(event: Event): Promise<void> {
    await this.auth.whenReady();
    if (!this.auth.isAuthenticated()) {
      await this.router.navigate(['/auth/connexion'], {
        queryParams: { returnUrl: '/setup-business' },
      });
      return;
    }

    event.preventDefault();
    this.error.set('');

    if (!this.form.businessName.trim()) {
      this.error.set('Renseignez le nom de votre entreprise.');
      return;
    }
    if (!this.form.address.trim()) {
      this.error.set('Renseignez l’adresse de votre entreprise.');
      return;
    }
    if (!this.form.city.trim()) {
      this.error.set('Renseignez la ville de votre entreprise.');
      return;
    }
    if (!/^\d{14}$/.test(this.form.siret.trim())) {
      this.error.set('Le SIRET doit contenir 14 chiffres.');
      return;
    }

    this.loading.set(true);
    try {
      await this.service.save(this.form);
      const returnUrl = this.route.snapshot.queryParamMap.get('returnUrl');
      if (returnUrl && returnUrl !== '/setup-business') {
        await this.router.navigateByUrl(returnUrl);
      } else {
        await this.router.navigate(['/apercu']);
      }
    } catch {
      this.error.set(
        'Impossible d’enregistrer les informations. Réessayez dans quelques instants.',
      );
    } finally {
      this.loading.set(false);
    }
  }
}
