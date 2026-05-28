import { Component, computed, inject } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { ConsumerAuthService } from '@trouvermontraiteur/app-auth';
import { TmtLanguageSwitcher } from '@trouvermontraiteur/app-i18n';
import { TmtFooter } from '@trouvermontraiteur/footer';
import { TmtTopbar } from '@trouvermontraiteur/topbar';
import { environment } from '@env';

@Component({
  selector: 'tmt-app-shell',
  imports: [RouterOutlet, TmtTopbar, TmtFooter, TmtLanguageSwitcher],
  templateUrl: './app-shell.html',
  styleUrl: './app-shell.scss',
})
export class AppShell {
  private readonly auth = inject(ConsumerAuthService);

  protected readonly authState = computed(() => {
    const user = this.auth.user();
    const meta = user?.user_metadata as Record<string, unknown> | undefined;
    const avatar =
      (typeof meta?.['avatar_url'] === 'string' && meta['avatar_url']) ||
      (typeof meta?.['picture'] === 'string' && meta['picture']) ||
      null;

    return {
      authenticated: this.auth.isAuthenticated(),
      email: user?.email ?? '',
      avatarUrl: avatar,
    };
  });
  protected readonly dashboardUrl = environment.dashboardUrl.replace(
    /\/$/,
    '',
  );

  protected signOut(): void {
    void this.auth.signOut();
  }
}
