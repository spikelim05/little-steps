import {writeFile} from 'node:fs/promises';
import {student1} from '../private-content/curriculum.mjs';
import {cards} from '../private-content/study-data.mjs';
import {extraFlashcards} from '../private-content/extra-flashcards.mjs';
import {revisionResources} from '../private-content/revision.mjs';
import {student2Content} from '../private-content/student-2.mjs';
const content={version:1,pending:false,level:student1.level,subjects:[{id:'maths',name:'Mathematics',symbol:'÷',line:'A little practice adds up.',tags:'Maths exam · 27 October 2026'},{id:'science',name:'Science',symbol:'✳',line:'Stay curious about the world.',tags:'Science exam · 29 October 2026'}],topics:[...student1.maths.map((name,i)=>({id:'m'+i,name,subject:'maths'})),...student1.science.map(([theme,name,level],i)=>({id:'s'+i,name,subject:'science',theme,level}))],cards:[...cards,...extraFlashcards],resources:revisionResources,exams:{maths:{marks:100,lines:['Examination: 27 October 2026.','Paper 1: 15 MCQs (30 marks), 15 short-answer questions (30 marks).','Paper 2: 12 long-answer questions (40 marks).'],reminder:'Remember your protractor and set square.'},science:{marks:100,lines:['Examination: 29 October 2026.','Section A: 30 MCQs (60 marks).','Section B: 11 open-ended questions (40 marks).','Labelled “new format” in the supplied syllabus.']}},focusPrompt:'Choose a topic you are still learning. Try a few questions, then explain your method or reasoning.'};
function sql(name,c){return `-- Replace STUDENT_USER_UUID with this student's ID from Authentication > Users.\n-- Run only in the Supabase SQL Editor after schema.sql. No passwords go in SQL.\ninsert into public.student_spaces (user_id, display_name, content)\nvalues ('STUDENT_USER_UUID'::uuid, '${name}', $content$${JSON.stringify(c,null,2)}$content$::jsonb)\non conflict (user_id) do update set display_name=excluded.display_name, content=excluded.content, updated_at=now();\n`;}
await writeFile('supabase/student-1.sql',sql('Lauren',content));
await writeFile('supabase/student-2.sql',sql('Caleb',student2Content));
let patch='-- Refresh only flashcards for the two existing accounts. Other content and scores are preserved.\nbegin;\n';
for(const [email,bank] of [['laurenp4',content.cards],['calebp4',student2Content.cards]]){
 patch+=`do $patch$ begin\n update public.student_spaces s\n set content=jsonb_set(s.content,'{cards}',$cards$${JSON.stringify(bank,null,2)}$cards$::jsonb),updated_at=now()\n from auth.users u where s.user_id=u.id and lower(u.email)='${email}@students.little-steps.invalid';\n if not found then raise exception 'Missing learning space for ${email}.'; end if;\nend $patch$;\n`;
}
patch+="commit;\nselect 'Daily flashcard banks are ready.' as result;\n";
await writeFile('supabase/daily-flashcards.sql',patch);
console.log('Generated student content outside the public website.');
