import {cards} from './study-data.mjs';
import {extraFlashcards} from './extra-flashcards.mjs';
import {revisionResources} from './revision.mjs';

const mathsNames=['Numbers to 100 000','Factors & Multiples','Four Operations of Whole Numbers','Tables and Line Graphs','Fractions (I)','Fractions (II)','Angles','Rectangles and Squares','Decimals','Four Operations of Decimals','Pie Charts','Area and Perimeter','Nets','Symmetry'];
const scienceNames=['Plant System','Human Systems','Matter','Light','Shadows','Heat','Effects of Heat'];
const p3Names=['Living and Non-living Things and Classification','Materials','Life Cycles of Plants','Life Cycles of Animals','Magnets'];
const assessment=(subject,term,weight,marks,title,dates,weeks,chapters,extra={})=>({subject,term,weight,marks,title,dates,weeks,scope:chapters.map(n=>`Ch ${n}: ${(subject==='maths'?mathsNames:scienceNames)[n-1]}`),...extra});
const extraCards=[
 {id:'s2-p3-plant-cycle',subject:'science',topic:'Life Cycles of Plants (P3)',question:'A seedling grows into an adult flowering plant. Why is this part of a life cycle rather than a process that ends with the adult?',answer:'The adult plant can produce seeds, which can grow into new plants.',why:'A life cycle repeats across generations. The new seeds start the cycle again.'},
 {id:'s2-table',subject:'maths',topic:'Tables and Line Graphs',question:'A line graph shows 48 visitors on Monday, 72 on Tuesday and 60 on Wednesday. What was the increase from Monday to Tuesday?',answer:'24 visitors.',why:'Compare the two relevant values: 72 − 48 = 24. The Wednesday value is not needed.'},
 {id:'s2-rect',subject:'maths',topic:'Rectangles and Squares',question:'A shape has four right angles. Is it necessarily a square?',answer:'No. It could be a rectangle with unequal adjacent sides.',why:'A square needs four equal sides as well as four right angles.'},
 {id:'s2-number',subject:'maths',topic:'Numbers to 100 000',question:'What is 76 485 rounded to the nearest thousand?',answer:'76 000.',why:'The hundreds digit is 4, so round down. The number is closer to 76 000 than to 77 000.'},
 {id:'s2-plant',subject:'science',topic:'Plant System',question:'Why are roots and a stem both useful in getting water to a plant’s leaves?',answer:'Roots absorb water; the stem transports water towards the leaves.',why:'Different plant parts have different functions and work together as a system.'},
 {id:'s2-human',subject:'science',topic:'Human Systems',question:'Why do we describe a group of organs as a system?',answer:'The organs work together to carry out a function.',why:'A system contains parts that interact. Revise the particular human systems taught in your textbook with your tutor.'},
 {id:'s2-shadow-test',subject:'science',topic:'Shadows',question:'You want to test how object-to-torch distance affects shadow size. What should stay in the same position?',answer:'The torch and screen should stay fixed; move only the object between them.',why:'Keep the same object and light source too. Change the object’s position, then compare the shadows.'},
 {id:'s2-expansion',subject:'science',topic:'Effects of Heat',question:'A metal lid is stuck on a glass jar. Why might warming only the lid help loosen it?',answer:'The metal lid gains heat and expands.',why:'Expansion can make the lid fit less tightly. This is a thinking question, not an instruction to handle hot water.'},
 {id:'s2-contract',subject:'science',topic:'Effects of Heat',question:'A metal rod becomes slightly shorter as it cools. What has happened?',answer:'It lost heat and contracted.',why:'Cooling usually causes a metal to contract. Its shorter length does not mean some metal disappeared.'}
];

