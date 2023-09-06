package package_436
{
   import away3d.arcane;
   import package_294.class_2602;
   
   public class CylinderGeometry extends class_2474
   {
       
      
      protected var var_4771:Number;
      
      protected var var_2912:Number;
      
      protected var _height:Number;
      
      protected var var_1685:uint;
      
      protected var var_177:uint;
      
      protected var var_2622:Boolean;
      
      protected var var_4673:Boolean;
      
      protected var var_1722:Boolean;
      
      protected var var_1296:Boolean;
      
      private var var_2823:Vector.<Number>;
      
      private var var_280:Vector.<uint>;
      
      private var var_4876:uint;
      
      private var _currentIndex:uint;
      
      private var var_4692:uint;
      
      private var var_490:uint;
      
      private var var_2541:uint;
      
      private var var_1321:uint;
      
      public function CylinderGeometry(param1:Number = 50, param2:Number = 50, param3:Number = 100, param4:uint = 16, param5:uint = 1, param6:Boolean = true, param7:Boolean = true, param8:Boolean = true, param9:Boolean = true)
      {
         super();
         this.var_4771 = param1;
         this.var_2912 = param2;
         this._height = param3;
         this.var_1685 = param4;
         this.var_177 = param5;
         this.var_2622 = param6;
         this.var_4673 = param7;
         this.var_1722 = param8;
         this.var_1296 = param9;
      }
      
      private function method_39(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number) : void
      {
         var _loc10_:uint = this.var_1321 + Number(this.var_4876) * Number(this.var_2541);
         var _loc11_:*;
         this.var_2823[_loc11_ = _loc10_++] = param1;
         var _loc12_:*;
         this.var_2823[_loc12_ = _loc10_++] = param2;
         var _loc13_:*;
         this.var_2823[_loc13_ = _loc10_++] = param3;
         var _loc14_:*;
         this.var_2823[_loc14_ = _loc10_++] = param4;
         var _loc15_:*;
         this.var_2823[_loc15_ = _loc10_++] = param5;
         var _loc16_:*;
         this.var_2823[_loc16_ = _loc10_++] = param6;
         var _loc17_:*;
         this.var_2823[_loc17_ = _loc10_++] = param7;
         var _loc18_:*;
         this.var_2823[_loc18_ = _loc10_++] = param8;
         var _loc19_:*;
         this.var_2823[_loc19_ = _loc10_++] = param9;
         ++this.var_4876;
      }
      
      private function method_3952(param1:uint, param2:uint, param3:uint) : void
      {
         var _loc4_:*;
         this.var_280[_loc4_ = this._currentIndex++] = param1;
         var _loc5_:*;
         this.var_280[_loc5_ = this._currentIndex++] = param2;
         var _loc6_:*;
         this.var_280[_loc6_ = this._currentIndex++] = param3;
         ++this.var_4692;
      }
      
      override protected function method_389(param1:class_2602) : void
      {
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:* = 0;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc19_:* = 0;
         var _loc20_:* = 0;
         var _loc21_:* = 0;
         var _loc22_:* = 0;
         var _loc23_:* = 0;
         var _loc24_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc27_:Number = NaN;
         var _loc12_:* = 0;
         this.var_2541 = param1.method_4110;
         this.var_1321 = param1.method_720;
         this.var_490 = 0;
         this.var_4876 = 0;
         this._currentIndex = 0;
         this.var_4692 = 0;
         if(this.var_1722)
         {
            this.var_490 += (this.var_177 + 1) * (this.var_1685 + 1);
            _loc12_ += Number(this.var_177) * Number(this.var_1685) * 2;
         }
         if(this.var_2622)
         {
            this.var_490 += 2 * (this.var_1685 + 1);
            _loc12_ += this.var_1685;
         }
         if(this.var_4673)
         {
            this.var_490 += 2 * (this.var_1685 + 1);
            _loc12_ += this.var_1685;
         }
         if(this.var_490 == param1.numVertices)
         {
            this.var_2823 = param1.name_104;
            this.var_280 = param1.indexData || new Vector.<uint>(_loc12_ * 3,true);
         }
         else
         {
            _loc19_ = Number(this.var_490) * Number(this.var_2541);
            this.var_2823 = new Vector.<Number>(_loc19_,true);
            this.var_280 = new Vector.<uint>(_loc12_ * 3,true);
         }
         var _loc18_:Number = 0 / Number(this.var_1685);
         if(Boolean(this.var_2622) && this.var_4771 > 0)
         {
            _loc6_ = -0.5 * Number(this._height);
            _loc2_ = 0;
            while(_loc2_ <= this.var_1685)
            {
               if(this.var_1296)
               {
                  _loc16_ = 1;
                  _loc17_ = 0;
                  _loc13_ = -_loc6_;
                  _loc14_ = 0;
               }
               else
               {
                  _loc16_ = 0;
                  _loc17_ = -1;
                  _loc13_ = 0;
                  _loc14_ = _loc6_;
               }
               this.method_39(0,_loc13_,_loc14_,0,_loc16_,_loc17_,1,0,0);
               _loc8_ = _loc2_ * _loc18_;
               _loc4_ = Number(this.var_4771) * Math.cos(_loc8_);
               _loc5_ = Number(this.var_4771) * Math.sin(_loc8_);
               if(this.var_1296)
               {
                  _loc13_ = -_loc6_;
                  _loc14_ = _loc5_;
               }
               else
               {
                  _loc13_ = _loc5_;
                  _loc14_ = _loc6_;
               }
               if(_loc2_ == this.var_1685)
               {
                  this.method_39(this.var_2823[_loc15_ + this.var_2541],this.var_2823[_loc15_ + this.var_2541 + 1],this.var_2823[_loc15_ + this.var_2541 + 2],0,_loc16_,_loc17_,1,0,0);
               }
               else
               {
                  this.method_39(_loc4_,_loc13_,_loc14_,0,_loc16_,_loc17_,1,0,0);
               }
               if(_loc2_ > 0)
               {
                  this.method_3952(this.var_4876 - 1,Number(this.var_4876) - 3,Number(this.var_4876) - 2);
               }
               _loc2_++;
            }
         }
         if(Boolean(this.var_4673) && this.var_2912 > 0)
         {
            _loc6_ = 0.5 * Number(this._height);
            _loc15_ = this.var_1321 + Number(this.var_4876) * Number(this.var_2541);
            _loc2_ = 0;
            while(_loc2_ <= this.var_1685)
            {
               if(this.var_1296)
               {
                  _loc16_ = -1;
                  _loc17_ = 0;
                  _loc13_ = -_loc6_;
                  _loc14_ = 0;
               }
               else
               {
                  _loc16_ = 0;
                  _loc17_ = 1;
                  _loc13_ = 0;
                  _loc14_ = _loc6_;
               }
               this.method_39(0,_loc13_,_loc14_,0,_loc16_,_loc17_,1,0,0);
               _loc8_ = _loc2_ * _loc18_;
               _loc4_ = Number(this.var_2912) * Math.cos(_loc8_);
               _loc5_ = Number(this.var_2912) * Math.sin(_loc8_);
               if(this.var_1296)
               {
                  _loc13_ = -_loc6_;
                  _loc14_ = _loc5_;
               }
               else
               {
                  _loc13_ = _loc5_;
                  _loc14_ = _loc6_;
               }
               if(_loc2_ == this.var_1685)
               {
                  this.method_39(_loc4_,this.var_2823[_loc15_ + 1],this.var_2823[_loc15_ + 2],0,_loc16_,_loc17_,1,0,0);
               }
               else
               {
                  this.method_39(_loc4_,_loc13_,_loc14_,0,_loc16_,_loc17_,1,0,0);
               }
               if(_loc2_ > 0)
               {
                  this.method_3952(Number(this.var_4876) - 2,Number(this.var_4876) - 3,this.var_4876 - 1);
               }
               _loc2_++;
            }
         }
         _loc11_ = (_loc10_ = (_loc9_ = Number(this.var_2912) - Number(this.var_4771)) / Number(this._height)) == 0 ? 1 : Number(this._height) / _loc9_;
         if(this.var_1722)
         {
            _loc3_ = 0;
            while(_loc3_ <= this.var_177)
            {
               _loc7_ = Number(this.var_4771) - _loc3_ / Number(this.var_177) * (Number(this.var_4771) - Number(this.var_2912));
               _loc6_ = -(Number(this._height) / 2) + _loc3_ / Number(this.var_177) * Number(this._height);
               _loc15_ = this.var_1321 + Number(this.var_4876) * Number(this.var_2541);
               _loc2_ = 0;
               while(_loc2_ <= this.var_1685)
               {
                  _loc8_ = _loc2_ * _loc18_;
                  _loc4_ = _loc7_ * Math.cos(_loc8_);
                  _loc5_ = _loc7_ * Math.sin(_loc8_);
                  _loc24_ = _loc11_ * Math.cos(_loc8_);
                  _loc25_ = _loc11_ * Math.sin(_loc8_);
                  if(this.var_1296)
                  {
                     _loc16_ = 0;
                     _loc17_ = -_loc24_;
                     _loc13_ = -_loc6_;
                     _loc14_ = _loc5_;
                     _loc26_ = _loc10_;
                     _loc27_ = _loc25_;
                  }
                  else
                  {
                     _loc16_ = -_loc24_;
                     _loc17_ = 0;
                     _loc13_ = _loc5_;
                     _loc14_ = _loc6_;
                     _loc26_ = _loc25_;
                     _loc27_ = _loc10_;
                  }
                  if(_loc2_ == this.var_1685)
                  {
                     this.method_39(this.var_2823[_loc15_],this.var_2823[_loc15_ + 1],this.var_2823[_loc15_ + 2],_loc24_,_loc10_,_loc25_,_loc25_,_loc16_,_loc17_);
                  }
                  else
                  {
                     this.method_39(_loc4_,_loc13_,_loc14_,_loc24_,_loc26_,_loc27_,-_loc25_,_loc16_,_loc17_);
                  }
                  if(_loc2_ > 0 && _loc3_ > 0)
                  {
                     _loc20_ = this.var_4876 - 1;
                     _loc22_ = (_loc21_ = Number(this.var_4876) - 2) - Number(this.var_1685) - 1;
                     _loc23_ = _loc20_ - Number(this.var_1685) - 1;
                     this.method_3952(_loc20_,_loc21_,_loc22_);
                     this.method_3952(_loc20_,_loc22_,_loc23_);
                  }
                  _loc2_++;
               }
               _loc3_++;
            }
         }
         param1.updateData(this.var_2823);
         param1.updateIndexData(this.var_280);
      }
      
      override protected function method_1765(param1:class_2602) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc9_:* = null;
         var _loc7_:uint;
         var _loc8_:uint = (_loc7_ = uint(param1.method_2639)) - 2;
         var _loc10_:uint = Number(this.var_490) * _loc7_;
         if(Boolean(param1.method_868) && _loc10_ == param1.method_868.length)
         {
            _loc9_ = param1.method_868;
         }
         else
         {
            _loc9_ = new Vector.<Number>(_loc10_,true);
            method_2121();
         }
         var _loc11_:Number = 0 / Number(this.var_1685);
         var _loc12_:uint = uint(param1.method_2585);
         if(this.var_2622)
         {
            _loc2_ = 0;
            while(_loc2_ <= this.var_1685)
            {
               _loc6_ = _loc2_ * _loc11_;
               _loc4_ = 0.5 + 0.5 * -Math.cos(_loc6_);
               _loc5_ = 0.5 + 0.5 * Math.sin(_loc6_);
               var _loc13_:*;
               _loc9_[_loc13_ = _loc12_++] = 0.5 * Number(param1.name_38);
               var _loc14_:*;
               _loc9_[_loc14_ = _loc12_++] = 0.5 * Number(param1.name_72);
               _loc12_ += _loc8_;
               var _loc15_:*;
               _loc9_[_loc15_ = _loc12_++] = _loc4_ * Number(param1.name_38);
               var _loc16_:*;
               _loc9_[_loc16_ = _loc12_++] = _loc5_ * Number(param1.name_72);
               _loc12_ += _loc8_;
               _loc2_++;
            }
         }
         if(this.var_4673)
         {
            _loc2_ = 0;
            while(_loc2_ <= this.var_1685)
            {
               _loc6_ = _loc2_ * _loc11_;
               _loc4_ = 0.5 + 0.5 * Math.cos(_loc6_);
               _loc5_ = 0.5 + 0.5 * Math.sin(_loc6_);
               _loc9_[_loc13_ = _loc12_++] = 0.5 * Number(param1.name_38);
               _loc9_[_loc14_ = _loc12_++] = 0.5 * Number(param1.name_72);
               _loc12_ += _loc8_;
               _loc9_[_loc15_ = _loc12_++] = _loc4_ * Number(param1.name_38);
               _loc9_[_loc16_ = _loc12_++] = _loc5_ * Number(param1.name_72);
               _loc12_ += _loc8_;
               _loc2_++;
            }
         }
         if(this.var_1722)
         {
            _loc3_ = 0;
            while(_loc3_ <= this.var_177)
            {
               _loc2_ = 0;
               while(_loc2_ <= this.var_1685)
               {
                  _loc9_[_loc13_ = _loc12_++] = _loc2_ / Number(this.var_1685) * Number(param1.name_38);
                  _loc9_[_loc14_ = _loc12_++] = _loc3_ / Number(this.var_177) * Number(param1.name_72);
                  _loc12_ += _loc8_;
                  _loc2_++;
               }
               _loc3_++;
            }
         }
         param1.updateData(_loc9_);
      }
      
      public function get topRadius() : Number
      {
         return this.var_4771;
      }
      
      public function set topRadius(param1:Number) : void
      {
         this.var_4771 = param1;
         method_2121();
      }
      
      public function get bottomRadius() : Number
      {
         return this.var_2912;
      }
      
      public function set bottomRadius(param1:Number) : void
      {
         this.var_2912 = param1;
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
      
      public function get topClosed() : Boolean
      {
         return this.var_2622;
      }
      
      public function set topClosed(param1:Boolean) : void
      {
         this.var_2622 = param1;
         method_2121();
      }
      
      public function get bottomClosed() : Boolean
      {
         return this.var_4673;
      }
      
      public function set bottomClosed(param1:Boolean) : void
      {
         this.var_4673 = param1;
         method_2121();
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
   }
}
