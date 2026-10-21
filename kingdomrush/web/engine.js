/* Deterministic game simulation. No DOM, network or rendering dependencies. */
(function(root) {
  'use strict';
  const DATA=root.KR_DATA;
  const dist=(a,b)=>Math.hypot(a.x-b.x,a.y-b.y);
  const clamp=(n,a,b)=>Math.max(a,Math.min(b,n));
  const TYPES={
    archer:{name:'弓箭塔',group:'archers',color:'#e5bd62',description:'快速射击，擅长对付轻甲与飞行敌人。',branches:['crossbow','totem']},
    barracks:{name:'兵营',group:'§_-tz§',color:'#df8c70',description:'派出三名士兵，在道路上拦截敌人。',branches:['assassin','templar']},
    mage:{name:'法师塔',group:'mages',color:'#71c9e6',description:'魔法攻击，穿透敌人的物理护甲。',branches:['archmage','necromancer']},
    artillery:{name:'炮兵塔',group:'engineers',color:'#b5c78b',description:'范围轰炸，适合密集的地面敌人。',branches:['dwaarp','mech']}
  };
  const BRANCHES={crossbow:'弩堡',totem:'部落图腾',assassin:'刺客公会',templar:'圣殿骑士',archmage:'大法师塔',necromancer:'死灵法师',dwaarp:'震地钻机',mech:'战斗机甲'};
  function pathFrom(points) {
    const cumulative=[0];
    for(let i=1;i<points.length;i++) cumulative.push(cumulative[i-1]+Math.hypot(points[i][0]-points[i-1][0],points[i][1]-points[i-1][1]));
    return {points,cumulative,length:cumulative.at(-1)};
  }
  function pointAt(path,distance) {
    const d=clamp(distance,0,path.length), p=path.points, c=path.cumulative;
    let lo=0,hi=c.length-1;
    while(lo+1<hi) { const m=(lo+hi)>>1;if(c[m]<d)lo=m;else hi=m; }
    const t=(d-c[lo])/(c[hi]-c[lo]||1);
    return {x:p[lo][0]+(p[hi][0]-p[lo][0])*t,y:p[lo][1]+(p[hi][1]-p[lo][1])*t};
  }
  class Game {
    constructor({levelIndex=0,difficulty='normal',onEvent=()=>{}}={}) {
      this.levelIndex=clamp(Math.trunc(levelIndex)||0,0,14);this.level=DATA.levels[this.levelIndex];
      this.difficulty=difficulty;this.onEvent=onEvent;this.status='ready';this.time=0;this.wave=0;
      this.gold=this.level.gold;this.lives=this.level.lives;this.kills=0;this.id=0;
      this.holders=this.level.holders.map((h,i)=>({...h,index:i}));
      this.paths=this.level.routes.map(route=>route.map(pathFrom));
      this.towers=[];this.enemies=[];this.soldiers=[];this.projectiles=[];this.effects=[];this.pending=[];
      this.cooldowns={fire:0,reinforce:0};this.nextIn=Infinity;this.bossSpawned=false;
      const rally=this.holders[1]?.rally||[400,300];
      this.hero={id:'hero',x:rally[0],y:rally[1],tx:rally[0],ty:rally[1],hp:245,maxHp:245,
        armor:20,damage:14,cooldown:0,respawn:0,sprite:'SoldierHeroAlric',level:1,owner:'hero'};
    }
    event(type,extra={}) { this.onEvent({type,...extra}); }
    start() { if(this.status==='ready'){this.status='playing';return true;}return false; }
    pause() { if(this.status==='playing')this.status='paused';else if(this.status==='paused')this.status='playing'; }
    interactive() { return this.status==='ready'||this.status==='playing'; }
    stats(type,level=1,branch=null) { return DATA.config[TYPES[type].group][branch||`level${level}`]; }
    towerAt(index) { return this.towers.find(t=>t.index===index); }
    build(index,type) {
      if(!this.interactive()||!TYPES[type]||!this.holders[index]||this.towerAt(index)) return false;
      const cost=this.stats(type).cost;if(this.gold<cost)return false;
      const h=this.holders[index];this.gold-=cost;
      const t={...h,type,level:1,branch:null,spent:cost,cooldown:0,flash:0};this.towers.push(t);
      if(type==='barracks')this.createGarrison(t);
      this.effect('build',t.x,t.y,{color:TYPES[type].color});this.event('build',{typeName:type});return true;
    }
    upgrade(index,branch=null) {
      const t=this.towerAt(index);if(!t||!this.interactive()||t.level>=4)return false;
      if(t.level===3&&!TYPES[t.type].branches.includes(branch))return false;
      if(t.level<3&&branch)return false;
      const level=t.level+1,s=this.stats(t.type,level,branch),cost=s.cost;
      if(this.gold<cost)return false;
      this.gold-=cost;t.spent+=cost;t.level=level;t.branch=branch;
      if(t.type==='barracks') {
        this.soldiers=this.soldiers.filter(s=>s.owner!==index);this.createGarrison(t);
      }
      this.effect('build',t.x,t.y,{color:TYPES[t.type].color});this.event('upgrade');return true;
    }
    sell(index) {
      const t=this.towerAt(index);if(!t||!this.interactive())return false;
      this.gold+=Math.floor(t.spent*.6);this.towers=this.towers.filter(a=>a!==t);
      this.soldiers=this.soldiers.filter(s=>s.owner!==index);this.event('sell');return true;
    }
    nearestRoad(x,y) {
      let best={distance:Infinity,x,y};
      for(const route of this.paths)for(const path of route)for(let i=0;i<path.points.length-1;i++) {
        const a=path.points[i],b=path.points[i+1],dx=b[0]-a[0],dy=b[1]-a[1];
        const t=clamp(((x-a[0])*dx+(y-a[1])*dy)/(dx*dx+dy*dy||1),0,1);
        const px=a[0]+dx*t,py=a[1]+dy*t,distance=Math.hypot(px-x,py-y);
        if(distance<best.distance)best={distance,x:px,y:py};
      }
      return best;
    }
    rally(index,x,y) {
      const t=this.towerAt(index);if(!this.interactive()||!t||t.type!=='barracks')return false;
      const p=this.nearestRoad(x,y),range=(this.stats(t.type,t.level,t.branch).rangeRally||250)/2;
      if(p.distance>27||Math.hypot(x-t.x,y-t.y)>range)return false;
      t.rally=[p.x,p.y];for(const s of this.soldiers.filter(s=>s.owner===index)){s.tx=p.x+s.offset;s.ty=p.y;}
      this.effect('rally',p.x,p.y);return true;
    }
    moveHero(x,y) {
      if(!this.interactive()||this.hero.hp<=0)return false;
      const p=this.nearestRoad(x,y);if(p.distance>55)return false;
      this.hero.tx=p.x;this.hero.ty=p.y;this.effect('rally',p.x,p.y);return true;
    }
    createGarrison(t) {
      const s=this.stats('barracks',t.level,t.branch),health=[50,100,150,240][t.level-1];
      for(let i=0;i<3;i++)this.soldiers.push({id:++this.id,owner:t.index,offset:(i-1)*15,
        x:t.x,y:t.y,tx:t.rally[0]+(i-1)*15,ty:t.rally[1],hp:health,maxHp:health,
        damage:(s.minDamage+s.maxDamage)/2,armor:s.armor||0,cooldown:0,respawn:0,
        sprite:t.branch==='assassin'?'SoldierAssassin':t.branch==='templar'?'SoldierAssassin':'SoldierStandarLevel2'});
    }
    nextWave() {
      if(this.status!=='playing'||this.wave>=this.level.waves.length)return false;
      if(this.wave>0&&Number.isFinite(this.nextIn)) {
        const bonus=Math.min(25,Math.max(0,Math.floor(this.nextIn*.5)));this.gold+=bonus;
        this.cooldowns.fire=Math.max(0,this.cooldowns.fire-4);this.cooldowns.reinforce=Math.max(0,this.cooldowns.reinforce-2);
        if(bonus)this.effect('text',400,210,{text:`提前迎敌 +${bonus}`,color:'#ffe39b'});
      }
      const wave=this.level.waves[this.wave++];
      for(const b of wave.branches) {
        let at=0;
        for(const [type,aux,maxSame,count,interval,wait,fixed,lane] of b.spawns) {
          for(let i=0;i<count;i++)this.pending.push({at:this.time+at+(i+1)*Math.max(interval,1)/30,
            type:aux&&maxSame>0&&Math.floor(i/maxSame)%2?aux:type,route:b.route,
            lane:fixed?lane:i%3});
          at+=count*Math.max(interval,1)/30+(wait+2)/30;
        }
      }
      this.pending.sort((a,b)=>a.at-b.at);
      this.nextIn=this.wave<this.level.waves.length?this.level.waves[this.wave].delay:Infinity;
      this.effect('text',400,185,{text:`第 ${this.wave} 波`,color:'#fff1c6'});this.event('wave');return true;
    }
    spawn(type,route=0,lane=0,distance=0) {
      const stats=DATA.enemies[type];if(!stats)throw new Error(`Missing enemy stats: ${type}`);
      const paths=this.paths[route%this.paths.length],path=paths[lane%paths.length];
      const factor=this.difficulty==='casual'?.7:this.difficulty==='veteran'?1:.8;
      const hp=this.difficulty==='normal'&&stats.healthNormal?stats.healthNormal:Math.round(stats.health*factor);
      const p=pointAt(path,distance),enemy={id:++this.id,type,path,distance,...p,lastX:p.x,
        hp,maxHp:hp,speed:stats.speed*30,gold:stats.gold||0,cost:stats.cost||1,
        armor:stats.armor||0,magicArmor:stats.magicArmor||0,flying:!!stats.isFlying,
        damage:((stats.minDamage||5)+(stats.maxDamage||10))/2,attack:0,
        dead:false,slow:0,boss:/Boss|Efreeti$/.test(type),sprite:type};
      this.enemies.push(enemy);return enemy;
    }
    damage(enemy,amount,type='physical') {
      if(enemy.dead||enemy.hp<=0)return;
      const armor=type==='true'?0:type==='magic'?enemy.magicArmor:enemy.armor;
      enemy.hp-=Math.max(1,amount*(1-clamp(armor,0,95)/100));
      if(enemy.hp<=0) {
        enemy.hp=0;enemy.dead=true;this.gold+=enemy.gold;this.kills++;
        this.effect('death',enemy.x,enemy.y,{color:enemy.flying?'#d2e8a3':'#b64c38'});
        this.effect('text',enemy.x,enemy.y-18,{text:`+${enemy.gold}`,color:'#ffdf83'});this.event('kill');
        if(this.kills%30===0&&this.hero.level<10){this.hero.level++;this.hero.damage+=2;this.hero.maxHp+=15;this.hero.hp=this.hero.maxHp;}
      }
    }
    cast(skill,x,y) {
      if(this.status!=='playing'||!Object.hasOwn(this.cooldowns,skill)||this.cooldowns[skill]>0||x<0||x>800||y<0||y>600)return false;
      const road=this.nearestRoad(x,y);if(road.distance>(skill==='reinforce'?30:70))return false;
      if(skill==='fire') {
        this.cooldowns.fire=80;
        for(let i=0;i<5;i++)this.projectiles.push({kind:'meteor',x:x-70+i*30,y:-50-i*40,
          targetX:x+(i-2)*20,targetY:y+(i%2)*16,life:0,duration:.5+i*.16,damage:50,area:60});
        this.event('fire');
      } else {
        this.cooldowns.reinforce=10;
        for(let i=0;i<2;i++)this.soldiers.push({id:++this.id,owner:'reinforce',offset:i*16,
          x:road.x+i*16,y:road.y,tx:road.x+i*16,ty:road.y,hp:80,maxHp:80,
          damage:5,armor:10,cooldown:0,respawn:0,expires:this.time+20,sprite:'SoldierReinforcementLevel2A'});
        this.effect('rally',road.x,road.y);this.event('reinforce');
      }
      return true;
    }
    effect(kind,x,y,extra={}) { this.effects.push({kind,x,y,life:0,duration:kind==='text'?1.3:.7,...extra}); }
    tick(dt) {
      if(this.status!=='playing'||!Number.isFinite(dt)||dt<=0)return;
      dt=Math.min(dt,.1);this.time+=dt;
      for(const k of Object.keys(this.cooldowns))this.cooldowns[k]=Math.max(0,this.cooldowns[k]-dt);
      if(Number.isFinite(this.nextIn)){this.nextIn-=dt;if(this.nextIn<=0)this.nextWave();}
      while(this.pending.length&&this.pending[0].at<=this.time) {
        const p=this.pending.shift();this.spawn(p.type,p.route,p.lane);
      }
      this.updateSoldiers(dt);this.updateEnemies(dt);this.updateTowers(dt);this.updateProjectiles(dt);
      for(const e of this.effects)e.life+=dt;
      this.effects=this.effects.filter(e=>e.life<e.duration);this.enemies=this.enemies.filter(e=>!e.dead);
      if(this.lives<=0){this.lives=0;this.status='lost';this.event('lost');}
      else if(this.wave===this.level.waves.length&&!this.pending.length&&!this.enemies.length) {
        const boss={6:'EnemyEfreeti',11:'EnemyGorillaBoss',15:'EnemyFinalBoss'}[this.level.id];
        if(boss&&!this.bossSpawned) {
          this.bossSpawned=true;this.spawn(boss,0,0);this.effect('text',400,170,{text:'首领来袭',color:'#ff9471'});this.event('boss');
        } else {this.status='won';this.event('won',{stars:this.lives>=18?3:this.lives>=10?2:1});}
      }
    }
    // Combat systems are kept separate from input and presentation.
    updateSoldiers(dt) {
      this.soldiers=this.soldiers.filter(s=>!s.expires||s.expires>this.time);
      for(const s of [this.hero,...this.soldiers]) {
        s.cooldown=Math.max(0,s.cooldown-dt);
        if(s.hp<=0) {
          if(s.owner==='reinforce')continue;
          s.respawn-=dt;
          if(s.respawn<=0){s.hp=s.maxHp;s.x=s.tx;s.y=s.ty;this.effect('rally',s.x,s.y);}
          continue;
        }
        let target=this.enemies.filter(e=>!e.dead&&!e.flying&&Math.hypot(e.x-s.tx,e.y-s.ty)<65)
          .sort((a,b)=>dist(a,s)-dist(b,s))[0];
        // An explicit hero move takes priority over an old melee engagement.
        if(s.owner==='hero'&&Math.hypot(s.tx-s.x,s.ty-s.y)>40)target=null;
        const goal=target?{x:target.x-8,y:target.y}:{x:s.tx,y:s.ty},d=dist(s,goal);
        s.moving=d>4;
        if(d>4) {
          const step=Math.min(d,dt*(s.owner==='hero'?105:70));s.x+=(goal.x-s.x)/d*step;s.y+=(goal.y-s.y)/d*step;
        }
        s.target=target?.id;
        if(target&&dist(s,target)<24&&s.cooldown<=0) {
          this.damage(target,s.damage,'physical');s.cooldown=s.owner==='hero'?.8:1;
          this.effect('slash',target.x,target.y-8,{color:s.owner==='hero'?'#e0d3a5':'#f5f2d1'});
        } else if(!target)s.hp=Math.min(s.maxHp,s.hp+dt*(s.owner==='hero'?10:3));
      }
      this.soldiers=this.soldiers.filter(s=>s.owner!=='reinforce'||s.hp>0);
    }
    updateEnemies(dt) {
      const occupied=new Set();
      for(const e of this.enemies) {
        if(e.dead)continue;
        e.attack=Math.max(0,e.attack-dt);e.slow=Math.max(0,e.slow-dt);
        const blocker=!e.flying&&[this.hero,...this.soldiers].find(s=>s.hp>0&&!occupied.has(s.id)&&dist(s,e)<22);
        if(blocker) {
          occupied.add(blocker.id);e.blocked=true;
          if(e.attack<=0) {
            blocker.hp-=e.damage*(1-(blocker.armor||0)/100);e.attack=1;
            if(blocker.hp<=0){blocker.hp=0;blocker.respawn=blocker.owner==='hero'?20:10;this.effect('death',blocker.x,blocker.y,{color:'#d8c9ab'});}
          }
        } else {
          e.blocked=false;e.distance+=e.speed*dt*(e.slow>0?.55:1);e.lastX=e.x;
          Object.assign(e,pointAt(e.path,e.distance));
          if(e.distance>=e.path.length) {
            this.lives-=e.boss?20:e.cost;e.dead=true;
            this.effect('leak',clamp(e.x,20,780),clamp(e.y,20,580));this.event('leak');
          }
        }
      }
    }
    updateTowers(dt) {
      for(const t of this.towers) {
        t.cooldown=Math.max(0,t.cooldown-dt);t.flash=Math.max(0,t.flash-dt);
        if(t.type==='barracks'||t.cooldown>0)continue;
        const s=this.stats(t.type,t.level,t.branch),range=(s.远程||280)/2;
        const candidates=this.enemies.filter(e=>!e.dead&&!(e.flying&&t.type==='artillery')
          &&Math.hypot(e.x-t.x,(e.y-t.y)/.7)<range);
        const target=candidates.sort((a,b)=>(a.path.length-a.distance)-(b.path.length-b.distance))[0];
        if(!target)continue;
        const damage=(s.minDamage+s.maxDamage)/2*(t.type==='archer'?2:1);
        t.cooldown=(s.reload||45)/30;t.flash=.18;t.target=target.id;
        this.projectiles.push({kind:t.type==='artillery'?'bomb':t.type==='mage'?'magic':'arrow',
          x:t.x,y:t.y-35,targetId:target.id,targetX:target.x,targetY:target.y-10,
          life:0,duration:Math.max(.12,dist(t,target)/450),damage,
          area:t.type==='artillery'?(s.area||70)/2:0,branch:t.branch});
        this.event('shoot',{kind:t.type});
      }
    }
    updateProjectiles(dt) {
      for(const p of this.projectiles) {
        p.life+=dt;
        if(p.life<p.duration)continue;
        if(p.kind==='bomb'||p.kind==='meteor') {
          const point={x:p.targetX,y:p.targetY};
          for(const e of this.enemies)if(!e.dead&&!e.flying&&dist(e,point)<p.area) {
            this.damage(e,p.damage,p.kind==='meteor'?'true':'physical');
            if(p.branch==='dwaarp')e.slow=2;
          }
          this.effect('explosion',p.targetX,p.targetY,{color:p.kind==='meteor'?'#ff8545':'#e8b662',radius:p.area});
          this.event('impact');
        } else {
          const e=this.enemies.find(e=>e.id===p.targetId&&!e.dead);
          if(e) {
            this.damage(e,p.damage,p.kind==='magic'?'magic':'physical');
            if(p.branch==='totem')e.slow=1.5;
            this.effect('spark',e.x,e.y-10,{color:p.kind==='magic'?'#74dcff':'#f9dd9f'});
            if(p.branch==='necromancer'&&e.dead&&this.soldiers.filter(s=>s.owner==='reinforce').length<8)
              this.soldiers.push({id:++this.id,owner:'reinforce',offset:0,x:e.x,y:e.y,tx:e.x,ty:e.y,
                hp:60,maxHp:60,armor:0,damage:8,cooldown:0,expires:this.time+12,sprite:'SoldierAssassin'});
          }
        }
      }
      this.projectiles=this.projectiles.filter(p=>p.life<p.duration);
    }
  }
  const api={Game,TYPES,BRANCHES,pathFrom,pointAt,dist,clamp};root.KR=api;
  if(typeof module!=='undefined')module.exports=api;
})(globalThis);
