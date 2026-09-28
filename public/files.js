export const FILE_LIMIT=5*1024*1024;
const types={pdf:'application/pdf',jpg:'image/jpeg',jpeg:'image/jpeg',png:'image/png',webp:'image/webp'};
export function validateFile(file){
 const ext=file?.name?.split('.').pop().toLowerCase(),type=types[ext];
 if(!type||file.type&&file.type!==type)throw Error('Choose a PDF, JPG, PNG or WebP file.');
 if(!file.size||file.size>FILE_LIMIT)throw Error('Choose a non-empty file no larger than 5 MB.');
 return {type,name:file.name.replace(/[^a-zA-Z0-9._-]/g,'_').slice(-120)};
}
export class StudentFiles {
 constructor(client,userId){this.client=client;this.userId=userId;this.bucket=client.storage.from('student-files');}
 async verify(){const {data,error}=await this.client.auth.getUser();if(error||data?.user?.id!==this.userId)throw Error('Your session changed. Sign in again before using files.');}
 path(name){if(!name||name.includes('/')||name.includes('\\')||name==='.'||name==='..')throw Error('Invalid file name.');return `${this.userId}/${name}`;}
 async list(){await this.verify();let files=[];for(let offset=0;;offset+=100){const {data,error}=await this.bucket.list(this.userId,{limit:100,offset,sortBy:{column:'name',order:'asc'}});if(error)throw Error('Files could not load. Check your connection, or ask your tutor to finish the file storage setup.');files.push(...data.filter(f=>f.id));if(data.length<100)break;}return files.sort((a,b)=>(b.created_at||'').localeCompare(a.created_at||''));}
 async upload(file){const {type,name}=validateFile(file);await this.verify();const {error}=await this.bucket.upload(this.path(`${crypto.randomUUID()}__${name}`),file,{contentType:type,upsert:false});if(error)throw Error('Upload failed. Check your connection and storage availability, then try again.');}
 async link(name){await this.verify();const {data,error}=await this.bucket.createSignedUrl(this.path(name),60);if(error||!data?.signedUrl)throw Error('This file could not open. Refresh the list and try again.');return data.signedUrl;}
 async remove(name){await this.verify();const {error}=await this.bucket.remove([this.path(name)]);if(error)throw Error('The file could not be deleted. Please try again.');}
}
const escape=s=>String(s??'').replace(/[&<>"']/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
const displayName=name=>name.replace(/^[0-9a-f-]{36}__/i,'');
export function filesView(){return `<div class="page-intro"><div><div class="eyebrow">KEEP YOUR DISCOVERIES CLOSE</div><h1>My files <span class="heading-spark">✧</span></h1><p>Your notes and worksheets, ready on any device when you sign in.</p></div></div><section class="panel files-panel" id="files-panel"><p>Only your account can open these files in the learning hub. Your tutor can manage them in Supabase.</p><form id="file-upload"><label for="student-file">Choose notes or a worksheet</label><input id="student-file" type="file" accept=".pdf,.jpg,.jpeg,.png,.webp,application/pdf,image/jpeg,image/png,image/webp" required aria-describedby="file-help"><p class="muted" id="file-help">PDF, JPG, PNG or WebP · Up to 5 MB each. For iPhone HEIC photos, export as JPG first.</p><button class="button primary" type="submit">Upload file</button></form><p role="status" aria-live="polite" id="files-status"></p><div class="section-title"><h2>Saved to your account</h2><button class="text-button" id="files-refresh">Refresh files</button></div><div id="files-list">Loading your files…</div><p class="muted">Delete files you no longer need to free up storage. Your Focus Corner scratchpad still stays only on this device.</p></section>`;}
export function mountFiles(root,service,isCurrent){
 const status=root.querySelector('#files-status'),list=root.querySelector('#files-list'),form=root.querySelector('#file-upload'),refresh=root.querySelector('#files-refresh');
 let busy=false;
 const active=()=>root.isConnected&&isCurrent();
 function lock(value){busy=value;root.querySelectorAll('button,input').forEach(el=>el.disabled=value);}
 async function load(){const files=await service.list();if(!active())return;list.innerHTML=files.length?files.map(f=>`<article class="file-row"><div><strong>${escape(displayName(f.name))}</strong><small>${(Number(f.metadata?.size||0)/1024/1024).toFixed(2)} MB${f.created_at?' · '+escape(new Date(f.created_at).toLocaleDateString('en-SG')):''}</small></div><div class="file-actions"><button class="button secondary" data-open-file="${escape(f.name)}">Open</button><button class="text-button danger" data-delete-file="${escape(f.name)}">Delete</button></div></article>`).join(''):'<p>No files yet. Upload your first set of notes above.</p>';}
 async function run(task){if(busy||!active())return;lock(true);status.textContent='';try{await task();}catch(e){if(active())status.textContent=e.message;}finally{if(active())lock(false);}}
 refresh.onclick=()=>run(load);
 form.onsubmit=e=>{e.preventDefault();const file=root.querySelector('#student-file').files[0];if(!file)return;run(async()=>{status.textContent='Uploading… Please keep this page open.';await service.upload(file);if(!active())return;form.reset();status.textContent='Uploaded. Your file is saved to your account.';await load();});};
 list.onclick=e=>{const open=e.target.closest('[data-open-file]'),del=e.target.closest('[data-delete-file]');if(open)run(async()=>{status.textContent='Preparing your file…';const url=await service.link(open.dataset.openFile);if(!active())return;const a=document.createElement('a');a.href=url;a.target='_blank';a.rel='noopener noreferrer';a.textContent='Open your file in a new tab (link expires in 1 minute)';status.replaceChildren(a);a.click();});if(del&&!busy&&active()&&window.confirm(`Delete "${displayName(del.dataset.deleteFile)}" from your account? This cannot be undone.`))run(async()=>{await service.remove(del.dataset.deleteFile);if(!active())return;status.textContent='File deleted.';await load();});};
 run(load);
}
