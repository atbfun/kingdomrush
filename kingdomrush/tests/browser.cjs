/* Real Chrome acceptance: HTTP, file://, touch, dialogs and broken images. */
const assert=require('node:assert/strict');
const fs=require('node:fs');
const path=require('node:path');
const {spawn}=require('node:child_process');
const {pathToFileURL}=require('node:url');
let playwright;
for(const modulePath of [process.env.PLAYWRIGHT_MODULE,'playwright',
  '/Applications/ChatGPT.app/Contents/Resources/cua_node/lib/node_modules/playwright']) {
  if(!modulePath)continue;try{playwright=require(modulePath);break;}catch{}
}
if(!playwright)throw new Error('Install Playwright, or set PLAYWRIGHT_MODULE to its absolute package directory.');
const ROOT=path.resolve(__dirname,'..'),OUT=path.join(ROOT,'analysis');
const checks=[],errors=[];
let browser,server;
function check(name,extra={}) {checks.push({name,passed:true,...extra});console.log('PASS',name,JSON.stringify(extra));}
function track(page,label) {
  page.on('pageerror',e=>errors.push({label,error:e.message}));
  page.on('console',m=>{if(m.type()==='error')errors.push({label,error:m.text()});});
  page.on('requestfailed',r=>errors.push({label,url:r.url(),error:r.failure()?.errorText}));
}
async function ready(page) {
  await page.waitForFunction(()=>!!window.krApp,null,{timeout:10000});
  await page.waitForFunction(()=>{const a=krApp.renderer.assets.get(krApp.game.level.map);return a.complete&&a.naturalWidth>0;});
}
async function pixelRatio(page) {
  return page.evaluate(()=> {
    const c=document.getElementById('battle'),p=c.getContext('2d').getImageData(0,0,c.width,c.height).data;
    let color=0;for(let i=0;i<p.length;i+=4)if(p[i+3]>0&&(p[i]>10||p[i+1]>10||p[i+2]>10))color++;
    return color/(c.width*c.height);
  });
}
async function snapshot(page,name) {
  const ratio=await pixelRatio(page);assert.ok(ratio>=.9,`${name} colored pixel ratio ${ratio}`);
  await page.screenshot({path:path.join(OUT,name+'.png'),fullPage:true});check(name,{canvasColoredRatio:ratio});
}
async function canvasClick(page,x,y,touch=false) {
  const c=page.locator('#battle'),box=await c.boundingBox(),position={x:x*box.width/800,y:y*box.height/600};
  if(touch)await c.tap({position});else await c.click({position});
}
async function main() {
  fs.mkdirSync(OUT,{recursive:true});
  server=spawn(process.env.PYTHON||'python3',[path.join(ROOT,'serve.py'),'--port','0'],{stdio:['ignore','pipe','pipe']});
  const url=await new Promise((resolve,reject)=> {
    const timer=setTimeout(()=>reject(new Error('Local server startup timed out')),10000);
    server.stdout.once('data',d=>{clearTimeout(timer);resolve(String(d).trim());});
    server.once('error',reject);
  });
  browser=await playwright.chromium.launch({executablePath:process.env.CHROME_PATH||'/Applications/Google Chrome.app/Contents/MacOS/Google Chrome',headless:true});
  const context=await browser.newContext({viewport:{width:1440,height:1100},deviceScaleFactor:1});
  const page=await context.newPage();track(page,'desktop');
  await page.goto(url);await ready(page);await snapshot(page,'screen_initial');
  await page.locator('#start-button').click();
  const audioState=await page.evaluate(async()=>({context:krApp.audio.context?.state,
    duration:(await krApp.audio.decode('Sound_GUIButtonCommon'))?.duration}));
  assert.equal(audioState.context,'running');assert.ok(audioState.duration>0);check('User gesture unlock and native AAC decode',audioState);
  await page.waitForTimeout(150);
  const invalidDraws=await page.evaluate(()=> {
    const c=krApp.renderer.ctx,original=c.drawImage,bad=[];
    c.drawImage=function(...args){if(args.slice(1).some(n=>!Number.isFinite(n)))bad.push(args.slice(1));return original.apply(this,args);};
    krApp.renderer.draw(krApp.game);c.drawImage=original;return bad.length;
  });
  assert.equal(invalidDraws,0,'Hero and all loaded sprites use finite drawing coordinates');
  await page.locator('#sound-button').focus();await page.keyboard.press('Space');
  assert.equal(await page.evaluate(()=>krApp.game.status),'playing');
  assert.equal(await page.evaluate(()=>krApp.audio.muted),true);check('Space activates focused buttons and hero frame coordinates are finite');
  for(const [site,type] of [[1,'mage'],[2,'archer'],[6,'archer']]) {
    await page.selectOption('#site-select',String(site));await page.locator(`[data-build="${type}"]`).click();
  }
  assert.equal(await page.evaluate(()=>krApp.game.gold),60);
  assert.equal(await page.evaluate(()=>krApp.game.towers.length),3);check('UI construction and wallet');
  await page.locator('#wave-button').click();
  await page.evaluate(()=>{for(let i=0;i<720;i++)krApp.game.tick(1/60);});
  assert.ok(await page.evaluate(()=>krApp.game.enemies.length>0));
  await page.waitForTimeout(150);await snapshot(page,'screen_gameplay');
  await page.locator('#pause-button').click();
  const frozen=await page.evaluate(()=>krApp.game.time);await page.waitForTimeout(200);
  assert.equal(await page.evaluate(()=>krApp.game.time),frozen);
  await page.locator('#resume-button').click();assert.equal(await page.evaluate(()=>krApp.game.status),'playing');check('Pause freezes and resume continues');
  await page.locator('#reinforce-button').click();await canvasClick(page,400,411);
  assert.ok(await page.evaluate(()=>krApp.game.cooldowns.reinforce>9&&krApp.game.soldiers.length===2));
  await page.locator('#hero-button').click();await canvasClick(page,350,408);
  assert.ok(await page.evaluate(()=>Math.abs(krApp.game.hero.tx-350)<3));check('Targeted reinforcement and hero movement');
  await page.locator('#help-button').click();assert.equal(await page.evaluate(()=>krApp.game.status),'paused');
  await page.locator('[data-close="help-dialog"]').first().click();await page.waitForFunction(()=>krApp.game.status==='playing');check('Help dialog preserves battle state');
  await page.locator('#campaign-button').click();await page.locator('[data-stage="1"]').click();await ready(page);
  assert.equal(await page.evaluate(()=>krApp.game.level.id),2);
  assert.deepEqual(await page.evaluate(()=>[krApp.game.wave,krApp.game.towers.length,krApp.game.cooldowns.fire]),[0,0,0]);
  await page.selectOption('#site-select','1');await page.locator('[data-build="artillery"]').click();
  await page.locator('#wave-button').click();await page.evaluate(()=>{for(let i=0;i<420;i++)krApp.game.tick(1/60);});
  await page.waitForTimeout(150);await snapshot(page,'screen_stage2');check('Campaign navigation resets battle state');
  await page.evaluate(()=> {
    krApp.loadLevel(0,true);const g=krApp.game;g.build(1,'mage');g.build(2,'archer');g.build(6,'archer');g.nextWave();
    for(let i=0;i<60*600&&g.status==='playing';i++) {
      if(i%120===0) {
        if(g.gold>=110)for(const t of g.towers)if(t.level<3&&g.upgrade(t.index))break;
        if(g.gold>=100){const site=[0,3,5,4,8,7,10,11].find(site=>!g.towerAt(site));if(site!==undefined)g.build(site,site%3===0?'mage':'archer');}
        const target=g.enemies.filter(e=>!e.dead&&e.x>0&&e.x<800).sort((a,b)=>b.distance/b.path.length-a.distance/a.path.length)[0];
        if(target)g.cast('reinforce',target.x,target.y);
      }
      g.tick(1/60);
    }
  });
  await page.waitForFunction(()=>krApp.game.status==='won');
  assert.equal(await page.locator('#result-dialog').isVisible(),true);
  assert.equal(await page.evaluate(()=>JSON.parse(localStorage.getItem('atb-kingdomrush-frontiers-v1')).stars[1]),3);
  await page.screenshot({path:path.join(OUT,'screen_victory.png'),fullPage:true});
  await page.locator('#next-stage-button').click();assert.equal(await page.evaluate(()=>krApp.game.level.id),2);
  check('Full first-stage victory, persistent three-star score and next-stage UI');
  // Exercise all original terrains and data through the same production stage loader.
  const stageRatios=[];
  for(let i=0;i<15;i++) {
    await page.evaluate(i=>krApp.loadLevel(i,true),i);await ready(page);
    await page.evaluate(()=>{krApp.game.nextWave();for(let i=0;i<180;i++)krApp.game.tick(1/60);});
    await page.waitForTimeout(30);stageRatios.push(await pixelRatio(page));
  }
  assert.ok(stageRatios.every(r=>r>=.9));check('All 15 stage renders',{minimumCanvasColoredRatio:Math.min(...stageRatios)});
  const fps=await page.evaluate(()=>new Promise(resolve=> {
    const samples=[];let last;function frame(t){if(last)samples.push(t-last);last=t;if(samples.length<90)requestAnimationFrame(frame);else resolve({averageFrameMs:samples.reduce((a,b)=>a+b)/samples.length,maxFrameMs:Math.max(...samples)});}requestAnimationFrame(frame);
  }));check('Browser animation sample',fps);
  const mobile=await browser.newContext({viewport:{width:390,height:844},isMobile:true,hasTouch:true,deviceScaleFactor:1});
  const mp=await mobile.newPage();track(mp,'mobile');await mp.goto(url);await ready(mp);await mp.locator('#start-button').tap();
  await canvasClick(mp,438,358,true);assert.equal(await mp.evaluate(()=>krApp.renderer.selected),2);
  await mp.locator('[data-build="archer"]').tap();assert.equal(await mp.evaluate(()=>krApp.game.towers.length),1);
  assert.equal(await mp.evaluate(()=>document.documentElement.scrollWidth>innerWidth),false);
  await mp.screenshot({path:path.join(OUT,'screen_mobile.png'),fullPage:true});check('390 px touch targeting, construction and no horizontal overflow');
  const fileContext=await browser.newContext({viewport:{width:1200,height:1000}});
  const filePage=await fileContext.newPage();track(filePage,'file');
  await filePage.goto(pathToFileURL(path.join(ROOT,'web/index.html')).href);await ready(filePage);
  await filePage.locator('#start-button').click();await filePage.selectOption('#site-select','1');await filePage.locator('[data-build="mage"]').click();await filePage.locator('#wave-button').click();
  await filePage.waitForTimeout(400);assert.equal(await filePage.evaluate(()=>krApp.game.wave),1);
  assert.equal(await filePage.evaluate(()=>krApp.renderFailures),0);check('file:// launch, images, construction and wave');
  const fallbackContext=await browser.newContext();
  await fallbackContext.route('**/assets/**/*.png',route=>route.fulfill({status:200,contentType:'image/png',body:Buffer.from('invalid image')}));
  const fallback=await fallbackContext.newPage();track(fallback,'fallback');await fallback.goto(url);
  await fallback.waitForFunction(()=>!!window.krApp);await fallback.locator('#start-button').click();
  await fallback.selectOption('#site-select','1');await fallback.locator('[data-build="archer"]').click();await fallback.locator('#wave-button').click();
  await fallback.evaluate(()=>{for(let i=0;i<600;i++)krApp.game.tick(1/60);});await fallback.waitForTimeout(150);
  assert.equal(await fallback.evaluate(()=>krApp.renderFailures),0);await snapshot(fallback,'screen_fallback');check('Corrupt map and sprites use geometric rendering without exceptions');
  const corrupt=await browser.newContext();await corrupt.addInitScript(()=>localStorage.setItem('atb-kingdomrush-frontiers-v1','{broken'));
  const cp=await corrupt.newPage();track(cp,'storage');await cp.goto(url);await ready(cp);check('Corrupt local save recovers');
  assert.deepEqual(errors,[],'Console, network or page errors');
  fs.writeFileSync(path.join(OUT,'browser_verification.json'),JSON.stringify({date:'2026-10-19',browser:await browser.version(),checks,consoleErrors:errors},null,2));
  console.log(`ALL ${checks.length} BROWSER CHECKS PASSED; 0 errors.`);
}
main().catch(error=>{console.error(error);fs.writeFileSync(path.join(OUT,'browser_failure.json'),JSON.stringify({error:error.stack,checks,errors},null,2));process.exitCode=1;}).finally(async()=>{if(browser)await browser.close();if(server)server.kill();});
