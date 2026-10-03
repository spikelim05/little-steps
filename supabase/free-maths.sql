-- Free maths replacement for both students. Safe to rerun; preserves other content and scores.
begin;
do $patch$
declare account text; changed integer;
begin
 foreach account in array array['laurenp4','calebp4'] loop
  update public.student_spaces s set content=jsonb_set(s.content,'{resources}',
   $resources$[
  {
    "id": "free-money-estimation",
    "subject": "maths",
    "title": "Money problems: estimate and explain",
    "provider": "Math Mammoth",
    "url": "https://www.mathmammoth.com/practice/estimating-money",
    "topics": "Decimals · Money · Estimation",
    "focus": "Choose Not timed and 10 questions. The website checks estimates, rather than exact totals. Dollar examples are not specifically Singapore prices.",
    "task": "Complete 10 questions. For 3 of them, also calculate the exact answer on paper and explain whether your estimate is above or below it.",
    "difficulty": "Word problems",
    "access": "Free online activity; no subscription needed. Use the activity controls, not the optional book offers. Checked 3 October 2026."
  },
  {
    "id": "free-decimal-picture",
    "subject": "maths",
    "title": "Decimals: uncover the hidden picture",
    "provider": "Math Mammoth",
    "url": "https://www.mathmammoth.com/practice/mystery-picture-decimals",
    "topics": "Decimals · Addition & subtraction",
    "focus": "Choose two decimal places and practise both addition and subtraction. Use place value carefully.",
    "task": "Finish a picture. Write out 5 calculations, then check each answer using the inverse operation.",
    "difficulty": "Challenge practice",
    "access": "Free online activity; no subscription needed. Use the activity controls, not the optional book offers. Checked 3 October 2026."
  },
  {
    "id": "free-factor-hunt",
    "subject": "maths",
    "title": "Factors: find every pair",
    "provider": "Math Mammoth",
    "url": "https://www.mathmammoth.com/practice/factorfind",
    "topics": "Factors & multiples · Whole numbers",
    "focus": "Set a minimum of 20 and a maximum of 100. Find all factors, not just one factor pair.",
    "task": "Complete 10 questions. List factor pairs systematically and explain how you know you have not missed any.",
    "difficulty": "Challenge practice",
    "access": "Free online activity; no subscription needed. Use the activity controls, not the optional book offers. Checked 3 October 2026."
  },
  {
    "id": "free-fraction-mix",
    "subject": "maths",
    "title": "Fractions: add, subtract and simplify",
    "provider": "Math Mammoth",
    "url": "https://www.mathmammoth.com/practice/add-subtract-fractions",
    "topics": "Fractions · Mixed numbers",
    "focus": "Choose two fractions, denominators 2,3,4,6,8,12, and Not timed. Start with same denominators; try related unlike denominators when ready.",
    "task": "Complete 10 questions. Show equivalent fractions in your working and simplify each answer. Ask your tutor before using the harder mixed-number options.",
    "difficulty": "Challenge practice",
    "access": "Free online activity; no subscription needed. Use the activity controls, not the optional book offers. Checked 3 October 2026."
  },
  {
    "id": "free-angle-match",
    "subject": "maths",
    "title": "Angles: turn it around",
    "provider": "Math Mammoth",
    "url": "https://www.mathmammoth.com/practice/angles-matching",
    "topics": "Angles · Estimating angle measures",
    "focus": "Choose 18 tiles and multiple orientations for a harder matching game. Rotation does not change an angle.",
    "task": "Complete a round. Sketch 3 angles and use a protractor to check your estimates. Explain why turning the drawing does not change its size.",
    "difficulty": "Challenge practice",
    "access": "Free online activity; no subscription needed. Use the activity controls, not the optional book offers. Checked 3 October 2026."
  },
  {
    "id": "free-area-builder",
    "subject": "maths",
    "title": "Area & perimeter: build a solution",
    "provider": "Math Mammoth",
    "url": "https://www.mathmammoth.com/practice/area-builder",
    "topics": "Area & perimeter · Rectangles & squares",
    "focus": "Open the game and work with squares and rectangles. Use the exploration area to compare shapes; skip triangle extensions.",
    "task": "Solve 5 challenges. Then build two different shapes with the same area but different perimeters, and record both measurements.",
    "difficulty": "Spatial reasoning",
    "access": "Free online activity; no subscription needed. Use the activity controls, not the optional book offers. Checked 3 October 2026."
  }
]$resources$::jsonb ||
   coalesce((select jsonb_agg(r order by n) from jsonb_array_elements(s.content->'resources') with ordinality as entries(r,n)
   where not (r->>'id'=any(array['math-word-problems','decimal-word-problems','free-money-estimation','free-decimal-picture','free-factor-hunt','free-fraction-mix','free-angle-match','free-area-builder']))),'[]'::jsonb)),updated_at=now()
  from auth.users u where s.user_id=u.id and lower(u.email)=account||'@students.little-steps.invalid';
  get diagnostics changed=row_count;
  if changed<>1 then raise exception 'Missing learning space for %.',account; end if;
 end loop;
end $patch$;
commit;
