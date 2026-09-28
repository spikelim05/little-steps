-- Create a confirmed Auth user first: tutor@students.little-steps.invalid
-- Set its password in Supabase, then run this entire file.
begin;
do $$
declare tutor uuid;
begin
 select id into tutor from auth.users where lower(email)='tutor@students.little-steps.invalid' and email_confirmed_at is not null;
 if tutor is null then raise exception 'Create the tutor Auth user with Auto Confirm enabled first.'; end if;
 if exists(select 1 from public.student_spaces where user_id=tutor) then raise exception 'Use a separate tutor account.'; end if;
 insert into public.tutor_students(tutor_id,student_id)
 select tutor,s.user_id from public.student_spaces s join auth.users u on u.id=s.user_id
 where lower(u.email) in ('laurenp4@students.little-steps.invalid','calebp4@students.little-steps.invalid')
 on conflict do nothing;
 if (select count(*) from public.tutor_students where tutor_id=tutor)<>2 then raise exception 'Both student accounts must be assigned first.'; end if;
end $$;
commit;
