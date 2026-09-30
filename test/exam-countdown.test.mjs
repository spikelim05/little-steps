import {test} from 'node:test';
import assert from 'node:assert/strict';
import {readFile} from 'node:fs/promises';
import {examCountdowns,examCountdownView} from '../public/exam-countdown.js';
import {student2Content} from '../private-content/student-2.mjs';
const lauren=JSON.parse((await readFile('supabase/student-1.sql','utf8')).split('$content$')[1]);
test('each student countdown uses their assigned exam dates',()=>{
 const now=new Date('2026-09-30T04:00:00Z');
 assert.deepEqual(examCountdowns(lauren,now).map(e=>e.days),[27,29]);
 assert.deepEqual(examCountdowns(student2Content,now).map(e=>e.days),[28,29]);
 assert.match(examCountdownView(lauren,now),/27 October 2026/);
 assert.match(examCountdownView(student2Content,now),/28 October 2026/);
 assert.doesNotMatch(examCountdownView(student2Content,now),/November/);
});
test('countdown rolls over at Singapore midnight and handles today and finished papers',()=>{
 assert.equal(examCountdowns(lauren,new Date('2026-10-26T15:59:59Z'))[0].text,'1 day to go');
 assert.equal(examCountdowns(lauren,new Date('2026-10-26T16:00:00Z'))[0].text,'Paper today');
 assert.equal(examCountdowns(lauren,new Date('2026-10-27T16:00:00Z'))[0].text,'Paper finished');
 assert.equal(examCountdownView({}), '');
 assert.deepEqual(examCountdowns({exams:{maths:{lines:['31 February 2026']}}}),[]);
});
