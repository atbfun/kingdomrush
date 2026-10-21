(function(root) {
  'use strict';
  class GameAudio {
    constructor(muted=false) {
      this.muted=muted;this.unlocked=false;this.context=null;this.buffers=new Map();this.last={};
      this.active=new Set();this.music=null;this.musicName='';this.suspended=false;
    }
    unlock() {
      this.unlocked=true;
      try {
        const AudioContext=root.AudioContext||root.webkitAudioContext;
        if(AudioContext&&!this.context)this.context=new AudioContext();
        if(this.context?.state==='suspended')this.context.resume().catch(()=>{});
      } catch { /* HTML Audio remains available. */ }
    }
    toggle() {
      this.muted=!this.muted;
      if(this.muted){this.music?.pause();for(const a of this.active)a.pause();}
      else if(!this.suspended){this.unlock();if(this.music)this.music.play().catch(()=>{});}
      return this.muted;
    }
    async decode(name) {
      if(this.buffers.has(name))return this.buffers.get(name);
      const job=(async()=> {
        const path=root.KR_SOUNDS[name];if(!path)return null;
        for(const base of ['assets/','../assets/']) {
          try {
            const response=await fetch(base+path);if(!response.ok)continue;
            return await this.context.decodeAudioData(await response.arrayBuffer());
          } catch { /* Try the alternate relative root. */ }
        }
        return null;
      })();
      this.buffers.set(name,job);return job;
    }
    html(name,volume=.4,loop=false) {
      const path=root.KR_SOUNDS[name];if(!path)return null;
      const a=new Audio();a.preload='none';a.src='assets/'+path;a.volume=volume;a.loop=loop;
      a.onerror=()=>{if(!a.dataset.retried){a.dataset.retried='yes';a.src='../assets/'+path;if(!this.muted&&!this.suspended)a.play().catch(()=>{});}};
      return a;
    }
    async play(name,volume=.35,gap=.1) {
      if(this.muted||!this.unlocked||this.suspended)return;
      const now=performance.now()/1000;if(now-(this.last[name]||-100)<gap)return;this.last[name]=now;
      if(this.context&&location.protocol!=='file:') {
        const buffer=await this.decode(name);
        if(this.muted||!this.unlocked||this.suspended)return;
        if(buffer&&!this.muted&&!this.suspended) {
          const source=this.context.createBufferSource(),gain=this.context.createGain();
          source.buffer=buffer;gain.gain.value=volume;source.connect(gain);gain.connect(this.context.destination);source.start();return;
        }
      }
      if(this.muted||this.suspended||this.active.size>=8)return;
      const a=this.html(name,volume);if(!a){this.tone();return;}
      this.active.add(a);const finish=()=>this.active.delete(a);a.onended=finish;
      a.play().then(()=>setTimeout(finish,4000)).catch(()=>{finish();this.tone();});
    }
    tone() {
      if(!this.context||this.muted||this.suspended)return;
      try {
        const o=this.context.createOscillator(),g=this.context.createGain(),t=this.context.currentTime;
        o.type='triangle';o.frequency.setValueAtTime(440,t);g.gain.setValueAtTime(.035,t);g.gain.exponentialRampToValueAtTime(.001,t+.08);
        o.connect(g);g.connect(this.context.destination);o.start(t);o.stop(t+.08);
      } catch { /* Audio must never stop gameplay. */ }
    }
    setMusic(biome,battle=false) {
      const name=`music_${biome==='desert'?'Desert':biome==='jungle'?'Jungle':'Underground'}_${battle?'Battle':'Prep'}`;
      if(this.musicName===name)return;
      this.music?.pause();this.musicName=name;
      if(!this.unlocked)return;
      this.music=this.html(name,.19,true);if(!this.muted&&!this.suspended)this.music?.play().catch(()=>{});
    }
    suspend(value) {this.suspended=value;if(value)this.music?.pause();else if(!this.muted)this.music?.play().catch(()=>{});}
    event(event) {
      const sounds={build:'Sound_GUIButtonCommon',upgrade:'Sound_GUIButtonCommon',sell:'Sound_GUIButtonCommon',
        reinforce:'Sound_Reinforcements1',fire:'hero_dragon_fireball_explode',impact:'hero_dragon_fireball_explode',
        won:'music_Victory_Theme',wave:'Sound_TowerArcherTaunt1'};
      if(event.type==='shoot')this.play(event.kind==='mage'?'archmage_attack':'Sound_ArrowRelease2',.12,.17);
      else if(sounds[event.type])this.play(sounds[event.type],.3,.2);
    }
  }
  root.KRGameAudio=GameAudio;
})(globalThis);
