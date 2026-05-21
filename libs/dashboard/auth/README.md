# dashboard-auth

Auth flows for the pro dashboard (Supabase + Google OAuth).

## Pro vs particulier (`user_metadata`)

Both apps share the same Supabase project. Account type is stored in auth metadata:

| App | `user_type` value |
| --- | --- |
| Dashboard (pro) | `pro` |
| App publique (particulier) | `consumer` |

Helpers live in `@trouvermontraiteur/models` (`proUserMetadata()`, `consumerUserMetadata()`, `getUserType()`, …).

**Dashboard** sets `user_type: pro` on e-mail signup, Google OAuth (via callback), and upgrades legacy accounts without metadata on first pro login.

**App** (when you add auth) should call `signUp` / OAuth with `data: consumerUserMetadata()` and block `pro` users from the public app the same way the dashboard blocks `consumer` users.

In Supabase you can later enforce this with a trigger on `auth.users` if needed.

## Google OAuth setup (fix `redirect_uri_mismatch`)

Supabase talks to Google using **Supabase’s** callback URL, not your app URL directly.

### 1. Google Cloud Console

[APIs & Services → Credentials](https://console.cloud.google.com/apis/credentials) → your OAuth 2.0 client:

**Authorized redirect URIs** — add exactly:

```text
https://<YOUR_PROJECT_REF>.supabase.co/auth/v1/callback
```

(`<YOUR_PROJECT_REF>` is the subdomain from `supabase_url` in `.env/environment.ts`.)

Optional for local dev:

```text
http://localhost:4300
```

(in **Authorized JavaScript origins**, not redirect URIs.)

Do **not** put `http://localhost:4300/auth/callback` in Google’s redirect URIs unless you use a custom OAuth flow without Supabase.

### 2. Supabase Dashboard

**Authentication → URL configuration**

| Field | Dev value |
| --- | --- |
| Site URL | `http://localhost:4300` |
| Redirect URLs | `http://localhost:4300/auth/callback` |
| | `http://localhost:4300/auth/nouveau-mot-de-passe` |

**Authentication → Providers → Google** — enabled, with the same Client ID and Client secret as in Google Cloud.

### 3. This app

`dashboardUrl` in `.env/environment.ts` must match how you open the app (`http://localhost:4300`). OAuth returns to:

```text
http://localhost:4300/auth/callback
```

After changing Supabase or Google settings, wait a minute and try again in a private window.
