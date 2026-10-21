const test=require('node:test');
const assert=require('node:assert/strict');
const vm=require('node:vm');
const fs=require('node:fs');
const path=require('node:path');
const source=fs.readFileSync(path.join(__dirname,'../web/audio.js'),'utf8');
function fixture() {
  let resolveBuffer;
  const audioElements=[];
  // Browser audio devices are external; this controlled decode promise models
  // a slow first fetch while actual GameAudio owns state and playback policy.
  const scope={location:{protocol:'http:'},performance:{now:()=>1000},setTimeout,
    KR_SOUNDS:{test:'audio/test.mp3'},fetch:async()=>({ok:true,arrayBuffer:async()=>new ArrayBuffer(2)}),
    Audio:class {
      constructor(){this.dataset={};this.playing=false;audioElements.push(this);}
      play(){this.playing=true;return Promise.resolve();}pause(){this.playing=false;}
    },
    AudioContext:class {
      constructor(){this.state='running';}
      decodeAudioData(){return new Promise(resolve=>{resolveBuffer=resolve;});}
      createBufferSource(){return {connect(){},start(){}};}
      createGain(){return {gain:{value:0},connect(){}};}
    }
  };
  vm.createContext(scope);vm.runInContext(source,scope);
  const audio=new scope.KRGameAudio();audio.unlock();
  return {audio,audioElements,finish:()=>resolveBuffer({})};
}
for(const action of ['mute','suspend'])test(`pending decode cannot start HTML playback after ${action}`,async()=> {
  const f=fixture(),job=f.audio.play('test');
  await new Promise(resolve=>setImmediate(resolve));
  if(action==='mute')f.audio.toggle();else f.audio.suspend(true);
  f.finish();await job;
  assert.equal(f.audio.active.size,0);
  assert.equal(f.audioElements.some(a=>a.playing),false);
});
