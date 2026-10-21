const test = require('node:test');
const assert = require('node:assert/strict');
require('../web/data.js');
let KR;
try { KR = require('../web/engine.js'); } catch { KR = {}; }
const make = () => new KR.Game({levelIndex:0});
const advance = (game, seconds) => { for(let i=0;i<seconds*60;i++) game.tick(1/60); };

test('construction spends gold once, rejects occupied sites and refunds investment', () => {
  const g=make();
  assert.equal(g.build(1,'archer'),true);
  assert.equal(g.gold,230);
  assert.equal(g.build(1,'mage'),false);
  assert.equal(g.gold,230);
  assert.equal(g.sell(1),true);
  assert.equal(g.gold,272);
  assert.equal(g.sell(1),false);
});
test('cannot build or upgrade without funds; failure leaves wallet and tower intact', () => {
  const g=make(); g.gold=70; g.build(1,'archer');
  assert.equal(g.upgrade(1),false); assert.equal(g.towers[0].level,1);
  assert.equal(g.build(2,'mage'),false); assert.equal(g.gold,0);
});
test('first wave follows recovered spawn schedule and pause freezes simulation', () => {
  const g=make();g.start();g.nextWave();advance(g,1);
  assert.ok(g.enemies.length>0);assert.equal(g.wave,1);
  g.pause(); const before=JSON.stringify([g.enemies,g.time,g.pending]);
  advance(g,3);assert.equal(JSON.stringify([g.enemies,g.time,g.pending]),before);
  g.pause();advance(g,1);assert.ok(g.time>1);
});
test('physical armor reduces arrows and magic bypasses physical armor', () => {
  const g=make(); const e=g.spawn('EnemyDesertRaider',0,0);
  const hp=e.hp;g.damage(e,100,'physical');assert.equal(Math.round(hp-e.hp),70);
  const hp2=e.hp;g.damage(e,40,'magic');assert.equal(Math.round(hp2-e.hp),40);
});
test('a kill rewards gold once even if multiple projectiles hit the same enemy', () => {
  const g=make();const e=g.spawn('EnemyBouncer',0,0);const gold=g.gold;
  g.damage(e,999,'true');g.damage(e,999,'true');assert.equal(g.gold,gold+5);
});
test('enemy reaching route end costs lives once and defeat cannot spawn more waves', () => {
  const g=make();g.start();g.lives=1;const e=g.spawn('EnemyBouncer',0,0);
  e.distance=e.path.length-1;advance(g,1);
  assert.equal(g.status,'lost');assert.equal(g.lives,0);
  const wave=g.wave;assert.equal(g.nextWave(),false);advance(g,10);assert.equal(g.wave,wave);
});
test('reinforcements require a road target; failed targeting does not spend cooldown', () => {
  const g=make();g.start();
  assert.equal(g.cast('reinforce',0,0),false);assert.equal(g.cooldowns.reinforce,0);
  assert.equal(g.cast('reinforce',400,411),true);assert.equal(g.soldiers.length,2);
  assert.equal(g.cast('reinforce',400,411),false);
});
test('barracks spawn three soldiers; selling removes their blockers', () => {
  const g=make();g.build(1,'barracks');g.start();advance(g,1);
  assert.equal(g.soldiers.filter(s=>s.owner===1).length,3);
  g.sell(1);assert.equal(g.soldiers.filter(s=>s.owner===1).length,0);
});
test('all 15 recovered stages have usable paths, sites, schedules and enemy stats', () => {
  assert.equal(KR_DATA.levels.length,15);
  for(let i=0;i<15;i++) {
    const g=new KR.Game({levelIndex:i});assert.ok(g.holders.length>=12);
    g.start();assert.equal(g.nextWave(),true);advance(g,2);
    for(const e of g.enemies) assert.ok(Number.isFinite(e.x)&&e.hp>0);
    for(const w of g.level.waves) for(const b of w.branches) for(const s of b.spawns)
      assert.ok(KR_DATA.enemies[s[0]],s[0]);
  }
});
test('campaign win happens after final enemy, and a fresh stage has clean cooldowns', () => {
  const g=make();g.start();g.wave=g.level.waves.length;g.pending=[];
  const e=g.spawn('EnemyBouncer',0,0);advance(g,.1);assert.equal(g.status,'playing');
  g.damage(e,999,'true');advance(g,.1);assert.equal(g.status,'won');
  const next=new KR.Game({levelIndex:1});assert.equal(next.wave,0);assert.equal(next.cooldowns.fire,0);
});

test('fully upgrading and selling a specialization refunds the full investment basis',()=> {
  const g=make();g.gold=1000;g.build(1,'archer');
  assert.equal(g.upgrade(1,'crossbow'),false);
  assert.equal(g.upgrade(1),true);assert.equal(g.upgrade(1),true);
  assert.equal(g.upgrade(1,'crossbow'),true);assert.equal(g.upgrade(1),false);
  assert.equal(g.towerAt(1).branch,'crossbow');g.sell(1);assert.equal(g.gold,772);
});
test('artillery ignores flying enemies while magic towers shoot them',()=> {
  const g=make();g.gold=500;g.build(1,'artillery');g.build(2,'mage');g.start();
  const e=g.spawn('EnemyWasp',0,0,420);assert.equal(e.flying,true);advance(g,.1);
  assert.ok(g.projectiles.some(p=>p.kind==='magic'));
  assert.equal(g.projectiles.some(p=>p.kind==='bomb'),false);
});
test('rain of fire damages a cluster and cannot be cast twice during cooldown',()=> {
  const g=make();g.start();const a=g.spawn('EnemyDesertRaider',0,0,400),b=g.spawn('EnemyDesertRaider',0,0,405);
  const hp=a.hp+b.hp;assert.equal(g.cast('fire',a.x,a.y),true);assert.equal(g.cast('fire',a.x,a.y),false);
  advance(g,2);assert.ok(a.hp+b.hp<hp);assert.ok(g.cooldowns.fire>77);
});
test('late campaign stages require defeating their boss before victory',()=> {
  const g=new KR.Game({levelIndex:5});g.start();g.wave=g.level.waves.length;advance(g,.1);
  assert.equal(g.status,'playing');assert.equal(g.enemies[0].type,'EnemyEfreeti');
  g.damage(g.enemies[0],99999,'true');advance(g,.1);assert.equal(g.status,'won');
});
test('a normal-budget first-stage strategy wins through real combat across all six waves',()=> {
  const g=make();g.start();g.build(1,'mage');g.build(2,'archer');g.build(6,'archer');g.nextWave();
  for(let i=0;i<60*600&&g.status==='playing';i++) {
    if(i%120===0) {
      if(g.gold>=110)for(const t of g.towers)if(t.level<3&&g.upgrade(t.index))break;
      if(g.gold>=100) {
        const index=[0,3,5,4,8,7,10,11].find(index=>!g.towerAt(index));
        if(index!==undefined)g.build(index,index%3===0?'mage':'archer');
      }
      const target=g.enemies.filter(e=>!e.dead&&e.x>0&&e.x<800).sort((a,b)=>b.distance/b.path.length-a.distance/a.path.length)[0];
      if(target)g.cast('reinforce',target.x,target.y);
    }
    g.tick(1/60);
  }
  assert.equal(g.status,'won');assert.equal(g.lives,20);assert.equal(g.kills,84);
});
