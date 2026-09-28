# Little Steps - personal student revision spaces

A static website with username/password sign-in provided by Supabase. Each student receives only the learning content assigned to their verified account. Render can continue to host the frontend as a Static Site; uploaded files are stored in private Supabase Storage, without a permanent Render server disk.

## Required setup

Read [SUPABASE_SETUP.md](SUPABASE_SETUP.md). Connect a Supabase project, run the RLS schema, create the student accounts, and assign their content. `public/config.js` contains the project's public connection settings. Run `supabase/storage.sql` once to enable the My files feature.

## Local preview

```sh
node server.mjs
```

Open http://localhost:3030. Node.js 22+ is required only for this local preview and tests. No package installation is needed. Sign-in requires the configured Supabase project and internet access.

## Learning tools

- Revision room: external online practice selected for the student's syllabus.
- Flip & learn: 10 syllabus-matched cards each Singapore day (5 Maths + 5 Science), plus the full library. Enable the expanded bank with [DAILY_FLASHCARDS_SETUP.md](DAILY_FLASHCARDS_SETUP.md).
- Focus corner: their study guidance, timer and scratchpad.
- Learning path: their topics, exam formats and confidence ratings.
- Weekly challenge: Lauren and Caleb share weekly progress bars for revision and focus sessions; enable with [WEEKLY_CHALLENGE_SETUP.md](WEEKLY_CHALLENGE_SETUP.md).
- My files: account-private PDFs and photos, available across devices, up to 5 MB each.
- 10 themes: Forest, Ocean, Sunset, Space, Candyland, Dino Adventure, Arcade, Cloud Kingdom, Cat Café and Wizard Academy; plus bookmarks and daily goals.

Both students' Maths and Science content is prepared separately. Student 2 follows St. Stephen's School Primary 4 assessment plans for 2026, including 14 Maths chapters, 7 named P4 Science chapters and the term assessment schedule. P3 revision groups follow the MOE 2023 syllabus, with the school’s listed Inspiring Science P3 textbook confirmed; a separate school P3 assessment plan was not found. Account creation and hosted assignment still require the setup steps.

## Data and privacy

Passwords are managed by Supabase Auth, not embedded in JavaScript. Supabase stores a small content record for each account. Row Level Security permits only the matching authenticated UID to read its record; students cannot edit assignments or choose another student's UID to gain access. Public sign-ups should be disabled.

Weekly challenge scores are stored in Supabase and shared only between the two enrolled students. LocalStorage keeps other optional progress, themes, timer state and notes separately by account on the device. These do not sync to the tutor or other devices and are not encrypted against the device owner. The sign-in session uses sessionStorage. Students can change passwords under settings; there is no self-service forgotten-password email flow in this app.

Uploads go directly to Supabase Storage using the signed-in session. Run the storage setup and checks in [FILE_UPLOAD_SETUP.md](FILE_UPLOAD_SETUP.md). The old `data/` directory is preserved locally and is neither read nor served. Only `public/` should be published. Do not publish `private-content/`, `supabase/` or old student data. Remove obsolete curriculum/question files from earlier static deployments; see the setup guide.

## Content editing

`private-content/` contains the original source material. Run `node scripts/generate-student-content.mjs` to generate assignment SQL templates outside the public website. Run the resulting SQL in Supabase with the appropriate user ID. The frontend has no tutor/admin mode; account creation and content assignment are handled in Supabase by the tutor.

## Checks

```sh
node --test
```

Tests cover the mocked authentication adapter, denied mismatched assignments, account-local progress separation, protected content excluded from public serving, SQL policy declarations, both students' UI states, timer behaviour and existing study tools. Live Supabase authentication and database access checks remain pending until a project is configured. Run `supabase/verify-access.sql` and real login checks before sharing the hosted link. Visual browser testing was unavailable in this environment.
