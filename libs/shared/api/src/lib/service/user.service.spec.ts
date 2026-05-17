import { Injector, runInInjectionContext } from '@angular/core';
import { describe, expect, it, vi } from 'vitest';
import { SUPABASE_CLIENT } from '../supabase/supabase.token';
import { UserService } from './user.service';

function createUserService(supabase: unknown): UserService {
  const injector = Injector.create({
    providers: [
      UserService,
      { provide: SUPABASE_CLIENT, useValue: supabase },
    ],
  });

  return runInInjectionContext(injector, () => injector.get(UserService));
}

describe('UserService', () => {
  it('maps a Supabase row to a User', async () => {
    const maybeSingle = vi.fn().mockResolvedValue({
      data: {
        id: 'user-1',
        email: 'jane@example.com',
        password: 'secret',
        first_name: 'Jane',
        last_name: 'Doe',
        created_at: '2026-01-01T00:00:00.000Z',
        updated_at: '2026-01-02T00:00:00.000Z',
      },
      error: null,
    });

    const supabase = {
      from: vi.fn().mockReturnValue({
        select: vi.fn().mockReturnValue({
          eq: vi.fn().mockReturnValue({ maybeSingle }),
        }),
      }),
    };

    const service = createUserService(supabase);
    const user = await service.getUser('user-1');

    expect(supabase.from).toHaveBeenCalledWith('users');
    expect(user).toEqual({
      id: 'user-1',
      email: 'jane@example.com',
      password: 'secret',
      firstName: 'Jane',
      lastName: 'Doe',
      createdAt: new Date('2026-01-01T00:00:00.000Z'),
      updatedAt: new Date('2026-01-02T00:00:00.000Z'),
    });
  });

  it('returns null when the user is not found', async () => {
    const maybeSingle = vi.fn().mockResolvedValue({ data: null, error: null });

    const supabase = {
      from: vi.fn().mockReturnValue({
        select: vi.fn().mockReturnValue({
          eq: vi.fn().mockReturnValue({ maybeSingle }),
        }),
      }),
    };

    const service = createUserService(supabase);
    await expect(service.getUser('missing')).resolves.toBeNull();
  });
});
