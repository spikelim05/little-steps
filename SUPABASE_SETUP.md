# Connect student accounts

The website still runs on Render as a Static Site. Supabase supplies password authentication and one small, private content record per student. There are no uploads or file-storage buckets. Student notes and progress remain on their device, separately keyed to their account.

The login page intentionally stays locked until these steps are complete. No default or pretend passwords are included.

## 1. Create a project

Create a Supabase project at https://supabase.com/dashboard. The free plan can be used within its limits; free projects may pause after low activity. The project database password is not a student password and must not be put in the website.

In the project's Connect dialog, copy:

- Project URL, such as `https://YOUR-PROJECT.supabase.co`
- Publishable key, starting with `sb_publishable_`

Enter them in `public/config.js`:

```js
export const authConfig = {
  supabaseUrl: 'https://YOUR-PROJECT.supabase.co',
  publishableKey: 'sb_publishable_YOUR_PUBLIC_KEY'
};
```

These two values are safe to use in the browser. Never use a secret key (`sb_secret_`), legacy service-role key, database password, or student password in that file. The app also supports a legacy `anon` key but new projects should use a publishable key.

## 2. Create the private table

Open Supabase **SQL Editor**. Paste and run all of `supabase/schema.sql`.

This creates `student_spaces`, enables Row Level Security, grants authenticated users read access only, and filters every read to the signed-in user's ID. Students cannot create profiles, edit assignments, or read another student's record. Do not disable RLS or add broad read policies.

## 3. Create the two accounts

Students sign in with a **username and password**. Supabase uses an internal email-shaped identifier behind the scenes; the student does not need an email account.

In **Authentication > Users**, use **Add user / Create new user** with these exact internal identifiers:

| Student | Website username | Supabase email field | Content assignment |
| --- | --- | --- | --- |
| Student 1 | `laurenp4` | `laurenp4@students.little-steps.invalid` | `supabase/student-1.sql` |
| Student 2 | `calebp4` | `calebp4@students.little-steps.invalid` | `supabase/student-2.sql` |

Enter the tutor-selected password directly in Supabase, and enable **Auto Confirm User**. These identifiers cannot receive emails, so do not use invitations or email reset links. Passwords are intentionally absent from this repository. Set the project's minimum password length to 8 characters to support the chosen passwords; additional provider password rules must also allow them. The app accepts usernames without regard to case and trims surrounding spaces; passwords are unchanged.

If accounts already exist under other email addresses, update their email identifiers using Supabase's administrative tools while retaining their User UIDs and confirming the new identifiers. This preserves their content assignments and device progress. Do not create duplicate replacement accounts.

In Authentication settings, disable public sign-ups. Keep email/password sign-in enabled. Creating an authentication user alone does not grant content access; the assignment in the next step is required.

Copy each user's **User UID** from their user details. This is an ID, not a password.

## 4. Assign the correct content

- Open `supabase/student-1.sql`. Replace `STUDENT_USER_UUID` with Student 1's UID. Run the entire file in SQL Editor.
- Open `supabase/student-2.sql`. Replace `STUDENT_USER_UUID` with Student 2's UID. Run the entire file in SQL Editor.

Student 1's record contains the supplied Maths and Science scope, revision links, flashcards and exam information. Student 2's record contains their St. Stephen's School Primary 4 plans for 2026, separate flashcards, selected revision resources and assessment schedule. Their P3 revision groups follow the MOE syllabus, with source limitations noted; Student 1's materials are never used as a fallback.

Run `supabase/verify-access.sql` to check that both student identities see only their own record, anonymous users cannot read the table, and students cannot write assignments. The check rolls back its transaction and does not change their data.

Do not put any SQL or `private-content/` files in the published static website. They are database setup sources, not browser assets.

## 5. Publish the updated website

Update the connected GitHub repository with the **current** files inside `public/`. Delete obsolete public files from the earlier version: `curriculum.js`, `revision.js`, `study-data.js`, `app.js` and `style.css` if they remain in that repository. The old curriculum and question data are now loaded from the private table instead of public files.

Render settings when the contents of `public/` are at the repository root:

| Setting | Value |
| --- | --- |
| Service | Static Site |
| Root directory | Blank |
| Build command | `echo "Static site ready"` |
| Publish directory | `.` |

If your repository instead contains the complete project and its `public` subdirectory, publish directory is `public`. Never publish `data`, `private-content`, or `supabase` as static assets.

The browser loads a pinned Supabase client from esm.sh only after configuration is supplied. Internet access is required to sign in. The Node preview server does not need to be hosted.

## 6. Check before sharing

Sign in to the deployed URL as Student 1, sign out, then sign in as Student 2. Confirm the displayed name and content differ, including the school assessment plan for Student 2. Test different notes and themes to see that the browser keeps them separate. Reload each account and confirm its assigned space still loads. Use an incognito window to confirm the public site shows a login page instead of learning content.

Send the Render link and each student's own login details privately. Your computer does not need to remain on.

## Account maintenance

Students can change their password under the palette/settings button using their current password. A forgotten password needs tutor help through Supabase's administrative account tools. Email recovery is not wired into this website; a production email recovery flow would need email delivery configuration and an allowed redirect URL. Do not place administrative keys in the browser to implement a reset.

The sign-in session is held in sessionStorage for the current browser tab; closing the tab ends its saved browser session. Explicit sign-out clears the local session. Provider-issued access tokens follow Supabase's configured expiry, so revoking a session is not a promise of instantaneous invalidation of every previously issued access token.

Progress and scratchpad notes are not cloud-synced. They are separated by account in localStorage, which is a convenience on a device, not encrypted storage against someone inspecting that browser's developer tools. Do not put sensitive personal information in the scratchpad. Old unassigned static-site progress is left untouched but not imported into either student account.

## Updating content later

Student 1's source materials are in `private-content/`. `node scripts/generate-student-content.mjs` regenerates the two assignment SQL templates. This does not change Supabase until the SQL is explicitly run. Student 2's source is in `private-content/student-2.mjs`; P3 source details are recorded in `student-2-syllabus.md`. The table's `content` JSON supports per-student subjects, topics, resources, cards, exam formats and focus guidance.

## Verification status

Local tests cover the sign-in adapter with mocked provider responses, rejection of mismatched assignments, private asset serving, account-specific local storage, SQL policy declarations and personalised UI templates. They do not prove a particular Supabase project has been configured correctly. Run the supplied SQL access check and the real sign-in checks after setup. No hosted project or accounts have been created by the code changes alone.

Official references: https://supabase.com/docs/guides/auth/passwords and https://supabase.com/docs/guides/database/postgres/row-level-security
