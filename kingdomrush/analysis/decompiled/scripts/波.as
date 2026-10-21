package
{
   import fl.lang.*;
   
   public class 波
   {
      
      public var spawns:Array = [];
      
      public var counter:int = 0;
      
      public var interval:int = 0;
      
      public var pathIndex:int = 0;
      
      public var indexSpawn:int = 0;
      
      public var §_-5J§:Boolean;
      
      public var §_-9J§:int;
      
      public var notification:String;
      
      public var §native const with§:String;
      
      public var §package null§:Boolean;
      
      public var §var for while§:Array;
      
      public var §break for const§:Boolean;
      
      public function 波(param1:Array, param2:int, param3:int, param4:String = "", param5:String = "", param6:Boolean = false)
      {
         super();
         this.spawns = param1;
         this.interval = param2;
         this.pathIndex = param3;
         this.counter = 0;
         this.indexSpawn = 0;
         this.§_-5J§ = false;
         this.notification = param4;
         this.§native const with§ = param5;
         this.§package null§ = false;
         this.§var for while§ = this.§_-Um§();
         this.initIsFlying();
      }
      
      public function spawnEnemies(param1:Level) : Boolean
      {
         if(this.indexSpawn < this.spawns.length)
         {
            if(this.§_-5J§)
            {
               if(this.§_-9J§ < this.spawns[this.indexSpawn].intervalNextSpawn)
               {
                  ++this.§_-9J§;
                  return true;
               }
               ++this.indexSpawn;
               this.§_-5J§ = false;
               return true;
            }
            if(!this.spawns[this.indexSpawn].spawnEnemies(param1,this.pathIndex,this))
            {
               this.§_-5J§ = true;
               this.§_-9J§ = 0;
               if(this.indexSpawn + 1 == this.spawns.length)
               {
                  ++this.indexSpawn;
                  return false;
               }
            }
            return true;
         }
         delete param1.activeWaves[this];
         return false;
      }
      
      public function showWaveFlag(param1:Level, param2:int, param3:int) : void
      {
         var _loc4_:§_-65§ = null;
         var _loc5_:Boolean = false;
         if(param3 == 0)
         {
            _loc5_ = true;
            param2 = 1;
         }
         _loc4_ = new §_-65§(param1,param1.§_-HF§[this.pathIndex][0],param1.§_-HF§[this.pathIndex][1],param2,this,_loc5_,this.§break for const§);
         param1.bullets.addChild(_loc4_);
         param1.§for null§(_loc4_);
      }
      
      public function §_-Tl§() : Array
      {
         return this.§var for while§;
      }
      
      public function §_-Um§() : Array
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         var _loc7_:int = 0;
         while(_loc7_ < this.spawns.length)
         {
            if(this.spawns[_loc7_].creepTypeAux == "")
            {
               _loc2_ = int(this.§_-yJ§(_loc1_,this.spawns[_loc7_].creepType));
               if(_loc2_ == -1)
               {
                  _loc1_.push([Locale.loadStringEx("ENEMY_" + §switch for var§.getEnemyString(this.spawns[_loc7_].creepType) + "_NAME",Locale.getDefaultLang()),this.spawns[_loc7_].cant,this.spawns[_loc7_].creepType]);
               }
               else
               {
                  _loc1_[_loc2_][1] += this.spawns[_loc7_].cant;
               }
            }
            else
            {
               _loc3_ = Math.floor(this.spawns[_loc7_].cant / this.spawns[_loc7_].maxSameCreep);
               _loc6_ = this.spawns[_loc7_].cant % this.spawns[_loc7_].maxSameCreep;
               _loc4_ = Math.ceil(_loc3_ / 2) * this.spawns[_loc7_].maxSameCreep;
               _loc5_ = Math.floor(_loc3_ / 2) * this.spawns[_loc7_].maxSameCreep;
               if(_loc3_ % 2 == 0)
               {
                  _loc4_ += _loc6_;
               }
               else
               {
                  _loc5_ += _loc6_;
               }
               _loc2_ = int(this.§_-yJ§(_loc1_,this.spawns[_loc7_].creepType));
               if(_loc2_ == -1)
               {
                  _loc1_.push([Locale.loadStringEx("ENEMY_" + §switch for var§.getEnemyString(this.spawns[_loc7_].creepType) + "_NAME",Locale.getDefaultLang()),_loc4_,this.spawns[_loc7_].creepType]);
               }
               else
               {
                  _loc1_[_loc2_][1] += _loc4_;
               }
               _loc2_ = int(this.§_-yJ§(_loc1_,this.spawns[_loc7_].creepTypeAux));
               if(_loc2_ == -1)
               {
                  _loc1_.push([Locale.loadStringEx("ENEMY_" + §switch for var§.getEnemyString(this.spawns[_loc7_].creepTypeAux) + "_NAME",Locale.getDefaultLang()),_loc5_,this.spawns[_loc7_].creepTypeAux]);
               }
               else
               {
                  _loc1_[_loc2_][1] += _loc5_;
               }
            }
            _loc7_++;
         }
         return _loc1_;
      }
      
      private function initIsFlying() : void
      {
         this.§break for const§ = false;
         var _loc1_:int = 0;
         while(_loc1_ < this.§var for while§.length)
         {
            if(§switch for var§.isEnemyFlying(this.§var for while§[_loc1_][2]))
            {
               this.§break for const§ = true;
               return;
            }
            _loc1_++;
         }
      }
      
      private function §_-yJ§(param1:Array, param2:String) : int
      {
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            if(param1[_loc3_][2] == param2)
            {
               return _loc3_;
            }
            _loc3_++;
         }
         return -1;
      }
      
      public function destroyThis() : void
      {
         this.spawns = null;
      }
   }
}

