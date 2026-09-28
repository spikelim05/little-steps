# Lauren and Caleb's weekly challenge

## Enable the update

1. In the existing Supabase project, open SQL Editor > New query.
2. Paste the entire contents of `supabase/competition.sql` and Run.
3. Expect `Names and weekly challenge are ready.`
4. Wait for Render to deploy the matching GitHub update, then refresh and sign in again.

The query changes the two display names to Lauren and Caleb by matching their existing username-based Auth emails. It adds private scoring tables and functions. It does not change User UIDs, passwords, uploads or syllabuses. The migration can be rerun without clearing scores. No paid service or new secret key is required.

## Scoring

- Weekly goal: 100 points, with scores continuing above the goal. The two bars use the same scale and tied scores share a rank.
- Revision: 10 points when the student marks an activity tried or presses **Add today's revision**. A resource counts once per Singapore day; up to three different resources count daily. Only resources in the student's assigned content are accepted. External sites do not report scores or actual completion, so these are self-reported practice points.
- Focus: 10 points per completed 10, 20 or 25 minute session, up to three per day. Break timers do not score. The server measures elapsed running time, excluding pauses. Starting a new timer invalidates older unfinished timers for that account, including on other devices.
- Weeks begin Monday at 00:00 in Asia/Singapore. Completion counts on the Singapore date when the award is saved; an offline session saved later counts on that later day/week. Old local checkmarks and focus totals are not imported.
- Scores persist across devices and browser resets. The current timer and scratchpad remain on the device. Keep the timer page open or return to the same browser to finish/sync it. After network errors, **Retry saving points** completes the same session without awarding twice. Clearing device data before a pending focus award syncs can lose that pending claim.
- The board refreshes every minute while a relevant page is visible, after awards, on returning to the tab, and on **Refresh scores**. It shows any connection/setup error rather than inventing scores.

## Shared information and access

Only these two enrolled accounts can call the challenge functions. The board returns first name, weekly point total, revision/focus counts, week start, and whether the row belongs to the caller. It does not expose other students' IDs, activity links, files, answers, notes or syllabus content. The original student_spaces and file Storage policies remain in place.

Students cannot read or write the scoring tables directly. Server functions derive the account from the authenticated session, validate activities, serialise awards using a membership-row lock, enforce daily limits, and reject duplicate claims. Scores are motivational effort indicators, not an anti-cheat examination system or proof of focused attention.

## Verification

`node --test` covers UI rendering, named accounts, request scoping, retries, stale account responses and the existing learning/file tools.

For the optional isolated PostgreSQL check:

```sh
npm install --prefix data/sql-check --no-save --package-lock=false @electric-sql/pglite
node scripts/check-challenge-db.mjs
```

The database check applies the migration twice and exercises real PostgreSQL functions for access denial, names, duplicate claims, caps, timer durations, pauses/resumes, cross-account timers and week boundaries. It does not connect to the live Supabase project. The temporary engine lives in the ignored data directory.

After the setup query, sign in as each student and check their name and both bars. Complete one revision activity, confirm 10 points on both accounts after refreshing scores, and repeat the same activity to confirm it does not score twice that day. Complete a focus session to confirm its points. Existing uploads and each private syllabus should still be accessible only to their owner. Visual browser verification was unavailable during implementation.
