import {singaporeDay} from './progress.js';
const months=['January','February','March','April','May','June','July','August','September','October','November','December'];
export function examCountdowns(content,now=new Date()){
 const today=Date.parse(singaporeDay(now)+'T00:00:00Z');
 return [['maths','Maths paper'],['science','Science paper']].flatMap(([subject,label])=>{
  const lines=content?.exams?.[subject]?.lines||[];
  const match=lines.join(' ').match(/\b(\d{1,2}) (January|February|March|April|May|June|July|August|September|October|November|December) (\d{4})\b/);
  if(!match)return [];
  const month=months.indexOf(match[2]),date=new Date(Date.UTC(Number(match[3]),month,Number(match[1])));
  if(date.getUTCMonth()!==month||date.getUTCDate()!==Number(match[1]))return [];
  const days=Math.round((date.getTime()-today)/86400000);
  return [{subject,label,date:`${Number(match[1])} ${match[2]} ${match[3]}`,days,text:days<0?'Paper finished':days===0?'Paper today':days===1?'1 day to go':`${days} days to go`}];
 });
}
export function examCountdownView(content,now=new Date()){
 const exams=examCountdowns(content,now);
 return exams.length?`<section class="exam-countdowns" aria-label="Your exam countdowns">${exams.map(e=>`<article class="panel exam-countdown"><span class="eyebrow">${e.label}</span><strong>${e.text}</strong><span>${e.date}</span><small>${e.days<0?'A big step, completed.':e.days===0?'Take your time. You’ve got this.':'One little bit of revision at a time.'}</small></article>`).join('')}</section>`:'';
}