export const student2Content={
 version:1,pending:false,level:'Primary 4 · St. Stephen’s School · 2026',
 subjects:[{id:'maths',name:'Mathematics',symbol:'÷',line:'Build confidence, chapter by chapter.',tags:'14 chapters · End-year exam 3 Nov'},{id:'science',name:'Science',symbol:'✳',line:'Explore systems, light and heat.',tags:'P4 chapters + P3 revision · Exam 2 Nov'}],
 topics:[...mathsNames.map((name,i)=>({id:`s2-m${i+1}`,name,subject:'maths',chapter:i+1,level:'P4',theme:`Term ${i<4?1:i<8?2:i<11?3:4}`})),...scienceNames.map((name,i)=>({id:`s2-s${i+1}`,name,subject:'science',chapter:i+1,level:'P4',theme:['Terms 1–2','Term 2','Term 1','Term 2','Terms 2–3','Term 3','Terms 3–4'][i]})),...p3Names.map((name,i)=>({id:`s2-p3-${i+1}`,name,subject:'science',level:'P3',theme:'End-year revision · MOE P3 scope'}))],
 cards:[...cards.filter(c=>c.subject==='maths'||['s1','s2','s3','s4','s5','s7','s8','s9','s10'].includes(c.id)).map(c=>({...c,id:'s2-'+c.id,topic:c.id==='s2'?'Shadows':c.id==='s7'?'Plant System':c.topic})),...extraCards,...extraFlashcards.map(c=>({...c,id:'s2-'+c.id,topic:c.topic==='Plant parts'?'Plant System':c.topic}))],
 resources:revisionResources.map(r=>({...r,topics:r.id==='light'?'Ch 4: Light · Ch 5: Shadows':r.id==='heat'?'Ch 6: Heat · Ch 7: Effects of Heat':r.id==='matter'?'Ch 3: Matter':r.topics})),
 exams:{
  maths:{marks:100,lines:['End Year Exam: Tuesday, 3 November 2026.','Assessment weighting: 60% of the year.','All 14 chapters are included. The supplied plan does not give question counts or paper sections.']},
  science:{marks:100,lines:['End Year Examination: Monday, 2 November 2026.','Assessment weighting: 60% of the year.','Chapters 1–7, plus topics learned from the P3 Inspiring Science Textbook and Activity Book.','The supplied plan does not give question counts or paper sections.']}
 },
 contentNotice:'P3 Inspiring Science revision: living things and classification, materials, plant and animal life cycles, and magnets. The school’s 2026 booklist confirms Inspiring Science P3; these revision groups follow MOE’s 2023 P3 syllabus. They are not a separately verified school P3 assessment plan. Human Systems subtopics are not specified in the supplied school plan.',
 assessments:[
  assessment('maths',1,10,50,'Weighted Assessment 1','23 February – 6 March 2026','Weeks 8–9',[1,2,3,4]),
  assessment('maths',2,15,50,'Weighted Assessment 2','11–22 May 2026','Weeks 8–9',[5,6,7,8]),
  assessment('maths',3,15,50,'Weighted Assessment 3','6–24 July 2026','Weeks 8–9 (as printed)',[9,10,11],{note:'The school sheet pairs Weeks 8–9 with 6–24 July. Confirm the timing with your tutor; both are transcribed as printed.'}),
  assessment('maths',4,60,100,'End Year Exam','3 November 2026 (Tuesday)','',[1,2,3,4,5,6,7,8,9,10,11,12,13,14]),
  assessment('science',1,10,15,'Weighted Assessment 1','23 February – 6 March 2026','Weeks 8–9',[3]),
  assessment('science',2,15,15,'Weighted Assessment 2','11–22 May 2026','Weeks 8–9',[1,2]),
  assessment('science',3,15,15,'Weighted Assessment 3','6–24 July 2026','Weeks 2–4',[4,5],{note:'Performance task with rubrics.'}),
  assessment('science',4,60,100,'End Year Examination','2 November 2026 (Monday)','',[1,2,3,4,5,6,7],{note:'Also includes topics learned from the P3 Inspiring Science Textbook and Activity Book; P3 revision groups follow the MOE syllabus: living things and classification, materials, plant and animal life cycles, and magnets.'})
 ],
 focusPrompt:'Pick a chapter you are still learning: try a Maths problem or explain a Science observation. Include Area and Perimeter, Nets, Symmetry and Effects of Heat in your Term 4 revision, then revisit earlier chapters for the end-year exams. For P3 Science, compare materials, classify living things, explain a plant or animal life cycle, or reason about magnetic poles.'
};
