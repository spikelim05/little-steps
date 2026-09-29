import {validateFile} from './files.js';
export const escapeHtml=v=>String(v??'').replace(/[&<>"']/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
export function safeLink(value){try{const u=new URL(value);return u.protocol==='https:'&&!u.username&&!u.password?u.href:'';}catch{return '';}}
export class Tutoring {
 constructor(client,userId){this.client=client;this.userId=userId;}
 async call(name,args={}){
  const {data,error}=await this.client.auth.getUser();
  if(error||data?.user?.id!==this.userId)throw Error('Please sign in again.');
  const result=await this.client.rpc(name,args);
  if(result.error)throw Error(result.error.code==='PGRST202'?'The tutor workspace needs its one-time Supabase setup.':result.error.code==='P0001'?result.error.message:'Unable to save or load. Check your connection and try again.');
  return result.data;
 }
 workspace(){return this.call('tutor_workspace');}
 inbox(){return this.call('student_tutor_items');}
 save(draft){
  const link=draft.url.trim();if(link&&!safeLink(link))throw Error('Use a full https:// link without a username or password.');
  return this.call('tutor_save_item',{item_id:draft.id,recipient:draft.student_id,item_kind:draft.kind,item_title:draft.title.trim(),item_body:draft.body,item_url:link,due_date:draft.kind==='task'?(draft.due_on||null):null});
 }
 async remove(id){
  const files=await this.call('tutor_item_files',{item_id:id});
  for(const file of files)await this.removeAttachment(file.path);
  return this.call('tutor_delete_item',{item_id:id});
 }
 async verifyFiles(){const {data,error}=await this.client.auth.getUser();if(error||data?.user?.id!==this.userId)throw Error('Please sign in again before using attachments.');}
 filePath(path,writing=false){
  if(typeof path!=='string'||!/^([0-9a-f-]{36})\/([0-9a-f-]{36})\/[^/\\]+$/i.test(path)||writing&&path.split('/')[0]!==this.userId)throw Error('Invalid attachment.');
  return path;
 }
 async uploadAttachments(draft){
  for(const entry of draft.pendingFiles||[]){
   if(entry.uploaded)continue;
   const {type,name}=validateFile(entry.file);await this.verifyFiles();
   entry.path||=`${this.userId}/${draft.id}/${crypto.randomUUID()}__${name}`;
   const {error}=await this.client.storage.from('guidance-files').upload(this.filePath(entry.path,true),entry.file,{contentType:type,upsert:true});
   if(error)throw Error('Guidance was saved, but a file did not upload. Keep this page open and press Save changes to retry. Check your connection and the guidance file setup.');
   entry.uploaded=true;draft.attachments??=[];
   if(!draft.attachments.some(f=>f.path===entry.path))draft.attachments.push({path:entry.path,name,size:entry.file.size});
  }
 }
 async attachmentLink(path){await this.verifyFiles();const {data,error}=await this.client.storage.from('guidance-files').createSignedUrl(this.filePath(path),60);if(error||!data?.signedUrl)throw Error('This attachment could not open. Refresh and try again.');return data.signedUrl;}
 async removeAttachment(path){await this.verifyFiles();const {error}=await this.client.storage.from('guidance-files').remove([this.filePath(path,true)]);if(error)throw Error('The attachment could not be removed. Check your connection and try again.');}
 complete(id,done){return this.call('student_complete_task',{item_id:id,is_complete:done});}
}
export function attachmentView(files=[],removable=false){return files.length?`<div class="guidance-attachments"><strong>Attached files</strong>${files.map(f=>`<div class="guidance-attachment"><span>${escapeHtml(f.name)}${f.size?` <small>(${(Number(f.size)/1024/1024).toFixed(2)} MB)</small>`:''}</span><button type="button" class="text-button" data-guidance-file="${escapeHtml(f.path)}">Open file ↗</button>${removable?`<button type="button" class="text-button" data-remove-attachment="${escapeHtml(f.path)}">Remove file</button>`:''}</div>`).join('')}</div>`:'';}
export function bindAttachmentLinks(root,service,isCurrent,status){
 root.querySelectorAll('[data-guidance-file]').forEach(button=>button.onclick=async()=>{
  button.disabled=true;
  try{const url=await service.attachmentLink(button.dataset.guidanceFile);if(!isCurrent())return;
   const a=document.createElement('a');a.href=url;a.target='_blank';a.rel='noopener noreferrer';a.textContent='Open attachment (link expires in 1 minute)';status.replaceChildren(a);a.click();
  }catch(e){if(isCurrent())status.textContent=e.message;}finally{if(isCurrent())button.disabled=false;}
 });
}
export function itemCards(items,{tutor=false,students=[]}={}){
 const e=escapeHtml;
 if(!items.length)return '<section class="panel empty-state"><span>✉</span><h2>A little space for guidance</h2><p>No items here yet. Tasks, notes, feedback and useful links will appear here.</p></section>';
 return items.map(x=>`<article class="panel guidance-card"><div class="section-title"><span class="pill">${e(x.kind)}${tutor?' · '+e(students.find(s=>s.id===x.student_id)?.name||'Student'):''}</span><small>${e(String(x.created_at).slice(0,10))}</small></div><h2>${e(x.title)}</h2>${x.body?`<p class="guidance-body">${e(x.body)}</p>`:''}${safeLink(x.url)?`<a class="button secondary" href="${e(safeLink(x.url))}" target="_blank" rel="noopener noreferrer">Open revision link ↗</a>`:''}${attachmentView(x.attachments)}${x.kind==='task'?`<p class="muted">${x.due_on?'Due '+e(x.due_on)+' · ':''}${x.completed_at?'Done · student-reported':'To do'}</p>`:''}<div class="guidance-actions">${tutor?`<button class="text-button" data-edit-item="${e(x.id)}">Edit</button><button class="text-button" data-delete-item="${e(x.id)}">Remove</button>`:x.kind==='task'?`<button class="button ${x.completed_at?'secondary':'primary'}" data-complete-item="${e(x.id)}" data-done="${!x.completed_at}">${x.completed_at?'Mark as to do':'I’ve finished this ✓'}</button>`:''}</div></article>`).join('');
}
export function tutorInboxView(){return '<div class="page-intro"><div><div class="eyebrow">A LITTLE GUIDANCE, JUST FOR YOU</div><h1>From my tutor <span class="heading-spark">✉</span></h1><p>Your tasks, encouraging feedback, notes and revision links.</p></div></div><div id="tutor-inbox"><button class="text-button" id="inbox-refresh">Refresh</button><p role="status" id="inbox-status">Loading…</p><div id="inbox-items" class="guidance-grid"></div></div>';}
export function mountInbox(root,service,isCurrent){
 let busy=false;const status=root.querySelector('#inbox-status'),list=root.querySelector('#inbox-items'),refreshButton=root.querySelector('#inbox-refresh');
 async function refresh(){if(busy||!isCurrent())return;busy=true;refreshButton.disabled=true;
  try{const items=await service.inbox();if(!isCurrent())return;list.innerHTML=itemCards(items);status.textContent='Saved online · Your tutor can see completed tasks. Task ticks do not add challenge points.';
   bindAttachmentLinks(list,service,isCurrent,status);
   list.querySelectorAll('[data-complete-item]').forEach(button=>button.onclick=async()=>{
    if(busy)return;busy=true;button.disabled=true;
    try{await service.complete(button.dataset.completeItem,button.dataset.done==='true');if(!isCurrent())return;busy=false;await refresh();}
    catch(e){if(isCurrent()){status.textContent=e.message;button.disabled=false;}}finally{busy=false;}
   });
  }catch(e){if(isCurrent()){list.innerHTML='';status.textContent=e.message;}}finally{busy=false;if(isCurrent())refreshButton.disabled=false;}
 }
 refreshButton.onclick=refresh;refresh();return refresh;
}
