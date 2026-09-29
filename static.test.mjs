import {test,before,after} from 'node:test';
import assert from 'node:assert/strict';
import {spawn} from 'node:child_process';
import {readFile,readdir} from 'node:fs/promises';
import {freshProgress,loadProgress,saveProgress,STORAGE_KEY,secondsLeft,singaporeDay} from './public/progress.js';
let server,previewPort;
before(async()=>{server=spawn(process.execPath,['server.mjs'],{env:{...process.env,PORT:'0'},stdio:['ignore','pipe','pipe']});await new Promise((resolve,reject)=>{server.stdout.once('data',data=>{previewPort=String(data).match(/localhost:(\d+)/)?.[1];resolve();});server.once('error',reject);server.once('exit',code=>reject(Error('Preview exited '+code)));});});
after(async()=>{if(server&&server.exitCode===null)await new Promise(resolve=>{server.once('exit',resolve);server.kill();});});
test('only static assets are served; private legacy files and write routes are unavailable',async()=>{
 const base='http://127.0.0.1:'+previewPort;
 for(const file of await readdir('public')){const response=await fetch(base+'/'+file);assert.equal(response.status,200,file);assert.match(response.headers.get('content-type'),/text\//);}
 for(const route of ['/api/auth','/api/state','/api/file/anything','/data/hub.json','/README.md','/server.mjs','/../data/hub.json','/curriculum.js','/revision.js','/study-data.js','/private-content/curriculum.mjs','/supabase/student-1.sql'])assert.equal((await fetch(base+route)).status,404,route);
 assert.equal((await fetch(base+'/api/submissions',{method:'POST',body:'{}'})).status,405);
 const html=await(await fetch(base)).text();assert.match(html,/src="\.\/study.js"/);assert.match(html,/href="\.\/study.css"/);
 const source=await readFile('public/study.js','utf8');assert.doesNotMatch(source,/\.\/curriculum.js|\.\/revision.js|\.\/study-data.js|type="file"/);
});
test('progress survives reload, can opt out, and handles unavailable or corrupted storage',()=>{
 let saved=null;const storage={getItem:()=>saved,setItem:(_,v)=>saved=v};
 const p=freshProgress();p.completed=['heat'];p.known=['m1'];p.notes='Ask about fractions';p.theme='space';p.confidence.m1='confident';assert.equal(saveProgress(storage,p),true);assert.equal(loadProgress(storage).notes,p.notes);assert.equal(loadProgress(storage).theme,'space');
 p.remember=false;saveProgress(storage,p);assert.ok(!saved.includes('Ask about fractions'));assert.deepEqual(loadProgress(storage).completed,[]);assert.equal(loadProgress(storage).theme,'space');assert.equal(loadProgress(storage).remember,false);
 saved='{bad';assert.equal(loadProgress(storage).theme,'forest');
 saved=JSON.stringify({version:1,theme:'invalid',known:[1,null,'s1'],timer:{mode:'focus',duration:-1},confidence:{a:'invalid'}});const safe=loadProgress(storage);assert.equal(safe.theme,'forest');assert.equal(safe.timer,null);assert.deepEqual(safe.known,['s1']);assert.deepEqual(safe.confidence,{});
 const denied={getItem(){throw Error('blocked');},setItem(){throw Error('quota');}};assert.equal(loadProgress(denied).theme,'forest');assert.equal(saveProgress(denied,p),false);assert.equal(STORAGE_KEY,'little-steps-static-v1');
});
test('focus timer uses elapsed time, supports pause and catches up after sleep',()=>{
 const t={duration:1200,remaining:1200,endAt:1210000,mode:'focus'};
 assert.equal(secondsLeft(t,10000),1200);assert.equal(secondsLeft(t,70000),1140);assert.equal(secondsLeft(t,1300000),0);
 assert.equal(secondsLeft({...t,endAt:null,remaining:237},99999999),237);
 assert.equal(singaporeDay(new Date('2026-09-27T16:01:00Z')),'2026-09-28');
});
