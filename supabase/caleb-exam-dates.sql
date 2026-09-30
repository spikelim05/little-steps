-- Correct Caleb's 2026 EOY dates. Preserves other content and progress.
begin;
do $$
declare c jsonb; student uuid;
begin
 select s.user_id,s.content into student,c from public.student_spaces s join auth.users u on u.id=s.user_id
 where lower(u.email)='calebp4@students.little-steps.invalid' for update of s;
 if student is null then raise exception 'Caleb learning space was not found.'; end if;
 c=jsonb_set(c,'{exams,maths,lines,0}',to_jsonb('End Year Exam: Wednesday, 28 October 2026.'::text));
 c=jsonb_set(c,'{exams,science,lines,0}',to_jsonb('End Year Examination: Thursday, 29 October 2026.'::text));
 c=jsonb_set(c,'{assessments}',(select jsonb_agg(case
 when a->>'term'='4' and a->>'subject'='maths' then jsonb_set(a,'{dates}',to_jsonb('28 October 2026 (Wednesday)'::text))
 when a->>'term'='4' and a->>'subject'='science' then jsonb_set(a,'{dates}',to_jsonb('29 October 2026 (Thursday)'::text))
 else a end order by n) from jsonb_array_elements(c->'assessments') with ordinality as items(a,n)));
 update public.student_spaces set content=c,updated_at=now() where user_id=student;
end $$;
commit;
