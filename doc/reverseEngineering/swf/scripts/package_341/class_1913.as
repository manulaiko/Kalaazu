package package_341
{
   public class class_1913 extends class_1911 implements class_1912
   {
       
      
      private var var_2280:Number;
      
      private var _s:Number;
      
      private var var_171:Number;
      
      public function class_1913(param1:Number = 0, param2:Number = 1, param3:Number = 1)
      {
         this.var_2280 = param1 % 360;
         this._s = Math.max(0,Math.min(param2,1));
         this.var_171 = Math.max(0,Math.min(param3,1));
         super();
      }
      
      public static function method_6537(param1:uint) : class_1913
      {
         var _loc2_:class_1913 = new class_1913();
         _loc2_.method_3795 = param1;
         return _loc2_;
      }
      
      public function get h() : Number
      {
         return this.var_2280;
      }
      
      public function get s() : Number
      {
         return this._s;
      }
      
      public function get v() : Number
      {
         return this.var_171;
      }
      
      public function set h(param1:Number) : void
      {
         param1 %= 360;
         if(this.var_2280 != param1)
         {
            this.var_2280 = param1;
            method_5521();
         }
      }
      
      public function set s(param1:Number) : void
      {
         if(this._s != param1)
         {
            this._s = param1;
            method_5521();
         }
      }
      
      public function set v(param1:Number) : void
      {
         if(this.var_171 != param1)
         {
            this.var_171 = param1;
            method_5521();
         }
      }
      
      public function method_6197(param1:Number, param2:Number, param3:Number) : void
      {
         param1 %= 360;
         param2 = Math.max(0,Math.min(param2,1));
         param3 = Math.max(0,Math.min(param3,1));
         if(this.var_2280 != param1 || this._s != param2 || this.var_171 != param3)
         {
            this.var_2280 = param1;
            this._s = param2;
            this.var_171 = param3;
            method_5521();
         }
      }
      
      public function clone() : class_1912
      {
         return new class_1913(this.var_2280,this._s,this.var_171);
      }
      
      override public function copyFrom(param1:class_1912, param2:Boolean = true) : void
      {
         if(param1 is class_1913)
         {
            if(param2)
            {
               this.alpha = param1.alpha;
            }
            this.method_6197(class_1913(param1).h,class_1913(param1).s,class_1913(param1).v);
         }
         else
         {
            super.copyFrom(param1,param2);
         }
      }
      
      override protected function method_3083() : void
      {
         var _loc1_:uint = Number(method_3795) >> 16 & 255;
         var _loc2_:uint = Number(method_3795) >> 8 & 255;
         var _loc3_:uint = Number(method_3795) >> 0 & 255;
         var _loc4_:uint = Math.min(_loc1_,_loc2_,_loc3_);
         var _loc5_:uint = Math.max(_loc1_,_loc2_,_loc3_);
         var _loc6_:Number = 0;
         var _loc7_:Number = 0;
         if(_loc4_ != _loc5_)
         {
            if(_loc1_ == _loc4_)
            {
               _loc6_ = _loc2_ - _loc3_;
               _loc7_ = 3;
            }
            else if(_loc2_ == _loc4_)
            {
               _loc6_ = _loc3_ - _loc1_;
               _loc7_ = 5;
            }
            else
            {
               _loc6_ = _loc1_ - _loc2_;
               _loc7_ = 1;
            }
         }
         this.var_2280 = (_loc7_ - _loc6_ / (_loc5_ - _loc4_)) * 60 % 360 || false;
         this._s = (_loc5_ - _loc4_) / _loc5_ || false;
         this.var_171 = _loc5_ / 255;
      }
      
      override protected function method_2965() : uint
      {
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc1_:Number = 0;
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         if(this.v == 1 && this.s == 0)
         {
            _loc1_ = 1;
            _loc2_ = 1;
            _loc3_ = 1;
         }
         else if(this.v != 0)
         {
            _loc4_ = Number(this.h) / 60;
            _loc5_ = int(_loc4_);
            _loc6_ = _loc4_ - _loc5_;
            _loc7_ = Number(this.v) * (1 - Number(this.s));
            _loc8_ = Number(this.v) * (1 - Number(this.s) * _loc6_);
            _loc9_ = Number(this.v) * (1 - Number(this.s) * (1 - _loc6_));
            if(_loc5_ == 0)
            {
               _loc1_ = Number(this.v);
               _loc2_ = _loc9_;
               _loc3_ = _loc7_;
            }
            else if(_loc5_ == 1)
            {
               _loc1_ = _loc8_;
               _loc2_ = Number(this.v);
               _loc3_ = _loc7_;
            }
            else if(_loc5_ == 2)
            {
               _loc1_ = _loc7_;
               _loc2_ = Number(this.v);
               _loc3_ = _loc9_;
            }
            else if(_loc5_ == 3)
            {
               _loc1_ = _loc7_;
               _loc2_ = _loc8_;
               _loc3_ = Number(this.v);
            }
            else if(_loc5_ == 4)
            {
               _loc1_ = _loc9_;
               _loc2_ = _loc7_;
               _loc3_ = Number(this.v);
            }
            else if(_loc5_ == 5)
            {
               _loc1_ = Number(this.v);
               _loc2_ = _loc7_;
               _loc3_ = _loc8_;
            }
         }
         return _loc1_ * 255 << 16 | _loc2_ * 255 << 8 | _loc3_ * 255;
      }
   }
}
