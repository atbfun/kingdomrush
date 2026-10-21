package
{
   import §_-Nm§.*;
   import §_-rX§.§false super§;
   import com.greensock.*;
   import flash.display.*;
   import flash.events.*;
   import flash.geom.*;
   import flash.text.TextField;
   import flash.ui.*;
   import flash.utils.*;
   import ironhide.utils.tooltip.*;
   import §native super§.*;
   
   public class Level extends §_-dJ§
   {
      
      public static const LEVEL_NORMAL:int = 0;
      
      public static const LEVEL_PAUSED:int = 1;
      
      public static const LEVEL_WIN:int = 2;
      
      public static const LEVEL_OVER:int = 3;
      
      public static const LEVEL_STARTING:int = 4;
      
      public static const LEVEL_PRE_WIN:int = 5;
      
      public var mode:int;
      
      public var §else const for§:int;
      
      public var terrainType:String;
      
      public var §const switch§:int;
      
      public var game:§while const switch§;
      
      public var data:§_-VT§;
      
      public var §catch for use§:§case const var§ = new §case const var§();
      
      public var §_-z§:int = 0;
      
      public var §_-iC§:§use const return§ = new §use const return§();
      
      public var gameSettings:§switch for var§;
      
      public var §finally const try§:int;
      
      public var maxWaves:int;
      
      public var §class const with§:int;
      
      public var initLives:int;
      
      public var lives:int;
      
      public var cash:int;
      
      public var §_-Im§:int = 0;
      
      public var tDamage:Number = 0;
      
      public var §_-6I§:Array;
      
      public var §_-iu§:Array = [];
      
      public var pathsActives:Array = [];
      
      public var §each const each§:Boolean;
      
      public var §catch for catch§:Array;
      
      public var §_-Mb§:Boolean;
      
      public var §_-3X§:Array;
      
      public var §_-Bi§:Boolean;
      
      public var §_-1k§:Array = [];
      
      public var §_-HF§:Array;
      
      public var inactiveNodeDistance:int = 13;
      
      public var indexWaves:int = 0;
      
      public var intervalWaveCounter:int = 0;
      
      public var §use case§:Tooltip;
      
      public var menu:§override const else§;
      
      public var §_-oC§:§_-Ey§;
      
      public var §_-Gi§:§_-rW§;
      
      public var §implements import§:§final function§;
      
      public var §while import§:§use const final§;
      
      public var quickMenu:§_-Cv§;
      
      public var §_-xT§:§extends for use§;
      
      public var towerRange:§get const switch§ = new §get const switch§();
      
      public var towerRangeNew:TowerCircleNew = new TowerCircleNew();
      
      public var §_-KU§:§_-aB§ = new §_-aB§();
      
      public var waves:Array;
      
      public var activeWaves:Dictionary = new Dictionary(true);
      
      public var §_-GP§:Boolean;
      
      public var §do for§:§each const else§;
      
      public var terrain:Sprite = new Sprite();
      
      public var ellipses:Sprite = new Sprite();
      
      public var §in finally§:Sprite = new Sprite();
      
      public var enemyDecals:Sprite = new Sprite();
      
      public var §set const include§:Sprite = new Sprite();
      
      public var decals:Sprite = new Sprite();
      
      public var entities:Sprite = new Sprite();
      
      public var frontEntities:Sprite = new Sprite();
      
      public var bulletsDecals:Sprite = new Sprite();
      
      public var bullets:Sprite = new Sprite();
      
      public var §get const with§:Sprite = new Sprite();
      
      public var §import do§:Array = [];
      
      public var towers:Dictionary = new Dictionary(true);
      
      public var enemies:Dictionary = new Dictionary(true);
      
      public var §_-tz§:Dictionary = new Dictionary(true);
      
      public var §extends extends§:Dictionary = new Dictionary(true);
      
      public var §else for use§:§include throw§;
      
      public var staticEnemies:Dictionary = new Dictionary(true);
      
      public var §_-j4§:Array = [];
      
      public var rallyPoint:§_-SP§;
      
      public var §_-F0§:PowerPointer;
      
      public var enableElements:Boolean = true;
      
      public var §_-Io§:§_-Ax§;
      
      public var heroPortrait2:§_-Ax§;
      
      public var enemySelection:EnemySelection = new EnemySelection();
      
      public var soldierSelection:SoldierSelection = new SoldierSelection();
      
      public var §native do§:int = 0;
      
      public var §_-f7§:§_-2E§;
      
      public var gTerrain:MovieClip;
      
      public var initTime:int = 30;
      
      public var initTimeCounter:int = 0;
      
      public var §_-Y7§:int = 30;
      
      public var §const throw§:int = 0;
      
      public var power1:Boolean;
      
      public var power2:Boolean;
      
      public var power3:Boolean;
      
      public var power4:Boolean;
      
      public var §import const const§:int;
      
      public var unlockMaxMages:int;
      
      public var §_-Gc§:int;
      
      public var unlockMaxBarracks:int;
      
      public var §_-xO§:int;
      
      public var §each const get§:int;
      
      public var §_-WZ§:int;
      
      public var §_-ue§:int;
      
      public var isReadyToWin:Boolean;
      
      public var readyToWinTime:int = 30;
      
      public var readyToWinTimeCounter:int = 0;
      
      public var fearless:Boolean = true;
      
      private var fireballCounter:int;
      
      private var sellTowersCounter:int;
      
      private var §false const if§:int = 0;
      
      private var §_-YN§:int = 0;
      
      public var graveyard:§true for§;
      
      public var §else const if§:int = 0;
      
      public var §throw for const§:int = 0;
      
      public var §false const true§:int = 0;
      
      public var §false const native§:Number;
      
      public var §_-LW§:Boolean;
      
      public var §_-py§:§_-Bt§;
      
      public var §_-dL§:§default for§;
      
      public var §null const throw§:Boolean;
      
      public var isOnComicEnd:Boolean;
      
      public var §throw try§:§_-l4§;
      
      public var comicEnd:§_-l4§;
      
      public var §function const while§:Boolean;
      
      public var xml:XML;
      
      public var heroDied:Boolean = false;
      
      public var hero:§_-KX§;
      
      public var §_-V8§:§final final§;
      
      public var §null for false§:TextField;
      
      private var §_-3H§:§switch for var§;
      
      public function Level(param1:Array, param2:Array, param3:int = 0, param4:Boolean = false)
      {
         super();
         this.mode = param3;
         this.§const switch§ = this.cash;
         this.isReadyToWin = false;
         this.§function const while§ = param4;
         this.game.gameSounds.§_-PA§(this);
         this.entities.mouseEnabled = false;
         this.decals.mouseEnabled = false;
         this.enemyDecals.mouseEnabled = false;
         this.ellipses.mouseEnabled = false;
         this.ellipses.mouseChildren = false;
         this.addChild(this.terrain);
         this.addChild(this.enemyDecals);
         this.addChild(this.§set const include§);
         this.addChild(this.decals);
         this.addChild(this.§in finally§);
         this.addChild(this.entities);
         this.addChild(this.frontEntities);
         this.addChild(this.bulletsDecals);
         this.addChild(this.bullets);
         this.addChild(this.ellipses);
         this.addChild(this.§get const with§);
         this.getNumberOfWaves();
         this.§else for use§ = new §include throw§(this);
         this.lives = this.initLives;
         this.§else const for§ = LEVEL_STARTING;
         this.gameSettings = new §switch for var§(this.game,true,this.§finally const try§);
         this.§_-3H§ = new §switch for var§(this.game,true,this.§finally const try§);
         this.§_-iu§ = param2;
         var _loc5_:int = 0;
         while(_loc5_ < this.§_-iu§.length)
         {
            this.pathsActives.push(true);
            _loc5_++;
         }
         this.ellipses.addChild(this.towerRange);
         this.ellipses.addChild(this.towerRangeNew);
         this.ellipses.addChild(this.§_-KU§);
         this.towerRange.visible = false;
         this.towerRangeNew.visible = false;
         this.§_-KU§.visible = false;
         this.towerRange.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-cJ§,false,0,true);
         this.towerRangeNew.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-pf§,false,0,true);
         this.addEventListener(Event.ADDED_TO_STAGE,this.initS,false,0,true);
         this.§get const with§.addChild(this.§_-iC§);
         this.§_-iC§.start();
         this.§_-3u§();
         this.menu = new §override const else§(new Point(0,544),this);
         this.§_-tt§();
         this.initTowers(param1);
         this.§_-n4§();
         this.quickMenu = new §_-Cv§(this);
         this.§_-V8§ = new §final final§();
         this.addEventListener(Event.DEACTIVATE,this.onDeactivate,false,0,true);
      }
      
      public function §_-tt§() : void
      {
         this.§do for§ = new §_-38§(new Point(755,542));
         this.bullets.addChild(this.§do for§);
      }
      
      public function getGridTerrainTypeForPosition(param1:Point) : *
      {
         var _loc2_:§_-8O§ = this.§_-dL§.§override case§.getNodeAtPosition(param1);
         return _loc2_.terrainType;
      }
      
      public function §_-Uj§(param1:Point, param2:Point) : Array
      {
         var _loc3_:§_-8O§ = this.§_-dL§.§override case§.getNodeAtPosition(param1);
         var _loc4_:§_-8O§ = this.§_-dL§.§override case§.getNodeAtPosition(param2);
         if(_loc3_ == null || _loc4_ == null)
         {
            return null;
         }
         this.§_-dL§.§override case§.setStartNode(_loc3_);
         this.§_-dL§.§override case§.setEndNode(_loc4_);
         if(this.§_-dL§.§_-PS§(gridTerrainType))
         {
            return this.§_-dL§.path;
         }
         return null;
      }
      
      public function §_-n4§() : void
      {
      }
      
      public function loadCampaign() : void
      {
      }
      
      public function loadHeroic() : void
      {
      }
      
      public function loadIron() : void
      {
      }
      
      private function onDeactivate(param1:Event) : void
      {
         if(this.game.§set for break§ && this.§else const for§ == LEVEL_NORMAL)
         {
            this.§override for switch§(true);
         }
      }
      
      public function findNearestNodeToPosition(param1:Point, param2:Number, param3:int) : Object
      {
         var _loc5_:Number = NaN;
         var _loc7_:Array = null;
         var _loc8_:int = 0;
         var _loc9_:Point = null;
         var _loc4_:Object = new Object();
         _loc4_.node = -1;
         _loc4_.subPathIndex = -1;
         var _loc6_:int = 0;
         loop0:
         while(_loc6_ < 3)
         {
            _loc7_ = this.§_-iu§[param3][_loc6_];
            _loc8_ = 0;
            while(true)
            {
               if(_loc8_ >= _loc7_.length)
               {
                  _loc6_++;
                  continue loop0;
               }
               if(!this.§_-Pp§(param3,_loc8_))
               {
                  _loc9_ = _loc7_[_loc8_];
                  _loc5_ = Math.sqrt(Math.pow(_loc9_.y - param1.y,2) + Math.pow(_loc9_.x - param1.x,2));
                  if(_loc5_ < param2)
                  {
                     break;
                  }
               }
               _loc8_++;
            }
            param2 = _loc5_;
            _loc4_.node = _loc8_;
            _loc4_.subPathIndex = _loc6_;
            return _loc4_;
         }
         return _loc4_;
      }
      
      protected function initS(param1:Event) : void
      {
         this.§var const var§();
      }
      
      public function §set const catch§(param1:int, param2:Point) : Object
      {
         var _loc5_:int = 0;
         var _loc7_:Array = null;
         var _loc8_:int = 0;
         var _loc9_:Point = null;
         var _loc3_:Object = new Object();
         var _loc4_:int = int.MAX_VALUE;
         _loc3_.referenceNode = -1;
         _loc3_.pathIndex = -1;
         var _loc6_:int = 0;
         while(_loc6_ < this.§_-iu§.length)
         {
            _loc7_ = this.§_-iu§[_loc6_][param1];
            _loc8_ = 0;
            while(_loc8_ < _loc7_.length)
            {
               if(!this.§_-Pp§(_loc6_,_loc8_))
               {
                  _loc9_ = _loc7_[_loc8_];
                  _loc5_ = Math.sqrt(Math.pow(_loc9_.y - param2.y,2) + Math.pow(_loc9_.x - param2.x,2));
                  if(_loc5_ < _loc4_)
                  {
                     _loc4_ = _loc5_;
                     _loc3_.referenceNode = _loc8_;
                     _loc3_.pathIndex = _loc6_;
                  }
               }
               _loc8_++;
            }
            _loc6_++;
         }
         return _loc3_;
      }
      
      public function §_-CU§() : void
      {
      }
      
      public function keyPressed(param1:KeyboardEvent) : void
      {
         if(this.§_-V8§.parent != null)
         {
            return;
         }
         switch(param1.keyCode)
         {
            case Keyboard.SPACE:
               this.§each class§();
               break;
            case Keyboard.ESCAPE:
               this.§each class§();
               break;
            case 112:
               if(this.§else const for§ == LEVEL_NORMAL)
               {
                  this.§override for switch§();
               }
               else
               {
                  this.§finally const throw§();
               }
               break;
            case 80:
               if(this.§else const for§ == LEVEL_NORMAL)
               {
                  this.§override for switch§();
               }
               else
               {
                  this.§finally const throw§();
               }
               break;
            case Keyboard.NUMPAD_1:
            case Keyboard.NUMBER_1:
               this.§_-gX§();
               if(this.§else const for§ == LEVEL_NORMAL && this.menu != null && this.menu.§_-5V§.numChildren != 0)
               {
                  this.§try for set§();
                  if(this.§_-F0§ == null)
                  {
                     PowerFireball(this.menu.§_-5V§.getChildAt(0)).fireClick();
                  }
                  else if(getQualifiedClassName(this.§_-F0§) == "PowerPointerFireball")
                  {
                     this.§_-F0§.§_-YZ§();
                  }
                  else
                  {
                     this.§_-F0§.§_-YZ§();
                     PowerFireball(this.menu.§_-5V§.getChildAt(0)).fireClick();
                  }
               }
               break;
            case Keyboard.NUMPAD_2:
            case Keyboard.NUMBER_2:
               this.§_-gX§();
               if(this.§else const for§ == LEVEL_NORMAL && this.menu != null && this.menu.§_-5V§.numChildren != 0)
               {
                  this.§try for set§();
                  if(this.§_-F0§ == null)
                  {
                     PowerReinforcement(this.menu.§_-5V§.getChildAt(1)).fireClick();
                  }
                  else if(Boolean(§break use§.beginsWith(getQualifiedClassName(this.§_-F0§),"PowerPointerReinforcement")) || Boolean(§break use§.beginsWith(getQualifiedClassName(this.§_-F0§),"PowerPointerFarmer")))
                  {
                     this.§_-F0§.§_-YZ§();
                  }
                  else
                  {
                     this.§_-F0§.§_-YZ§();
                     PowerReinforcement(this.menu.§_-5V§.getChildAt(1)).fireClick();
                  }
               }
               break;
            case Keyboard.NUMPAD_3:
            case Keyboard.NUMBER_3:
               this.§dynamic const final§();
               this.§for const throw§();
               if(this.§_-Io§ != null)
               {
                  this.§_-Io§.click();
               }
               break;
            case Keyboard.NUMPAD_4:
            case Keyboard.NUMBER_4:
               if(this.heroPortrait2 != null)
               {
                  this.§dynamic const final§();
                  this.§for const throw§();
                  if(this.heroPortrait2 != null)
                  {
                     this.heroPortrait2.click();
                  }
               }
         }
         this.§_-Dc§(param1.keyCode);
      }
      
      public function §override for switch§(param1:Boolean = false) : void
      {
         §var const null§.getInstance().§_-gi§();
         if(this.§else for use§ != null && !this.§get const with§.contains(this.§else for use§))
         {
            this.pause();
            if(param1)
            {
               this.§else for use§.enableAutoPause();
            }
            else
            {
               this.§else for use§.§true if§();
            }
            this.§get const with§.addChild(this.§else for use§);
            this.§each class§();
         }
      }
      
      public function §finally const throw§() : void
      {
         if(this.§else for use§ != null && this.§get const with§.contains(this.§else for use§))
         {
            this.pause();
            this.§get const with§.removeChild(this.§else for use§);
            §var const null§.getInstance().§_-WP§();
         }
      }
      
      public function §_-Dc§(param1:uint) : void
      {
      }
      
      public function §try for set§() : void
      {
      }
      
      public function §each class§() : void
      {
         if(this.§_-F0§ != null)
         {
            this.§_-F0§.§_-YZ§();
            this.menu.§true const while§();
         }
         this.§_-gX§();
         this.§_-pK§();
      }
      
      public function §_-gX§() : void
      {
         this.§for const throw§();
         this.§_-dK§();
      }
      
      private function §dynamic const final§() : void
      {
         if(this.§_-F0§ == null)
         {
            return;
         }
         this.§_-F0§.§_-YZ§();
      }
      
      private function §_-dK§() : void
      {
         if(this.§_-py§ == null)
         {
            return;
         }
         this.§_-py§.§_-gX§();
      }
      
      private function §for const throw§() : void
      {
         if(this.rallyPoint == null)
         {
            return;
         }
         this.rallyPoint.§_-gX§();
      }
      
      public function §_-pK§() : void
      {
      }
      
      public function §const do§() : void
      {
         this.game.main.§_-Wj§();
         this.§catch for use§.x = 370;
         this.§catch for use§.y = 5;
         this.§_-oC§ = new §_-Ey§(10,10,this.cash,this.initLives,this.maxWaves,this);
         this.§_-xT§ = new §extends for use§(this);
         this.§get const with§.addChild(this.§_-xT§);
         this.§_-Gi§ = new §_-rW§(this);
         this.§get const with§.addChild(this.§_-Gi§);
         this.§implements import§ = new §final function§(this);
         this.§get const with§.addChild(this.§implements import§);
         this.§while import§ = new §use const final§(this);
         this.§get const with§.addChild(this.§while import§);
         this.§get const with§.addChild(this.§_-oC§);
         this.§get const with§.addChild(this.menu);
         this.decals.addChild(this.enemySelection);
         this.decals.addChild(this.soldierSelection);
      }
      
      public function §var const var§() : *
      {
         this.game.gameSounds.§dynamic for use§();
         this.game.gameSounds.§null case§();
      }
      
      public function §_-l5§() : void
      {
         this.§_-oT§();
         this.freeMenues();
         this.§each class§();
         this.§_-xT§.visible = false;
         this.menu.§switch each§();
         this.§_-oC§.§switch each§();
         this.§_-Gi§.§switch each§();
         this.§implements import§.§switch each§();
         this.§while import§.§switch each§();
         this.§_-TL§();
      }
      
      private function §_-TL§() : void
      {
         if(this.§_-Io§ != null)
         {
            this.§_-Io§.visible = false;
            this.§_-Io§.deSelect();
         }
         if(this.heroPortrait2 != null)
         {
            this.heroPortrait2.visible = false;
            this.heroPortrait2.deSelect();
         }
      }
      
      public function §get for switch§() : void
      {
         this.enableLevelElements();
         this.§_-xT§.visible = true;
         this.menu.§_-Ip§();
         this.§_-oC§.§_-Ip§(10);
         this.§_-Gi§.§_-Ip§();
         this.§implements import§.§_-Ip§();
         this.§while import§.§_-Ip§();
         this.§dynamic default§();
      }
      
      private function §dynamic default§() : void
      {
         if(this.§_-Io§ != null)
         {
            this.§_-Io§.visible = true;
         }
         if(this.heroPortrait2 != null)
         {
            this.heroPortrait2.visible = true;
         }
      }
      
      public function onPause() : Boolean
      {
         if(this.§else const for§ == LEVEL_PAUSED)
         {
            return true;
         }
         return false;
      }
      
      public function pause(param1:Boolean = false, param2:Boolean = true) : void
      {
         if(!this.onPause())
         {
            if(param1)
            {
               this.§package const dynamic§();
            }
            if(this.§else const for§ != LEVEL_PRE_WIN)
            {
               this.§else const for§ = LEVEL_PAUSED;
            }
            if(param2)
            {
               §var const null§.getInstance().§throw for var§();
            }
            this.§extends const class§();
            this.§_-pS§();
            this.pauseEntities();
            this.§final extends§();
            this.§in in§();
            this.§return const final§();
         }
         else
         {
            if(param1)
            {
               this.unBlock();
            }
            this.§else const for§ = LEVEL_NORMAL;
            this.§_-Rf§();
            this.§_-Pa§();
            this.unPauseEntities();
            this.§false final§();
            this.§use import§();
            this.§const for function§();
         }
      }
      
      public function §package const dynamic§() : void
      {
         this.§get const with§.addChild(this.§_-iC§);
         this.§_-iC§.show();
      }
      
      public function unBlock() : void
      {
         this.§_-iC§.hide();
      }
      
      public function unPause() : void
      {
         this.§else const for§ = LEVEL_NORMAL;
      }
      
      public function §_-aq§(param1:PowerPointer) : void
      {
         this.§_-F0§ = param1;
         this.§_-oT§();
      }
      
      public function §const while§() : void
      {
         this.§_-F0§ = null;
         this.enableLevelElements();
      }
      
      public function enableLevelElements() : void
      {
         this.enableElements = true;
      }
      
      public function §_-oT§() : void
      {
         this.enableElements = false;
      }
      
      public function freeMenues() : void
      {
         if(this.quickMenu != null && this.quickMenu.cTower != null)
         {
            this.quickMenu.hide();
         }
      }
      
      public function intro(param1:MouseEvent) : void
      {
         if(!this.enableElements)
         {
            return;
         }
         this.menu.§true const while§();
         this.freeMenues();
         this.removeToopTip();
      }
      
      public function §_-cJ§(param1:MouseEvent) : void
      {
         this.menu.§true const while§();
         this.§_-vA§();
      }
      
      public function §_-pf§(param1:MouseEvent) : void
      {
         this.menu.§true const while§();
         this.§_-vA§();
      }
      
      public function §_-vA§() : void
      {
         if(this.quickMenu.cTower == null)
         {
            return;
         }
         if(this.§get const with§.contains(this.quickMenu))
         {
            this.quickMenu.hide();
         }
      }
      
      public function init(param1:Event) : void
      {
      }
      
      public function eFrameEvents(param1:Event) : void
      {
         if(this.isOnComicEnd)
         {
            this.comicEnd.update();
         }
         if(this.§else const for§ == LEVEL_STARTING)
         {
            if(this.onStart())
            {
               return;
            }
            this.§else const for§ = LEVEL_NORMAL;
            if(this.data.levelIndex == 0 && this.mode == §switch for var§.MODE_CAMPAIGN)
            {
               this.pause(true);
               this.§get const with§.addChild(new §implements for switch§(new Point(0,0),this));
            }
            if(!this.game.challengeShow && this.mode != §switch for var§.MODE_CAMPAIGN)
            {
               this.§_-vA§();
               this.sendPauseNotification("NotificationTipChallenges");
               this.game.challengeShow = true;
               this.game.§_-ND§();
            }
         }
         if(this.§else const for§ == LEVEL_NORMAL || this.§else const for§ == LEVEL_PRE_WIN)
         {
            this.§native do§ = 0;
            if(this.§else const for§ == LEVEL_NORMAL)
            {
               this.§switch final§();
            }
            if(this.§else const for§ == LEVEL_NORMAL || this.§else const for§ == LEVEL_PRE_WIN)
            {
               if(this.stage.focus != this.stage)
               {
                  this.stage.focus = this.stage;
               }
               this.game.gameSounds.onFrameUpdate();
               this.updateEnemyDecals();
               this.updateEntities();
               this.updateBullets();
               this.updateBulletsDecals();
               this.updateDecals();
               this.updateBackground();
               this.§static const with§();
               this.menu.updateMenu();
               this.§_-xT§.update();
               this.updatePointers();
            }
            if(this.§else const for§ == LEVEL_PRE_WIN)
            {
               if(this.§const throw§ < this.§_-Y7§)
               {
                  ++this.§const throw§;
                  return;
               }
               if(this.data.levelIndex < 14 || this.data.levelIndex == 14 && this.mode != §switch for var§.MODE_CAMPAIGN)
               {
                  this.pause(true);
               }
               this.§else const for§ = LEVEL_WIN;
               this.§_-iF§();
               this.§catch throw§();
            }
         }
      }
      
      public function §static const with§() : void
      {
         this.§_-bW§();
         this.§switch const override§();
      }
      
      public function onStart() : Boolean
      {
         if(this.§null const throw§)
         {
            this.§throw try§.update();
            return true;
         }
         if(this.initTimeCounter < this.initTime)
         {
            ++this.initTimeCounter;
            if(this.initTimeCounter + 3 == this.initTime)
            {
               this.§const do§();
            }
            return true;
         }
         return false;
      }
      
      public function onPreWin() : void
      {
      }
      
      public function §_-iF§() : void
      {
         this.game.gameSounds.§throw native§();
      }
      
      public function §catch throw§() : void
      {
         switch(this.mode)
         {
            case §switch for var§.MODE_CAMPAIGN:
               this.addChild(new §break throw§(this));
               break;
            case §switch for var§.MODE_HEROIC:
               this.addChild(new MenuVictoryHeroic(this));
               break;
            case §switch for var§.MODE_IRON:
               this.addChild(new MenuVictoryIron(this));
         }
      }
      
      public function updatePointers() : void
      {
         if(this.§_-F0§)
         {
            this.§_-F0§.onFrameUpdate();
         }
      }
      
      public function updateEntities() : void
      {
         var _loc3_:MovieClip = null;
         var _loc1_:Dictionary = new Dictionary(true);
         var _loc2_:int = 0;
         while(_loc2_ < this.entities.numChildren)
         {
            _loc1_[this.entities.getChildAt(_loc2_)] = this.entities.getChildAt(_loc2_);
            ++this.§native do§;
            _loc2_++;
         }
         for each(_loc3_ in _loc1_)
         {
            _loc3_.onFrameUpdate();
         }
         _loc1_ = null;
      }
      
      public function updateEnemyDecals() : void
      {
         var _loc3_:MovieClip = null;
         var _loc1_:Dictionary = new Dictionary(true);
         var _loc2_:int = 0;
         while(_loc2_ < this.enemyDecals.numChildren)
         {
            _loc1_[this.enemyDecals.getChildAt(_loc2_)] = this.enemyDecals.getChildAt(_loc2_);
            ++this.§native do§;
            _loc2_++;
         }
         for each(_loc3_ in _loc1_)
         {
            _loc3_.onFrameUpdate();
         }
         _loc1_ = null;
      }
      
      public function updateDecals() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.decals.numChildren)
         {
            MovieClip(this.decals.getChildAt(_loc1_)).onFrameUpdate();
            ++this.§native do§;
            _loc1_++;
         }
      }
      
      public function updateBackground() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.§in finally§.numChildren)
         {
            §if const import§(this.§in finally§.getChildAt(_loc1_)).onFrameUpdate();
            ++this.§native do§;
            _loc1_++;
         }
      }
      
      public function updateBullets() : void
      {
         var _loc3_:MovieClip = null;
         var _loc1_:Dictionary = new Dictionary(true);
         var _loc2_:int = 0;
         while(_loc2_ < this.bullets.numChildren)
         {
            _loc1_[this.bullets.getChildAt(_loc2_)] = this.bullets.getChildAt(_loc2_);
            _loc2_++;
         }
         for each(_loc3_ in _loc1_)
         {
            _loc3_.onFrameUpdate();
         }
         _loc1_ = null;
      }
      
      public function updateBulletsDecals() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.bulletsDecals.numChildren)
         {
            MovieClip(this.bulletsDecals.getChildAt(_loc1_)).onFrameUpdate();
            ++this.§native do§;
            _loc1_++;
         }
      }
      
      public function §extends const class§() : void
      {
         var _loc3_:MovieClip = null;
         var _loc1_:Dictionary = new Dictionary(true);
         var _loc2_:int = 0;
         while(_loc2_ < this.enemyDecals.numChildren)
         {
            _loc1_[this.enemyDecals.getChildAt(_loc2_)] = this.enemyDecals.getChildAt(_loc2_);
            ++this.§native do§;
            _loc2_++;
         }
         for each(_loc3_ in _loc1_)
         {
            _loc3_.pause();
         }
         _loc1_ = null;
      }
      
      public function §_-Rf§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.enemyDecals.numChildren)
         {
            MovieClip(this.enemyDecals.getChildAt(_loc1_)).unPause();
            ++this.§native do§;
            _loc1_++;
         }
      }
      
      public function pauseEntities() : void
      {
         var _loc3_:MovieClip = null;
         var _loc1_:Dictionary = new Dictionary(true);
         var _loc2_:int = 0;
         while(_loc2_ < this.entities.numChildren)
         {
            _loc1_[this.entities.getChildAt(_loc2_)] = this.entities.getChildAt(_loc2_);
            ++this.§native do§;
            _loc2_++;
         }
         for each(_loc3_ in _loc1_)
         {
            _loc3_.pause();
         }
         _loc1_ = null;
      }
      
      public function unPauseEntities() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.entities.numChildren)
         {
            MovieClip(this.entities.getChildAt(_loc1_)).unPause();
            ++this.§native do§;
            _loc1_++;
         }
      }
      
      public function pauseEnemies() : void
      {
         var _loc1_:Enemy = null;
         for each(_loc1_ in this.enemies)
         {
            _loc1_.pause();
         }
      }
      
      public function unPauseEnemies() : void
      {
         var _loc1_:Enemy = null;
         for each(_loc1_ in this.enemies)
         {
            _loc1_.unPause();
         }
      }
      
      public function §get in§() : void
      {
         var _loc1_:士兵 = null;
         for each(_loc1_ in this.§_-tz§)
         {
            _loc1_.pause();
         }
      }
      
      public function §_-8N§() : void
      {
         var _loc1_:士兵 = null;
         for each(_loc1_ in this.§_-tz§)
         {
            _loc1_.unPause();
         }
      }
      
      public function §final extends§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.§in finally§.numChildren)
         {
            §if const import§(this.§in finally§.getChildAt(_loc1_)).pause();
            _loc1_++;
         }
      }
      
      public function §use import§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.§in finally§.numChildren)
         {
            §if const import§(this.§in finally§.getChildAt(_loc1_)).unPause();
            _loc1_++;
         }
      }
      
      public function pauseTowers() : void
      {
         var _loc1_:§extends const var§ = null;
         for each(_loc1_ in this.towers)
         {
            _loc1_.pause();
         }
      }
      
      public function unPauseTowers() : void
      {
         var _loc1_:§extends const var§ = null;
         for each(_loc1_ in this.towers)
         {
            _loc1_.unPause();
         }
      }
      
      public function §return const final§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.bulletsDecals.numChildren)
         {
            MovieClip(this.bulletsDecals.getChildAt(_loc1_)).pause();
            _loc1_++;
         }
      }
      
      public function §const for function§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.bulletsDecals.numChildren)
         {
            MovieClip(this.bulletsDecals.getChildAt(_loc1_)).unPause();
            _loc1_++;
         }
      }
      
      public function §in in§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.bullets.numChildren)
         {
            MovieClip(this.bullets.getChildAt(_loc1_)).pause();
            _loc1_++;
         }
      }
      
      public function §false final§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.bullets.numChildren)
         {
            MovieClip(this.bullets.getChildAt(_loc1_)).unPause();
            _loc1_++;
         }
      }
      
      public function §_-pS§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.decals.numChildren)
         {
            MovieClip(this.decals.getChildAt(_loc1_)).pause();
            _loc1_++;
         }
      }
      
      public function §_-Pa§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.decals.numChildren)
         {
            MovieClip(this.decals.getChildAt(_loc1_)).unPause();
            _loc1_++;
         }
      }
      
      public function initTowers(param1:Array) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            this.entities.addChild(param1[_loc2_]);
            _loc2_++;
         }
      }
      
      public function §default true§(param1:§extends const var§) : void
      {
         delete this.towers[param1];
         this.evalBrilliance();
      }
      
      public function §class in§(param1:Enemy) : void
      {
         delete this.enemies[param1];
      }
      
      public function §_-7c§(param1:Enemy) : void
      {
         delete this.staticEnemies[param1];
      }
      
      public function §with for break§(param1:士兵) : void
      {
         this.§_-tz§[param1] = param1;
      }
      
      public function removeSoldier(param1:士兵) : void
      {
         delete this.§_-tz§[param1];
      }
      
      public function §const for switch§(param1:§if const import§) : void
      {
         this.§in finally§.addChild(param1);
      }
      
      public function §_-mv§(param1:§if const import§) : void
      {
         this.§in finally§.removeChild(param1);
      }
      
      public function §_-Sf§(param1:MovieClip) : void
      {
         this.bullets.removeChild(param1);
         this.§_-Qa§(param1);
      }
      
      public function §_-Qa§(param1:MovieClip) : void
      {
         this.decals.addChild(param1);
      }
      
      public function updateCash(param1:int) : void
      {
         if(param1 > 0)
         {
            this.§_-Im§ += param1;
         }
         this.cash += param1;
         if(this.§_-oC§ != null)
         {
            this.§_-oC§.updateCash(this.cash);
         }
      }
      
      public function onRangeStaticArea(param1:Array, param2:Point) : Boolean
      {
         if(Math.sqrt(Math.pow(param1[0] - param2.y,2) + Math.pow(param1[1] - param2.x,2)) < param1[2])
         {
            return true;
         }
         return false;
      }
      
      public function §var const extends§(param1:int) : void
      {
         this.game.gameSounds.playGUILooseLife();
         this.lives -= param1;
         if(this.lives <= 0)
         {
            this.lives = 0;
         }
         this.§_-oC§.updateLives(this.lives);
         if(this.lives == 0)
         {
            this.§_-6r§();
         }
      }
      
      public function §_-Dp§() : String
      {
         return this.game.§_-Dp§();
      }
      
      public function §_-6r§() : void
      {
         this.pause(true);
         this.§else const for§ = LEVEL_OVER;
         this.addChild(new §throw throw§(this));
      }
      
      protected function getNumberOfWaves() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.waves.length)
         {
            _loc1_++;
            while(_loc2_ + 1 < this.waves.length && this.waves[_loc2_ + 1].interval == 0)
            {
               _loc2_++;
            }
            _loc2_++;
         }
         this.maxWaves = _loc1_;
         this.§class const with§ = 0;
      }
      
      private function §switch final§() : void
      {
         var _loc2_:波 = null;
         var _loc3_:波 = null;
         var _loc4_:int = 0;
         var _loc1_:int = 0;
         if(!this.§_-LW§)
         {
            this.§_-OS§();
         }
         if(this.§class const with§ == 0 && this.§_-GP§)
         {
            return;
         }
         for each(_loc2_ in this.activeWaves)
         {
            _loc1_++;
         }
         if(_loc1_ == 0)
         {
            if(this.indexWaves < this.waves.length)
            {
               if(this.waves[this.indexWaves].interval == this.intervalWaveCounter)
               {
                  if(this.indexWaves != 0 && this.waves[this.indexWaves].notification != "")
                  {
                     this.§_-vA§();
                     this.sendPauseNotification(this.waves[this.indexWaves].notification);
                  }
                  ++this.§class const with§;
                  if(this.§class const with§ == 1)
                  {
                     this.game.gameSounds.§null case§();
                  }
                  this.activeWaves[this.waves[this.indexWaves]] = this.waves[this.indexWaves];
                  this.intervalWaveCounter = 0;
                  ++this.indexWaves;
                  this.§_-oC§.updateWaves(this.§class const with§,this.maxWaves);
                  this.§_-xo§();
                  while(this.indexWaves < this.waves.length && this.waves[this.indexWaves].interval == 0)
                  {
                     this.activeWaves[this.waves[this.indexWaves]] = this.waves[this.indexWaves];
                     ++this.indexWaves;
                  }
                  this.menu.§throw const default§();
               }
               else
               {
                  if(this.indexWaves == 0 && this.waves[this.indexWaves].notification != "")
                  {
                     this.§_-vA§();
                     this.sendPauseNotification(this.waves[this.indexWaves].notification);
                  }
                  if(this.intervalWaveCounter == 50 && this.waves[this.indexWaves].interval != 0 || this.indexWaves == 0)
                  {
                     this.waves[this.indexWaves].showWaveFlag(this,this.waves[this.indexWaves].interval - 50,this.indexWaves);
                     if(this.§do for§ != null)
                     {
                        this.game.gameSounds.§false true§();
                     }
                     _loc4_ = this.indexWaves + 1;
                     while(_loc4_ < this.waves.length && this.waves[_loc4_].interval == 0)
                     {
                        this.waves[_loc4_].showWaveFlag(this,this.waves[this.indexWaves].interval - 50,this.indexWaves);
                        _loc4_++;
                     }
                     this.§try const in§();
                  }
                  if(this.indexWaves == 0)
                  {
                     this.§_-GP§ = true;
                  }
                  else
                  {
                     ++this.intervalWaveCounter;
                  }
               }
            }
            else if(!this.hasEnemies())
            {
               this.§else const for§ = LEVEL_PRE_WIN;
               this.onPreWin();
               this.§_-Ep§();
            }
         }
         for each(_loc3_ in this.activeWaves)
         {
            _loc3_.spawnEnemies(this);
         }
      }
      
      public function §_-OS§() : void
      {
         if(this.game.currentLevel < 5 && (this.mode == §switch for var§.MODE_HEROIC || this.mode == §switch for var§.MODE_IRON))
         {
            return;
         }
         if(this.game.currentLevel == 1)
         {
            if(this.game.gameHeroData.selectedHero.name == "艾尔利克")
            {
               if(this.§class const with§ == 4 && this.mode == §switch for var§.MODE_CAMPAIGN)
               {
                  this.game.gameSounds.§else throw§();
                  this.hero = new SoldierHeroAlric(new Point(this.§_-6I§[0].x - 100,this.§_-6I§[0].y),new Point(this.§_-6I§[0].x + 60,this.§_-6I§[0].y),null,new Point(this.§_-6I§[0].x,this.§_-6I§[0].y));
               }
            }
            else
            {
               this.switchHeroes();
            }
         }
         else
         {
            this.switchHeroes();
         }
         if(this.hero != null)
         {
            this.entities.addChild(this.hero);
            this.§_-LW§ = true;
            this.§_-fZ§();
         }
      }
      
      public function switchHeroes() : void
      {
         var _loc1_:Point = null;
         switch(this.game.gameHeroData.selectedHero.name)
         {
            case "艾尔利克":
               this.hero = new SoldierHeroAlric(new Point(this.§_-6I§[0].x,this.§_-6I§[0].y),new Point(this.§_-6I§[0].x,this.§_-6I§[0].y),null,new Point(this.§_-6I§[0].x,this.§_-6I§[0].y));
               break;
            case "幻影":
               this.hero = new SoldierHeroMirage(new Point(this.§_-6I§[0].x,this.§_-6I§[0].y),new Point(this.§_-6I§[0].x,this.§_-6I§[0].y),null,new Point(this.§_-6I§[0].x,this.§_-6I§[0].y));
               break;
            case "船长":
               this.hero = new SoldierHeroCaptain(new Point(this.§_-6I§[0].x,this.§_-6I§[0].y),new Point(this.§_-6I§[0].x,this.§_-6I§[0].y),null,new Point(this.§_-6I§[0].x,this.§_-6I§[0].y));
               break;
            case "克罗南":
               this.hero = new SoldierHeroCronan(new Point(this.§_-6I§[0].x,this.§_-6I§[0].y),new Point(this.§_-6I§[0].x,this.§_-6I§[0].y),null,new Point(this.§_-6I§[0].x,this.§_-6I§[0].y));
               break;
            case "煞特拉":
               this.hero = new SoldierHeroAlien(new Point(this.§_-6I§[0].x,this.§_-6I§[0].y),new Point(this.§_-6I§[0].x,this.§_-6I§[0].y),null,new Point(this.§_-6I§[0].x,this.§_-6I§[0].y));
               break;
            case "格劳尔":
               this.hero = new §in const null§(new Point(this.§_-6I§[0].x,this.§_-6I§[0].y),new Point(this.§_-6I§[0].x,this.§_-6I§[0].y),null,new Point(this.§_-6I§[0].x,this.§_-6I§[0].y));
               break;
            case "尼乌斯":
               this.hero = new SoldierHeroNivus(new Point(this.§_-6I§[0].x,this.§_-6I§[0].y),new Point(this.§_-6I§[0].x,this.§_-6I§[0].y),null,new Point(this.§_-6I§[0].x,this.§_-6I§[0].y));
               break;
            case "迪尔德莉":
               this.hero = new SoldierHeroDierdre(new Point(this.§_-6I§[0].x,this.§_-6I§[0].y),new Point(this.§_-6I§[0].x,this.§_-6I§[0].y),null,new Point(this.§_-6I§[0].x,this.§_-6I§[0].y));
               break;
            case "灰烬之牙":
               switch(this.game.currentLevel)
               {
                  case 2:
                     _loc1_ = new Point(600 * SoldierHeroDragon.DRAGON_GAME_SCALE,600 - 590 * SoldierHeroDragon.DRAGON_GAME_SCALE);
                     break;
                  case 4:
                     _loc1_ = new Point(226 * SoldierHeroDragon.DRAGON_GAME_SCALE,600 - 500 * SoldierHeroDragon.DRAGON_GAME_SCALE);
                     break;
                  case 14:
                     _loc1_ = new Point(255 * SoldierHeroDragon.DRAGON_GAME_SCALE,600 - 510 * SoldierHeroDragon.DRAGON_GAME_SCALE);
                     break;
                  default:
                     _loc1_ = new Point(this.§_-6I§[0].x,this.§_-6I§[0].y);
               }
               this.hero = new SoldierHeroDragon(_loc1_,_loc1_,null,_loc1_);
         }
      }
      
      public function §_-fZ§() : void
      {
      }
      
      public function §try const in§() : void
      {
      }
      
      public function §_-xo§() : void
      {
      }
      
      public function §_-Ep§() : void
      {
         if(this.fearless && this.maxWaves > 1)
         {
            this.game.§throw const implements§.doFearless(this);
         }
         this.§_-NX§();
         switch(this.terrainType)
         {
            case "desert":
               if(!this.heroDied)
               {
                  this.game.§throw const implements§.funcSandWarrior(this);
               }
               break;
            case "jungle":
               if(!this.heroDied)
               {
                  this.game.§throw const implements§.§_-4Y§(this);
               }
               break;
            case "underground":
               if(!this.heroDied)
               {
                  this.game.§throw const implements§.funcCaveman(this);
               }
         }
      }
      
      public function §_-Fu§() : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(this.mode == §switch for var§.MODE_CAMPAIGN && this.game.§throw const implements§.supremeDefender)
         {
            return;
         }
         if(this.mode == §switch for var§.MODE_CAMPAIGN)
         {
            _loc2_ = true;
            _loc3_ = 0;
            while(_loc3_ < this.game.§_-5v§.length)
            {
               if(§_-VT§(this.game.§_-5v§[_loc3_]).campaignDifficulty != §switch for var§.DIFFICULTY_HARD)
               {
                  if(this.data.levelIndex != _loc3_ || this.data.levelIndex == _loc3_ && this.game.difficulty != §switch for var§.DIFFICULTY_HARD)
                  {
                     _loc2_ = false;
                     break;
                  }
               }
               _loc3_++;
            }
            if(_loc2_)
            {
               this.game.§throw const implements§.§_-pV§(this);
            }
         }
         if(this.mode == §switch for var§.MODE_CAMPAIGN && this.game.§throw const implements§.greatDefender)
         {
            return;
         }
         if(this.mode == §switch for var§.MODE_HEROIC && this.game.§throw const implements§.greatDefenderHeroic)
         {
            return;
         }
         if(this.mode == §switch for var§.MODE_IRON && this.game.§throw const implements§.greatDefenderIron)
         {
            return;
         }
         var _loc1_:Boolean = true;
         if(this.mode == §switch for var§.MODE_CAMPAIGN)
         {
            _loc3_ = 0;
            while(_loc3_ < this.game.§_-5v§.length)
            {
               if(§_-VT§(this.game.§_-5v§[_loc3_]).campaignDifficulty != §switch for var§.DIFFICULTY_NORMAL)
               {
                  if(this.data.levelIndex != _loc3_ || this.data.levelIndex == _loc3_ && (this.game.difficulty != §switch for var§.DIFFICULTY_NORMAL && this.game.difficulty != §switch for var§.DIFFICULTY_HARD))
                  {
                     _loc1_ = false;
                     break;
                  }
               }
               _loc3_++;
            }
            if(_loc1_)
            {
               this.game.§throw const implements§.§_-EJ§(this);
            }
            return;
         }
         if(this.mode == §switch for var§.MODE_HEROIC)
         {
            _loc4_ = 0;
            while(_loc4_ < this.game.§_-5v§.length)
            {
               if(!§_-VT§(this.game.§_-5v§[_loc4_]).heroicModeWin || §_-VT§(this.game.§_-5v§[_loc4_]).heroicDifficulty != §switch for var§.DIFFICULTY_NORMAL && §_-VT§(this.game.§_-5v§[_loc4_]).heroicDifficulty != §switch for var§.DIFFICULTY_HARD)
               {
                  if(this.data.levelIndex != _loc4_ || this.data.levelIndex == _loc4_ && (this.game.difficulty != §switch for var§.DIFFICULTY_NORMAL && this.game.difficulty != §switch for var§.DIFFICULTY_HARD))
                  {
                     _loc1_ = false;
                     break;
                  }
               }
               _loc4_++;
            }
            if(_loc1_)
            {
               this.game.§throw const implements§.chkGreatDefenderHeroic(this);
            }
            return;
         }
         if(this.mode == §switch for var§.MODE_IRON)
         {
            _loc5_ = 0;
            while(_loc5_ < this.game.§_-5v§.length)
            {
               if(!§_-VT§(this.game.§_-5v§[_loc5_]).ironModeWin || §_-VT§(this.game.§_-5v§[_loc5_]).ironDifficulty != §switch for var§.DIFFICULTY_NORMAL && §_-VT§(this.game.§_-5v§[_loc5_]).ironDifficulty != §switch for var§.DIFFICULTY_HARD)
               {
                  if(this.data.levelIndex != _loc5_ || this.data.levelIndex == _loc5_ && (this.game.difficulty != §switch for var§.DIFFICULTY_NORMAL && this.game.difficulty != §switch for var§.DIFFICULTY_HARD))
                  {
                     _loc1_ = false;
                     break;
                  }
               }
               _loc5_++;
            }
            if(_loc1_)
            {
               this.game.§throw const implements§.chkGreatDefenderIron(this);
            }
            return;
         }
      }
      
      public function §_-NX§() : void
      {
      }
      
      public function sendPauseNotification(param1:String) : void
      {
         if(param1 == "NotificationTipHero")
         {
            if(this.game.currentLevel == 1)
            {
               if(this.§_-xT§ != null)
               {
                  TweenMax.to(this.§_-xT§,0.2,{"y":0});
               }
               if(Level1(this).notificationSign != null)
               {
                  TweenMax.to(Level1(this).notificationSign,0.2,{"y":158});
               }
            }
         }
         this.pause(true);
         if(§break use§.beginsWith(param1,"NotificationEnemy"))
         {
            param1 = §switch for var§.getEnemyString(§break use§.remove(param1,"Notification"));
            this.§get const with§.addChild(new NotificationEnemy(this,param1,true));
            return;
         }
         var _loc2_:Class = getDefinitionByName(param1) as Class;
         this.§get const with§.addChild(new _loc2_(this,true));
      }
      
      public function sendSecondLevelNotification(param1:String) : void
      {
         this.§_-xT§.addNotification(param1);
      }
      
      public function §_-LQ§() : void
      {
         this.§_-xT§.addNotification(not);
      }
      
      public function §while const§(param1:Point) : void
      {
         var _loc2_:int = 0;
         if(this.intervalWaveCounter - 50 <= 90 && !this.§_-GP§)
         {
            this.game.§throw const implements§.checkImpatient(this);
         }
         if(this.§_-GP§)
         {
            if(this.power1)
            {
               this.§true const include§();
            }
            if(this.power2)
            {
               this.§_-fp§();
            }
            if(this.power3)
            {
               this.unlockPowerPriest();
            }
            if(this.power4)
            {
               this.§_-BI§();
            }
            this.§import const extends§();
            this.§_-GP§ = false;
            if(this.§do for§ != null && this.bullets.contains(this.§do for§))
            {
               this.bullets.removeChild(this.§do for§);
            }
         }
         if(this.game.currentLevel == 1 && this.§class const with§ == 3)
         {
            if(this.§_-xT§ != null)
            {
               TweenMax.to(this.§_-xT§,0.2,{"y":0});
            }
            if(Level1(this).notificationSign != null)
            {
               TweenMax.to(Level1(this).notificationSign,0.2,{"y":158});
            }
         }
         this.game.§throw const implements§.checkDaring(this);
         if(this.indexWaves != 0)
         {
            this.menu.§break const native§(this.waves[this.indexWaves].interval - this.intervalWaveCounter);
            _loc2_ = Math.round((this.waves[this.indexWaves].interval - this.intervalWaveCounter) / this.gameSettings.framesRate);
            if(_loc2_ >= 1)
            {
               this.bullets.addChild(new §_-Vh§(param1,Math.round(_loc2_ * 1)));
               this.game.gameSounds.§_-iO§();
               this.updateCash(Math.round(_loc2_ * 1));
            }
         }
         this.intervalWaveCounter = this.waves[this.indexWaves].interval;
         this.§_-OK§();
      }
      
      public function §for null§(param1:§_-65§) : void
      {
         var _loc3_:§_-65§ = null;
         var _loc2_:int = 0;
         for each(_loc3_ in this.§extends extends§)
         {
            _loc2_++;
         }
         if(_loc2_ == 0)
         {
            this.menu.enableNextWave();
         }
         this.§extends extends§[param1] = param1;
      }
      
      public function §import try§(param1:§_-65§, param2:Boolean = false) : void
      {
         var _loc3_:int = 0;
         var _loc4_:§_-65§ = null;
         param1.§true else§();
         delete this.§extends extends§[param1];
         if(!param2)
         {
            _loc3_ = 0;
            for each(_loc4_ in this.§extends extends§)
            {
               _loc3_++;
            }
            if(_loc3_ == 0)
            {
               this.menu.§throw const default§();
            }
         }
      }
      
      public function §try const extends§(param1:§_-65§) : void
      {
         var _loc3_:§_-65§ = null;
         delete this.§extends extends§[param1];
         var _loc2_:int = 0;
         for each(_loc3_ in this.§extends extends§)
         {
            _loc2_++;
         }
         if(_loc2_ == 0)
         {
            this.menu.§throw const default§();
         }
      }
      
      public function §_-OK§() : void
      {
         var _loc1_:§_-65§ = null;
         for each(_loc1_ in this.§extends extends§)
         {
            this.§import try§(_loc1_,true);
         }
         this.menu.§throw const default§();
      }
      
      public function §_-fp§() : void
      {
         this.menu.§get const§(0);
      }
      
      public function §true const include§() : void
      {
         this.menu.§get const§(1);
      }
      
      public function unlockPowerPriest() : void
      {
         this.menu.§get const§(2);
      }
      
      public function §_-BI§() : void
      {
         this.menu.§get const§(3);
      }
      
      public function §import const extends§() : void
      {
         if(this.game.§_-77§ && this.game.pcLightning)
         {
            this.menu.§get const§(2);
         }
      }
      
      public function §continue finally§() : void
      {
         ++this.fireballCounter;
         if(this.fireballCounter == 5)
         {
            this.game.§throw const implements§.checkArmaggedon(this);
         }
      }
      
      public function §throw for false§() : void
      {
         ++this.§false const if§;
      }
      
      public function §import if§() : void
      {
         ++this.§_-YN§;
      }
      
      public function §null each§() : void
      {
         ++this.sellTowersCounter;
      }
      
      protected function hasEnemies() : Boolean
      {
         var _loc1_:Enemy = null;
         var _loc2_:Enemy = null;
         if(this.isReadyToWin)
         {
            if(this.readyToWinTimeCounter < this.readyToWinTime)
            {
               ++this.readyToWinTimeCounter;
               if(this.readyToWinTimeCounter % 10 == 0)
               {
                  for each(_loc2_ in this.enemies)
                  {
                     if(!_loc2_.isBoss || _loc2_.isBoss && !_loc2_.isDead)
                     {
                        this.isReadyToWin = false;
                     }
                  }
               }
               return true;
            }
            return false;
         }
         for each(_loc1_ in this.enemies)
         {
            if(!_loc1_.isBoss || _loc1_.isBoss && !_loc1_.isDead)
            {
               return true;
            }
         }
         this.isReadyToWin = true;
         this.readyToWinTimeCounter = 0;
         return true;
      }
      
      private function traceEnemies() : void
      {
         var _loc2_:Enemy = null;
         var _loc1_:int = 0;
         for each(_loc2_ in this.enemies)
         {
            _loc1_++;
            if(_loc2_.onTunnel)
            {
            }
         }
      }
      
      private function §switch const override§() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = int(this.entities.numChildren - 1);
         while(_loc1_ > 0)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               if(this.entities.getChildAt(_loc2_).y + MovieClip(this.entities.getChildAt(_loc2_)).orderAdjustY > this.entities.getChildAt(_loc2_ + 1).y + MovieClip(this.entities.getChildAt(_loc2_ + 1)).orderAdjustY)
               {
                  this.entities.swapChildrenAt(_loc2_,_loc2_ + 1);
               }
               _loc2_++;
            }
            _loc1_--;
         }
      }
      
      private function §_-bW§() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = int(this.enemyDecals.numChildren - 1);
         while(_loc1_ > 0)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               if(this.enemyDecals.getChildAt(_loc2_).y + MovieClip(this.enemyDecals.getChildAt(_loc2_)).orderAdjustY > this.enemyDecals.getChildAt(_loc2_ + 1).y + MovieClip(this.enemyDecals.getChildAt(_loc2_ + 1)).orderAdjustY)
               {
                  this.enemyDecals.swapChildrenAt(_loc2_,_loc2_ + 1);
               }
               _loc2_++;
            }
            _loc1_--;
         }
      }
      
      protected function §_-CN§(param1:§false super§, param2:int) : Point
      {
         return param1.§else import§(param2);
      }
      
      public function §_-Tb§(param1:int) : Array
      {
         var _loc2_:int = Math.ceil(Math.random() * this.§_-iu§[param1].length) - 1;
         return this.§_-iu§[param1][_loc2_];
      }
      
      public function randomRange(param1:Number, param2:Number) : Number
      {
         return Math.ceil(Math.random() * (param2 - param1) + param1) - 1;
      }
      
      public function addToopTip(param1:Tooltip) : void
      {
         this.removeToopTip();
         this.§use case§ = param1;
         this.§get const with§.addChild(this.§use case§);
         param1 = null;
      }
      
      public function removeToopTip() : void
      {
         if(this.§use case§ != null)
         {
            this.§use case§.destroyThis();
            this.§use case§ = null;
         }
      }
      
      public function §_-3u§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-6I§.length)
         {
            if(this.terrainType == "underground")
            {
               this.decals.addChild(new §default for const§(this.§_-6I§[_loc1_]));
            }
            else
            {
               this.decals.addChild(new DefenseIndicatorCommon(this.§_-6I§[_loc1_]));
            }
            _loc1_++;
         }
      }
      
      public function §_-vs§() : int
      {
         if(this.mode != §switch for var§.MODE_CAMPAIGN)
         {
            return 3;
         }
         if(this.lives >= 18)
         {
            return 3;
         }
         if(this.lives > 5 && this.lives < 18)
         {
            return 2;
         }
         return 1;
      }
      
      public function §false const finally§(param1:int, param2:Boolean) : void
      {
      }
      
      public function §_-v7§(param1:*, param2:*) : Boolean
      {
         switch(param1)
         {
            case §switch for var§.ARCHERS:
               if(this.§import const const§ >= param2 || this.§import const const§ == 0 && param2 != 1 && this.§_-xO§ >= param2)
               {
                  return false;
               }
               break;
            case §switch for var§.MAGES:
               if(this.unlockMaxMages >= param2 || this.unlockMaxMages == 0 && param2 != 1 && this.§each const get§ >= param2)
               {
                  return false;
               }
               break;
            case §switch for var§.ENGINEERS:
               if(this.§_-Gc§ >= param2 || this.§_-Gc§ == 0 && param2 != 1 && this.§_-WZ§ >= param2)
               {
                  return false;
               }
               break;
            case §switch for var§.BARRACKS:
               if(this.unlockMaxBarracks >= param2 || this.unlockMaxBarracks == 0 && param2 != 1 && this.§_-ue§ >= param2)
               {
                  return false;
               }
         }
         return true;
      }
      
      public function §return else§() : void
      {
         var _loc1_:§extends const var§ = null;
         for each(_loc1_ in this.towers)
         {
            _loc1_.§extends return§();
         }
      }
      
      public function §_-Ke§(param1:int, param2:int) : int
      {
         return 30;
      }
      
      public function §_-Pp§(param1:int, param2:int, param3:int = 0) : Boolean
      {
         if(param2 == 0)
         {
            return true;
         }
         if(this.§in const do§(param1))
         {
            return true;
         }
         if(this.§_-8o§(param1,param2))
         {
            return true;
         }
         if(this.§_-th§(param1,param2,8))
         {
            return true;
         }
         if(this.§super§(param1,param2,8))
         {
            return true;
         }
         if(param2 < 0 || param1 >= this.§_-iu§[param1][0].length)
         {
            return true;
         }
         return false;
      }
      
      public function §in const do§(param1:int) : Boolean
      {
         var _loc2_:Boolean = false;
         if(this.pathsActives.length > 0 && this.pathsActives.length > 1)
         {
            _loc2_ = Boolean(this.pathsActives[param1]);
            if(!_loc2_)
            {
               return true;
            }
         }
         return false;
      }
      
      public function §_-8o§(param1:int, param2:int) : Boolean
      {
         if(this.§each const each§)
         {
            if(this.§catch for catch§[param1][0])
            {
               if(param2 >= this.§catch for catch§[param1][1] && param2 <= this.§catch for catch§[param1][4])
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      public function §_-bm§(param1:int, param2:int, param3:int) : Point
      {
         return this.§_-iu§[param1][param2][param3];
      }
      
      public function §_-th§(param1:int, param2:int, param3:int) : Boolean
      {
         var _loc4_:int = 0;
         if(this.§_-Mb§)
         {
            if(this.§_-3X§[param1][0])
            {
               _loc4_ = 0;
               while(_loc4_ < this.§_-3X§[param1][1].length)
               {
                  if(param2 >= this.§_-3X§[param1][1][_loc4_][0] - param3 && param2 <= this.§_-3X§[param1][1][_loc4_][1] + param3)
                  {
                     return true;
                  }
                  _loc4_++;
               }
            }
         }
         return false;
      }
      
      public function §super§(param1:int, param2:int, param3:int) : Boolean
      {
         if(this.§_-Bi§)
         {
            if(param2 >= this.§_-1k§[param1][0] && param2 <= this.§_-1k§[param1][1] + param3)
            {
               return true;
            }
         }
         return false;
      }
      
      internal function loadXML(param1:Event) : void
      {
         var _loc4_:String = null;
         var _loc6_:int = 0;
         var _loc2_:Array = [];
         var _loc3_:Array = [];
         this.xml = new XML(param1.target.data);
         _loc4_ = "this.waves = [ \n ";
         this.cash = int(this.xml.cash);
         this.gameSettings.heroes.heroAlric.currentLevel = int(this.xml.heroLevel);
         this.gameSettings.heroes.heroAlric.swordsmanshipLevel = int(this.xml.hero1);
         this.gameSettings.heroes.heroAlric.betterArmorLevel = int(this.xml.hero2);
         this.gameSettings.heroes.heroAlric.toughnessLevel = int(this.xml.hero3);
         this.gameSettings.heroes.heroAlric.flurryLevel = int(this.xml.hero4);
         this.gameSettings.heroes.heroAlric.sandWarriorLevel = int(this.xml.hero5);
         var _loc5_:int = 0;
         while(_loc5_ < this.xml.wave.length())
         {
            _loc2_ = new Array();
            _loc4_ += "new Wave(\t [ \n";
            _loc6_ = 0;
            while(_loc6_ < this.xml.wave[_loc5_].spawns.spawn.length())
            {
               _loc2_.push(new §default const with§(this.xml.wave[_loc5_].spawns.spawn[_loc6_].creep,this.xml.wave[_loc5_].spawns.spawn[_loc6_].creep_aux,int(this.xml.wave[_loc5_].spawns.spawn[_loc6_].max_same),int(this.xml.wave[_loc5_].spawns.spawn[_loc6_].max),int(this.xml.wave[_loc5_].spawns.spawn[_loc6_].interval / 1.28),int(this.xml.wave[_loc5_].spawns.spawn[_loc6_].interval_next),Boolean(int(this.xml.wave[_loc5_].spawns.spawn[_loc6_].fixed_sub_path)),int(this.xml.wave[_loc5_].spawns.spawn[_loc6_].path)));
               _loc4_ += "new WaveSpawn(\"" + this.xml.wave[_loc5_].spawns.spawn[_loc6_].creep + "\", \"" + this.xml.wave[_loc5_].spawns.spawn[_loc6_].creep_aux + "\"," + int(this.xml.wave[_loc5_].spawns.spawn[_loc6_].max_same) + ", " + int(this.xml.wave[_loc5_].spawns.spawn[_loc6_].max) + ", " + int(this.xml.wave[_loc5_].spawns.spawn[_loc6_].interval) + ", " + int(this.xml.wave[_loc5_].spawns.spawn[_loc6_].interval_next) + ", " + Boolean(int(this.xml.wave[_loc5_].spawns.spawn[_loc6_].fixed_sub_path)).toString() + ", " + int(this.xml.wave[_loc5_].spawns.spawn[_loc6_].path) + ")";
               if(_loc6_ + 1 < this.xml.wave[_loc5_].spawns.spawn.length())
               {
                  _loc4_ += ",\n";
               }
               else
               {
                  _loc4_ += "]";
               }
               _loc6_++;
            }
            _loc3_.push(new 波(_loc2_,int(this.xml.wave[_loc5_].interval),int(this.xml.wave[_loc5_].path_index),"",""));
            _loc4_ += ", " + int(this.xml.wave[_loc5_].interval) + "," + int(this.xml.wave[_loc5_].path_index) + ",\"" + "" + "\",\"" + "" + "\" ),\n\n\n";
            _loc5_++;
         }
         this.waves = _loc3_;
         _loc4_ += "];";
         this.getNumberOfWaves();
         this.§_-wC§();
      }
      
      public function §continue throw§() : void
      {
         var _loc1_:String = null;
         var _loc3_:int = 0;
         _loc1_ = "[NSArray arrayWithObjects: \n";
         var _loc2_:int = 0;
         while(_loc2_ < this.waves.length)
         {
            _loc1_ += "\t\t\t\t\t[[[Wave alloc] initWithSpawns:[NSArray arrayWithObjects:";
            _loc3_ = 0;
            while(_loc3_ < 波(this.waves[_loc2_]).spawns.length)
            {
               _loc1_ += "\n\t\t\t\t\t\t\t\t\t\t\t\t" + "[[[WaveSpawn alloc] initWithCreep:@\"" + §default const with§(this.waves[_loc2_].spawns[_loc3_]).creepType + "\" creepAux:@\"" + §default const with§(this.waves[_loc2_].spawns[_loc3_]).creepTypeAux + "\" maxSame:" + §default const with§(this.waves[_loc2_].spawns[_loc3_]).maxSameCreep + " cant:" + §default const with§(this.waves[_loc2_].spawns[_loc3_]).cant + " interval:" + Math.round(§default const with§(this.waves[_loc2_].spawns[_loc3_]).interval * 1.28) + " invervalNextSpawn:" + §default const with§(this.waves[_loc2_].spawns[_loc3_]).intervalNextSpawn + " useFixedPath:" + (§default const with§(this.waves[_loc2_].spawns[_loc3_]).useFixedPath ? "YES" : "NO") + " path:" + §default const with§(this.waves[_loc2_].spawns[_loc3_]).path + "] autorelease],\n";
               _loc3_++;
            }
            _loc1_ += "\t\t\t\t\t\t\t\t\t\t\t\t" + " nil] interval:" + 波(this.waves[_loc2_]).interval + " pathIndex:" + 波(this.waves[_loc2_]).pathIndex + " notification:@\"\" notificationSecondLevel:@\"\" isFly:NO] autorelease],\n\n";
            _loc2_++;
         }
         _loc1_ += "\t\t\t\t nil";
      }
      
      public function §_-wC§() : void
      {
      }
      
      public function §_-dY§() : void
      {
      }
      
      public function evalBrilliance() : void
      {
         var _loc2_:§extends const var§ = null;
         if(!this.game.gameUpgrades.§while default§(GameUpgrades.FRONTIERS_BRILLANCE,this.§finally const try§))
         {
            return;
         }
         var _loc1_:int = 0;
         for each(_loc2_ in this.towers)
         {
            if(getQualifiedClassName(_loc2_) != "TowerHolder" && Boolean(§break use§.beginsWith(getQualifiedClassName(_loc2_),"TowerMage")))
            {
               _loc1_++;
            }
         }
         if(_loc1_ <= 1)
         {
            _loc1_ = 0;
         }
         var _loc3_:int = §switch for var§.getFromArraySafe(this.game.gameUpgrades.§_-Ct§,_loc1_ - 1);
         this.§_-3H§.setBrillianceDamages(this.gameSettings,_loc3_);
      }
      
      public function §_-T4§() : void
      {
         if(this.game.§throw const implements§.landOwner)
         {
            return;
         }
         var _loc1_:int = 0;
         while(_loc1_ < this.entities.numChildren)
         {
            if(§break use§.beginsWith(getQualifiedClassName(this.entities.getChildAt(_loc1_)),"TowerHolder"))
            {
               return;
            }
            _loc1_++;
         }
         this.game.§throw const implements§.§import const final§(this);
      }
      
      public function §_-RB§(param1:Sprite = null) : void
      {
         if(this.§_-V8§.parent == null)
         {
            if(param1 == null)
            {
               this.§get const with§.addChild(this.§_-V8§);
            }
            else
            {
               param1.addChild(this.§_-V8§);
            }
         }
      }
      
      public function §_-R9§() : void
      {
         if(this.§_-V8§.parent != null)
         {
            this.§_-V8§.parent.removeChild(this.§_-V8§);
         }
      }
      
      public function destroyThis() : void
      {
         var _loc1_:§_-65§ = null;
         var _loc2_:波 = null;
         this.§_-V8§.destroyThis();
         this.§finally const throw§();
         this.§else for use§ = null;
         this.§_-dY§();
         if(this.graveyard != null)
         {
            this.graveyard.destroyThis();
         }
         this.removeEventListener(Event.DEACTIVATE,this.onDeactivate);
         this.towerRange.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-cJ§);
         this.towerRangeNew.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-pf§);
         this.gTerrain.removeEventListener(MouseEvent.MOUSE_DOWN,this.intro);
         stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.keyPressed);
         this.removeEventListener(Event.ENTER_FRAME,this.eFrameEvents);
         this.removeEventListener(Event.ADDED_TO_STAGE,this.initS);
         this.game.gameSounds.§super const switch§();
         for each(_loc1_ in this.§extends extends§)
         {
            _loc1_.destroyThis(false);
         }
         this.quickMenu.destroyThis();
         this.quickMenu = null;
         for each(_loc2_ in this.activeWaves)
         {
            _loc2_.destroyThis();
         }
         if(this.§do for§ != null)
         {
            this.§do for§.destroyThis();
         }
         this.§do for§ = null;
         this.data = null;
         this.§catch for use§ = null;
         this.§_-iC§ = null;
         this.gameSettings.destroyThis();
         this.gameSettings = null;
         this.§_-6I§ = null;
         this.§_-iu§ = null;
         this.§catch for catch§ = null;
         this.§_-HF§ = null;
         if(this.§use case§ != null)
         {
            this.§get const with§.removeChild(this.§use case§);
            this.§use case§ = null;
         }
         this.menu = null;
         this.§_-oC§ = null;
         this.§_-xT§ = null;
         this.§_-Gi§.destroyThis();
         this.§_-Gi§ = null;
         this.§implements import§.destroyThis();
         this.§implements import§ = null;
         this.§while import§.destroyThis();
         this.§while import§ = null;
         this.ellipses.removeChild(this.towerRange);
         this.ellipses.removeChild(this.towerRangeNew);
         this.ellipses.removeChild(this.§_-KU§);
         this.towerRange = null;
         this.towerRangeNew = null;
         this.§_-KU§ = null;
         this.waves = null;
         this.activeWaves = null;
         this.terrain.removeChild(this.gTerrain);
         this.gTerrain = null;
         this.removeChild(this.terrain);
         this.terrain = null;
         this.removeChild(this.ellipses);
         this.ellipses = null;
         this.removeChild(this.§in finally§);
         this.§in finally§ = null;
         this.removeChild(this.decals);
         this.decals = null;
         this.removeChild(this.entities);
         this.entities = null;
         this.removeChild(this.frontEntities);
         this.frontEntities = null;
         this.removeChild(this.bulletsDecals);
         this.bulletsDecals = null;
         this.removeChild(this.bullets);
         this.bullets = null;
         this.removeChild(this.§get const with§);
         this.§get const with§ = null;
         this.towers = null;
         this.enemies = null;
         this.§_-tz§ = null;
         this.§extends extends§ = null;
         this.staticEnemies = null;
         this.§_-j4§ = null;
         this.rallyPoint = null;
         this.§_-F0§ = null;
         this.§_-Io§ = null;
         this.heroPortrait2 = null;
         this.enemySelection = null;
         this.soldierSelection = null;
         this.§_-f7§ = null;
         this.game = null;
         this.parent.removeChild(this);
      }
      
      public function forceUnselectTowers() : void
      {
         var _loc1_:§extends const var§ = null;
         for each(_loc1_ in this.towers)
         {
            _loc1_.unSelect();
         }
      }
      
      public function §super in§(param1:§_-Ax§) : *
      {
         if(this.§_-Io§ == null)
         {
            this.§_-Io§ = param1;
         }
         else if(this.heroPortrait2 == null)
         {
            this.heroPortrait2 = param1;
         }
      }
   }
}

