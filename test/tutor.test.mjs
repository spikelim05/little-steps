import {test} from 'node:test';
import assert from 'node:assert/strict';
import {tutorView,materialView,composeView,mountTutor} from '../public/tutor.js';
import {Tutoring,itemCards,safeLink,mountInbox} from '../public/tutoring.js';
import {StudentAuth} from '../public/auth.js';
test('tutor view escapes names and shows capped progress with honest activity labels',()=>{
 const html=tutorView({week_start:'2026-09-28',students:[{name:'<script>',weekly_points:130,revision_total:4,focus_total:5,focus_minutes:50,last_scored_day:null,days:[]}]});
 assert.ok(!html.includes('<script>'));assert.ok(html.includes('value="100"'));assert.ok(html.includes('130 / 100'));assert.ok(html.includes('not quiz scores'));assert.ok(html.includes('No activity recorded yet'));
});
test('tutor login requires server-authorized dashboard access',async()=>{
 let allowed=false;
 const client={auth:{getUser:async()=>({data:{user:{id:'tutor'}}})},from:()=>({select:()=>({eq:()=>({maybeSingle:async()=>({data:null})})})}),rpc:async()=>allowed?{data:{students:[]}}:{error:{message:'denied'}}};
 const auth=new StudentAuth(client);await assert.rejects(()=>auth.loadSpace());allowed=true;assert.equal((await auth.loadSpace()).role,'tutor');
});

test('guidance service verifies identity, validates links and reports missing setup',async()=>{
 const calls=[];let id='tutor',failure=null;
 const service=new Tutoring({auth:{getUser:async()=>({data:{user:{id}}})},rpc:async(name,args)=>{calls.push({name,args});return {data:[],error:failure};}},'tutor');
 const draft={id:'item',student_id:'lauren',kind:'task',title:' Try fractions ',body:'Work carefully',url:'https://example.com',due_on:'2026-10-01'};
 await service.save(draft);assert.equal(calls[0].args.item_title,'Try fractions');assert.equal(calls[0].args.recipient,'lauren');assert.ok(!('tutor_id' in calls[0].args));
 await assert.rejects(async()=>service.save({...draft,url:'javascript:alert(1)'}),/https/);
 id='caleb';await assert.rejects(()=>service.inbox(),/sign in/);assert.equal(calls.length,1);
 id='tutor';failure={code:'PGRST202'};await assert.rejects(()=>service.workspace(),/one-time/);
});

test('guidance and materials escape text and reject unsafe links',()=>{
 const item={id:'1',kind:'task',title:'<script>',body:'<img>\nTry again',url:'javascript:alert(1)',created_at:'2026-09-29',student_id:'one',due_on:'2026-10-01'};
 const html=itemCards([item]);assert.ok(html.includes('&lt;script&gt;'));assert.ok(!html.includes('javascript:'));assert.ok(html.includes('data-done="true"'));
 const done=itemCards([{...item,completed_at:'2026-09-29'}]);assert.ok(done.includes('data-done="false"'));
 assert.equal(safeLink('https://user:password@example.com'),'');
 const student={id:'one',name:'Lauren',content:{resources:[{id:'heat',title:'Heat',url:'javascript:bad'}],cards:[{topic:'Matter',question:'<script>',answer:'Solid'}]}};
 assert.ok(!materialView(student,'resources').includes('javascript:'));assert.ok(materialView(student,'cards').includes('&lt;script&gt;'));
 assert.ok(composeView([student],{...item,editing:true}).includes('Save changes'));
});

const settle=()=>new Promise(resolve=>setImmediate(resolve));
test('student inbox discards stale account responses and keeps failed completion retryable',async()=>{
 const nodes=new Map();const button={dataset:{completeItem:'task',done:'true'},disabled:false};
 const root={querySelector:s=>{if(!nodes.has(s))nodes.set(s,{innerHTML:'',textContent:'',disabled:false,querySelectorAll:()=>[button]});return nodes.get(s);}};
 let current=true,finish,failed=true;
 const service={inbox:()=>new Promise(resolve=>finish=resolve),complete:async()=>{if(failed)throw Error('Offline');}};
 mountInbox(root,service,()=>current);current=false;finish([{title:'Private old data'}]);await settle();assert.equal(nodes.get('#inbox-items').innerHTML,'');
 current=true;mountInbox(root,service,()=>current);finish([{id:'task',kind:'task',title:'Fractions',created_at:'2026-09-29'}]);await settle();
 await button.onclick();assert.equal(button.disabled,false);assert.equal(nodes.get('#inbox-status').textContent,'Offline');
 failed=false;const saving=button.onclick();await settle();finish([{id:'task',kind:'task',title:'Fractions',completed_at:'2026-09-29',created_at:'2026-09-29'}]);await saving;
 assert.match(nodes.get('#inbox-items').innerHTML,/student-reported/);
});

test('tutor workspace uses student shell and never paints responses after sign-out',async()=>{
 const originalDoc=globalThis.document;globalThis.document={documentElement:{dataset:{}},querySelector:()=>({content:''}),hidden:false};
 const nodes=new Map(),root={innerHTML:'',querySelectorAll:()=>[],querySelector:s=>{if(s==='#guidance-form'||s==='#material-student')return null;if(!nodes.has(s))nodes.set(s,{disabled:false,textContent:'',focus(){}});return nodes.get(s);}};
 const replies=[];const auth={client:{auth:{getUser:async()=>({data:{user:{id:'tutor'}}})},rpc:name=>new Promise(resolve=>replies.push({name,resolve}))},signOut:async()=>{}};
 const dispose=mountTutor({root,auth,userId:'tutor',onSignOut(){}});
 try{await settle();assert.match(root.innerHTML,/class="sidebar"/);assert.match(root.innerHTML,/Give guidance/);const before=root.innerHTML;dispose();
  for(const r of replies)r.resolve({data:r.name==='tutor_dashboard'?{students:[],week_start:'2026-09-28'}:{students:[{id:'one',name:'Private result'}],items:[]}});
  await settle();assert.equal(root.innerHTML,before);
 }finally{dispose();globalThis.document=originalDoc;}
});
