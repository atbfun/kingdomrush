(function() {
  'use strict';
  function initGameApp() {
    const $=id=>document.getElementById(id),canvas=$('battle');
    const renderer=new KRRenderer.Renderer(canvas);
    const saveKey='atb-kingdomrush-frontiers-v1';
    let save={stars:{},muted:false,difficulty:'normal'};
    try {
      const raw=JSON.parse(localStorage.getItem(saveKey)||'null');
      if(raw&&typeof raw==='object') {
        save.muted=raw.muted===true;
        if(['casual','normal','veteran'].includes(raw.difficulty))save.difficulty=raw.difficulty;
        for(let i=1;i<=15;i++)if(Number.isInteger(raw.stars?.[i])&&raw.stars[i]>=1&&raw.stars[i]<=3)save.stars[i]=raw.stars[i];
      }
    } catch { /* A blocked or corrupt save never blocks a new game. */ }
    const audio=new KRGameAudio(save.muted);
    let game,selected=-1,mode=null,rallyIndex=-1,speed=1,last=0,accumulator=0,uiTimer=0,toastTimer;
    let autoResume=null,hiddenPause=false,lastInspector='',lastHud='',renderFailures=0;
    const persist=()=>{try{localStorage.setItem(saveKey,JSON.stringify(save));}catch{}};
    function toast(message) {
      $('toast').textContent=message;$('toast').classList.add('visible');clearTimeout(toastTimer);
      toastTimer=setTimeout(()=>$('toast').classList.remove('visible'),2600);
    }
    function setMode(value,index=-1) {
      mode=value;rallyIndex=index;renderer.mode=value;
      for(const [id,key] of [['hero-button','hero'],['fire-button','fire'],['reinforce-button','reinforce']]) {
        $(id).classList.toggle('active',mode===key);$(id).setAttribute('aria-pressed',String(mode===key));
      }
      $('target-hint').hidden=!mode;
      $('target-hint').firstChild.textContent=mode==='hero'?'点击道路移动英雄 ':mode==='rally'?'在兵营附近的道路设置集结点 ':mode==='fire'?'点击道路施放火雨 ':'点击道路召唤援军 ';
    }
    function onEvent(e) {
      audio.event(e);
      if(e.type==='wave')audio.setMusic(game.level.biome,true);
      if(e.type==='won') {
        save.stars[game.level.id]=Math.max(save.stars[game.level.id]||0,e.stars);persist();showResult(true,e.stars);
      }
      if(e.type==='lost')showResult(false,0);
    }
    function closeDialogs() {
      autoResume=null;for(const d of document.querySelectorAll('dialog[open]'))d.close();
    }
    function loadLevel(index,begin=false) {
      closeDialogs();game=new KR.Game({levelIndex:index,difficulty:save.difficulty,onEvent});
      selected=-1;renderer.selected=-1;setMode(null);lastInspector='';lastHud='';speed=1;accumulator=0;
      $('speed-button').textContent='1×';$('intro').hidden=begin;
      if(begin){game.start();audio.setMusic(game.level.biome);}
      $('mission-name').textContent=game.level.name;$('mission-number').textContent=String(game.level.id).padStart(2,'0');
      $('biome-label').textContent={desert:'沙漠战役',jungle:'丛林战役',underground:'地下战役'}[game.level.biome];
      $('campaign-count').textContent=String(game.level.id).padStart(2,'0')+' / 15';
      $('site-select').innerHTML='<option value="-1">在战场上选择空地</option>'+game.holders.map(h=>`<option value="${h.index}">建造点 ${String(h.index+1).padStart(2,'0')}</option>`).join('');
      renderer.assets.get(game.level.map);
      for(const h of game.level.waves.flatMap(w=>w.branches).flatMap(b=>b.spawns)) {
        for(const name of h.slice(0,2))if(KR_SPRITES[name])renderer.assets.get(KR_SPRITES[name].file);
      }
      updateUI();renderInspector();renderer.draw(game);
    }
    function start() {
      audio.unlock();$('intro').hidden=true;game.start();audio.musicName='';audio.setMusic(game.level.biome);
      toast('选择建造点布防，准备好后召唤第一波。');updateUI();
    }
    function selectSite(index) {
      selected=Number(index);if(!game.holders[selected])selected=-1;
      renderer.selected=selected;$('site-select').value=String(selected);lastInspector='';setMode(null);renderInspector();
    }
    function towerArt(name) {
      const a=KR_SPRITES[name];return a?`<span class="tower-art" style="background-image:url('assets/${a.file}')"></span>`:'<span class="tower-art"></span>';
    }
    function renderInspector() {
      const t=game.towerAt(selected),key=[selected,t?.level,t?.branch,game.status].join('|');
      if(key===lastInspector)return;lastInspector=key;
      $('inspector-title').textContent=t?(KR.BRANCHES[t.branch]||KR.TYPES[t.type].name):selected>=0?`建造点 ${String(selected+1).padStart(2,'0')}`:'构筑你的防线';
      $('inspector-description').textContent=t?KR.TYPES[t.type].description:selected>=0?'选择一座防御塔，让这里成为坚固的防线。':'选择一处建造点，部署你的第一座防御塔。';
      if(!t) {
        $('inspector').innerHTML='<div class="tower-grid">'+Object.entries(KR.TYPES).map(([type,v],i)=>`<button class="tower-card" data-build="${type}" data-cost="${game.stats(type).cost}" aria-label="建造${v.name}，${game.stats(type).cost}金币"><kbd>${i+1}</kbd>${towerArt(KRRenderer.towerNames[type][0])}<strong>${v.name}</strong><small>${game.stats(type).cost} 金币</small></button>`).join('')+'</div>';
      } else {
        const s=game.stats(t.type,t.level,t.branch),damage=`${s.minDamage}–${s.maxDamage}`+(t.type==='archer'?' ×2':'');
        let actions='';
        if(t.level<3)actions=`<button class="upgrade-button" data-upgrade="" data-cost="${game.stats(t.type,t.level+1).cost}"><span>升级至 ${t.level+1} 级 ↑</span><b>${game.stats(t.type,t.level+1).cost} 金币</b></button>`;
        else if(t.level===3)actions=KR.TYPES[t.type].branches.map(b=>`<button class="upgrade-button" data-upgrade="${b}" data-cost="${game.stats(t.type,4,b).cost}"><span>${KR.BRANCHES[b]} ↑</span><b>${game.stats(t.type,4,b).cost} 金币</b></button>`).join('');
        if(t.type==='barracks')actions+='<button class="rally-button" data-rally>调整士兵集结点</button>';
        $('inspector').innerHTML=`<div class="tower-detail">${towerArt(renderer.towerName(t))}<strong>${KR.BRANCHES[t.branch]||KR.TYPES[t.type].name} <small>Lv.${t.level}</small></strong><div class="stat-row"><span>${t.type==='barracks'?'士兵伤害':'攻击伤害'}</span><b>${damage}</b></div><div class="stat-row"><span>${t.type==='barracks'?'士兵数量':'攻击间隔'}</span><b>${t.type==='barracks'?'3 名':((s.reload||30)/30).toFixed(1)+' 秒'}</b></div>${actions}<button class="sell-button" data-sell>出售防御塔 · 返还 ${Math.floor(t.spent*.6)} 金币</button></div>`;
      }
      updateButtons();
    }
    function updateButtons() {
      for(const button of $('inspector').querySelectorAll('[data-cost]'))button.disabled=!game.interactive()||game.gold<Number(button.dataset.cost);
    }
    function build(type) {
      if(!$('intro').hidden){toast('请先点击「开始守卫」。');return;}
      if(selected<0){toast('先在战场上选择建造点。');return;}
      if(game.build(selected,type)){lastInspector='';renderInspector();updateUI();}
      else toast('此处无法建造，或金币不足。');
    }
    $('inspector').addEventListener('click',e=> {
      const b=e.target.closest('button');if(!b)return;audio.unlock();
      if(b.hasAttribute('data-build'))build(b.dataset.build);
      if(b.hasAttribute('data-upgrade')) {
        if(game.upgrade(selected,b.dataset.upgrade||null)){lastInspector='';renderInspector();updateUI();}
        else toast('金币不足或该塔已达到最高等级。');
      }
      if(b.hasAttribute('data-sell')){game.sell(selected);lastInspector='';renderInspector();updateUI();}
      if(b.hasAttribute('data-rally'))setMode('rally',selected);
    });
    function updateUI() {
      const state=[game.gold,game.lives,game.wave,game.status].join('|');
      if(state!==lastHud) {
        lastHud=state;$('gold').textContent=game.gold;$('lives').textContent=game.lives;
        $('wave').innerHTML=`${game.wave}<small> / ${game.level.waves.length}</small>`;
        $('map-status').textContent={ready:'准备布防',playing:game.wave?'战斗进行中':'准备布防',paused:'战场已暂停',won:'防守成功',lost:'防线失守'}[game.status];
        $('site-count').textContent=`${game.holders.length-game.towers.length} 处空地`;
        updateButtons();
      }
      $('wave-button').disabled=game.status!=='playing'||game.wave>=game.level.waves.length;
      $('wave-button').innerHTML=game.wave>=game.level.waves.length?'抵御最后的敌人':`召唤第 ${game.wave+1} 波 <svg><use href="#i-arrow"/></svg>`;
      $('battle-tip').textContent=game.status==='paused'?'战场已暂停，可以从容规划。':game.status==='won'?'防守成功！你的战果已自动保存。':game.status==='lost'?'重新部署，尝试不同的防御组合。':game.wave===0?'先点击空地建造防御塔，再召唤敌人。':Number.isFinite(game.nextIn)?`下一波 ${Math.ceil(Math.max(0,game.nextIn))} 秒 · 提前迎敌可获得金币。`:'最后一波，守住防线！';
      for(const skill of ['fire','reinforce']) {
        const seconds=Math.ceil(game.cooldowns[skill]);$(`${skill}-cooldown`).textContent=seconds||'';
        $(`${skill}-label`).textContent=seconds?`${seconds} 秒后就绪`:skill==='fire'?'范围轰击':'支援防线';
        $(`${skill}-button`).disabled=game.status!=='playing'||seconds>0;
      }
      $('hero-status').textContent=game.hero.hp>0?`英雄 · Lv.${game.hero.level}`:`复活 ${Math.ceil(game.hero.respawn)}s`;
      const completed=Object.keys(save.stars).length;$('progress-label').textContent=`${completed} / 15`;$('progress-fill').style.width=completed/15*100+'%';
    }
    function skill(value) {
      if(game.status!=='playing'){toast('开始战斗后可使用技能。');return;}
      if(game.cooldowns[value]>0){toast('技能还在冷却中。');return;}
      audio.unlock();setMode(mode===value?null:value);
    }
    function wave() {
      audio.unlock();if(game.nextWave()){toast(`第 ${game.wave} 波来袭，守住防线！`);updateUI();}
    }
    function pauseGame() {
      if(game.status==='paused'){resume();return;}
      if(game.status!=='playing')return;
      game.pause();setMode(null);audio.suspend(true);$('pause-dialog').showModal();updateUI();
    }
    function resume() {
      if(game.status==='paused')game.pause();$('pause-dialog').close();audio.suspend(false);last=performance.now();updateUI();
    }
    function openDialog(id) {
      setMode(null);
      if(game.status==='playing'){game.pause();autoResume=id;audio.suspend(true);}
      $(id).showModal();updateUI();
    }
    function showCampaign() {
      const wasExplicitPause=$('pause-dialog').open;
      if(wasExplicitPause)$('pause-dialog').close();
      $('result-dialog').close();$('difficulty').value=save.difficulty;
      $('campaign-grid').innerHTML=KR_DATA.levels.map(l=>`<button class="stage-card${l.id===game.level.id?' current':''}" data-stage="${l.id-1}" aria-label="第${l.id}关 ${l.name}"><img src="assets/${l.map}" alt="${l.name}战场" loading="lazy"><span>${String(l.id).padStart(2,'0')} · ${l.name}</span><small>${'✦'.repeat(save.stars[l.id]||0)||'等待你的指挥'}</small></button>`).join('');
      for(const img of $('campaign-grid').querySelectorAll('img'))img.onerror=()=>{if(!img.dataset.retried){img.dataset.retried='yes';img.src='../'+img.getAttribute('src');}else img.hidden=true;};
      openDialog('campaign-dialog');
      if(wasExplicitPause)autoResume='campaign-dialog';
    }
    function showResult(won,stars) {
      setMode(null);audio.music?.pause();
      $('result-eyebrow').textContent=won?'VICTORY':'TRY ANOTHER STRATEGY';
      $('result-stars').textContent=won?'✦'.repeat(stars)+'✧'.repeat(3-stars):'防线失守';$('result-stars').classList.toggle('lost',!won);
      $('result-title').textContent=won?'防线，屹立不倒。':'再来一次，指挥官。';
      $('result-description').textContent=`${game.level.name} · 击败 ${game.kills} 名敌人 · 剩余 ${game.lives} 生命`;
      $('next-stage-button').hidden=!won;$('next-stage-button').textContent=game.level.id===15?'战役完成 · 查看地图':'前往下一关 →';
      $('result-dialog').showModal();updateUI();
    }
    function coords(e) {const r=canvas.getBoundingClientRect();return {x:(e.clientX-r.left)*800/r.width,y:(e.clientY-r.top)*600/r.height};}
    function nearestSite(p) {
      const radius=Math.max(26,22*800/canvas.getBoundingClientRect().width);
      return game.holders.map(h=>({h,d:Math.hypot(h.x-p.x,h.y-p.y)})).filter(v=>v.d<radius).sort((a,b)=>a.d-b.d)[0]?.h.index??-1;
    }
    canvas.addEventListener('pointermove',e=>{const p=coords(e);renderer.pointer=p;renderer.hover=nearestSite(p);});
    canvas.addEventListener('pointerleave',()=>{renderer.hover=-1;});
    canvas.addEventListener('pointerdown',e=> {
      if(!$('intro').hidden||document.querySelector('dialog[open]')||!game.interactive())return;
      e.preventDefault();canvas.focus({preventScroll:true});audio.unlock();const p=coords(e);renderer.pointer=p;
      if(mode) {
        const ok=mode==='hero'?game.moveHero(p.x,p.y):mode==='rally'?game.rally(rallyIndex,p.x,p.y):game.cast(mode,p.x,p.y);
        if(ok){setMode(null);updateUI();}else toast('请在有效的道路位置选择目标。');return;
      }
      const site=nearestSite(p);if(site>=0){selectSite(site);return;}
      if(Math.hypot(game.hero.x-p.x,game.hero.y-p.y)<28){setMode('hero');return;}
      selectSite(-1);
    });
    document.addEventListener('keydown',e=> {
      if(e.ctrlKey||e.metaKey||e.altKey||['INPUT','SELECT','TEXTAREA'].includes(e.target.tagName))return;
      if(document.querySelector('dialog[open]'))return;
      const key=e.key.toLowerCase();
      if(key==='escape'){setMode(null);selectSite(-1);return;}
      if(e.target.closest('button,a,input,select,textarea,[contenteditable="true"]'))return;
      if(!$('intro').hidden){if(key==='enter'){e.preventDefault();start();}return;}
      if(['1','2','3','4'].includes(key)){build(Object.keys(KR.TYPES)[Number(key)-1]);return;}
      if(key==='q')skill('fire');if(key==='e')skill('reinforce');if(key==='h')setMode(mode==='hero'?null:'hero');
      if(key==='n')wave();if(key==='p'||key===' '){e.preventDefault();pauseGame();}
    });
    $('start-button').onclick=start;$('site-select').onchange=e=>selectSite(e.target.value);
    $('hero-button').onclick=()=>{if(game.hero.hp>0&&game.interactive()&&$('intro').hidden)setMode(mode==='hero'?null:'hero');};
    $('fire-button').onclick=()=>skill('fire');$('reinforce-button').onclick=()=>skill('reinforce');
    $('cancel-target').onclick=()=>setMode(null);$('wave-button').onclick=wave;$('pause-button').onclick=pauseGame;
    $('resume-button').onclick=resume;$('restart-button').onclick=()=>{audio.suspend(false);loadLevel(game.levelIndex,true);};
    $('retry-button').onclick=()=>{audio.suspend(false);loadLevel(game.levelIndex,true);};
    $('next-stage-button').onclick=()=>{if(game.levelIndex===14)showCampaign();else loadLevel(game.levelIndex+1,true);};
    $('speed-button').onclick=()=>{speed=speed===1?2:speed===2?3:1;$('speed-button').textContent=speed+'×';};
    $('range-button').onclick=()=>{renderer.showRanges=!renderer.showRanges;$('range-button').setAttribute('aria-pressed',String(renderer.showRanges));$('range-state').textContent=renderer.showRanges?'开':'关';};
    function updateMute(){ $('sound-button').setAttribute('aria-pressed',String(audio.muted));$('sound-button').setAttribute('aria-label',audio.muted?'开启声音':'关闭声音');}
    $('sound-button').onclick=()=>{audio.unlock();save.muted=audio.toggle();persist();updateMute();};updateMute();
    $('fullscreen-button').onclick=()=>{const p=document.fullscreenElement?document.exitFullscreen?.():document.documentElement.requestFullscreen?.();if(p)p.catch(()=>toast('当前浏览器暂不支持全屏。'));else toast('当前浏览器暂不支持全屏。');};
    $('help-button').onclick=()=>openDialog('help-dialog');$('campaign-button').onclick=showCampaign;
    document.querySelectorAll('[data-close]').forEach(b=>b.onclick=()=>$(b.dataset.close).close());
    document.querySelectorAll('[data-campaign]').forEach(b=>b.onclick=showCampaign);
    for(const d of document.querySelectorAll('dialog'))d.addEventListener('close',()=> {
      if(autoResume===d.id){autoResume=null;if(game.status==='paused')game.pause();audio.suspend(false);last=performance.now();}
    });
    $('pause-dialog').addEventListener('cancel',e=>{e.preventDefault();resume();});
    $('campaign-grid').onclick=e=> {
      const b=e.target.closest('[data-stage]');if(!b)return;
      save.difficulty=$('difficulty').value;persist();audio.unlock();audio.suspend(false);loadLevel(Number(b.dataset.stage),true);
      toast(`已抵达${game.level.name}，准备布防。`);
    };
    document.addEventListener('visibilitychange',()=> {
      if(document.hidden){hiddenPause=game.status==='playing';if(hiddenPause)game.pause();audio.suspend(true);}
      else {if(hiddenPause&&game.status==='paused')game.pause();hiddenPause=false;audio.suspend(game.status==='paused');last=performance.now();}
    });
    const portrait=KR_SPRITES.SoldierHeroAlric;
    if(portrait){$('hero-avatar').style.backgroundImage=`url('assets/${portrait.file}')`;$('hero-avatar').style.backgroundSize=`auto 36px`;$('hero-avatar').style.backgroundPosition='left center';}
    loadLevel(0);
    function frame(now) {
      const dt=Math.min((now-(last||now))/1000,.1);last=now;
      if(!document.hidden) {
        accumulator+=dt*speed;
        for(let steps=0;accumulator>=1/60&&steps<20;steps++){game.tick(1/60);accumulator-=1/60;}
        try {renderer.draw(game);}
        catch(error) {
          if(!renderFailures++)console.error('Renderer failed',error);
          renderer.ctx.restore();renderer.background(game,true);toast('画面已切换为兼容绘制模式。');
        }
        uiTimer+=dt;if(uiTimer>.1){uiTimer=0;updateUI();renderInspector();}
      }
      requestAnimationFrame(frame);
    }
    requestAnimationFrame(frame);
    window.krApp={get game(){return game;},renderer,audio,loadLevel,selectSite,start,get speed(){return speed;},get renderFailures(){return renderFailures;}};
  }
  document.readyState==='loading'?document.addEventListener('DOMContentLoaded',initGameApp,{once:true}):initGameApp();
})();
