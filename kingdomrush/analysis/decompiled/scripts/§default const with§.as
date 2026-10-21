package
{
   import flash.utils.*;
   import §native super§.*;
   
   public class §default const with§
   {
      
      public var creepType:String;
      
      public var creepTypeAux:String;
      
      public var §_-Ny§:String;
      
      public var maxSameCreep:int;
      
      public var cant:int;
      
      public var interval:int;
      
      public var intervalCounter:int;
      
      public var useFixedPath:Boolean;
      
      public var intervalNextSpawn:int;
      
      public var path:int;
      
      public var indexCant:int;
      
      public var indexSwap:int;
      
      public function §default const with§(param1:String, param2:String, param3:int, param4:int, param5:int, param6:int, param7:Boolean, param8:int)
      {
         super();
         this.intervalCounter = 0;
         this.indexCant = 1;
         this.indexSwap = 0;
         this.creepType = param1;
         this.creepTypeAux = param2;
         this.§_-Ny§ = param1;
         this.maxSameCreep = param3;
         this.cant = param4;
         this.interval = param5;
         this.intervalNextSpawn = param6;
         this.useFixedPath = param7;
         this.path = param8;
      }
      
      public function spawnEnemies(param1:Level, param2:int, param3:波) : Boolean
      {
         var _loc4_:String = "";
         if(this.indexCant > this.cant)
         {
            return false;
         }
         if(this.interval - 1 > this.intervalCounter)
         {
            ++this.intervalCounter;
         }
         else
         {
            if(this.creepTypeAux != "")
            {
               if(this.indexSwap == this.maxSameCreep)
               {
                  if(this.§_-Ny§ == this.creepTypeAux)
                  {
                     this.§_-Ny§ = this.creepType;
                  }
                  else
                  {
                     this.§_-Ny§ = this.creepTypeAux;
                  }
                  this.indexSwap = 0;
               }
            }
            else
            {
               this.§_-Ny§ = this.creepType;
            }
            this.§function for switch§(this.§_-Ny§,param1,param2,param3);
            ++this.indexSwap;
            ++this.indexCant;
            this.intervalCounter = 0;
         }
         return true;
      }
      
      private function §function for switch§(param1:String, param2:Level, param3:int, param4:波) : *
      {
         var _loc6_:* = undefined;
         var _loc5_:Class = getDefinitionByName(param1) as Class;
         if(!this.useFixedPath)
         {
            _loc6_ = new _loc5_(param3,param2.§_-Tb§(param3));
         }
         else
         {
            _loc6_ = new _loc5_(param3,param2.§_-iu§[param3][this.path]);
         }
         if(param4.§native const with§ != "" && !param4.§package null§)
         {
            if(param1 == §break use§.remove(param4.§native const with§,"Notification") || Boolean(§break use§.beginsWith(param4.§native const with§,"NotificationTip")))
            {
               param2.sendSecondLevelNotification(param4.§native const with§);
               param4.§package null§ = true;
            }
         }
         param2.entities.addChild(_loc6_);
         param2.enemies[_loc6_] = _loc6_;
      }
   }
}

