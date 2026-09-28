import {test} from 'node:test';
import assert from 'node:assert/strict';
import {readFile} from 'node:fs/promises';
import vm from 'node:vm';
import {themes} from './public/themes.js';
import {readContent,scopedStorage} from './public/auth.js';
import * as progressHelpers from './public/progress.js';
import {dailyCards} from './public/daily-cards.js';
import {challengeView,awardMessage} from './public/challenge.js';
import {filesView} from './public/files.js';
import {student2Content} from './private-content/student-2.mjs';
const code=(await readFile('public/study.js','utf8')).replace(/^import .*;\n/gm,'').replace(/boot\(\);setInterval[^\n]*$/m,'');
const seed=JSON.parse((await readFile('supabase/student-1.sql','utf8')).split('$content$')[1]);
function fixture(){
 const nodes=new Map(),element=()=>({innerHTML:'',textContent:'',content:'',style:{},value:'',dataset:{},tagName:'MAIN',querySelector:()=>null,classList:{add(){},remove(){}},addEventListener(){},focus(){},showModal(){this.open=true;},close(){this.open=false;},getBoundingClientRect(){return {left:0,right:500,top:0,bottom:700};}});
 const get=s=>{if(!nodes.has(s))nodes.set(s,element());return nodes.get(s);};
 const document={documentElement:{dataset:{}},querySelector:get,querySelectorAll:()=>[],addEventListener(){},activeElement:element()};
 let stored=null;const storage={getItem:()=>stored,setItem:(_,v)=>stored=v};
 const context=vm.createContext({document,window:{localStorage:storage,addEventListener(){},scrollTo(){},print(){}},location:{hash:''},filesView,dailyCards,challengeView,awardMessage,themes,readContent,scopedStorage,...progressHelpers,setTimeout:()=>0,clearTimeout(){},setInterval:()=>0,crypto,console});
 vm.runInContext(code,context);vm.runInContext(`enterWorkspace(${JSON.stringify({user:{id:'one'},display_name:'Lauren',content:seed})})`,context);return {context,nodes,get};
}
test('assigned study pages render in all available themes with uploads only in My files',()=>{
 const {context,get}=fixture();
 for(const theme of themes)for(const page of ['home','revision','flashcards','focus','syllabus','files']){
  vm.runInContext(`progress.theme=${JSON.stringify(theme.id)};page=${JSON.stringify(page)};render()`,context);
  const html=get('#app').innerHTML;assert.match(html,/Sign out/);assert.doesNotMatch(html,/No sign-in needed/);if(page==='files')assert.match(html,/type="file"/);else assert.doesNotMatch(html,/type="file"/);
  if(page==='syllabus'){assert.match(html,/Numbers to 100 000/);assert.match(html,/Digestive system/);}
 }
});
test('Student 2 gets pending syllabus pages and a separate focus corner',()=>{const {context,get}=fixture();vm.runInContext(`enterWorkspace(${JSON.stringify({user:{id:'two'},display_name:'Caleb',content:{version:1,pending:true,subjects:[],topics:[],cards:[],resources:[],focusPrompt:'Choose your own school task.'}})})`,context);for(const p of ['revision','flashcards','syllabus','focus']){vm.runInContext(`page='${p}';render()`,context);const html=get('#app').innerHTML;assert.match(html,/Caleb/);assert.doesNotMatch(html,/Lauren|Numbers to 100 000|mcq.sg/);if(p==='focus')assert.match(html,/Choose your own school task/);}});
test('Student 2 supplied plan has its own topics, exams, assessments and resources',()=>{
 assert.equal(student2Content.topics.filter(t=>t.subject==='maths').length,14);
 assert.equal(student2Content.topics.filter(t=>t.subject==='science').length,12);
 assert.equal(student2Content.cards.length,110);
 assert.equal(student2Content.resources.some(r=>r.id==='magnets'),true);
 for(const subject of ['maths','science'])assert.equal(student2Content.assessments.filter(a=>a.subject===subject).reduce((n,a)=>n+a.weight,0),100);
 const {context,get}=fixture();vm.runInContext(`enterWorkspace(${JSON.stringify({user:{id:'two'},display_name:'Caleb',content:student2Content})})`,context);
 for(const p of ['home','revision','flashcards','focus','syllabus']){vm.runInContext(`page='${p}';render()`,context);assert.match(get('#app').innerHTML,/Caleb/);assert.doesNotMatch(get('#app').innerHTML,/Lauren|Your next chapter is on its way/);}
 const html=get('#app').innerHTML;assert.match(html,/2 November 2026/);assert.match(html,/3 November 2026/);assert.match(html,/Fractions \(II\)/);assert.match(html,/Effects of Heat/);assert.match(html,/Performance task with rubrics/);assert.match(html,/P3 Inspiring Science/);assert.match(html,/Life Cycles of Plants/);assert.match(html,/MOE/);assert.doesNotMatch(html,/protractor|15 short-answer/);
});
test('search and saved filters, flashcard reveal and focus completion behave correctly',()=>{
 const {context,get}=fixture();
 const filtered=vm.runInContext("subject='science';search='heat';resourceResults()",context);assert.match(filtered,/Heat: compare/);assert.doesNotMatch(filtered,/Decimals in word/);
 assert.match(vm.runInContext("onlySaved=true;progress.favourites=[];resourceResults()",context),/No little discoveries/);
 const saved=vm.runInContext("progress.favourites=['heat'];resourceResults()",context);assert.match(saved,/Heat: compare/);
 vm.runInContext("page='flashcards';cardMode='library';rebuildDeck();action('flip')",context);assert.match(get('#app').innerHTML,/7\/20 is left/);
 vm.runInContext("reviewOnly=true;progress.known=cards.map(c=>c.id);rebuildDeck();render()",context);assert.match(get('#app').innerHTML,/Looking familiar/);
 vm.runInContext("page='focus';progress.timer={mode:'focus',duration:600,remaining:600,endAt:Date.now()-1000};tick();tick()",context);assert.equal(vm.runInContext('progress.focusSessions',context),1);assert.equal(vm.runInContext('today().focus',context),true);
 vm.runInContext("progress.notes='<img src=x onerror=alert(1)>';render()",context);assert.match(get('#app').innerHTML,/&lt;img/);assert.doesNotMatch(get('#app').innerHTML,/<img src=x/);
});

