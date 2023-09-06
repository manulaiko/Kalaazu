package package_430
{
   import away3d.animators.class_2120;
   import package_199.class_2478;
   import package_431.class_2435;
   
   public class class_2440 extends class_2400
   {
       
      
      private var var_4380:class_2435;
      
      private var var_588:class_2478;
      
      protected var var_2940:Number;
      
      protected var var_1857:uint;
      
      protected var var_1424:uint;
      
      protected var var_3035:Boolean = true;
      
      public function class_2440(param1:class_2120, param2:class_2435)
      {
         super(param1,param2);
         this.var_4380 = param2;
      }
      
      public function get method_509() : Number
      {
         if(this.var_3035)
         {
            this.method_1483();
         }
         return this.var_2940;
      }
      
      public function get currentFrame() : uint
      {
         if(this.var_3035)
         {
            this.method_1483();
         }
         return this.var_1857;
      }
      
      public function get nextFrame() : uint
      {
         if(this.var_3035)
         {
            this.method_1483();
         }
         return this.var_1424;
      }
      
      override public function set time(param1:int) : void
      {
         if(!this.var_4380.method_3310)
         {
            if(param1 > this.var_4380.totalDuration)
            {
               param1 = int(this.var_4380.totalDuration);
            }
            else if(param1 < 0)
            {
               param1 = 0;
            }
         }
         this.var_3035 = true;
         super.time = param1;
      }
      
      protected function method_1483() : void
      {
         var _loc5_:* = 0;
         var _loc6_:* = 0;
         var _loc7_:* = null;
         this.var_3035 = false;
         var _loc1_:Boolean = Boolean(this.var_4380.method_3310);
         var _loc2_:uint = uint(this.var_4380.totalDuration);
         var _loc3_:uint = uint(this.var_4380.lastFrame);
         var _loc4_:int = int(_time);
         if(_loc1_ && (_loc4_ > _loc2_ || _loc4_ < 0))
         {
            if((_loc4_ %= _loc2_) < 0)
            {
               _loc4_ += _loc2_;
            }
         }
         if(!_loc1_ && _loc4_ >= _loc2_)
         {
            this.method_3646();
            this.var_1857 = _loc3_;
            this.var_1424 = _loc3_;
            this.var_2940 = 0;
         }
         else if(!_loc1_ && _loc4_ <= 0)
         {
            this.var_1857 = 0;
            this.var_1424 = 0;
            this.var_2940 = 0;
         }
         else
         {
            this.var_1857 = 0;
            this.var_1424 = 0;
            _loc5_ = 0;
            _loc7_ = this.var_4380.method_1948;
            do
            {
               _loc6_ = _loc5_;
               _loc5_ += _loc7_[this.nextFrame];
               this.var_1857 = this.var_1424++;
            }
            while(_loc4_ > _loc5_);
            
            if(this.var_1857 == _loc3_)
            {
               this.var_1857 = _loc3_;
               this.var_1424 = !!this.var_4380.method_6520 ? 0 : _loc3_;
            }
            this.var_2940 = this.method_2295(_loc4_ - _loc6_,_loc7_[this.var_1857]);
         }
      }
      
      protected function method_2295(param1:uint, param2:uint) : Number
      {
         return param1 / param2;
      }
      
      private function method_3646() : void
      {
         var _loc1_:* = this.var_588 || new class_2478(class_2478.const_665,_animator,this,this.var_4380);
         this.var_588 = this.var_588 || new class_2478(class_2478.const_665,_animator,this,this.var_4380);
         this.var_4380.dispatchEvent(_loc1_);
      }
   }
}
