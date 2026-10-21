package
{
   import fl.lang.*;
   import flash.display.*;
   import flash.events.*;
   import flash.geom.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol20272")]
   public class EnemyCanibal extends EnemyCommon
   {
      
      public var effect_Healing:MovieClip;
      
      public var effect_Stun:MovieClip;
      
      public var debuff_Burn:MovieClip;
      
      public var debuff_Poison:MovieClip;
      
      public var debuff_Silence:MovieClip;
      
      public var buff_magic:MovieClip;
      
      public var debuff_Weakness:MovieClip;
      
      public var buff_armor:MovieClip;
      
      private var §static const final§:Boolean;
      
      private var cannibalAnimationTime:int = 30;
      
      private var cannibalAnimationTimeCounter:int;
      
      private var cannibalAnimationStartTime:int = 4;
      
      private var cannibalHealPoints:int;
      
      private var cannibalEatsInARow:int;
      
      private var cannibalGoingToSoldier:Boolean;
      
      private var cannibalSoldierNode:Point;
      
      public function EnemyCanibal(param1:int, param2:Array, param3:int = 0, param4:Point = null)
      {
         addFrameScript(21,this.frame22,43,this.frame44,65,this.frame66,66,this.frame67,97,this.frame98,104,this.frame105,115,this.frame116);
         super(param1,param2);
         if(param3 != 0)
         {
            this.§_-xU§(param3);
            this.x = param4.x;
            this.y = param4.y;
            this.isActive = true;
         }
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.isFlying = this.cRoot.gameSettings.enemies.canibal.isFlying;
         this.level = 1;
         this.§super const super§ = 9;
         this.§try const dynamic§ = true;
         this.deadTime = 120;
         this.size = this.cRoot.gameSettings.enemies.canibal.size;
         this.health = this.initHealth = this.getHealthForEnemy(this.cRoot.gameSettings.enemies.canibal,this.cRoot.game.difficulty,this.cRoot.gameSettings.enemies.canibal.health);
         this.speed = this.cRoot.gameSettings.enemies.canibal.speed;
         this.armor = this.cRoot.gameSettings.enemies.canibal.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.canibal.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.canibal.dodge;
         this.gold = this.cRoot.gameSettings.enemies.canibal.gold;
         this.cost = this.cRoot.gameSettings.enemies.canibal.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.canibal.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.canibal.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.canibal.attackReloadTime - this.§super const super§;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.canibal.xSoldierAdjust + 3;
         this.xAdjust = this.cRoot.gameSettings.enemies.canibal.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.canibal.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.canibal.speed + 0.1;
         this.lifeBar = new LifeBarSmall(new Point(0,-28),this.health,this.initHealth);
         this.addChild(lifeBar);
         this.§_-oV§ = "";
         this.§_-2m§();
         this.§dynamic const native§ = 50;
         this.§_-xY§ = 32;
         this.§_-Di§ = true;
         this.§_-pu§ = true;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function §_-kU§(param1:Object) : void
      {
         param1.tIconName = "canibal";
         param1.eName = Locale.loadStringEx("ENEMY_CANIBAL_NAME",Locale.getDefaultLang());
      }
      
      override protected function §_-FR§() : void
      {
         if(MovieClip(this).buff_magic != null)
         {
            MovieClip(this).buff_magic.stop();
         }
         if(MovieClip(this).buff_armor != null)
         {
            MovieClip(this).buff_armor.stop();
         }
      }
      
      override protected function §while for import§() : void
      {
         if(MovieClip(this).buff_armor != null && MovieClip(this).buff_armor.currentFrameLabel != "off")
         {
            MovieClip(this).buff_armor.play();
         }
         if(MovieClip(this).buff_magic != null && MovieClip(this).buff_magic.currentFrameLabel != "off")
         {
            MovieClip(this).buff_magic.play();
         }
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
            case "cannibalEnd":
            case "deadEnd":
            case "teleportEnd":
            case "idle":
               break;
            default:
               this.play();
         }
         this.§_-uV§();
      }
      
      override protected function §_-f§() : void
      {
         this.§static const final§ = false;
      }
      
      override public function §package const dynamic§(param1:士兵) : void
      {
         this.soldier = param1;
         this.isBlocked = true;
         if(!this.§static const final§)
         {
            this.gotoAndStop("idle");
         }
      }
      
      override public function startFighting() : void
      {
         this.isFighting = true;
         if(!this.§static const final§)
         {
            this.§_-oV§ = "";
            this.y += 0.1;
            this.§implements false§();
         }
      }
      
      override public function §_-ZP§() : void
      {
         this.isBlocked = false;
         this.isFighting = false;
         this.isCharging = false;
         this.soldier = null;
         if(!this.§static const final§)
         {
            this.§_-oV§ = "";
            this.§_-2m§();
         }
      }
      
      override public function §_-1u§() : void
      {
         if(!this.§static const final§)
         {
            this.gotoAndStop("idle");
         }
      }
      
      override public function §case null§() : Boolean
      {
         if(this.evalcannibal())
         {
            return true;
         }
         return false;
      }
      
      private function evalcannibal() : Boolean
      {
         if(!this.§static const final§)
         {
            return false;
         }
         if(this.cannibalGoingToSoldier)
         {
            if(!this.§for const break§())
            {
               return true;
            }
            this.cRoot.game.gameSounds.§false§();
            this.§_-Qy§ = true;
            this.gotoAndPlay("cannibal");
         }
         ++this.cannibalAnimationTimeCounter;
         if(this.cannibalAnimationTimeCounter < this.cannibalAnimationTime)
         {
            if(this.cannibalAnimationTimeCounter == 1 && this.initHealth < this.cRoot.gameSettings.enemies.canibal.maxLife)
            {
               this.initHealth += this.cRoot.gameSettings.enemies.canibal.extraLife;
               this.health += this.cRoot.gameSettings.enemies.canibal.extraLife;
               this.heal(this.cRoot.gameSettings.enemies.canibal.healPerFrame,false);
               this.lifeBar.updateMaxHealth(this.initHealth,this.health);
            }
            else
            {
               this.heal(this.cRoot.gameSettings.enemies.canibal.healPerFrame,false);
            }
            return true;
         }
         this.§static const final§ = false;
         this.§_-Qy§ = false;
         this.cannibalAnimationTimeCounter = 0;
         this.§_-oV§ = "";
         if(this.cannibalEatsInARow <= 2)
         {
            this.§_-GR§ += 5;
         }
         if(!this.isBlocked)
         {
            this.§_-2m§();
         }
         else if(this.cannibalEatsInARow >= 1)
         {
            if(this.scaleX == -1)
            {
               this.scaleX = 1;
               this.lifeBar.§_-Zy§(1);
            }
            else
            {
               this.scaleX = -1;
               this.lifeBar.§_-Zy§(-1);
            }
         }
         return false;
      }
      
      override public function attack() : void
      {
         var _loc1_:士兵 = null;
         if(this.§for get§)
         {
            return;
         }
         if(Math.random() < 0.3)
         {
            if(this.size < §switch for var§.LARGE)
            {
               if(Math.random() > 0.5)
               {
                  this.cRoot.bullets.addChild(new §class false§(new Point(this.soldier.x,this.soldier.y),"pow"));
               }
               else
               {
                  this.cRoot.bullets.addChild(new §class false§(new Point(this.soldier.x,this.soldier.y),"sok"));
               }
            }
            else if(Math.random() > 0.5)
            {
               this.cRoot.bullets.addChild(new §class false§(new Point(this.soldier.x,this.soldier.y),"whaam"));
            }
            else
            {
               this.cRoot.bullets.addChild(new §class false§(new Point(this.soldier.x,this.soldier.y),"kapow"));
            }
         }
         this.soldier.setDamage(this.getDamage());
         if(soldier != null && soldier.isDead && soldier.canBeCanibalized)
         {
            this.§static const final§ = true;
            this.cannibalAnimationTimeCounter = 0;
            this.cannibalGoingToSoldier = true;
            this.cannibalSoldierNode = new Point(soldier.x,soldier.y);
            this.§_-oV§ = "";
            this.§import switch§();
            this.cannibalEatsInARow += 1;
            for each(_loc1_ in this.cRoot.§_-tz§)
            {
               if(_loc1_.isActive && _loc1_.isFighting && _loc1_.enemy == this)
               {
                  _loc1_.§package break§();
               }
            }
         }
      }
      
      override public function §_-1M§(param1:int, param2:int, param3:Boolean) : int
      {
         if(!this.§static const final§)
         {
            if(param3)
            {
               return Math.round(this.x) + param1 + this.xSoldierAdjust - param2;
            }
            return Math.round(this.x) - param1 - this.xSoldierAdjust + param2;
         }
         if(this.cannibalEatsInARow >= 1)
         {
            if(param3)
            {
               param3 = false;
            }
            else
            {
               param3 = true;
            }
         }
         if(param3)
         {
            return Math.round(this.cannibalSoldierNode.x) + param1 + this.xSoldierAdjust - param2;
         }
         return Math.round(this.cannibalSoldierNode.x) - param1 - this.xSoldierAdjust + param2;
      }
      
      override public function §_-gt§() : Boolean
      {
         if(Boolean(this.§static const final§) && this.cannibalEatsInARow >= 1)
         {
            return true;
         }
         return false;
      }
      
      protected function §for const break§() : Boolean
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         _loc1_ = this.cannibalSoldierNode.y - this.y;
         _loc2_ = this.cannibalSoldierNode.x - this.x;
         var _loc3_:Number = Math.atan2(_loc1_,_loc2_);
         this.ySpeed = Math.sin(_loc3_) * this.speed;
         this.xSpeed = Math.cos(_loc3_) * this.speed;
         this.x += this.xSpeed;
         this.y += this.ySpeed;
         if(Math.sqrt(Math.pow(this.cannibalSoldierNode.y - this.y,2) + Math.pow(this.cannibalSoldierNode.x - this.x,2)) < this.nodeMarginError)
         {
            this.cannibalGoingToSoldier = false;
            return true;
         }
         return false;
      }
      
      public function §import switch§() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         _loc1_ = this.cannibalSoldierNode.y - this.y;
         _loc2_ = this.cannibalSoldierNode.x - this.x;
         var _loc3_:* = Math.round(Math.atan2(-_loc1_,_loc2_) * 180 / Math.PI);
         if(_loc3_ < 0)
         {
            _loc3_ += 360;
         }
         if(_loc3_ > 55 && _loc3_ < 135)
         {
            if(this.§_-oV§ != "up")
            {
               this.gotoAndPlay("walkingUp");
               this.§_-oV§ = "up";
            }
         }
         else if(_loc3_ >= 135 && _loc3_ <= 240)
         {
            if(this.§_-oV§ != "left")
            {
               this.gotoAndPlay("walking");
               this.scaleX = -1;
               this.lifeBar.§_-Zy§(-1);
               this.§_-oV§ = "left";
            }
         }
         else if(_loc3_ > 240 && _loc3_ < 315)
         {
            if(this.§_-oV§ != "down")
            {
               this.gotoAndPlay("walkingDown");
               this.§_-oV§ = "down";
            }
         }
         else if(this.§_-oV§ != "right")
         {
            this.gotoAndPlay("walking");
            this.scaleX = 1;
            this.lifeBar.§_-Zy§(1);
            this.§_-oV§ = "right";
         }
      }
      
      override protected function §if native§() : void
      {
         this.cannibalEatsInARow = 0;
         super.§if native§();
      }
      
      override public function §_-LX§() : void
      {
         this.cRoot.game.gameSounds.§true const do§();
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
      
      internal function frame98() : *
      {
         stop();
      }
      
      internal function frame105() : *
      {
         stop();
      }
      
      internal function frame116() : *
      {
         stop();
      }
   }
}

