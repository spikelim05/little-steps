# Enable My files

The website now supports account-private PDFs, JPEG, PNG and WebP photos, up to 5 MiB (5,242,880 bytes) each. The student-facing label uses 5 MB. Files sync through Supabase Storage and can be opened from any device after sign-in. Scratchpad text and revision progress remain device-local.

## One-time setup

1. Open `supabase/storage.sql` and copy the entire file.
2. In the existing Supabase project, open SQL Editor > New query, paste and Run.
3. Expect `Private file storage is ready.` The script may trigger a destructive-operation warning because it replaces named policies. It does not remove uploaded files or student content.
4. In Storage, verify the `student-files` bucket is private, the size limit is 5,242,880 bytes, and its allowed types are PDF, JPEG, PNG and WebP. Keep it private.
5. After Render deploys the latest GitHub commit, refresh the website. Sign in and open **My files**.

No new passwords, secret keys or Render environment variables are needed. This SQL must run in Supabase; deploying the frontend does not apply it.

## Verify before relying on uploads

- Sign in as Lauren, upload a small test PDF, refresh and open it.
- Sign in as Lauren on another device/browser and confirm the same file appears.
- Sign out and sign in as Caleb. Lauren's file must not appear; upload a separate test file for Caleb.
- Attempt to read Lauren's object using Caleb's session through the Storage API; it must fail. The folder rule uses the verified Supabase UID, not a student-controlled label.
- Try a file over 5 MB and an unsupported file type; both should be rejected. Supabase enforces the same size/type limits even if browser checks are bypassed.
- Delete each test file using the website, confirm the deletion prompt, and refresh to check it is gone.

Local automated tests cover the Storage adapter with mocked provider responses, pagination, filename escaping, stale view responses, errors, session changes and SQL policy declarations. They do not prove live Storage policies have been applied. Browser automation was unavailable during implementation; complete the live checks above after setup.

## Storage behaviour

- The bucket uses the verified user ID as the first folder, with a random identifier per file to avoid overwriting equal filenames. Unsupported filename characters are replaced with underscores.
- Only assigned, authenticated student accounts can list, upload, open or delete their own files. Anonymous access is denied. Restrictive policies protect this bucket even if broader permissive policies are added elsewhere.
- Open creates a signed link valid for 60 seconds. Anyone given that link can use it until it expires. Downloaded copies remain on the device. Links are not persisted in local storage.
- Delete removes the object through the Storage API; it is not a reversible trash operation. Students confirm before deletion.
- The tutor can manage files through the Supabase dashboard. Tutor marking, shared feedback and an in-app tutor account are not included in this feature.
- The 5 MB limit is per file, not a total account allowance. Check Supabase's Storage and bandwidth usage, remove unneeded files, and keep original copies of important work. This feature does not automatically upgrade the billing plan.

References: [Storage access control](https://supabase.com/docs/guides/storage/security/access-control), [bucket limits](https://supabase.com/docs/guides/storage/buckets/creating-buckets).
