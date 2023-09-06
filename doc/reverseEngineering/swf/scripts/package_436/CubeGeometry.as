package package_436
{
   import away3d.arcane;
   import package_294.class_2602;
   
   public class CubeGeometry extends class_2474
   {
       
      
      private var _width:Number;
      
      private var _height:Number;
      
      private var _depth:Number;
      
      private var var_2122:Boolean;
      
      private var var_1685:Number;
      
      private var var_177:Number;
      
      private var var_3757:Number;
      
      public function CubeGeometry(param1:Number = 100, param2:Number = 100, param3:Number = 100, param4:uint = 1, param5:uint = 1, param6:uint = 1, param7:Boolean = true)
      {
         super();
         this._width = param1;
         this._height = param2;
         this._depth = param3;
         this.var_1685 = param4;
         this.var_177 = param5;
         this.var_3757 = param6;
         this.var_2122 = param7;
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
      
      public function get depth() : Number
      {
         return this._depth;
      }
      
      public function set depth(param1:Number) : void
      {
         this._depth = param1;
         method_2121();
      }
      
      public function get method_4460() : Boolean
      {
         return this.var_2122;
      }
      
      public function set method_4460(param1:Boolean) : void
      {
         this.var_2122 = param1;
         method_596();
      }
      
      public function get segmentsW() : Number
      {
         return this.var_1685;
      }
      
      public function set segmentsW(param1:Number) : void
      {
         this.var_1685 = param1;
         method_2121();
         method_596();
      }
      
      public function get segmentsH() : Number
      {
         return this.var_177;
      }
      
      public function set segmentsH(param1:Number) : void
      {
         this.var_177 = param1;
         method_2121();
         method_596();
      }
      
      public function get method_4224() : Number
      {
         return this.var_3757;
      }
      
      public function set method_4224(param1:Number) : void
      {
         this.var_3757 = param1;
         method_2121();
         method_596();
      }
      
      override protected function method_389(param1:class_2602) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = 0;
         var _loc5_:* = 0;
         var _loc6_:* = 0;
         var _loc7_:* = 0;
         var _loc8_:Number = 0;
         var _loc9_:Number = 0;
         var _loc11_:* = 0;
         var _loc12_:Number = 0;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc10_:* = 0;
         var _loc20_:uint = ((this.var_1685 + 1) * (this.var_177 + 1) + (this.var_1685 + 1) * (this.var_3757 + 1) + (this.var_177 + 1) * (this.var_3757 + 1)) * 2;
         var _loc21_:uint;
         var _loc22_:uint = (_loc21_ = uint(param1.method_4110)) - 9;
         if(_loc20_ == param1.numVertices)
         {
            _loc2_ = param1.name_104;
            _loc3_ = param1.indexData || new Vector.<uint>((Number(this.var_1685) * Number(this.var_177) + Number(this.var_1685) * Number(this.var_3757) + Number(this.var_177) * Number(this.var_3757)) * 12,true);
         }
         else
         {
            _loc2_ = new Vector.<Number>(_loc20_ * _loc21_,true);
            _loc3_ = new Vector.<uint>((Number(this.var_1685) * Number(this.var_177) + Number(this.var_1685) * Number(this.var_3757) + Number(this.var_177) * Number(this.var_3757)) * 12,true);
            method_596();
         }
         _loc11_ = uint(param1.method_720);
         _loc12_ = 0;
         _loc13_ = Number(this._width) / 2;
         _loc14_ = Number(this._height) / 2;
         _loc15_ = Number(this._depth) / 2;
         _loc16_ = Number(this._width) / Number(this.var_1685);
         _loc17_ = Number(this._height) / Number(this.var_177);
         _loc18_ = Number(this._depth) / Number(this.var_3757);
         _loc8_ = 0;
         while(_loc8_ <= this.var_1685)
         {
            _loc19_ = -_loc13_ + _loc8_ * _loc16_;
            _loc9_ = 0;
            while(_loc9_ <= this.var_177)
            {
               var _loc23_:*;
               _loc2_[_loc23_ = _loc11_++] = _loc19_;
               var _loc24_:*;
               _loc2_[_loc24_ = _loc11_++] = -_loc14_ + _loc9_ * _loc17_;
               var _loc25_:*;
               _loc2_[_loc25_ = _loc11_++] = -_loc15_;
               var _loc26_:*;
               _loc2_[_loc26_ = _loc11_++] = 0;
               var _loc27_:*;
               _loc2_[_loc27_ = _loc11_++] = 0;
               var _loc28_:*;
               _loc2_[_loc28_ = _loc11_++] = -1;
               var _loc29_:*;
               _loc2_[_loc29_ = _loc11_++] = 1;
               var _loc30_:*;
               _loc2_[_loc30_ = _loc11_++] = 0;
               var _loc31_:*;
               _loc2_[_loc31_ = _loc11_++] = 0;
               _loc11_ += _loc22_;
               var _loc32_:*;
               _loc2_[_loc32_ = _loc11_++] = _loc19_;
               var _loc33_:*;
               _loc2_[_loc33_ = _loc11_++] = -_loc14_ + _loc9_ * _loc17_;
               var _loc34_:*;
               _loc2_[_loc34_ = _loc11_++] = _loc15_;
               var _loc35_:*;
               _loc2_[_loc35_ = _loc11_++] = 0;
               var _loc36_:*;
               _loc2_[_loc36_ = _loc11_++] = 0;
               var _loc37_:*;
               _loc2_[_loc37_ = _loc11_++] = 1;
               var _loc38_:*;
               _loc2_[_loc38_ = _loc11_++] = -1;
               var _loc39_:*;
               _loc2_[_loc39_ = _loc11_++] = 0;
               var _loc40_:*;
               _loc2_[_loc40_ = _loc11_++] = 0;
               _loc11_ += _loc22_;
               if(Boolean(_loc8_) && Boolean(_loc9_))
               {
                  _loc4_ = 2 * ((_loc8_ - 1) * (this.var_177 + 1) + (_loc9_ - 1));
                  _loc5_ = 2 * (_loc8_ * (this.var_177 + 1) + (_loc9_ - 1));
                  _loc6_ = _loc4_ + 2;
                  _loc7_ = _loc5_ + 2;
                  var _loc41_:*;
                  _loc3_[_loc41_ = _loc12_++] = _loc4_;
                  var _loc42_:*;
                  _loc3_[_loc42_ = _loc12_++] = _loc6_;
                  var _loc43_:*;
                  _loc3_[_loc43_ = _loc12_++] = _loc7_;
                  var _loc44_:*;
                  _loc3_[_loc44_ = _loc12_++] = _loc4_;
                  var _loc45_:*;
                  _loc3_[_loc45_ = _loc12_++] = _loc7_;
                  var _loc46_:*;
                  _loc3_[_loc46_ = _loc12_++] = _loc5_;
                  var _loc47_:*;
                  _loc3_[_loc47_ = _loc12_++] = _loc5_ + 1;
                  var _loc48_:*;
                  _loc3_[_loc48_ = _loc12_++] = _loc7_ + 1;
                  var _loc49_:*;
                  _loc3_[_loc49_ = _loc12_++] = _loc6_ + 1;
                  var _loc50_:*;
                  _loc3_[_loc50_ = _loc12_++] = _loc5_ + 1;
                  var _loc51_:*;
                  _loc3_[_loc51_ = _loc12_++] = _loc6_ + 1;
                  var _loc52_:*;
                  _loc3_[_loc52_ = _loc12_++] = _loc4_ + 1;
               }
               _loc9_++;
            }
            _loc8_++;
         }
         _loc10_ += 2 * (this.var_1685 + 1) * (this.var_177 + 1);
         _loc8_ = 0;
         while(_loc8_ <= this.var_1685)
         {
            _loc19_ = -_loc13_ + _loc8_ * _loc16_;
            _loc9_ = 0;
            while(_loc9_ <= this.var_3757)
            {
               _loc2_[_loc23_ = _loc11_++] = _loc19_;
               _loc2_[_loc24_ = _loc11_++] = _loc14_;
               _loc2_[_loc25_ = _loc11_++] = -_loc15_ + _loc9_ * _loc18_;
               _loc2_[_loc26_ = _loc11_++] = 0;
               _loc2_[_loc27_ = _loc11_++] = 1;
               _loc2_[_loc28_ = _loc11_++] = 0;
               _loc2_[_loc29_ = _loc11_++] = 1;
               _loc2_[_loc30_ = _loc11_++] = 0;
               _loc2_[_loc31_ = _loc11_++] = 0;
               _loc11_ += _loc22_;
               _loc2_[_loc32_ = _loc11_++] = _loc19_;
               _loc2_[_loc33_ = _loc11_++] = -_loc14_;
               _loc2_[_loc34_ = _loc11_++] = -_loc15_ + _loc9_ * _loc18_;
               _loc2_[_loc35_ = _loc11_++] = 0;
               _loc2_[_loc36_ = _loc11_++] = -1;
               _loc2_[_loc37_ = _loc11_++] = 0;
               _loc2_[_loc38_ = _loc11_++] = 1;
               _loc2_[_loc39_ = _loc11_++] = 0;
               _loc2_[_loc40_ = _loc11_++] = 0;
               _loc11_ += _loc22_;
               if(Boolean(_loc8_) && Boolean(_loc9_))
               {
                  _loc4_ = _loc10_ + 2 * ((_loc8_ - 1) * (this.var_3757 + 1) + (_loc9_ - 1));
                  _loc5_ = _loc10_ + 2 * (_loc8_ * (this.var_3757 + 1) + (_loc9_ - 1));
                  _loc6_ = _loc4_ + 2;
                  _loc7_ = _loc5_ + 2;
                  _loc3_[_loc41_ = _loc12_++] = _loc4_;
                  _loc3_[_loc42_ = _loc12_++] = _loc6_;
                  _loc3_[_loc43_ = _loc12_++] = _loc7_;
                  _loc3_[_loc44_ = _loc12_++] = _loc4_;
                  _loc3_[_loc45_ = _loc12_++] = _loc7_;
                  _loc3_[_loc46_ = _loc12_++] = _loc5_;
                  _loc3_[_loc47_ = _loc12_++] = _loc5_ + 1;
                  _loc3_[_loc48_ = _loc12_++] = _loc7_ + 1;
                  _loc3_[_loc49_ = _loc12_++] = _loc6_ + 1;
                  _loc3_[_loc50_ = _loc12_++] = _loc5_ + 1;
                  _loc3_[_loc51_ = _loc12_++] = _loc6_ + 1;
                  _loc3_[_loc52_ = _loc12_++] = _loc4_ + 1;
               }
               _loc9_++;
            }
            _loc8_++;
         }
         _loc10_ += 2 * (this.var_1685 + 1) * (this.var_3757 + 1);
         _loc8_ = 0;
         while(_loc8_ <= this.var_3757)
         {
            _loc19_ = _loc15_ - _loc8_ * _loc18_;
            _loc9_ = 0;
            while(_loc9_ <= this.var_177)
            {
               _loc2_[_loc23_ = _loc11_++] = -_loc13_;
               _loc2_[_loc24_ = _loc11_++] = -_loc14_ + _loc9_ * _loc17_;
               _loc2_[_loc25_ = _loc11_++] = _loc19_;
               _loc2_[_loc26_ = _loc11_++] = -1;
               _loc2_[_loc27_ = _loc11_++] = 0;
               _loc2_[_loc28_ = _loc11_++] = 0;
               _loc2_[_loc29_ = _loc11_++] = 0;
               _loc2_[_loc30_ = _loc11_++] = 0;
               _loc2_[_loc31_ = _loc11_++] = -1;
               _loc11_ += _loc22_;
               _loc2_[_loc32_ = _loc11_++] = _loc13_;
               _loc2_[_loc33_ = _loc11_++] = -_loc14_ + _loc9_ * _loc17_;
               _loc2_[_loc34_ = _loc11_++] = _loc19_;
               _loc2_[_loc35_ = _loc11_++] = 1;
               _loc2_[_loc36_ = _loc11_++] = 0;
               _loc2_[_loc37_ = _loc11_++] = 0;
               _loc2_[_loc38_ = _loc11_++] = 0;
               _loc2_[_loc39_ = _loc11_++] = 0;
               _loc2_[_loc40_ = _loc11_++] = 1;
               _loc11_ += _loc22_;
               if(Boolean(_loc8_) && Boolean(_loc9_))
               {
                  _loc4_ = _loc10_ + 2 * ((_loc8_ - 1) * (this.var_177 + 1) + (_loc9_ - 1));
                  _loc5_ = _loc10_ + 2 * (_loc8_ * (this.var_177 + 1) + (_loc9_ - 1));
                  _loc6_ = _loc4_ + 2;
                  _loc7_ = _loc5_ + 2;
                  _loc3_[_loc41_ = _loc12_++] = _loc4_;
                  _loc3_[_loc42_ = _loc12_++] = _loc6_;
                  _loc3_[_loc43_ = _loc12_++] = _loc7_;
                  _loc3_[_loc44_ = _loc12_++] = _loc4_;
                  _loc3_[_loc45_ = _loc12_++] = _loc7_;
                  _loc3_[_loc46_ = _loc12_++] = _loc5_;
                  _loc3_[_loc47_ = _loc12_++] = _loc5_ + 1;
                  _loc3_[_loc48_ = _loc12_++] = _loc7_ + 1;
                  _loc3_[_loc49_ = _loc12_++] = _loc6_ + 1;
                  _loc3_[_loc50_ = _loc12_++] = _loc5_ + 1;
                  _loc3_[_loc51_ = _loc12_++] = _loc6_ + 1;
                  _loc3_[_loc52_ = _loc12_++] = _loc4_ + 1;
               }
               _loc9_++;
            }
            _loc8_++;
         }
         param1.updateData(_loc2_);
         param1.updateIndexData(_loc3_);
      }
      
      override protected function method_1765(param1:class_2602) : void
      {
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         var _loc4_:* = 0;
         var _loc5_:* = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:uint = uint(param1.method_2639);
         var _loc17_:uint = ((this.var_1685 + 1) * (this.var_177 + 1) + (this.var_1685 + 1) * (this.var_3757 + 1) + (this.var_177 + 1) * (this.var_3757 + 1)) * 2 * _loc16_;
         var _loc18_:uint = _loc16_ - 2;
         if(Boolean(param1.method_868) && _loc17_ == param1.method_868.length)
         {
            _loc5_ = param1.method_868;
         }
         else
         {
            _loc5_ = new Vector.<Number>(_loc17_,true);
            method_2121();
         }
         if(this.var_2122)
         {
            _loc6_ = _loc8_ = 0.3333333333333333;
            _loc7_ = _loc9_ = 0.5;
         }
         else
         {
            _loc6_ = _loc7_ = 1;
            _loc8_ = _loc9_ = 0;
         }
         _loc4_ = uint(param1.method_2585);
         _loc10_ = 1 * _loc8_;
         _loc11_ = 1 * _loc9_;
         _loc12_ = 2 * _loc8_;
         _loc13_ = 0 * _loc9_;
         _loc14_ = _loc6_ / Number(this.var_1685);
         _loc15_ = _loc7_ / Number(this.var_177);
         _loc2_ = 0;
         while(_loc2_ <= this.var_1685)
         {
            _loc3_ = 0;
            while(_loc3_ <= this.var_177)
            {
               var _loc19_:*;
               _loc5_[_loc19_ = _loc4_++] = (_loc10_ + _loc2_ * _loc14_) * Number(param1.name_38);
               var _loc20_:*;
               _loc5_[_loc20_ = _loc4_++] = (_loc11_ + (_loc7_ - _loc3_ * _loc15_)) * Number(param1.name_72);
               _loc4_ += _loc18_;
               var _loc21_:*;
               _loc5_[_loc21_ = _loc4_++] = (_loc12_ + (_loc6_ - _loc2_ * _loc14_)) * Number(param1.name_38);
               var _loc22_:*;
               _loc5_[_loc22_ = _loc4_++] = (_loc13_ + (_loc7_ - _loc3_ * _loc15_)) * Number(param1.name_72);
               _loc4_ += _loc18_;
               _loc3_++;
            }
            _loc2_++;
         }
         _loc10_ = 1 * _loc8_;
         _loc11_ = 0 * _loc9_;
         _loc12_ = 0 * _loc8_;
         _loc13_ = 0 * _loc9_;
         _loc14_ = _loc6_ / Number(this.var_1685);
         _loc15_ = _loc7_ / Number(this.var_3757);
         _loc2_ = 0;
         while(_loc2_ <= this.var_1685)
         {
            _loc3_ = 0;
            while(_loc3_ <= this.var_3757)
            {
               _loc5_[_loc19_ = _loc4_++] = (_loc10_ + _loc2_ * _loc14_) * Number(param1.name_38);
               _loc5_[_loc20_ = _loc4_++] = (_loc11_ + (_loc7_ - _loc3_ * _loc15_)) * Number(param1.name_72);
               _loc4_ += _loc18_;
               _loc5_[_loc21_ = _loc4_++] = (_loc12_ + _loc2_ * _loc14_) * Number(param1.name_38);
               _loc5_[_loc22_ = _loc4_++] = (_loc13_ + _loc3_ * _loc15_) * Number(param1.name_72);
               _loc4_ += _loc18_;
               _loc3_++;
            }
            _loc2_++;
         }
         _loc10_ = 0 * _loc8_;
         _loc11_ = 1 * _loc9_;
         _loc12_ = 2 * _loc8_;
         _loc13_ = 1 * _loc9_;
         _loc14_ = _loc6_ / Number(this.var_3757);
         _loc15_ = _loc7_ / Number(this.var_177);
         _loc2_ = 0;
         while(_loc2_ <= this.var_3757)
         {
            _loc3_ = 0;
            while(_loc3_ <= this.var_177)
            {
               _loc5_[_loc19_ = _loc4_++] = (_loc10_ + _loc2_ * _loc14_) * Number(param1.name_38);
               _loc5_[_loc20_ = _loc4_++] = (_loc11_ + (_loc7_ - _loc3_ * _loc15_)) * Number(param1.name_72);
               _loc4_ += _loc18_;
               _loc5_[_loc21_ = _loc4_++] = (_loc12_ + (_loc6_ - _loc2_ * _loc14_)) * Number(param1.name_38);
               _loc5_[_loc22_ = _loc4_++] = (_loc13_ + (_loc7_ - _loc3_ * _loc15_)) * Number(param1.name_72);
               _loc4_ += _loc18_;
               _loc3_++;
            }
            _loc2_++;
         }
         param1.updateData(_loc5_);
      }
   }
}
