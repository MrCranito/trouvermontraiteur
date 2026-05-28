import { inject, Provider } from '@angular/core';
import { CatererProfileService } from '@trouvermontraiteur/dashboard-data';
import {
  CRAFTSMAN_DETAILS_EDIT_STORE,
  type CraftsmanDetailsEditStore,
} from '@trouvermontraiteur/craftsman-details';

export function provideDashboardCraftsmanDetailsEdit(): Provider[] {
  return [
    {
      provide: CRAFTSMAN_DETAILS_EDIT_STORE,
      useFactory: (): CraftsmanDetailsEditStore => {
        const profileService = inject(CatererProfileService);
        return {
          getProfile: () => profileService.getProfile(),
          replaceProfile: (craftsman) =>
            profileService.replaceProfile(craftsman),
          getCompleteness: () => profileService.getCompleteness(),
          getPublishReadiness: (craftsman) =>
            profileService.getPublishReadiness(craftsman),
          saveDraft: (craftsman) => profileService.saveDraft(craftsman),
          publishProfile: (craftsman) =>
            profileService.publishProfile(craftsman),
        };
      },
    },
  ];
}
