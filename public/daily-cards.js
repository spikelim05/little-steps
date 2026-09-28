// A deterministic rotation: same account/date gets the same set on every device.
// Each subject advances by five places daily; no repeats for seven days when it has >=35 cards.
function hash(text){let n=2166136261;for(const c of text)n=Math.imul(n^c.charCodeAt(0),16777619);return n>>>0;}
function ordered(cards,seed){const result=[...cards].sort((a,b)=>a.id<b.id?-1:a.id>b.id?1:0);let n=hash(seed);for(let i=result.length-1;i>0;i--){n=(Math.imul(n,1664525)+1013904223)>>>0;const j=n%(i+1);[result[i],result[j]]=[result[j],result[i]];}return result;}
export function dailyCards(cards,userId,day){
 const dayNumber=Math.floor(Date.parse(day+'T00:00:00Z')/86400000);
 if(!Number.isFinite(dayNumber))return [];
 const groups=['maths','science'].map(subject=>{
  const bank=ordered(cards.filter(c=>c.subject===subject),userId+':'+subject);
  const count=Math.min(5,bank.length),start=bank.length?((dayNumber*5)%bank.length+bank.length)%bank.length:0;
  return Array.from({length:count},(_,i)=>bank[(start+i)%bank.length]);
 });
 return Array.from({length:5},(_,i)=>groups.map(g=>g[i]).filter(Boolean)).flat();
}
