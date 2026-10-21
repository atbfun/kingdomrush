package
{
   import fl.lang.*;
   import flash.display.MovieClip;
   import flash.events.*;
   import flash.geom.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol18216")]
   public class EnemyDesertRaider extends EnemyCommon
   {
      
      public var effect_Healing:MovieClip;
      
      public var effect_Stun:MovieClip;
      
      public var debuff_Burn:MovieClip;
      
      public var debuff_Poison:MovieClip;
      
      public var debuff_Silence:MovieClip;
      
      public var debuff_Weakness:MovieClip;
      
      public function EnemyDesertRaider(param1:int, param2:Array)
      {
         addFrameScript(21,this.frame22,43,this.frame44,65,this.frame66,66,this.frame67,76,this.frame77,95,this.frame96,99,this.frame100,107,this.frame108,118,this.frame119);
         super(param1,param2);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.isFlying = this.cRoot.gameSettings.enemies.desertRaider.isFlying;
         this.level = 1;
         this.§super const super§ = 9;
         this.size = this.cRoot.gameSettings.enemies.desertRaider.size;
         this.health = this.initHealth = this.getHealthForEnemy(this.cRoot.gameSettings.enemies.desertRaider,this.cRoot.game.difficulty,this.cRoot.gameSettings.enemies.desertRaider.health);
         this.speed = this.cRoot.gameSettings.enemies.desertRaider.speed;
         this.armor = this.cRoot.gameSettings.enemies.desertRaider.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.desertRaider.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.desertRaider.dodge;
         this.gold = this.cRoot.gameSettings.enemies.desertRaider.gold;
         this.cost = this.cRoot.gameSettings.enemies.desertRaider.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.desertRaider.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.desertRaider.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.desertRaider.attackReloadTime - this.§super const super§;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.desertRaider.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.desertRaider.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.desertRaider.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.desertRaider.speed + 0.1;
         this.lifeBar = new LifeBarSmall(new Point(0,-26),this.health,this.initHealth);
         this.addChild(lifeBar);
         this.§_-oV§ = "";
         this.§_-2m§();
         this.§dynamic const native§ = 38;
         this.§_-xY§ = 28;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function §_-kU§(param1:Object) : void
      {
         param1.tIconName = "desertraider";
         param1.eName = Locale.loadStringEx("ENEMY_DESERT_RAIDER_NAME",Locale.getDefaultLang());
      }
      
      override public function §_-LX§() : void
      {
         this.cRoot.game.gameSounds.§_-wQ§();
      }
      
      internal function frame22() : *
      {
         gotoAndPlay("walking");
      }
      
      internal function frame44() : *
      {
         gotoAndPlay("walkingUp");
      }
      
      internal function frame66() : *
      {
         gotoAndPlay("walkingDown");
      }
      
      internal function frame67() : *
      {
         stop();
      }
      
      internal function frame77() : *
      {
         stop();
      }
      
      internal function frame96() : *
      {
         stop();
      }
      
      internal function frame100() : *
      {
         stop();
      }
      
      internal function frame108() : *
      {
         stop();
      }
      
      internal function frame119() : *
      {
         stop();
      }
   }
}

