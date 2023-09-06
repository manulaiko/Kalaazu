package package_416
{
   import flash.events.EventDispatcher;
   import org.flintparticles.common.utils.class_2554;
   import package_412.class_2332;
   import package_413.class_2333;
   import package_414.class_2336;
   import package_418.class_2340;
   import package_418.class_2555;
   import package_459.class_2551;
   import package_459.class_2559;
   import package_461.class_2553;
   import package_461.class_2556;
   import package_461.class_2557;
   import package_462.class_2558;
   
   public class class_2338 extends EventDispatcher
   {
       
      
      protected var var_4480:class_2559;
      
      protected var var_4189:Vector.<class_2333>;
      
      protected var var_1172:Vector.<class_2336>;
      
      protected var var_2231:Vector.<class_2558>;
      
      protected var var_278:Array;
      
      protected var var_1310:class_2340;
      
      protected var var_4065:Boolean = true;
      
      protected var var_972:Number = 0;
      
      protected var _running:Boolean = false;
      
      protected var var_4520:Boolean = false;
      
      protected var var_2458:Number = 0.1;
      
      protected var var_3595:Boolean = false;
      
      public function class_2338()
      {
         super();
         this.var_278 = [];
         this.var_1172 = new Vector.<class_2336>();
         this.var_4189 = new Vector.<class_2333>();
         this.var_2231 = new Vector.<class_2558>();
         this.var_1310 = new class_2555();
      }
      
      public function get method_6372() : Number
      {
         return this.var_2458;
      }
      
      public function set method_6372(param1:Number) : void
      {
         this.var_2458 = param1;
      }
      
      public function get method_1314() : Vector.<class_2333>
      {
         return this.var_4189;
      }
      
      public function set method_1314(param1:Vector.<class_2333>) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_4189)
         {
            _loc2_.method_4926(this);
         }
         this.var_4189 = param1.slice();
         this.var_4189.sort(this.method_5258);
         for each(_loc2_ in param1)
         {
            _loc2_.method_474(this);
         }
      }
      
      public function method_6355(param1:class_2333) : void
      {
         var _loc2_:uint = uint(this.var_4189.length);
         var _loc3_:Number = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.var_4189[_loc3_].priority < param1.priority)
            {
               break;
            }
            _loc3_++;
         }
         this.var_4189.splice(_loc3_,0,param1);
         param1.method_474(this);
      }
      
      public function method_587(param1:class_2333) : void
      {
         var _loc2_:int = int(this.var_4189.indexOf(param1));
         if(_loc2_ != -1)
         {
            this.var_4189.splice(_loc2_,1);
            param1.method_4926(this);
         }
      }
      
      public function method_6488(param1:class_2333) : Boolean
      {
         return this.var_4189.indexOf(param1) != -1;
      }
      
      public function method_3676(param1:Class) : Boolean
      {
         var _loc2_:uint = uint(this.var_4189.length);
         var _loc3_:Number = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.var_4189[_loc3_] is param1)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function get method_84() : Vector.<class_2336>
      {
         return this.var_1172;
      }
      
      public function set method_84(param1:Vector.<class_2336>) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_1172)
         {
            _loc2_.method_4926(this);
         }
         this.var_1172 = param1.slice();
         this.var_1172.sort(this.method_5258);
         for each(_loc2_ in param1)
         {
            _loc2_.method_474(this);
         }
      }
      
      public function method_399(param1:class_2336) : void
      {
         var _loc2_:uint = uint(this.var_1172.length);
         var _loc3_:Number = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.var_1172[_loc3_].priority < param1.priority)
            {
               break;
            }
            _loc3_++;
         }
         this.var_1172.splice(_loc3_,0,param1);
         param1.method_474(this);
      }
      
      public function method_3616(param1:class_2336) : void
      {
         var _loc2_:int = int(this.var_1172.indexOf(param1));
         if(_loc2_ != -1)
         {
            this.var_1172.splice(_loc2_,1);
            param1.method_4926(this);
         }
      }
      
      public function method_4540(param1:class_2336) : Boolean
      {
         return this.var_1172.indexOf(param1) != -1;
      }
      
      public function method_681(param1:Class) : Boolean
      {
         var _loc2_:uint = uint(this.var_1172.length);
         var _loc3_:Number = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.var_1172[_loc3_] is param1)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function get method_1350() : Vector.<class_2558>
      {
         return this.var_2231;
      }
      
      public function set method_1350(param1:Vector.<class_2558>) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_2231)
         {
            _loc2_.method_4926(this);
         }
         this.var_2231 = param1.slice();
         this.var_2231.sort(this.method_5258);
         for each(_loc2_ in this.var_2231)
         {
            _loc2_.method_474(this);
         }
      }
      
      public function method_5558(param1:class_2558) : void
      {
         var _loc2_:uint = uint(this.var_2231.length);
         var _loc3_:Number = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.var_2231[_loc3_].priority < param1.priority)
            {
               break;
            }
            _loc3_++;
         }
         this.var_2231.splice(_loc3_,0,param1);
         param1.method_474(this);
      }
      
      public function method_3193(param1:class_2558) : void
      {
         var _loc2_:int = int(this.var_2231.indexOf(param1));
         if(_loc2_ != -1)
         {
            this.var_2231.splice(_loc2_,1);
            param1.method_4926(this);
         }
      }
      
      public function method_3159(param1:class_2558) : Boolean
      {
         return this.var_2231.indexOf(param1) != -1;
      }
      
      public function method_3250(param1:Class) : Boolean
      {
         var _loc2_:uint = uint(this.var_2231.length);
         var _loc3_:Number = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.var_2231[_loc3_] is param1)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function get counter() : class_2340
      {
         return this.var_1310;
      }
      
      public function set counter(param1:class_2340) : void
      {
         this.var_1310 = param1;
         if(this.running)
         {
            this.var_1310.method_2399(this);
         }
      }
      
      public function method_1590() : void
      {
         this.var_3595 = true;
      }
      
      public function get method_4417() : Boolean
      {
         return this.var_4065;
      }
      
      public function set method_4417(param1:Boolean) : void
      {
         if(this.var_4065 != param1)
         {
            this.var_4065 = param1;
            if(this.var_4520)
            {
               if(this.var_4065)
               {
                  class_2554.instance.addEventListener(class_2553.UPDATE,this.method_2603,false,0,true);
               }
               else
               {
                  class_2554.instance.removeEventListener(class_2553.UPDATE,this.method_2603);
               }
            }
         }
      }
      
      public function get method_710() : Number
      {
         return this.var_972;
      }
      
      public function set method_710(param1:Number) : void
      {
         this.var_972 = param1;
      }
      
      public function get running() : Boolean
      {
         return this._running;
      }
      
      public function get method_5500() : class_2559
      {
         return this.var_4480;
      }
      
      public function set method_5500(param1:class_2559) : void
      {
         this.var_4480 = param1;
      }
      
      public function get particles() : Vector.<class_2551>
      {
         return Vector.<class_2551>(this.var_278);
      }
      
      public function set particles(param1:Vector.<class_2551>) : void
      {
         this.method_1335();
         this.method_2957(param1,false);
      }
      
      public function get method_5695() : Array
      {
         return this.var_278;
      }
      
      protected function method_1095() : class_2551
      {
         var _loc1_:class_2551 = this.var_4480.method_1095();
         var _loc2_:int = int(this.var_4189.length);
         this.method_1004(_loc1_);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            class_2333(this.var_4189[_loc3_]).initialize(this,_loc1_);
            _loc3_++;
         }
         this.var_278.push(_loc1_);
         if(hasEventListener(class_2557.var_1341))
         {
            dispatchEvent(new class_2557(class_2557.var_1341,_loc1_));
         }
         return _loc1_;
      }
      
      protected function method_1004(param1:class_2551) : void
      {
      }
      
      public function method_3251(param1:class_2551, param2:Boolean = false) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param2)
         {
            _loc3_ = int(this.var_4189.length);
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               this.var_4189[_loc4_].initialize(this,param1);
               _loc4_++;
            }
         }
         this.var_278.push(param1);
         if(hasEventListener(class_2557.var_2230))
         {
            dispatchEvent(new class_2557(class_2557.var_2230,param1));
         }
      }
      
      public function method_2957(param1:Vector.<class_2551>, param2:Boolean = false) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:int = param1.length;
         if(param2)
         {
            _loc5_ = int(this.var_4189.length);
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               _loc4_ = 0;
               while(_loc4_ < _loc3_)
               {
                  this.var_4189[_loc6_].initialize(this,param1[_loc4_]);
                  _loc4_++;
               }
               _loc6_++;
            }
         }
         if(hasEventListener(class_2557.var_2230))
         {
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               this.var_278.push(param1[_loc4_]);
               dispatchEvent(new class_2557(class_2557.var_2230,param1[_loc4_]));
               _loc4_++;
            }
         }
         else
         {
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               this.var_278.push(param1[_loc4_]);
               _loc4_++;
            }
         }
      }
      
      public function method_5030(param1:class_2551) : Boolean
      {
         var _loc2_:int = int(this.var_278.indexOf(param1));
         if(_loc2_ != -1)
         {
            this.var_278.splice(_loc2_,1);
            return true;
         }
         return false;
      }
      
      public function method_6483(param1:Vector.<class_2551>) : void
      {
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = param1.length;
         while(_loc2_ < _loc3_)
         {
            if((_loc4_ = int(this.var_278.indexOf(param1[_loc2_]))) != -1)
            {
               this.var_278.splice(_loc4_,1);
            }
            _loc2_++;
         }
      }
      
      public function method_1335() : void
      {
         var _loc2_:int = 0;
         var _loc1_:int = int(this.var_278.length);
         if(hasEventListener(class_2557.var_1584))
         {
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               dispatchEvent(new class_2557(class_2557.var_1584,this.var_278[_loc2_]));
               this.var_4480.method_1122(this.var_278[_loc2_]);
               _loc2_++;
            }
         }
         else
         {
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               this.var_4480.method_1122(this.var_278[_loc2_]);
               _loc2_++;
            }
         }
         this.var_278.length = 0;
      }
      
      public function start() : void
      {
         if(this.var_4065)
         {
            class_2554.instance.addEventListener(class_2553.UPDATE,this.method_2603,false,0,true);
         }
         this.var_4520 = true;
         this._running = true;
         var _loc1_:int = int(this.var_2231.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            class_2558(this.var_2231[_loc2_]).initialize(this);
            _loc2_++;
         }
         _loc1_ = int(this.var_1310.method_2399(this));
         _loc2_ = 0;
         while(_loc2_ < _loc1_)
         {
            this.method_1095();
            _loc2_++;
         }
      }
      
      private function method_2603(param1:class_2553) : void
      {
         if(this.var_972)
         {
            this.update(this.var_972);
         }
         else
         {
            this.update(param1.time);
         }
      }
      
      public function update(param1:Number) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(!this._running)
         {
            return;
         }
         if(param1 > this.var_2458)
         {
            param1 = Number(this.var_2458);
         }
         var _loc4_:int = int(this.var_1310.method_1910(this,param1));
         _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            this.method_1095();
            _loc2_++;
         }
         this.method_3022();
         _loc4_ = int(this.var_2231.length);
         _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            class_2558(this.var_2231[_loc2_]).update(this,param1);
            _loc2_++;
         }
         if(this.var_278.length > 0)
         {
            _loc4_ = int(this.var_1172.length);
            _loc6_ = int(this.var_278.length);
            _loc7_ = 0;
            while(_loc7_ < _loc4_)
            {
               _loc5_ = this.var_1172[_loc7_];
               _loc2_ = 0;
               while(_loc2_ < _loc6_)
               {
                  _loc3_ = this.var_278[_loc2_];
                  _loc5_.update(this,_loc3_,param1);
                  _loc2_++;
               }
               _loc7_++;
            }
            if(hasEventListener(class_2557.var_1584))
            {
               _loc2_ = _loc6_;
               while(_loc2_--)
               {
                  _loc3_ = this.var_278[_loc2_];
                  if(_loc3_.var_3064)
                  {
                     this.var_278.splice(_loc2_,1);
                     dispatchEvent(new class_2557(class_2557.var_1584,_loc3_));
                     if(_loc3_.var_3064)
                     {
                        this.var_4480.method_1122(_loc3_);
                     }
                  }
               }
            }
            else
            {
               _loc2_ = _loc6_;
               while(_loc2_--)
               {
                  _loc3_ = this.var_278[_loc2_];
                  if(_loc3_.var_3064)
                  {
                     this.var_278.splice(_loc2_,1);
                     if(_loc3_.var_3064)
                     {
                        this.var_4480.method_1122(_loc3_);
                     }
                  }
               }
            }
         }
         else if(hasEventListener(class_2556.var_1647))
         {
            dispatchEvent(new class_2556(class_2556.var_1647));
         }
         if(hasEventListener(class_2556.var_1366))
         {
            dispatchEvent(new class_2556(class_2556.var_1366));
         }
         if(this.var_3595)
         {
            this.var_3595 = false;
            if(hasEventListener(class_2556.var_2815))
            {
               dispatchEvent(new class_2556(class_2556.var_2815));
            }
         }
      }
      
      protected function method_3022() : void
      {
      }
      
      public function pause() : void
      {
         this._running = false;
      }
      
      public function resume() : void
      {
         this._running = true;
      }
      
      public function stop() : void
      {
         if(this.var_4065)
         {
            class_2554.instance.removeEventListener(class_2553.UPDATE,this.method_2603);
         }
         this.var_4520 = false;
         this._running = false;
         this.method_1335();
      }
      
      public function method_1372(param1:Number, param2:Number = 10) : void
      {
         var _loc3_:Number = Number(this.var_2458);
         var _loc4_:Number = 1 / param2;
         this.var_2458 = _loc4_;
         while(param1 > 0)
         {
            param1 -= _loc4_;
            this.update(_loc4_);
         }
         this.var_2458 = _loc3_;
      }
      
      private function method_5258(param1:class_2332, param2:class_2332) : Number
      {
         return Number(param1.priority) - Number(param2.priority);
      }
   }
}
