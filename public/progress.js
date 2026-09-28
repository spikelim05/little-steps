import {themes} from './themes.js';
export const STORAGE_KEY='little-steps-static-v1';
export function freshProgress(){return {version:1,remember:true,theme:'forest',completed:[],favourites:[],confidence:{},known:[],daily:{},focusSessions:0,notes:'',timer:null};}
export function loadProgress(storage){
 const base=freshProgress();try{const raw=JSON.parse(storage.getItem(STORAGE_KEY)||'null');if(!raw||raw.version!==1)return base;
 base.remember=raw.remember!==false;base.theme=themes.some(theme=>theme.id===raw.theme)?raw.theme:'forest';if(!base.remember)return base;
 for(const key of ['completed','favourites','known'])if(Array.isArray(raw[key]))base[key]=[...new Set(raw[key].filter(x=>typeof x==='string').slice(0,200))];
 if(raw.confidence&&typeof raw.confidence==='object')for(const [k,v] of Object.entries(raw.confidence))if(['learning','practising','confident'].includes(v))base.confidence[k]=v;
 if(raw.daily&&typeof raw.daily==='object')for(const [k,v]of Object.entries(raw.daily).slice(-90))if(/^\d{4}-\d{2}-\d{2}$/.test(k)&&v&&typeof v==='object')base.daily[k]={cards:Array.isArray(v.cards)?v.cards.filter(x=>typeof x==='string').slice(0,200):[],practice:v.practice===true,focus:v.focus===true};
 base.focusSessions=Number.isSafeInteger(raw.focusSessions)&&raw.focusSessions>=0?raw.focusSessions:0;base.notes=typeof raw.notes==='string'?raw.notes.slice(0,10000):'';
 const t=raw.timer;if(t&&['focus','break'].includes(t.mode)&&Number.isFinite(t.duration)&&t.duration>0&&t.duration<=3600&&Number.isFinite(t.remaining)&&t.remaining>=0&&t.remaining<=3600&&(t.endAt===null||(Number.isFinite(t.endAt)&&t.endAt>0)))base.timer=t;
 return base;}catch{return base;}
}
export function saveProgress(storage,p){try{storage.setItem(STORAGE_KEY,JSON.stringify(p.remember?p:{version:1,remember:false,theme:p.theme}));return true;}catch{return false;}}
export function singaporeDay(now=new Date()){const parts=new Intl.DateTimeFormat('en-GB',{timeZone:'Asia/Singapore',year:'numeric',month:'2-digit',day:'2-digit'}).formatToParts(now);const get=t=>parts.find(p=>p.type===t).value;return `${get('year')}-${get('month')}-${get('day')}`;}
export function secondsLeft(timer,now=Date.now()){return timer.endAt===null?timer.remaining:Math.max(0,Math.ceil((timer.endAt-now)/1000));}
export function dailyProgress(p,day){return p.daily[day]||{cards:[],practice:false,focus:false};}
