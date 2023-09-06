package package_422
{
   import flash.geom.Point;
   import package_460.class_2552;
   
   public class class_2351 implements class_2348
   {
      
      private static const const_1161:Number = 6.283185307179586;
       
      
      private var var_321:Point;
      
      private var var_611:Number;
      
      private var var_1594:Number;
      
      private var var_4735:Number;
      
      private var var_3589:Number;
      
      public function class_2351(param1:Point = null, param2:Number = 0, param3:Number = 0)
      {
         super();
         if(param2 < param3)
         {
            throw new Error("The outerRadius (" + param2 + ") can\'t be smaller than the innerRadius (" + param3 + ") in your DiscZone. N.B. the outerRadius is the second argument in the constructor and the innerRadius is the third argument.");
         }
         if(param1 == null)
         {
            this.var_321 = new Point(0,0);
         }
         else
         {
            this.var_321 = param1;
         }
         this.var_611 = param3;
         this.var_1594 = param2;
         this.var_4735 = Number(this.var_611) * Number(this.var_611);
         this.var_3589 = Number(this.var_1594) * Number(this.var_1594);
      }
      
      public function get center() : Point
      {
         return this.var_321;
      }
      
      public function set center(param1:Point) : void
      {
         this.var_321 = param1;
      }
      
      public function get centerX() : Number
      {
         return this.var_321.x;
      }
      
      public function set centerX(param1:Number) : void
      {
         this.var_321.x = param1;
      }
      
      public function get centerY() : Number
      {
         return this.var_321.y;
      }
      
      public function set centerY(param1:Number) : void
      {
         this.var_321.y = param1;
      }
      
      public function get innerRadius() : Number
      {
         return this.var_611;
      }
      
      public function set innerRadius(param1:Number) : void
      {
         this.var_611 = param1;
         this.var_4735 = Number(this.var_611) * Number(this.var_611);
      }
      
      public function get outerRadius() : Number
      {
         return this.var_1594;
      }
      
      public function set outerRadius(param1:Number) : void
      {
         this.var_1594 = param1;
         this.var_3589 = Number(this.var_1594) * Number(this.var_1594);
      }
      
      public function contains(param1:Number, param2:Number) : Boolean
      {
         param1 -= this.var_321.x;
         param2 -= this.var_321.y;
         var _loc3_:Number = param1 * param1 + param2 * param2;
         return _loc3_ <= this.var_3589 && _loc3_ >= this.var_4735;
      }
      
      public function getLocation() : Point
      {
         var _loc1_:Number = Math.random();
         var _loc2_:Point = Point.polar(this.var_611 + (1 - _loc1_ * _loc1_) * (Number(this.var_1594) - Number(this.var_611)),Math.random() * Number(const_1161));
         _loc2_.x += this.var_321.x;
         _loc2_.y += this.var_321.y;
         return _loc2_;
      }
      
      public function method_3613() : Number
      {
         return 0 * (Number(this.var_3589) - Number(this.var_4735));
      }
      
      public function method_423(param1:class_2552, param2:Number = 1) : Boolean
      {
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
         var _loc15_:Number = Number(param1.x) - Number(this.var_321.x);
         var _loc16_:Number = Number(param1.y) - Number(this.var_321.y);
         var _loc17_:Number;
         if((_loc17_ = Number(param1.var_831) * _loc15_ + Number(param1.var_3765) * _loc16_) < 0)
         {
            _loc3_ = this.var_1594 + param1.var_386;
            if(Math.abs(_loc15_) > _loc3_)
            {
               return false;
            }
            if(Math.abs(_loc16_) > _loc3_)
            {
               return false;
            }
            _loc7_ = _loc15_ * _loc15_ + _loc16_ * _loc16_;
            _loc5_ = _loc3_ * _loc3_;
            if(_loc7_ > _loc5_)
            {
               return false;
            }
            _loc9_ = Number(param1.var_789) - Number(this.var_321.x);
            _loc10_ = Number(param1.var_2238) - Number(this.var_321.y);
            if((_loc11_ = _loc9_ * _loc9_ + _loc10_ * _loc10_) > _loc5_)
            {
               _loc12_ = (1 + param2) * _loc17_ / _loc7_;
               param1.var_831 -= _loc12_ * _loc15_;
               param1.var_3765 -= _loc12_ * _loc16_;
               _loc8_ = Math.sqrt(_loc7_);
               _loc13_ = (2 * _loc3_ - _loc8_) / _loc8_ + 0.001;
               param1.x = this.var_321.x + _loc15_ * _loc13_;
               param1.y = this.var_321.y + _loc16_ * _loc13_;
               return true;
            }
            if(this.var_611 != 0 && this.innerRadius != this.var_1594)
            {
               _loc4_ = this.var_611 + param1.var_386;
               if(Math.abs(_loc15_) > _loc4_)
               {
                  return false;
               }
               if(Math.abs(_loc16_) > _loc4_)
               {
                  return false;
               }
               _loc6_ = _loc4_ * _loc4_;
               if(_loc7_ > _loc6_)
               {
                  return false;
               }
               if(_loc11_ > _loc6_)
               {
                  _loc12_ = (1 + param2) * _loc17_ / _loc7_;
                  param1.var_831 -= _loc12_ * _loc15_;
                  param1.var_3765 -= _loc12_ * _loc16_;
                  _loc8_ = Math.sqrt(_loc7_);
                  _loc13_ = (2 * _loc4_ - _loc8_) / _loc8_ + 0.001;
                  param1.x = this.var_321.x + _loc15_ * _loc13_;
                  param1.y = this.var_321.y + _loc16_ * _loc13_;
                  return true;
               }
            }
            return false;
         }
         _loc3_ = Number(this.var_1594) - Number(param1.var_386);
         _loc9_ = Number(param1.var_789) - Number(this.var_321.x);
         _loc10_ = Number(param1.var_2238) - Number(this.var_321.y);
         if(Math.abs(_loc9_) > _loc3_)
         {
            return false;
         }
         if(Math.abs(_loc10_) > _loc3_)
         {
            return false;
         }
         _loc11_ = _loc9_ * _loc9_ + _loc10_ * _loc10_;
         _loc5_ = _loc3_ * _loc3_;
         if(_loc11_ > _loc5_)
         {
            return false;
         }
         _loc7_ = _loc15_ * _loc15_ + _loc16_ * _loc16_;
         if(this.var_611 != 0 && this.innerRadius != this.var_1594)
         {
            _loc4_ = Number(this.var_611) - Number(param1.var_386);
            _loc6_ = _loc4_ * _loc4_;
            if(_loc11_ < _loc6_ && _loc7_ >= _loc6_)
            {
               _loc12_ = (1 + param2) * _loc17_ / _loc7_;
               param1.var_831 -= _loc12_ * _loc15_;
               param1.var_3765 -= _loc12_ * _loc16_;
               _loc8_ = Math.sqrt(_loc7_);
               _loc13_ = (2 * _loc4_ - _loc8_) / _loc8_ - 0.001;
               param1.x = this.var_321.x + _loc15_ * _loc13_;
               param1.y = this.var_321.y + _loc16_ * _loc13_;
               return true;
            }
         }
         if(_loc7_ >= _loc5_)
         {
            _loc12_ = (1 + param2) * _loc17_ / _loc7_;
            param1.var_831 -= _loc12_ * _loc15_;
            param1.var_3765 -= _loc12_ * _loc16_;
            _loc8_ = Math.sqrt(_loc7_);
            _loc13_ = (2 * _loc3_ - _loc8_) / _loc8_ - 0.001;
            param1.x = this.var_321.x + _loc15_ * _loc13_;
            param1.y = this.var_321.y + _loc16_ * _loc13_;
            return true;
         }
         return false;
      }
   }
}
