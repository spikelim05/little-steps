# Tutor dashboard setup

Your tutor username is **tutor**. Students keep their own accounts.

## Upgrade an existing tutor account

If you can already sign in as tutor, run **all of `supabase/tutor-workspace.sql`** in Supabase SQL Editor. You do not need to recreate your account or rerun assignments. After Render deploys the update, refresh the website.

Your teaching space uses the students’ sidebar layout and all ten themes:

- **My tutor space:** choose a learner and plan the next step.
- **Student progress:** weekly points and recorded revision/focus activity.
- **Learning materials:** browse either student’s syllabus, revision resources and flashcards. Use **Set as a task** to turn a revision resource into a draft assignment.
- **Give guidance:** select a student and send a task, personal feedback, study note or HTTPS revision link. Tasks can have a due date.
- **Sent to students:** see task completion, edit content or remove an item. Editing a completed task keeps its completed status; create a new task for new work.
- **Make it your own:** choose a theme, saved on this browser for your tutor account.

Students receive these items under **From my tutor**. Only the intended student can mark their task done or undo that tick. The tutor sees those ticks after Refresh or the next automatic refresh (up to one minute while viewing the relevant page). Ticks are self-reports and do not award challenge points. Notes and feedback are text, with an optional link; there are no attachments or student replies in this feature.

Guidance is saved in Supabase and works across devices. Unsent drafts stay in the current page only: switching tutor sections preserves them, but reloading or signing out clears them. The public website never contains student guidance. If a tutor-student assignment is deleted, its guidance is deleted too.

## First-time setup

1. In Supabase **Authentication → Users → Add user → Create new user**, enter `tutor@students.little-steps.invalid`, choose your password (at least 8 characters), and enable **Auto Confirm User**. This internal email does not need a mailbox.
2. In **SQL Editor**, run `supabase/competition.sql` if you have not already enabled the weekly challenge.
3. Run all of `supabase/tutor.sql`, then all of `supabase/assign-tutor.sql`. These scripts are safe to rerun. They grant the separate tutor account access to Lauren and Caleb’s activity summaries.
   Then run all of `supabase/tutor-workspace.sql` to enable guidance and the learning-materials browser.
4. Once Render finishes deploying, open your website, sign out of any student account, and sign in with username **tutor** and the password you chose.

The dashboard refreshes every minute while visible, or immediately with Refresh. It shows this week’s points, all-time scored revision activities, completed cloud focus sessions/minutes, last scored date and four weeks of scored activity history. Weekly dates use Singapore time. Activities completed before cloud tracking was enabled cannot be recovered from other devices.

Revision completion is self-reported, not an external quiz result. Daily points have caps; focus totals include completed cloud timers beyond the daily scoring cap. Local flashcard recall, confidence ratings, scratchpads and uploaded files are not exposed on the tutor dashboard.

Only SQL-managed tutor assignments grant access. Students cannot grant themselves tutor access or read another student’s detailed activity. To revoke access, delete the relevant assignment using Supabase SQL Editor, for example:

```sql
delete from public.tutor_students
where tutor_id = (select id from auth.users where email = 'tutor@students.little-steps.invalid');
```
