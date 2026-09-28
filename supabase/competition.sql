-- Run this entire file once in Supabase SQL Editor. Safe to rerun.
-- Updates display names and adds the shared weekly challenge.
-- Existing syllabuses, uploads and passwords are unchanged.
begin;
update public.student_spaces s set display_name=v.name,updated_at=now()
from auth.users u, (values
 ('laurenp4@students.little-steps.invalid','Lauren'),
 ('calebp4@students.little-steps.invalid','Caleb')
) as v(email,name) where s.user_id=u.id and lower(u.email)=v.email;

create table if not exists public.challenge_members (
 user_id uuid primary key references public.student_spaces(user_id) on delete cascade
);
insert into public.challenge_members(user_id)
 select s.user_id from public.student_spaces s join auth.users u on u.id=s.user_id
 where lower(u.email) in ('laurenp4@students.little-steps.invalid','calebp4@students.little-steps.invalid')
on conflict do nothing;
create table if not exists public.challenge_events (
 user_id uuid not null references public.challenge_members(user_id) on delete cascade,
 day date not null,
 kind text not null check(kind in ('revision','focus')),
 activity text not null,
 primary key(user_id,day,kind,activity)
);
create table if not exists public.challenge_focus (
 id uuid primary key,
 user_id uuid not null references public.challenge_members(user_id) on delete cascade,
 duration integer not null check(duration in (600,1200,1500)),
 remaining double precision not null,
 started_at timestamptz,
 state text not null check(state in ('running','paused','finished','cancelled')),
 created_at timestamptz not null default now()
);
alter table public.challenge_members enable row level security;
alter table public.challenge_events enable row level security;
alter table public.challenge_focus enable row level security;
revoke all on public.challenge_members,public.challenge_events,public.challenge_focus from public,anon,authenticated;

-- Only RPCs expose these private tables. Never accept a caller-supplied user ID or point value.
create or replace function public.challenge_board()
returns table(display_name text,points bigint,revision_count bigint,focus_count bigint,is_you boolean,week_start date)
language plpgsql security definer set search_path='' as $$
declare w date:=date_trunc('week',timezone('Asia/Singapore',now()))::date;
begin
 if not exists(select 1 from public.challenge_members m where m.user_id=auth.uid()) then
  raise exception 'This account is not enrolled in the challenge.';
 end if;
 return query select s.display_name,count(e.activity)*10,
  count(e.activity) filter(where e.kind='revision'),count(e.activity) filter(where e.kind='focus'),
  m.user_id=auth.uid(),w
 from public.challenge_members m join public.student_spaces s on s.user_id=m.user_id
 left join public.challenge_events e on e.user_id=m.user_id and e.day>=w and e.day<w+7
 group by m.user_id,s.display_name order by count(e.activity) desc,s.display_name;
end $$;

create or replace function public.challenge_revision(resource_id text)
returns text language plpgsql security definer set search_path='' as $$
declare d date:=timezone('Asia/Singapore',now())::date;
begin
 -- Row lock serialises awards across devices and simultaneous requests.
 perform 1 from public.challenge_members m where m.user_id=auth.uid() for update;
 if not found then raise exception 'This account is not enrolled in the challenge.'; end if;
 if not exists(select 1 from public.student_spaces s,
 jsonb_array_elements(s.content->'resources') r where s.user_id=auth.uid() and r->>'id'=resource_id) then
  raise exception 'Choose a revision activity from your syllabus.';
 end if;
 if exists(select 1 from public.challenge_events e where e.user_id=auth.uid() and e.day=d and e.kind='revision' and e.activity=resource_id) then return 'already'; end if;
 if (select count(*) from public.challenge_events e where e.user_id=auth.uid() and e.day=d and e.kind='revision')>=3 then return 'limit'; end if;
 insert into public.challenge_events values(auth.uid(),d,'revision',resource_id);
 return 'awarded';
end $$;

create or replace function public.challenge_timer(command text,session_id uuid,seconds integer default null)
returns jsonb language plpgsql security definer set search_path='' as $$
declare f public.challenge_focus; left_seconds double precision; result text:='ok';
 d date:=timezone('Asia/Singapore',now())::date;
begin
 perform 1 from public.challenge_members m where m.user_id=auth.uid() for update;
 if not found then raise exception 'This account is not enrolled in the challenge.'; end if;
 if session_id is null then raise exception 'A timer ID is required.'; end if;
 select * into f from public.challenge_focus t where t.id=session_id and t.user_id=auth.uid() for update;
 if command='start' and f.id is null then
  if seconds is null or seconds not in (600,1200,1500) then raise exception 'Choose a 10, 20 or 25 minute session.'; end if;
  update public.challenge_focus set state='cancelled',started_at=null where user_id=auth.uid() and state in ('running','paused');
  insert into public.challenge_focus(id,user_id,duration,remaining,started_at,state)
   values(session_id,auth.uid(),seconds,seconds,now(),'running') returning * into f;
 elsif f.id is null then raise exception 'This focus session is unavailable. Reset the timer.';
 end if;
 if f.state='cancelled' then raise exception 'A newer focus session replaced this timer. Reset it to start again.'; end if;
 left_seconds:=greatest(0,f.remaining-case when f.state='running' then extract(epoch from now()-f.started_at) else 0 end);
 if command='pause' and f.state='running' then
  update public.challenge_focus set remaining=left_seconds,started_at=null,state='paused' where id=f.id returning * into f;
 elsif command='resume' and f.state='paused' then
  update public.challenge_focus set started_at=now(),state='running' where id=f.id returning * into f;
 elsif command='finish' then
  if f.state='finished' then result:='already';
  elsif left_seconds>0 then result:='waiting';
  else
   update public.challenge_focus set remaining=0,started_at=null,state='finished' where id=f.id returning * into f;
   if (select count(*) from public.challenge_events e where e.user_id=auth.uid() and e.day=d and e.kind='focus')>=3 then result:='limit';
   else insert into public.challenge_events values(auth.uid(),d,'focus',f.id::text); result:='awarded'; end if;
  end if;
 elsif command not in ('start','pause','resume','status') then raise exception 'Unknown timer command.';
 end if;
 return jsonb_build_object('result',result,'state',f.state,'remaining',ceil(left_seconds),'duration',f.duration);
end $$;
revoke all on function public.challenge_board(),public.challenge_revision(text),public.challenge_timer(text,uuid,integer) from public,anon;
grant execute on function public.challenge_board(),public.challenge_revision(text),public.challenge_timer(text,uuid,integer) to authenticated;
commit;
select 'Names and weekly challenge are ready.' as result;
