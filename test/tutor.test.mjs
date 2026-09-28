import {test} from 'node:test';
import assert from 'node:assert/strict';
import {tutorView} from '../public/tutor.js';
import {StudentAuth} from '../public/auth.js';
test('tutor view escapes names and shows capped progress with honest activity labels',()=>{
 const html=tutorView({week_start:'2026-09-28',students:[{name:'<script>',weekly_points:130,revision_total:4,focus_total:5,focus_minutes:50,last_scored_day:null,days:[]}]});
 assert.ok(!html.includes('<script>'));assert.ok(html.includes('value="100"'));assert.ok(html.includes('130 / 100'));assert.ok(html.includes('not quiz scores'));assert.ok(html.includes('No activity recorded yet'));
});
test('tutor login requires server-authorized dashboard access',async()=>{
 let allowed=false;
 const client={auth:{getUser:async()=>({data:{user:{id:'tutor'}}})},from:()=>({select:()=>({eq:()=>({maybeSingle:async()=>({data:null})})})}),rpc:async()=>allowed?{data:{students:[]}}:{error:{message:'denied'}}};
 const auth=new StudentAuth(client);await assert.rejects(()=>auth.loadSpace());allowed=true;assert.equal((await auth.loadSpace()).role,'tutor');
});
