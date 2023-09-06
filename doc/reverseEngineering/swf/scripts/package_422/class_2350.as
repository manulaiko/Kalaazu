package package_422
{
   import flash.geom.Point;
   import package_460.class_2552;
   
   public class class_2350 implements class_2348
   {
       
      
      private var _start:Point;
      
      private var var_1244:Point;
      
      private var _length:Point;
      
      private var _normal:Point;
      
      private var _parallel:Point;
      
      public function class_2350(param1:Point = null, param2:Point = null)
      {
         super();
         if(param1 == null)
         {
            this._start = new Point(0,0);
         }
         else
         {
            this._start = param1;
         }
         if(param2 == null)
         {
            this.var_1244 = new Point(0,0);
         }
         else
         {
            this.var_1244 = param2;
         }
         this.method_5016();
      }
      
      private function method_5016() : void
      {
         this._length = this.var_1244.subtract(this._start);
         this._parallel = this._length.clone();
         this._parallel.normalize(1);
         this._normal = new Point(this._parallel.y,-Number(this._parallel.x));
      }
      
      public function get start() : Point
      {
         return this._start;
      }
      
      public function set start(param1:Point) : void
      {
         this._start = param1;
         this.method_5016();
      }
      
      public function get end() : Point
      {
         return this.var_1244;
      }
      
      public function set end(param1:Point) : void
      {
         this.var_1244 = param1;
         this.method_5016();
      }
      
      public function get startX() : Number
      {
         return this._start.x;
      }
      
      public function set startX(param1:Number) : void
      {
         this._start.x = param1;
         this._length = this.var_1244.subtract(this._start);
      }
      
      public function get startY() : Number
      {
         return this._start.y;
      }
      
      public function set startY(param1:Number) : void
      {
         this._start.y = param1;
         this._length = this.var_1244.subtract(this._start);
      }
      
      public function get endX() : Number
      {
         return this.var_1244.x;
      }
      
      public function set endX(param1:Number) : void
      {
         this.var_1244.x = param1;
         this._length = this.var_1244.subtract(this._start);
      }
      
      public function get endY() : Number
      {
         return this.var_1244.y;
      }
      
      public function set endY(param1:Number) : void
      {
         this.var_1244.y = param1;
         this._length = this.var_1244.subtract(this._start);
      }
      
      public function contains(param1:Number, param2:Number) : Boolean
      {
         if((param1 - Number(this._start.x)) * Number(this._length.y) - (param2 - Number(this._start.y)) * Number(this._length.x) != 0)
         {
            return false;
         }
         return (param1 - Number(this._start.x)) * (param1 - Number(this.var_1244.x)) + (param2 - Number(this._start.y)) * (param2 - Number(this.var_1244.y)) <= 0;
      }
      
      public function getLocation() : Point
      {
         var _loc1_:Point = this._start.clone();
         var _loc2_:Number = Math.random();
         _loc1_.x += Number(this._length.x) * _loc2_;
         _loc1_.y += Number(this._length.y) * _loc2_;
         return _loc1_;
      }
      
      public function method_3613() : Number
      {
         return this._length.length;
      }
      
      public function method_423(param1:class_2552, param2:Number = 1) : Boolean
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc3_:Number = (Number(param1.var_789) - Number(this._start.x)) * Number(this._normal.x) + (Number(param1.var_2238) - Number(this._start.y)) * Number(this._normal.y);
         var _loc4_:Number = Number(param1.var_831) * Number(this._normal.x) + Number(param1.var_3765) * Number(this._normal.y);
         if(_loc3_ * _loc4_ >= 0)
         {
            return false;
         }
         var _loc5_:Number;
         if((_loc5_ = (Number(param1.x) - Number(this._start.x)) * Number(this._normal.x) + (Number(param1.y) - Number(this._start.y)) * Number(this._normal.y)) * _loc3_ > 0 && (_loc5_ > param1.var_386 || _loc5_ < -Number(param1.var_386)))
         {
            return false;
         }
         if(_loc3_ < 0)
         {
            _loc6_ = Number(this._normal.x) * Number(param1.var_386);
            _loc7_ = Number(this._normal.y) * Number(param1.var_386);
         }
         else
         {
            _loc6_ = -Number(this._normal.x) * Number(param1.var_386);
            _loc7_ = -Number(this._normal.y) * Number(param1.var_386);
         }
         var _loc8_:Number = param1.var_789 + _loc6_;
         var _loc9_:Number = param1.var_2238 + _loc7_;
         var _loc10_:Number = param1.x + _loc6_;
         var _loc11_:Number = param1.y + _loc7_;
         var _loc12_:Number = Number(this._start.x) - Number(this._parallel.x) * Number(param1.var_386);
         var _loc13_:Number = Number(this._start.y) - Number(this._parallel.y) * Number(param1.var_386);
         var _loc14_:Number = this.var_1244.x + Number(this._parallel.x) * Number(param1.var_386);
         var _loc15_:Number = this.var_1244.y + Number(this._parallel.y) * Number(param1.var_386);
         var _loc17_:Number;
         var _loc16_:Number;
         if((_loc17_ = (_loc16_ = 1 / ((_loc11_ - _loc9_) * (_loc14_ - _loc12_) - (_loc10_ - _loc8_) * (_loc15_ - _loc13_))) * ((_loc10_ - _loc8_) * (_loc13_ - _loc9_) - (_loc11_ - _loc9_) * (_loc12_ - _loc8_))) < 0 || _loc17_ > 1)
         {
            return false;
         }
         var _loc18_:Number;
         if((_loc18_ = -_loc16_ * ((_loc14_ - _loc12_) * (_loc9_ - _loc13_) - (_loc15_ - _loc13_) * (_loc8_ - _loc12_))) < 0 || _loc18_ > 1)
         {
            return false;
         }
         param1.x = param1.var_789 + _loc18_ * (Number(param1.x) - Number(param1.var_789));
         param1.y = param1.var_2238 + _loc18_ * (Number(param1.y) - Number(param1.var_2238));
         var _loc19_:Number = Number(this._normal.x) * Number(param1.var_831) + Number(this._normal.y) * Number(param1.var_3765);
         var _loc20_:Number = (1 + param2) * _loc19_;
         param1.var_831 -= _loc20_ * Number(this._normal.x);
         param1.var_3765 -= _loc20_ * Number(this._normal.y);
         return true;
      }
   }
}
