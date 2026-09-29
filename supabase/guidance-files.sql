-- Run after tutor-workspace.sql. Private attachments for guidance, safe to rerun.
begin;
insert into storage.buckets(id,name,public,file_size_limit,allowed_mime_types)
values('guidance-files','guidance-files',false,5242880,array['application/pdf','image/jpeg','image/png','image/webp'])
on conflict(id) do update set public=false,file_size_limit=5242880,allowed_mime_types=excluded.allowed_mime_types;

create or replace function public.guidance_file_access(object_name text,writing boolean)
returns boolean language sql stable security definer set search_path='' as $$
 select coalesce(writing is not null and array_length(string_to_array(object_name,'/'),1)=3
 and split_part(object_name,'/',3)<>'' and exists(
 select 1 from public.tutor_items x where x.tutor_id::text=split_part(object_name,'/',1)
 and x.id::text=split_part(object_name,'/',2)
 and (x.tutor_id=auth.uid() or (not writing and x.student_id=auth.uid()))),false)
$$;
revoke all on function public.guidance_file_access(text,boolean) from public,anon;
grant execute on function public.guidance_file_access(text,boolean) to authenticated;

drop policy if exists "Guidance read boundary" on storage.objects;
create policy "Guidance read boundary" on storage.objects as restrictive for select to authenticated
using(bucket_id<>'guidance-files' or public.guidance_file_access(name,false));
drop policy if exists "Guidance insert boundary" on storage.objects;
create policy "Guidance insert boundary" on storage.objects as restrictive for insert to authenticated
with check(bucket_id<>'guidance-files' or public.guidance_file_access(name,true));
drop policy if exists "Guidance update boundary" on storage.objects;
create policy "Guidance update boundary" on storage.objects as restrictive for update to authenticated
using(bucket_id<>'guidance-files' or public.guidance_file_access(name,true))
with check(bucket_id<>'guidance-files' or public.guidance_file_access(name,true));
drop policy if exists "Guidance delete boundary" on storage.objects;
create policy "Guidance delete boundary" on storage.objects as restrictive for delete to authenticated
using(bucket_id<>'guidance-files' or public.guidance_file_access(name,true));
drop policy if exists "No anonymous guidance files" on storage.objects;
create policy "No anonymous guidance files" on storage.objects as restrictive for all to anon
using(bucket_id<>'guidance-files') with check(bucket_id<>'guidance-files');
drop policy if exists "Read assigned guidance files" on storage.objects;
create policy "Read assigned guidance files" on storage.objects for select to authenticated
using(bucket_id='guidance-files' and public.guidance_file_access(name,false));
drop policy if exists "Upload tutor guidance files" on storage.objects;
create policy "Upload tutor guidance files" on storage.objects for insert to authenticated
with check(bucket_id='guidance-files' and public.guidance_file_access(name,true));
drop policy if exists "Retry tutor guidance uploads" on storage.objects;
create policy "Retry tutor guidance uploads" on storage.objects for update to authenticated
using(bucket_id='guidance-files' and public.guidance_file_access(name,true))
with check(bucket_id='guidance-files' and public.guidance_file_access(name,true));
drop policy if exists "Remove tutor guidance files" on storage.objects;
create policy "Remove tutor guidance files" on storage.objects for delete to authenticated
using(bucket_id='guidance-files' and public.guidance_file_access(name,true));

create or replace function public.tutor_item_files(item_id uuid)
returns jsonb language plpgsql security definer set search_path='' as $$
begin
 if not exists(select 1 from public.tutor_items x where x.id=item_id and (x.tutor_id=auth.uid() or x.student_id=auth.uid())) then raise exception 'This guidance is unavailable.'; end if;
 return (select coalesce(jsonb_agg(jsonb_build_object('path',o.name,'name',regexp_replace(split_part(o.name,'/',3),'^[0-9a-f-]{36}__',''),'size',o.metadata->'size') order by o.created_at),'[]'::jsonb)
 from storage.objects o join public.tutor_items x on x.id=item_id
 where o.bucket_id='guidance-files' and split_part(o.name,'/',1)=x.tutor_id::text and split_part(o.name,'/',2)=x.id::text);
end $$;

create or replace function public.tutor_workspace()
returns jsonb language plpgsql security definer set search_path='' as $$
begin
 if not exists(select 1 from public.tutor_students where tutor_id=auth.uid()) then raise exception 'Tutor access required.'; end if;
 return jsonb_build_object(
 'students',(select coalesce(jsonb_agg(jsonb_build_object('id',s.user_id,'name',s.display_name,'content',s.content) order by s.display_name),'[]'::jsonb)
 from public.tutor_students t join public.student_spaces s on s.user_id=t.student_id where t.tutor_id=auth.uid()),
 'items',(select coalesce(jsonb_agg(to_jsonb(x)||jsonb_build_object('attachments',public.tutor_item_files(x.id)) order by x.created_at desc),'[]'::jsonb) from public.tutor_items x where x.tutor_id=auth.uid()));
end $$;
create or replace function public.student_tutor_items()
returns jsonb language plpgsql security definer set search_path='' as $$
begin
 if not exists(select 1 from public.student_spaces where user_id=auth.uid()) then raise exception 'Student access required.'; end if;
 return (select coalesce(jsonb_agg(to_jsonb(x)||jsonb_build_object('attachments',public.tutor_item_files(x.id)) order by x.created_at desc),'[]'::jsonb) from public.tutor_items x where x.student_id=auth.uid());
end $$;
create or replace function public.tutor_delete_item(item_id uuid)
returns void language plpgsql security definer set search_path='' as $$
begin
 if not exists(select 1 from public.tutor_items where id=item_id and tutor_id=auth.uid()) then raise exception 'This item is unavailable.'; end if;
 if exists(select 1 from storage.objects where bucket_id='guidance-files' and split_part(name,'/',1)=auth.uid()::text and split_part(name,'/',2)=item_id::text) then raise exception 'Remove the attachments before deleting this guidance.'; end if;
 delete from public.tutor_items where id=item_id and tutor_id=auth.uid();
end $$;
revoke all on function public.tutor_item_files(uuid),public.tutor_workspace(),public.student_tutor_items(),public.tutor_delete_item(uuid) from public,anon;
grant execute on function public.tutor_item_files(uuid),public.tutor_workspace(),public.student_tutor_items(),public.tutor_delete_item(uuid) to authenticated;
commit;
