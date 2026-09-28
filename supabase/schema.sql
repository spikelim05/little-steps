-- Run in the Supabase SQL Editor before assigning student accounts.
-- Accounts are created by the tutor in Authentication > Users, never by the public app.
begin;
create table if not exists public.student_spaces (
 user_id uuid primary key references auth.users(id) on delete cascade,
 display_name text not null check (length(display_name) between 1 and 80),
 content jsonb not null check (jsonb_typeof(content) = 'object'),
 updated_at timestamptz not null default now()
);
alter table public.student_spaces enable row level security;
alter table public.student_spaces force row level security;
revoke all on public.student_spaces from anon, authenticated;
grant select on public.student_spaces to authenticated;
drop policy if exists "Students read only their own learning space" on public.student_spaces;
create policy "Students read only their own learning space"
 on public.student_spaces for select to authenticated
 using ((select auth.uid()) = user_id);
-- Deliberately no insert, update or delete policy for students.
-- Ownership cannot be changed through user metadata or a student-facing API.
commit;
