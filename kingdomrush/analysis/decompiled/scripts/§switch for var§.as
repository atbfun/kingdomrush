package
{
   import §_-rX§.*;
   import fl.lang.*;
   import flash.display.FrameLabel;
   import flash.display.MovieClip;
   import flash.geom.*;
   import flash.utils.*;
   
   public class §switch for var§
   {
      
      public static var bloodToBleedMap:Dictionary;
      
      public static const GAME_SCALE:Number = 1 / 1.28;
      
      public static const SMALL:int = 0;
      
      public static const MEDIUM:int = 1;
      
      public static const LARGE:int = 2;
      
      public static const P_ARMOR:int = 0;
      
      public static const M_ARMOR:int = 1;
      
      public static const E_ARMOR:int = 2;
      
      public static const I_ARMOR:int = 3;
      
      public static const ARCHERS:int = 0;
      
      public static const MAGES:int = 1;
      
      public static const ENGINEERS:int = 2;
      
      public static const BARRACKS:int = 3;
      
      public static const MODE_CAMPAIGN:int = 0;
      
      public static const MODE_HEROIC:int = 1;
      
      public static const MODE_IRON:int = 2;
      
      public static const DIFFICULTY_NORMAL:int = 0;
      
      public static const DIFFICULTY_EASY:int = 1;
      
      public static const DIFFICULTY_NONE:int = 2;
      
      public static const DIFFICULTY_HARD:int = 3;
      
      public static const REINFORCEMENT_NORMAL:int = 0;
      
      public static const REINFORCEMENT_STAR:int = 1;
      
      public static const REINFORCEMENT_MORTAL:int = 2;
      
      public static const REINFORCEMENT_STREET:int = 3;
      
      public static const NOTIFICATION_TIP_RALLY:String = "NotificationTipRallyPoint";
      
      public static const NOTIFICATION_TIP_ARMOR:String = "NotificationTipArmor";
      
      public static const NOTIFICATION_TIP_ARMOR_MAGIC:String = "NotificationTipArmorMagic";
      
      public static const NOTIFICATION_TIP_STRATEGY_SOLDIER:String = "NotificationTipStrategySoldier";
      
      public static const NOTIFICATION_TIP_STRATEGY_HEAVY_ARMOR:String = "NotificationTipStrategyHeavyArmor";
      
      private var game:§while const switch§;
      
      private var §finally const try§:int;
      
      public const §throw for while§:Number = 0.3;
      
      public const §import const break§:int = 15;
      
      public const framesRate:int = 30;
      
      public const rangeRatio:Number = 0.7;
      
      public const sellPercent:Number = 0.6;
      
      public const §super use§:Number = 2;
      
      public const minSpeed:Number = 2;
      
      public const enemyMaxLevel:int = 99;
      
      public const §_-5q§:int = 30;
      
      private var ModifEnemyHealth:Number;
      
      private var ModifSoldierHealth:Number;
      
      public var mages:* = new Object();
      
      public var archers:* = new Object();
      
      public var engineers:* = new Object();
      
      public var §_-tz§:* = new Object();
      
      public var §_-EQ§:* = new Object();
      
      public var §true use§:* = new Object();
      
      public var enemies:* = new Object();
      
      public var §super const set§:* = new Object();
      
      public var heroes:* = new Object();
      
      public var heroArray:* = new Object();
      
      public var frontiersModifierDifficultyNormalSoldierHealth:Number;
      
      public var frontiersModifierDifficultyNormalEnemyHealth:Number;
      
      public var frontiersModifierDifficultyEasySoldierHealth:Number;
      
      public var frontiersModifierDifficultyEasyEnemyHealth:Number;
      
      public function §switch for var§(param1:§while const switch§, param2:Boolean = true, param3:int = 0)
      {
         super();
         this.game = param1;
         this.ModifSoldierHealth = 1;
         if(this.game.difficulty == DIFFICULTY_EASY)
         {
            this.frontiersModifierDifficultyEasyEnemyHealth = 0.7;
         }
         else if(this.game.difficulty == DIFFICULTY_NORMAL || this.game.difficulty == DIFFICULTY_NONE)
         {
            this.frontiersModifierDifficultyNormalEnemyHealth = 0.8;
         }
         this.§finally const try§ = param3;
         this.§_-LL§();
         this.§switch const return§();
         this.§_-Up§();
         this.§set default§();
         this.§continue if§();
         this.§_-KJ§();
         this.§_-Fc§();
         this.§_-yH§();
         this.§finally throw§();
         if(param2)
         {
            this.§for import§();
         }
         §switch for var§.bloodToBleedMap = new Dictionary();
         §switch for var§.bloodToBleedMap["Blood"] = "Bleeding";
         §switch for var§.bloodToBleedMap["BloodViolet"] = "BleedingViolet";
         §switch for var§.bloodToBleedMap["BloodGreen"] = "BleedingGreen";
         §switch for var§.bloodToBleedMap["BloodGrey"] = "Bleeding";
      }
      
      public static function getEnemyString(param1:String) : String
      {
         switch(param1)
         {
            case "EnemyBouncer":
               return "BOUNCER";
            case "EnemyDesertRaider":
               return "DESERT_RAIDER";
            case "EnemyImmortal":
               return "IMMORTAL";
            case "EnemyFallen":
               return "FALLEN";
            case "EnemyWaspQueen":
               return "WASP_QUEEN";
            case "EnemyWasp":
               return "WASP";
            case "EnemyTremor":
               return "TREMOR";
            case "EnemyScorpion":
               return "SCORPION";
            case "EnemyExecutioner":
               return "EXECUTIONER";
            case "EnemyMunra":
               return "MUNRA";
            case "EnemyDesertArcher":
               return "DESERT_ARCHER";
            case "EnemyDesertWolf":
               return "DESERT_WOLF";
            case "EnemyDesertWolfSmall":
               return "DESERT_WOLF_SMALL";
            case "EnemyCanibal":
               return "CANIBAL";
            case "EnemyCanibalShamanPriest":
               return "CANIBAL_PRIEST";
            case "EnemyCanibalShamanMagic":
               return "CANIBAL_MAGIC";
            case "EnemyCanibalShamanShield":
               return "CANIBAL_SHIELD";
            case "EnemyGorilla":
               return "GORILLA";
            case "EnemySavageBird":
               return "CANIBAL_BIRD";
            case "EnemyCanibalHunter":
               return "CANIBAL_SAVAGE_HUNTER";
            case "EnemyCanibalWingRider":
               return "CANIBAL_WING_RIDER";
            case "EnemyAlienReaper":
               return "ALIEN_REAPER";
            case "EnemyAlienBreeder":
               return "ALIEN_BREEDER";
            case "EnemyJungleSpiderBig":
               return "JUNGLE_SPIDER_BIG";
            case "EnemyJungleSpiderSmall":
               return "JUNGLE_SPIDER_SMALL";
            case "EnemyJungleSpiderTiny":
               return "JUNGLE_SPIDER_TINY";
            case "EnemyCanibalNecromancer":
               return "CANIBAL_NECROMANCER";
            case "EnemyCanibalBeast":
               return "CANIBAL_VOLCANO";
            case "EnemyGorillaBoss":
               return "CANIBAL_BOSS";
            case "EnemyGorillaOffspring":
               return "CANIBAL_BOSS_MINION";
            case "EnemySaurianBroodguard":
               return "SAURIAN_BROODGUARD";
            case "EnemySaurianMyrmidon":
               return "SAURIAN_MYRMIDON";
            case "EnemySaurianNightscale":
               return "SAURIAN_NIGHTSCALE";
            case "EnemySaurianSavant":
               return "SAURIAN_SAVANT";
            case "EnemySaurianDarter":
               return "SAURIAN_DARTER";
            case "EnemySaurianBrute":
               return "SAURIAN_BRUTE";
            case "EnemySaurianBlazefang":
               return "SAURIAN_BLAZEFANG";
            case "EnemySaurianQuetzal":
               return "SAURIAN_QUETZAL";
            case "EnemySaurianRazorwing":
               return "SAURIAN_RAZORWING";
            default:
               return "";
         }
      }
      
      public static function getFromArraySafe(param1:Array, param2:int) : *
      {
         if(param2 >= param1.length)
         {
            param2 = param1.length - 1;
         }
         if(param2 < 0)
         {
            param2 = 0;
         }
         return param1[param2];
      }
      
      public static function isEnemyFlying(param1:String) : Boolean
      {
         switch(param1)
         {
            case "EnemyWaspQueen":
               return true;
            case "EnemyWasp":
               return true;
            case "EnemyCanibalWingRider":
               return true;
            case "EnemySaurianQuetzal":
               return true;
            case "EnemySaurianRazorwing":
               return true;
            default:
               return false;
         }
      }
      
      public static function getRandom(param1:*, param2:*) : Number
      {
         var _loc3_:Number = NaN;
         return Math.round(Math.random() * (param2 - param1)) + param1;
      }
      
      public static function getRandomSign() : Number
      {
         if(Math.random() > 0.5)
         {
            return 1;
         }
         return -1;
      }
      
      public static function ellipseContains(param1:Number, param2:Number, param3:Object, param4:Number, param5:Number) : Boolean
      {
         var _loc6_:§false super§ = new §false super§(0,0,param4,param4 * param5);
         _loc6_.center = new Point(param1,param2);
         return _loc6_.containsPoint(new Point(param3.x,param3.y));
      }
      
      public static function ellipseContainsWH(param1:Number, param2:Number, param3:Object, param4:Number, param5:Number) : Boolean
      {
         var _loc6_:§false super§ = new §false super§(0,0,param4,param5);
         _loc6_.center = new Point(param1,param2);
         return _loc6_.containsPoint(new Point(param3.x,param3.y));
      }
      
      public static function ccpForAngle(param1:Number) : *
      {
         return ccp(Math.cos(param1),Math.sin(param1));
      }
      
      public static function §_-p§(param1:Point, param2:Point) : Number
      {
         var _loc3_:Number = Math.acos(§throw for package§(ccpNormalize(param1),ccpNormalize(param2)));
         if(Math.abs(_loc3_) < 1.2e-7)
         {
            return 0;
         }
         return _loc3_;
      }
      
      public static function ccpNormalize(param1:Point) : *
      {
         return ccpMult(param1,1 / ccpLength(param1));
      }
      
      public static function ccpAdd(param1:Point, param2:Point) : Point
      {
         return new Point(param1.x + param2.x,param1.y + param2.y);
      }
      
      public static function ccpDistance(param1:Point, param2:Point) : *
      {
         return ccpLength(ccpSub(param1,param2));
      }
      
      public static function ccp(param1:Number, param2:Number) : Point
      {
         return new Point(param1,param2);
      }
      
      public static function ccpSub(param1:Point, param2:Point) : Point
      {
         return ccp(param1.x - param2.x,param1.y - param2.y);
      }
      
      public static function §static const break§(param1:Point, param2:Number) : Point
      {
         var _loc3_:Number = ccpLength(param1);
         if(param2 < _loc3_)
         {
            return param1;
         }
         var _loc4_:Number = _loc3_ / param2;
         return ccp(param1.x * _loc4_,param1.y * _loc4_);
      }
      
      public static function wc2f(param1:Number, param2:Number) : Point
      {
         return §_-iy§(ccp(param1,param2));
      }
      
      public static function §_-iy§(param1:Point) : Point
      {
         return ccp(param1.x / 1.28,-param1.y / 1.28);
      }
      
      public static function ccpLength(param1:Point) : *
      {
         return Math.sqrt(§true const class§(param1));
      }
      
      public static function ccpMult(param1:Point, param2:Number) : Point
      {
         return ccp(param1.x * param2,param1.y * param2);
      }
      
      public static function ccpToAngle(param1:Point) : Number
      {
         return Math.atan2(param1.y,param1.x);
      }
      
      public static function §throw for package§(param1:Point, param2:Point) : *
      {
         return param1.x * param2.x + param1.y * param2.y;
      }
      
      public static function §true const class§(param1:Point) : *
      {
         return §throw for package§(param1,param1);
      }
      
      public static function getRandomFrom(param1:Number, param2:Number) : Number
      {
         return param1 + (param2 - param1) * Math.random();
      }
      
      public static function pow(param1:Number, param2:Number) : Number
      {
         return param1 ^ param2;
      }
      
      public static function wc2fDragon(param1:Number, param2:Number) : Point
      {
         return ccpMult(ccp(param1,-param2),1 / 1.28);
      }
      
      public static function getHealthForEnemy(param1:Object, param2:int, param3:int) : Number
      {
         var _loc4_:int = param3;
         if(param1 != null)
         {
            _loc4_ = int(param1.health);
         }
         if(param2 == §switch for var§.DIFFICULTY_EASY)
         {
            if(param1 != null && Boolean(param1.healthEasy))
            {
               _loc4_ = int(param1.healthEasy);
            }
            else
            {
               _loc4_ *= 0.7;
               if(_loc4_ % 10 != 0)
               {
                  _loc4_ = 10 * Math.round(_loc4_ / 10 + 0.5);
               }
            }
         }
         else if(param2 == §switch for var§.DIFFICULTY_NORMAL)
         {
            if(param1 != null && Boolean(param1.healthNormal))
            {
               _loc4_ = int(param1.healthNormal);
            }
            else
            {
               _loc4_ *= 0.8;
               if(_loc4_ % 10 != 0)
               {
                  _loc4_ = 10 * Math.round(_loc4_ / 10 + 0.5);
               }
            }
         }
         return _loc4_;
      }
      
      public static function getFramenumberForLabel(param1:MovieClip, param2:String) : int
      {
         var _loc5_:FrameLabel = null;
         var _loc3_:Array = param1.currentLabels;
         var _loc4_:uint = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc5_ = _loc3_[_loc4_];
            if(_loc5_.name == param2)
            {
               return _loc5_.frame;
            }
            _loc4_++;
         }
         return -1;
      }
      
      private function §finally throw§() : void
      {
         var _loc1_:* = new Object();
         var _loc2_:Array = [0,0,0,52 * 30,0,27 * 30,0,20 * 30,0,0,72 * 30,0,0,24 * 30,1 * 30,0,0,0];
         _loc1_.times = _loc2_;
         _loc1_.durationTime = 30 * 30;
         _loc1_.fireLavaTime = 3 * 30;
         this.§_-EQ§.volcanoCampaign = _loc1_;
         var _loc3_:* = new Object();
         var _loc4_:Array = [0,10 * 30,10 * 30,10 * 30,10 * 30,10 * 30,10 * 30,0,0,0,0,0,0,0,0,0];
         _loc3_.times = _loc4_;
         _loc3_.durationTime = 30 * 30;
         _loc3_.fireLavaTime = 3 * 30;
         this.§_-EQ§.volcanoHeroic = _loc3_;
         var _loc5_:* = new Object();
         _loc5_.fireLavaTime = 8 * 30;
         this.§_-EQ§.volcanoIron = _loc5_;
      }
      
      private function §switch const return§() : void
      {
         var _loc1_:* = new Object();
         this.mages.building = _loc1_;
         var _loc2_:* = new Object();
         _loc2_.cost = 100;
         _loc2_.远程 = 220;
         _loc2_.minDamage = 9;
         _loc2_.maxDamage = 17;
         _loc2_.reload = 1.5 * this.framesRate;
         this.mages.level1 = _loc2_;
         var _loc3_:* = new Object();
         _loc3_.cost = 160;
         _loc3_.远程 = 250;
         _loc3_.minDamage = 23;
         _loc3_.maxDamage = 43;
         _loc3_.reload = 1.5 * this.framesRate;
         this.mages.level2 = _loc3_;
         var _loc4_:* = new Object();
         _loc4_.cost = 240;
         _loc4_.远程 = 280;
         _loc4_.minDamage = 40;
         _loc4_.maxDamage = 74;
         _loc4_.reload = 1.5 * this.framesRate;
         this.mages.level3 = _loc4_;
         var _loc5_:* = new Object();
         _loc5_.cost = 300;
         _loc5_.远程 = 310;
         _loc5_.minDamage = 20;
         _loc5_.maxDamage = 70;
         _loc5_.reload = 1;
         _loc5_.pestilenceCost = 325;
         _loc5_.pestilenceCostLevel = 200;
         _loc5_.pestilencePoisonDamage = 2;
         _loc5_.pestilencePoisonDamageFreq = 3;
         _loc5_.pestilencePoisonDuration = 1 * this.framesRate;
         _loc5_.pestilenceCoolDown = 12 * this.framesRate;
         _loc5_.pestilenceLessCoolDown = 0 * this.framesRate;
         _loc5_.pestilenceDurationTime = 3 * this.framesRate;
         _loc5_.pestilenceDurationTimeIncrement = 1 * this.framesRate;
         _loc5_.pestilenceDamageTime = 10;
         _loc5_.pestilenceRange = 80;
         _loc5_.pestilenceLevels = 3;
         _loc5_.deathRiderRallyRange = 280;
         _loc5_.deathRiderMaxSize = LARGE;
         _loc5_.deathRiderCost = 300;
         _loc5_.deathRiderCostLevel = 150;
         _loc5_.deathRiderRange = 120;
         _loc5_.deathRiderHealth = 200;
         _loc5_.deathRiderExtraHealth = 50;
         _loc5_.deathRiderRegen = 25;
         _loc5_.deathRiderRegenReload = 1 * this.framesRate;
         _loc5_.deathRiderArmor = 30;
         _loc5_.deathRiderArmorExtra = 10;
         _loc5_.deathRiderMinDamage = 0;
         _loc5_.deathRiderMaxDamage = 10;
         _loc5_.deathRiderDamageExtra = 5;
         _loc5_.deathRiderReload = 1 * this.framesRate;
         _loc5_.deathRiderRespawnTime = 12 * this.framesRate;
         _loc5_.deathRiderLevels = 3;
         _loc5_.deathRiderAreaAttackRangeWidth = 30;
         _loc5_.deathRiderAreaAttackMaxEnemies = 1;
         _loc5_.deathRiderMaxLevel = 10;
         _loc5_.deathRiderBuffDamageIncrement = 50;
         _loc5_.deathRiderBuffArmorIncrement = 30;
         _loc5_.deathRiderBuffRange = 200;
         _loc5_.globalMaxSkeletons = 30;
         _loc5_.globalMaxTowerSkeletons = 8;
         _loc5_.skeletonsOnInit = 0;
         _loc5_.skeletonMinHealthForKnight = 500;
         _loc5_.skeletonCoolDown = 10 * this.framesRate;
         _loc5_.skeletonMaxSize = LARGE;
         _loc5_.skeletonMaxLevel = 5;
         _loc5_.skeletonRange = 60;
         _loc5_.skeletonHealth = 40;
         _loc5_.skeletonArmor = 0;
         _loc5_.skeletonMinDamage = 1;
         _loc5_.skeletonMaxDamage = 6;
         _loc5_.skeletonReload = 1 * this.framesRate;
         _loc5_.skeletonLifeTime = 10 * this.framesRate;
         _loc5_.skeletonRegen = 0;
         _loc5_.skeletonRegenReload = 1 * this.framesRate;
         _loc5_.skeletonKnightCoolDown = 10 * this.framesRate;
         _loc5_.skeletonKnightMaxSize = LARGE;
         _loc5_.skeletonKnightMaxLevel = 5;
         _loc5_.skeletonKnightRange = 60;
         _loc5_.skeletonKnightHealth = 80;
         _loc5_.skeletonKnightArmor = 30;
         _loc5_.skeletonKnightMinDamage = 2;
         _loc5_.skeletonKnightMaxDamage = 10;
         _loc5_.skeletonKnightReload = 1 * this.framesRate;
         _loc5_.skeletonKnightLifeTime = 10 * this.framesRate;
         _loc5_.skeletonKnightRegen = 0;
         _loc5_.skeletonKnightRegenReload = 1 * this.framesRate;
         this.mages.necromancer = _loc5_;
         var _loc6_:* = new Object();
         _loc6_.cost = 300;
         _loc6_.远程 = 310;
         _loc6_.minDamage = 60;
         _loc6_.maxDamage = 120;
         _loc6_.reload = 1.5 * this.framesRate;
         _loc6_.explosionCost = 200;
         _loc6_.explosionCostLevel = 200;
         _loc6_.explosionRange = 60;
         _loc6_.explosionRangeIncrement = 5;
         _loc6_.explosionMinDamage = 0;
         _loc6_.explosionMaxDamage = 0;
         _loc6_.explosionDamageIncrement = 30;
         _loc6_.explosionChance = 35;
         _loc6_.explosionLevels = 3;
         _loc6_.twisterCost = 350;
         _loc6_.twisterCostLevel = 250;
         _loc6_.twisterMaxEnemies = 4;
         _loc6_.twisterMaxEnemiesIncrement = 1;
         _loc6_.twisterNodes = 15;
         _loc6_.twisterNodesIncrement = 5;
         _loc6_.twisterMinDamage = 20;
         _loc6_.twisterMaxDamage = 20;
         _loc6_.twisterDamageIncrement = 20;
         _loc6_.twisterRange = 40;
         _loc6_.twisterSpeed = 1.2;
         _loc6_.twisterMaxTimes = 3;
         _loc6_.twisterReloadTime = 22 * this.framesRate;
         _loc6_.twisterLevels = 3;
         this.mages.archmage = _loc6_;
      }
      
      public function setBrillianceDamages(param1:§switch for var§, param2:int) : *
      {
         var _loc3_:Number = 1 + param2 / 100;
         param1.mages.level1.minDamage = Math.ceil(this.mages.level1.minDamage * _loc3_);
         param1.mages.level1.maxDamage = Math.ceil(this.mages.level1.maxDamage * _loc3_);
         param1.mages.level2.minDamage = Math.ceil(this.mages.level2.minDamage * _loc3_);
         param1.mages.level2.maxDamage = Math.ceil(this.mages.level2.maxDamage * _loc3_);
         param1.mages.level3.minDamage = Math.ceil(this.mages.level3.minDamage * _loc3_);
         param1.mages.level3.maxDamage = Math.ceil(this.mages.level3.maxDamage * _loc3_);
         param1.mages.necromancer.minDamage = Math.ceil(this.mages.necromancer.minDamage * _loc3_);
         param1.mages.necromancer.maxDamage = Math.ceil(this.mages.necromancer.maxDamage * _loc3_);
         param1.mages.archmage.minDamage = Math.ceil(this.mages.archmage.minDamage * _loc3_);
         param1.mages.archmage.maxDamage = Math.ceil(this.mages.archmage.maxDamage * _loc3_);
      }
      
      private function §_-LL§() : void
      {
         var _loc1_:* = new Object();
         this.archers.building = _loc1_;
         var _loc2_:* = new Object();
         _loc2_.cost = 70;
         _loc2_.远程 = 220;
         _loc2_.minDamage = 4;
         _loc2_.maxDamage = 6;
         _loc2_.reload = 0.8 * this.framesRate;
         this.archers.level1 = _loc2_;
         var _loc3_:* = new Object();
         _loc3_.cost = 110;
         _loc3_.远程 = 250;
         _loc3_.minDamage = 7;
         _loc3_.maxDamage = 11;
         _loc3_.reload = 0.6 * this.framesRate;
         this.archers.level2 = _loc3_;
         var _loc4_:* = new Object();
         _loc4_.cost = 160;
         _loc4_.远程 = 280;
         _loc4_.minDamage = 10;
         _loc4_.maxDamage = 16;
         _loc4_.reload = 0.5 * this.framesRate;
         this.archers.level3 = _loc4_;
         var _loc5_:* = new Object();
         _loc5_.cost = 230;
         _loc5_.远程 = 280;
         _loc5_.minDamage = 25;
         _loc5_.maxDamage = 40;
         _loc5_.reload = 0.8 * this.framesRate;
         _loc5_.weaknessCost = 250;
         _loc5_.weaknessCostLevel = 200;
         _loc5_.weaknessRange = 120;
         _loc5_.weaknessDuration = 0 * this.framesRate;
         _loc5_.weaknessDurationIncrement = 3 * this.framesRate;
         _loc5_.weaknessExtraDamagePercent = 40;
         _loc5_.weaknessDamageReducePercent = 50;
         _loc5_.weaknessBuffDuration = 1.5 * this.framesRate;
         _loc5_.weaknessCoolDown = 10 * this.framesRate;
         _loc5_.weaknessLevels = 3;
         _loc5_.silenceCost = 150;
         _loc5_.silenceCostLevel = 150;
         _loc5_.silenceRange = 120;
         _loc5_.silenceDuration = 2 * this.framesRate;
         _loc5_.silenceDurationIncrement = 2 * this.framesRate;
         _loc5_.silenceCoolDown = 8 * this.framesRate;
         _loc5_.silenceBuffDuration = 1.5 * this.framesRate;
         _loc5_.silenceLevels = 3;
         this.archers.totem = _loc5_;
         var _loc6_:* = new Object();
         _loc6_.cost = 230;
         _loc6_.远程 = 310;
         _loc6_.minDamage = 15;
         _loc6_.maxDamage = 23;
         _loc6_.reload = 0.5 * this.framesRate;
         _loc6_.multishootCost = 250;
         _loc6_.multishootCostLevel = 150;
         _loc6_.multishootCoolDown = 5 * this.framesRate;
         _loc6_.multishootRangeNearWidth = 100;
         _loc6_.multishootMaxShoot = 2;
         _loc6_.multishootMaxShootIncrement = 1;
         _loc6_.multishootLevels = 3;
         _loc6_.multishootMinDamage = 30;
         _loc6_.multishootMaxDamage = 40;
         _loc6_.eagleCost = 200;
         _loc6_.eagleCostLevel = 200;
         _loc6_.eagleLevels = 3;
         _loc6_.eagleFlyCoolDown = 10 * this.framesRate;
         _loc6_.eagleExtraRangePercent = 5;
         _loc6_.eagleExtraRangeIncrementPercent = 5;
         _loc6_.eagleCriticalChancePercent = 0;
         _loc6_.eagleCriticalChanceIncrementPercent = 5;
         _loc6_.eagleRangeWidth = 200;
         _loc6_.eagleRangeWidthIncrement = 50;
         this.archers.crossbow = _loc6_;
      }
      
      private function §_-Up§() : void
      {
         var _loc1_:* = new Object();
         this.engineers.building = _loc1_;
         var _loc2_:* = new Object();
         _loc2_.cost = 125;
         _loc2_.远程 = 250;
         _loc2_.area = 65;
         _loc2_.minDamage = 8;
         _loc2_.maxDamage = 15;
         _loc2_.reload = 3 * this.framesRate;
         this.engineers.level1 = _loc2_;
         var _loc3_:* = new Object();
         _loc3_.cost = 220;
         _loc3_.远程 = 250;
         _loc3_.area = 65;
         _loc3_.minDamage = 20;
         _loc3_.maxDamage = 40;
         _loc3_.reload = 3 * this.framesRate;
         this.engineers.level2 = _loc3_;
         var _loc4_:* = new Object();
         _loc4_.cost = 320;
         _loc4_.远程 = 280;
         _loc4_.area = 70;
         _loc4_.minDamage = 30;
         _loc4_.maxDamage = 60;
         _loc4_.reload = 3 * this.framesRate;
         this.engineers.level3 = _loc4_;
         var _loc5_:* = new Object();
         _loc5_.cost = 375;
         _loc5_.rallyRange = 260;
         _loc5_.远程 = 200;
         _loc5_.area = 60;
         _loc5_.minDamage = 25;
         _loc5_.maxDamage = 55;
         _loc5_.reload = 6;
         _loc5_.missilesCost = 300;
         _loc5_.missilesCostLevel = 250;
         _loc5_.missilesCoolDown = 6 * this.framesRate;
         _loc5_.missilesRange = 350;
         _loc5_.missilesExplosionRange = 43;
         _loc5_.missilesMax = 0;
         _loc5_.missilesMaxIncrement = 2;
         _loc5_.missilesMinDamage = 20;
         _loc5_.missilesMaxDamage = 80;
         _loc5_.missilesLevels = 2;
         _loc5_.oilCost = 250;
         _loc5_.oilCostLevel = 200;
         _loc5_.oilCoolDown = 10 * this.framesRate;
         _loc5_.oilRange = 90;
         _loc5_.oilEffectRange = 80;
         _loc5_.oilDuration = 2 * this.framesRate;
         _loc5_.oilDurationIncrement = 2 * this.framesRate;
         _loc5_.oilBuffDuration = 1 * this.framesRate;
         _loc5_.oilBuffSpeedLessPercent = 75;
         _loc5_.oilLevels = 3;
         this.engineers.mech = _loc5_;
         var _loc6_:* = new Object();
         _loc6_.cost = 400;
         _loc6_.远程 = 280;
         _loc6_.minDamage = 25;
         _loc6_.maxDamage = 45;
         _loc6_.reload = 3 * this.framesRate;
         _loc6_.slowDuration = 10;
         _loc6_.slowLessSpeedPercent = 60;
         _loc6_.drillCost = 400;
         _loc6_.drillCostLevel = 200;
         _loc6_.drillCoolDown = 29 * this.framesRate;
         _loc6_.drillCoolDownDecrement = 3 * this.framesRate;
         _loc6_.drillLevels = 3;
         _loc6_.lavaCost = 300;
         _loc6_.lavaCostLevel = 250;
         _loc6_.lavaMinDamage = 0;
         _loc6_.lavaMaxDamage = 0;
         _loc6_.lavaDamageIncrement = 0;
         _loc6_.lavaDecalDuration = 3 * this.framesRate;
         _loc6_.lavaDecalBuffDuration = 2 * this.framesRate;
         _loc6_.lavaDecalDamageTime = 0.2 * this.framesRate;
         _loc6_.lavaDecalDamage = 1;
         _loc6_.lavaDecalDamageIncrement = 3;
         _loc6_.lavaDecalRange = 110;
         _loc6_.lavaCoolDown = 15 * this.framesRate;
         _loc6_.lavaLevels = 3;
         this.engineers.dwaarp = _loc6_;
      }
      
      private function §set default§() : void
      {
         var _loc1_:* = new Object();
         this.engineers.building = _loc1_;
         var _loc2_:* = new Object();
         _loc2_.cost = 70;
         _loc2_.maxSize = MEDIUM;
         _loc2_.maxLevel = 5;
         _loc2_.rangeRally = 226;
         _loc2_.远程 = 94;
         _loc2_.health = 50 * this.ModifSoldierHealth;
         _loc2_.armor = 0;
         _loc2_.minDamage = 1;
         _loc2_.maxDamage = 3;
         _loc2_.reload = 1 * this.framesRate;
         _loc2_.respawn = 10 * this.framesRate;
         _loc2_.regen = 5;
         _loc2_.regenReload = 1 * this.framesRate;
         this.§_-tz§.level1 = _loc2_;
         var _loc3_:* = new Object();
         _loc3_.cost = 110;
         _loc3_.maxSize = MEDIUM;
         _loc3_.maxLevel = 5;
         _loc3_.rangeRally = 226;
         _loc3_.远程 = 94;
         _loc3_.health = 100 * this.ModifSoldierHealth;
         _loc3_.armor = 15;
         _loc3_.minDamage = 3;
         _loc3_.maxDamage = 4;
         _loc3_.reload = 1 * this.framesRate;
         _loc3_.respawn = 10 * this.framesRate;
         _loc3_.regen = 7;
         _loc3_.regenReload = 1 * this.framesRate;
         this.§_-tz§.level2 = _loc3_;
         var _loc4_:* = new Object();
         _loc4_.cost = 160;
         _loc4_.maxSize = MEDIUM;
         _loc4_.maxLevel = 5;
         _loc4_.rangeRally = 226;
         _loc4_.远程 = 94;
         _loc4_.health = 150 * this.ModifSoldierHealth;
         _loc4_.armor = 30;
         _loc4_.minDamage = 6;
         _loc4_.maxDamage = 10;
         _loc4_.reload = 1 * this.framesRate;
         _loc4_.respawn = 10 * this.framesRate;
         _loc4_.regen = 10;
         _loc4_.regenReload = 1 * this.framesRate;
         this.§_-tz§.level3 = _loc4_;
         var _loc5_:* = new Object();
         _loc5_.cost = 230;
         _loc5_.maxSize = MEDIUM;
         _loc5_.maxLevel = 5;
         _loc5_.rangeRally = 230;
         _loc5_.远程 = 100;
         _loc5_.health = 200 * this.ModifSoldierHealth;
         _loc5_.armor = 0;
         _loc5_.minDamage = 10;
         _loc5_.maxDamage = 14;
         _loc5_.reload = 0.6 * this.framesRate;
         _loc5_.respawn = 10 * this.framesRate;
         _loc5_.regen = 40;
         _loc5_.regenReload = 1 * this.framesRate;
         _loc5_.dodge = 40;
         _loc5_.sneakCost = 225;
         _loc5_.sneakCostLevel = 150;
         _loc5_.sneakMinDamage = 10;
         _loc5_.sneakMaxDamage = 30;
         _loc5_.sneakDamageIncrement = 10;
         _loc5_.sneakChance = 5;
         _loc5_.sneakChanceIncrement = 5;
         _loc5_.sneakLevels = 3;
         _loc5_.sneakInstaKillChance = 2;
         _loc5_.sneakInstaKillChanceIncrement = 1;
         _loc5_.peakCost = 100;
         _loc5_.peakCostLevel = 100;
         _loc5_.peakChance = 10;
         _loc5_.peakChanceIncrement = 10;
         _loc5_.peakStealMin = 1;
         _loc5_.peakStealMax = 3;
         _loc5_.peakLevels = 2;
         _loc5_.counterCost = 150;
         _loc5_.counterCostLevel = 100;
         _loc5_.counterDodgeIncrement = 10;
         _loc5_.counterMinDamage = 10;
         _loc5_.counterMaxDamage = 14;
         _loc5_.counterIncrementDamage = 10;
         _loc5_.counterLevels = 3;
         this.§_-tz§.assassin = _loc5_;
         var _loc6_:* = new Object();
         _loc6_.cost = 230;
         _loc6_.maxSize = MEDIUM;
         _loc6_.maxLevel = 5;
         _loc6_.rangeRally = 230;
         _loc6_.远程 = 100;
         _loc6_.health = 250 * this.ModifSoldierHealth;
         _loc6_.armor = 40;
         _loc6_.minDamage = 20;
         _loc6_.maxDamage = 30;
         _loc6_.reload = 2 * this.framesRate;
         _loc6_.respawn = 15 * this.framesRate;
         _loc6_.regen = 25;
         _loc6_.regenReload = 1 * this.framesRate;
         _loc6_.dodge = 0;
         _loc6_.holygrailCost = 250;
         _loc6_.holygrailCostLevel = 150;
         _loc6_.holygrailChance = 10;
         _loc6_.holygrailChanceIncrement = 10;
         _loc6_.holygrailLifePercent = 10;
         _loc6_.holygrailLifePercentIncrement = 10;
         _loc6_.holygrailLevels = 3;
         _loc6_.extralifeCost = 200;
         _loc6_.extralifeCostLevel = 200;
         _loc6_.extralifeHealthIncrement = 50;
         _loc6_.extralifeLevels = 3;
         _loc6_.bloodCost = 250;
         _loc6_.bloodCostLevel = 150;
         _loc6_.bloodChance = 10;
         _loc6_.bloodChanceIncrement = 0;
         _loc6_.bloodMinDamage = 10;
         _loc6_.bloodMaxDamage = 10;
         _loc6_.bloodDamageIncrement = 15;
         _loc6_.bloodDuration = 3 * this.framesRate;
         _loc6_.bloodDurationIncrement = 0 * this.framesRate;
         _loc6_.bloodLevels = 3;
         this.§_-tz§.templar = _loc6_;
      }
      
      private function §_-KJ§() : void
      {
         var _loc24_:* = undefined;
         var _loc25_:* = undefined;
         var _loc26_:* = undefined;
         var _loc27_:* = undefined;
         var _loc28_:* = undefined;
         var _loc29_:* = undefined;
         var _loc30_:* = undefined;
         var _loc31_:* = undefined;
         var _loc32_:* = undefined;
         var _loc33_:* = undefined;
         var _loc34_:* = undefined;
         var _loc35_:* = undefined;
         var _loc36_:* = undefined;
         var _loc37_:* = undefined;
         var _loc38_:* = undefined;
         var _loc39_:* = undefined;
         var _loc40_:* = undefined;
         var _loc41_:* = undefined;
         var _loc42_:* = undefined;
         var _loc43_:* = undefined;
         var _loc44_:* = undefined;
         var _loc45_:* = undefined;
         var _loc1_:* = new Object();
         _loc1_.className = "EnemyWolfSmall";
         _loc1_.elite = false;
         _loc1_.size = SMALL;
         _loc1_.isFlying = false;
         _loc1_.health = 35;
         _loc1_.healtNormal = 30;
         _loc1_.healthEasy = 25;
         _loc1_.armor = 0;
         _loc1_.magicArmor = 0;
         _loc1_.dodge = 30;
         _loc1_.speed = 2.5;
         _loc1_.gold = 5;
         _loc1_.cost = 1;
         _loc1_.minDamage = 1;
         _loc1_.maxDamage = 3;
         _loc1_.attackReloadTime = 1 * this.framesRate;
         _loc1_.xSoldierAdjust = 15;
         _loc1_.xAdjust = 0;
         _loc1_.yAdjust = -8;
         this.enemies.wolfSmall = _loc1_;
         var _loc2_:* = new Object();
         _loc2_.className = "EnemyWolf";
         _loc2_.elite = false;
         _loc2_.size = MEDIUM;
         _loc2_.isFlying = false;
         _loc2_.health = 120;
         _loc2_.armor = 0;
         _loc2_.magicArmor = 50;
         _loc2_.dodge = 50;
         _loc2_.speed = 2;
         _loc2_.gold = 10;
         _loc2_.cost = 1;
         _loc2_.minDamage = 12;
         _loc2_.maxDamage = 18;
         _loc2_.attackReloadTime = 1 * this.framesRate;
         _loc2_.xSoldierAdjust = 20;
         _loc2_.xAdjust = 0;
         _loc2_.yAdjust = -8;
         this.enemies.wolf = _loc2_;
         var _loc3_:* = new Object();
         _loc3_.className = "EnemySpider";
         _loc3_.elite = false;
         _loc3_.size = SMALL;
         _loc3_.isFlying = false;
         _loc3_.health = 500;
         _loc3_.armor = 0;
         _loc3_.magicArmor = 80;
         _loc3_.dodge = 0;
         _loc3_.speed = 1;
         _loc3_.gold = 40;
         _loc3_.cost = 2;
         _loc3_.minDamage = 20;
         _loc3_.maxDamage = 40;
         _loc3_.attackReloadTime = 1 * this.framesRate;
         _loc3_.xSoldierAdjust = 24;
         _loc3_.xAdjust = 1;
         _loc3_.yAdjust = -8;
         _loc3_.eggsMax = 3;
         _loc3_.eggsSpiders = 3;
         _loc3_.eggsCooldownTimeMin = 2 * this.framesRate;
         _loc3_.eggsCooldownTimeMax = 6 * this.framesRate;
         this.enemies.spider = _loc3_;
         var _loc4_:* = new Object();
         _loc4_.className = "EnemySpiderTiny";
         _loc4_.elite = false;
         _loc4_.size = SMALL;
         _loc4_.isFlying = false;
         _loc4_.health = 25;
         _loc4_.healthNormal = 20;
         _loc4_.healthEasy = 15;
         _loc4_.armor = 0;
         _loc4_.magicArmor = 50;
         _loc4_.dodge = 0;
         _loc4_.speed = 3;
         _loc4_.gold = 0;
         _loc4_.cost = 1;
         _loc4_.minDamage = 1;
         _loc4_.maxDamage = 5;
         _loc4_.attackReloadTime = 1 * this.framesRate;
         _loc4_.xSoldierAdjust = 14;
         _loc4_.xAdjust = 1;
         _loc4_.yAdjust = -4;
         this.enemies.spiderTiny = _loc4_;
         var _loc5_:* = new Object();
         _loc5_.className = "EnemySpiderSmall";
         _loc5_.elite = false;
         _loc5_.size = SMALL;
         _loc5_.isFlying = false;
         _loc5_.health = 100;
         _loc5_.armor = 0;
         _loc5_.magicArmor = 65;
         _loc5_.dodge = 0;
         _loc5_.speed = 1.5;
         _loc5_.gold = 8;
         _loc5_.cost = 1;
         _loc5_.minDamage = 10;
         _loc5_.maxDamage = 20;
         _loc5_.attackReloadTime = 1 * this.framesRate;
         _loc5_.xSoldierAdjust = 18;
         _loc5_.xAdjust = 1;
         _loc5_.yAdjust = -8;
         this.enemies.spiderSmall = _loc5_;
         var _loc6_:* = new Object();
         _loc6_.className = "EnemyShadowArcher";
         _loc6_.elite = false;
         _loc6_.size = SMALL;
         _loc6_.isFlying = false;
         _loc6_.health = 180;
         _loc6_.armor = 0;
         _loc6_.magicArmor = 30;
         _loc6_.dodge = 0;
         _loc6_.speed = 1.2;
         _loc6_.gold = 12;
         _loc6_.cost = 1;
         _loc6_.minDamage = 10;
         _loc6_.maxDamage = 20;
         _loc6_.attackReloadTime = 1 * this.framesRate;
         _loc6_.xSoldierAdjust = 15;
         _loc6_.xAdjust = 1;
         _loc6_.yAdjust = -8;
         _loc6_.arrowCoolDown = 1 * this.framesRate;
         _loc6_.arrowRange = 230;
         _loc6_.arrowMinRange = 40;
         _loc6_.arrowMinDamage = 20;
         _loc6_.arrowMaxDamage = 30;
         this.enemies.shadowArcher = _loc6_;
         var _loc7_:* = new Object();
         _loc7_.className = "EnemyBouncer";
         _loc7_.elite = false;
         _loc7_.size = SMALL;
         _loc7_.isFlying = false;
         _loc7_.health = 60;
         _loc7_.healthNormal = 50;
         _loc7_.healthEasy = 40;
         _loc7_.armor = 0;
         _loc7_.magicArmor = 0;
         _loc7_.dodge = 0;
         _loc7_.speed = 0.9;
         _loc7_.gold = 5;
         _loc7_.cost = 1;
         _loc7_.minDamage = 2;
         _loc7_.maxDamage = 6;
         _loc7_.attackReloadTime = 1 * this.framesRate;
         _loc7_.xSoldierAdjust = 15;
         _loc7_.xAdjust = 0;
         _loc7_.yAdjust = -10;
         this.enemies.bouncer = _loc7_;
         var _loc8_:* = new Object();
         _loc8_.className = "EnemyDesertRaider";
         _loc8_.elite = false;
         _loc8_.size = SMALL;
         _loc8_.isFlying = false;
         _loc8_.health = 200;
         _loc8_.armor = 30;
         _loc8_.magicArmor = 0;
         _loc8_.dodge = 0;
         _loc8_.speed = 1;
         _loc8_.gold = 16;
         _loc8_.cost = 1;
         _loc8_.minDamage = 6;
         _loc8_.maxDamage = 10;
         _loc8_.attackReloadTime = 1.2 * this.framesRate;
         _loc8_.xSoldierAdjust = 15;
         _loc8_.xAdjust = 0;
         _loc8_.yAdjust = -8;
         this.enemies.desertRaider = _loc8_;
         var _loc9_:* = new Object();
         _loc9_.className = "EnemyImmortal";
         _loc9_.elite = false;
         _loc9_.size = MEDIUM;
         _loc9_.isFlying = false;
         _loc9_.health = 360;
         _loc9_.armor = 60;
         _loc9_.magicArmor = 0;
         _loc9_.dodge = 0;
         _loc9_.speed = 0.8;
         _loc9_.gold = 24;
         _loc9_.cost = 2;
         _loc9_.minDamage = 12;
         _loc9_.maxDamage = 28;
         _loc9_.attackReloadTime = 1 * this.framesRate;
         _loc9_.xSoldierAdjust = 20;
         _loc9_.xAdjust = 0;
         _loc9_.yAdjust = -10;
         this.enemies.immortal = _loc9_;
         var _loc10_:* = new Object();
         _loc10_.className = "EnemyFallen";
         _loc10_.elite = false;
         _loc10_.size = SMALL;
         _loc10_.isFlying = false;
         _loc10_.health = 120;
         _loc10_.armor = 0;
         _loc10_.magicArmor = 0;
         _loc10_.dodge = 0;
         _loc10_.speed = 0.7;
         _loc10_.gold = 0;
         _loc10_.cost = 1;
         _loc10_.minDamage = 12;
         _loc10_.maxDamage = 28;
         _loc10_.attackReloadTime = 1 * this.framesRate;
         _loc10_.xSoldierAdjust = 15;
         _loc10_.xAdjust = 0;
         _loc10_.yAdjust = -8;
         this.enemies.fallen = _loc10_;
         var _loc11_:* = new Object();
         _loc11_.className = "EnemyWaspQueen";
         _loc11_.elite = false;
         _loc11_.size = SMALL;
         _loc11_.isFlying = true;
         _loc11_.health = 400;
         _loc11_.armor = 0;
         _loc11_.magicArmor = 0;
         _loc11_.dodge = 0;
         _loc11_.speed = 1;
         _loc11_.gold = 40;
         _loc11_.cost = 5;
         _loc11_.minDamage = 0;
         _loc11_.maxDamage = 0;
         _loc11_.attackReloadTime = 1 * this.framesRate;
         _loc11_.xSoldierAdjust = 15;
         _loc11_.xAdjust = 3;
         _loc11_.yAdjust = -45;
         _loc11_.maxWasps = 5;
         this.enemies.waspQueen = _loc11_;
         var _loc12_:* = new Object();
         _loc12_.className = "EnemyWasp";
         _loc12_.elite = false;
         _loc12_.size = SMALL;
         _loc12_.isFlying = true;
         _loc12_.health = 80;
         _loc12_.armor = 0;
         _loc12_.magicArmor = 0;
         _loc12_.dodge = 0;
         _loc12_.speed = 1.3;
         _loc12_.gold = 8;
         _loc12_.cost = 1;
         _loc12_.minDamage = 0;
         _loc12_.maxDamage = 0;
         _loc12_.attackReloadTime = 1 * this.framesRate;
         _loc12_.xSoldierAdjust = 15;
         _loc12_.xAdjust = 3;
         _loc12_.yAdjust = -34;
         this.enemies.wasp = _loc12_;
         var _loc13_:* = new Object();
         _loc13_.className = "EnemyTremor";
         _loc13_.elite = false;
         _loc13_.size = SMALL;
         _loc13_.isFlying = false;
         _loc13_.health = 120;
         _loc13_.armor = 0;
         _loc13_.magicArmor = 0;
         _loc13_.dodge = 0;
         _loc13_.speed = 1.5;
         _loc13_.gold = 10;
         _loc13_.cost = 1;
         _loc13_.minDamage = 4;
         _loc13_.maxDamage = 8;
         _loc13_.attackReloadTime = 1 * this.framesRate;
         _loc13_.xSoldierAdjust = 20;
         _loc13_.xAdjust = 0;
         _loc13_.yAdjust = -10;
         this.enemies.tremor = _loc13_;
         var _loc14_:* = new Object();
         _loc14_.className = "EnemyScorpion";
         _loc14_.elite = false;
         _loc14_.size = SMALL;
         _loc14_.isFlying = false;
         _loc14_.health = 500;
         _loc14_.armor = 85;
         _loc14_.magicArmor = 0;
         _loc14_.dodge = 0;
         _loc14_.speed = 0.8;
         _loc14_.gold = 28;
         _loc14_.cost = 2;
         _loc14_.minDamage = 12;
         _loc14_.maxDamage = 28;
         _loc14_.attackReloadTime = 1 * this.framesRate;
         _loc14_.xSoldierAdjust = 30;
         _loc14_.xAdjust = 0;
         _loc14_.yAdjust = -10;
         _loc14_.poisonDamagePoint = 3;
         _loc14_.poisonDuration = 5 * this.framesRate;
         _loc14_.poisonReloadTime = 10 * this.framesRate;
         this.enemies.scorpion = _loc14_;
         var _loc15_:* = new Object();
         _loc15_.className = "EnemyExecutioner";
         _loc15_.elite = false;
         _loc15_.size = LARGE;
         _loc15_.isFlying = false;
         _loc15_.health = 2000;
         _loc15_.armor = 0;
         _loc15_.magicArmor = 0;
         _loc15_.dodge = 0;
         _loc15_.speed = 0.6;
         _loc15_.gold = 130;
         _loc15_.cost = 5;
         _loc15_.minDamage = 30;
         _loc15_.maxDamage = 60;
         _loc15_.attackReloadTime = 1.5 * this.framesRate;
         _loc15_.xSoldierAdjust = 25;
         _loc15_.xAdjust = 3;
         _loc15_.yAdjust = -18;
         this.enemies.executioner = _loc15_;
         var _loc16_:* = new Object();
         _loc16_.className = "EnemyMunra";
         _loc16_.elite = false;
         _loc16_.size = SMALL;
         _loc16_.isFlying = false;
         _loc16_.health = 1000;
         _loc16_.armor = 0;
         _loc16_.magicArmor = 0;
         _loc16_.dodge = 0;
         _loc16_.speed = 0.4;
         _loc16_.gold = 100;
         _loc16_.cost = 1;
         _loc16_.minDamage = 30;
         _loc16_.maxDamage = 60;
         _loc16_.attackReloadTime = 1 * this.framesRate;
         _loc16_.xSoldierAdjust = 15;
         _loc16_.xAdjust = 0;
         _loc16_.yAdjust = -9;
         _loc16_.summonMaxFallems = 35;
         _loc16_.summonFallems = 4;
         _loc16_.summonMinNodes = 10;
         _loc16_.summonMaxNodes = 20;
         _loc16_.summonCoolDown = 8 * this.framesRate;
         _loc16_.spellCoolDown = 1 * this.framesRate;
         _loc16_.spellRange = 180;
         _loc16_.spellMinRange = 40;
         _loc16_.spellMinDamage = 20;
         _loc16_.spellMaxDamage = 40;
         _loc16_.healMaxEnemies = 3;
         _loc16_.healCoolDown = 8 * this.framesRate;
         _loc16_.healRange = 150;
         _loc16_.healPoints = 100;
         this.enemies.munra = _loc16_;
         var _loc17_:* = new Object();
         _loc17_.className = "EnemyEfreetiBoss";
         _loc17_.elite = false;
         _loc17_.size = LARGE;
         _loc17_.isFlying = false;
         _loc17_.health = 8000;
         _loc17_.healthNormal = 8000;
         _loc17_.healthEasy = 7000;
         _loc17_.armor = 0;
         _loc17_.magicArmor = 0;
         _loc17_.dodge = 0;
         _loc17_.speed = 0.35;
         _loc17_.gold = 0;
         _loc17_.cost = 20;
         _loc17_.attackReloadTime = 2 * this.framesRate;
         _loc17_.xSoldierAdjust = 35;
         _loc17_.xAdjust = 0;
         _loc17_.yAdjust = -90;
         _loc17_.sharedCoolDownTime = 7 * this.framesRate;
         _loc17_.laughDuration = 2 * this.framesRate;
         _loc17_.polymorphRangeWidth = 500;
         _loc17_.polymorphMaxEnemies = 3;
         _loc17_.polymorphMinDistance = 120;
         _loc17_.areaAttackRangeWidth = 150;
         _loc17_.areaAttackMaxEnemies = 10;
         _loc17_.minDamage = 500;
         _loc17_.maxDamage = 800;
         _loc17_.sandMaxTowers = 3;
         _loc17_.sandRangeWidth = 300;
         _loc17_.sandDurationTime = 10 * this.framesRate;
         _loc17_.spawnMaxEnemies = 4;
         _loc17_.lifeLimitTwo = 5000;
         _loc17_.lifeLimitThree = 3000;
         this.enemies.efreeti = _loc17_;
         var _loc18_:* = new Object();
         _loc18_.className = "EnemyEfreetiSmall";
         _loc18_.elite = false;
         _loc18_.size = LARGE;
         _loc18_.isFlying = false;
         _loc18_.health = 250;
         _loc18_.armor = 0;
         _loc18_.magicArmor = 0;
         _loc18_.dodge = 0;
         _loc18_.speed = 1;
         _loc18_.gold = 20;
         _loc18_.cost = 2;
         _loc18_.minDamage = 30;
         _loc18_.maxDamage = 60;
         _loc18_.attackReloadTime = 2 * this.framesRate;
         _loc18_.xSoldierAdjust = 25;
         _loc18_.xAdjust = 0;
         _loc18_.yAdjust = -25;
         this.enemies.efreetiSmall = _loc18_;
         var _loc19_:* = new Object();
         _loc19_.className = "EnemyCanibal";
         _loc19_.elite = false;
         _loc19_.size = SMALL;
         _loc19_.isFlying = false;
         _loc19_.health = 250;
         _loc19_.armor = 0;
         _loc19_.magicArmor = 0;
         _loc19_.dodge = 0;
         _loc19_.speed = 0.9;
         _loc19_.gold = 15;
         _loc19_.cost = 1;
         _loc19_.minDamage = 10;
         _loc19_.maxDamage = 20;
         _loc19_.attackReloadTime = 1 * this.framesRate;
         _loc19_.xSoldierAdjust = 15;
         _loc19_.xAdjust = 0;
         _loc19_.yAdjust = -12;
         _loc19_.healPerFrame = 3;
         _loc19_.extraLife = 50;
         _loc19_.maxLife = 600;
         this.enemies.canibal = _loc19_;
         var _loc20_:* = new Object();
         _loc20_.className = "EnemyCanibalShamanPriest";
         _loc20_.elite = false;
         _loc20_.size = SMALL;
         _loc20_.isFlying = false;
         _loc20_.health = 600;
         _loc20_.armor = 0;
         _loc20_.magicArmor = 0;
         _loc20_.dodge = 0;
         _loc20_.speed = 0.9;
         _loc20_.gold = 50;
         _loc20_.cost = 1;
         _loc20_.minDamage = 14;
         _loc20_.maxDamage = 26;
         _loc20_.attackReloadTime = 1 * this.framesRate;
         _loc20_.xSoldierAdjust = 15;
         _loc20_.xAdjust = 0;
         _loc20_.yAdjust = -12;
         _loc20_.spellCoolDown = 1 * this.framesRate;
         _loc20_.spellRange = 0;
         _loc20_.spellMinRange = 40;
         _loc20_.spellMinDamage = 14;
         _loc20_.spellMaxDamage = 26;
         _loc20_.healMaxEnemies = 10;
         _loc20_.healCoolDown = 4 * this.framesRate;
         _loc20_.healRange = 200;
         _loc20_.healPoints = 50;
         this.enemies.canibalPriest = _loc20_;
         var _loc21_:* = new Object();
         _loc21_.className = "EnemyCanibalShamanShield";
         _loc21_.elite = false;
         _loc21_.size = SMALL;
         _loc21_.isFlying = false;
         _loc21_.health = 600;
         _loc21_.armor = 80;
         _loc21_.magicArmor = 0;
         _loc21_.dodge = 0;
         _loc21_.speed = 0.9;
         _loc21_.gold = 50;
         _loc21_.cost = 1;
         _loc21_.minDamage = 14;
         _loc21_.maxDamage = 26;
         _loc21_.attackReloadTime = 1 * this.framesRate;
         _loc21_.xSoldierAdjust = 15;
         _loc21_.xAdjust = 0;
         _loc21_.yAdjust = -12;
         _loc21_.auraMaxEnemies = 10;
         _loc21_.auraCoolDown = 1 * this.framesRate;
         _loc21_.auraDuration = 1.5 * this.framesRate;
         _loc21_.auraRange = 180;
         _loc21_.auraPoints = 80;
         _loc21_.auraRecoverPoints = 3;
         this.enemies.canibalShield = _loc21_;
         var _loc22_:* = new Object();
         _loc22_.className = "EnemyCanibalShamanMagic";
         _loc22_.elite = false;
         _loc22_.size = SMALL;
         _loc22_.isFlying = false;
         _loc22_.health = 600;
         _loc22_.armor = 0;
         _loc22_.magicArmor = 90;
         _loc22_.dodge = 0;
         _loc22_.speed = 0.9;
         _loc22_.gold = 50;
         _loc22_.cost = 1;
         _loc22_.minDamage = 14;
         _loc22_.maxDamage = 26;
         _loc22_.attackReloadTime = 1 * this.framesRate;
         _loc22_.xSoldierAdjust = 15;
         _loc22_.xAdjust = 0;
         _loc22_.yAdjust = -12;
         _loc22_.spellCoolDown = 1 * this.framesRate;
         _loc22_.spellRange = 0;
         _loc22_.spellMinRange = 40;
         _loc22_.spellMinDamage = 14;
         _loc22_.spellMaxDamage = 26;
         _loc22_.auraMaxEnemies = 10;
         _loc22_.auraCoolDown = 1 * this.framesRate;
         _loc22_.auraDuration = 1.5 * this.framesRate;
         _loc22_.auraRange = 180;
         _loc22_.auraPoints = 80;
         _loc22_.auraRecoverPoints = 3;
         this.enemies.canibalMagic = _loc22_;
         var _loc23_:* = new Object();
         _loc23_.className = "EnemyCanibalSavageHunter";
         _loc23_.elite = false;
         _loc23_.size = SMALL;
         _loc23_.isFlying = false;
         _loc23_.health = 150;
         _loc23_.armor = 0;
         _loc23_.magicArmor = 0;
         _loc23_.dodge = 0;
         _loc23_.speed = 1.3;
         _loc23_.gold = 15;
         _loc23_.cost = 1;
         _loc23_.minDamage = 10;
         _loc23_.maxDamage = 20;
         _loc23_.attackReloadTime = 1 * this.framesRate;
         _loc23_.xSoldierAdjust = 15;
         _loc23_.xAdjust = 0;
         _loc23_.yAdjust = -13;
         _loc23_.spellCoolDown = 0 * this.framesRate;
         _loc23_.spellRange = 230;
         _loc23_.spellMinRange = 40;
         _loc23_.spellMinDamage = 10;
         _loc23_.spellMaxDamage = 20;
         _loc23_.poisonDuration = 4 * this.framesRate;
         _loc23_.poisonDamagePoint = 3;
         this.enemies.canibalSavageHunter = _loc23_;
         _loc24_ = new Object();
         _loc24_.className = "EnemyCanibalWingRider";
         _loc24_.elite = false;
         _loc24_.size = SMALL;
         _loc24_.isFlying = true;
         _loc24_.health = 250;
         _loc24_.armor = 0;
         _loc24_.magicArmor = 0;
         _loc24_.dodge = 0;
         _loc24_.speed = 1;
         _loc24_.gold = 25;
         _loc24_.cost = 1;
         _loc24_.minDamage = 40;
         _loc24_.maxDamage = 80;
         _loc24_.attackReloadTime = 1 * this.framesRate;
         _loc24_.xSoldierAdjust = 15;
         _loc24_.xAdjust = 3;
         _loc24_.yAdjust = -45;
         _loc24_.rangeCoolDown = 1 * this.framesRate;
         _loc24_.rangeRange = 260;
         _loc24_.rangeMinRange = 50;
         _loc24_.rangeMinDamage = 40;
         _loc24_.rangeMaxDamage = 80;
         this.enemies.canibalWingRider = _loc24_;
         _loc25_ = new Object();
         _loc25_.className = "EnemyCanibalBeast";
         _loc25_.elite = false;
         _loc25_.size = SMALL;
         _loc25_.isFlying = false;
         _loc25_.health = 400;
         _loc25_.armor = 0;
         _loc25_.magicArmor = 0;
         _loc25_.dodge = 0;
         _loc25_.speed = 1;
         _loc25_.gold = 0;
         _loc25_.cost = 0;
         _loc25_.minDamage = 3;
         _loc25_.maxDamage = 6;
         _loc25_.attackReloadTime = 1 * this.framesRate;
         _loc25_.xSoldierAdjust = 18;
         _loc25_.xAdjust = 0;
         _loc25_.yAdjust = -14;
         this.enemies.canibalBeast = _loc25_;
         _loc26_ = new Object();
         _loc26_.className = "EnemySavageBird";
         _loc26_.elite = false;
         _loc26_.size = SMALL;
         _loc26_.isFlying = true;
         _loc26_.health = 150;
         _loc26_.armor = 0;
         _loc26_.magicArmor = 0;
         _loc26_.dodge = 0;
         _loc26_.speed = 2;
         _loc26_.gold = 15;
         _loc26_.cost = 1;
         _loc26_.minDamage = 1;
         _loc26_.maxDamage = 2;
         _loc26_.attackReloadTime = 1 * this.framesRate;
         _loc26_.xSoldierAdjust = 15;
         _loc26_.xAdjust = 3;
         _loc26_.yAdjust = -45;
         this.enemies.savageBird = _loc26_;
         _loc27_ = new Object();
         _loc27_.className = "EnemyGorilla";
         _loc27_.elite = false;
         _loc27_.size = LARGE;
         _loc27_.isFlying = false;
         _loc27_.health = 2800;
         _loc27_.armor = 0;
         _loc27_.magicArmor = 0;
         _loc27_.dodge = 0;
         _loc27_.speed = 0.8;
         _loc27_.gold = 160;
         _loc27_.cost = 5;
         _loc27_.attackReloadTime = 2.5 * this.framesRate;
         _loc27_.xSoldierAdjust = 27;
         _loc27_.xAdjust = 0;
         _loc27_.yAdjust = -22;
         _loc27_.minDamage = 40;
         _loc27_.maxDamage = 80;
         _loc27_.areaAttackRangeWidth = 80;
         _loc27_.areaAttackMaxEnemies = 10;
         this.enemies.gorilla = _loc27_;
         _loc28_ = new Object();
         _loc28_.className = "EnemyAlienBreeder";
         _loc28_.elite = false;
         _loc28_.size = LARGE;
         _loc28_.isFlying = false;
         _loc28_.health = 140;
         _loc28_.armor = 0;
         _loc28_.magicArmor = 60;
         _loc28_.dodge = 0;
         _loc28_.speed = 2.3;
         _loc28_.gold = 5;
         _loc28_.cost = 1;
         _loc28_.minDamage = 10;
         _loc28_.maxDamage = 20;
         _loc28_.attackReloadTime = 1 * this.framesRate;
         _loc28_.xSoldierAdjust = 10;
         _loc28_.xAdjust = 3;
         _loc28_.yAdjust = -10;
         this.enemies.alienBreeder = _loc28_;
         _loc29_ = new Object();
         _loc29_.className = "EnemyAlienReaper";
         _loc29_.elite = false;
         _loc29_.size = LARGE;
         _loc29_.isFlying = false;
         _loc29_.health = 500;
         _loc29_.armor = 0;
         _loc29_.magicArmor = 60;
         _loc29_.dodge = 0;
         _loc29_.speed = 1;
         _loc29_.gold = 10;
         _loc29_.cost = 1;
         _loc29_.minDamage = 30;
         _loc29_.maxDamage = 60;
         _loc29_.attackReloadTime = 1 * this.framesRate;
         _loc29_.xSoldierAdjust = 25;
         _loc29_.xAdjust = 3;
         _loc29_.yAdjust = -18;
         this.enemies.alienReaper = _loc29_;
         _loc30_ = new Object();
         _loc30_.className = "EnemyCanibalNecromancer";
         _loc30_.elite = false;
         _loc30_.size = LARGE;
         _loc30_.isFlying = false;
         _loc30_.health = 800;
         _loc30_.armor = 0;
         _loc30_.magicArmor = 0;
         _loc30_.dodge = 0;
         _loc30_.speed = 0.9;
         _loc30_.gold = 50;
         _loc30_.cost = 1;
         _loc30_.minDamage = 15;
         _loc30_.maxDamage = 30;
         _loc30_.attackReloadTime = 1 * this.framesRate;
         _loc30_.xSoldierAdjust = 25;
         _loc30_.xAdjust = 3;
         _loc30_.yAdjust = -18;
         _loc30_.spellCoolDown = 1 * this.framesRate;
         _loc30_.spellRange = 230;
         _loc30_.spellMinRange = 40;
         _loc30_.spellMinDamage = 30;
         _loc30_.spellMaxDamage = 50;
         _loc30_.necromancerCoolDown = 1 * this.framesRate;
         _loc30_.necromancerRange = 280;
         this.enemies.canibalNecromancer = _loc30_;
         _loc31_ = new Object();
         _loc31_.className = "EnemyCanibalZombie";
         _loc31_.elite = false;
         _loc31_.size = LARGE;
         _loc31_.isFlying = false;
         _loc31_.health = 500;
         _loc31_.armor = 0;
         _loc31_.magicArmor = 0;
         _loc31_.dodge = 0;
         _loc31_.speed = 0.6;
         _loc31_.gold = 0;
         _loc31_.cost = 1;
         _loc31_.minDamage = 30;
         _loc31_.maxDamage = 50;
         _loc31_.attackReloadTime = 1 * this.framesRate;
         _loc31_.xSoldierAdjust = 25;
         _loc31_.xAdjust = 3;
         _loc31_.yAdjust = -18;
         this.enemies.canibalZombie = _loc31_;
         _loc32_ = new Object();
         _loc32_.className = "EnemyGorillaOffspring";
         _loc32_.elite = false;
         _loc32_.size = LARGE;
         _loc32_.isFlying = false;
         _loc32_.health = 1200;
         _loc32_.armor = 0;
         _loc32_.magicArmor = 0;
         _loc32_.dodge = 0;
         _loc32_.speed = 1;
         _loc32_.gold = 50;
         _loc32_.cost = 2;
         _loc32_.minDamage = 50;
         _loc32_.maxDamage = 100;
         _loc32_.attackReloadTime = 2 * this.framesRate;
         _loc32_.xSoldierAdjust = 22;
         _loc32_.xAdjust = 3;
         _loc32_.yAdjust = -18;
         this.enemies.gorillaOffspring = _loc32_;
         _loc33_ = new Object();
         _loc33_.className = "EnemyGorillaBoss";
         _loc33_.elite = false;
         _loc33_.size = LARGE;
         _loc33_.isFlying = false;
         _loc33_.health = 12000;
         _loc33_.healthNormal = 12000;
         _loc33_.healthEasy = 8000;
         _loc33_.armor = 0;
         _loc33_.magicArmor = 0;
         _loc33_.dodge = 0;
         _loc33_.speed = 0.5;
         _loc33_.gold = 0;
         _loc33_.cost = 20;
         _loc33_.xSoldierAdjust = 30;
         _loc33_.xAdjust = 3;
         _loc33_.yAdjust = -35;
         _loc33_.callingGorillasReloadTime = 8 * this.framesRate;
         _loc33_.callingGorillasMax = 8;
         _loc33_.healingReloadTime = 10 * this.framesRate;
         _loc33_.healingPoints = 500;
         _loc33_.jumpToTowerLockNodes = 30;
         _loc33_.onTowerTime = 9 * this.framesRate;
         _loc33_.flipReloadTime = 5 * this.framesRate;
         _loc33_.roadOneAdjustOnTowerLeave = 0;
         _loc33_.roadTwoAdjustOnTowerLeave = 10;
         _loc33_.barrelReloadTime = 0.5 * this.framesRate;
         _loc33_.barrelRangeWidth = 703;
         _loc33_.barrelMinDamage = 100;
         _loc33_.barrelMaxDamage = 150;
         _loc33_.barrelArea = 80;
         _loc33_.minDamage = 200;
         _loc33_.maxDamage = 500;
         _loc33_.attackReloadTime = 2 * this.framesRate;
         _loc33_.areaAttackRangeWidth = 70;
         _loc33_.areaAttackMaxEnemies = 10;
         this.enemies.gorillaBoss = _loc33_;
         _loc34_ = new Object();
         _loc34_.className = "EnemySaurianBroodguard";
         _loc34_.elite = false;
         _loc34_.size = SMALL;
         _loc34_.isFlying = false;
         _loc34_.health = 300;
         _loc34_.armor = 0;
         _loc34_.magicArmor = 0;
         _loc34_.dodge = 0;
         _loc34_.speed = 1;
         _loc34_.gold = 20;
         _loc34_.cost = 1;
         _loc34_.minDamage = 8;
         _loc34_.maxDamage = 22;
         _loc34_.attackReloadTime = 1 * this.framesRate;
         _loc34_.xSoldierAdjust = 15;
         _loc34_.xAdjust = 3;
         _loc34_.yAdjust = -14;
         _loc34_.speedIncrement = 1 / 1.28;
         this.enemies.saurianBroodguard = _loc34_;
         _loc35_ = new Object();
         _loc35_.className = "EnemySaurianMyrmidon";
         _loc35_.elite = false;
         _loc35_.size = MEDIUM;
         _loc35_.isFlying = false;
         _loc35_.health = 800;
         _loc35_.armor = 60;
         _loc35_.magicArmor = 0;
         _loc35_.dodge = 0;
         _loc35_.speed = 0.8;
         _loc35_.gold = 50;
         _loc35_.cost = 2;
         _loc35_.minDamage = 16;
         _loc35_.maxDamage = 34;
         _loc35_.attackReloadTime = 1 * this.framesRate;
         _loc35_.xSoldierAdjust = 22;
         _loc35_.xAdjust = 3;
         _loc35_.yAdjust = -18;
         _loc35_.byteCooldown = 4 * this.framesRate;
         _loc35_.byteMinDamage = 75;
         _loc35_.byteMaxDamage = 150;
         _loc35_.byteHeal = 125;
         this.enemies.saurianMyrmidon = _loc35_;
         _loc36_ = new Object();
         _loc36_.className = "EnemySaurianNightscale";
         _loc36_.elite = false;
         _loc36_.size = SMALL;
         _loc36_.isFlying = false;
         _loc36_.health = 350;
         _loc36_.armor = 0;
         _loc36_.magicArmor = 50;
         _loc36_.dodge = 0;
         _loc36_.speed = 1.2;
         _loc36_.gold = 25;
         _loc36_.cost = 1;
         _loc36_.minDamage = 28;
         _loc36_.maxDamage = 42;
         _loc36_.attackReloadTime = 1 * this.framesRate;
         _loc36_.xSoldierAdjust = 20;
         _loc36_.xAdjust = 3;
         _loc36_.yAdjust = -14;
         _loc36_.invisibleMinNodesNearExit = 40;
         _loc36_.invisibleMinHealth = 60;
         _loc36_.invisibleDuration = 8 * this.framesRate;
         this.enemies.saurianNightscale = _loc36_;
         _loc37_ = new Object();
         _loc37_.className = "EnemySaurianSavant";
         _loc37_.elite = false;
         _loc37_.size = SMALL;
         _loc37_.isFlying = false;
         _loc37_.health = 1000;
         _loc37_.armor = 0;
         _loc37_.magicArmor = 0;
         _loc37_.dodge = 0;
         _loc37_.speed = 0.6;
         _loc37_.gold = 100;
         _loc37_.cost = 1;
         _loc37_.minDamage = 34;
         _loc37_.maxDamage = 66;
         _loc37_.attackReloadTime = 1 * this.framesRate;
         _loc37_.xSoldierAdjust = 23;
         _loc37_.xAdjust = 3;
         _loc37_.yAdjust = -14;
         _loc37_.portalCooldown = 5 * this.framesRate;
         _loc37_.portalCooldownRandom = 5 * this.framesRate;
         _loc37_.portalDurationTime = 6 * this.framesRate;
         _loc37_.portalNodes = 12;
         _loc37_.portalCadence = 1 * this.framesRate;
         _loc37_.portalMaxAlive = 25;
         _loc37_.rayCoolDown = 1.5 * this.framesRate;
         _loc37_.rayRange = 230;
         _loc37_.rayMinRange = 70;
         _loc37_.rayMinDamage = 90;
         _loc37_.rayMaxDamage = 160;
         this.enemies.saurianSavant = _loc37_;
         _loc38_ = new Object();
         _loc38_.className = "EnemySaurianDarter";
         _loc38_.elite = false;
         _loc38_.size = SMALL;
         _loc38_.isFlying = false;
         _loc38_.health = 250;
         _loc38_.armor = 0;
         _loc38_.magicArmor = 0;
         _loc38_.dodge = 0;
         _loc38_.speed = 1.5;
         _loc38_.gold = 20;
         _loc38_.cost = 1;
         _loc38_.minDamage = 18;
         _loc38_.maxDamage = 22;
         _loc38_.attackReloadTime = 1 * this.framesRate;
         _loc38_.xSoldierAdjust = 20;
         _loc38_.xAdjust = 3;
         _loc38_.yAdjust = -12;
         _loc38_.teleporthCooldown = 4 * this.framesRate;
         _loc38_.teleporthCooldownRandom = 0 * this.framesRate;
         _loc38_.teleporthNodes = 20;
         _loc38_.teleporthNodesDeviation = 5;
         _loc38_.teleporthNodesCloseToEnd = 60;
         this.enemies.saurianDarter = _loc38_;
         _loc39_ = new Object();
         _loc39_.className = "EnemySaurianBrute";
         _loc39_.elite = false;
         _loc39_.size = LARGE;
         _loc39_.isFlying = false;
         _loc39_.health = 4400;
         _loc39_.armor = 0;
         _loc39_.magicArmor = 0;
         _loc39_.dodge = 0;
         _loc39_.speed = 0.6;
         _loc39_.gold = 200;
         _loc39_.cost = 5;
         _loc39_.minDamage = 60;
         _loc39_.maxDamage = 120;
         _loc39_.attackReloadTime = 1 * this.framesRate;
         _loc39_.xSoldierAdjust = 25;
         _loc39_.xAdjust = 3;
         _loc39_.yAdjust = -20;
         _loc39_.areaCooldown = 8 * this.framesRate;
         _loc39_.areaRange = 60;
         _loc39_.areaMinDamage = 80;
         _loc39_.areaMaxDamage = 120;
         this.enemies.saurianBrute = _loc39_;
         _loc40_ = new Object();
         _loc40_.className = "EnemySaurianBlazefang";
         _loc40_.elite = false;
         _loc40_.size = LARGE;
         _loc40_.isFlying = false;
         _loc40_.health = 600;
         _loc40_.armor = 0;
         _loc40_.magicArmor = 70;
         _loc40_.dodge = 0;
         _loc40_.speed = 0.8;
         _loc40_.gold = 40;
         _loc40_.cost = 2;
         _loc40_.minDamage = 18;
         _loc40_.maxDamage = 22;
         _loc40_.attackReloadTime = 1 * this.framesRate;
         _loc40_.xSoldierAdjust = 20;
         _loc40_.xAdjust = 3;
         _loc40_.yAdjust = -18;
         _loc40_.plasmaCoolDown = 1;
         _loc40_.plasmaRange = 230;
         _loc40_.plasmaMinRange = 40;
         _loc40_.plasmaMinDamage = 60;
         _loc40_.plasmaMaxDamage = 100;
         _loc40_.plasmaInstakillChance = 20;
         _loc40_.exploteRange = 120;
         _loc40_.exploteMinDamage = 100;
         _loc40_.exploteMaxDamage = 200;
         this.enemies.saurianBlazefang = _loc40_;
         _loc41_ = new Object();
         _loc41_.className = "EnemySaurianQuetzal";
         _loc41_.elite = false;
         _loc41_.size = SMALL;
         _loc41_.isFlying = true;
         _loc41_.health = 500;
         _loc41_.armor = 0;
         _loc41_.magicArmor = 0;
         _loc41_.dodge = 0;
         _loc41_.speed = 2;
         _loc41_.gold = 100;
         _loc41_.cost = 3;
         _loc41_.minDamage = 1;
         _loc41_.maxDamage = 2;
         _loc41_.attackReloadTime = 1 * this.framesRate;
         _loc41_.xSoldierAdjust = 15;
         _loc41_.xAdjust = 3;
         _loc41_.yAdjust = -45;
         _loc41_.eggsMax = 8;
         _loc41_.eggsSaurians = 1;
         _loc41_.eggsCooldownTimeMin = 1.5 * this.framesRate;
         _loc41_.eggsCooldownTimeMax = 1.5 * this.framesRate;
         this.enemies.saurianQuetzal = _loc41_;
         _loc42_ = new Object();
         _loc42_.className = "EnemySaurianRazorwing";
         _loc42_.elite = false;
         _loc42_.size = SMALL;
         _loc42_.isFlying = true;
         _loc42_.health = 100;
         _loc42_.armor = 0;
         _loc42_.magicArmor = 0;
         _loc42_.dodge = 0;
         _loc42_.speed = 1.3;
         _loc42_.gold = 10;
         _loc42_.cost = 1;
         _loc42_.minDamage = 0;
         _loc42_.maxDamage = 0;
         _loc42_.attackReloadTime = 1 * this.framesRate;
         _loc42_.xSoldierAdjust = 15;
         _loc42_.xAdjust = 3;
         _loc42_.yAdjust = -43;
         this.enemies.saurianRazorwing = _loc42_;
         _loc43_ = new Object();
         _loc43_.className = "EnemyFinalBoss";
         _loc43_.elite = false;
         _loc43_.size = LARGE;
         _loc43_.isFlying = false;
         _loc43_.health = 9999;
         _loc43_.healthNormal = 9000;
         _loc43_.healthEasy = 7000;
         _loc43_.armor = 0;
         _loc43_.magicArmor = 0;
         _loc43_.dodge = 0;
         _loc43_.speed = 0.5;
         _loc43_.gold = 0;
         _loc43_.cost = 20;
         _loc43_.xSoldierAdjust = 30;
         _loc43_.xAdjust = 3;
         _loc43_.yAdjust = -50;
         _loc43_.teleporthOnCristalCooldowns = [7,7,7,7,8,8,8,8,8,8];
         _loc43_.portalOnCristalCooldowns = [3,3,1,1,0,0,0,2,2,2];
         _loc43_.rayOnCristalCooldowns = [3,3,0,0,1.5,1.7,1.7,0,0,0];
         _loc43_.teleporthOnBattlefieldCooldowns = [6,6,6,6,8,8,8,8,8,8];
         _loc43_.portalOnBattlefieldCooldowns = [0,0,0,0,3,3,3,3,3,3];
         _loc43_.rayOnBattlefieldCooldowns = [1.7,3,3,3,0,0,0,0,0,0];
         _loc43_.deathJumpsTillNoRandom = 3;
         _loc43_.portalCadence = 0.2 * this.framesRate;
         _loc43_.portalMaxMinions = 3;
         _loc43_.portalAddMinions = 2;
         _loc43_.portalAddedMinionsPiecesLess = 5;
         _loc43_.rayAreaWidth = 1000;
         _loc43_.minDamage = 100;
         _loc43_.maxDamage = 150;
         _loc43_.attackRangeWidth = 300;
         _loc43_.attackExplodeRangeWidth = 100;
         _loc43_.attackReloadTime = 2.5 * this.framesRate;
         _loc43_.onPieceTime = 30 * this.framesRate;
         _loc43_.piecesMax = 10;
         _loc43_.piecesMintoCallBack = [7,4,2];
         _loc43_.piecesMinToJump = 2;
         _loc43_.pieceRespawnDelay = [3,0,0];
         _loc43_.tauntReload = 4 * this.framesRate;
         _loc43_.redBossTauntReload = 20 * this.framesRate;
         _loc43_.redBossCooldown = 40 * this.framesRate;
         _loc43_.redBossRange = 469;
         _loc43_.redBossMinDamage = 200;
         _loc43_.redBossMaxDamage = 400;
         _loc43_.redBossRangeDamage = 94;
         this.enemies.finalBoss = _loc43_;
         _loc44_ = new Object();
         _loc44_.className = "FinalBossPiece";
         _loc44_.elite = false;
         _loc44_.size = LARGE;
         _loc44_.isFlying = false;
         _loc44_.health = 1000;
         _loc44_.armor = 0;
         _loc44_.magicArmor = 0;
         _loc44_.dodge = 0;
         _loc44_.speed = 1;
         _loc44_.speedGoingCristal = 5.2;
         _loc44_.gold = 90;
         _loc44_.cost = 1;
         _loc44_.xSoldierAdjust = 20;
         _loc44_.xAdjust = 3;
         _loc44_.yAdjust = -17;
         _loc44_.minDamage = 30;
         _loc44_.maxDamage = 50;
         _loc44_.attackReloadTime = 2 * this.framesRate;
         this.enemies.finalBossPiece = _loc44_;
         _loc45_ = new Object();
         _loc45_.className = "EnemyFinalBossMinion";
         _loc45_.elite = false;
         _loc45_.size = LARGE;
         _loc45_.isFlying = false;
         _loc45_.health = 450;
         _loc45_.armor = 0;
         _loc45_.magicArmor = 0;
         _loc45_.dodge = 0;
         _loc45_.speed = 0.8;
         _loc45_.gold = 5;
         _loc45_.cost = 1;
         _loc45_.xSoldierAdjust = 25;
         _loc45_.xAdjust = 3;
         _loc45_.yAdjust = -18;
         _loc45_.minDamage = 120;
         _loc45_.maxDamage = 170;
         _loc45_.attackReloadTime = 2 * this.framesRate;
         this.enemies.finalBossMinion = _loc45_;
      }
      
      private function §continue if§() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         var _loc9_:* = undefined;
         var _loc10_:* = undefined;
         _loc1_ = new Object();
         _loc1_.coolDown = 25 * this.framesRate;
         _loc1_.minDamage = 1;
         _loc1_.maxDamage = 500;
         this.§true use§.lightning = _loc1_;
         _loc2_ = new Object();
         _loc2_.coolDown = 80 * this.framesRate;
         _loc2_.minDamage = 30;
         _loc2_.maxDamage = 60;
         _loc2_.远程 = 120;
         _loc2_.scorchedEarthRange = 130;
         _loc2_.scorchedEarthMinDamage = 10;
         _loc2_.scorchedEarthMaxDamage = 20;
         _loc2_.scorchedEarthDamageTime = 1 * this.framesRate;
         _loc2_.scorchedEarthDuration = 5 * this.framesRate;
         _loc2_.blazingEarthRange = 130;
         _loc2_.blazingEarthMinDamage = 20;
         _loc2_.blazingEarthMaxDamage = 30;
         _loc2_.blazingEarthDamageTime = 1 * this.framesRate;
         _loc2_.blazingEarthDuration = 10 * this.framesRate;
         this.§true use§.fireball = _loc2_;
         _loc3_ = new Object();
         _loc3_.coolDown = 10 * this.framesRate;
         _loc3_.maxSize = LARGE;
         _loc3_.maxLevel = 5;
         _loc3_.远程 = 120;
         _loc3_.health = 30;
         _loc3_.armor = 0;
         _loc3_.minDamage = 1;
         _loc3_.maxDamage = 2;
         _loc3_.reload = 1 * this.framesRate;
         _loc3_.lifeTime = 20 * this.framesRate;
         _loc3_.regen = 3;
         _loc3_.regenReload = 1 * this.framesRate;
         this.§true use§.farmers = _loc3_;
         _loc4_ = new Object();
         _loc4_.远程 = 120;
         _loc4_.health = 50;
         _loc4_.armor = 0;
         _loc4_.minDamage = 1;
         _loc4_.maxDamage = 3;
         _loc4_.reload = 1 * this.framesRate;
         _loc4_.lifeTime = 20 * this.framesRate;
         _loc4_.regen = 6;
         _loc4_.regenReload = 1 * this.framesRate;
         this.§true use§.reinforcementLevel1 = _loc4_;
         _loc5_ = new Object();
         _loc5_.coolDown = 10 * this.framesRate;
         _loc5_.maxSize = LARGE;
         _loc5_.maxLevel = 5;
         _loc5_.远程 = 120;
         _loc5_.health = 70;
         _loc5_.armor = 10;
         _loc5_.minDamage = 2;
         _loc5_.maxDamage = 4;
         _loc5_.reload = 1 * this.framesRate;
         _loc5_.lifeTime = 20 * this.framesRate;
         _loc5_.regen = 9;
         _loc5_.regenReload = 1 * this.framesRate;
         this.§true use§.reinforcementLevel2 = _loc5_;
         _loc6_ = new Object();
         _loc6_.coolDown = 10 * this.framesRate;
         _loc6_.maxSize = LARGE;
         _loc6_.maxLevel = 5;
         _loc6_.远程 = 120;
         _loc6_.health = 90;
         _loc6_.armor = 20;
         _loc6_.minDamage = 3;
         _loc6_.maxDamage = 6;
         _loc6_.reload = 1 * this.framesRate;
         _loc6_.lifeTime = 20 * this.framesRate;
         _loc6_.regen = 12;
         _loc6_.regenReload = 1 * this.framesRate;
         this.§true use§.reinforcementLevel3 = _loc6_;
         _loc7_ = new Object();
         _loc7_.coolDown = 10 * this.framesRate;
         _loc7_.maxSize = LARGE;
         _loc7_.maxLevel = 5;
         _loc7_.远程 = 120;
         _loc7_.health = 110;
         _loc7_.armor = 30;
         _loc7_.minDamage = 6;
         _loc7_.maxDamage = 10;
         _loc7_.reload = 1 * this.framesRate;
         _loc7_.lifeTime = 20 * this.framesRate;
         _loc7_.regen = 15;
         _loc7_.regenReload = 1 * this.framesRate;
         _loc7_.spearCoolDown = 1 * this.framesRate;
         _loc7_.spearRange = 270;
         _loc7_.spearMinRange = 42;
         _loc7_.spearMinDamage = 15;
         _loc7_.spearMaxDamage = 30;
         this.§true use§.reinforcementLevel4 = _loc7_;
         _loc8_ = new Object();
         _loc8_.coolDown = 20 * this.framesRate;
         _loc8_.maxSize = LARGE;
         _loc8_.maxLevel = 5;
         _loc8_.远程 = 60;
         _loc8_.health = 100;
         _loc8_.armor = 0;
         _loc8_.minDamage = 1;
         _loc8_.maxDamage = 3;
         _loc8_.reload = 1 * this.framesRate;
         _loc8_.lifeTime = 40 * this.framesRate;
         _loc8_.regen = 10;
         _loc8_.regenReload = 1 * this.framesRate;
         _loc8_.healCoolDown = 3 * this.framesRate;
         _loc8_.healRange = 260;
         _loc8_.healPoints = 15;
         this.§true use§.priest = _loc8_;
         _loc9_ = new Object();
         _loc9_.coolDown = 50 * this.framesRate;
         _loc9_.duration = 10 * this.framesRate;
         _loc9_.extraDamagePercent = 30;
         _loc9_.extraRangePercent = 0;
         this.§true use§.battleCry = _loc9_;
         _loc10_ = new Object();
         _loc10_.coolDown = 10 * this.framesRate;
         _loc10_.maxSize = LARGE;
         _loc10_.maxLevel = 5;
         _loc10_.远程 = 100;
         _loc10_.health = 200;
         _loc10_.armor = 0;
         _loc10_.minDamage = 25;
         _loc10_.maxDamage = 35;
         _loc10_.reload = 1 * this.framesRate;
         _loc10_.lifeTime = 20 * this.framesRate;
         _loc10_.regen = 10;
         _loc10_.regenReload = 1 * this.framesRate;
         this.§true use§.knights = _loc10_;
      }
      
      private function §_-Fc§() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         var _loc9_:* = undefined;
         var _loc10_:* = undefined;
         var _loc11_:* = undefined;
         var _loc12_:* = undefined;
         var _loc13_:* = undefined;
         var _loc14_:* = undefined;
         var _loc15_:* = undefined;
         var _loc16_:* = undefined;
         var _loc17_:* = undefined;
         var _loc18_:* = undefined;
         var _loc19_:* = undefined;
         var _loc20_:* = undefined;
         var _loc21_:* = undefined;
         var _loc22_:* = undefined;
         var _loc23_:* = undefined;
         var _loc24_:* = undefined;
         _loc1_ = new Object();
         _loc1_.max = 4;
         _loc1_.repairCost = 100;
         _loc1_.elfCost = 100;
         _loc1_.maxSize = LARGE;
         _loc1_.maxLevel = 5;
         _loc1_.远程 = 80;
         _loc1_.health = 200;
         _loc1_.armor = 0;
         _loc1_.minDamage = 25;
         _loc1_.maxDamage = 50;
         _loc1_.reload = 1 * this.framesRate;
         _loc1_.regen = 20;
         _loc1_.regenReload = 0.5 * this.framesRate;
         _loc1_.arrowCoolDown = 1 * this.framesRate;
         _loc1_.arrowRange = 320;
         _loc1_.arrowMinRange = 40;
         _loc1_.arrowMinDamage = 25;
         _loc1_.arrowMaxDamage = 50;
         this.§super const set§.elves = _loc1_;
         _loc2_ = new Object();
         _loc2_.maxSize = LARGE;
         _loc2_.maxLevel = 5;
         _loc2_.远程 = 120;
         _loc2_.health = 250;
         _loc2_.armor = 40;
         _loc2_.minDamage = 10;
         _loc2_.maxDamage = 30;
         _loc2_.reload = 1 * this.framesRate;
         _loc2_.regen = 25;
         _loc2_.regenReload = 1 * this.framesRate;
         this.§super const set§.imperial = _loc2_;
         _loc3_ = new Object();
         _loc3_.max = 1;
         _loc3_.cost = 500;
         _loc3_.rallyRange = 450;
         _loc3_.coolDown = 10 * this.framesRate;
         _loc3_.maxSize = LARGE;
         _loc3_.maxLevel = 5;
         _loc3_.远程 = 130;
         _loc3_.health = 2500;
         _loc3_.armor = 0;
         _loc3_.reload = 2.5 * this.framesRate;
         _loc3_.regen = 250;
         _loc3_.regenReload = 1 * this.framesRate;
         _loc3_.areaAttackRangeWidth = 70;
         _loc3_.minDamage = 50;
         _loc3_.maxDamage = 110;
         _loc3_.areaAttackMaxEnemies = 10;
         this.§super const set§.sasquash = _loc3_;
         _loc4_ = new Object();
         _loc4_.mageCost = 100;
         _loc4_.reloadTime = 22 * this.framesRate;
         _loc4_.reloadDecrease = 3 * this.framesRate;
         _loc4_.damageIncrement = 50;
         _loc4_.minDamage = 25;
         _loc4_.maxDamage = 75;
         this.§super const set§.templeTower = _loc4_;
         _loc5_ = new Object();
         _loc5_.limitLifeCondition = 299;
         this.§super const set§.graveyard = _loc5_;
         _loc6_ = new Object();
         _loc6_.spawnTime = 400 * this.framesRate;
         _loc6_.spawnAuxTime = 120 * this.framesRate;
         this.§super const set§.lavaSpawn = _loc6_;
         _loc7_ = new Object();
         _loc7_.远程 = 260;
         _loc7_.minDamage = 5;
         _loc7_.maxDamage = 10;
         _loc7_.reload = 0.7 * this.framesRate;
         this.§super const set§.cityArcher = _loc7_;
         _loc8_ = new Object();
         _loc8_.attackReloadTime = 90 * this.framesRate;
         _loc8_.attackStartEatTime = 6 * this.framesRate;
         _loc8_.attackRange = 100;
         _loc8_.attackMaxEnemies = 30;
         this.§super const set§.sandWorm = _loc8_;
         _loc9_ = new Object();
         _loc9_.maxMercenaries = 3;
         this.§super const set§.mercenaryTower = _loc9_;
         _loc10_ = new Object();
         _loc10_.cost = 75;
         _loc10_.maxSize = LARGE;
         _loc10_.maxLevel = 5;
         _loc10_.远程 = 100;
         _loc10_.health = 250;
         _loc10_.armor = 0;
         _loc10_.minDamage = 20;
         _loc10_.maxDamage = 40;
         _loc10_.reload = 1 * this.framesRate;
         _loc10_.regen = 25;
         _loc10_.regenReload = 0.5 * this.framesRate;
         this.§super const set§.legionnaire = _loc10_;
         _loc11_ = new Object();
         _loc11_.cost = 150;
         _loc11_.maxSize = LARGE;
         _loc11_.maxLevel = 5;
         _loc11_.远程 = 100;
         _loc11_.health = 350;
         _loc11_.armor = 0;
         _loc11_.minDamage = 20;
         _loc11_.maxDamage = 40;
         _loc11_.reload = 1 * this.framesRate;
         _loc11_.regen = 20;
         _loc11_.regenReload = 0.5 * this.framesRate;
         _loc11_.spellCoolDown = 15 * this.framesRate;
         _loc11_.spellRange = 140;
         this.§super const set§.djinn = _loc11_;
         _loc12_ = new Object();
         _loc12_.maxPirates = 3;
         this.§super const set§.pirateTower = _loc12_;
         _loc13_ = new Object();
         _loc13_.cost = 75;
         _loc13_.maxSize = LARGE;
         _loc13_.maxLevel = 5;
         _loc13_.远程 = 100;
         _loc13_.health = 250;
         _loc13_.armor = 0;
         _loc13_.minDamage = 15;
         _loc13_.maxDamage = 30;
         _loc13_.reload = 1 * this.framesRate;
         _loc13_.regen = 20;
         _loc13_.regenReload = 0.5 * this.framesRate;
         _loc13_.peakChance = 30;
         _loc13_.peakStealMin = 2;
         _loc13_.peakStealMax = 6;
         this.§super const set§.pirateCap = _loc13_;
         _loc14_ = new Object();
         _loc14_.cost = 150;
         _loc14_.maxSize = LARGE;
         _loc14_.maxLevel = 5;
         _loc14_.远程 = 100;
         _loc14_.health = 125;
         _loc14_.armor = 0;
         _loc14_.minDamage = 15;
         _loc14_.maxDamage = 30;
         _loc14_.reload = 1 * this.framesRate;
         _loc14_.regen = 20;
         _loc14_.regenReload = 0.5 * this.framesRate;
         _loc14_.molotovCoolDown = 1 * this.framesRate;
         _loc14_.molotovRange = 260;
         _loc14_.molotovMinRange = 40;
         _loc14_.molotovMinDamage = 10;
         _loc14_.molotovMaxDamage = 30;
         _loc14_.molotovArea = 50;
         this.§super const set§.pirateFlamer = _loc14_;
         _loc15_ = new Object();
         _loc15_.oneCannonShoot = 25;
         _loc15_.twoCannonShoot = 45;
         _loc15_.threeCannonShoot = 60;
         _loc15_.area = 50;
         _loc15_.minDamage = 60;
         _loc15_.maxDamage = 120;
         this.§super const set§.pirateCamp = _loc15_;
         _loc16_ = new Object();
         _loc16_.eatTime = 40 * this.framesRate;
         this.§super const set§.carnivorousPlant = _loc16_;
         _loc17_ = new Object();
         _loc17_.aliensCont = 3;
         _loc17_.timers = [[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[12,0,0,1,1,1],[25,0,0,1,1,1],[25,0,0,1,1,1],[25,0,0,1,1,4],[25,1,1,1,1,4],[25,1,1,0,0,5],[25,0,0,1,2,5],[30,1,2,0,0,6],[30,1,1,1,2,10],[15,1,2,1,2,15],[15,1,2,1,2,15],[0,0,0,0,0,0]];
         this.§super const set§.alienSpawner = _loc17_;
         _loc18_ = new Object();
         _loc18_.maxAmazonas = 3;
         this.§super const set§.amazonasTower = _loc18_;
         _loc19_ = new Object();
         _loc19_.cost = 75;
         _loc19_.maxSize = LARGE;
         _loc19_.maxLevel = 5;
         _loc19_.远程 = 100;
         _loc19_.health = 300;
         _loc19_.armor = 0;
         _loc19_.minDamage = 14;
         _loc19_.maxDamage = 36;
         _loc19_.reload = 1 * this.framesRate;
         _loc19_.regen = 30;
         _loc19_.regenReload = 0.5 * this.framesRate;
         _loc19_.whirlingChance = 25;
         _loc19_.whirlingRange = 90;
         _loc19_.whirlingMinDamage = 14;
         _loc19_.whirlingMaxDamage = 36;
         _loc19_.healPoints = 50;
         this.§super const set§.amazonaWarrior = _loc19_;
         _loc20_ = new Object();
         _loc20_.minDamage = 100;
         _loc20_.maxDamage = 200;
         _loc20_.minReload = 10 * this.framesRate;
         _loc20_.maxReload = 20 * this.framesRate;
         this.§super const set§.tusken = _loc20_;
         _loc21_ = new Object();
         _loc21_.area = 70;
         _loc21_.minDamage = 50;
         _loc21_.maxDamage = 100;
         _loc21_.minReload = 40 * this.framesRate;
         _loc21_.maxReload = 60 * this.framesRate;
         this.§super const set§.enemyCannons = _loc21_;
         _loc22_ = new Object();
         _loc22_.cost = 70;
         _loc22_.maxSize = MEDIUM;
         _loc22_.maxLevel = 5;
         _loc22_.rangeRally = 280;
         _loc22_.远程 = 100;
         _loc22_.health = 220 * this.ModifSoldierHealth;
         _loc22_.armor = 20;
         _loc22_.minDamage = 12;
         _loc22_.maxDamage = 18;
         _loc22_.reload = 1 * this.framesRate;
         _loc22_.respawn = 15 * this.framesRate;
         _loc22_.regen = 22;
         _loc22_.regenReload = 1 * this.framesRate;
         _loc22_.hammerCost = 200;
         _loc22_.hammerCostLevel = 100;
         _loc22_.hammerDamageIncrement = 5;
         _loc22_.hammerLevels = 3;
         _loc22_.armorCost = 250;
         _loc22_.armorCostLevel = 100;
         _loc22_.armorArmor = [25,50];
         _loc22_.armorLevels = 2;
         _loc22_.beerCost = 250;
         _loc22_.beerCostLevel = 150;
         _loc22_.beerHealthRegeneration = 2;
         _loc22_.beerHealthRegenerationTrigger = 0.1;
         _loc22_.beerHealthCoolDown = 10 * this.framesRate;
         _loc22_.beerHealthRegenerationDuration = [3 * this.framesRate,5 * this.framesRate,7 * this.framesRate];
         _loc22_.beerLevels = 3;
         this.§super const set§.dwarfHall = _loc22_;
         _loc23_ = new Object();
         _loc23_.cost = 230;
         _loc23_.远程 = 340;
         _loc23_.minDamage = 35;
         _loc23_.maxDamage = 65;
         _loc23_.reload = 1.5 * this.framesRate;
         _loc23_.barrelCost = 250;
         _loc23_.barrelCostLevel = 150;
         _loc23_.barrelReloadTime = 10 * this.framesRate;
         _loc23_.barrelMinDamage = [60,80,100];
         _loc23_.barrelMaxDamage = [100,160,220];
         _loc23_.barrelRange = [130,140,150];
         _loc23_.barrelArea = 70;
         _loc23_.barrelLevels = 3;
         _loc23_.damageCost = 300;
         _loc23_.damageCostLevel = 150;
         _loc23_.damageIncrement = 30;
         _loc23_.damageLevels = 3;
         this.§super const set§.dwarfRiflemen = _loc23_;
         _loc24_ = new Object();
         _loc24_.repairCost = 100;
         _loc24_.repairCostUnderground = 200;
         this.§super const set§.towerHolderLocked = _loc24_;
      }
      
      private function §for import§() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         if(this.game.gameUpgrades.§while default§(GameUpgrades.FRONTIERS_IMPROVED_AIM,this.§finally const try§))
         {
            _loc2_ = 0.1;
            this.archers.level1.远程 += Math.ceil(this.archers.level1.远程 * _loc2_);
            this.archers.level2.远程 += Math.ceil(this.archers.level2.远程 * _loc2_);
            this.archers.level3.远程 += Math.ceil(this.archers.level3.远程 * _loc2_);
            this.archers.totem.远程 += Math.ceil(this.archers.totem.远程 * _loc2_);
            this.archers.crossbow.远程 += Math.ceil(this.archers.crossbow.远程 * _loc2_);
         }
         if(this.game.gameUpgrades.§while default§(GameUpgrades.FRONTIERS_LUMBERMILL,this.§finally const try§))
         {
            _loc3_ = 10;
            this.archers.level1.cost -= _loc3_;
            this.archers.level2.cost -= _loc3_;
            this.archers.level3.cost -= _loc3_;
         }
         if(this.game.gameUpgrades.§while default§(GameUpgrades.FRONTIERS_FOCUSED_AIM,this.§finally const try§))
         {
            _loc4_ = 0.05;
            this.archers.level1.minDamage += Math.ceil(this.archers.level1.minDamage * _loc4_);
            this.archers.level1.maxDamage += Math.ceil(this.archers.level1.maxDamage * _loc4_);
            this.archers.level2.minDamage += Math.ceil(this.archers.level2.minDamage * _loc4_);
            this.archers.level2.maxDamage += Math.ceil(this.archers.level2.maxDamage * _loc4_);
            this.archers.level3.minDamage += Math.ceil(this.archers.level3.minDamage * _loc4_);
            this.archers.level3.maxDamage += Math.ceil(this.archers.level3.maxDamage * _loc4_);
            this.archers.totem.minDamage += Math.ceil(this.archers.totem.minDamage * _loc4_);
            this.archers.totem.maxDamage += Math.ceil(this.archers.totem.maxDamage * _loc4_);
            this.archers.crossbow.minDamage += Math.ceil(this.archers.crossbow.minDamage * _loc4_);
            this.archers.crossbow.maxDamage += Math.ceil(this.archers.crossbow.maxDamage * _loc4_);
         }
         if(this.game.gameUpgrades.§while default§(GameUpgrades.FRONTIERS_MASTER_MARKMANSHIP,this.§finally const try§))
         {
            _loc5_ = 0.05;
            _loc6_ = 0.1;
            this.archers.level1.远程 += Math.ceil(this.archers.level1.远程 * _loc5_);
            this.archers.level2.远程 += Math.ceil(this.archers.level2.远程 * _loc5_);
            this.archers.level3.远程 += Math.ceil(this.archers.level3.远程 * _loc5_);
            this.archers.totem.远程 += Math.ceil(this.archers.totem.远程 * _loc5_);
            this.archers.crossbow.远程 += Math.ceil(this.archers.crossbow.远程 * _loc5_);
            this.archers.level1.minDamage += Math.ceil(this.archers.level1.minDamage * _loc6_);
            this.archers.level1.maxDamage += Math.ceil(this.archers.level1.maxDamage * _loc6_);
            this.archers.level2.minDamage += Math.ceil(this.archers.level2.minDamage * _loc6_);
            this.archers.level2.maxDamage += Math.ceil(this.archers.level2.maxDamage * _loc6_);
            this.archers.level3.minDamage += Math.ceil(this.archers.level3.minDamage * _loc6_);
            this.archers.level3.maxDamage += Math.ceil(this.archers.level3.maxDamage * _loc6_);
            this.archers.totem.minDamage += Math.ceil(this.archers.totem.minDamage * _loc6_);
            this.archers.totem.maxDamage += Math.ceil(this.archers.totem.maxDamage * _loc6_);
            this.archers.crossbow.minDamage += Math.ceil(this.archers.crossbow.minDamage * _loc6_);
            this.archers.crossbow.maxDamage += Math.ceil(this.archers.crossbow.maxDamage * _loc6_);
         }
         _loc1_ = 10;
         if(this.game.gameUpgrades.§while default§(GameUpgrades.FRONTIERS_DEFENSIVE_TECHNIQUES,this.§finally const try§))
         {
            this.§_-tz§.level1.armor += _loc1_;
            this.§_-tz§.level2.armor += _loc1_;
            this.§_-tz§.level3.armor += _loc1_;
            this.§_-tz§.templar.armor += _loc1_;
            this.§_-tz§.assassin.armor += _loc1_;
         }
         if(this.game.gameUpgrades.§while default§(GameUpgrades.FRONTIERS_BOOT_CAMP,this.§finally const try§))
         {
            _loc7_ = 0.1;
            this.§_-tz§.level1.health += Math.ceil(this.§_-tz§.level1.health * _loc7_);
            this.§_-tz§.level2.health += Math.ceil(this.§_-tz§.level2.health * _loc7_);
            this.§_-tz§.level3.health += Math.ceil(this.§_-tz§.level3.health * _loc7_);
            this.§_-tz§.templar.health += Math.ceil(this.§_-tz§.templar.health * _loc7_);
            this.§_-tz§.assassin.health += Math.ceil(this.§_-tz§.assassin.health * _loc7_);
         }
         if(this.game.gameUpgrades.§while default§(GameUpgrades.FRONTIERS_ESPRIT_DE_CORPS,this.§finally const try§))
         {
            _loc8_ = 0.2;
            _loc9_ = 0.2;
            this.§_-tz§.level1.regen += Math.ceil(this.§_-tz§.level1.regen * _loc8_);
            this.§_-tz§.level2.regen += Math.ceil(this.§_-tz§.level2.regen * _loc8_);
            this.§_-tz§.level3.regen += Math.ceil(this.§_-tz§.level3.regen * _loc8_);
            this.§_-tz§.templar.regen += Math.ceil(this.§_-tz§.templar.regen * _loc8_);
            this.§_-tz§.assassin.regen += Math.ceil(this.§_-tz§.assassin.regen * _loc8_);
            this.§_-tz§.level1.rangeRally += Math.ceil(this.§_-tz§.level1.rangeRally * _loc9_);
            this.§_-tz§.level2.rangeRally += Math.ceil(this.§_-tz§.level2.rangeRally * _loc9_);
            this.§_-tz§.level3.rangeRally += Math.ceil(this.§_-tz§.level3.rangeRally * _loc9_);
            this.§_-tz§.templar.rangeRally += Math.ceil(this.§_-tz§.templar.rangeRally * _loc9_);
            this.§_-tz§.assassin.rangeRally += Math.ceil(this.§_-tz§.assassin.rangeRally * _loc9_);
         }
         if(this.game.gameUpgrades.§while default§(GameUpgrades.FRONTIERS_VETERAN_SQUAD,this.§finally const try§))
         {
            _loc10_ = 2 * this.framesRate;
            this.§_-tz§.level1.armor += _loc1_;
            this.§_-tz§.level2.armor += _loc1_;
            this.§_-tz§.level3.armor += _loc1_;
            this.§_-tz§.templar.armor += _loc1_;
            this.§_-tz§.assassin.armor += _loc1_;
            this.§_-tz§.level1.respawn -= _loc10_;
            this.§_-tz§.level2.respawn -= _loc10_;
            this.§_-tz§.level3.respawn -= _loc10_;
            this.§_-tz§.templar.respawn -= _loc10_;
            this.§_-tz§.assassin.respawn -= _loc10_;
         }
         if(this.game.gameUpgrades.§while default§(GameUpgrades.FRONTIERS_ELDRITCH_POWER,this.§finally const try§))
         {
            _loc11_ = 0.1;
            this.mages.level1.minDamage += Math.ceil(this.mages.level1.minDamage * _loc11_);
            this.mages.level1.maxDamage += Math.ceil(this.mages.level1.maxDamage * _loc11_);
            this.mages.level2.minDamage += Math.ceil(this.mages.level2.minDamage * _loc11_);
            this.mages.level2.maxDamage += Math.ceil(this.mages.level2.maxDamage * _loc11_);
            this.mages.level3.minDamage += Math.ceil(this.mages.level3.minDamage * _loc11_);
            this.mages.level3.maxDamage += Math.ceil(this.mages.level3.maxDamage * _loc11_);
            this.mages.archmage.minDamage += Math.ceil(this.mages.archmage.minDamage * _loc11_);
            this.mages.archmage.maxDamage += Math.ceil(this.mages.archmage.maxDamage * _loc11_);
            this.mages.necromancer.minDamage += Math.ceil(this.mages.necromancer.minDamage * _loc11_);
            this.mages.necromancer.maxDamage += Math.ceil(this.mages.necromancer.maxDamage * _loc11_);
         }
         if(this.game.gameUpgrades.§while default§(GameUpgrades.FRONTIERS_RUNE_OF_POWER,this.§finally const try§))
         {
            _loc12_ = 0.1;
            this.mages.level1.远程 += Math.ceil(this.mages.level1.远程 * _loc12_);
            this.mages.level2.远程 += Math.ceil(this.mages.level2.远程 * _loc12_);
            this.mages.level3.远程 += Math.ceil(this.mages.level3.远程 * _loc12_);
            this.mages.archmage.远程 += Math.ceil(this.mages.archmage.远程 * _loc12_);
            this.mages.necromancer.远程 += Math.ceil(this.mages.necromancer.远程 * _loc12_);
         }
         if(this.game.gameUpgrades.§while default§(GameUpgrades.FRONTIERS_WIZARD_ACADEMY,this.§finally const try§))
         {
            _loc13_ = 0.1;
            this.mages.archmage.explosionCost -= Math.ceil(this.mages.archmage.explosionCost * _loc13_);
            this.mages.archmage.explosionCostLevel -= Math.ceil(this.mages.archmage.explosionCostLevel * _loc13_);
            this.mages.archmage.twisterCost -= Math.ceil(this.mages.archmage.twisterCost * _loc13_);
            this.mages.archmage.twisterCostLevel -= Math.ceil(this.mages.archmage.twisterCostLevel * _loc13_);
            this.mages.necromancer.pestilenceCost -= Math.ceil(this.mages.necromancer.pestilenceCost * _loc13_);
            this.mages.necromancer.pestilenceCostLevel -= Math.ceil(this.mages.necromancer.pestilenceCostLevel * _loc13_);
            this.mages.necromancer.deathRiderCost -= Math.ceil(this.mages.necromancer.deathRiderCost * _loc13_);
            this.mages.necromancer.deathRiderCostLevel -= Math.ceil(this.mages.necromancer.deathRiderCostLevel * _loc13_);
         }
         if(this.game.gameUpgrades.§while default§(GameUpgrades.FRONTIERS_SMOOTHBORE,this.§finally const try§))
         {
            _loc14_ = 0.1;
            this.engineers.level1.远程 += Math.ceil(this.engineers.level1.远程 * _loc14_);
            this.engineers.level2.远程 += Math.ceil(this.engineers.level2.远程 * _loc14_);
            this.engineers.level3.远程 += Math.ceil(this.engineers.level3.远程 * _loc14_);
            this.engineers.mech.远程 += Math.ceil(this.engineers.mech.远程 * _loc14_);
            this.engineers.dwaarp.远程 += Math.ceil(this.engineers.dwaarp.远程 * _loc14_);
         }
         if(this.game.gameUpgrades.§while default§(GameUpgrades.FRONTIERS_IMPROVED_ORDNANCE,this.§finally const try§))
         {
            _loc15_ = 0.1;
            this.engineers.level1.minDamage += Math.ceil(this.engineers.level1.minDamage * _loc15_);
            this.engineers.level1.maxDamage += Math.ceil(this.engineers.level1.maxDamage * _loc15_);
            this.engineers.level2.minDamage += Math.ceil(this.engineers.level2.minDamage * _loc15_);
            this.engineers.level2.maxDamage += Math.ceil(this.engineers.level2.maxDamage * _loc15_);
            this.engineers.level3.minDamage += Math.ceil(this.engineers.level3.minDamage * _loc15_);
            this.engineers.level3.maxDamage += Math.ceil(this.engineers.level3.maxDamage * _loc15_);
            this.engineers.mech.minDamage += Math.ceil(this.engineers.mech.minDamage * _loc15_);
            this.engineers.mech.maxDamage += Math.ceil(this.engineers.mech.maxDamage * _loc15_);
            this.engineers.dwaarp.minDamage += Math.ceil(this.engineers.dwaarp.minDamage * _loc15_);
            this.engineers.dwaarp.maxDamage += Math.ceil(this.engineers.dwaarp.maxDamage * _loc15_);
         }
         if(this.game.gameUpgrades.§while default§(GameUpgrades.FRONTIERS_GNOMISH_TINKERING,this.§finally const try§))
         {
            _loc16_ = 0.1;
            this.engineers.mech.missilesCoolDown -= Math.ceil(this.engineers.mech.missilesCoolDown * _loc16_);
            this.engineers.mech.oilCoolDown -= Math.ceil(this.engineers.mech.oilCoolDown * _loc16_);
            this.engineers.dwaarp.drillCoolDown -= Math.ceil(this.engineers.dwaarp.drillCoolDown * _loc16_);
            this.engineers.dwaarp.lavaCoolDown -= Math.ceil(this.engineers.dwaarp.lavaCoolDown * _loc16_);
         }
         if(this.game.gameUpgrades.§while default§(GameUpgrades.FRONTIERS_BURNING_SKIES,this.§finally const try§))
         {
            this.§true use§.fireball.minDamage += 20;
            this.§true use§.fireball.maxDamage += 20;
            this.§true use§.fireball.coolDown -= 5 * this.framesRate;
         }
         if(this.game.gameUpgrades.§while default§(GameUpgrades.FRONTIERS_FIRE_AND_BRIMSTONE,this.§finally const try§))
         {
            this.§true use§.fireball.coolDown -= 5 * this.framesRate;
         }
         if(this.game.gameUpgrades.§while default§(GameUpgrades.FRONTIERS_CONFLAGRATION,this.§finally const try§))
         {
            this.§true use§.fireball.远程 += this.§true use§.fireball.远程 * 0.25;
            this.§true use§.fireball.minDamage += 40;
            this.§true use§.fireball.maxDamage += 40;
         }
         if(this.game.gameUpgrades.§while default§(GameUpgrades.FRONTIERS_ARMAGGEDON,this.§finally const try§))
         {
            this.§true use§.fireball.minDamage += 60;
            this.§true use§.fireball.maxDamage += 60;
         }
         if(this.game.gameUpgrades.reinforcementLevel == 1)
         {
            this.§true use§.farmers.远程 = this.§true use§.reinforcementLevel1.远程;
            this.§true use§.farmers.health = this.§true use§.reinforcementLevel1.health;
            this.§true use§.farmers.armor = this.§true use§.reinforcementLevel1.armor;
            this.§true use§.farmers.minDamage = this.§true use§.reinforcementLevel1.minDamage;
            this.§true use§.farmers.maxDamage = this.§true use§.reinforcementLevel1.maxDamage;
            this.§true use§.farmers.reload = this.§true use§.reinforcementLevel1.reload;
            this.§true use§.farmers.lifeTime = this.§true use§.reinforcementLevel1.lifeTime;
            this.§true use§.farmers.regen = this.§true use§.reinforcementLevel1.regen;
            this.§true use§.farmers.regenReload = this.§true use§.reinforcementLevel1.regenReload;
         }
      }
      
      public function getArmorString(param1:Number) : String
      {
         if(param1 == 0)
         {
            return Locale.loadStringEx("C_ARMOR_0",Locale.getDefaultLang());
         }
         if(param1 >= 1 && param1 <= 30)
         {
            return Locale.loadStringEx("C_ARMOR_1",Locale.getDefaultLang());
         }
         if(param1 >= 31 && param1 <= 60)
         {
            return Locale.loadStringEx("C_ARMOR_2",Locale.getDefaultLang());
         }
         if(param1 >= 61 && param1 <= 90)
         {
            return Locale.loadStringEx("C_ARMOR_3",Locale.getDefaultLang());
         }
         if(param1 >= 90)
         {
            return Locale.loadStringEx("C_ARMOR_4",Locale.getDefaultLang());
         }
         return "";
      }
      
      public function §if const switch§(param1:Number) : String
      {
         if(param1 >= 0 && param1 <= 0.7)
         {
            return Locale.loadStringEx("C_SPEED_0",Locale.getDefaultLang());
         }
         if(param1 > 0.7 && param1 < 1.5)
         {
            return Locale.loadStringEx("C_SPEED_1",Locale.getDefaultLang());
         }
         if(param1 >= 1.5)
         {
            return Locale.loadStringEx("C_SPEED_2",Locale.getDefaultLang());
         }
         return "";
      }
      
      public function getReloadString(param1:Number) : String
      {
         if(param1 >= 0 && param1 < 0.5)
         {
            return Locale.loadStringEx("C_RELOAD_4",Locale.getDefaultLang());
         }
         if(param1 >= 0.5 && param1 < 0.8)
         {
            return Locale.loadStringEx("C_RELOAD_3",Locale.getDefaultLang());
         }
         if(param1 >= 0.8 && param1 < 1.5)
         {
            return Locale.loadStringEx("C_RELOAD_2",Locale.getDefaultLang());
         }
         if(param1 >= 1.5 && param1 < 2)
         {
            return Locale.loadStringEx("C_RELOAD_1",Locale.getDefaultLang());
         }
         if(param1 >= 2)
         {
            return Locale.loadStringEx("C_RELOAD_0",Locale.getDefaultLang());
         }
         return "";
      }
      
      public function getRangeString(param1:Number) : String
      {
         if(param1 >= 0 && param1 < 250)
         {
            return Locale.loadStringEx("C_RANGE_0",Locale.getDefaultLang());
         }
         if(param1 >= 250 && param1 < 280)
         {
            return Locale.loadStringEx("C_RANGE_1",Locale.getDefaultLang());
         }
         if(param1 >= 280 && param1 < 310)
         {
            return Locale.loadStringEx("C_RANGE_2",Locale.getDefaultLang());
         }
         if(param1 >= 310 && param1 < 360)
         {
            return Locale.loadStringEx("C_RANGE_3",Locale.getDefaultLang());
         }
         if(param1 >= 360)
         {
            return Locale.loadStringEx("C_RANGE_4",Locale.getDefaultLang());
         }
         return "";
      }
      
      private function §_-yH§() : void
      {
         var _loc1_:Object = null;
         var _loc2_:Object = null;
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:Array = null;
         var _loc6_:Array = null;
         var _loc7_:Array = null;
         var _loc8_:Array = null;
         var _loc9_:* = undefined;
         var _loc11_:* = undefined;
         var _loc12_:* = undefined;
         var _loc13_:* = undefined;
         var _loc14_:* = undefined;
         var _loc15_:* = undefined;
         var _loc16_:* = undefined;
         var _loc17_:* = undefined;
         var _loc18_:* = undefined;
         var _loc19_:* = undefined;
         var _loc20_:* = undefined;
         var _loc21_:* = undefined;
         var _loc22_:* = undefined;
         var _loc23_:* = undefined;
         var _loc24_:* = undefined;
         var _loc25_:* = undefined;
         var _loc26_:* = undefined;
         var _loc27_:* = undefined;
         var _loc28_:* = undefined;
         var _loc29_:* = undefined;
         var _loc30_:* = undefined;
         var _loc31_:* = undefined;
         var _loc32_:* = undefined;
         var _loc33_:* = undefined;
         var _loc34_:* = undefined;
         var _loc35_:* = undefined;
         var _loc36_:* = undefined;
         var _loc37_:* = undefined;
         var _loc38_:* = undefined;
         var _loc39_:* = undefined;
         var _loc40_:* = undefined;
         var _loc41_:* = undefined;
         var _loc42_:* = undefined;
         var _loc43_:* = undefined;
         var _loc44_:* = undefined;
         var _loc45_:* = undefined;
         var _loc46_:* = undefined;
         var _loc47_:* = undefined;
         var _loc48_:* = undefined;
         var _loc49_:* = undefined;
         var _loc50_:* = undefined;
         var _loc51_:* = undefined;
         var _loc52_:* = undefined;
         var _loc53_:* = undefined;
         var _loc54_:* = undefined;
         var _loc55_:* = undefined;
         var _loc56_:* = undefined;
         var _loc57_:* = undefined;
         var _loc58_:* = undefined;
         var _loc59_:* = undefined;
         _loc1_ = new Object();
         _loc2_ = new Object();
         _loc3_ = [0,1300,5300,11300,19300,31800,46800,64300,88300,115300];
         _loc4_ = [1,1,2,2,3,4,5,5,6,7,8,9,9,10,10,10,10,10,10,10,10];
         _loc5_ = [1,2];
         _loc6_ = [0.5,0.25];
         _loc7_ = [2.2,1.9,1.9,1];
         _loc8_ = [0,3,6,10,13,16,20,23,26,30];
         _loc1_.common_tables = _loc2_;
         _loc2_.master_xp = _loc3_;
         _loc2_.hero_stage_level = _loc4_;
         _loc2_.hero_multipliers_bottom = _loc5_;
         _loc2_.hero_multipliers_top = _loc6_;
         _loc2_.hero_multiplier_per_mode = _loc7_;
         _loc2_.heroPointsPerLevel = _loc8_;
         _loc2_.heroBattlePointsNeededTime = 1;
         _loc2_.heroBattlePointsInTime = 1;
         _loc2_.heroBattlePointsForXp = 5;
         _loc2_.heroBattlePointsXp = 20;
         _loc2_.heroBattlePointsNearRange = 200 / 1.28;
         this.heroes.heroesSavageMasterTable = _loc1_;
         _loc9_ = new Object();
         _loc9_.masterXp = [0,300,900,2000,4000,8000,12000,16000,20000,26000];
         this.heroes.masterTable = _loc9_;
         var _loc10_:* = [0,3,6,10,13,16,20,23,26,30];
         _loc11_ = new Object();
         _loc11_.health = [245,260,275,290,305,320,335,350,365,380];
         _loc11_.regen = [25,26,28,29,31,32,34,35,37,38];
         _loc11_.armor = [20,25,30,35,40,45,50,55,60,65];
         _loc11_.minDamage = [6,7,8,9,10,11,12,13,14,15];
         _loc11_.maxDamage = [10,12,14,16,18,20,22,24,26,28];
         _loc11_.size = LARGE;
         _loc11_.maxLevel = 5;
         _loc11_.reload = 1 * this.framesRate;
         _loc11_.远程 = 130;
         _loc11_.regenReload = 1 * this.framesRate;
         _loc11_.respawn = 20 * this.framesRate;
         _loc11_.xpMultiplier = 1 * 0.95;
         _loc11_.flurryXpMultiplier = 25;
         _loc11_.sandWarriorXpMultiplier = 35;
         _loc11_.swordsmanshipExtraDamage = [2,6,12];
         _loc11_.spikedArmorDamage = [10,30,60];
         _loc11_.toughnessHealthPoints = [30,90,180];
         _loc11_.toughnessRegenPointsIncrement = [6,18,36];
         _loc11_.flurryCost = 2;
         _loc11_.flurryCooldown = 6 * this.framesRate;
         _loc11_.flurryTimeAttack = 0;
         _loc11_.flurryTimeAttackIncrements = 2;
         _loc11_.sandWarriorCost = 1;
         _loc11_.sandWarriorCooldown = 10 * this.framesRate;
         _loc11_.sandWarriorWarriors = 0;
         _loc11_.sandWarriorWarriorsIncrement = 1;
         _loc11_.sandWarriorLife = 6 * this.framesRate;
         _loc11_.sandWarriorLifeIncrement = 0 * this.framesRate;
         _loc11_.sandWarriorSize = LARGE;
         _loc11_.sandWarriorMaxLevel = 5;
         _loc11_.sandWarriorRangeRally = 100;
         _loc11_.sandWarriorRange = 100;
         _loc11_.sandWarriorHealth = [60,100,140];
         _loc11_.sandWarriorArmor = 0;
         _loc11_.sandWarriorMinDamage = 2;
         _loc11_.sandWarriorMaxDamage = 6;
         _loc11_.sandWarriorDamageIncrement = 0;
         _loc11_.sandWarriorReload = 1 * this.framesRate;
         _loc11_.sandWarriorRespawn = 10 * this.framesRate;
         _loc11_.sandWarriorRegen = 0;
         _loc11_.sandWarriorRegenReload = 1 * this.framesRate;
         _loc11_.stat_health = 8;
         _loc11_.stat_attack = 6;
         _loc11_.stat_range = 0;
         _loc11_.stat_speed = 5;
         _loc11_.localized = "HERO_ALRIC";
         _loc11_.portrait = "0001";
         _loc11_.betterArmorLevel = 0;
         _loc11_.toughnessLevel = 0;
         _loc11_.flurryLevel = 0;
         _loc11_.sandWarriorLevel = 0;
         this.heroes.heroAlric = _loc11_;
         _loc12_ = new Object();
         _loc12_.health = 420;
         _loc12_.regen = 42;
         _loc12_.armor = 70;
         _loc12_.minDamage = 10;
         _loc12_.maxDamage = 30;
         _loc12_.size = LARGE;
         _loc12_.maxLevel = 5;
         _loc12_.reload = 1 * this.framesRate;
         _loc12_.远程 = 130;
         _loc12_.regenReload = 1 * this.framesRate;
         _loc12_.respawn = 35 * this.framesRate;
         _loc12_.localized = "HERO_DWARF";
         _loc12_.portrait = "0010";
         _loc12_.hammerCoolDown = 8 * this.framesRate;
         _loc12_.hammerMinDamage = 60;
         _loc12_.hammerMaxDamage = 120;
         _loc12_.hammerRange = 120;
         this.heroes.heroDwarf = _loc12_;
         _loc13_ = new Object();
         _loc13_.portrait = "0002";
         _loc13_.health = [165,180,195,210,225,240,255,270,285,300];
         _loc13_.regen = [21,23,24,26,28,30,32,34,36,38];
         _loc13_.armor = [0,0,0,0,0,0,0,0,0,0];
         _loc13_.minDamage = [5,6,7,8,9,10,11,12,12,13];
         _loc13_.maxDamage = [7,9,10,12,13,14,16,17,19,20];
         _loc13_.minRangeDamage = [5,6,7,8,9,10,11,12,12,13];
         _loc13_.maxRangeDamage = [7,9,10,12,13,14,16,17,19,20];
         _loc13_.rangeShootRangeWidth = 280 / 1.28;
         _loc13_.rangeShootReloadTime = 0.6;
         _loc13_.rangeShootMinDistance = 50 / 1.28;
         _loc13_.size = LARGE;
         _loc13_.maxLevel = 5;
         _loc13_.reload = 1;
         _loc13_.远程 = 80;
         _loc13_.regenReload = 1;
         _loc13_.respawn = 15 * this.framesRate;
         _loc13_.xpMultiplier = 1;
         _loc13_.shadowRange = 100;
         _loc13_.shadowHealth = 60;
         _loc13_.shadowArmor = 0;
         _loc13_.shadowMinDamage = 0;
         _loc13_.shadowMaxDamage = 0;
         _loc13_.shadowReload = 1;
         _loc13_.shadowLifeTime = 1;
         _loc13_.shadowRegen = 0;
         _loc13_.shadowRegenReload = 0;
         _loc13_.precisionExtraDamage = [0,0,0];
         _loc13_.precisionExtraRange = [28 / 1.28,56 / 1.28,84 / 1.28];
         _loc13_.shadowDodgeIncrement = [20,40,60];
         _loc13_.swiftnessSpeedIncrement = [20,40,60];
         _loc13_.ShadowDanceCooldown = 10;
         _loc13_.shadowDanceCopies = [2,3,4];
         _loc13_.shadowDanceRange = 250 / 1.28;
         _loc13_.shadowDanceMinRange = 80 / 1.28;
         _loc13_.shadowDanceDamage = 16;
         _loc13_.shadowDanceDamageIncrement = 8;
         _loc13_.lethalCooldown = 15;
         _loc13_.lethalRange = 260 / 1.28;
         _loc13_.lethalDamage = 60;
         _loc13_.lethalInstakillPercent = [6,12,18];
         _loc13_.meleeAttackXpMultiplier = 1 * 0.66;
         _loc13_.rangeAttackXpMultiplier = 1 * 0.66;
         _loc13_.shadowDanceXpMultiplier = 35;
         _loc13_.lethalStrikeXpMultiplier = 75;
         this.heroes.heroMirage = _loc13_;
         _loc14_ = new Object();
         _loc14_.portrait = "0003";
         _loc14_.health = [280,310,340,370,400,430,460,490,520,550];
         _loc14_.regen = [23,26,28,31,33,36,38,41,43,46];
         _loc14_.armor = [0,0,0,0,0,0,0,0];
         _loc14_.minDamage = [8,9,10,10,11,12,13,14,14,15];
         _loc14_.maxDamage = [12,13,14,16,17,18,19,20,22,23];
         _loc14_.reload = 1;
         _loc14_.远程 = 150;
         _loc14_.regenReload = 1;
         _loc14_.respawn = 20 * this.framesRate;
         _loc14_.xpMultiplier = 1;
         _loc15_ = new Object();
         _loc15_.factor = [1,1,3];
         _loc15_.boarsFactor = [0,0,0];
         _loc15_.cooldown = [10,5,10];
         _loc14_.regenerationSkill = _loc15_;
         _loc16_ = new Object();
         _loc16_.damages = [14,26,36];
         _loc16_.bleedDamage = [12,36,72];
         _loc16_.bleedDuration = [6,6,6];
         _loc16_.cooldown = [8,8,8];
         _loc14_.deeplashesSkill = _loc16_;
         _loc17_ = new Object();
         _loc17_.boars = [1,2,2];
         _loc17_.cooldown = [18,18,18];
         _loc14_.boarmasterSkill = _loc17_;
         _loc18_ = new Object();
         _loc18_.health = [160,160,240];
         _loc18_.远程 = [170 / 1.28,170 / 1.28,170 / 1.28];
         _loc18_.armor = [0,0,0];
         _loc18_.attackReloadTime = 2;
         _loc18_.regenerateHealth = 10;
         _loc18_.regenerateReloadTime = 1;
         _loc18_.minDamage = [2,2,2];
         _loc18_.maxDamage = [8,8,8];
         _loc14_.wildBoar = _loc18_;
         _loc19_ = new Object();
         _loc19_.falcons = [1,1,1];
         _loc19_.health = [40,50,60];
         _loc19_.minRange = [10 / 1.28,10 / 1.28,10 / 1.28];
         _loc19_.maxRange = [220 / 1.28,240 / 1.28,260 / 1.28];
         _loc19_.armor = [0,0,0];
         _loc19_.attackReloadTime = 3;
         _loc19_.regenerateHealth = 20;
         _loc19_.regenerateReloadTime = 1;
         _loc19_.minDamage = [3,9,18];
         _loc19_.maxDamage = [9,27,54];
         _loc19_.flightHeight = 80;
         _loc19_.cooldown = [0,0,0];
         _loc14_.falconerSkill = _loc19_;
         _loc20_ = new Object();
         _loc20_.远程 = [40 / 1.28,40 / 1.28,40 / 1.28];
         _loc20_.rhinos = [2,3,4];
         _loc20_.cooldown = [20,20,20];
         _loc14_.stampedeSkill = _loc20_;
         _loc21_ = new Object();
         _loc21_.damage = [10,15,20];
         _loc21_.远程 = [80 / 1.28,80 / 1.28,80 / 1.28];
         _loc21_.distance = [100,100,100];
         _loc21_.duration = [3,4,5];
         _loc21_.speed = [3,3,3];
         _loc21_.stunChance = [25,30,35];
         _loc21_.stunDuration = [45,75,105];
         _loc14_.rhino = _loc21_;
         _loc14_.meleeAttackXpMultiplier = 1 * 0.8;
         _loc14_.beastsAttackXpMultiplier = 1 * 0.85;
         _loc14_.deepLashesDamageXpMultiplier = 1 * 0.8;
         _loc14_.deepLashesXpMultiplier = 30;
         _loc14_.stampedeXpMultiplier = 70;
         this.heroes.heroCronan = _loc14_;
         _loc22_ = new Object();
         _loc22_.portrait = "0004";
         _loc22_.health = [225,250,275,300,325,350,375,400,425,450];
         _loc22_.regen = [23,25,28,30,33,35,38,40,43,45];
         _loc22_.armor = [0,0,0,0,0,0,0,0];
         _loc22_.minDamage = [7,8,10,12,13,15,17,18,20,22];
         _loc22_.maxDamage = [12,16,19,22,25,28,31,34,37,41];
         _loc22_.reload = 1.2;
         _loc22_.远程 = 130;
         _loc22_.regenReload = 1;
         _loc22_.respawn = 20 * this.framesRate;
         _loc22_.xpMultiplier = 1;
         _loc22_.peakChance = 30;
         _loc22_.peakMin = 5;
         _loc22_.peakMax = 10;
         _loc22_.swordsmanshipExtraDamage = [3,9,18];
         _loc22_.lootingRange = 180 * §switch for var§.GAME_SCALE;
         _loc22_.lootingMoneyPercent = 0;
         _loc22_.lootingMoneyPercentIncrement = 10;
         _loc22_.toughnessHealthPoints = [30,90,180];
         _loc22_.toughnessRegenPoints = [6,12,18];
         _loc22_.minRangeDamage = [24,29,35,41,47,53,59,65,71,76];
         _loc22_.maxRangeDamage = [44,55,66,76,87,98,109,120,131,142];
         _loc22_.rangeShootRangeWidth = 280 * §switch for var§.GAME_SCALE;
         _loc22_.rangeShootReloadTime = 6;
         _loc22_.rangeShootMinDistance = 50 * §switch for var§.GAME_SCALE;
         _loc22_.krakenCooldown = 16;
         _loc22_.krakenRange = 400 * §switch for var§.GAME_SCALE;
         _loc22_.krakenMinRange = 50 * §switch for var§.GAME_SCALE;
         _loc22_.krakenAttackRange = 80 * §switch for var§.GAME_SCALE;
         _loc22_.krakenNearRange = 120 * §switch for var§.GAME_SCALE;
         _loc22_.krakenNearNeededEnemies = 1;
         _loc22_.krakenDuration = 3;
         _loc22_.krakenDamage = 3;
         _loc22_.krakenMaxEnemies = 2;
         _loc22_.krakenMaxEnemiesIncrement = 1;
         _loc22_.slowDuration = 30;
         _loc22_.krakenSlowPercent = [25,50,75];
         _loc22_.krakenSlowPercentIncrement = 25;
         _loc22_.barrelCooldown = 12;
         _loc22_.barrelRange = 220;
         _loc22_.barrelMinRange = 40;
         _loc22_.barrelDamage = [12,14,15];
         _loc22_.barrelProyectiles = [4,6,8];
         _loc22_.barrelProyectileRange = 40;
         _loc22_.meleeAttackXpMultiplier = 1 * 0.75;
         _loc22_.rangeAttackXpMultiplier = 1 * 0.75;
         _loc22_.barrelXpMultiplier = 45;
         _loc22_.krakenXpMultiplier = 70;
         this.heroes.heroCaptain = _loc22_;
         _loc23_ = new Object();
         _loc23_.portrait = "0006";
         _loc23_.health = [115,130,145,160,175,190,205,220,235,250];
         _loc23_.regen = [12,13,15,16,18,19,21,22,24,25];
         _loc23_.armor = [0,0,0,0,0,0,0,0];
         _loc23_.minDamage = [3,4,4,5,5,6,6,7,7,8];
         _loc23_.maxDamage = [9,11,12,14,15,17,18,20,21,23];
         _loc23_.reload = 1;
         _loc23_.远程 = 70;
         _loc23_.regenReload = 1;
         _loc23_.respawn = 18 * this.framesRate;
         _loc23_.xpMultiplier = 1;
         _loc23_.minRangeDamage = [9,11,12,14,15,17,18,20,21,23];
         _loc23_.maxRangeDamage = [27,32,36,41,45,50,54,59,63,68];
         _loc23_.rangeShootRangeWidth = 250 / 1.28;
         _loc23_.rangeShootReloadTime = 1.5;
         _loc23_.rangeShootMinDistance = 50 / 1.28;
         _loc24_ = new Object();
         _loc24_.time = 12;
         _loc24_.远程 = 500 / 1.28;
         _loc24_.retargetRange = 250 / 1.28;
         _loc24_.damage = [12,18,24];
         _loc24_.quantity = [3,5,7];
         _loc23_.magicMissileSkill = _loc24_;
         _loc25_ = new Object();
         _loc25_.time = 6;
         _loc25_.bounceRange = 150 / 1.28;
         _loc25_.maxJumps = [2,3,4];
         _loc23_.chainSpellSkill = _loc25_;
         _loc26_ = new Object();
         _loc26_.rangeTrigger = 200 / 1.28;
         _loc26_.rangeEffect = 230 / 1.28;
         _loc26_.quantity = [4,6,8];
         _loc26_.damagePool = [170,330,480];
         _loc26_.time = 25;
         _loc23_.disintegrateSkill = _loc26_;
         _loc27_ = new Object();
         _loc27_.rangePercentIncrease = [24,50,75];
         _loc23_.arcaneReachSkill = _loc27_;
         _loc28_ = new Object();
         _loc28_.damageIncrease = [2,6,12];
         _loc23_.arcaneFocusSkill = _loc28_;
         _loc23_.meleeAttackXpMultiplier = 1 * 0.45;
         _loc23_.rangeAttackXpMultiplier = 1 * 0.45;
         _loc23_.magicMissileXpMultiplier = 15;
         _loc23_.chainXpMultiplier = 20;
         _loc23_.disintegrateXpMultiplier = 100;
         this.heroes.heroNivus = _loc23_;
         _loc29_ = new Object();
         _loc29_.portrait = "0005";
         _loc29_.health = [180,200,220,240,260,280,300,320,340,360];
         _loc29_.regen = [23,25,28,30,33,35,38,40,43,45];
         _loc29_.armor = [0,0,0,0,0,0,0,0,0,0];
         _loc29_.minDamage = [4,5,6,6,7,8,9,9,10,11];
         _loc29_.maxDamage = [12,14,17,19,21,23,26,28,30,32];
         _loc29_.reload = 1;
         _loc29_.远程 = 80;
         _loc29_.regenReload = 1;
         _loc29_.respawn = 15 * this.framesRate;
         _loc29_.xpMultiplier = 1;
         _loc29_.minRangeDamage = [4,5,6,6,7,8,9,9,10,11];
         _loc29_.maxRangeDamage = [12,14,17,19,21,23,26,28,30,32];
         _loc29_.rangeShootRangeWidth = 300 / 1.28;
         _loc29_.rangeShootReloadTime = 1;
         _loc29_.rangeShootMinDistance = 50 / 1.28;
         _loc30_ = new Object();
         _loc30_.time = 6;
         _loc30_.远程 = 250 / 1.28;
         _loc30_.heal = [15,15,30,45];
         _loc30_.healCount = [1,2,3,4];
         _loc30_.resurrectChance = [0,10,20,30];
         _loc29_.holyLightSkill = _loc30_;
         _loc31_ = new Object();
         _loc31_.time = 8;
         _loc31_.远程 = 300 / 1.28;
         _loc31_.duration = [4,8,12];
         _loc31_.bonusDamage = [15,20,25];
         _loc29_.consecrateSkill = _loc31_;
         _loc32_ = new Object();
         _loc32_.buffDuration = [10,20,30];
         _loc32_.buffArmor = [20,20,20];
         _loc32_.buffRange = 200 / 1.28;
         _loc32_.buffCount = [2,4,6];
         _loc29_.wingsOfLightSkill = _loc32_;
         _loc33_ = new Object();
         _loc33_.armor = [15,35,65];
         _loc29_.blessedArmorSkill = _loc33_;
         _loc34_ = new Object();
         _loc34_.extraHealth = [30,90,180];
         _loc34_.regenerationTime = 1;
         _loc34_.regenerationFactor = [6,18,36];
         _loc29_.divineHealthSkill = _loc34_;
         _loc29_.meleeAttackXpMultiplier = 1 * 0.7;
         _loc29_.rangeAttackXpMultiplier = 1 * 0.7;
         _loc29_.healingXpMultiplier = 12;
         _loc29_.healingXpMultiplierLevel0 = 7;
         _loc29_.consecrateXpMultiplier = 18;
         this.heroes.heroDierdre = _loc29_;
         _loc35_ = new Object();
         _loc35_.portrait = "0008";
         _loc35_.health = [330,360,390,420,450,480,510,540,570,600];
         _loc35_.regen = [17,18,20,21,23,24,26,27,29,30];
         _loc35_.armor = [23,26,29,32,35,38,41,44,47,50];
         _loc35_.minDamage = [10,12,14,15,17,18,20,21,23,24];
         _loc35_.maxDamage = [16,18,20,23,25,27,30,32,34,37];
         _loc35_.reload = 1.3;
         _loc35_.远程 = 110;
         _loc35_.regenReload = 1;
         _loc35_.respawn = 25 * this.framesRate;
         _loc35_.xpMultiplier = 1;
         _loc36_ = new Object();
         _loc36_.远程 = 70 / 1.28;
         _loc35_.areaAttackConfig = _loc36_;
         _loc37_ = new Object();
         _loc37_.time = 15;
         _loc37_.远程 = 600 / 1.28;
         _loc37_.minDistance = 200 / 1.28;
         _loc37_.minDamage = [20,40,60];
         _loc37_.maxDamage = [40,60,100];
         _loc37_.areaDamage = 80;
         _loc35_.boulderThrowSkill = _loc37_;
         _loc38_ = new Object();
         _loc38_.time = 14;
         _loc38_.远程 = 150 / 1.28;
         _loc38_.rangeTrigger = 120 / 1.28;
         _loc38_.duration = [2,3,4];
         _loc38_.damage = [10,11,12];
         _loc38_.minEnemiesToTrigger = 2;
         _loc38_.minEnemyHealthToTrigger = 100;
         _loc38_.slowDuration = 1;
         _loc38_.slowFactor = 50;
         _loc38_.stunChance = 50;
         _loc38_.loops = [2,3,4];
         _loc35_.stompSkill = _loc38_;
         _loc39_ = new Object();
         _loc39_.maxWalkDistance = 100 / 1.28;
         _loc39_.damagePerTick = [2,3,3];
         _loc39_.maxBonusDamage = [6,12,18];
         _loc39_.tickTime = 5;
         _loc35_.bastionSkill = _loc39_;
         _loc40_ = new Object();
         _loc40_.time = 12;
         _loc40_.extraDamage = [60,120,180];
         _loc40_.healthFactor = 3;
         _loc40_.chance = [10,20,30];
         _loc40_.damageType = §switch for var§.I_ARMOR;
         _loc35_.massiveDamageSkill = _loc40_;
         _loc41_ = new Object();
         _loc41_.extraHealth = [50,150,300];
         _loc35_.hardRockSkill = _loc41_;
         _loc35_.meleeAttackXpMultiplier = 1 * 0.85;
         _loc35_.boulderXpMultiplier = 40;
         _loc35_.stompXpMultiplier = 30;
         _loc35_.massiveDamageXpMultiplier = 70;
         this.heroes.heroGrawl = _loc35_;
         _loc42_ = new Object();
         _loc42_.portrait = "0007";
         _loc42_.health = [220,240,260,280,300,320,340,360,380,400];
         _loc42_.regen = [18,20,22,23,25,27,28,30,32,33];
         _loc42_.armor = [13,16,19,22,25,28,31,34,37,40];
         _loc42_.minDamage = [8,10,11,13,14,16,18,19,21,22];
         _loc42_.maxDamage = [12,14,17,19,22,24,26,29,31,34];
         _loc42_.reload = 1;
         _loc42_.远程 = 150 / 1.28;
         _loc42_.regenReload = 1;
         _loc42_.respawn = 25 * this.framesRate;
         _loc42_.xpMultiplier = 1;
         _loc43_ = new Object();
         _loc43_.castMinRange = [50 / 1.28,50 / 1.28,50 / 1.28];
         _loc43_.castMaxRange = [250 / 1.28,250 / 1.28,250 / 1.28];
         _loc43_.cooldown = [6,6,6];
         _loc42_.energyGlaiveSkill = _loc43_;
         _loc44_ = new Object();
         _loc44_.damage = [22,30,35];
         _loc44_.bounceRange = [300 / 1.28,300 / 1.28,300 / 1.28];
         _loc44_.bounceChance = [30,40,50];
         _loc44_.minBounceCount = [1,1,1];
         _loc44_.maxAcceleration = 13 / 1.28;
         _loc42_.energyGlaiveConfiguration = _loc44_;
         _loc45_ = new Object();
         _loc45_.minRange = [0,0,0];
         _loc45_.maxRange = [250 / 1.28,250 / 1.28,250 / 1.28];
         _loc45_.cooldown = [16,16,16];
         _loc45_.drones = [1,1,1];
         _loc42_.purificationProtocolSkill = _loc45_;
         _loc46_ = new Object();
         _loc46_.damage = [16,16,16];
         _loc46_.attackReloadTime = 6;
         _loc46_.duration = [1,2,3];
         _loc46_.speed = [1.3 / 1.28,1.3 / 1.28,1.3 / 1.28];
         _loc46_.远程 = [50 / 1.28,50 / 1.28,50 / 1.28];
         _loc46_.changeTargetReloadTime = 31;
         _loc46_.changeTargetRange = [300 / 1.28,300 / 1.28,300 / 1.28];
         _loc42_.purificationProtocolConfiguration = _loc46_;
         _loc47_ = new Object();
         _loc47_.cooldown = [25,25,25];
         _loc47_.targets = [1,2,3];
         _loc47_.totalHealth = [250,600,1000];
         _loc47_.multipleTargetsDistance = [33 / 1.28,33 / 1.28,33 / 1.28];
         _loc47_.远程 = [50 / 1.28,50 / 1.28,50 / 1.28];
         _loc47_.changeTargetReloadTime = 31;
         _loc47_.changeTargetRange = [300 / 1.28,300 / 1.28,300 / 1.28];
         _loc47_.maxRange = [400 / 1.28,400 / 1.28,400 / 1.28];
         _loc42_.abductionSkill = _loc47_;
         _loc48_ = new Object();
         _loc48_.damage = [5,10,15];
         _loc42_.vibroBladesSkill = _loc48_;
         _loc49_ = new Object();
         _loc49_.damage = [100,160,220];
         _loc49_.远程 = [150 / 1.28,150 / 1.28,150 / 1.28];
         _loc42_.finalCountdownSkill = _loc49_;
         _loc42_.meleeAttackXpMultiplier = 1 * 0.9;
         _loc42_.energyGlaiveXpMultiplier = 1 * 0.9;
         _loc42_.purificationProtocolDroneXpMultiplier = 55;
         _loc42_.abductionXpMultiplier = 160;
         this.heroes.heroShatra = _loc42_;
         _loc50_ = new Object();
         _loc50_.portrait = "0009";
         _loc50_.health = [420,440,460,480,500,520,540,560,580,600];
         _loc50_.regen = [21,22,23,24,25,26,27,28,29,30];
         _loc50_.armor = [0,0,0,0,0,0,0,0,0,0];
         _loc50_.minDamage = [12,14,17,19,22,24,26,29,31,34];
         _loc50_.maxDamage = [18,22,25,29,32,36,40,43,47,50];
         _loc50_.reload = 1;
         _loc50_.远程 = 130;
         _loc50_.regenReload = 1;
         _loc50_.respawn = 30 * this.framesRate;
         _loc50_.xpMultiplier = 1;
         _loc51_ = new Object();
         _loc51_.minRange = 0;
         _loc51_.maxRange = 280 / 1.28;
         _loc51_.cooldown = 1.5;
         _loc50_.rangedAttackSkill = _loc51_;
         _loc52_ = new Object();
         _loc52_.minRange = 0;
         _loc52_.maxRange = 80 / 1.28;
         _loc50_.rangedAttackProjectile = _loc52_;
         _loc53_ = new Object();
         _loc53_.minRange = [50 / 1.28,50 / 1.28,undefined,5 / 1.28];
         _loc53_.maxRange = [180 / 1.28,180 / 1.28,180 / 1.28];
         _loc53_.cooldown = [10,10,10];
         _loc53_.damage = [28,42,56];
         _loc50_.blazingBreathSkill = _loc53_;
         _loc54_ = new Object();
         _loc54_.cooldown = [30,30,30];
         _loc54_.minRange = [0,0,0];
         _loc54_.maxRange = [120 / 1.28,120 / 1.28,120 / 1.28];
         _loc54_.damage = [80,140,200];
         _loc54_.devoreChance = [20,30,40];
         _loc50_.feastSkill = _loc54_;
         _loc55_ = new Object();
         _loc55_.minRange = [180 / 1.28,180 / 1.28,undefined,180 / 1.28];
         _loc55_.maxRange = [750 / 1.28,750 / 1.28,750 / 1.28];
         _loc55_.cooldown = [18,18,18];
         _loc50_.wildfireBarrage = _loc55_;
         _loc56_ = new Object();
         _loc56_.远程 = [80 / 1.28,80 / 1.28,80 / 1.28];
         _loc56_.damage = [30,30,30];
         _loc56_.explosions = [4,8,12];
         _loc50_.longRangedAttackProjectile = _loc56_;
         _loc57_ = new Object();
         _loc57_.minRange = [40 / 1.28,40 / 1.28,40 / 1.28];
         _loc57_.maxRange = [160 / 1.28,160 / 1.28,160 / 1.28];
         _loc57_.cooldown = [14,14,14];
         _loc50_.fieryMistSkill = _loc57_;
         _loc58_ = new Object();
         _loc58_.远程 = [60 / 1.28,60 / 1.28,60 / 1.28];
         _loc58_.slowFactor = [0.3,0.4,0.5];
         _loc58_.slowReloadTime = [5,5,5];
         _loc58_.duration = [90,120,150];
         _loc58_.damage = [0,0,0];
         _loc58_.damageReloadTime = [10,10,10];
         _loc50_.mist = _loc58_;
         _loc59_ = new Object();
         _loc59_.damage = [6,18,30];
         _loc59_.duration = [90,90,90];
         _loc59_.damageReloadTime = [15,15,15];
         _loc50_.reignOfFireSkill = _loc59_;
         _loc50_.rangeAttackXpMultiplier = 1 * 0.8;
         _loc50_.longRangeAttackXpMultiplier = 80;
         _loc50_.fieryMistXpMultiplier = 20;
         _loc50_.blazingBreathXpMultiplier = 30;
         _loc50_.feastXpMultiplier = 120;
         this.heroes.heroAshbite = _loc50_;
         this.heroes.heroArray = [_loc11_,_loc13_,_loc14_,_loc22_,_loc29_,_loc23_,_loc42_,_loc35_,_loc50_];
      }
      
      public function updateSkillPoints() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         _loc1_ = [0,3,6,10,13,16,20,23,26,30];
         _loc2_ = Number(this.game.gameHeroData.calculateTotalCost(this.game.gameHeroData.heroAlric));
         _loc3_ = Number(_loc1_[this.game.gameHeroData.heroAlric.level - 1]);
         this.heroes.heroAlric.skillPoints = _loc3_ - _loc2_;
      }
      
      public function destroyThis() : void
      {
         this.mages = null;
         this.archers = null;
         this.engineers = null;
         this.§_-tz§ = null;
         this.§true use§ = null;
         this.enemies = null;
         this.§super const set§ = null;
         this.heroes = null;
         this.game = null;
      }
   }
}

