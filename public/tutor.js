const esc=v=>String(v??'').replace(/[&<>"']/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
export function tutorView(data){
 return `<div class="page-intro"><div><div class="eyebrow">LITTLE STEPS · TUTOR</div><h1>Your students’ progress</h1><p>Week beginning ${esc(data.week_start)} · Singapore time</p></div></div><div class="info-strip"><p>Weekly goal: 100 points. Revision points are student-reported, not quiz scores. Points count up to three revision activities and three focus sessions per day. Flashcard recall and topic confidence stay on each student’s device.</p></div><div class="tutor-grid">${data.students.map(s=>`<section class="panel tutor-card"><h2>${esc(s.name)}</h2><p><strong>${esc(s.weekly_points)} / 100</strong> weekly points</p><progress max="100" value="${Math.min(100,Math.max(0,Number(s.weekly_points)||0))}" aria-label="${esc(s.name)} weekly goal"></progress><dl><dt>Scored revision activities · all time</dt><dd>${esc(s.revision_total)}</dd><dt>Completed focus sessions · all time</dt><dd>${esc(s.focus_total)} (${esc(s.focus_minutes)} minutes)</dd><dt>Last scored activity</dt><dd>${esc(s.last_scored_day||'No activity recorded yet')}</dd></dl><details><summary>Activity in the last four weeks</summary>${s.days.length?`<table><thead><tr><th>Date</th><th>Revision*</th><th>Focus*</th></tr></thead><tbody>${[...s.days].reverse().map(d=>`<tr><td>${esc(d.day)}</td><td>${esc(d.revision)}</td><td>${esc(d.focus)}</td></tr>`).join('')}</tbody></table><small>*Activities awarded points.</small>`:'<p>No scored activity yet. Their next completed activity will appear here.</p>'}</details></section>`).join('')}</div>`;
}
export function mountTutor({root,auth,userId,onSignOut}){
 let disposed=false,busy=false;
 root.innerHTML=`<main class="tutor-shell"><header class="topbar"><strong>Tutor dashboard</strong><div><button class="text-button" id="tutor-refresh">Refresh</button><button class="text-button" id="tutor-signout">Sign out</button></div></header><p id="tutor-status" role="status">Loading progress…</p><div id="tutor-content"></div></main>`;
 const status=root.querySelector('#tutor-status'),content=root.querySelector('#tutor-content'),button=root.querySelector('#tutor-refresh');
 async function refresh(){if(disposed||busy)return;busy=true;button.disabled=true;
  try{const {data:user,error:sessionError}=await auth.client.auth.getUser();if(sessionError||!user?.user||user.user.id!==userId)throw Error();
   const {data,error}=await auth.client.rpc('tutor_dashboard');if(error)throw Error();
   if(disposed)return;content.innerHTML=tutorView(data);status.textContent='Updated '+new Date().toLocaleTimeString('en-SG',{timeZone:'Asia/Singapore'})+' · Refreshes every minute while this tab is open.';
  }catch{if(!disposed){content.innerHTML='';status.textContent='Unable to load progress. Check your connection and tutor setup, then refresh.';}}
  finally{busy=false;if(!disposed)button.disabled=false;}
 }
 button.onclick=refresh;root.querySelector('#tutor-signout').onclick=async()=>{try{await auth.signOut();onSignOut();}catch{status.textContent='Sign-out failed. Reconnect and try again.';}};
 const timer=setInterval(()=>{if(!document.hidden)refresh();},60000);refresh();
 return ()=>{disposed=true;clearInterval(timer);};
}
