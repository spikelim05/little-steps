import http from 'node:http';
import {readFile} from 'node:fs/promises';
import {fileURLToPath} from 'node:url';
import path from 'node:path';

// Local preview only. The deployed site needs only the files in public/.
// Student authentication/content are supplied by Supabase, not this preview server.
// No uploads, local API, or filesystem writes.
const root=path.join(path.dirname(fileURLToPath(import.meta.url)),'public');
const files=new Set(['index.html','study.css','study.js','progress.js','themes.js','config.js','auth.js','login-view.js','files.js','challenge.js']);
const types={'.html':'text/html; charset=utf-8','.css':'text/css; charset=utf-8','.js':'text/javascript; charset=utf-8'};
const server=http.createServer(async(req,res)=>{
 res.setHeader('X-Content-Type-Options','nosniff');
 res.setHeader('Referrer-Policy','no-referrer');
 res.setHeader('Cache-Control','no-cache');
 if(!['GET','HEAD'].includes(req.method)){res.writeHead(405,{Allow:'GET, HEAD'});return res.end('This is a read-only revision website.');}
 const pathname=new URL(req.url,'http://localhost').pathname;
 const file=pathname==='/'?'index.html':pathname.slice(1);
 if(!files.has(file)){res.writeHead(404);return res.end('Not found');}
 try{const content=await readFile(path.join(root,file));res.writeHead(200,{'Content-Type':types[path.extname(file)]});res.end(req.method==='HEAD'?undefined:content);}catch{res.writeHead(500);res.end('Unable to load this page.');}
});
server.listen(Number(process.env.PORT||3030),'127.0.0.1',()=>console.log(`Little Steps is ready at http://localhost:${process.env.PORT||3030}`));
