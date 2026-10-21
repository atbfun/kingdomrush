package
{
   import fl.lang.*;
   import flash.display.*;
   import flash.events.*;
   import flash.geom.*;
   import flash.utils.*;
   
   public class TowerEngineer extends §extends const var§
   {
      
      public static const §_-D§:int = 0;
      
      public static const L_ONE:int = 1;
      
      public static const L_TWO:int = 2;
      
      public static const L_THREE:int = 3;
      
      public static const §import const do§:int = 4;
      
      public static const §else const static§:int = 5;
      
      public static const L_MECH:int = 6;
      
      public static const L_DWAARP:int = 7;
      
      private var §switch function§:String;
      
      private var cant:int = 0;
      
      public var §_-hT§:Boolean = false;
      
      public var §set for finally§:int = 34;
      
      public var chargeTimePreShoot:int = 24;
      
      public var §_-HH§:int = 0;
      
      public var §_-vg§:Point = new Point();
      
      public function TowerEngineer(param1:int, param2:int, param3:Point, param4:Boolean = true)
      {
         super(param1,param2,param3,"",param4);
         this.§implements for import§ = "engineer";
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.§_-q1§ = false;
         this.§default implements§ += this.getCost(this.cRoot.gameSettings.engineers.level1.cost);
         this.cRoot.updateCash(-this.getCost(this.cRoot.gameSettings.engineers.level1.cost));
         this.building = true;
         this.§_-5q§ = this.cRoot.gameSettings.§_-5q§;
         this.§case else§ = 0;
         this.§_-SV§(new §extends const throw§());
         this.§function const get§ = new §const const get§(-16,-41,this.§_-5q§);
         this.§_-yT§().addChild(this.§function const get§);
         this.§try static§(new §_-xv§());
         this.§throw const each§ = new Point(this.x,this.y - 45);
         this.§_-Pj§ = new Point(this.x,this.y - 45);
         this.§dynamic const native§ = 42;
         this.§_-xY§ = 49;
         this.addEventListener(MouseEvent.ROLL_OVER,rollOverEvents,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,rollOutEvents,false,0,true);
      }
      
      override public function onFrameUpdate() : void
      {
         if(this.§include var§)
         {
            return;
         }
         if(this.§super var§())
         {
            return;
         }
         this.§_-WT§();
         if(this.§_-hT§)
         {
            ++this.§_-HH§;
            if(this.§_-HH§ == this.§set for finally§)
            {
               this.§_-HH§ = 0;
               this.§_-hT§ = false;
               this.endCharge();
            }
            if(this.§_-HH§ == this.§set for finally§ - this.chargeTimePreShoot)
            {
               this.shoot();
            }
         }
         else
         {
            if(this.§package throw§())
            {
               return;
            }
            this.§const with§();
            if(this.§_-lO§)
            {
               if(this.§_-O1§(this.cRoot.gameSettings.enemyMaxLevel,this.§_-q1§))
               {
                  this.chargeShoot();
               }
            }
         }
      }
      
      override public function pause() : void
      {
         if(this.building)
         {
            return;
         }
         if(MovieClip(this.§_-yT§()).currentFrameLabel != "idle")
         {
            this.§_-yT§().stop();
         }
         this.§_-Ek§();
      }
      
      public function §_-Ek§() : void
      {
      }
      
      protected function endCharge() : void
      {
      }
      
      override public function unPause() : void
      {
         if(this.building)
         {
            return;
         }
         if(MovieClip(this.§_-yT§()).currentFrameLabel != "idle")
         {
            this.§_-yT§().play();
         }
         this.§else for throw§();
      }
      
      public function §else for throw§() : void
      {
      }
      
      override public function getInfo() : Object
      {
         var _loc1_:Object = {};
         _loc1_.tName = Locale.loadStringEx("TOWER_ENGINEERS_NAME",Locale.getDefaultLang());
         _loc1_.tIconName = this.§implements for import§;
         _loc1_.tRangeHeight = this.§_-xw§;
         _loc1_.tRangeWidth = this.§with super§;
         _loc1_.tReload = this.reloadTime + this.§set for finally§;
         this.§_-jp§(_loc1_);
         return _loc1_;
      }
      
      public function §package throw§() : Boolean
      {
         return false;
      }
      
      public function §_-WT§() : void
      {
      }
      
      public function clickEvent(param1:MouseEvent) : void
      {
         if(this.§include var§)
         {
            return;
         }
         if(!this.cRoot.enableElements)
         {
            return;
         }
         this.cRoot.menu.§_-su§(this);
         this.§_-OD§();
      }
      
      public function chargeShoot() : *
      {
         this.§_-yT§().gotoAndPlay("shoot");
         this.§_-hT§ = true;
         this.§_-lO§ = false;
         this.§_-vg§.x = this.target.§_-uo§[this.target.§_-GR§ + this.target.getNodesSpeed()].x;
         this.§_-vg§.y = this.target.§_-uo§[this.target.§_-GR§ + this.target.getNodesSpeed()].y;
      }
      
      override public function shoot() : void
      {
         if(this.target == null || !this.target.isActive)
         {
            if(this.§_-O1§(this.cRoot.gameSettings.enemyMaxLevel,this.§_-q1§))
            {
               this.§_-vg§.x = this.target.§_-uo§[this.target.§_-GR§ + this.target.getNodesSpeed()].x;
               this.§_-vg§.y = this.target.§_-uo§[this.target.§_-GR§ + this.target.getNodesSpeed()].y;
            }
         }
         else if(this.target.isBlocked)
         {
            this.§_-vg§.x = this.target.x;
            this.§_-vg§.y = this.target.y;
         }
         ++this.§_-B§;
         var _loc1_:Class = getDefinitionByName(this.§switch function§) as Class;
         this.cRoot.bullets.addChild(new _loc1_(this.level,this.§throw const each§,this.§_-vg§,this.§super switch§));
      }
      
      override public function onRange(param1:Enemy) : Boolean
      {
         return this.pointOnRange(new Point(param1.§_-uo§[param1.§_-GR§ + param1.getNodesSpeed()].x,param1.§_-uo§[param1.§_-GR§ + param1.getNodesSpeed()].y));
      }
      
      override public function checkMenuRollOverAction(param1:String) : void
      {
         switch(param1)
         {
            case "level_1":
               this.showRangeNew(this.cRoot.gameSettings.engineers.level1.远程,this.cRoot.gameSettings.engineers.level1.远程 * this.cRoot.gameSettings.rangeRatio);
               break;
            case "level_2":
               this.showRangeNew(this.cRoot.gameSettings.engineers.level2.远程,this.cRoot.gameSettings.engineers.level2.远程 * this.cRoot.gameSettings.rangeRatio);
               break;
            case "level_3":
               this.showRangeNew(this.cRoot.gameSettings.engineers.level3.远程,this.cRoot.gameSettings.engineers.level3.远程 * this.cRoot.gameSettings.rangeRatio);
               break;
            case "level_mech":
               this.showRangeNew(this.cRoot.gameSettings.engineers.mech.rallyRange,this.cRoot.gameSettings.engineers.mech.rallyRange * this.cRoot.gameSettings.rangeRatio);
               break;
            case "level_dwaarp":
               this.showRangeNew(this.cRoot.gameSettings.engineers.dwaarp.远程,this.cRoot.gameSettings.engineers.dwaarp.远程 * this.cRoot.gameSettings.rangeRatio);
         }
      }
      
      protected function getCost(param1:int) : int
      {
         if(this.cRoot.game.gameUpgrades.engineersUpFieldLogistics == true && (this.cRoot.§finally const try§ == 0 || this.cRoot.§finally const try§ >= 3))
         {
            return Math.ceil(param1 - param1 * 0.1);
         }
         return param1;
      }
      
      override public function §_-OD§() : void
      {
         if(this.cRoot.quickMenu.cTower == this)
         {
            this.cRoot.§_-vA§();
            return;
         }
         var _loc1_:String = Locale.getDefaultLang();
         switch(this.currentLevel)
         {
            case "level_1":
               MovieClip(this.cRoot).quickMenu.load(this.x,this.y - 10,this,true,50,true,new Array(new Array("level_2","lv_up",this.getCost(this.cRoot.gameSettings.engineers.level2.cost),this.cRoot.§_-v7§(§switch for var§.ENGINEERS,2),0,0,0,7,"TooltipBasic",{
                  "title":Locale.loadStringEx("TOWER_ENGINEERS_UPGRADE_LEVEL2_NAME",_loc1_),
                  "text":Locale.loadStringEx("TOWER_ENGINEERS_UPGRADE_LEVEL2_DESCRIPTION",_loc1_),
                  "atts":[[Locale.loadStringEx("C_DAMAGE",_loc1_),this.cRoot.gameSettings.engineers.level2.minDamage + "-" + this.cRoot.gameSettings.engineers.level2.maxDamage,this.§use for import§(this.cRoot.gameSettings.engineers.level1.maxDamage,this.cRoot.gameSettings.engineers.level2.maxDamage)],[Locale.loadStringEx("C_RELOAD",_loc1_),this.cRoot.gameSettings.getReloadString(this.cRoot.gameSettings.engineers.level2.reload / this.cRoot.gameSettings.framesRate),this.§use for import§(this.cRoot.gameSettings.engineers.level1.reload,this.cRoot.gameSettings.engineers.level2.reload,true)]]
               })));
               break;
            case "level_2":
               MovieClip(this.cRoot).quickMenu.load(this.x,this.y - 10,this,true,50,true,new Array(new Array("level_3","lv_up",this.getCost(this.cRoot.gameSettings.engineers.level3.cost),this.cRoot.§_-v7§(§switch for var§.ENGINEERS,3),0,0,0,7,"TooltipBasic",{
                  "title":Locale.loadStringEx("TOWER_ENGINEERS_UPGRADE_LEVEL3_NAME",_loc1_),
                  "text":Locale.loadStringEx("TOWER_ENGINEERS_UPGRADE_LEVEL3_DESCRIPTION",_loc1_),
                  "atts":[[Locale.loadStringEx("C_DAMAGE",_loc1_),this.cRoot.gameSettings.engineers.level3.minDamage + "-" + this.cRoot.gameSettings.engineers.level3.maxDamage,this.§use for import§(this.cRoot.gameSettings.engineers.level2.maxDamage,this.cRoot.gameSettings.engineers.level3.maxDamage)],[Locale.loadStringEx("C_RELOAD",_loc1_),this.cRoot.gameSettings.getReloadString(this.cRoot.gameSettings.engineers.level3.reload / this.cRoot.gameSettings.framesRate),this.§use for import§(this.cRoot.gameSettings.engineers.level2.reload,this.cRoot.gameSettings.engineers.level3.reload,true)]]
               })));
               break;
            case "level_3":
               MovieClip(this.cRoot).quickMenu.load(this.x,this.y - 10,this,true,50,true,new Array(new Array("level_dwaarp","tw_furnace",this.getCost(this.cRoot.gameSettings.engineers.dwaarp.cost),this.cRoot.§_-v7§(§switch for var§.ENGINEERS,6),0,0,0,1,"TooltipBasic",{
                  "title":Locale.loadStringEx("TOWER_DWAARP_NAME",_loc1_),
                  "text":Locale.loadStringEx("TOWER_DWAARP_DESCRIPTION",_loc1_),
                  "atts":[[Locale.loadStringEx("C_DAMAGE",_loc1_),this.cRoot.gameSettings.engineers.dwaarp.minDamage + "-" + this.cRoot.gameSettings.engineers.dwaarp.maxDamage,this.§use for import§(this.cRoot.gameSettings.engineers.level3.maxDamage,this.cRoot.gameSettings.engineers.dwaarp.maxDamage)],[Locale.loadStringEx("C_RELOAD",_loc1_),this.cRoot.gameSettings.getReloadString(this.cRoot.gameSettings.engineers.dwaarp.reload / this.cRoot.gameSettings.framesRate),this.§use for import§(this.cRoot.gameSettings.engineers.level3.reload,this.cRoot.gameSettings.engineers.dwaarp.reload,true)]],
                  "extras":[Locale.loadStringEx("TOWER_DWAARP_DRILL_NAME_1",_loc1_),Locale.loadStringEx("TOWER_DWAARP_BLAST_NAME",_loc1_)]
               }),new Array("level_mech","tw_mech",this.cRoot.gameSettings.engineers.mech.cost,this.cRoot.§_-v7§(§switch for var§.ENGINEERS,7),0,0,0,2,"TooltipBasic",{
                  "title":Locale.loadStringEx("TOWER_MECH_NAME",_loc1_),
                  "text":Locale.loadStringEx("TOWER_MECH_DESCRIPTION",_loc1_),
                  "atts":[[Locale.loadStringEx("C_DAMAGE",_loc1_),this.cRoot.gameSettings.engineers.mech.minDamage + "-" + this.cRoot.gameSettings.engineers.mech.maxDamage,this.§use for import§(this.cRoot.gameSettings.engineers.level3.maxDamage,this.cRoot.gameSettings.engineers.mech.maxDamage)],[Locale.loadStringEx("C_RELOAD",_loc1_),this.cRoot.gameSettings.getReloadString(this.cRoot.gameSettings.engineers.mech.reload / this.cRoot.gameSettings.framesRate),this.§use for import§(this.cRoot.gameSettings.engineers.level3.reload,this.cRoot.gameSettings.engineers.mech.reload,true)]],
                  "extras":[Locale.loadStringEx("TOWER_MECH_MISSILE_NAME",_loc1_),Locale.loadStringEx("TOWER_MECH_WASTE_NAME_1",_loc1_)]
               })));
         }
         this.cRoot.quickMenu.show(this.cRoot.§get const with§);
         this.showRange(this.§with super§,this.§_-xw§);
      }
      
      override public function upgradeTower(param1:String) : void
      {
         var _loc2_:§extends const var§ = null;
         var _loc3_:§extends const var§ = null;
         var _loc4_:int = 0;
         switch(param1)
         {
            case "level_1":
               this.cRoot.game.gameSounds.§for include§();
               this.cRoot.game.§throw const implements§.§_-kZ§(this.cRoot,"engineer");
               this.§_-mb§(new GTowerEngineerStandar1());
               this.addEventListener(MouseEvent.CLICK,this.clickEvent,false,0,true);
               this.§_-3L§(L_ONE);
               this.§switch function§ = "BombCommon";
               this.reloadTime = this.cRoot.gameSettings.engineers.level1.reload - this.§set for finally§;
               this.§_-xw§ = this.cRoot.gameSettings.engineers.level1.远程 * this.cRoot.gameSettings.rangeRatio;
               this.§with super§ = this.cRoot.gameSettings.engineers.level1.远程;
               break;
            case "sell":
               this.§_-X6§();
               this.cRoot.updateCash(this.getSellValue());
               this.cRoot.entities.addChild(new TowerHolder(this.x,this.y,this.§var for for§,this.canBuildBarracks));
               this.cRoot.entities.addChild(new §var for finally§(new Point(this.x,this.y),this.getSellValue()));
               this.cRoot.§null each§();
               this.destroyThis();
               break;
            case "level_2":
               this.cRoot.game.gameSounds.§for include§();
               this.§_-Qp§();
               this.§default implements§ += this.getCost(this.cRoot.gameSettings.engineers.level2.cost);
               this.cRoot.updateCash(-this.getCost(this.cRoot.gameSettings.engineers.level2.cost));
               this.§_-mb§(new GTowerEngineerStandar2());
               this.§_-3L§(L_TWO);
               this.removeBuffRange();
               this.§switch function§ = "BombDynamite";
               this.reloadTime = this.cRoot.gameSettings.engineers.level2.reload - this.§set for finally§;
               this.§_-xw§ = this.cRoot.gameSettings.engineers.level2.远程 * this.cRoot.gameSettings.rangeRatio;
               this.§with super§ = this.cRoot.gameSettings.engineers.level2.远程;
               this.cRoot.menu.§_-su§(this);
               this.cRoot.§return else§();
               break;
            case "level_3":
               this.cRoot.game.gameSounds.§for include§();
               this.§_-Qp§();
               this.cRoot.game.§throw const implements§.upgradeTowerLevel3(this.cRoot,"engineer");
               this.§default implements§ += this.getCost(this.cRoot.gameSettings.engineers.level3.cost);
               this.cRoot.updateCash(-this.getCost(this.cRoot.gameSettings.engineers.level3.cost));
               this.§_-mb§(new GTowerEngineerStandar3());
               this.§_-3L§(L_THREE);
               this.removeBuffRange();
               this.§switch function§ = "BombBlack";
               this.reloadTime = this.cRoot.gameSettings.engineers.level3.reload - this.§set for finally§;
               this.§_-xw§ = this.cRoot.gameSettings.engineers.level3.远程 * this.cRoot.gameSettings.rangeRatio;
               this.§with super§ = this.cRoot.gameSettings.engineers.level3.远程;
               this.cRoot.menu.§_-su§(this);
               this.cRoot.§return else§();
               break;
            case "level_mech":
               this.§_-Qp§();
               _loc2_ = new TowerEngineerMech(this.x,this.y,this.§var for for§,this.§default implements§,this.canBuildBarracks);
               this.cRoot.entities.addChild(_loc2_);
               this.cRoot.towers[_loc2_] = _loc2_;
               _loc4_ = 0;
               while(_loc4_ < this.cRoot.entities.numChildren)
               {
                  if(getQualifiedClassName(this.cRoot.entities.getChildAt(_loc4_)) == "TowerEngineerMech")
                  {
                     ++this.cant;
                  }
                  if(this.cant >= 3)
                  {
                     this.cRoot.game.§throw const implements§.funcMechwarrior(this.cRoot);
                     break;
                  }
                  _loc4_++;
               }
               this.destroyThis();
               break;
            case "level_dwaarp":
               this.§_-Qp§();
               _loc3_ = new TowerEngineerDwaarp(this.x,this.y,this.§var for for§,this.§default implements§,this.canBuildBarracks);
               this.cRoot.entities.addChild(_loc3_);
               this.cRoot.towers[_loc3_] = _loc3_;
               this.destroyThis();
         }
         this.currentLevel = param1;
      }
      
      public function getPowerCost(param1:int) : int
      {
         if(this.cRoot.game.gameUpgrades.engineersUpIndustrialization && (this.cRoot.§finally const try§ == 0 || this.cRoot.§finally const try§ >= 4))
         {
            return Math.floor(param1 - param1 * 0.25);
         }
         return param1;
      }
      
      public function §_-3L§(param1:int) : void
      {
         this.level = param1;
      }
      
      private function §_-jp§(param1:Object) : void
      {
         switch(this.§switch function§)
         {
            case "BombCommon":
               param1.tDamageMin = this.cRoot.gameSettings.engineers.level1.minDamage + this.cRoot.gameSettings.engineers.level1.minDamage * this.§super switch§ / 100;
               param1.tDamageMax = this.cRoot.gameSettings.engineers.level1.maxDamage + this.cRoot.gameSettings.engineers.level1.maxDamage * this.§super switch§ / 100;
               break;
            case "BombDynamite":
               param1.tDamageMin = this.cRoot.gameSettings.engineers.level2.minDamage + this.cRoot.gameSettings.engineers.level2.minDamage * this.§super switch§ / 100;
               param1.tDamageMax = this.cRoot.gameSettings.engineers.level2.maxDamage + this.cRoot.gameSettings.engineers.level2.maxDamage * this.§super switch§ / 100;
               break;
            case "BombBlack":
               param1.tDamageMin = this.cRoot.gameSettings.engineers.level3.minDamage + this.cRoot.gameSettings.engineers.level3.minDamage * this.§super switch§ / 100;
               param1.tDamageMax = this.cRoot.gameSettings.engineers.level3.maxDamage + this.cRoot.gameSettings.engineers.level3.maxDamage * this.§super switch§ / 100;
         }
      }
      
      public function destroyThis() : void
      {
         this.§include var§ = true;
         this.unSelect();
         this.§_-Nb§();
         this.target = null;
         this.removeEventListener(MouseEvent.ROLL_OVER,rollOverEvents);
         this.removeEventListener(MouseEvent.ROLL_OUT,rollOutEvents);
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.removeEventListener(MouseEvent.CLICK,this.clickEvent);
         this.cRoot.entities.removeChild(this);
         this.§final for const§();
         this.cRoot.§default true§(this);
         this.cRoot.§return else§();
      }
   }
}

