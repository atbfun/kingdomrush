package
{
   import fl.lang.*;
   import flash.display.MovieClip;
   import flash.events.*;
   import flash.geom.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol16843")]
   public class EnemySaurianBroodguard extends EnemyCommon
   {
      
      public var effect_Healing:MovieClip;
      
      public var effect_Stun:MovieClip;
      
      public var debuff_Burn:MovieClip;
      
      public var debuff_Poison:MovieClip;
      
      public var debuff_Silence:MovieClip;
      
      public var debuff_Weakness:MovieClip;
      
      private var §_-mK§:Boolean;
      
      public function EnemySaurianBroodguard(param1:int, param2:Array, param3:int = 0, param4:Point = null, param5:Boolean = false)
      {
         addFrameScript(21,this.frame22,43,this.frame44,65,this.frame66,66,this.frame67,83,this.frame84,95,this.frame96,101,this.frame102,104,this.frame105,114,this.frame115);
         super(param1,param2);
         if(param4 != null)
         {
            this.§_-mK§ = param5;
            this.§_-xU§(param3 + 2);
            this.x = param4.x;
            this.y = param4.y;
         }
         else
         {
            this.visible = false;
         }
      }
      
      override public function init(param1:Event) : void
      {
         if(this.§continue for break§)
         {
            return;
         }
         this.§continue for break§ = true;
         this.cRoot = Level(this.parent.parent);
         this.isFlying = this.cRoot.gameSettings.enemies.saurianBroodguard.isFlying;
         this.level = 1;
         this.§super const super§ = 18;
         this.bloodClass = "BloodViolet";
         this.size = this.cRoot.gameSettings.enemies.saurianBroodguard.size;
         this.health = this.initHealth = this.getHealthForEnemy(this.cRoot.gameSettings.enemies.saurianBroodguard,this.cRoot.game.difficulty,this.cRoot.gameSettings.enemies.saurianBroodguard.health);
         this.speed = this.cRoot.gameSettings.enemies.saurianBroodguard.speed;
         this.armor = this.cRoot.gameSettings.enemies.saurianBroodguard.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.saurianBroodguard.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.saurianBroodguard.dodge;
         this.gold = this.cRoot.gameSettings.enemies.saurianBroodguard.gold;
         this.cost = this.cRoot.gameSettings.enemies.saurianBroodguard.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.saurianBroodguard.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.saurianBroodguard.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.saurianBroodguard.attackReloadTime - this.§super const super§;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.saurianBroodguard.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.saurianBroodguard.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.saurianBroodguard.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.saurianBroodguard.speed + 0.1;
         this.lifeBar = new LifeBarSmall(new Point(0,-30),this.health,this.initHealth);
         this.addChild(lifeBar);
         this.§_-oV§ = "";
         this.§_-2m§();
         if(this.§_-mK§)
         {
            this.isActive = true;
            this.gold = 0;
            ++this.cRoot.§false const true§;
            this.cRoot.entities.addChild(new §native native§(new Point(this.x,this.y + 0.1),this.cRoot));
         }
         this.§dynamic const native§ = 52;
         this.§_-xY§ = 32;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function §_-kU§(param1:Object) : void
      {
         param1.tIconName = "saurian_broodguard";
         param1.eName = Locale.loadStringEx("ENEMY_SAURIAN_BROODGUARD_NAME",Locale.getDefaultLang());
      }
      
      override public function unPause() : void
      {
         switch(this.currentFrameLabel)
         {
            case "walkingEnd":
               this.gotoAndPlay("walking");
               break;
            case "walkingUpEnd":
               this.gotoAndPlay("walkingUp");
               break;
            case "walkingDownEnd":
               this.gotoAndPlay("walkingDown");
               break;
            case "fightingEnd":
            case "deadEnd":
               break;
            case "climbingEnd":
               this.gotoAndPlay("climbing");
               break;
            case "fallingLoopEnd":
               this.gotoAndPlay("fallingLoop");
               break;
            case "fallingEndEnd":
            case "idle":
               break;
            default:
               this.play();
         }
         this.§_-uV§();
      }
      
      override public function setDamage(param1:int, param2:int = 3, param3:§in const§ = null, param4:int = 0, param5:Boolean = false) : void
      {
         super.setDamage(param1,param2,param3,param4,param5);
         var _loc6_:int = this.health;
         super.setDamage(param1,param2,param3,param4,param5);
         var _loc7_:Number = (_loc6_ - this.health) / Number(this.initHealth);
         var _loc8_:Number = Number(this.cRoot.gameSettings.enemies.saurianBroodguard.speedIncrement);
         this.speed += _loc8_ * _loc7_;
      }
      
      override public function §_-LX§() : void
      {
         this.cRoot.game.gameSounds.§_-wQ§();
      }
      
      override protected function §each const var§() : void
      {
         this.cRoot.entities.addChild(new §_-S4§(new Point(this.x,this.y),this.cRoot));
      }
      
      override public function §throw const use§() : void
      {
         this.cRoot.§_-Qa§(new §use for break§(new Point(this.x,this.y)));
      }
      
      override public function §var use§(param1:Boolean = false) : void
      {
         super.§var use§(param1);
      }
      
      override public function destroyThis() : void
      {
         if(this.gold == 0)
         {
            --this.cRoot.§false const true§;
         }
         super.destroyThis();
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
      
      internal function frame84() : *
      {
         stop();
      }
      
      internal function frame96() : *
      {
         gotoAndPlay("climbing");
      }
      
      internal function frame102() : *
      {
         stop();
      }
      
      internal function frame105() : *
      {
         gotoAndPlay("fallingLoop");
      }
      
      internal function frame115() : *
      {
         stop();
      }
   }
}

