-- Update only Lauren's level/school/year label; preserves all learning content and activity.
begin;
do $$
begin
 update public.student_spaces s
 set content=jsonb_set(s.content,'{level}',to_jsonb('Primary 4 · CHIJ Our Lady of the Nativity (OLN) · 2026'::text)),updated_at=now()
 from auth.users u
 where s.user_id=u.id and lower(u.email)='laurenp4@students.little-steps.invalid';
 if not found then raise exception 'Lauren learning space was not found.'; end if;
end $$;
commit;
