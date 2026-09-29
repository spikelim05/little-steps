-- Run after tutor.sql and assign-tutor.sql. Safe to rerun.
begin;
create table if not exists public.tutor_items (
 id uuid primary key,
 tutor_id uuid not null,
 student_id uuid not null,
 kind text not null check(kind in ('task','feedback','note','link')),
 title text not null check(length(title) between 1 and 120),
 body text not null default '' check(length(body)<=5000),
 url text not null default '' check(length(url)<=2000 and (url='' or url ~ '^https://[^[:space:]]+$')),
 due_on date,
 completed_at timestamptz,
 created_at timestamptz not null default now(),
 updated_at timestamptz not null default now(),
 foreign key(tutor_id,student_id) references public.tutor_students(tutor_id,student_id) on delete cascade
);
create index if not exists tutor_items_student_created on public.tutor_items(student_id,created_at desc);
alter table public.tutor_items enable row level security;
revoke all on public.tutor_items from public,anon,authenticated;

create or replace function public.tutor_workspace()
returns jsonb language plpgsql security definer set search_path='' as $$
begin
 if not exists(select 1 from public.tutor_students where tutor_id=auth.uid()) then raise exception 'Tutor access required.'; end if;
 return jsonb_build_object(
 'students',(select coalesce(jsonb_agg(jsonb_build_object('id',s.user_id,'name',s.display_name,'content',s.content) order by s.display_name),'[]'::jsonb)
 from public.tutor_students t join public.student_spaces s on s.user_id=t.student_id where t.tutor_id=auth.uid()),
 'items',(select coalesce(jsonb_agg(x order by x.created_at desc),'[]'::jsonb) from public.tutor_items x where x.tutor_id=auth.uid()));
end $$;

create or replace function public.tutor_save_item(item_id uuid,recipient uuid,item_kind text,item_title text,item_body text default '',item_url text default '',due_date date default null)
returns void language plpgsql security definer set search_path='' as $$
begin
 perform 1 from public.tutor_students where tutor_id=auth.uid() and student_id=recipient for update;
 if not found then raise exception 'This student is not assigned to you.'; end if;
 if item_id is null or item_kind is null or item_kind not in ('task','feedback','note','link') or item_title is null or length(btrim(item_title)) not between 1 and 120
 or item_body is null or length(item_body)>5000 or item_url is null or length(item_url)>2000 or (item_url<>'' and item_url !~ '^https://[^[:space:]]+$')
 or (item_kind='link' and item_url='') or (item_kind<>'task' and due_date is not null) then raise exception 'Check the title, type, link and due date.'; end if;
 if exists(select 1 from public.tutor_items where id=item_id and (tutor_id<>auth.uid() or student_id<>recipient)) then raise exception 'This item is unavailable.'; end if;
 if exists(select 1 from public.tutor_items where id=item_id and kind<>item_kind) then raise exception 'Keep the original item type when editing.'; end if;
 insert into public.tutor_items(id,tutor_id,student_id,kind,title,body,url,due_on)
 values(item_id,auth.uid(),recipient,item_kind,btrim(item_title),item_body,item_url,due_date)
 on conflict(id) do update set title=excluded.title,body=excluded.body,url=excluded.url,due_on=excluded.due_on,updated_at=now()
 where public.tutor_items.tutor_id=auth.uid() and public.tutor_items.student_id=recipient and public.tutor_items.kind=item_kind;
 if not found then raise exception 'This item is unavailable.'; end if;
end $$;

create or replace function public.tutor_delete_item(item_id uuid)
returns void language plpgsql security definer set search_path='' as $$
begin
 delete from public.tutor_items where id=item_id and tutor_id=auth.uid();
 if not found then raise exception 'This item is unavailable.'; end if;
end $$;

create or replace function public.student_tutor_items()
returns jsonb language plpgsql security definer set search_path='' as $$
begin
 if not exists(select 1 from public.student_spaces where user_id=auth.uid()) then raise exception 'Student access required.'; end if;
 return (select coalesce(jsonb_agg(x order by x.created_at desc),'[]'::jsonb) from public.tutor_items x where x.student_id=auth.uid());
end $$;

create or replace function public.student_complete_task(item_id uuid,is_complete boolean)
returns void language plpgsql security definer set search_path='' as $$
begin
 if is_complete is null then raise exception 'Choose a task status.'; end if;
 update public.tutor_items set completed_at=case when is_complete then coalesce(completed_at,now()) else null end
 where id=item_id and student_id=auth.uid() and kind='task';
 if not found then raise exception 'This task is unavailable.'; end if;
end $$;
revoke all on function public.tutor_workspace(),public.tutor_save_item(uuid,uuid,text,text,text,text,date),public.tutor_delete_item(uuid),public.student_tutor_items(),public.student_complete_task(uuid,boolean) from public,anon;
grant execute on function public.tutor_workspace(),public.tutor_save_item(uuid,uuid,text,text,text,text,date),public.tutor_delete_item(uuid),public.student_tutor_items(),public.student_complete_task(uuid,boolean) to authenticated;
commit;
