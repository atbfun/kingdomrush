package
{
   import fl.lang.*;
   import flash.display.MovieClip;
   import flash.events.*;
   import flash.geom.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol17990")]
   public class EnemyDesertWolf extends EnemyCommon
   {
      
      public var effect_Healing:MovieClip;
      
      public var effect_Stun:MovieClip;
      
      public var debuff_Burn:MovieClip;
      
      public var debuff_Poison:MovieClip;
      
      public var debuff_Silence:MovieClip;
      
      public var debuff_Weakness:MovieClip;
      
      public function EnemyDesertWolf(param1:int, param2:Array)
      {
         addFrameScript(9,this.frame10,19,this.frame20,29,this.frame30,30,this.frame31,44,this.frame45,63,this.frame64);
         super(param1,param2);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.isFlying = this.cRoot.gameSettings.enemies.wolf.isFlying;
         this.level = 1;
         this.deadTime = 15;
         this.canSkeleton = false;
         this.size = this.cRoot.gameSettings.enemies.wolf.size;
         this.health = this.initHealth = this.getHealthForEnemy(this.cRoot.gameSettings.enemies.wolf,this.cRoot.game.difficulty,this.cRoot.gameSettings.enemies.wolf.health);
         this.speed = this.cRoot.gameSettings.enemies.wolf.speed;
         this.armor = this.cRoot.gameSettings.enemies.wolf.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.wolf.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.wolf.dodge;
         this.gold = this.cRoot.gameSettings.enemies.wolf.gold;
         this.cost = this.cRoot.gameSettings.enemies.wolf.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.wolf.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.wolf.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.wolf.attackReloadTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.wolf.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.wolf.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.wolf.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.wolf.speed + 0.1;
         this.lifeBar = new LifeBarSmall(new Point(0,-24),this.health,this.initHealth);
         this.addChild(lifeBar);
         this.§_-oV§ = "";
         this.§_-2m§();
         this.§dynamic const native§ = 36;
         this.§_-xY§ = 28;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function §_-kU§(param1:Object) : void
      {
         param1.tIconName = "worg";
         param1.eName = Locale.loadStringEx("ENEMY_DESERT_WOLF_NAME",Locale.getDefaultLang());
      }
      
      override public function explode() : void
      {
         this.§var use§(true);
         this.§throw const use§();
      }
      
      override public function §_-ra§() : void
      {
         this.cRoot.game.gameSounds.§_-1f§();
      }
      
      override public function §_-LX§() : void
      {
         this.cRoot.game.gameSounds.§each for switch§();
      }
      
      override public function §throw const use§() : void
      {
      }
      
      internal function frame10() : *
      {
         gotoAndPlay("walking");
      }
      
      internal function frame20() : *
      {
         gotoAndPlay("walkingUp");
      }
      
      internal function frame30() : *
      {
         gotoAndPlay("walkingDown");
      }
      
      internal function frame31() : *
      {
         stop();
      }
      
      internal function frame45() : *
      {
         stop();
      }
      
      internal function frame64() : *
      {
         stop();
      }
   }
}

