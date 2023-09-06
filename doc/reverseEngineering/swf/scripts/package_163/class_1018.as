package package_163
{
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import package_38.class_732;
   import package_38.class_831;
   
   public class class_1018
   {
      
      public static const const_2500:String = "AsteroidState";
      
      public static const const_2805:String = "BuildInProgressState";
      
      public static const const_1368:String = "BattleStationState";
      
      public static const const_3175:String = "DestroyedState";
       
      
      public var name_11:int;
      
      private var var_875:int = 1;
      
      private var var_2938:Timer;
      
      public var var_2469:String;
      
      private var var_284:uint;
      
      private var var_154:String;
      
      public var modules:Vector.<class_1520>;
      
      public var var_1529:int = 0;
      
      public var var_3184:int;
      
      public var var_4818:int = 0;
      
      public var var_1801:int = 9;
      
      private var _state:String = "AsteroidState";
      
      public var var_3652:Number;
      
      public var var_4415:Number = 0;
      
      public var var_740:String = "";
      
      public var owningClanName:String = "";
      
      public var var_3060:Boolean = false;
      
      public var var_4580:int;
      
      public var var_994:Number;
      
      public var name_65:Boolean;
      
      public var name_142:int;
      
      public var attackRating:int;
      
      public var defenceRating:int;
      
      public var repairRating:int;
      
      public var var_5034:int;
      
      public var var_1627:int;
      
      public var damageBoosterRating:int;
      
      private var var_90:class_1536;
      
      public var var_1094:Boolean = false;
      
      public function class_1018()
      {
         this.modules = new Vector.<class_1520>();
         super();
         this.init();
      }
      
      private function init() : void
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         while(_loc1_ <= this.var_1801)
         {
            _loc2_ = new class_1520();
            _loc2_.reset();
            this.modules[_loc1_] = _loc2_;
            _loc1_++;
         }
      }
      
      public function method_29(param1:class_1520) : void
      {
         this.modules[param1.slotOccupying] = param1;
         ++this.var_4818;
         this.var_3652 = this.var_4818 / (Number(this.var_1801) / 100);
      }
      
      public function method_6073(param1:int) : void
      {
         var _loc2_:class_1520 = this.modules[param1];
         _loc2_.type = class_1520.NONE;
         if(this.var_4818 > 0)
         {
            --this.var_4818;
         }
         this.var_3652 = this.var_4818 / (Number(this.var_1801) / 100);
      }
      
      public function method_1306(param1:class_732) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:Boolean = false;
         var _loc6_:int = 0;
         var _loc5_:int = 0;
         while(_loc5_ < this.modules.length)
         {
            _loc3_ = this.modules[_loc5_];
            _loc4_ = false;
            _loc6_ = 0;
            while(_loc6_ < param1.modules.length)
            {
               _loc2_ = param1.modules[_loc6_];
               if(_loc2_.slotId == _loc5_)
               {
                  _loc3_.init(_loc2_);
                  _loc3_.slotOccupying = _loc2_.slotId;
                  _loc4_ = true;
                  break;
               }
               _loc6_++;
            }
            if(!_loc4_)
            {
               _loc3_.reset();
            }
            _loc5_++;
         }
      }
      
      public function method_5995(param1:int) : void
      {
         this.name_11 = param1;
         if(this.var_2938 != null)
         {
            this.var_2938.stop();
            this.var_2938.removeEventListener(TimerEvent.TIMER,this.method_2827);
         }
         this.var_2938 = new Timer(1000);
         this.var_2938.addEventListener(TimerEvent.TIMER,this.method_2827);
         this.var_2938.start();
      }
      
      private function method_2827(param1:TimerEvent) : void
      {
         this.name_11 -= this.var_875;
         if(this.name_11 <= 0)
         {
            this.method_135();
         }
      }
      
      private function method_135() : void
      {
         this.var_2938.stop();
         this.var_2938.removeEventListener(TimerEvent.TIMER,this.method_2827);
      }
      
      public function get method_6431() : class_1536
      {
         return this.var_90;
      }
      
      public function set method_6431(param1:class_1536) : void
      {
         this.var_90 = param1;
      }
      
      public function set method_3089(param1:uint) : void
      {
         this.var_284 = param1;
         this.var_154 = BattleStationProxy.var_3360[this.var_284];
      }
      
      public function get method_3700() : String
      {
         return this.var_154;
      }
      
      public function get state() : String
      {
         return this._state;
      }
      
      public function set state(param1:String) : void
      {
         this._state = param1;
      }
   }
}
