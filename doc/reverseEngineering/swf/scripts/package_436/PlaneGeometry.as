package package_436
{
   import away3d.arcane;
   import package_294.class_2602;
   
   public class PlaneGeometry extends class_2474
   {
       
      
      private var var_1685:uint;
      
      private var var_177:uint;
      
      private var var_1296:Boolean;
      
      private var _width:Number;
      
      private var _height:Number;
      
      private var var_3391:Boolean;
      
      public function PlaneGeometry(param1:Number = 100, param2:Number = 100, param3:uint = 1, param4:uint = 1, param5:Boolean = true, param6:Boolean = false)
      {
         super();
         this.var_1685 = param3;
         this.var_177 = param4;
         this.var_1296 = param5;
         this._width = param1;
         this._height = param2;
         this.var_3391 = param6;
      }
      
      public function get segmentsW() : uint
      {
         return this.var_1685;
      }
      
      public function set segmentsW(param1:uint) : void
      {
         this.var_1685 = param1;
         method_2121();
         method_596();
      }
      
      public function get segmentsH() : uint
      {
         return this.var_177;
      }
      
      public function set segmentsH(param1:uint) : void
      {
         this.var_177 = param1;
         method_2121();
         method_596();
      }
      
      public function get yUp() : Boolean
      {
         return this.var_1296;
      }
      
      public function set yUp(param1:Boolean) : void
      {
         this.var_1296 = param1;
         method_2121();
      }
      
      public function get method_1587() : Boolean
      {
         return this.var_3391;
      }
      
      public function set method_1587(param1:Boolean) : void
      {
         this.var_3391 = param1;
         method_2121();
      }
      
      public function get width() : Number
      {
         return this._width;
      }
      
      public function set width(param1:Number) : void
      {
         this._width = param1;
         method_2121();
      }
      
      public function get height() : Number
      {
         return this._height;
      }
      
      public function set height(param1:Number) : void
      {
         this._height = param1;
         method_2121();
      }
      
      override protected function method_389(param1:class_2602) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:* = 0;
         var _loc7_:* = 0;
         var _loc14_:Number = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc8_:uint = this.var_1685 + 1;
         var _loc9_:uint = (this.var_177 + 1) * _loc8_;
         var _loc10_:uint;
         var _loc11_:uint = (_loc10_ = uint(param1.method_4110)) - 9;
         if(this.var_3391)
         {
            _loc9_ *= 2;
         }
         _loc6_ = Number(this.var_177) * Number(this.var_1685) * 6;
         if(this.var_3391)
         {
            _loc6_ <<= 1;
         }
         if(_loc9_ == param1.numVertices)
         {
            _loc2_ = param1.name_104;
            _loc3_ = param1.indexData || new Vector.<uint>(_loc6_,true);
         }
         else
         {
            _loc2_ = new Vector.<Number>(_loc9_ * _loc10_,true);
            _loc3_ = new Vector.<uint>(_loc6_,true);
            method_596();
         }
         _loc6_ = 0;
         var _loc12_:uint = uint(param1.method_720);
         var _loc13_:Number = 0;
         while(_loc13_ <= this.var_177)
         {
            _loc14_ = 0;
            while(_loc14_ <= this.var_1685)
            {
               _loc4_ = (_loc14_ / Number(this.var_1685) - 0.5) * Number(this._width);
               _loc5_ = (_loc13_ / Number(this.var_177) - 0.5) * Number(this._height);
               var _loc17_:*;
               _loc2_[_loc17_ = _loc12_++] = _loc4_;
               if(this.var_1296)
               {
                  var _loc18_:*;
                  _loc2_[_loc18_ = _loc12_++] = 0;
                  var _loc19_:*;
                  _loc2_[_loc19_ = _loc12_++] = _loc5_;
               }
               else
               {
                  _loc2_[_loc18_ = _loc12_++] = _loc5_;
                  _loc2_[_loc19_ = _loc12_++] = 0;
               }
               _loc2_[_loc18_ = _loc12_++] = 0;
               if(this.var_1296)
               {
                  _loc2_[_loc19_ = _loc12_++] = 1;
                  var _loc20_:*;
                  _loc2_[_loc20_ = _loc12_++] = 0;
               }
               else
               {
                  _loc2_[_loc19_ = _loc12_++] = 0;
                  _loc2_[_loc20_ = _loc12_++] = -1;
               }
               _loc2_[_loc19_ = _loc12_++] = 1;
               _loc2_[_loc20_ = _loc12_++] = 0;
               var _loc21_:*;
               _loc2_[_loc21_ = _loc12_++] = 0;
               _loc12_ += _loc11_;
               if(this.var_3391)
               {
                  _loc15_ = 0;
                  while(_loc15_ < 3)
                  {
                     _loc2_[_loc12_] = _loc2_[_loc12_ - _loc10_];
                     _loc12_++;
                     _loc15_++;
                  }
                  _loc15_ = 0;
                  while(_loc15_ < 3)
                  {
                     _loc2_[_loc12_] = -_loc2_[_loc12_ - _loc10_];
                     _loc12_++;
                     _loc15_++;
                  }
                  _loc15_ = 0;
                  while(_loc15_ < 3)
                  {
                     _loc2_[_loc12_] = -_loc2_[_loc12_ - _loc10_];
                     _loc12_++;
                     _loc15_++;
                  }
                  _loc12_ += _loc11_;
               }
               if(_loc14_ != this.var_1685 && _loc13_ != this.var_177)
               {
                  _loc7_ = _loc14_ + _loc13_ * _loc8_;
                  _loc16_ = !!this.var_3391 ? 2 : 1;
                  var _loc22_:*;
                  _loc3_[_loc22_ = _loc6_++] = _loc7_ * _loc16_;
                  var _loc23_:*;
                  _loc3_[_loc23_ = _loc6_++] = (_loc7_ + _loc8_) * _loc16_;
                  var _loc24_:*;
                  _loc3_[_loc24_ = _loc6_++] = (_loc7_ + _loc8_ + 1) * _loc16_;
                  var _loc25_:*;
                  _loc3_[_loc25_ = _loc6_++] = _loc7_ * _loc16_;
                  var _loc26_:*;
                  _loc3_[_loc26_ = _loc6_++] = (_loc7_ + _loc8_ + 1) * _loc16_;
                  var _loc27_:*;
                  _loc3_[_loc27_ = _loc6_++] = (_loc7_ + 1) * _loc16_;
                  if(this.var_3391)
                  {
                     var _loc28_:*;
                     _loc3_[_loc28_ = _loc6_++] = (_loc7_ + _loc8_ + 1) * _loc16_ + 1;
                     var _loc29_:*;
                     _loc3_[_loc29_ = _loc6_++] = (_loc7_ + _loc8_) * _loc16_ + 1;
                     var _loc30_:*;
                     _loc3_[_loc30_ = _loc6_++] = _loc7_ * _loc16_ + 1;
                     var _loc31_:*;
                     _loc3_[_loc31_ = _loc6_++] = (_loc7_ + 1) * _loc16_ + 1;
                     var _loc32_:*;
                     _loc3_[_loc32_ = _loc6_++] = (_loc7_ + _loc8_ + 1) * _loc16_ + 1;
                     var _loc33_:*;
                     _loc3_[_loc33_ = _loc6_++] = _loc7_ * _loc16_ + 1;
                  }
               }
               _loc14_++;
            }
            _loc13_++;
         }
         param1.updateData(_loc2_);
         param1.updateIndexData(_loc3_);
      }
      
      override protected function method_1765(param1:class_2602) : void
      {
         var _loc2_:* = null;
         var _loc8_:Number = 0;
         var _loc3_:uint = uint(param1.method_2639);
         var _loc4_:uint = (this.var_177 + 1) * (this.var_1685 + 1) * _loc3_;
         var _loc5_:uint = _loc3_ - 2;
         if(this.var_3391)
         {
            _loc4_ *= 2;
         }
         if(Boolean(param1.method_868) && _loc4_ == param1.method_868.length)
         {
            _loc2_ = param1.method_868;
         }
         else
         {
            _loc2_ = new Vector.<Number>(_loc4_,true);
            method_2121();
         }
         var _loc6_:uint = uint(param1.method_2585);
         var _loc7_:Number = 0;
         while(_loc7_ <= this.var_177)
         {
            _loc8_ = 0;
            while(_loc8_ <= this.var_1685)
            {
               var _loc9_:*;
               _loc2_[_loc9_ = _loc6_++] = _loc8_ / Number(this.var_1685) * Number(param1.name_38);
               var _loc10_:*;
               _loc2_[_loc10_ = _loc6_++] = (1 - _loc7_ / Number(this.var_177)) * Number(param1.name_72);
               _loc6_ += _loc5_;
               if(this.var_3391)
               {
                  var _loc11_:*;
                  _loc2_[_loc11_ = _loc6_++] = _loc8_ / Number(this.var_1685) * Number(param1.name_38);
                  var _loc12_:*;
                  _loc2_[_loc12_ = _loc6_++] = (1 - _loc7_ / Number(this.var_177)) * Number(param1.name_72);
                  _loc6_ += _loc5_;
               }
               _loc8_++;
            }
            _loc7_++;
         }
         param1.updateData(_loc2_);
      }
   }
}
