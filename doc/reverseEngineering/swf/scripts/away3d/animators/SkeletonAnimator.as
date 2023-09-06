package away3d.animators
{
   import away3d.arcane;
   import flash.display3D.*;
   import flash.geom.*;
   import flash.utils.*;
   import package_198.*;
   import package_199.*;
   import package_294.*;
   import package_305.class_1767;
   import package_309.*;
   import package_371.*;
   import package_386.*;
   import package_430.*;
   import package_487.*;
   
   public class SkeletonAnimator extends class_2119 implements class_2120
   {
       
      
      private var var_3545:Vector.<Number>;
      
      private var var_1828:class_2636;
      
      private var var_1787:Boolean;
      
      private var var_249:uint;
      
      private var var_2900:Dictionary;
      
      private var var_4005:Vector.<Number>;
      
      private var var_4301:class_2614;
      
      private var var_3440:Boolean;
      
      private var var_4824:Boolean;
      
      private var var_1066:uint;
      
      private var var_4370:class_2701;
      
      public function SkeletonAnimator(param1:class_2642, param2:class_2614, param3:Boolean = false)
      {
         var _loc4_:int = 0;
         this.var_1828 = new class_2636();
         this.var_2900 = new Dictionary();
         super(param1);
         this.var_4301 = param2;
         this.var_3440 = param3;
         this.var_1066 = param1.method_3861;
         this.var_249 = this.var_4301.method_2611;
         this.var_3545 = new Vector.<Number>(Number(this.var_249) * 12,true);
         var _loc5_:Number = 0;
         while(_loc5_ < this.var_249)
         {
            var _loc6_:*;
            this.var_3545[_loc6_ = _loc4_++] = 1;
            var _loc7_:*;
            this.var_3545[_loc7_ = _loc4_++] = 0;
            var _loc8_:*;
            this.var_3545[_loc8_ = _loc4_++] = 0;
            var _loc9_:*;
            this.var_3545[_loc9_ = _loc4_++] = 0;
            var _loc10_:*;
            this.var_3545[_loc10_ = _loc4_++] = 0;
            var _loc11_:*;
            this.var_3545[_loc11_ = _loc4_++] = 1;
            var _loc12_:*;
            this.var_3545[_loc12_ = _loc4_++] = 0;
            var _loc13_:*;
            this.var_3545[_loc13_ = _loc4_++] = 0;
            var _loc14_:*;
            this.var_3545[_loc14_ = _loc4_++] = 0;
            var _loc15_:*;
            this.var_3545[_loc15_ = _loc4_++] = 0;
            var _loc16_:*;
            this.var_3545[_loc16_ = _loc4_++] = 1;
            var _loc17_:*;
            this.var_3545[_loc17_ = _loc4_++] = 0;
            _loc5_++;
         }
      }
      
      public function get method_3111() : Vector.<Number>
      {
         if(this.var_1787)
         {
            this.method_4614();
         }
         return this.var_3545;
      }
      
      public function get method_6507() : class_2636
      {
         if(this.var_1787)
         {
            this.method_4614();
         }
         return this.var_1828;
      }
      
      public function get skeleton() : class_2614
      {
         return this.var_4301;
      }
      
      public function get method_4613() : Boolean
      {
         return this.var_3440;
      }
      
      public function get method_1791() : Boolean
      {
         return this.var_4824;
      }
      
      public function set method_1791(param1:Boolean) : void
      {
         this.var_4824 = param1;
      }
      
      public function clone() : class_2120
      {
         return new SkeletonAnimator(var_1183 as class_2642,this.var_4301,this.var_3440);
      }
      
      public function play(param1:String, param2:class_2700 = null, param3:Number = NaN) : void
      {
         if(var_203 != param1)
         {
            var_203 = param1;
            if(!var_1183.method_294(param1))
            {
               throw new Error("Animation root node " + param1 + " not found!");
            }
            if(Boolean(param2) && Boolean(var_4381))
            {
               var_4381 = param2.method_4698(this,var_4381,var_1183.method_1957(param1),time);
               var_4381.addEventListener(class_2478.const_2730,this.method_2794);
            }
            else
            {
               var_4381 = var_1183.method_1957(param1);
            }
            var_1036 = method_3412(var_4381);
            if(updatePosition)
            {
               var_1036.time = time;
               var_1036.method_5121;
            }
            this.var_4370 = var_1036 as class_2701;
         }
         start();
         if(!isNaN(param3))
         {
            reset(param1,param3);
         }
      }
      
      public function setRenderState(param1:class_1208, param2:class_2133, param3:int, param4:int, param5:class_1767) : void
      {
         var _loc8_:* = null;
         if(this.var_1787)
         {
            this.method_4614();
         }
         var _loc6_:class_2646;
         var _loc7_:uint = uint((_loc6_ = class_2646(class_2398(param2).subGeometry)).method_2303);
         if(this.var_4824)
         {
            if(_loc6_.method_2303 == 0)
            {
               _loc6_.arcane::method_6312();
               _loc7_ = uint(_loc6_.method_2303);
            }
            this.method_5093(_loc6_.method_5360,_loc7_);
            param1.arcane::var_4582.setProgramConstantsFromVector(Context3DProgramType.VERTEX,param3,this.var_4005,_loc7_ * 3);
         }
         else
         {
            if(false)
            {
               var _loc9_:* = this.var_2900[_loc6_] || new SubGeomAnimationState(_loc6_);
               this.var_2900[_loc6_] = this.var_2900[_loc6_] || new SubGeomAnimationState(_loc6_);
               if((_loc8_ = _loc9_).dirty)
               {
                  this.method_5617(_loc8_,_loc6_);
                  _loc8_.dirty = false;
               }
               _loc6_.method_5284(_loc8_.animatedVertexData);
               return;
            }
            param1.arcane::var_4582.setProgramConstantsFromVector(Context3DProgramType.VERTEX,param3,this.var_3545,Number(this.var_249) * 3);
         }
         _loc6_.method_5148(param4,param1);
         _loc6_.method_6084(param4 + 1,param1);
      }
      
      public function method_3058(param1:class_1774) : void
      {
         if(!this.var_4824 && (Boolean(this.var_3440) || this.var_1066 > 4 || param1.method_1025 + Number(this.var_249) * 3 > 128))
         {
            var_1183.method_3534();
         }
      }
      
      override public function set time(param1:int) : void
      {
         var _loc2_:* = null;
         super.time = param1;
         this.var_1787 = true;
         for(_loc2_ in this.var_2900)
         {
            SubGeomAnimationState(this.var_2900[_loc2_]).dirty = true;
         }
      }
      
      private function method_5093(param1:Vector.<uint>, param2:uint) : void
      {
         var _loc5_:* = 0;
         var _loc6_:* = 0;
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         this.var_4005 = new Vector.<Number>();
         do
         {
            _loc5_ = (_loc6_ = param1[_loc3_ * 3] * 4) + 12;
            while(_loc6_ < _loc5_)
            {
               var _loc7_:*;
               this.var_4005[_loc7_ = _loc4_++] = this.var_3545[_loc6_++];
            }
         }
         while(++_loc3_ < param2);
         
      }
      
      private function method_4614() : void
      {
         var _loc1_:* = 0;
         var _loc3_:* = null;
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
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc27_:Number = NaN;
         var _loc28_:Number = NaN;
         var _loc29_:Number = NaN;
         var _loc30_:Number = NaN;
         var _loc31_:Number = NaN;
         var _loc32_:Number = NaN;
         var _loc33_:Number = NaN;
         var _loc34_:Number = NaN;
         var _loc36_:* = null;
         var _loc37_:* = null;
         var _loc38_:* = null;
         var _loc39_:Number = NaN;
         this.var_1787 = false;
         this.method_6271(this.var_4370.method_2432(this.var_4301),this.var_1828,this.var_4301);
         var _loc2_:Vector.<class_2627> = this.var_1828.var_3009;
         var _loc35_:Vector.<class_2628> = this.var_4301.joints;
         var _loc40_:Number = 0;
         while(_loc40_ < this.var_249)
         {
            _loc37_ = (_loc36_ = _loc2_[_loc40_]).orientation;
            _loc38_ = _loc36_.var_2277;
            _loc4_ = Number(_loc37_.x);
            _loc5_ = Number(_loc37_.y);
            _loc6_ = Number(_loc37_.z);
            _loc7_ = Number(_loc37_.w);
            var _loc41_:* = 2 * _loc4_;
            _loc39_ = 2 * _loc4_;
            _loc8_ = _loc41_ * _loc5_;
            _loc9_ = _loc39_ * _loc6_;
            _loc10_ = _loc39_ * _loc7_;
            _loc41_ = 2 * _loc5_;
            _loc39_ = 2 * _loc5_;
            _loc11_ = _loc41_ * _loc6_;
            _loc12_ = _loc39_ * _loc7_;
            _loc13_ = 2 * _loc6_ * _loc7_;
            _loc11_ = 2 * _loc5_ * _loc6_;
            _loc12_ = 2 * _loc5_ * _loc7_;
            _loc13_ = 2 * _loc6_ * _loc7_;
            _loc4_ *= _loc4_;
            _loc5_ *= _loc5_;
            _loc6_ *= _loc6_;
            _loc7_ *= _loc7_;
            _loc41_ = _loc4_ - _loc5_;
            _loc39_ = _loc4_ - _loc5_;
            _loc14_ = _loc41_ - _loc6_ + _loc7_;
            _loc15_ = _loc8_ - _loc13_;
            _loc16_ = _loc9_ + _loc12_;
            _loc17_ = _loc8_ + _loc13_;
            _loc18_ = -_loc39_ - _loc6_ + _loc7_;
            _loc19_ = _loc11_ - _loc10_;
            _loc20_ = _loc9_ - _loc12_;
            _loc21_ = _loc11_ + _loc10_;
            _loc22_ = -_loc4_ - _loc5_ + _loc6_ + _loc7_;
            _loc3_ = _loc35_[_loc40_].var_4759;
            _loc23_ = _loc3_[0];
            _loc24_ = _loc3_[4];
            _loc25_ = _loc3_[8];
            _loc26_ = _loc3_[12];
            _loc27_ = _loc3_[1];
            _loc28_ = _loc3_[5];
            _loc29_ = _loc3_[9];
            _loc30_ = _loc3_[13];
            _loc31_ = _loc3_[2];
            _loc32_ = _loc3_[6];
            _loc33_ = _loc3_[10];
            _loc34_ = _loc3_[14];
            this.var_3545[uint(_loc1_)] = _loc14_ * _loc23_ + _loc15_ * _loc27_ + _loc16_ * _loc31_;
            this.var_3545[uint(_loc1_ + 1)] = _loc14_ * _loc24_ + _loc15_ * _loc28_ + _loc16_ * _loc32_;
            this.var_3545[uint(_loc1_ + 2)] = _loc14_ * _loc25_ + _loc15_ * _loc29_ + _loc16_ * _loc33_;
            this.var_3545[uint(_loc1_ + 3)] = _loc14_ * _loc26_ + _loc15_ * _loc30_ + _loc16_ * _loc34_ + _loc38_.x;
            this.var_3545[uint(_loc1_ + 4)] = _loc17_ * _loc23_ + _loc18_ * _loc27_ + _loc19_ * _loc31_;
            this.var_3545[uint(_loc1_ + 5)] = _loc17_ * _loc24_ + _loc18_ * _loc28_ + _loc19_ * _loc32_;
            this.var_3545[uint(_loc1_ + 6)] = _loc17_ * _loc25_ + _loc18_ * _loc29_ + _loc19_ * _loc33_;
            this.var_3545[uint(_loc1_ + 7)] = _loc17_ * _loc26_ + _loc18_ * _loc30_ + _loc19_ * _loc34_ + _loc38_.y;
            this.var_3545[uint(_loc1_ + 8)] = _loc20_ * _loc23_ + _loc21_ * _loc27_ + _loc22_ * _loc31_;
            this.var_3545[uint(_loc1_ + 9)] = _loc20_ * _loc24_ + _loc21_ * _loc28_ + _loc22_ * _loc32_;
            this.var_3545[uint(_loc1_ + 10)] = _loc20_ * _loc25_ + _loc21_ * _loc29_ + _loc22_ * _loc33_;
            this.var_3545[uint(_loc1_ + 11)] = _loc20_ * _loc26_ + _loc21_ * _loc30_ + _loc22_ * _loc34_ + _loc38_.z;
            _loc1_ = uint(_loc1_ + 12);
            _loc40_++;
         }
      }
      
      private function method_5617(param1:SubGeomAnimationState, param2:class_2646) : void
      {
         var _loc7_:* = 0;
         var _loc8_:* = 0;
         var _loc9_:* = 0;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc27_:Number = NaN;
         var _loc28_:Number = NaN;
         var _loc29_:Number = NaN;
         var _loc30_:Number = NaN;
         var _loc31_:Number = NaN;
         var _loc32_:Number = NaN;
         var _loc33_:Number = NaN;
         var _loc34_:Number = NaN;
         var _loc35_:Number = NaN;
         var _loc36_:Number = NaN;
         var _loc37_:Number = NaN;
         var _loc38_:Number = NaN;
         var _loc39_:Number = NaN;
         var _loc40_:Number = NaN;
         var _loc41_:Number = NaN;
         var _loc42_:* = 0;
         var _loc3_:Vector.<Number> = param2.name_104;
         var _loc4_:Vector.<Number> = param1.animatedVertexData;
         var _loc5_:Vector.<Number> = param2.arcane::method_4237;
         var _loc6_:Vector.<Number> = param2.arcane::method_5549;
         var _loc19_:int = _loc3_.length;
         while(_loc7_ < _loc19_)
         {
            _loc21_ = _loc3_[_loc7_];
            _loc22_ = _loc3_[uint(_loc7_ + 1)];
            _loc23_ = _loc3_[uint(_loc7_ + 2)];
            _loc24_ = _loc3_[uint(_loc7_ + 3)];
            _loc25_ = _loc3_[uint(_loc7_ + 4)];
            _loc26_ = _loc3_[uint(_loc7_ + 5)];
            _loc27_ = _loc3_[uint(_loc7_ + 6)];
            _loc28_ = _loc3_[uint(_loc7_ + 7)];
            _loc29_ = _loc3_[uint(_loc7_ + 8)];
            _loc10_ = 0;
            _loc11_ = 0;
            _loc12_ = 0;
            _loc13_ = 0;
            _loc14_ = 0;
            _loc15_ = 0;
            _loc16_ = 0;
            _loc17_ = 0;
            _loc18_ = 0;
            _loc9_ = 0;
            while(_loc9_ < this.var_1066)
            {
               if((_loc20_ = _loc6_[_loc8_]) > 0)
               {
                  _loc42_ = uint(_loc5_[_loc8_++]) << 2;
                  _loc30_ = Number(this.var_3545[_loc42_]);
                  _loc31_ = Number(this.var_3545[uint(_loc42_ + 1)]);
                  _loc32_ = Number(this.var_3545[uint(_loc42_ + 2)]);
                  _loc33_ = Number(this.var_3545[uint(_loc42_ + 3)]);
                  _loc34_ = Number(this.var_3545[uint(_loc42_ + 4)]);
                  _loc35_ = Number(this.var_3545[uint(_loc42_ + 5)]);
                  _loc36_ = Number(this.var_3545[uint(_loc42_ + 6)]);
                  _loc37_ = Number(this.var_3545[uint(_loc42_ + 7)]);
                  _loc38_ = Number(this.var_3545[uint(_loc42_ + 8)]);
                  _loc39_ = Number(this.var_3545[uint(_loc42_ + 9)]);
                  _loc40_ = Number(this.var_3545[uint(_loc42_ + 10)]);
                  _loc41_ = Number(this.var_3545[uint(_loc42_ + 11)]);
                  _loc10_ += _loc20_ * (_loc30_ * _loc21_ + _loc31_ * _loc22_ + _loc32_ * _loc23_ + _loc33_);
                  _loc11_ += _loc20_ * (_loc34_ * _loc21_ + _loc35_ * _loc22_ + _loc36_ * _loc23_ + _loc37_);
                  _loc12_ += _loc20_ * (_loc38_ * _loc21_ + _loc39_ * _loc22_ + _loc40_ * _loc23_ + _loc41_);
                  _loc13_ += _loc20_ * (_loc30_ * _loc24_ + _loc31_ * _loc25_ + _loc32_ * _loc26_);
                  _loc14_ += _loc20_ * (_loc34_ * _loc24_ + _loc35_ * _loc25_ + _loc36_ * _loc26_);
                  _loc15_ += _loc20_ * (_loc38_ * _loc24_ + _loc39_ * _loc25_ + _loc40_ * _loc26_);
                  _loc16_ += _loc20_ * (_loc30_ * _loc27_ + _loc31_ * _loc28_ + _loc32_ * _loc29_);
                  _loc17_ += _loc20_ * (_loc34_ * _loc27_ + _loc35_ * _loc28_ + _loc36_ * _loc29_);
                  _loc18_ += _loc20_ * (_loc38_ * _loc27_ + _loc39_ * _loc28_ + _loc40_ * _loc29_);
                  _loc9_++;
               }
               else
               {
                  _loc8_ += uint(Number(this.var_1066) - _loc9_);
                  _loc9_ = uint(this.var_1066);
               }
            }
            _loc4_[_loc7_] = _loc10_;
            _loc4_[uint(_loc7_ + 1)] = _loc11_;
            _loc4_[uint(_loc7_ + 2)] = _loc12_;
            _loc4_[uint(_loc7_ + 3)] = _loc13_;
            _loc4_[uint(_loc7_ + 4)] = _loc14_;
            _loc4_[uint(_loc7_ + 5)] = _loc15_;
            _loc4_[uint(_loc7_ + 6)] = _loc16_;
            _loc4_[uint(_loc7_ + 7)] = _loc17_;
            _loc4_[uint(_loc7_ + 8)] = _loc18_;
            _loc7_ = uint(_loc7_ + 13);
         }
      }
      
      private function method_6271(param1:class_2636, param2:class_2636, param3:class_2614) : void
      {
         var _loc5_:* = null;
         var _loc9_:int = 0;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc27_:Number = NaN;
         var _loc4_:Vector.<class_2627> = param2.var_3009;
         var _loc6_:Vector.<class_2628> = param3.joints;
         var _loc7_:uint = uint(param1.method_5552);
         var _loc8_:Vector.<class_2627> = param1.var_3009;
         if(_loc4_.length != _loc7_)
         {
            _loc4_.length = _loc7_;
         }
         var _loc28_:Number = 0;
         while(_loc28_ < _loc7_)
         {
            var _loc29_:* = _loc4_[_loc28_] || new class_2627();
            _loc4_[_loc28_] = _loc4_[_loc28_] || new class_2627();
            _loc5_ = _loc29_;
            _loc9_ = int((_loc10_ = _loc6_[_loc28_]).var_2665);
            _loc12_ = _loc8_[_loc28_];
            _loc16_ = _loc5_.orientation;
            _loc15_ = _loc5_.var_2277;
            if(_loc9_ < 0)
            {
               _loc14_ = _loc12_.var_2277;
               _loc13_ = _loc12_.orientation;
               _loc16_.x = _loc13_.x;
               _loc16_.y = _loc13_.y;
               _loc16_.z = _loc13_.z;
               _loc16_.w = _loc13_.w;
               _loc15_.x = _loc14_.x;
               _loc15_.y = _loc14_.y;
               _loc15_.z = _loc14_.z;
            }
            else
            {
               _loc13_ = (_loc11_ = _loc4_[_loc9_]).orientation;
               _loc14_ = _loc12_.var_2277;
               _loc21_ = Number(_loc13_.x);
               _loc22_ = Number(_loc13_.y);
               _loc23_ = Number(_loc13_.z);
               _loc24_ = Number(_loc13_.w);
               _loc25_ = _loc14_.x;
               _loc26_ = _loc14_.y;
               _loc27_ = _loc14_.z;
               _loc20_ = -_loc21_ * _loc25_ - _loc22_ * _loc26_ - _loc23_ * _loc27_;
               _loc17_ = _loc24_ * _loc25_ + _loc22_ * _loc27_ - _loc23_ * _loc26_;
               _loc18_ = _loc24_ * _loc26_ - _loc21_ * _loc27_ + _loc23_ * _loc25_;
               _loc19_ = _loc24_ * _loc27_ + _loc21_ * _loc26_ - _loc22_ * _loc25_;
               _loc14_ = _loc11_.var_2277;
               _loc15_.x = -_loc20_ * _loc21_ + _loc17_ * _loc24_ - _loc18_ * _loc23_ + _loc19_ * _loc22_ + _loc14_.x;
               _loc15_.y = -_loc20_ * _loc22_ + _loc17_ * _loc23_ + _loc18_ * _loc24_ - _loc19_ * _loc21_ + _loc14_.y;
               _loc15_.z = -_loc20_ * _loc23_ - _loc17_ * _loc22_ + _loc18_ * _loc21_ + _loc19_ * _loc24_ + _loc14_.z;
               _loc17_ = Number(_loc13_.x);
               _loc18_ = Number(_loc13_.y);
               _loc19_ = Number(_loc13_.z);
               _loc20_ = Number(_loc13_.w);
               _loc21_ = Number((_loc13_ = _loc12_.orientation).x);
               _loc22_ = Number(_loc13_.y);
               _loc23_ = Number(_loc13_.z);
               _loc24_ = Number(_loc13_.w);
               _loc16_.w = _loc20_ * _loc24_ - _loc17_ * _loc21_ - _loc18_ * _loc22_ - _loc19_ * _loc23_;
               _loc16_.x = _loc20_ * _loc21_ + _loc17_ * _loc24_ + _loc18_ * _loc23_ - _loc19_ * _loc22_;
               _loc16_.y = _loc20_ * _loc22_ - _loc17_ * _loc23_ + _loc18_ * _loc24_ + _loc19_ * _loc21_;
               _loc16_.z = _loc20_ * _loc23_ + _loc17_ * _loc22_ - _loc18_ * _loc21_ + _loc19_ * _loc24_;
            }
            _loc28_++;
         }
      }
      
      private function method_2794(param1:class_2478) : void
      {
         if(param1.type == class_2478.const_2730)
         {
            param1.animationNode.removeEventListener(class_2478.const_2730,this.method_2794);
            if(var_1036 == param1.animationState)
            {
               var_4381 = var_1183.method_1957(var_203);
               var_1036 = method_3412(var_4381);
               this.var_4370 = var_1036 as class_2701;
            }
         }
      }
   }
}

import package_294.class_2602;

class SubGeomAnimationState
{
    
   
   public var animatedVertexData:Vector.<Number>;
   
   public var dirty:Boolean = true;
   
   function SubGeomAnimationState(param1:class_2602)
   {
      super();
      this.animatedVertexData = param1.name_104.concat();
   }
}
