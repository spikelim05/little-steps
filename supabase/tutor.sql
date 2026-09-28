-- Run competition.sql first. Then run this file in SQL Editor.
begin;
create table if not exists public.tutor_students (
 tutor_id uuid not null references auth.users(id) on delete cascade,
 student_id uuid not null references public.student_spaces(user_id) on delete cascade,
 primary key(tutor_id,student_id), check(tutor_id<>student_id)
);
alter table public.tutor_students enable row level security;
revoke all on public.tutor_students from public,anon,authenticated;

create or replace function public.tutor_dashboard()
returns jsonb language plpgsql security definer set search_path='' as $$
declare w date:=date_trunc('week',timezone('Asia/Singapore',now()))::date;
begin
 if not exists(select 1 from public.tutor_students where tutor_id=auth.uid()) then
  raise exception 'This account does not have tutor access.';
 end if;
 return jsonb_build_object('week_start',w,'students',coalesce((
  select jsonb_agg(jsonb_build_object(
   'name',s.display_name,
   'weekly_points',(select count(*)*10 from public.challenge_events e where e.user_id=s.user_id and e.day>=w and e.day<w+7),
   'revision_total',(select count(*) from public.challenge_events e where e.user_id=s.user_id and e.kind='revision'),
   'focus_total',(select count(*) from public.challenge_focus f where f.user_id=s.user_id and f.state='finished'),
   'focus_minutes',(select coalesce(sum(duration)/60,0) from public.challenge_focus f where f.user_id=s.user_id and f.state='finished'),
   'last_scored_day',(select max(day) from public.challenge_events e where e.user_id=s.user_id),
   'days',(select coalesce(jsonb_agg(d order by d.day),'[]'::jsonb) from (
    select e.day,count(*) filter(where kind='revision') as revision,count(*) filter(where kind='focus') as focus
    from public.challenge_events e where e.user_id=s.user_id and e.day>=w-21 and e.day<w+7 group by e.day
   ) d)
  ) order by s.display_name)
  from public.tutor_students t join public.student_spaces s on s.user_id=t.student_id where t.tutor_id=auth.uid()
 ),'[]'::jsonb));
end $$;
revoke all on function public.tutor_dashboard() from public,anon;
grant execute on function public.tutor_dashboard() to authenticated;
commit;
