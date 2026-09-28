# Daily Flip & Learn

## Enable the expanded question banks

1. Copy all of `supabase/daily-flashcards.sql`.
2. In the existing Supabase project, open SQL Editor > New query, paste and Run.
3. Expect `Daily flashcard banks are ready.`
4. After Render deploys the frontend update, refresh the website and sign in again to load the expanded bank.

No user IDs need replacing. The SQL matches the existing Lauren and Caleb Auth identifiers and updates only `content.cards`. Names, syllabuses, exams, weekly scores, uploaded files and account credentials are preserved. It rolls back both updates if either learning space is missing and is safe to rerun. Future full assignment templates also include the expanded banks.

## Student experience

- Flip & Learn defaults to **Today's 10 cards**: five Maths and five Science prompts, alternating subjects.
- A new set is selected at midnight Singapore time. An open page refreshes the set on its next timer tick; a sleeping tab updates when it resumes. The date uses the device clock interpreted in Singapore time.
- The same account and date get the same set across devices and reloads. Known/still-learning marks remain device-local as before.
- With the expanded banks and no intervening bank changes, no card repeats within seven consecutive daily sets. Lauren has 102 cards and Caleb has 110. Cards eventually return for recall practice; these are rotating original questions, not newly AI-generated questions every day.
- **Full library** remains available for extra practice. Subject filters narrow the current daily/library selection. **Still learning only** filters out locally known cards without replacing them with another daily selection. **Shuffle** rearranges the current selection only.
- The banks preserve all existing card IDs so previous confidence marks still apply. New questions stay within the supplied subject scope; Caleb's existing uncertainty about detailed Human Systems coverage is retained.
- Daily selection needs no scheduled task, paid API, or new database table. Flashcards do not award weekly competitive points; that challenge still counts revision activities and focus sessions.

## Checks

`node --test` verifies deterministic selection, balanced subject counts, unique bank entries, Singapore midnight, month/year transitions and seven-day non-repetition alongside existing UI and account tests.

`node scripts/check-flashcards-db.mjs` exercises the generated SQL against the optional local PostgreSQL test engine installed via the weekly-challenge guide. It checks reruns, correct account matching, rollback on a missing account, and preservation of other content. This does not apply the update to live Supabase. Browser visual testing remains unavailable in the current environment.
