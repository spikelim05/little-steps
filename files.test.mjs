import {test} from 'node:test';
import assert from 'node:assert/strict';
import {readFile} from 'node:fs/promises';
import {StudentFiles,validateFile,FILE_LIMIT,mountFiles} from './public/files.js';
function mock({user='lauren',failure=false,pages=[[]]}={}){
 const calls=[],bucket={
  list:async(prefix,options)=>{calls.push(['list',prefix,options]);return {data:pages[options.offset/100]||[],error:failure};},
  upload:async(...args)=>{calls.push(['upload',...args]);return {error:failure};},
  createSignedUrl:async(...args)=>{calls.push(['link',...args]);return {data:{signedUrl:'https://example.com/signed'},error:failure};},
  remove:async(...args)=>{calls.push(['remove',...args]);return {error:failure};}
 };
 return {calls,client:{auth:{getUser:async()=>({data:{user:{id:user}}})},storage:{from:name=>{assert.equal(name,'student-files');return bucket;}}}};
}
test('uploads validate file type and size before contacting storage',async()=>{
 const {client,calls}=mock(),service=new StudentFiles(client,'lauren');
 for(const file of [{name:'notes.html',type:'text/html',size:12},{name:'notes.pdf',type:'text/html',size:12},{name:'empty.pdf',size:0},{name:'large.png',type:'image/png',size:FILE_LIMIT+1}])await assert.rejects(()=>service.upload(file));
 assert.equal(calls.length,0);
 assert.equal(validateFile({name:'notes.PDF',size:FILE_LIMIT,type:''}).type,'application/pdf');
 const file={name:'My notes.pdf',type:'application/pdf',size:42};
 await service.upload(file);await service.upload(file);
 assert.match(calls[0][1],/^lauren\/[0-9a-f-]+__My_notes.pdf$/);
 assert.notEqual(calls[0][1],calls[1][1]);
 assert.deepEqual(calls[0][3],{contentType:'application/pdf',upsert:false});
});
test('files paginate, scope paths, expire links, and delete through Storage API',async()=>{
 const {client,calls}=mock({pages:[Array.from({length:100},(_,i)=>({id:String(i),name:`file${i}.pdf`})),[{id:'last',name:'last.pdf'}]]});
 const service=new StudentFiles(client,'lauren');assert.equal((await service.list()).length,101);
 assert.deepEqual(calls.slice(0,2).map(c=>[c[1],c[2].offset]),[['lauren',0],['lauren',100]]);
 await service.link('notes.pdf');await service.remove('notes.pdf');
 assert.deepEqual(calls[2],['link','lauren/notes.pdf',60]);assert.deepEqual(calls[3],['remove',['lauren/notes.pdf']]);
 for(const name of ['../other.pdf','caleb/notes.pdf','..','folder\\file'])await assert.rejects(()=>service.link(name),/Invalid file/);
});
test('changed sessions and provider failures do not report success',async()=>{
 const changed=mock({user:'caleb'}),service=new StudentFiles(changed.client,'lauren');
 for(const action of [()=>service.list(),()=>service.upload({name:'a.pdf',size:10,type:'application/pdf'}),()=>service.link('a.pdf'),()=>service.remove('a.pdf')])await assert.rejects(action,/session changed/);
 assert.equal(changed.calls.length,0);
 const failed=new StudentFiles(mock({failure:true}).client,'lauren');
 await assert.rejects(()=>failed.list(),/could not load/);await assert.rejects(()=>failed.link('a.pdf'),/could not open/);await assert.rejects(()=>failed.remove('a.pdf'),/could not be deleted/);await assert.rejects(()=>failed.upload({name:'a.pdf',size:10}),/Upload failed/);
});
test('files UI escapes names and discards responses after leaving the account',async()=>{
 function fixture(){const nodes=new Map();return {isConnected:true,querySelector:s=>{if(!nodes.has(s))nodes.set(s,{innerHTML:'',textContent:''});return nodes.get(s);},querySelectorAll:()=>[]};}
 const root=fixture();let resolve;const promise=new Promise(r=>resolve=r);
 mountFiles(root,{list:()=>promise},()=>true);root.isConnected=false;resolve([{id:'1',name:'private.pdf'}]);await new Promise(r=>setImmediate(r));assert.equal(root.querySelector('#files-list').innerHTML,'');
 const live=fixture();mountFiles(live,{list:async()=>[{id:'2',name:'<img onerror=bad>.pdf',metadata:{size:10}}]},()=>true);await new Promise(r=>setImmediate(r));assert.match(live.querySelector('#files-list').innerHTML,/&lt;img/);assert.doesNotMatch(live.querySelector('#files-list').innerHTML,/<img/);
});
test('storage setup is private, size limited and bounded by authenticated account',async()=>{
 const sql=await readFile('supabase/storage.sql','utf8');
 assert.match(sql,/'student-files','student-files',false,5242880/);
 assert.match(sql,/as restrictive/);assert.match(sql,/for all to anon/);
 assert.match(sql,/exists\(select 1 from public.student_spaces where user_id=\(select auth.uid\(\)\)\)/);
 for(const operation of ['select','insert','delete'])assert.match(sql,new RegExp('for '+operation+' to authenticated'));
 assert.doesNotMatch(sql,/for update|public=true/);
});