test('cloud focus completion retries safely and updates the shared board',async()=>{
 const {context,get}=fixture();
 vm.runInContext("page='focus';challenge={timer:async()=>({result:'awarded'}),board:async()=>[]};progress.timer={mode:'focus',duration:600,remaining:0,endAt:null,challengeId:'timer',challengePending:true}",context);
 await vm.runInContext('finishFocus()',context);
 assert.equal(vm.runInContext('progress.focusSessions',context),1);
 assert.equal(vm.runInContext('progress.timer.challengeId',context),undefined);
 assert.equal(vm.runInContext('progress.timer.challengePending',context),undefined);
 vm.runInContext("challenge={timer:async()=>{throw Error('offline')},board:async()=>[]};progress.timer={mode:'focus',duration:600,remaining:0,endAt:null,challengeId:'retry',challengePending:true}",context);
 await vm.runInContext('finishFocus()',context);assert.equal(vm.runInContext('progress.timer.challengePending',context),true);assert.match(get('#app').innerHTML,/Retry saving points/);
 vm.runInContext("challenge.timer=async()=>({result:'already'})",context);await vm.runInContext('finishFocus()',context);assert.equal(vm.runInContext('progress.focusSessions',context),2);
});
test('server remaining time defeats local clock changes and start retry preserves session ID',async()=>{
 const {context}=fixture();vm.runInContext("challenge={timer:async()=>({result:'waiting',state:'running',remaining:500}),board:async()=>[]};progress.timer={mode:'focus',duration:600,remaining:0,endAt:null,challengeId:'timer',challengePending:true}",context);
 await vm.runInContext('finishFocus()',context);assert.equal(vm.runInContext('progress.timer.remaining',context),500);assert.equal(vm.runInContext('progress.focusSessions',context),0);
 vm.runInContext("progress.timer={mode:'focus',duration:600,remaining:600,endAt:null};challenge.timer=async()=>{throw Error('offline')}",context);await vm.runInContext('toggleFocusTimer()',context);const id=vm.runInContext('progress.timer.challengeId',context);assert.ok(id);assert.equal(vm.runInContext('progress.timer.challengeStarting',context),true);
 vm.runInContext("challenge.timer=async()=>({state:'running',remaining:590})",context);await vm.runInContext('toggleFocusTimer()',context);assert.equal(vm.runInContext('progress.timer.challengeId',context),id);assert.equal(vm.runInContext('progress.timer.remaining',context),590);
});
test('late point response cannot update another signed-in account',async()=>{
 const {context}=fixture();let resolve;context.late=new Promise(r=>resolve=r);vm.runInContext("challenge={revision:()=>late,board:async()=>[]}",context);const request=vm.runInContext("recordRevision('heat')",context);
 vm.runInContext("profile={user:{id:'two'},display_name:'Caleb'};challenge=null;progress=freshProgress()",context);resolve('awarded');await request;assert.equal(vm.runInContext('today().practice',context),false);
});

test('Flip & Learn defaults to daily cards, filters within the set and refreshes a stale day',()=>{
 const {context,get}=fixture();vm.runInContext("page='flashcards';render()",context);assert.match(get('#app').innerHTML,/Today’s 10 cards/);assert.equal(vm.runInContext('deck.length',context),10);
 const todayIds=vm.runInContext('deck.map(c=>c.id).join()',context);
 vm.runInContext("cardSubject='science';rebuildDeck()",context);assert.equal(vm.runInContext('deck.length',context),5);assert.equal(vm.runInContext("deck.every(c=>c.subject==='science')",context),true);
 vm.runInContext("cardSubject='all';rebuildDeck();progress.known=[deck[0].id];reviewOnly=true;rebuildDeck()",context);assert.equal(vm.runInContext('deck.length',context),9);
 vm.runInContext("reviewOnly=false;cardIndex=5;revealed=true;deckDay='2000-01-01';tick()",context);assert.equal(vm.runInContext('cardIndex',context),0);assert.equal(vm.runInContext('revealed',context),false);assert.equal(vm.runInContext('deck.map(c=>c.id).join()',context),todayIds);
 vm.runInContext("cardMode='library';rebuildDeck();render()",context);assert.equal(vm.runInContext('deck.length',context),102);assert.match(get('#app').innerHTML,/Full library \(102\)/);
});
