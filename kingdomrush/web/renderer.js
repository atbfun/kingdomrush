(function(root) {
  'use strict';
  const valid=img=>!!(img&&img.complete&&img.naturalWidth>0);
  class Assets {
    constructor(){this.images=new Map();this.failed=new Set();}
    get(path) {
      if(this.images.has(path))return this.images.get(path);
      const img=new Image();this.images.set(path,img);
      img.onerror=()=> {
        if(!img.dataset.retried){img.dataset.retried='yes';img.src='../assets/'+path;}
        else this.failed.add(path);
      };
      img.src='assets/'+path;return img;
    }
  }
  const towerNames={
    archer:['GTowerArcherStandar1','GTowerArcherStandar2','GTowerArcherStandar3'],
    mage:['GTowerMageStandar1','GTowerMageStandar2','GTowerMageStandar3'],
    artillery:['GTowerEngineerStandar1','GTowerEngineerStandar2','GTowerEngineerStandar3'],
    barracks:['GTowerSoldierStandar1','GTowerSoldierStandar2','GTowerSoldierStandar3']
  };
  const branchIds={crossbow:1634,totem:1485,archmage:1088,necromancer:988,dwaarp:1390,mech:1293,assassin:531,templar:518};
  class Renderer {
    constructor(canvas) {
      this.canvas=canvas;this.ctx=canvas.getContext('2d',{willReadFrequently:true});this.assets=new Assets();
      this.selected=-1;this.hover=-1;this.mode=null;this.pointer={x:400,y:300};this.showRanges=false;
      this.reduced=matchMedia('(prefers-reduced-motion: reduce)').matches;
      this.byId=Object.fromEntries(Object.entries(root.KR_SPRITES).map(([k,v])=>[v.id,k]));
    }
    towerName(t){return t.branch?this.byId[branchIds[t.branch]]:towerNames[t.type][Math.min(t.level,3)-1];}
    sprite(name,x,y,{frame=0,scale=1,flip=false}={}) {
      const a=root.KR_SPRITES[name];if(!a)return false;
      const img=this.assets.get(a.file);if(!valid(img))return false;
      const c=this.ctx,w=a.width*scale,h=a.height*scale,f=Number.isFinite(frame)?Math.floor(frame)%a.frames:0;
      c.save();c.translate(x,y+5);if(flip)c.scale(-1,1);
      c.drawImage(img,f*a.width,0,a.width,a.height,-w/2,-h,w,h);c.restore();return true;
    }
    ellipse(x,y,rx,ry,fill,stroke) {
      const c=this.ctx;c.beginPath();c.ellipse(x,y,Math.max(.1,rx),Math.max(.1,ry),0,0,Math.PI*2);
      if(fill){c.fillStyle=fill;c.fill();}if(stroke){c.strokeStyle=stroke;c.stroke();}
    }
    background(game,forceFallback=false) {
      const c=this.ctx;c.fillStyle=game.level.biome==='underground'?'#505451':game.level.biome==='jungle'?'#5b8d3d':'#b79b61';c.fillRect(0,0,800,600);
      const img=this.assets.get(game.level.map);
      if(!forceFallback&&valid(img))c.drawImage(img,0,0,800,600);
      else {
        for(let i=0;i<100;i++) {
          const x=(i*113)%800,y=(i*79)%600;c.fillStyle=i%2?'#ffffff09':'#162d1c0b';
          this.ellipse(x,y,12+i%17,4+i%9,c.fillStyle);
        }
        c.lineCap='round';c.lineJoin='round';
        for(const route of game.paths){const p=route[0].points;c.beginPath();c.moveTo(...p[0]);for(const pt of p)c.lineTo(...pt);
          c.lineWidth=44;c.strokeStyle='#786344';c.stroke();c.lineWidth=35;c.strokeStyle='#cfb779';c.stroke();}
      }
      const vignette=c.createRadialGradient(400,300,180,400,300,530);vignette.addColorStop(0,'#0000');vignette.addColorStop(1,'#17251f30');c.fillStyle=vignette;c.fillRect(0,0,800,600);
    }
    draw(game,fallback=false) {
      const c=this.ctx;c.save();c.setTransform(1,0,0,1,0,0);c.clearRect(0,0,800,600);
      this.background(game,fallback);const time=game.time;
      for(const h of game.holders) {
        const tower=game.towerAt(h.index),active=h.index===this.selected,hover=h.index===this.hover;
        if(active||hover){c.lineWidth=2;this.ellipse(h.x,h.y+4,42,21,active?'#fff0b822':'#fff7c51a',active?'#fff0b8':'#fff7c5aa');}
        if(!tower&&!this.sprite('TowerHolder',h.x,h.y+13)) {
          this.ellipse(h.x,h.y+5,30,15,'#bd9d64','#785d37');c.fillStyle='#e5d4ab';c.fillRect(h.x-3,h.y-18,6,24);c.fillStyle='#6f5939';c.fillRect(h.x-9,h.y-18,18,13);
        }
        if(!tower) {
          c.font='bold 10px system-ui';c.textAlign='center';c.fillStyle=active?'#fff9e8':'#594d32';
          c.fillText(String(h.index+1).padStart(2,'0'),h.x,h.y+25);
        }
        if(tower&&(active||this.showRanges)) {
          const s=game.stats(tower.type,tower.level,tower.branch),r=(s.远程||220)/2;
          c.lineWidth=1.2;c.setLineDash([5,5]);this.ellipse(h.x,h.y,r,r*.7,'#d6eebc18','#d7efb4a0');c.setLineDash([]);
          if(tower.type==='barracks'){c.strokeStyle='#ddedac99';c.beginPath();c.moveTo(h.x,h.y);c.lineTo(...tower.rally);c.stroke();this.flag(...tower.rally,'#7a9c5c',false);}
        }
      }
      // Stable feet-based sorting lets units walk behind towers.
      const objects=[...game.towers.map(t=>({kind:'tower',obj:t})),...game.enemies.map(e=>({kind:'enemy',obj:e})),
        ...game.soldiers.map(s=>({kind:'soldier',obj:s})),{kind:'hero',obj:game.hero}].sort((a,b)=>a.obj.y-b.obj.y);
      for(const {kind,obj:o} of objects) {
        if(kind==='tower')this.tower(o,time);else this.unit(o,kind,time);
      }
      for(const p of game.projectiles)this.projectile(p,game);
      for(const e of game.effects)this.effect(e);
      for(const route of game.paths) {
        const start=route[0].points.find(p=>p[0]>=25&&p[0]<=775&&p[1]>=40&&p[1]<=555);
        if(start)this.flag(start[0],start[1]-14,'#a63e2e',true,game.time);
      }
      if(this.mode) {
        const {x,y}=this.pointer,color=this.mode==='fire'?'#ffbb6c':'#c8e6a0';
        c.setLineDash([6,4]);c.lineWidth=2;this.ellipse(x,y,this.mode==='fire'?60:30,this.mode==='fire'?42:21,color+'25',color);c.setLineDash([]);
        c.strokeStyle=color;c.beginPath();c.moveTo(x-12,y);c.lineTo(x+12,y);c.moveTo(x,y-12);c.lineTo(x,y+12);c.stroke();
      }
      c.restore();
    }
    tower(t,time) {
      const c=this.ctx;
      if(!this.sprite(this.towerName(t),t.x,t.y+13)) {
        this.ellipse(t.x,t.y+7,30,13,'#342c2580');c.fillStyle='#bca980';c.strokeStyle='#514737';c.lineWidth=2;
        c.fillRect(t.x-20,t.y-33,40,38);c.strokeRect(t.x-20,t.y-33,40,38);c.fillStyle=root.KR.TYPES[t.type].color;
        c.beginPath();c.moveTo(t.x-28,t.y-32);c.lineTo(t.x,t.y-60);c.lineTo(t.x+28,t.y-32);c.closePath();c.fill();c.stroke();
      }
      const color=root.KR.TYPES[t.type].color;
      for(let i=0;i<t.level;i++)this.ellipse(t.x+(i-(t.level-1)/2)*7,t.y+16,2.3,2.3,color,'#453c2a');
      if(t.flash>0){const alpha=t.flash/.18;this.ellipse(t.x,t.y-42,5*alpha+2,5*alpha+2,color);}
    }
    unit(o,kind,time) {
      const c=this.ctx;if(o.dead)return;
      if(o.hp<=0) {
        if(kind==='hero'){c.font='bold 13px system-ui';c.textAlign='center';c.fillStyle='#eee1c8';c.fillText(`复活 ${Math.ceil(o.respawn)}s`,o.x,o.y);}
        return;
      }
      const hero=kind==='hero',enemy=kind==='enemy',scale=o.boss?1.15:hero?1.18:1;
      const bob=o.flying&&!this.reduced?Math.sin(time*7+o.id)*3:0;
      if(hero)this.ellipse(o.x,o.y+3,19,9,'#e8c45b30','#ffe5a7cc');
      this.ellipse(o.x,o.y+4,o.boss?29:12,o.boss?10:4,'#28321d35');
      const frame=this.reduced?0:(o.moving===false||o.blocked?time*5:time*18)+(typeof o.id==='number'?o.id:0);
      if(!this.sprite(o.sprite,o.x,o.y+bob,{frame,scale,flip:enemy&&o.x>o.lastX})) {
        c.fillStyle=enemy?'#8b5b41':hero?'#a5b7c8':'#c7c0ab';c.strokeStyle='#2c3329';c.lineWidth=2;
        this.ellipse(o.x,o.y-11,enemy?9:7,12,c.fillStyle,'#293429');this.ellipse(o.x,o.y-25,6,6,'#d1b48a','#293429');
      }
      if(o.hp<o.maxHp||hero||o.boss) {
        const w=o.boss?64:hero?34:25,y=o.y-(o.boss?70:hero?43:35);
        c.fillStyle='#202c24';c.fillRect(o.x-w/2-1,y-1,w+2,5);c.fillStyle=enemy?'#d46847':'#a4cd73';c.fillRect(o.x-w/2,y,w*Math.max(0,o.hp/o.maxHp),3);
      }
    }
    flag(x,y,color,arrow=false,time=0) {
      const c=this.ctx;c.save();c.translate(x,y);c.lineWidth=2;c.strokeStyle='#53452c';c.beginPath();c.moveTo(0,-24);c.lineTo(0,6);c.stroke();
      c.fillStyle=color;c.beginPath();c.moveTo(1,-24);c.quadraticCurveTo(13,-27+Math.sin(time*3),21,-22);c.lineTo(16,-14);c.lineTo(1,-14);c.fill();
      if(arrow){c.fillStyle='#fff1c7';c.font='bold 12px system-ui';c.fillText('‹',7,-15);}c.restore();
    }
    projectile(p,game) {
      const c=this.ctx,t=Math.min(1,p.life/p.duration),target=game.enemies.find(e=>e.id===p.targetId);
      const tx=target&&!target.dead?target.x:p.targetX,ty=target&&!target.dead?target.y-10:p.targetY;
      const x=p.x+(tx-p.x)*t,y=p.y+(ty-p.y)*t-(p.kind==='bomb'?Math.sin(t*Math.PI)*60:0);
      c.save();c.translate(x,y);
      if(p.kind==='arrow'){c.rotate(Math.atan2(ty-p.y,tx-p.x));c.strokeStyle='#493d25';c.lineWidth=2;c.beginPath();c.moveTo(-11,0);c.lineTo(4,0);c.stroke();c.fillStyle='#eee3c2';c.fillRect(-11,-2,4,4);}
      else if(p.kind==='magic'){const g=c.createRadialGradient(0,0,1,0,0,10);g.addColorStop(0,'#e7fcff');g.addColorStop(.3,'#67cfff');g.addColorStop(1,'#67cfff00');c.fillStyle=g;c.fillRect(-10,-10,20,20);}
      else if(p.kind==='meteor'){c.rotate(.5);c.fillStyle='#ff9c4d88';c.beginPath();c.moveTo(-9,0);c.lineTo(-8,-45);c.lineTo(9,0);c.fill();this.ellipse(0,0,9,12,'#ffe9a0','#c55c2b');}
      else this.ellipse(0,0,5,5,'#343d37','#ddd0a5');c.restore();
    }
    effect(e) {
      const c=this.ctx,t=e.life/e.duration,a=1-t;c.save();c.globalAlpha=a;
      if(e.kind==='text'){c.textAlign='center';c.font=e.text.startsWith('第')?'bold 27px system-ui':'bold 14px system-ui';c.lineWidth=4;c.strokeStyle='#34402bd0';c.strokeText(e.text,e.x,e.y-t*32);c.fillStyle=e.color;c.fillText(e.text,e.x,e.y-t*32);}
      else if(e.kind==='explosion') {
        this.ellipse(e.x,e.y,(e.radius||32)*(t*.7+.3),(e.radius||32)*(.2+t*.4),'#e3a75720',e.color);
        for(let i=0;i<12;i++){const angle=i*2.4,r=5+t*(22+i*2);this.ellipse(e.x+Math.cos(angle)*r,e.y+Math.sin(angle)*r*.7,4*a+1,4*a+1,i%2?e.color:'#fff2bd');}
      } else if(e.kind==='death'||e.kind==='spark'||e.kind==='slash') {
        for(let i=0;i<6;i++){const angle=i*Math.PI/3;this.ellipse(e.x+Math.cos(angle)*t*22,e.y+Math.sin(angle)*t*16,2*a+1,2*a+1,e.color||'#e8d4a2');}
      } else {c.lineWidth=2;this.ellipse(e.x,e.y,10+t*32,5+t*16,null,e.color||'#eff3c0');}
      c.restore();
    }
  }
  root.KRRenderer={Renderer,Assets,isImgValid:valid,towerNames,branchIds};
})(globalThis);
