// Requires the optional test engine installed as described in WEEKLY_CHALLENGE_SETUP.md.
import assert from 'node:assert/strict';
import {readFile} from 'node:fs/promises';
const {PGlite}=await import('../data/sql-check/node_modules/@electric-sql/pglite/dist/index.js');
const db=new PGlite();
await db.exec(`create schema auth;create table auth.users(id integer primary key,email text);
create table public.student_spaces(user_id integer primary key,display_name text,content jsonb,updated_at timestamptz);
insert into auth.users values(1,'laurenp4@students.little-steps.invalid'),(2,'calebp4@students.little-steps.invalid');
insert into public.student_spaces values(1,'Lauren','{"cards":[],"exams":{"date":"keep"},"topics":["keep"]}',now());`);
const sql=await readFile('supabase/daily-flashcards.sql','utf8');
await assert.rejects(()=>db.exec(sql),/Missing learning space for calebp4/);await db.exec('rollback');
assert.deepEqual((await db.query('select content from public.student_spaces where user_id=1')).rows[0].content.cards,[]);
await db.exec(`insert into public.student_spaces values(2,'Caleb','{"cards":[],"exams":{"date":"keep"},"topics":["keep"]}',now());`);
await db.exec(sql);await db.exec(sql);
const rows=(await db.query('select * from public.student_spaces order by user_id')).rows;
assert.equal(rows[0].content.cards.length,102);assert.equal(rows[1].content.cards.length,110);
for(const row of rows){assert.deepEqual(row.content.exams,{date:'keep'});assert.deepEqual(row.content.topics,['keep']);}
assert.deepEqual(rows.map(r=>r.display_name),['Lauren','Caleb']);
await db.close();console.log('Flashcard SQL passed: correct banks, safe reruns, rollback on missing account, and other content preserved.');
