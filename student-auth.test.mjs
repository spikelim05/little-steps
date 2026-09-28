import {test} from 'node:test';
import assert from 'node:assert/strict';
import {readFile} from 'node:fs/promises';
import {StudentAuth,validConfig,scopedStorage,readContent} from './public/auth.js';
import {freshProgress,saveProgress,loadProgress} from './public/progress.js';
function client({id='one',rowId=id,assigned=true,error=false}={}){
 const calls=[];
 return {
  calls,
  auth:{signInWithPassword:async args=>{calls.push(args);return {error:error?Error():null};},getUser:async()=>({data:{user:{id}},error:null}),signOut:async()=>({error:null}),updateUser:async args=>{calls.push(args);return {error:null};}},
  from(table){
   assert.equal(table,'student_spaces');
   return {
    select(){return this;},
    eq(column,value){calls.push({column,value});return this;},
    async maybeSingle(){return {data:assigned?{user_id:rowId,display_name:'Student',content:{version:1,subjects:[],topics:[],cards:[],resources:[]}}:null,error:null};}
   };
  }
 };
}
test('sign-in verifies user with provider and requests only the assigned row',async()=>{const c=client(),auth=new StudentAuth(c),space=await auth.signIn(' student@example.com ','password');assert.equal(space.user.id,'one');assert.deepEqual(c.calls[0],{email:'student@example.com',password:'password'});assert.deepEqual(c.calls[1],{column:'user_id',value:'one'});await assert.rejects(()=>new StudentAuth(client({error:true})).signIn('email','bad'),/Unable to sign in/);});
test('unassigned or mismatched learning spaces fail closed',async()=>{await assert.rejects(()=>new StudentAuth(client({assigned:false})).loadSpace(),/not assigned/);await assert.rejects(()=>new StudentAuth(client({rowId:'two'})).loadSpace(),/not assigned/);});
test('two accounts on the same browser keep separate local notes, themes and progress',()=>{const map=new Map(),device={getItem:k=>map.get(k)||null,setItem:(k,v)=>map.set(k,v)},one=scopedStorage(device,'one'),two=scopedStorage(device,'two'),p=freshProgress();p.notes='Private note one';p.theme='space';p.completed=['heat'];saveProgress(one,p);assert.equal(loadProgress(two).notes,'');assert.equal(loadProgress(two).theme,'forest');assert.deepEqual(loadProgress(two).completed,[]);const p2=freshProgress();p2.notes='Private note two';saveProgress(two,p2);assert.equal(loadProgress(one).notes,'Private note one');assert.equal(loadProgress(two).notes,'Private note two');assert.throws(()=>scopedStorage(device,''));});
test('configuration rejects secret keys; unsafe resource links are not displayed',()=>{assert.equal(validConfig({supabaseUrl:'https://project.supabase.co',publishableKey:'sb_publishable_example'}),true);assert.equal(validConfig({supabaseUrl:'https://project.supabase.co',publishableKey:'sb_secret_example'}),false);const jwt=role=>'a.'+Buffer.from(JSON.stringify({role})).toString('base64url')+'.b';assert.equal(validConfig({supabaseUrl:'https://project.supabase.co',publishableKey:jwt('service_role')}),false);assert.equal(validConfig({supabaseUrl:'https://project.supabase.co',publishableKey:jwt('anon')}),true);const content=readContent({display_name:'S1',content:{version:1,subjects:[],topics:[],cards:[],resources:[{url:'javascript:alert(1)'},{url:'https://example.com'}]}});assert.equal(content.resources.length,1);});
test('database policy denies anonymous and write access and matches verified user ID',async()=>{const sql=await readFile('supabase/schema.sql','utf8');assert.match(sql,/enable row level security/);assert.match(sql,/force row level security/);assert.match(sql,/revoke all .* from anon, authenticated/);assert.match(sql,/grant select .* to authenticated/);assert.match(sql,/auth.uid\(\)\) = user_id/);assert.doesNotMatch(sql,/grant (insert|update|delete)/i);});
