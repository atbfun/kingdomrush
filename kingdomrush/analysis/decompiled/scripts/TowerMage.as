package
{
   import fl.lang.*;
   import flash.display.*;
   import flash.events.*;
   import flash.geom.*;
   
   public class TowerMage extends §extends const var§
   {
      
      public static const §_-D§:int = 0;
      
      public static const L_ONE:int = 1;
      
      public static const L_TWO:int = 2;
      
      public static const L_THREE:int = 3;
      
      public static const L_ARCANE:int = 4;
      
      public static const §default const each§:int = 5;
      
      public static const L_NECROMANCER:int = 6;
      
      public static const §_-E1§:int = 7;
      
      public var §_-hT§:Boolean = false;
      
      public var §set for finally§:int = 15;
      
      public var chargeTimePreShoot:int = 5;
      
      public var §_-HH§:int = 0;
      
      public var idleTime:int;
      
      public var idleTimeCounter:int;
      
      public var sName:String;
      
      public function TowerMage(param1:int, param2:int, param3:Point, param4:String = "", param5:Boolean = true)
      {
         super(param1,param2,param3,param4,param5);
         this.§implements for import§ = "mage";
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.idleTime = 90;
         this.idleTimeCounter = 0;
         this.§dynamic const native§ = 40;
         this.§_-xY§ = 58;
         if(this.§null const with§ == "")
         {
            this.§default implements§ += this.getCost(this.cRoot.gameSettings.mages.level1.cost);
            this.cRoot.updateCash(-this.getCost(this.cRoot.gameSettings.mages.level1.cost));
            this.building = true;
            this.§_-5q§ = this.cRoot.gameSettings.§_-5q§;
            this.§case else§ = 0;
            this.§_-SV§(new §_-tP§());
            this.§function const get§ = new §const const get§(-17,-41,this.§_-5q§);
            this.§_-yT§().addChild(this.§function const get§);
         }
         else
         {
            this.addEventListener(MouseEvent.CLICK,this.clickEvent,false,0,true);
            this.building = false;
            this.upgradeTower(this.§null const with§);
         }
         this.§throw const each§ = new Point(this.x + 6,this.y - 48);
         this.§_-Pj§ = new Point(this.x - 6,this.y - 48);
         this.§try static§(new §throw const try§());
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
         this.updateSpecial();
         this.§_-WT§();
         if(this.§_-hT§)
         {
            ++this.§_-HH§;
            if(this.§_-HH§ == this.§set for finally§)
            {
               this.§_-HH§ = 0;
               this.§_-hT§ = false;
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
               if(this.§_-O1§(this.cRoot.gameSettings.enemyMaxLevel))
               {
                  this.chargeShoot();
               }
               else
               {
                  this.§_-Kv§();
               }
            }
         }
      }
      
      public function updateSpecial() : void
      {
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
         if(MovieClip(this.§_-yT§().mage).currentFrameLabel != "idleUp" && MovieClip(this.§_-yT§().mage).currentFrameLabel != "idleDown")
         {
            this.§_-yT§().mage.stop();
         }
         this.§_-Ek§();
      }
      
      public function §_-Ek§() : void
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
         if(MovieClip(this.§_-yT§().mage).currentFrameLabel != "idleUp" && MovieClip(this.§_-yT§().mage).currentFrameLabel != "idleDown")
         {
            this.§_-yT§().mage.play();
         }
         this.§else for throw§();
      }
      
      public function §else for throw§() : void
      {
      }
      
      override public function getInfo() : Object
      {
         var _loc1_:Object = {};
         _loc1_.tName = Locale.loadStringEx("TOWER_MAGES_NAME",Locale.getDefaultLang());
         _loc1_.tIconName = this.§implements for import§;
         _loc1_.tRangeHeight = this.§_-xw§;
         _loc1_.tRangeWidth = this.§with super§;
         _loc1_.tReload = this.reloadTime + this.§set for finally§;
         _loc1_.tAttackDamage = 2;
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
         if(this.target.y >= this.y)
         {
            this.positionCurrentShoot = this.§_-Pj§;
            this.§_-yT§().mage.gotoAndPlay("shoot_down");
         }
         else
         {
            this.positionCurrentShoot = this.§throw const each§;
            this.§_-yT§().mage.gotoAndPlay("shoot_up");
         }
         this.§_-hT§ = true;
         this.§_-lO§ = false;
         this.idleTimeCounter = 0;
      }
      
      public function §_-Kv§() : void
      {
         ++this.idleTimeCounter;
         if(this.idleTimeCounter == this.idleTime)
         {
            MovieClip(this.§_-yT§().mage).gotoAndStop("idleDown");
         }
      }
      
      override public function shoot() : void
      {
         if((this.target == null || !this.target.isActive) && !this.§_-O1§(this.cRoot.gameSettings.enemyMaxLevel))
         {
            return;
         }
         if(this.target.y >= this.y)
         {
            this.positionCurrentShoot = this.§_-Pj§;
         }
         else
         {
            this.positionCurrentShoot = this.§throw const each§;
         }
         this.cRoot.bullets.addChild(new §_-hy§(this.positionCurrentShoot,this.target,this.level,this.§super switch§));
         ++this.§_-B§;
      }
      
      override public function checkMenuRollOverAction(param1:String) : void
      {
         switch(param1)
         {
            case "level_1":
               this.showRangeNew(this.cRoot.gameSettings.mages.level1.远程,this.cRoot.gameSettings.mages.level1.远程 * this.cRoot.gameSettings.rangeRatio);
               break;
            case "level_2":
               this.showRangeNew(this.cRoot.gameSettings.mages.level2.远程,this.cRoot.gameSettings.mages.level2.远程 * this.cRoot.gameSettings.rangeRatio);
               break;
            case "level_3":
               this.showRangeNew(this.cRoot.gameSettings.mages.level3.远程,this.cRoot.gameSettings.mages.level3.远程 * this.cRoot.gameSettings.rangeRatio);
               break;
            case "level_necromancer":
               this.showRangeNew(this.cRoot.gameSettings.mages.necromancer.远程,this.cRoot.gameSettings.mages.necromancer.远程 * this.cRoot.gameSettings.rangeRatio);
               break;
            case "level_archmage":
               this.showRangeNew(this.cRoot.gameSettings.mages.archmage.远程,this.cRoot.gameSettings.mages.archmage.远程 * this.cRoot.gameSettings.rangeRatio);
         }
      }
      
      override public function §_-OD§() : void
      {
         if(this.cRoot.quickMenu.cTower == this)
         {
            this.cRoot.§_-vA§();
            return;
         }
         var _loc1_:String = Locale.getDefaultLang();
         switch(this.level)
         {
            case L_ONE:
               MovieClip(this.cRoot).quickMenu.load(this.x,this.y - 10,this,true,50,true,new Array(new Array("level_2","lv_up",this.getCost(this.cRoot.gameSettings.mages.level2.cost),this.cRoot.§_-v7§(§switch for var§.MAGES,2),0,0,0,7,"TooltipBasic",{
                  "title":Locale.loadStringEx("TOWER_MAGES_UPGRADE_LEVEL2_NAME",_loc1_),
                  "text":Locale.loadStringEx("TOWER_MAGES_UPGRADE_LEVEL2_DESCRIPTION",_loc1_),
                  "atts":[[Locale.loadStringEx("C_DAMAGE",_loc1_),this.cRoot.gameSettings.mages.level2.minDamage + "-" + this.cRoot.gameSettings.mages.level2.maxDamage,this.§use for import§(this.cRoot.gameSettings.mages.level1.maxDamage,this.cRoot.gameSettings.mages.level2.maxDamage)],[Locale.loadStringEx("C_RELOAD",_loc1_),this.cRoot.gameSettings.getReloadString(this.cRoot.gameSettings.mages.level2.reload / this.cRoot.gameSettings.framesRate),this.§use for import§(this.cRoot.gameSettings.mages.level1.reload,this.cRoot.gameSettings.mages.level2.reload,true)]]
               })));
               break;
            case L_TWO:
               MovieClip(this.cRoot).quickMenu.load(this.x,this.y - 10,this,true,50,true,new Array(new Array("level_3","lv_up",this.getCost(this.cRoot.gameSettings.mages.level3.cost),this.cRoot.§_-v7§(§switch for var§.MAGES,3),0,0,0,7,"TooltipBasic",{
                  "title":Locale.loadStringEx("TOWER_MAGES_UPGRADE_LEVEL3_NAME",_loc1_),
                  "text":Locale.loadStringEx("TOWER_MAGES_UPGRADE_LEVEL3_DESCRIPTION",_loc1_),
                  "atts":[[Locale.loadStringEx("C_DAMAGE",_loc1_),this.cRoot.gameSettings.mages.level3.minDamage + "-" + this.cRoot.gameSettings.mages.level3.maxDamage,this.§use for import§(this.cRoot.gameSettings.mages.level2.maxDamage,this.cRoot.gameSettings.mages.level3.maxDamage)],[Locale.loadStringEx("C_RELOAD",_loc1_),this.cRoot.gameSettings.getReloadString(this.cRoot.gameSettings.mages.level3.reload / this.cRoot.gameSettings.framesRate),this.§use for import§(this.cRoot.gameSettings.mages.level2.reload,this.cRoot.gameSettings.mages.level3.reload,true)]]
               })));
               break;
            case L_THREE:
               MovieClip(this.cRoot).quickMenu.load(this.x,this.y - 10,this,true,50,true,new Array(new Array("level_archmage","tw_hermetic",this.getCost(this.cRoot.gameSettings.mages.archmage.cost),this.cRoot.§_-v7§(§switch for var§.MAGES,6),0,0,0,2,"TooltipBasic",{
                  "title":Locale.loadStringEx("TOWER_ARCHMAGE_NAME",_loc1_),
                  "text":Locale.loadStringEx("TOWER_ARCHMAGE_DESCRIPTION",_loc1_),
                  "atts":[[Locale.loadStringEx("C_DAMAGE",_loc1_),this.cRoot.gameSettings.mages.archmage.minDamage + "-" + this.cRoot.gameSettings.mages.archmage.maxDamage,this.§use for import§(this.cRoot.gameSettings.mages.level3.maxDamage,this.cRoot.gameSettings.mages.archmage.maxDamage)],[Locale.loadStringEx("C_RELOAD",_loc1_),this.cRoot.gameSettings.getReloadString(this.cRoot.gameSettings.mages.archmage.reload / this.cRoot.gameSettings.framesRate),this.§use for import§(this.cRoot.gameSettings.mages.level3.reload,this.cRoot.gameSettings.mages.archmage.reload,true)]],
                  "extras":[Locale.loadStringEx("TOWER_ARCHMAGE_CRITICAL_NAME",_loc1_),Locale.loadStringEx("TOWER_ARCHMAGE_TWISTER_NAME",_loc1_)]
               }),new Array("level_necromancer","tw_necromancer",this.getCost(this.cRoot.gameSettings.mages.necromancer.cost),this.cRoot.§_-v7§(§switch for var§.MAGES,7),0,0,0,1,"TooltipBasic",{
                  "title":Locale.loadStringEx("TOWER_NECROMANCER_NAME",_loc1_),
                  "text":Locale.loadStringEx("TOWER_NECROMANCER_DESCRIPTION",_loc1_),
                  "atts":[[Locale.loadStringEx("C_DAMAGE",_loc1_),this.cRoot.gameSettings.mages.necromancer.minDamage + "-" + this.cRoot.gameSettings.mages.necromancer.maxDamage,this.§use for import§(this.cRoot.gameSettings.mages.level3.maxDamage,this.cRoot.gameSettings.mages.necromancer.maxDamage)],[Locale.loadStringEx("C_RELOAD",_loc1_),this.cRoot.gameSettings.getReloadString(this.cRoot.gameSettings.mages.necromancer.reload / this.cRoot.gameSettings.framesRate),this.§use for import§(this.cRoot.gameSettings.mages.level3.reload,this.cRoot.gameSettings.mages.necromancer.reload,true)]],
                  "extras":[Locale.loadStringEx("TOWER_NECROMANCER_PESTILENCE_NAME",_loc1_),Locale.loadStringEx("TOWER_NECROMANCER_RIDER_NAME",_loc1_)]
               })));
         }
         this.cRoot.quickMenu.show(this.cRoot.§get const with§);
         this.showRange(this.§with super§,this.§_-xw§);
      }
      
      override public function upgradeTower(param1:String) : void
      {
         var _loc2_:§extends const var§ = null;
         var _loc3_:§extends const var§ = null;
         switch(param1)
         {
            case "level_1":
               if(this.§null const with§ == "")
               {
                  this.cRoot.game.gameSounds.§_-N0§();
                  this.§_-mb§(new GTowerMageStandar1());
                  this.cRoot.game.§throw const implements§.§_-kZ§(this.cRoot,"mages");
                  this.addEventListener(MouseEvent.CLICK,this.clickEvent,false,0,true);
               }
               else
               {
                  this.§_-SV§(new GTowerMageStandar1());
               }
               this.§_-3L§(L_ONE);
               this.reloadTime = this.cRoot.gameSettings.mages.level1.reload - this.§set for finally§;
               this.§_-xw§ = this.cRoot.gameSettings.mages.level1.远程 * this.cRoot.gameSettings.rangeRatio;
               this.§with super§ = this.cRoot.gameSettings.mages.level1.远程;
               this.§null const with§ = "";
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
               if(this.§null const with§ == "")
               {
                  this.cRoot.game.gameSounds.§_-N0§();
                  this.§_-Qp§();
                  this.§default implements§ += this.getCost(this.cRoot.gameSettings.mages.level2.cost);
                  this.cRoot.updateCash(-this.getCost(this.cRoot.gameSettings.mages.level2.cost));
                  this.§_-mb§(new GTowerMageStandar2());
               }
               else
               {
                  this.§_-SV§(new GTowerMageStandar2());
               }
               this.removeBuffRange();
               this.§_-3L§(L_TWO);
               this.reloadTime = this.cRoot.gameSettings.mages.level2.reload - this.§set for finally§;
               this.§_-xw§ = this.cRoot.gameSettings.mages.level2.远程 * this.cRoot.gameSettings.rangeRatio;
               this.§with super§ = this.cRoot.gameSettings.mages.level2.远程;
               if(this.§null const with§ == "")
               {
                  this.cRoot.menu.§_-su§(this);
               }
               this.§null const with§ = "";
               this.cRoot.§return else§();
               break;
            case "level_3":
               if(this.§null const with§ == "")
               {
                  this.cRoot.game.gameSounds.§_-N0§();
                  this.§_-Qp§();
                  this.cRoot.game.§throw const implements§.upgradeTowerLevel3(this.cRoot,"mage");
                  this.§default implements§ += this.getCost(this.cRoot.gameSettings.mages.level3.cost);
                  this.cRoot.updateCash(-this.getCost(this.cRoot.gameSettings.mages.level3.cost));
                  this.§_-mb§(new GTowerMageStandar3());
               }
               else
               {
                  this.§_-SV§(new GTowerMageStandar3());
               }
               this.§_-3L§(L_THREE);
               this.§throw const each§ = new Point(this.x + 6,this.y - 51);
               this.§_-Pj§ = new Point(this.x - 7,this.y - 53);
               this.removeBuffRange();
               this.reloadTime = this.cRoot.gameSettings.mages.level3.reload - this.§set for finally§;
               this.§_-xw§ = this.cRoot.gameSettings.mages.level3.远程 * this.cRoot.gameSettings.rangeRatio;
               this.§with super§ = this.cRoot.gameSettings.mages.level3.远程;
               if(this.§null const with§ == "")
               {
                  this.cRoot.menu.§_-su§(this);
               }
               this.§null const with§ = "";
               this.cRoot.§return else§();
               break;
            case "level_archmage":
               this.§_-Qp§();
               _loc2_ = new TowerMageArchmage(this.x,this.y,this.§var for for§,this.§default implements§,this.canBuildBarracks);
               this.cRoot.entities.addChild(_loc2_);
               this.cRoot.towers[_loc2_] = _loc2_;
               this.destroyThis();
               break;
            case "level_necromancer":
               this.§_-Qp§();
               _loc3_ = new TowerMageNecromancer(this.x,this.y,this.§var for for§,this.§default implements§,this.canBuildBarracks);
               this.cRoot.entities.addChild(_loc3_);
               this.cRoot.towers[_loc3_] = _loc3_;
               this.destroyThis();
         }
      }
      
      public function §_-3L§(param1:int) : void
      {
         this.level = param1;
         this.§_-HH§ = 0;
      }
      
      protected function getCost(param1:int) : int
      {
         if(this.cRoot.game.gameUpgrades.§while§ == true && (this.cRoot.§finally const try§ == 0 || this.cRoot.§finally const try§ >= 3))
         {
            return Math.ceil(param1 - param1 * 0.1);
         }
         return param1;
      }
      
      private function §_-jp§(param1:Object) : void
      {
         switch(this.level)
         {
            case 1:
               param1.tDamageMin = this.cRoot.gameSettings.mages.level1.minDamage + Math.ceil(this.cRoot.gameSettings.mages.level1.minDamage * this.§super switch§ / 100);
               param1.tDamageMax = this.cRoot.gameSettings.mages.level1.maxDamage + Math.ceil(this.cRoot.gameSettings.mages.level1.maxDamage * this.§super switch§ / 100);
               break;
            case 2:
               param1.tDamageMin = this.cRoot.gameSettings.mages.level2.minDamage + Math.ceil(this.cRoot.gameSettings.mages.level2.minDamage * this.§super switch§ / 100);
               param1.tDamageMax = this.cRoot.gameSettings.mages.level2.maxDamage + Math.ceil(this.cRoot.gameSettings.mages.level2.maxDamage * this.§super switch§ / 100);
               break;
            case 3:
               param1.tDamageMin = this.cRoot.gameSettings.mages.level3.minDamage + Math.ceil(this.cRoot.gameSettings.mages.level3.minDamage * this.§super switch§ / 100);
               param1.tDamageMax = this.cRoot.gameSettings.mages.level3.maxDamage + Math.ceil(this.cRoot.gameSettings.mages.level3.maxDamage * this.§super switch§ / 100);
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

