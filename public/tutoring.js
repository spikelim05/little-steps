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
 remove(id){return this.call('tutor_delete_item',{item_id:id});}
 complete(id,done){return this.call('student_complete_task',{item_id:id,is_complete:done});}
}
export function itemCards(items,{tutor=false,students=[]}={}){
 const e=escapeHtml;
 if(!items.length)return '<section class="panel empty-state"><span>✉</span><h2>A little space for guidance</h2><p>No items here yet. Tasks, notes, feedback and useful links will appear here.</p></section>';
 return items.map(x=>`<article class="panel guidance-card"><div class="section-title"><span class="pill">${e(x.kind)}${tutor?' · '+e(students.find(s=>s.id===x.student_id)?.name||'Student'):''}</span><small>${e(String(x.created_at).slice(0,10))}</small></div><h2>${e(x.title)}</h2>${x.body?`<p class="guidance-body">${e(x.body)}</p>`:''}${safeLink(x.url)?`<a class="button secondary" href="${e(safeLink(x.url))}" target="_blank" rel="noopener noreferrer">Open revision link ↗</a>`:''}${x.kind==='task'?`<p class="muted">${x.due_on?'Due '+e(x.due_on)+' · ':''}${x.completed_at?'Done · student-reported':'To do'}</p>`:''}<div class="guidance-actions">${tutor?`<button class="text-button" data-edit-item="${e(x.id)}">Edit</button><button class="text-button" data-delete-item="${e(x.id)}">Remove</button>`:x.kind==='task'?`<button class="button ${x.completed_at?'secondary':'primary'}" data-complete-item="${e(x.id)}" data-done="${!x.completed_at}">${x.completed_at?'Mark as to do':'I’ve finished this ✓'}</button>`:''}</div></article>`).join('');
}
export function tutorInboxView(){return '<div class="page-intro"><div><div class="eyebrow">A LITTLE GUIDANCE, JUST FOR YOU</div><h1>From my tutor <span class="heading-spark">✉</span></h1><p>Your tasks, encouraging feedback, notes and revision links.</p></div></div><div id="tutor-inbox"><button class="text-button" id="inbox-refresh">Refresh</button><p role="status" id="inbox-status">Loading…</p><div id="inbox-items" class="guidance-grid"></div></div>';}
export function mountInbox(root,service,isCurrent){
 let busy=false;const status=root.querySelector('#inbox-status'),list=root.querySelector('#inbox-items'),refreshButton=root.querySelector('#inbox-refresh');
 async function refresh(){if(busy||!isCurrent())return;busy=true;refreshButton.disabled=true;
  try{const items=await service.inbox();if(!isCurrent())return;list.innerHTML=itemCards(items);status.textContent='Saved online · Your tutor can see completed tasks. Task ticks do not add challenge points.';
   list.querySelectorAll('[data-complete-item]').forEach(button=>button.onclick=async()=>{
    if(busy)return;busy=true;button.disabled=true;
    try{await service.complete(button.dataset.completeItem,button.dataset.done==='true');if(!isCurrent())return;busy=false;await refresh();}
    catch(e){if(isCurrent()){status.textContent=e.message;button.disabled=false;}}finally{busy=false;}
   });
  }catch(e){if(isCurrent()){list.innerHTML='';status.textContent=e.message;}}finally{busy=false;if(isCurrent())refreshButton.disabled=false;}
 }
 refreshButton.onclick=refresh;refresh();return refresh;
}
