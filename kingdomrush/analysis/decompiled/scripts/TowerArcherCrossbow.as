package
{
   import §_-rX§.*;
   import fl.lang.*;
   import flash.display.*;
   import flash.events.*;
   import flash.geom.*;
   import flash.utils.*;
   
   public class TowerArcherCrossbow extends §_-Yb§
   {
      
      private var §package const in§:Boolean;
      
      private var §false in§:Boolean;
      
      private var §_-Ok§:Boolean;
      
      private var §_-1T§:Boolean;
      
      private var §include const return§:int;
      
      private var §_-Oj§:int = 0;
      
      private var §false var§:int;
      
      private var §_-N4§:int;
      
      private var multishootRangeNearWidth:int;
      
      private var §continue const in§:int;
      
      private var §default const return§:*;
      
      private var §while for function§:String;
      
      private var §for const if§:Enemy;
      
      private var §_-hK§:Point;
      
      private var §import const each§:Enemy;
      
      private var §_-TC§:Array;
      
      private var §_-1G§:MovieClip;
      
      private var multishootMaxShoot:int;
      
      private var multishootCurrentShoot:int;
      
      private var §_-xc§:int;
      
      private var multishootSingleShootChargeShoot:int;
      
      private var multishootSingleShootChargeEnd:int;
      
      private var §_-FA§:int;
      
      private var §override native§:MovieClip;
      
      private var §class implements§:int;
      
      private var §_-bG§:int = 0;
      
      private var §override each§:int;
      
      private var §static implements§:int = 0;
      
      private var eagleRangeWidth:int;
      
      private var §return var§:int;
      
      private var eagleCriticalChance:int;
      
      private var §extends false§:int;
      
      public function TowerArcherCrossbow(param1:int, param2:int, param3:Point, param4:int, param5:Boolean = true)
      {
         super(param1,param2,param3,"",param5);
         this.§implements for import§ = "crossbow";
         this.§default implements§ = param4;
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.cRoot.game.gameSounds.§for const case§();
         this.§default implements§ += this.cRoot.gameSettings.archers.crossbow.cost;
         this.cRoot.updateCash(-this.cRoot.gameSettings.archers.crossbow.cost);
         this.§_-3L§(L_CROSSBOW);
         this.building = false;
         this.idleTime = 90;
         this.idleTimeCounter = 0;
         this.chargeTimePreShoot = 7;
         this.§_-SV§(new §use switch§());
         this.cRoot.bullets.addChild(new §continue for dynamic§(new Point(this.x,this.y)));
         this.§try static§(new §override const set§());
         this.§throw const each§ = new Point(this.x + 10,this.y - 44);
         this.§_-Pj§ = new Point(this.x - 7,this.y - 44);
         this.cRoot.menu.§_-su§(this);
         this.cRoot.game.§throw const implements§.§finally import§(this.cRoot);
         this.multishootRangeNearWidth = this.cRoot.gameSettings.archers.crossbow.multishootRangeNearWidth;
         this.§continue const in§ = this.multishootRangeNearWidth * this.cRoot.gameSettings.rangeRatio;
         this.§_-xc§ = 11;
         this.multishootSingleShootChargeShoot = 5;
         this.multishootSingleShootChargeEnd = 4;
         this.§_-TC§ = [];
         this.§default const return§ = null;
         this.unSelect();
         this.§dynamic const native§ = 44;
         this.§_-xY§ = 55;
         this.addEventListener(MouseEvent.CLICK,clickEvent,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OVER,rollOverEvents,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,rollOutEvents,false,0,true);
      }
      
      override public function pause() : void
      {
         if(this.building)
         {
            return;
         }
         this.§_-yT§().shooterRight.stop();
         this.§_-yT§().shooterLeft.stop();
         this.§_-Ek§();
      }
      
      override public function §_-Ek§() : void
      {
         if(this.§override native§ != null)
         {
            this.§override native§.stop();
         }
      }
      
      override public function unPause() : void
      {
         if(this.building)
         {
            return;
         }
         if(this.arrowCount % 2)
         {
            switch(MovieClip(this.§_-yT§().shooterRight).currentFrameLabel)
            {
               case "idleUp":
               case "idleDown":
                  break;
               case "shootUpEnd":
                  MovieClip(this.§_-yT§().shooterRight).gotoAndStop("idleUp");
                  break;
               case "shootDownEnd":
                  MovieClip(this.§_-yT§().shooterRight).gotoAndStop("idleDown");
                  break;
               case "barrageUpShootEnd":
                  MovieClip(this.§_-yT§().shooterRight).gotoAndStop("barrageUpShoot");
                  break;
               case "barrageUpCompleteEnd":
                  MovieClip(this.§_-yT§().shooterRight).gotoAndStop("idleUp");
                  break;
               case "barrageDownShootEnd":
                  MovieClip(this.§_-yT§().shooterRight).gotoAndPlay("barrageDownShoot");
                  break;
               case "barrageDownCompleteEnd":
                  MovieClip(this.§_-yT§().shooterRight).gotoAndStop("idleDown");
                  break;
               default:
                  MovieClip(this.§_-yT§().shooterRight).play();
            }
         }
         else
         {
            switch(MovieClip(this.§_-yT§().shooterLeft).currentFrameLabel)
            {
               case "idleUp":
               case "idleDown":
                  break;
               case "shootUpEnd":
                  MovieClip(this.§_-yT§().shooterLeft).gotoAndStop("idleUp");
                  break;
               case "shootDownEnd":
                  MovieClip(this.§_-yT§().shooterLeft).gotoAndStop("idleDown");
                  break;
               case "barrageUpShootEnd":
                  MovieClip(this.§_-yT§().shooterLeft).gotoAndStop("barrageUpShoot");
                  break;
               case "barrageUpCompleteEnd":
                  MovieClip(this.§_-yT§().shooterLeft).gotoAndStop("idleUp");
                  break;
               case "barrageDownShootEnd":
                  MovieClip(this.§_-yT§().shooterLeft).gotoAndPlay("barrageDownShoot");
                  break;
               case "barrageDownCompleteEnd":
                  MovieClip(this.§_-yT§().shooterLeft).gotoAndStop("idleDown");
                  break;
               default:
                  MovieClip(this.§_-yT§().shooterLeft).play();
            }
         }
         this.§else for throw§();
      }
      
      override public function §else for throw§() : void
      {
         if(this.§override native§ != null)
         {
            if(this.§override native§.currentFrame != this.§override native§.totalFrames)
            {
               this.§override native§.play();
            }
         }
      }
      
      override public function §_-ZT§() : void
      {
         var _loc1_:MovieClip = null;
         if(this.cRoot.game.gameUpgrades.§while default§(GameUpgrades.FRONTIERS_TWIN_SHOOT,this.cRoot.§finally const try§) && Math.random() <= 0.1)
         {
            _loc1_ = this.§include false§(false,this.getRandom(15,23));
            _loc1_ = this.§_-nw§(_loc1_);
            this.cRoot.bullets.addChild(_loc1_);
            _loc1_ = null;
         }
      }
      
      override public function §include false§(param1:Boolean = false, param2:int = 0) : MovieClip
      {
         var _loc3_:Point = null;
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         var _loc6_:Number = 0.1;
         if(this.§_-bG§ != 0)
         {
            _loc6_ += this.eagleCriticalChance / 100;
         }
         if(this.cRoot.game.gameUpgrades.archersUpPrecision && (this.cRoot.§finally const try§ == 0 || this.cRoot.§finally const try§ == 5) || _loc6_ != 0.1)
         {
            if(Math.random() <= _loc6_)
            {
               _loc4_ = true;
            }
         }
         if(this.cRoot.game.gameUpgrades.archersUpPiercing && (this.cRoot.§finally const try§ == 0 || this.cRoot.§finally const try§ >= 3))
         {
            _loc5_ = 10;
         }
         this.cRoot.game.§throw const implements§.§_-pF§(this.cRoot);
         if(param1)
         {
            return new §static const true§(this.§import const each§,this.§_-hK§,_loc4_,_loc5_,this.§super switch§);
         }
         return new §_-9z§(this.level,this.target,_loc3_,null,param2 != 0 ? param2 : 11,_loc4_,_loc5_,this.§super switch§);
      }
      
      override public function §package throw§() : Boolean
      {
         this.§_-vO§();
         if(this.§_-Oj§ != 0 && Boolean(this.§_-Ps§()))
         {
            return true;
         }
         return false;
      }
      
      override public function §_-WT§() : void
      {
         if(this.§_-Oj§ != 0)
         {
            ++this.§_-N4§;
         }
      }
      
      override public function getInfo() : Object
      {
         var _loc1_:Object = {};
         _loc1_.tName = Locale.loadStringEx("TOWER_CROSSBOW_NAME",Locale.getDefaultLang());
         _loc1_.tIconName = this.§implements for import§;
         _loc1_.tRangeHeight = this.§_-xw§;
         _loc1_.tRangeWidth = this.§with super§;
         _loc1_.tReload = this.reloadTime + this.§set for finally§;
         _loc1_.tDamageMin = this.cRoot.gameSettings.archers.crossbow.minDamage + this.cRoot.gameSettings.archers.crossbow.minDamage * this.§super switch§ / 100;
         _loc1_.tDamageMax = this.cRoot.gameSettings.archers.crossbow.maxDamage + this.cRoot.gameSettings.archers.crossbow.maxDamage * this.§super switch§ / 100;
         return _loc1_;
      }
      
      public function getTooltipParams(param1:String) : Object
      {
         var _loc2_:String = Locale.getDefaultLang();
         switch(param1)
         {
            case "special_multishoot":
               return {
                  "title":Locale.loadStringEx("TOWER_CROSSBOW_BARRAGE_NAME_" + this.§_-Ec§(this.§_-Oj§,this.§include const return§),_loc2_),
                  "text":Locale.loadStringEx("TOWER_CROSSBOW_BARRAGE_DESCRIPTION_" + this.§_-Ec§(this.§_-Oj§,this.§include const return§),_loc2_),
                  "atts":[],
                  "notes":Locale.loadStringEx("TOWER_CROSSBOW_BARRAGE_NOTE",_loc2_)
               };
            case "special_eagle":
               return {
                  "title":Locale.loadStringEx("TOWER_CROSSBOW_FALCONER_NAME_" + this.§_-Ec§(this.§_-bG§,this.§class implements§),_loc2_),
                  "text":Locale.loadStringEx("TOWER_CROSSBOW_FALCONER_DESCRIPTION_" + this.§_-Ec§(this.§_-bG§,this.§class implements§),_loc2_),
                  "atts":[],
                  "notes":Locale.loadStringEx("TOWER_CROSSBOW_FALCONER_NOTE",_loc2_)
               };
            default:
               return null;
         }
      }
      
      override public function §_-OD§() : void
      {
         if(this.cRoot.quickMenu.cTower == this)
         {
            this.cRoot.§_-vA§();
            return;
         }
         MovieClip(this.cRoot).quickMenu.load(this.x,this.y - 10,this,true,180,false,new Array(new Array("special_multishoot","sp_multishoot",this.cRoot.gameSettings.archers.crossbow.multishootCost,false,this.§_-Oj§,this.§include const return§,this.cRoot.gameSettings.archers.crossbow.multishootCostLevel,1,"TooltipBasic",this.getTooltipParams("special_multishoot")),new Array("special_eagle","sp_eagle",this.cRoot.gameSettings.archers.crossbow.eagleCost,false,this.§_-bG§,this.§class implements§,this.cRoot.gameSettings.archers.crossbow.eagleCostLevel,2,"TooltipBasic",this.getTooltipParams("special_eagle"))));
         this.cRoot.quickMenu.show(this.cRoot.§get const with§);
         this.showRange(this.§with super§,this.§_-xw§);
      }
      
      override public function upgradeTower(param1:String) : void
      {
         switch(param1)
         {
            case "sell":
               this.cRoot.updateCash(this.getSellValue());
               this.§_-X6§();
               this.cRoot.entities.addChild(new TowerHolder(this.x,this.y,this.§var for for§,this.canBuildBarracks));
               this.cRoot.entities.addChild(new §var for finally§(new Point(this.x,this.y),this.getSellValue()));
               this.cRoot.§null each§();
               this.destroyThis();
               break;
            case "special_multishoot":
               this.cRoot.game.gameSounds.playCrossbowBarrage();
               ++this.§_-Oj§;
               if(this.§_-Oj§ == 1)
               {
                  this.§default implements§ += this.cRoot.gameSettings.archers.crossbow.multishootCost;
                  this.cRoot.updateCash(-this.cRoot.gameSettings.archers.crossbow.multishootCost);
               }
               else
               {
                  this.§default implements§ += this.cRoot.gameSettings.archers.crossbow.multishootCostLevel;
                  this.cRoot.updateCash(-this.cRoot.gameSettings.archers.crossbow.multishootCostLevel);
               }
               this.multishootMaxShoot = this.cRoot.gameSettings.archers.crossbow.multishootMaxShoot + this.cRoot.gameSettings.archers.crossbow.multishootMaxShootIncrement * this.§_-Oj§;
               break;
            case "special_eagle":
               this.cRoot.game.gameSounds.playCrossbowFalconer();
               ++this.§_-bG§;
               if(this.§_-bG§ == 1)
               {
                  this.§default implements§ += this.cRoot.gameSettings.archers.crossbow.eagleCost;
                  this.cRoot.updateCash(-this.cRoot.gameSettings.archers.crossbow.eagleCost);
                  this.§override native§ = new §include for if§();
                  this.§override native§.x = 0;
                  this.§override native§.y = 0;
                  this.§_-yT§().addChild(this.§override native§);
               }
               else
               {
                  this.§default implements§ += this.cRoot.gameSettings.archers.crossbow.eagleCostLevel;
                  this.cRoot.updateCash(-this.cRoot.gameSettings.archers.crossbow.eagleCostLevel);
               }
               this.eagleRangeWidth = this.cRoot.gameSettings.archers.crossbow.eagleRangeWidth + this.cRoot.gameSettings.archers.crossbow.eagleRangeWidthIncrement * this.§_-bG§;
               this.§return var§ = this.eagleRangeWidth * this.cRoot.gameSettings.rangeRatio;
               this.eagleCriticalChance = this.cRoot.gameSettings.archers.crossbow.eagleCriticalChancePercent + this.cRoot.gameSettings.archers.crossbow.eagleCriticalChanceIncrementPercent * this.§_-bG§;
               this.§const for import§();
               this.showRange(this.§with super§,this.§_-xw§);
         }
      }
      
      private function §_-vO§() : void
      {
         if(this.§_-bG§ == 0)
         {
            return;
         }
         if(this.§static implements§ < this.§override each§)
         {
            ++this.§static implements§;
            return;
         }
         this.cRoot.game.gameSounds.§_-k8§();
         this.§override native§.gotoAndPlay(1);
         this.§static implements§ = 0;
      }
      
      override public function §extends return§() : void
      {
         this.§const for import§();
      }
      
      private function §const for import§() : void
      {
         var _loc2_:§extends const var§ = null;
         var _loc3_:§_-ob§ = null;
         if(this.§_-bG§ == 0)
         {
            return;
         }
         var _loc1_:Number = 0;
         for each(_loc2_ in this.cRoot.towers)
         {
            if(getQualifiedClassName(_loc2_) != "TowerHolder")
            {
               if(_loc2_.§_-ph§ && Boolean(this.eagleOnRange(_loc2_)))
               {
                  _loc3_ = _loc2_.§_-M6§("DebuffTowerCrossbowEagle");
                  if(_loc3_ == null || _loc3_.level < this.§_-bG§)
                  {
                     _loc2_.§_-o1§("DebuffTowerCrossbowEagle");
                     _loc2_.§try finally§(new DebuffTowerCrossbowEagle(this.cRoot,this.§_-bG§,_loc2_));
                     _loc1_++;
                     if(_loc1_ >= 4)
                     {
                        this.cRoot.game.§throw const implements§.funcHawkeye(this.cRoot,1);
                     }
                  }
               }
            }
         }
      }
      
      private function §_-QX§() : void
      {
         var _loc1_:§extends const var§ = null;
         if(this.§_-bG§ == 0)
         {
            return;
         }
         for each(_loc1_ in this.cRoot.towers)
         {
            if(getQualifiedClassName(_loc1_) != "TowerHolder")
            {
               if(this.eagleOnRange(_loc1_))
               {
                  _loc1_.§_-o1§("DebuffTowerCrossbowEagle");
               }
            }
         }
      }
      
      private function eagleOnRange(param1:§extends const var§) : Boolean
      {
         var _loc2_:* = new §false super§(this.x - this.eagleRangeWidth / 2,this.y - 10 - this.§return var§ / 2,this.eagleRangeWidth,this.§return var§);
         return _loc2_.containsPoint(new Point(param1.x,param1.y - 10 + param1.adjustY));
      }
      
      private function §_-Ps§() : Boolean
      {
         var _loc1_:MovieClip = null;
         if(!this.§package const in§)
         {
            if(this.§_-N4§ < this.§false var§)
            {
               return false;
            }
            if(!this.§var const switch§())
            {
               return false;
            }
            this.§package const in§ = true;
            this.§false in§ = true;
            this.§_-Ok§ = false;
            this.§_-1T§ = false;
            this.§_-FA§ = 0;
            if(this.§import const each§.y >= this.y - 40)
            {
               this.§while for function§ = "Down";
            }
            else
            {
               this.§while for function§ = "Up";
            }
            if(this.arrowCount % 2)
            {
               this.§_-1G§ = this.§_-yT§().shooterRight;
            }
            else
            {
               this.§_-1G§ = this.§_-yT§().shooterLeft;
            }
            this.§_-1G§.gotoAndPlay("barrage" + this.§while for function§ + "Aim");
            if(this.§import const each§.x >= this.x)
            {
               this.§_-1G§.scaleX = 1;
            }
            else
            {
               this.§_-1G§.scaleX = -1;
            }
            this.§default const return§ = new Point(this.§import const each§.x,this.§import const each§.y);
         }
         if(this.§false in§)
         {
            if(this.§_-FA§ < this.§_-xc§)
            {
               ++this.§_-FA§;
               return true;
            }
            this.§_-Ok§ = true;
            this.§false in§ = false;
            this.§_-1T§ = false;
            this.§_-FA§ = 0;
            this.§_-1G§.gotoAndPlay("barrage" + this.§while for function§ + "Shoot");
         }
         if(this.§_-Ok§)
         {
            if(this.§_-FA§ < this.multishootSingleShootChargeShoot)
            {
               ++this.§_-FA§;
               if(this.§_-FA§ == 1)
               {
                  _loc1_ = this.§include false§(true);
                  _loc1_ = this.§_-nw§(_loc1_);
                  this.cRoot.bullets.addChild(_loc1_);
                  _loc1_ = null;
               }
               if(this.§_-FA§ == 4)
               {
                  _loc1_ = this.§include false§(true);
                  _loc1_ = this.§_-nw§(_loc1_);
                  this.cRoot.bullets.addChild(_loc1_);
                  _loc1_ = null;
               }
               return true;
            }
            ++this.multishootCurrentShoot;
            this.§_-FA§ = 0;
            if(this.multishootCurrentShoot < this.multishootMaxShoot)
            {
               this.§var const switch§();
               this.§_-1G§.gotoAndPlay("barrage" + this.§while for function§ + "Shoot");
               return true;
            }
            this.§_-1T§ = true;
            this.§_-Ok§ = false;
            this.§false in§ = false;
            this.§_-1G§.gotoAndPlay("barrage" + this.§while for function§ + "Complete");
         }
         if(this.§_-1T§)
         {
            if(this.§_-FA§ < this.multishootSingleShootChargeEnd)
            {
               ++this.§_-FA§;
               return true;
            }
         }
         this.§package const in§ = false;
         this.§_-1T§ = false;
         this.§_-Ok§ = false;
         this.§false in§ = false;
         this.§default const return§ = null;
         this.§super const var§ = 0;
         this.§_-N4§ = 0;
         this.multishootCurrentShoot = 0;
         ++this.arrowCount;
         this.§_-TC§ = [];
         return true;
      }
      
      public function §var const switch§() : Boolean
      {
         var _loc2_:Enemy = null;
         var _loc1_:Enemy = null;
         this.target = null;
         for each(_loc2_ in this.cRoot.enemies)
         {
            if(_loc2_.isActive && _loc2_.§_-DA§ && Boolean(this.multishootOnRange(_loc2_)) && !this.§_-v6§(_loc2_))
            {
               if(_loc1_ == null || this.§return const const§(_loc1_,_loc2_))
               {
                  _loc1_ = _loc2_;
               }
            }
         }
         if(_loc1_ != null)
         {
            this.§import const each§ = _loc1_;
            this.§_-TC§.push(_loc1_);
            this.§_-hK§ = new Point(this.§import const each§.§_-uo§[this.§import const each§.§_-GR§ + this.§import const each§.getNodesSpeed()].x,this.§import const each§.§_-uo§[this.§import const each§.§_-GR§ + this.§import const each§.getNodesSpeed()].y);
            return true;
         }
         if(this.§for const if§ != null && Boolean(this.§for const if§.isActive))
         {
            this.§import const each§ = this.§for const if§;
            this.§_-hK§ = new Point(this.§import const each§.x + this.§import const each§.xAdjust,this.§import const each§.y + this.§import const each§.yAdjust);
         }
         this.§_-TC§ = [];
         return false;
      }
      
      private function multishootOnRange(param1:Enemy) : Boolean
      {
         var _loc2_:* = undefined;
         if(this.§default const return§ == null)
         {
            return this.onRange(param1);
         }
         _loc2_ = new §false super§(this.§default const return§.x - this.multishootRangeNearWidth / 2,this.§default const return§.y - this.§continue const in§ / 2,this.multishootRangeNearWidth,this.§continue const in§);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      private function §_-v6§(param1:Enemy) : Boolean
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-TC§.length)
         {
            if(this.§_-TC§[_loc2_] == param1)
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      override public function §_-3L§(param1:int) : void
      {
         this.level = param1;
         this.reloadTime = this.cRoot.gameSettings.archers.crossbow.reload - this.§set for finally§;
         this.§_-xw§ = this.cRoot.gameSettings.archers.crossbow.远程 * this.cRoot.gameSettings.rangeRatio;
         this.§with super§ = this.cRoot.gameSettings.archers.crossbow.远程;
         this.§include const return§ = this.cRoot.gameSettings.archers.crossbow.multishootLevels;
         this.§false var§ = this.cRoot.gameSettings.archers.crossbow.multishootCoolDown;
         this.§class implements§ = this.cRoot.gameSettings.archers.crossbow.eagleLevels;
         this.§override each§ = this.cRoot.gameSettings.archers.crossbow.eagleFlyCoolDown;
      }
      
      override public function destroyThis() : void
      {
         this.§include var§ = true;
         this.§_-QX§();
         this.unSelect();
         this.§_-Nb§();
         this.target = null;
         this.removeEventListener(MouseEvent.ROLL_OVER,rollOverEvents);
         this.removeEventListener(MouseEvent.ROLL_OUT,rollOutEvents);
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.removeEventListener(MouseEvent.CLICK,clickEvent);
         this.cRoot.entities.removeChild(this);
         this.§final for const§();
         this.cRoot.§default true§(this);
         this.cRoot.§return else§();
      }
   }
}

