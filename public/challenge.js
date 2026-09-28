export class Challenge {
 constructor(client,userId){this.client=client;this.userId=userId;}
 async call(name,args={}){
  const {data:who,error:authError}=await this.client.auth.getUser();
  if(authError||who?.user?.id!==this.userId)throw Error('Your session changed. Sign in again.');
  const {data,error}=await this.client.rpc(name,args);
  if(error)throw Error(error.code==='PGRST202'?'Your tutor needs to enable the weekly challenge.':error.code==='P0001'?error.message:'Progress could not sync. Check your connection and try again.');
  return data;
 }
 board(){return this.call('challenge_board');}
 revision(id){return this.call('challenge_revision',{resource_id:id});}
 timer(command,id,seconds=null){return this.call('challenge_timer',{command,session_id:id,seconds});}
}
const esc=s=>String(s??'').replace(/[&<>"']/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
export function challengeView(rows,message=''){
 const week=rows?.[0]?.week_start;
 return `<section class="panel challenge-panel"><div class="section-title"><h2>Our weekly challenge ✦</h2><button class="text-button" data-action="refresh-challenge">Refresh scores</button></div><p class="muted">A friendly race to 100 points${week?' · Week of '+esc(week):''}. A fresh start every Monday, Singapore time.</p><div id="challenge-status" role="status">${esc(message)}</div>${rows?rows.map(r=>{const points=Math.max(0,Number(r.points)||0),rank=1+rows.filter(other=>Number(other.points)>points).length;return `<article class="challenge-row ${r.is_you?'is-you':''}"><div class="challenge-label"><strong>#${rank} ${esc(r.display_name)}${r.is_you?' · You':''}</strong><span>${points} points${points>=100?' · Goal reached!':''}</span></div><progress max="100" value="${Math.min(100,points)}" aria-label="${esc(r.display_name)} weekly goal">${Math.min(100,points)}%</progress><small>${Number(r.revision_count)||0} revision activities · ${Number(r.focus_count)||0} focus sessions</small></article>`;}).join(''):(message?'':'<p>Loading this week’s progress…</p>')}<details><summary>How to earn points</summary><p>Finish a revision activity and press “Add today’s revision”: +10 points per different activity, up to 3 a day. These are your own completion reports, not marked quiz scores.</p><p>Finish a 10, 20 or 25 minute focus timer: +10 points, up to 3 sessions a day. Pauses do not count, and only one focus timer per account can earn points at a time. Breaks earn no points.</p><p>Only names and weekly totals are shared with the other student. Your tutor can see revision and focus activity summaries. Files, notes and answers stay private. Scores can keep growing beyond the 100-point goal.</p></details></section>`;
}
export function awardMessage(result){return result==='awarded'?'+10 points! A little effort adds up.':result==='limit'?'You have earned today’s points for this activity type. Keep learning at your own pace.':'This activity has already earned its points.';}
