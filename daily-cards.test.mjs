import {test} from 'node:test';
import assert from 'node:assert/strict';
import {readFile} from 'node:fs/promises';
import {dailyCards} from './public/daily-cards.js';
import {singaporeDay} from './public/progress.js';
import {student2Content} from './private-content/student-2.mjs';
const lauren=JSON.parse((await readFile('supabase/student-1.sql','utf8')).split('$content$')[1]).cards;
const ids=cards=>cards.map(c=>c.id);
test('daily decks are balanced, account-specific and stable across reloads or bank order',()=>{
 for(const [user,bank] of [['lauren',lauren],['caleb',student2Content.cards]]){
  const set=dailyCards(bank,user,'2026-09-28');
  assert.equal(set.length,10);assert.equal(set.filter(c=>c.subject==='maths').length,5);assert.equal(set.filter(c=>c.subject==='science').length,5);
  assert.deepEqual(ids(set),ids(dailyCards([...bank].reverse(),user,'2026-09-28')));
  assert.notDeepEqual(ids(set),ids(dailyCards(bank,user+'-other','2026-09-28')));
 }
});
test('each expanded bank has no repeats across seven days, including month and year boundaries',()=>{
 for(const [user,bank] of [['lauren',lauren],['caleb',student2Content.cards]])for(const start of ['2026-09-28','2026-12-28']){
  const seen=new Set();for(let day=0;day<7;day++){
   const date=new Date(Date.parse(start+'T00:00:00Z')+day*86400000).toISOString().slice(0,10);
   for(const card of dailyCards(bank,user,date)){assert.equal(seen.has(card.id),false,card.id);seen.add(card.id);}
  }assert.equal(seen.size,70);
 }
});
test('Singapore midnight changes the selection; sparse and empty banks are safe',()=>{
 const before=singaporeDay(new Date('2026-09-28T15:59:59Z')),after=singaporeDay(new Date('2026-09-28T16:00:00Z'));
 assert.equal(before,'2026-09-28');assert.equal(after,'2026-09-29');assert.notDeepEqual(ids(dailyCards(lauren,'one',before)),ids(dailyCards(lauren,'one',after)));
 assert.deepEqual(dailyCards([],'one',before),[]);assert.equal(dailyCards(lauren.slice(0,2),'one',before).length,2);
});
test('banks have unique IDs and questions, preserve known card IDs and keep student-specific scope',()=>{
 assert.equal(lauren.length,102);assert.equal(student2Content.cards.length,110);
 for(const bank of [lauren,student2Content.cards]){
  assert.equal(new Set(ids(bank)).size,bank.length);assert.equal(new Set(bank.map(c=>c.question)).size,bank.length);
  for(const c of bank)for(const key of ['id','subject','topic','question','answer','why'])assert.ok(c[key]);
 }
 assert.ok(lauren.some(c=>c.id==='s6'&&c.topic==='Digestive system'));
 assert.ok(student2Content.cards.some(c=>c.topic==='Effects of Heat'));
 assert.equal(student2Content.cards.some(c=>c.topic==='Digestive system'),false);
});
