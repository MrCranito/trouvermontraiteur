# app-auth

Consumer authentication for the public app (Supabase).

## Routes

| Path | Page |
|------|------|
| `/auth/connexion` | Login |
| `/auth/inscription` | Sign up |
| `/auth/callback` | OAuth / e-mail callback |
| `/auth/mot-de-passe-oublie` | Forgot password |
| `/auth/nouveau-mot-de-passe` | Reset password |

## Metadata

Sign-up and Google OAuth set `user_metadata.user_type` to `consumer`.

## Supabase URL configuration (dev)

Add to **Authentication → URL configuration**:

- `http://localhost:4200/auth/callback`
- `http://localhost:4200/auth/nouveau-mot-de-passe`

Google redirect URI remains `https://<project>.supabase.co/auth/v1/callback`.
