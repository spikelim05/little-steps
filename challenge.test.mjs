import {test} from 'node:test';
import assert from 'node:assert/strict';
import {Challenge,challengeView,awardMessage} from './public/challenge.js';
test('challenge uses verified identity and sends no caller-chosen score or user ID',async()=>{
 const calls=[],client={auth:{getUser:async()=>({data:{user:{id:'one'}}})},rpc:async(...args)=>{calls.push(args);return {data:'ok'};}};
 const c=new Challenge(client,'one');await c.board();await c.revision('heat');await c.timer('start','timer-1',600);
 assert.deepEqual(calls,[['challenge_board',{}],['challenge_revision',{resource_id:'heat'}],['challenge_timer',{command:'start',session_id:'timer-1',seconds:600}]]);
 await assert.rejects(()=>new Challenge(client,'two').board(),/session changed/);assert.equal(calls.length,3);
 client.rpc=async()=>({error:{code:'PGRST202'}});await assert.rejects(()=>c.board(),/enable the weekly challenge/);
 client.rpc=async()=>({error:{code:'offline'}});await assert.rejects(()=>c.revision('heat'),/could not sync/);
});
test('leaderboard renders tied ranks, clamps bars, escapes names and explains scoring',()=>{
 const html=challengeView([{display_name:'Lauren',points:120,revision_count:6,focus_count:6,is_you:true,week_start:'2026-09-28'},{display_name:'<Caleb>',points:120,revision_count:6,focus_count:6,is_you:false}]);
 assert.equal((html.match(/#1 /g)||[]).length,2);assert.match(html,/Lauren · You/);assert.match(html,/&lt;Caleb&gt;/);assert.doesNotMatch(html,/<Caleb>/);
 assert.equal((html.match(/value="100"/g)||[]).length,2);assert.match(html,/120 points/);assert.match(html,/Goal reached/);assert.match(html,/up to 3/);
 assert.match(challengeView(null,'Setup needed'),/Setup needed/);assert.doesNotMatch(challengeView(null,'Setup needed'),/Loading/);
 assert.match(awardMessage('awarded'),/10 points/);assert.match(awardMessage('already'),/already/);assert.match(awardMessage('limit'),/today/);
});
