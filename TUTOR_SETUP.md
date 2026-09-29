# Tutor dashboard setup

Your tutor username is **tutor**. Students keep their own accounts.

## Enable file attachments

For an existing working tutor workspace, run all of **`supabase/guidance-files.sql`** in Supabase SQL Editor once. After Render finishes deploying, refresh your website.

In **Give guidance**, choose a student, enter a title, and use **Attach worksheets or notes**. Select one or more PDFs, JPGs, PNGs or WebP images (up to 5 MB each), then send. Files upload when you send or save, and stay available across devices. Students open them from **From my tutor → Open file**. The page refreshes every minute, or they can press Refresh.

You can open attachments from **Sent to students**, or edit an item to add or remove files. Deleting guidance removes its files first to free storage. Files use a private Supabase bucket and count towards the same project storage allowance as other uploads. Open links expire after one minute; press Open file again for a fresh link.

If an upload fails, the text may already be saved. Keep the page open and press **Save changes** to retry; successful files are skipped and failed files reuse the same path. Selected files are not retained after a page reload. If you leave the page, edit the saved guidance and select any missing files again.

Run this migration after `tutor-workspace.sql`; if you rerun that older migration later, rerun `guidance-files.sql` afterwards too. Before manually deleting a tutor assignment in Supabase, remove its guidance in the app to clean up the stored attachments. Deleting assignments directly makes leftover files inaccessible but does not remove their storage bytes.

## Upgrade an existing tutor account

If you can already sign in as tutor, run **all of `supabase/tutor-workspace.sql`** in Supabase SQL Editor. You do not need to recreate your account or rerun assignments. After Render deploys the update, refresh the website.

Your teaching space uses the students’ sidebar layout and all ten themes:

- **My tutor space:** choose a learner and plan the next step.
- **Student progress:** weekly points and recorded revision/focus activity.
- **Learning materials:** browse either student’s syllabus, revision resources and flashcards. Use **Set as a task** to turn a revision resource into a draft assignment.
- **Give guidance:** select a student and send a task, personal feedback, study note or HTTPS revision link. Tasks can have a due date.
- **Sent to students:** see task completion, edit content or remove an item. Editing a completed task keeps its completed status; create a new task for new work.
- **Make it your own:** choose a theme, saved on this browser for your tutor account.

Students receive these items under **From my tutor**. Only the intended student can mark their task done or undo that tick. The tutor sees those ticks after Refresh or the next automatic refresh (up to one minute while viewing the relevant page). Ticks are self-reports and do not award challenge points. Notes and feedback can include text, a link and file attachments once the attachment setup above is complete. Student replies are not included.

Guidance is saved in Supabase and works across devices. Unsent drafts stay in the current page only: switching tutor sections preserves them, but reloading or signing out clears them. The public website never contains student guidance. If a tutor-student assignment is deleted, its guidance is deleted too.

## First-time setup

1. In Supabase **Authentication → Users → Add user → Create new user**, enter `tutor@students.little-steps.invalid`, choose your password (at least 8 characters), and enable **Auto Confirm User**. This internal email does not need a mailbox.
2. In **SQL Editor**, run `supabase/competition.sql` if you have not already enabled the weekly challenge.
3. Run all of `supabase/tutor.sql`, then all of `supabase/assign-tutor.sql`. These scripts are safe to rerun. They grant the separate tutor account access to Lauren and Caleb’s activity summaries.
   Then run all of `supabase/tutor-workspace.sql` to enable guidance and the learning-materials browser.
   Finally run `supabase/guidance-files.sql` for private file attachments.
4. Once Render finishes deploying, open your website, sign out of any student account, and sign in with username **tutor** and the password you chose.

The dashboard refreshes every minute while visible, or immediately with Refresh. It shows this week’s points, all-time scored revision activities, completed cloud focus sessions/minutes, last scored date and four weeks of scored activity history. Weekly dates use Singapore time. Activities completed before cloud tracking was enabled cannot be recovered from other devices.

Revision completion is self-reported, not an external quiz result. Daily points have caps; focus totals include completed cloud timers beyond the daily scoring cap. Local flashcard recall, confidence ratings, scratchpads and uploaded files are not exposed on the tutor dashboard.

Only SQL-managed tutor assignments grant access. Students cannot grant themselves tutor access or read another student’s detailed activity. To revoke access, delete the relevant assignment using Supabase SQL Editor, for example:

```sql
delete from public.tutor_students
where tutor_id = (select id from auth.users where email = 'tutor@students.little-steps.invalid');
```
