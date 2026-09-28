-- Run AFTER creating and assigning both students. This checks actual database policies.
-- Everything runs in a transaction and is rolled back; no student content is changed.
begin;
do $$ begin
 if (select count(*) from public.student_spaces) < 2 then
  raise exception 'Assign both student accounts before running this check.';
 end if;
 if has_table_privilege('anon','public.student_spaces','SELECT') then
  raise exception 'Anonymous access must not be granted.';
 end if;
 if has_table_privilege('authenticated','public.student_spaces','INSERT')
 or has_table_privilege('authenticated','public.student_spaces','UPDATE')
 or has_table_privilege('authenticated','public.student_spaces','DELETE') then
  raise exception 'Students must not have write privileges.';
 end if;
end $$;
select set_config('little_steps.first_user',(select user_id::text from public.student_spaces order by user_id limit 1),true);
select set_config('little_steps.second_user',(select user_id::text from public.student_spaces order by user_id offset 1 limit 1),true);
set local role authenticated;
select set_config('request.jwt.claim.sub',current_setting('little_steps.first_user'),true);
do $$ begin
 if (select count(*) from public.student_spaces) <> 1
 or exists(select 1 from public.student_spaces where user_id <> auth.uid()) then
  raise exception 'First student can access the wrong records.';
 end if;
end $$;
select set_config('request.jwt.claim.sub',current_setting('little_steps.second_user'),true);
do $$ begin
 if (select count(*) from public.student_spaces) <> 1
 or exists(select 1 from public.student_spaces where user_id <> auth.uid()) then
  raise exception 'Second student can access the wrong records.';
 end if;
end $$;
rollback;
select 'Access checks passed for both students.' as result;
