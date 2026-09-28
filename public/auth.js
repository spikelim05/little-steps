export function validConfig(config){
 try{
  const url=new URL(config.supabaseUrl);
  if(url.protocol!=='https:'||url.pathname!=='/'||url.search||url.hash||url.username||url.password)return false;
  if(config.publishableKey?.startsWith('sb_publishable_'))return true;
  const payload=JSON.parse(atob(config.publishableKey.split('.')[1].replace(/-/g,'+').replace(/_/g,'/')));
  return payload.role==='anon';
 }catch{return false;}
}
export function scopedStorage(storage,userId){
 if(!userId)throw Error('A signed-in student is required.');
 return {getItem:key=>storage.getItem(`${key}:${userId}`),setItem:(key,value)=>storage.setItem(`${key}:${userId}`,value)};
}
// Internal authentication identifier only; students never need an email address.
export function usernameEmail(username){
 const name=String(username??'').trim().toLowerCase();
 if(!/^[a-z0-9_]{3,32}$/.test(name))throw Error('Enter your username using 3–32 letters, numbers or underscores.');
 return name+'@students.little-steps.invalid';
}
export class StudentAuth {
 constructor(client){this.client=client;}
 async signIn(username,password){const {error}=await this.client.auth.signInWithPassword({email:usernameEmail(username),password});if(error)throw Error('Unable to sign in. Check your username and password, or ask your tutor for help.');return this.loadSpace();}
 async loadSpace(){
  const {data,error}=await this.client.auth.getUser();
  if(error||!data?.user)throw Error('Please sign in to open your learning space.');
  const user=data.user;
  const result=await this.client.from('student_spaces').select('user_id,display_name,content').eq('user_id',user.id).maybeSingle();
  if(result.error)throw Error('Your learning space could not be loaded. Please try again or ask your tutor to check the setup.');
  if(!result.data&&this.client.rpc){const tutor=await this.client.rpc('tutor_dashboard');if(!tutor.error&&tutor.data)return {user,role:'tutor'};}
  if(!result.data||result.data.user_id!==user.id)throw Error('Your tutor has not assigned a learning space to this account yet.');
  const names={'laurenp4@students.little-steps.invalid':'Lauren','calebp4@students.little-steps.invalid':'Caleb'};
  return {user,...result.data,display_name:names[user.email?.toLowerCase()]||result.data.display_name};
 }
 async signOut(){const {error}=await this.client.auth.signOut({scope:'local'});if(error)throw Error('Sign-out could not finish. Please reconnect and try again.');}
 async changePassword(currentPassword,password){
  if(password.length<8||password.length>128)throw Error('Use a password of 8–128 characters.');
  const {error}=await this.client.auth.updateUser({password,current_password:currentPassword});
  if(error)throw Error('Password could not be changed. Check your current password and try again.');
 }
}
export function readContent(space){
 const c=space.content;
 if(!c||c.version!==1||!Array.isArray(c.subjects)||!Array.isArray(c.topics)||!Array.isArray(c.cards)||!Array.isArray(c.resources))throw Error('This learning space needs a content update from your tutor.');
 const resources=c.resources.filter(r=>{try{return new URL(r.url).protocol==='https:';}catch{return false;}});
 return {...c,resources,displayName:space.display_name};
}
