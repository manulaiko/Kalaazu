package package_309
{
   import away3d.arcane;
   import flash.display3D.Context3D;
   import flash.display3D.Context3DProgramType;
   import flash.geom.Matrix;
   import flash.geom.Matrix3D;
   import package_198.class_1208;
   import package_199.class_2253;
   import package_294.class_2133;
   import package_305.class_1767;
   import package_307.class_1772;
   import package_307.class_2496;
   import package_310.class_2239;
   import package_310.class_2241;
   import package_310.class_2242;
   import package_310.class_2245;
   import package_310.class_2246;
   import package_310.class_2494;
   import package_310.class_2497;
   import package_369.class_2116;
   import package_371.class_2125;
   import package_374.AbstractMethodError;
   import package_385.class_2495;
   
   public class class_2243 extends class_1774
   {
       
      
      arcane var var_746:Vector.<class_1774>;
      
      arcane var var_4231:Boolean;
      
      protected var var_2151:uint = 1;
      
      protected var var_266:uint = 3;
      
      protected var var_595:String;
      
      protected var var_1561:String;
      
      protected var var_3781:String;
      
      protected var var_1253:Vector.<Number>;
      
      protected var var_180:Vector.<Number>;
      
      protected var var_1418:int;
      
      protected var var_1468:int;
      
      protected var var_4851:int;
      
      protected var var_2811:int;
      
      protected var var_3008:int;
      
      protected var var_2060:int;
      
      protected var var_2386:int;
      
      protected var var_1163:int;
      
      protected var var_2296:int;
      
      protected var var_3169:int;
      
      protected var var_1938:int;
      
      protected var var_553:Vector.<uint>;
      
      protected var var_1335:Vector.<uint>;
      
      protected var var_1347:Number;
      
      protected var var_866:Number;
      
      protected var var_2778:Number;
      
      protected var var_973:class_2495;
      
      protected var var_1738:class_2494;
      
      protected var var_2991:Boolean;
      
      protected var var_4525:Boolean;
      
      protected var var_2514:Boolean = true;
      
      protected var var_416:Boolean;
      
      protected var var_1458:uint;
      
      protected var var_231:uint;
      
      protected var var_1052:uint;
      
      protected var var_673:Boolean = true;
      
      private var var_668:Boolean;
      
      public function class_2243(param1:class_1772)
      {
         this.var_1253 = new Vector.<Number>();
         this.var_180 = new Vector.<Number>();
         super();
         var_642 = param1;
         this.init();
      }
      
      public function get method_1581() : Boolean
      {
         return this.var_673;
      }
      
      public function set method_1581(param1:Boolean) : void
      {
         if(param1 != this.var_673)
         {
            this.arcane::method_220(true);
         }
         this.var_673 = param1;
      }
      
      public function get method_3848() : Boolean
      {
         return this.var_668;
      }
      
      public function set method_3848(param1:Boolean) : void
      {
         this.var_668 = param1;
      }
      
      arcane function get method_2262() : uint
      {
         return this.var_1458;
      }
      
      arcane function get method_3204() : uint
      {
         return this.var_231;
      }
      
      arcane function get method_1248() : uint
      {
         return this.var_1052;
      }
      
      override arcane function method_3625(param1:class_1208) : void
      {
         this.reset(param1.profile);
         super.arcane::method_3625(param1);
      }
      
      private function reset(param1:String) : void
      {
         this.method_1908(param1);
         this.method_154();
         this.method_2959();
         this.method_1140();
      }
      
      private function method_2237() : void
      {
         var_237 = this.var_973.method_1025;
         var_47 = this.var_973.method_6441;
         var_1671 = this.var_973.method_1035;
         var_1971 = this.var_973.method_5678;
         var_3673 = this.var_973.method_5243;
         var_47 = this.var_973.method_6441;
      }
      
      private function method_2959() : void
      {
         this.var_1253.length = Number(var_237) * 4;
         this.var_180.length = Number(var_47) * 4;
         this.method_4114();
         if(this.var_1938 >= 0)
         {
            this.method_4767();
         }
         if(this.var_3169 >= 0)
         {
            this.var_1253[this.var_3169 + 3] = 1;
         }
         this.method_2409();
      }
      
      protected function method_1908(param1:String) : void
      {
         this.var_973 = this.method_2782(param1);
         this.var_973.method_579 = this.var_668;
         this.var_973.method_2262 = this.var_1458;
         this.var_973.method_3204 = this.var_231;
         this.var_973.method_1248 = this.var_1052;
         this.var_973.method_5183 = this.var_1738;
         this.var_973.method_2793 = this.var_266;
         this.var_973.method_3842 = this.var_2151;
         this.var_973.method_6474(_smooth,_repeat,var_2370);
         this.var_973.method_781(this.var_1253,this.var_180);
         this.var_973.animateUVs = this.var_416;
         this.var_973.alphaPremultiplied = Boolean(var_3218) && Boolean(var_3123);
         this.var_973.method_4194 = Boolean(this.var_2514) && Boolean(var_3123);
         this.var_973.method_1581 = this.var_673;
         this.var_973.compile();
      }
      
      protected function method_2782(param1:String) : class_2495
      {
         throw new AbstractMethodError();
      }
      
      protected function method_154() : void
      {
         var_16 = this.var_973.method_1591;
         var_2915 = this.var_973.method_2721;
         this.var_595 = this.var_973.method_2231;
         this.var_1561 = this.var_973.method_4297;
         this.var_3781 = this.var_973.method_3709;
         var_3471 = this.var_973.name_28;
         this.var_2991 = this.var_973.method_3832;
         this.var_4525 = this.var_973.method_4682;
         var_1081 = this.var_973.name_26;
         var_1302 = this.var_973.method_506;
         var_1613 = this.var_973.method_4551;
         this.method_2053();
         this.method_2237();
      }
      
      protected function method_2053() : void
      {
         this.var_4851 = this.var_973.method_4420;
         this.var_1938 = this.var_973.method_2259;
         this.var_2811 = this.var_973.method_6044;
         this.var_3008 = this.var_973.method_3020;
         this.var_2060 = this.var_973.method_6211;
         this.var_2296 = this.var_973.method_635;
         this.var_3169 = this.var_973.method_4931;
         this.var_1418 = this.var_973.method_5221;
         this.var_2386 = this.var_973.method_3846;
         this.var_1163 = this.var_973.method_1623;
         this.var_1468 = this.var_973.method_3999;
         this.var_553 = this.var_973.method_6513;
         this.var_1335 = this.var_973.method_2846;
      }
      
      public function get method_4194() : Boolean
      {
         return this.var_2514;
      }
      
      public function set method_4194(param1:Boolean) : void
      {
         if(this.var_2514 == param1)
         {
            return;
         }
         this.var_2514 = param1;
         this.arcane::method_220();
      }
      
      public function get animateUVs() : Boolean
      {
         return this.var_416;
      }
      
      public function set animateUVs(param1:Boolean) : void
      {
         if(this.var_416 == param1)
         {
            return;
         }
         this.var_416 = param1;
         this.arcane::method_220();
      }
      
      override public function set mipmap(param1:Boolean) : void
      {
         if(var_2370 == param1)
         {
            return;
         }
         super.mipmap = param1;
      }
      
      public function get normalMap() : class_2116
      {
         return this.var_1738.arcane::var_491.normalMap;
      }
      
      public function set normalMap(param1:class_2116) : void
      {
         this.var_1738.arcane::var_491.normalMap = param1;
      }
      
      public function get normalMethod() : class_2242
      {
         return this.var_1738.normalMethod;
      }
      
      public function set normalMethod(param1:class_2242) : void
      {
         this.var_1738.normalMethod = param1;
      }
      
      public function get ambientMethod() : class_2239
      {
         return this.var_1738.ambientMethod;
      }
      
      public function set ambientMethod(param1:class_2239) : void
      {
         this.var_1738.ambientMethod = param1;
      }
      
      public function get shadowMethod() : class_2245
      {
         return this.var_1738.shadowMethod;
      }
      
      public function set shadowMethod(param1:class_2245) : void
      {
         this.var_1738.shadowMethod = param1;
      }
      
      public function get diffuseMethod() : class_2246
      {
         return this.var_1738.diffuseMethod;
      }
      
      public function set diffuseMethod(param1:class_2246) : void
      {
         this.var_1738.diffuseMethod = param1;
      }
      
      public function get specularMethod() : class_2241
      {
         return this.var_1738.specularMethod;
      }
      
      public function set specularMethod(param1:class_2241) : void
      {
         this.var_1738.specularMethod = param1;
      }
      
      private function init() : void
      {
         this.var_1738 = new class_2494();
         this.var_1738.addEventListener(class_2253.const_3136,this.method_404);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(this.var_1738)
         {
            this.var_1738.removeEventListener(class_2253.const_3136,this.method_404);
            this.var_1738.dispose();
            this.var_1738 = null;
         }
      }
      
      override arcane function method_220(param1:Boolean = true) : void
      {
         var _loc2_:Vector.<class_1774> = this.arcane::var_746;
         this.arcane::var_746 = new Vector.<class_1774>();
         if(this.var_1738)
         {
            this.method_5749();
         }
         if(!_loc2_ || this.arcane::var_746.length != _loc2_.length)
         {
            this.arcane::var_4231 = true;
            return;
         }
         var _loc3_:int = 0;
         while(_loc3_ < this.arcane::var_746.length)
         {
            if(this.arcane::var_746[_loc3_] != _loc2_[_loc3_])
            {
               this.arcane::var_4231 = true;
               return;
            }
            _loc3_++;
         }
         super.arcane::method_220(param1);
      }
      
      protected function method_5749() : void
      {
         if(Boolean(this.var_1738.arcane::var_491) && Boolean(this.var_1738.arcane::var_491.arcane::method_5395))
         {
            this.method_4916(this.var_1738.arcane::var_491.method_4325);
         }
         if(this.var_1738.arcane::var_2401)
         {
            this.method_4916(this.var_1738.arcane::var_2401.method_4325);
         }
         if(this.var_1738.arcane::var_2047)
         {
            this.method_4916(this.var_1738.arcane::var_2047.method_4325);
         }
         if(this.var_1738.arcane::var_2753)
         {
            this.method_4916(this.var_1738.arcane::var_2753.method_4325);
         }
         if(this.var_1738.arcane::var_1906)
         {
            this.method_4916(this.var_1738.arcane::var_1906.method_4325);
         }
      }
      
      protected function method_4916(param1:Vector.<class_1774>) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc2_:uint = param1.length;
         var _loc3_:Number = 0;
         while(_loc3_ < _loc2_)
         {
            param1[_loc3_].material = material;
            param1[_loc3_].arcane::lightPicker = var_1149;
            this.arcane::var_746.push(param1[_loc3_]);
            _loc3_++;
         }
      }
      
      protected function method_4767() : void
      {
         this.var_1253[this.var_1938] = 1;
         this.var_1253[this.var_1938 + 1] = 0;
         this.var_1253[this.var_1938 + 2] = 0;
         this.var_1253[this.var_1938 + 3] = 0;
         this.var_1253[this.var_1938 + 4] = 0;
         this.var_1253[this.var_1938 + 5] = 1;
         this.var_1253[this.var_1938 + 6] = 0;
         this.var_1253[this.var_1938 + 7] = 0;
      }
      
      protected function method_4114() : void
      {
         this.var_180[this.var_1418] = 0.5;
         this.var_180[this.var_1418 + 1] = 0;
         this.var_180[this.var_1418 + 2] = 0.00392156862745098;
         this.var_180[this.var_1418 + 3] = 1;
      }
      
      protected function method_1140() : void
      {
         this.var_973.dispose();
         this.var_973 = null;
      }
      
      protected function method_2409() : void
      {
         if(this.var_1738.arcane::var_491)
         {
            this.var_1738.arcane::var_491.arcane::method_4956(this.var_1738.arcane::var_1294);
         }
         if(this.var_1738.arcane::var_2753)
         {
            this.var_1738.arcane::var_2753.arcane::method_4956(this.var_1738.arcane::var_2698);
         }
         if(this.var_1738.arcane::var_2401)
         {
            this.var_1738.arcane::var_2401.arcane::method_4956(this.var_1738.arcane::var_4870);
         }
         if(this.var_2991)
         {
            this.var_1738.arcane::var_1906.arcane::method_4956(this.var_1738.arcane::var_3165);
         }
         if(this.var_1738.arcane::var_2047)
         {
            this.var_1738.arcane::var_2047.arcane::method_4956(this.var_1738.arcane::var_1078);
         }
      }
      
      protected function method_1916() : void
      {
      }
      
      protected function method_22(param1:class_1208) : void
      {
      }
      
      private function method_404(param1:class_2253) : void
      {
         this.arcane::method_220();
      }
      
      override arcane function getVertexCode() : String
      {
         return this.var_595;
      }
      
      override arcane function getFragmentCode(param1:String) : String
      {
         return this.var_1561 + param1 + this.var_3781;
      }
      
      override arcane function activate(param1:class_1208, param2:class_1767) : void
      {
         super.arcane::activate(param1,param2);
         if(this.var_4525)
         {
            this.var_1738.arcane::var_491.arcane::activate(this.var_1738.arcane::var_1294,param1);
         }
         this.var_1738.arcane::var_2401.arcane::activate(this.var_1738.arcane::var_4870,param1);
         if(this.var_1738.arcane::var_2047)
         {
            this.var_1738.arcane::var_2047.arcane::activate(this.var_1738.arcane::var_1078,param1);
         }
         this.var_1738.arcane::var_2753.arcane::activate(this.var_1738.arcane::var_2698,param1);
         if(this.var_2991)
         {
            this.var_1738.arcane::var_1906.arcane::activate(this.var_1738.arcane::var_3165,param1);
         }
      }
      
      override arcane function render(param1:class_2133, param2:class_1208, param3:class_1767, param4:Matrix3D) : void
      {
         var _loc5_:Number = 0;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc6_:Context3D = param2.arcane::var_4582;
         if(this.var_4851 >= 0)
         {
            param1.method_2801(this.var_4851,param2);
         }
         if(this.var_2811 >= 0)
         {
            param1.method_1094(this.var_2811,param2);
         }
         if(this.var_3008 >= 0)
         {
            param1.method_298(this.var_3008,param2);
         }
         if(this.var_2060 >= 0)
         {
            param1.method_4672(this.var_2060,param2);
         }
         if(this.var_416)
         {
            if(_loc10_ = param1.method_2164)
            {
               this.var_1253[this.var_1938] = _loc10_.a;
               this.var_1253[this.var_1938 + 1] = _loc10_.b;
               this.var_1253[this.var_1938 + 3] = _loc10_.tx;
               this.var_1253[this.var_1938 + 4] = _loc10_.c;
               this.var_1253[this.var_1938 + 5] = _loc10_.d;
               this.var_1253[this.var_1938 + 7] = _loc10_.ty;
            }
            else
            {
               this.var_1253[this.var_1938] = 1;
               this.var_1253[this.var_1938 + 1] = 0;
               this.var_1253[this.var_1938 + 3] = 0;
               this.var_1253[this.var_1938 + 4] = 0;
               this.var_1253[this.var_1938 + 5] = 1;
               this.var_1253[this.var_1938 + 7] = 0;
            }
         }
         this.var_1347 = this.var_866 = this.var_2778 = 0;
         if(this.method_71())
         {
            this.method_1916();
         }
         if(this.method_564())
         {
            this.method_22(param2);
         }
         if(this.var_2386 >= 0)
         {
            param1.method_846(param3).copyRawDataTo(this.var_1253,this.var_2386,true);
            param4.copyRawDataTo(this.var_1253,0,true);
         }
         else
         {
            (_loc11_ = class_2125.const_1289).copyFrom(param1.method_846(param3));
            _loc11_.append(param4);
            _loc11_.copyRawDataTo(this.var_1253,0,true);
         }
         if(this.var_1163 >= 0)
         {
            param1.method_2908.copyRawDataTo(this.var_1253,this.var_1163,false);
         }
         if(this.var_4525)
         {
            this.var_1738.arcane::var_491.arcane::setRenderState(this.var_1738.arcane::var_1294,param1,param2,param3);
         }
         var _loc7_:class_2239;
         (_loc7_ = this.var_1738.arcane::var_2401).arcane::var_2518 = this.var_1347;
         _loc7_.arcane::var_2721 = this.var_866;
         _loc7_.arcane::var_3823 = this.var_2778;
         _loc7_.arcane::setRenderState(this.var_1738.arcane::var_4870,param1,param2,param3);
         if(this.var_1738.arcane::var_2047)
         {
            this.var_1738.arcane::var_2047.arcane::setRenderState(this.var_1738.arcane::var_1078,param1,param2,param3);
         }
         this.var_1738.arcane::var_2753.arcane::setRenderState(this.var_1738.arcane::var_2698,param1,param2,param3);
         if(this.var_2991)
         {
            this.var_1738.arcane::var_1906.arcane::setRenderState(this.var_1738.arcane::var_3165,param1,param2,param3);
         }
         if(this.var_1738.arcane::var_2959)
         {
            this.var_1738.arcane::var_2959.arcane::setRenderState(this.var_1738.arcane::var_3212,param1,param2,param3);
         }
         var _loc8_:Vector.<class_2497>;
         var _loc9_:uint = (_loc8_ = this.var_1738.arcane::var_1420).length;
         _loc5_ = 0;
         while(_loc5_ < _loc9_)
         {
            (_loc12_ = _loc8_[_loc5_]).method.arcane::setRenderState(_loc12_.data,param1,param2,param3);
            _loc5_++;
         }
         _loc6_.setProgramConstantsFromVector(Context3DProgramType.VERTEX,0,this.var_1253,var_237);
         _loc6_.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,0,this.var_180,var_47);
         param1.method_748(0,param2);
         _loc6_.drawTriangles(param1.method_612(param2),0,param1.name_42);
      }
      
      protected function method_564() : Boolean
      {
         return this.var_1052 > 0 && ((Number(this.var_266) | Number(this.var_2151)) & 0) != 0;
      }
      
      protected function method_71() : Boolean
      {
         return (this.var_1458 > 0 || this.var_231 > 0) && ((Number(this.var_266) | Number(this.var_2151)) & 0) != 0;
      }
      
      override arcane function deactivate(param1:class_1208) : void
      {
         super.arcane::deactivate(param1);
         if(this.var_4525)
         {
            this.var_1738.arcane::var_491.arcane::deactivate(this.var_1738.arcane::var_1294,param1);
         }
         this.var_1738.arcane::var_2401.arcane::deactivate(this.var_1738.arcane::var_4870,param1);
         if(this.var_1738.arcane::var_2047)
         {
            this.var_1738.arcane::var_2047.arcane::deactivate(this.var_1738.arcane::var_1078,param1);
         }
         this.var_1738.arcane::var_2753.arcane::deactivate(this.var_1738.arcane::var_2698,param1);
         if(this.var_2991)
         {
            this.var_1738.arcane::var_1906.arcane::deactivate(this.var_1738.arcane::var_3165,param1);
         }
      }
      
      public function get method_3842() : uint
      {
         return this.var_2151;
      }
      
      public function set method_3842(param1:uint) : void
      {
         this.var_2151 = param1;
      }
      
      public function get method_2793() : uint
      {
         return this.var_266;
      }
      
      public function set method_2793(param1:uint) : void
      {
         this.var_266 = param1;
      }
   }
}
