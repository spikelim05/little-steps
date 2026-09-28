# Tutor dashboard setup

Your tutor username is **tutor**. Students keep their own accounts.

1. In Supabase **Authentication → Users → Add user → Create new user**, enter `tutor@students.little-steps.invalid`, choose your password (at least 8 characters), and enable **Auto Confirm User**. This internal email does not need a mailbox.
2. In **SQL Editor**, run `supabase/competition.sql` if you have not already enabled the weekly challenge.
3. Run all of `supabase/tutor.sql`, then all of `supabase/assign-tutor.sql`. These scripts are safe to rerun. They grant the separate tutor account access to Lauren and Caleb’s activity summaries.
4. Once Render finishes deploying, open your website, sign out of any student account, and sign in with username **tutor** and the password you chose.

The dashboard refreshes every minute while visible, or immediately with Refresh. It shows this week’s points, all-time scored revision activities, completed cloud focus sessions/minutes, last scored date and four weeks of scored activity history. Weekly dates use Singapore time. Activities completed before cloud tracking was enabled cannot be recovered from other devices.

Revision completion is self-reported, not an external quiz result. Daily points have caps; focus totals include completed cloud timers beyond the daily scoring cap. Local flashcard recall, confidence ratings, scratchpads and uploaded files are not exposed on the tutor dashboard.

Only SQL-managed tutor assignments grant access. Students cannot grant themselves tutor access or read another student’s detailed activity. To revoke access, delete the relevant assignment using Supabase SQL Editor, for example:

```sql
delete from public.tutor_students
where tutor_id = (select id from auth.users where email = 'tutor@students.little-steps.invalid');
```
