// Optional real SQL verification in an isolated in-memory PostgreSQL engine.
// npm install --prefix data/sql-check --no-save --package-lock=false @electric-sql/pglite
// node scripts/check-challenge-db.mjs
import assert from 'node:assert/strict';
import {readFile} from 'node:fs/promises';
const {PGlite}=await import('../data/sql-check/node_modules/@electric-sql/pglite/dist/index.js');
const db=new PGlite();
const lauren='00000000-0000-4000-8000-000000000001',caleb='00000000-0000-4000-8000-000000000002',outsider='00000000-0000-4000-8000-000000000003';
const session=n=>`10000000-0000-4000-8000-${String(n).padStart(12,'0')}`;
await db.exec(`create role anon;create role authenticated;create schema auth;
create table auth.users(id uuid primary key,email text);
create function auth.uid() returns uuid language sql stable as $$ select nullif(current_setting('request.jwt.claim.sub',true),'')::uuid $$;
grant usage on schema auth,public to anon,authenticated;grant execute on function auth.uid() to anon,authenticated;`);
await db.exec(await readFile('supabase/schema.sql','utf8'));
for(const [id,email] of [[lauren,'laurenp4'],[caleb,'calebp4'],[outsider,'other']]){
 await db.query('insert into auth.users values($1,$2)',[id,email+'@students.little-steps.invalid']);
 await db.query('insert into public.student_spaces(user_id,display_name,content) values($1,$2,$3)',[id,'Student',JSON.stringify({resources:['a','b','c','d'].map(id=>({id}))})]);
}
const migration=await readFile('supabase/competition.sql','utf8');await db.exec(migration);await db.exec(migration);
async function as(id){await db.exec('reset role');await db.query("select set_config('request.jwt.claim.sub',$1,false)",[id]);await db.exec('set role authenticated');}
const board=async()=>(await db.query('select * from public.challenge_board()')).rows;
const revise=async id=>(await db.query('select public.challenge_revision($1) as result',[id])).rows[0].result;
const timer=async(cmd,n,seconds=null)=>(await db.query('select public.challenge_timer($1,$2,$3) as result',[cmd,session(n),seconds])).rows[0].result;
async function advance(n,seconds){await db.exec('reset role');await db.query("update public.challenge_focus set started_at=now()-($2::text||' seconds')::interval where id=$1",[session(n),seconds]);await as(lauren);}
await as(lauren);
assert.deepEqual((await board()).map(r=>r.display_name).sort(),['Caleb','Lauren']);
assert.equal(await revise('a'),'awarded');assert.equal(await revise('a'),'already');
await assert.rejects(()=>revise('unknown'));
assert.equal(await revise('b'),'awarded');assert.equal(await revise('c'),'awarded');assert.equal(await revise('d'),'limit');
assert.equal(Number((await board()).find(r=>r.is_you).points),30);
await assert.rejects(()=>db.query('select * from public.challenge_events'));
await assert.rejects(()=>db.query('select * from public.challenge_members'));
await assert.rejects(()=>db.query('update public.student_spaces set display_name=\'Cheat\''));
await assert.rejects(()=>timer('start',99,1));
await timer('start',1,600);assert.equal((await timer('finish',1)).result,'waiting');
await advance(1,300);const paused=await timer('pause',1);assert.equal(paused.state,'paused');assert.ok(paused.remaining>290&&paused.remaining<=300);
assert.equal((await timer('finish',1)).result,'waiting');await timer('resume',1);await advance(1,301);
assert.equal((await timer('finish',1)).result,'awarded');assert.equal((await timer('finish',1)).result,'already');
for(const n of [2,3,4]){await timer('start',n,600);await advance(n,601);assert.equal((await timer('finish',n)).result,n===4?'limit':'awarded');}
await timer('start',5,600);await timer('start',6,600);await assert.rejects(()=>timer('finish',5),/newer focus/);
await as(caleb);assert.equal(Number((await board()).find(r=>r.is_you).points),0);await assert.rejects(()=>timer('finish',6),/unavailable/);assert.equal(await revise('a'),'awarded');
await as(outsider);await assert.rejects(board,/not enrolled/);await assert.rejects(()=>revise('a'),/not enrolled/);
await db.exec('reset role;set role anon');await assert.rejects(board,/permission denied/);
await db.exec('reset role');
await db.query("insert into public.challenge_events values($1,date_trunc('week',timezone('Asia/Singapore',now()))::date-1,'revision','old-week')",[lauren]);
await as(lauren);const rows=await board(),me=rows.find(r=>r.is_you);
assert.equal(Number(me.points),60);assert.equal(Number(me.revision_count),3);assert.equal(Number(me.focus_count),3);
assert.deepEqual(Object.keys(me).sort(),['display_name','focus_count','is_you','points','revision_count','week_start']);

await db.exec('reset role');
await db.exec(await readFile('supabase/tutor.sql','utf8'));
await db.exec(await readFile('supabase/tutor.sql','utf8'));
await as(lauren);await assert.rejects(()=>db.query('select public.tutor_dashboard()'));
await assert.rejects(()=>db.query('select * from public.tutor_students'));
await assert.rejects(()=>db.query('insert into public.tutor_students values($1,$2)',[lauren,caleb]));
await db.exec('reset role');
await db.query('insert into public.tutor_students values($1,$2)',[outsider,lauren]);
await as(outsider);
const dash=(await db.query('select public.tutor_dashboard() as data')).rows[0].data;
assert.equal(dash.students.length,1);assert.equal(dash.students[0].name,'Lauren');
assert.equal(dash.students[0].weekly_points,60);assert.equal(dash.students[0].revision_total,4);
assert.equal(dash.students[0].focus_total,4);assert.equal(dash.students[0].focus_minutes,40);
await db.exec('reset role;set role anon');await assert.rejects(()=>db.query('select public.tutor_dashboard()'));
await db.exec('reset role;alter table auth.users add column email_confirmed_at timestamptz');
const assignment=await readFile('supabase/assign-tutor.sql','utf8');
await assert.rejects(()=>db.exec(assignment),/Auto Confirm/);await db.exec('rollback');
const tutorId='00000000-0000-4000-8000-000000000004';
await db.query('insert into auth.users values($1,$2,now())',[tutorId,'tutor@students.little-steps.invalid']);
await db.exec(assignment);await db.exec(assignment);await as(tutorId);
assert.equal((await db.query('select public.tutor_dashboard() as data')).rows[0].data.students.length,2);
await db.close();console.log('Tutor SQL checks passed: denied student/anonymous access, assignment isolation, totals, migration reruns.');
