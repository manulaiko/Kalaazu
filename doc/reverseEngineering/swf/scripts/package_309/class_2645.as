package package_309
{
   import away3d.arcane;
   import flash.display3D.Context3D;
   import flash.geom.Matrix3D;
   import flash.geom.Vector3D;
   import package_198.class_1208;
   import package_294.class_2133;
   import package_305.class_1767;
   import package_307.class_1772;
   import package_307.class_2496;
   import package_364.DirectionalLight;
   import package_364.PointLight;
   import package_364.class_2390;
   import package_385.class_2495;
   import package_385.class_2704;
   
   public class class_2645 extends class_2243
   {
       
      
      private var var_871:Boolean = true;
      
      private var var_3186:Boolean;
      
      private var var_439:int;
      
      private var var_3546:Vector.<Number>;
      
      private var var_1031:uint;
      
      private var var_2972:uint;
      
      private var var_751:uint;
      
      private var var_4949:int = 3;
      
      public function class_2645(param1:class_1772)
      {
         this.var_3546 = new Vector.<Number>();
         super(param1);
      }
      
      public function get method_3404() : uint
      {
         return this.var_1031;
      }
      
      public function set method_3404(param1:uint) : void
      {
         this.var_1031 = param1;
      }
      
      public function get method_5119() : uint
      {
         return this.var_2972;
      }
      
      public function set method_5119(param1:uint) : void
      {
         this.var_2972 = param1;
      }
      
      public function get method_563() : uint
      {
         return this.var_751;
      }
      
      public function set method_563(param1:uint) : void
      {
         this.var_751 = param1;
      }
      
      override protected function method_2782(param1:String) : class_2495
      {
         this.var_4949 = param1 == "baselineConstrained" ? 1 : 3;
         return new class_2704(param1);
      }
      
      public function get method_1389() : Boolean
      {
         return this.var_871;
      }
      
      public function set method_1389(param1:Boolean) : void
      {
         if(this.var_871 == param1)
         {
            return;
         }
         this.var_871 = param1;
         arcane::method_220();
      }
      
      override protected function method_395() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         super.method_395();
         var _loc1_:int = int(var_231);
         _loc2_ = int(var_1458);
         _loc3_ = int(var_1052);
         if(var_1149)
         {
            var_231 = this.method_3671(var_1149.method_3204);
            var_1458 = this.method_4819(var_1149.method_2262);
            var_1052 = this.method_553(var_1149.method_1248);
            if(this.var_871)
            {
               var_1458 += var_1149.method_2416;
               var_231 += var_1149.method_5889;
            }
         }
         else
         {
            var_231 = 0;
            var_1458 = 0;
            var_1052 = 0;
         }
         if(_loc2_ != var_1458 || _loc1_ != var_231 || _loc3_ != var_1052)
         {
            arcane::method_220();
         }
      }
      
      private function method_3671(param1:uint) : int
      {
         return Math.min(param1 - Number(this.var_1031),this.var_4949);
      }
      
      private function method_4819(param1:uint) : int
      {
         var _loc2_:int = Number(this.var_4949) - Number(var_231);
         return Math.min(param1 - Number(this.var_2972),_loc2_);
      }
      
      private function method_553(param1:uint) : int
      {
         var _loc2_:int = 0;
         if((Number(var_2151) & 0) != 0)
         {
            _loc2_++;
         }
         if((Number(var_266) & 0) != 0)
         {
            _loc2_++;
         }
         return Math.min(param1 - Number(this.var_751),int(4 / _loc2_));
      }
      
      override protected function method_154() : void
      {
         super.method_154();
         this.var_3186 = class_2704(var_973).tangentSpace;
      }
      
      override protected function method_2053() : void
      {
         super.method_2053();
         this.var_439 = class_2704(var_973).lightVertexConstantIndex;
      }
      
      override arcane function render(param1:class_2133, param2:class_1208, param3:class_1767, param4:Matrix3D) : void
      {
         var _loc5_:* = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         param1.method_2908.copyRawDataTo(this.var_3546);
         if(Boolean(this.var_3186) && var_3169 >= 0)
         {
            _loc6_ = (_loc5_ = param3.method_3037).x;
            _loc7_ = _loc5_.y;
            _loc8_ = _loc5_.z;
            var_1253[var_3169] = Number(this.var_3546[0]) * _loc6_ + Number(this.var_3546[4]) * _loc7_ + Number(this.var_3546[8]) * _loc8_ + this.var_3546[12];
            var_1253[var_3169 + 1] = Number(this.var_3546[1]) * _loc6_ + Number(this.var_3546[5]) * _loc7_ + Number(this.var_3546[9]) * _loc8_ + this.var_3546[13];
            var_1253[var_3169 + 2] = Number(this.var_3546[2]) * _loc6_ + Number(this.var_3546[6]) * _loc7_ + Number(this.var_3546[10]) * _loc8_ + this.var_3546[14];
         }
         super.arcane::render(param1,param2,param3,param4);
      }
      
      override arcane function activate(param1:class_1208, param2:class_1767) : void
      {
         var _loc3_:* = null;
         super.arcane::activate(param1,param2);
         if(!this.var_3186 && var_3169 >= 0)
         {
            _loc3_ = param2.method_3037;
            var_1253[var_3169] = _loc3_.x;
            var_1253[var_3169 + 1] = _loc3_.y;
            var_1253[var_3169 + 2] = _loc3_.z;
         }
      }
      
      private function method_2381() : Boolean
      {
         return var_1052 > 0 && (Number(var_2151) & 0) != 0;
      }
      
      private function method_2490() : Boolean
      {
         return var_1052 > 0 && (Number(var_266) & 0) != 0;
      }
      
      override protected function method_1916() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc7_:Number = 0;
         var _loc8_:uint = !!this.var_871 ? 2 : 1;
         _loc9_ = int(this.var_439);
         _loc4_ = uint(var_2296);
         var _loc11_:int = 0;
         var _loc12_:Vector.<DirectionalLight> = var_1149.method_1935;
         _loc10_ = int(this.var_1031);
         _loc5_ = int(var_1149.method_1935.length);
         if(_loc10_ > _loc5_)
         {
            _loc11_ = 1;
            _loc10_ -= _loc5_;
         }
         while(_loc11_ < _loc8_)
         {
            if(_loc11_)
            {
               _loc12_ = var_1149.method_2074;
            }
            if((_loc5_ = _loc12_.length) > var_231)
            {
               _loc5_ = int(var_231);
            }
            _loc3_ = 0;
            while(_loc3_ < _loc5_)
            {
               _loc1_ = _loc12_[_loc10_ + _loc3_];
               _loc6_ = _loc1_.sceneDirection;
               var_1347 += _loc1_.arcane::var_1211;
               var_866 += _loc1_.arcane::var_1656;
               var_2778 += _loc1_.arcane::var_363;
               if(this.var_3186)
               {
                  _loc14_ = -_loc6_.x;
                  _loc15_ = -_loc6_.y;
                  _loc16_ = -_loc6_.z;
                  var _loc18_:*;
                  var_1253[_loc18_ = _loc9_++] = Number(this.var_3546[0]) * _loc14_ + Number(this.var_3546[4]) * _loc15_ + Number(this.var_3546[8]) * _loc16_;
                  var _loc19_:*;
                  var_1253[_loc19_ = _loc9_++] = Number(this.var_3546[1]) * _loc14_ + Number(this.var_3546[5]) * _loc15_ + Number(this.var_3546[9]) * _loc16_;
                  var _loc20_:*;
                  var_1253[_loc20_ = _loc9_++] = Number(this.var_3546[2]) * _loc14_ + Number(this.var_3546[6]) * _loc15_ + Number(this.var_3546[10]) * _loc16_;
                  var _loc21_:*;
                  var_1253[_loc21_ = _loc9_++] = 1;
               }
               else
               {
                  var_180[_loc18_ = _loc4_++] = -_loc6_.x;
                  var_180[_loc19_ = _loc4_++] = -_loc6_.y;
                  var_180[_loc20_ = _loc4_++] = -_loc6_.z;
                  var_180[_loc21_ = _loc4_++] = 1;
               }
               var_180[_loc18_ = _loc4_++] = _loc1_.arcane::var_3866;
               var_180[_loc19_ = _loc4_++] = _loc1_.arcane::var_2970;
               var_180[_loc20_ = _loc4_++] = _loc1_.arcane::var_1455;
               var_180[_loc21_ = _loc4_++] = 1;
               var _loc22_:*;
               var_180[_loc22_ = _loc4_++] = _loc1_.arcane::var_3500;
               var _loc23_:*;
               var_180[_loc23_ = _loc4_++] = _loc1_.arcane::var_1919;
               var _loc24_:*;
               var_180[_loc24_ = _loc4_++] = _loc1_.arcane::var_2424;
               var _loc25_:*;
               var_180[_loc25_ = _loc4_++] = 1;
               if(++_loc7_ == var_231)
               {
                  _loc3_ = _loc5_;
                  _loc11_ = _loc8_;
               }
               _loc3_++;
            }
            _loc11_++;
         }
         if(var_231 > _loc7_)
         {
            _loc3_ = _loc4_ + (Number(var_231) - _loc7_) * 12;
            while(_loc4_ < _loc3_)
            {
               var_180[_loc18_ = _loc4_++] = 0;
            }
         }
         _loc7_ = 0;
         var _loc13_:Vector.<PointLight> = var_1149.method_833;
         _loc10_ = int(this.var_2972);
         _loc5_ = int(var_1149.method_833.length);
         if(_loc10_ > _loc5_)
         {
            _loc11_ = 1;
            _loc10_ -= _loc5_;
         }
         else
         {
            _loc11_ = 0;
         }
         while(_loc11_ < _loc8_)
         {
            if(_loc11_)
            {
               _loc13_ = var_1149.method_3158;
            }
            _loc5_ = _loc13_.length;
            _loc3_ = 0;
            while(_loc3_ < _loc5_)
            {
               _loc2_ = _loc13_[_loc10_ + _loc3_];
               _loc6_ = _loc2_.method_3037;
               var_1347 += _loc2_.arcane::var_1211;
               var_866 += _loc2_.arcane::var_1656;
               var_2778 += _loc2_.arcane::var_363;
               if(this.var_3186)
               {
                  _loc14_ = _loc6_.x;
                  _loc15_ = _loc6_.y;
                  _loc16_ = _loc6_.z;
                  var_1253[_loc18_ = _loc9_++] = Number(this.var_3546[0]) * _loc14_ + Number(this.var_3546[4]) * _loc15_ + Number(this.var_3546[8]) * _loc16_ + this.var_3546[12];
                  var_1253[_loc19_ = _loc9_++] = Number(this.var_3546[1]) * _loc14_ + Number(this.var_3546[5]) * _loc15_ + Number(this.var_3546[9]) * _loc16_ + this.var_3546[13];
                  var_1253[_loc20_ = _loc9_++] = Number(this.var_3546[2]) * _loc14_ + Number(this.var_3546[6]) * _loc15_ + Number(this.var_3546[10]) * _loc16_ + this.var_3546[14];
               }
               else
               {
                  var_1253[_loc18_ = _loc9_++] = _loc6_.x;
                  var_1253[_loc19_ = _loc9_++] = _loc6_.y;
                  var_1253[_loc20_ = _loc9_++] = _loc6_.z;
               }
               var_1253[_loc18_ = _loc9_++] = 1;
               var_180[_loc19_ = _loc4_++] = _loc2_.arcane::var_3866;
               var_180[_loc20_ = _loc4_++] = _loc2_.arcane::var_2970;
               var_180[_loc21_ = _loc4_++] = _loc2_.arcane::var_1455;
               _loc17_ = Number(_loc2_.arcane::var_126);
               var_180[_loc22_ = _loc4_++] = _loc17_ * _loc17_;
               var_180[_loc23_ = _loc4_++] = _loc2_.arcane::var_3500;
               var_180[_loc24_ = _loc4_++] = _loc2_.arcane::var_1919;
               var_180[_loc25_ = _loc4_++] = _loc2_.arcane::var_2424;
               var _loc26_:*;
               var_180[_loc26_ = _loc4_++] = _loc2_.arcane::var_1269;
               if(++_loc7_ == var_1458)
               {
                  _loc3_ = _loc5_;
                  _loc11_ = _loc8_;
               }
               _loc3_++;
            }
            _loc11_++;
         }
         if(var_1458 > _loc7_)
         {
            _loc3_ = _loc4_ + (_loc7_ - Number(var_1458)) * 12;
            while(_loc4_ < _loc3_)
            {
               var_180[_loc4_] = 0;
               _loc4_++;
            }
         }
      }
      
      override protected function method_22(param1:class_1208) : void
      {
         var _loc3_:* = null;
         var _loc2_:Context3D = param1.arcane::var_4582;
         var _loc4_:Vector.<class_2390> = var_1149.method_1997;
         var _loc5_:Vector.<Number> = var_1149.method_2762;
         var _loc6_:int = _loc4_.length - Number(this.var_751);
         var _loc7_:Boolean = Boolean(this.method_2490());
         var _loc8_:Boolean = Boolean(false && this.method_2381());
         if(!(_loc7_ || _loc8_))
         {
            return;
         }
         if(_loc6_ > var_1052)
         {
            _loc6_ = int(var_1052);
         }
         var _loc9_:Number = 0;
         while(_loc9_ < _loc6_)
         {
            _loc3_ = _loc4_[this.var_751 + _loc9_];
            if(_loc7_)
            {
               _loc2_.setTextureAt(var_553[_loc9_],_loc3_.method_6006.method_6425(param1));
            }
            if(_loc8_)
            {
               _loc2_.setTextureAt(var_1335[_loc9_],_loc3_.specularMap.method_6425(param1));
            }
            _loc9_++;
         }
         _loc9_ = 0;
         while(_loc9_ < _loc6_)
         {
            var_180[var_1468 + _loc9_] = _loc5_[this.var_751 + _loc9_];
            _loc9_++;
         }
      }
   }
}
