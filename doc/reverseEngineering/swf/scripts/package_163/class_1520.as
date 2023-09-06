package package_163
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.events.PropertyChangeEvent;
   import net.bigpoint.darkorbit.mvc.battlestationswindow.class_1023;
   import package_38.class_831;
   
   public class class_1520 implements IEventDispatcher
   {
      
      public static const NONE:uint = 0;
      
      public static const const_632:uint = 1;
      
      public static const HULL:uint = 2;
      
      public static const DEFLECTOR:uint = 3;
      
      public static const REPAIR:uint = 4;
      
      public static const LASER_HIGH_RANGE:uint = 5;
      
      public static const LASER_MID_RANGE:uint = 6;
      
      public static const LASER_LOW_RANGE:uint = 7;
      
      public static const ROCKET_MID_ACCURACY:uint = 8;
      
      public static const ROCKET_LOW_ACCURACY:uint = 9;
      
      public static const HONOR_BOOSTER:uint = 10;
      
      public static const DAMAGE_BOOSTER:uint = 11;
      
      public static const EXPERIENCE_BOOSTER:uint = 12;
       
      
      private var _itemId:int;
      
      private var _type:int;
      
      private var var_4762:int = -1;
      
      private var var_2349:int;
      
      private var var_334:int;
      
      private var var_2440:int;
      
      private var var_4362:int;
      
      private var var_429:Number;
      
      private var var_4414:Number;
      
      private var var_199:Number = 0;
      
      private var var_201:int = 0;
      
      private var var_216:int;
      
      private var var_2799:int;
      
      private var var_953:int;
      
      private var var_2079:String;
      
      private var var_1047:int;
      
      private var _draggable:Boolean = true;
      
      private var var_1444:EventDispatcher;
      
      public function class_1520(param1:int = 0, param2:int = 0, param3:int = -1, param4:int = -1, param5:int = -1, param6:int = -1, param7:Number = -1, param8:int = -1, param9:int = -1, param10:int = -1, param11:int = -1, param12:String = "", param13:int = -1, param14:int = -1, param15:Boolean = true)
      {
         this.var_1444 = new EventDispatcher(IEventDispatcher(this));
         super();
         this._itemId = param1;
         this._type = param2;
         this.var_4762 = param14;
         this.var_2349 = param3;
         this.var_334 = param4;
         this.var_2440 = param5;
         this.var_4362 = param6;
         this.var_429 = param7;
         this.var_201 = param8;
         this.var_216 = param9;
         this.var_2799 = param10;
         this.var_953 = param11;
         this.var_2079 = param12;
         this.var_1047 = param13;
         this._draggable = param15;
      }
      
      public function init(param1:class_831) : void
      {
         this._itemId = param1.itemId;
         this._type = param1.type;
         this.var_2349 = param1.currentHitpoints;
         this.var_334 = param1.currentShield;
         this.var_2440 = param1.maxHitpoints;
         this.var_953 = param1.maxShield;
         this.var_2799 = param1.upgradeLevel;
         this.var_2079 = param1.ownerName;
         this.var_216 = param1.name_30;
         this.var_201 = param1.emergencyRepairSecondsLeft;
         this.var_1047 = param1.emergencyRepairSecondsTotal;
         this.var_4362 = param1.var_1219;
         this.var_429 = param1.installationSecondsLeft;
         if(this.var_429 > 0)
         {
            this.var_4414 = 0;
            this.var_199 = new Date().getTime();
         }
      }
      
      public function update(param1:int, param2:int, param3:int, param4:int) : void
      {
         this.var_201 = param1;
         this.var_1047 = param2;
         this.var_2349 = param3;
         this.var_334 = param4;
      }
      
      public function method_1738(param1:int) : void
      {
         this.var_4414 = 0;
         this.installationSecondsLeft = param1;
      }
      
      public function get method_2621() : String
      {
         return class_1023.const_528[this._type];
      }
      
      public function get category() : String
      {
         return class_1023.const_1384[this._type];
      }
      
      public function clone() : class_1520
      {
         return new class_1520(this._itemId,this._type,this.var_2349,this.var_334,this.var_2440,this.var_4362,this.var_429,this.var_201,this.var_216,this.var_2799,this.var_953,this.var_2079,this.var_1047,this.var_4762,this._draggable);
      }
      
      public function reset() : void
      {
         this._itemId = 0;
         this._type = NONE;
         this.var_2349 = this.var_334 = 0;
         this.var_4762 = -1;
         this.var_429 = this.var_199 = this.var_201 = this.var_216 = 0;
      }
      
      public function get method_1366() : Boolean
      {
         return this.var_2349 == 0;
      }
      
      public function get itemId() : int
      {
         return this._itemId;
      }
      
      private function set method_4780(param1:int) : void
      {
         this._itemId = param1;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      private function set method_4506(param1:int) : void
      {
         this._type = param1;
      }
      
      public function get slotOccupying() : int
      {
         return this.var_4762;
      }
      
      private function set method_5014(param1:int) : void
      {
         this.var_4762 = param1;
      }
      
      public function get currentHitpoints() : int
      {
         return this.var_2349;
      }
      
      private function set method_1011(param1:int) : void
      {
         this.var_2349 = param1;
      }
      
      public function get currentShield() : int
      {
         return this.var_334;
      }
      
      private function set method_4070(param1:int) : void
      {
         this.var_334 = param1;
      }
      
      public function get maxHitpoints() : int
      {
         return this.var_2440;
      }
      
      private function set method_4700(param1:int) : void
      {
         this.var_2440 = param1;
      }
      
      public function get installationSecondsTotal() : int
      {
         return this.var_4362;
      }
      
      private function set method_5886(param1:int) : void
      {
         this.var_4362 = param1;
      }
      
      public function get installationSecondsLeft() : Number
      {
         return this.var_429;
      }
      
      public function get emergencyRepairSecondsLeft() : int
      {
         return this.var_201;
      }
      
      public function get name_30() : int
      {
         return this.var_216;
      }
      
      public function get upgradeLevel() : int
      {
         return this.var_2799;
      }
      
      private function set method_5660(param1:int) : void
      {
         this.var_2799 = param1;
      }
      
      public function get maxShield() : int
      {
         return this.var_953;
      }
      
      private function set method_2999(param1:int) : void
      {
         this.var_953 = param1;
      }
      
      public function get ownerName() : String
      {
         return this.var_2079;
      }
      
      private function set method_3039(param1:String) : void
      {
         this.var_2079 = param1;
      }
      
      public function get emergencyRepairSecondsTotal() : int
      {
         return this.var_1047;
      }
      
      private function set method_3431(param1:int) : void
      {
         this.var_1047 = param1;
      }
      
      public function get draggable() : Boolean
      {
         return this._draggable;
      }
      
      private function set method_6234(param1:Boolean) : void
      {
         this._draggable = param1;
      }
      
      public function get buildStartTime() : Number
      {
         return this.var_199;
      }
      
      private function set method_694(param1:Number) : void
      {
         this.var_199 = param1;
      }
      
      public function get instalationDuration() : Number
      {
         return this.var_4414;
      }
      
      private function set method_5451(param1:Number) : void
      {
         this.var_4414 = param1;
      }
      
      private function set method_5480(param1:Number) : void
      {
         this.var_429 = param1;
         if(this.var_429 > 0)
         {
            this.var_199 = new Date().getTime();
         }
      }
      
      private function set method_594(param1:int) : void
      {
         this.var_201 = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function set ownerName(param1:String) : void
      {
         var _loc2_:Object = this.ownerName;
         if(_loc2_ !== param1)
         {
            this.method_3039 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ownerName",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set maxShield(param1:int) : void
      {
         var _loc2_:Object = this.maxShield;
         if(_loc2_ !== param1)
         {
            this.method_2999 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"maxShield",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set emergencyRepairSecondsTotal(param1:int) : void
      {
         var _loc2_:Object = this.emergencyRepairSecondsTotal;
         if(_loc2_ !== param1)
         {
            this.method_3431 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"emergencyRepairSecondsTotal",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set installationSecondsTotal(param1:int) : void
      {
         var _loc2_:Object = this.installationSecondsTotal;
         if(_loc2_ !== param1)
         {
            this.method_5886 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"installationSecondsTotal",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set itemId(param1:int) : void
      {
         var _loc2_:Object = this.itemId;
         if(_loc2_ !== param1)
         {
            this.method_4780 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"itemId",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set type(param1:int) : void
      {
         var _loc2_:Object = this.type;
         if(_loc2_ !== param1)
         {
            this.method_4506 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"type",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set buildStartTime(param1:Number) : void
      {
         var _loc2_:Object = this.buildStartTime;
         if(_loc2_ !== param1)
         {
            this.method_694 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buildStartTime",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set currentShield(param1:int) : void
      {
         var _loc2_:Object = this.currentShield;
         if(_loc2_ !== param1)
         {
            this.method_4070 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"currentShield",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set installationSecondsLeft(param1:Number) : void
      {
         var _loc2_:Object = this.installationSecondsLeft;
         if(_loc2_ !== param1)
         {
            this.method_5480 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"installationSecondsLeft",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set instalationDuration(param1:Number) : void
      {
         var _loc2_:Object = this.instalationDuration;
         if(_loc2_ !== param1)
         {
            this.method_5451 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"instalationDuration",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set upgradeLevel(param1:int) : void
      {
         var _loc2_:Object = this.upgradeLevel;
         if(_loc2_ !== param1)
         {
            this.method_5660 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"upgradeLevel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set maxHitpoints(param1:int) : void
      {
         var _loc2_:Object = this.maxHitpoints;
         if(_loc2_ !== param1)
         {
            this.method_4700 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"maxHitpoints",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set emergencyRepairSecondsLeft(param1:int) : void
      {
         var _loc2_:Object = this.emergencyRepairSecondsLeft;
         if(_loc2_ !== param1)
         {
            this.method_594 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"emergencyRepairSecondsLeft",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set currentHitpoints(param1:int) : void
      {
         var _loc2_:Object = this.currentHitpoints;
         if(_loc2_ !== param1)
         {
            this.method_1011 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"currentHitpoints",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set draggable(param1:Boolean) : void
      {
         var _loc2_:Object = this.draggable;
         if(_loc2_ !== param1)
         {
            this.method_6234 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"draggable",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set slotOccupying(param1:int) : void
      {
         var _loc2_:Object = this.slotOccupying;
         if(_loc2_ !== param1)
         {
            this.method_5014 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"slotOccupying",_loc2_,param1));
            }
         }
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this.var_1444.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this.var_1444.dispatchEvent(param1);
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this.var_1444.hasEventListener(param1);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this.var_1444.removeEventListener(param1,param2,param3);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this.var_1444.willTrigger(param1);
      }
   }
}
