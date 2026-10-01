import { Component, computed, input } from '@angular/core';

type CertifiedBadgeVariant = 'icon' | 'overlay';

@Component({
  selector: 'tmt-certified-badge',
  template: `
    <svg
      [attr.width]="iconSize()"
      [attr.height]="iconSize()"
      viewBox="0 0 24 24"
      [attr.aria-hidden]="label() ? true : null"
      [attr.role]="label() ? null : 'img'"
      [attr.aria-label]="label() ? null : 'Artisan certifié'"
    >
      <polygon
        points="12.00,1.00 14.41,3.02 17.50,2.47 18.58,5.42 21.53,6.50 20.98,9.59 23.00,12.00 20.98,14.41 21.53,17.50 18.58,18.58 17.50,21.53 14.41,20.98 12.00,23.00 9.59,20.98 6.50,21.53 5.42,18.58 2.47,17.50 3.02,14.41 1.00,12.00 3.02,9.59 2.47,6.50 5.42,5.42 6.50,2.47 9.59,3.02"
        fill="#B04A17"
        stroke="#B04A17"
        stroke-width="1.4"
        stroke-linejoin="round"
      />
      <circle
        cx="12"
        cy="12"
        r="6.6"
        fill="none"
        stroke="#FBF8F3"
        stroke-opacity="0.35"
        stroke-width="0.6"
      />
      <path
        d="M8.4 12.3l2.4 2.4 4.8-5"
        fill="none"
        stroke="#FFFFFF"
        [attr.stroke-width]="checkStroke()"
        stroke-linecap="round"
        stroke-linejoin="round"
      />
    </svg>
    @if (label()) {
      <span>{{ label() }}</span>
    }
  `,
  styles: `
    :host {
      display: inline-flex;
      flex: none;
      align-items: center;
      line-height: 0;
      vertical-align: middle;
    }

    svg {
      display: block;
      flex-shrink: 0;
    }

    :host(.certified-badge--overlay) {
      gap: 5px;
      height: 28px;
      padding: 0 10px 0 5px;
      border-radius: 14px;
      background: #ffffff;
      color: #2a2420;
      font-family: 'Poppins', 'Segoe UI', system-ui, sans-serif;
      font-size: 12px;
      font-weight: 600;
      line-height: 1;
      box-shadow: 0 2px 8px rgba(42, 36, 32, 0.15);
    }
  `,
  host: {
    '[class.certified-badge--overlay]': 'variant() === "overlay"',
  },
})
export class CertifiedBadge {
  readonly size = input(20);
  readonly label = input('');
  readonly variant = input<CertifiedBadgeVariant>('icon');

  protected readonly iconSize = computed(() =>
    this.variant() === 'overlay' ? 18 : this.size(),
  );

  protected readonly checkStroke = computed(() => {
    const size = this.iconSize();
    if (size >= 32) {
      return 2;
    }
    if (size >= 24) {
      return 2.2;
    }
    if (size >= 20) {
      return 2.3;
    }
    if (size >= 18) {
      return 2.4;
    }
    return 2.5;
  });
}
