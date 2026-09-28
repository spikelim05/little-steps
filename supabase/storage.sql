-- Run the entire file in Supabase SQL Editor, after schema.sql.
-- Creates private storage. Does not delete existing files or student content.
begin;
insert into storage.buckets (id,name,public,file_size_limit,allowed_mime_types)
values ('student-files','student-files',false,5242880,
 array['application/pdf','image/jpeg','image/png','image/webp'])
on conflict (id) do update set public=false,file_size_limit=5242880,
 allowed_mime_types=excluded.allowed_mime_types;

-- The restrictive guard also protects this bucket if a broader policy is added later.
drop policy if exists "Student files boundary" on storage.objects;
create policy "Student files boundary" on storage.objects as restrictive
for all to authenticated
using (bucket_id <> 'student-files' or (
 (storage.foldername(name))[1]=(select auth.uid())::text
 and exists(select 1 from public.student_spaces where user_id=(select auth.uid()))
))
with check (bucket_id <> 'student-files' or (
 (storage.foldername(name))[1]=(select auth.uid())::text
 and exists(select 1 from public.student_spaces where user_id=(select auth.uid()))
));
drop policy if exists "No anonymous student files" on storage.objects;
create policy "No anonymous student files" on storage.objects as restrictive
for all to anon using (bucket_id <> 'student-files') with check (bucket_id <> 'student-files');
drop policy if exists "Students list and open own files" on storage.objects;
create policy "Students list and open own files" on storage.objects for select to authenticated
using (bucket_id='student-files' and (storage.foldername(name))[1]=(select auth.uid())::text);
drop policy if exists "Students upload own files" on storage.objects;
create policy "Students upload own files" on storage.objects for insert to authenticated
with check (bucket_id='student-files' and (storage.foldername(name))[1]=(select auth.uid())::text);
drop policy if exists "Students delete own files" on storage.objects;
create policy "Students delete own files" on storage.objects for delete to authenticated
using (bucket_id='student-files' and (storage.foldername(name))[1]=(select auth.uid())::text);
commit;
select 'Private file storage is ready.' as result;
