package package_307
{
   import away3d.arcane;
   import flash.display.BlendMode;
   import flash.display3D.Context3D;
   import flash.display3D.Context3DBlendFactor;
   import flash.display3D.Context3DCompareMode;
   import flash.events.Event;
   import package_198.class_1208;
   import package_305.class_1767;
   import package_309.class_2243;
   import package_309.class_2244;
   import package_309.class_2644;
   import package_309.class_2645;
   import package_310.class_1780;
   import package_310.class_2239;
   import package_310.class_2241;
   import package_310.class_2242;
   import package_310.class_2245;
   import package_310.class_2246;
   import package_363.class_2100;
   import package_363.class_2101;
   import package_369.class_2116;
   
   public class class_2445 extends class_1772
   {
       
      
      protected var var_38:class_2644;
      
      protected var var_3658:Vector.<class_2645>;
      
      protected var var_3402:class_2244;
      
      private var var_1893:Number = 0;
      
      private var var_2151:uint = 1;
      
      private var var_266:uint = 3;
      
      private var var_2401:class_2239;
      
      private var var_2047:class_2245;
      
      private var var_2753:class_2246;
      
      private var var_491:class_2242;
      
      private var var_1906:class_2241;
      
      private var var_1833:Boolean = true;
      
      private var var_673:Boolean = true;
      
      public function class_2445()
      {
         this.var_2401 = new class_2239();
         this.var_2753 = new class_2246();
         this.var_491 = new class_2242();
         this.var_1906 = new class_2241();
         super();
      }
      
      public function get method_1581() : Boolean
      {
         return this.var_673;
      }
      
      public function set method_1581(param1:Boolean) : void
      {
         if(this.var_673 != param1)
         {
            this.method_1082();
         }
         this.var_673 = param1;
      }
      
      public function get alphaThreshold() : Number
      {
         return this.var_1893;
      }
      
      public function set alphaThreshold(param1:Number) : void
      {
         this.var_1893 = param1;
         this.var_2753.alphaThreshold = param1;
         var_2616.alphaThreshold = param1;
         var_4376.alphaThreshold = param1;
      }
      
      override public function set depthCompareMode(param1:String) : void
      {
         super.depthCompareMode = param1;
         this.method_1082();
      }
      
      override public function set blendMode(param1:String) : void
      {
         super.blendMode = param1;
         this.method_1082();
      }
      
      override arcane function method_1463(param1:class_1208, param2:class_1767, param3:Boolean = false) : void
      {
         if(param3)
         {
            var_4376.alphaMask = this.var_2753.texture;
         }
         else
         {
            var_2616.alphaMask = this.var_2753.texture;
         }
         super.arcane::method_1463(param1,param2,param3);
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
      
      override public function set lightPicker(param1:class_2100) : void
      {
         if(var_1149)
         {
            var_1149.removeEventListener(Event.CHANGE,this.method_120);
         }
         super.lightPicker = param1;
         if(var_1149)
         {
            var_1149.addEventListener(Event.CHANGE,this.method_120);
         }
         this.method_1082();
      }
      
      override public function get method_4490() : Boolean
      {
         return false;
      }
      
      public function get ambientMethod() : class_2239
      {
         return this.var_2401;
      }
      
      public function set ambientMethod(param1:class_2239) : void
      {
         param1.copyFrom(this.var_2401);
         this.var_2401 = param1;
         this.method_1082();
      }
      
      public function get shadowMethod() : class_2245
      {
         return this.var_2047;
      }
      
      public function set shadowMethod(param1:class_2245) : void
      {
         if(Boolean(param1) && Boolean(this.var_2047))
         {
            param1.copyFrom(this.var_2047);
         }
         this.var_2047 = param1;
         this.method_1082();
      }
      
      public function get diffuseMethod() : class_2246
      {
         return this.var_2753;
      }
      
      public function set diffuseMethod(param1:class_2246) : void
      {
         param1.copyFrom(this.var_2753);
         this.var_2753 = param1;
         this.method_1082();
      }
      
      public function get specularMethod() : class_2241
      {
         return this.var_1906;
      }
      
      public function set specularMethod(param1:class_2241) : void
      {
         if(Boolean(param1) && Boolean(this.var_1906))
         {
            param1.copyFrom(this.var_1906);
         }
         this.var_1906 = param1;
         this.method_1082();
      }
      
      public function get normalMethod() : class_2242
      {
         return this.var_491;
      }
      
      public function set normalMethod(param1:class_2242) : void
      {
         param1.copyFrom(this.var_491);
         this.var_491 = param1;
         this.method_1082();
      }
      
      public function addMethod(param1:class_1780) : void
      {
         this.var_3402 = this.var_3402 || new class_2244(this);
         this.var_3402.addMethod(param1);
         this.method_1082();
      }
      
      public function get method_3114() : int
      {
         return !!this.var_3402 ? int(this.var_3402.method_3114) : 0;
      }
      
      public function method_4896(param1:class_1780) : Boolean
      {
         return !!this.var_3402 ? Boolean(this.var_3402.method_4896(param1)) : false;
      }
      
      public function method_2311(param1:int) : class_1780
      {
         return this.var_3402.method_2311(param1);
      }
      
      public function method_5104(param1:class_1780, param2:int) : void
      {
         this.var_3402 = this.var_3402 || new class_2244(this);
         this.var_3402.method_5104(param1,param2);
         this.method_1082();
      }
      
      public function method_804(param1:class_1780) : void
      {
         if(!this.var_3402)
         {
            return;
         }
         this.var_3402.method_804(param1);
         if(this.var_3402.method_3114 == 0)
         {
            this.method_1082();
         }
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
         return this.var_491.normalMap;
      }
      
      public function set normalMap(param1:class_2116) : void
      {
         this.var_491.normalMap = param1;
      }
      
      public function get specularMap() : class_2116
      {
         return this.var_1906.texture;
      }
      
      public function set specularMap(param1:class_2116) : void
      {
         if(this.var_1906)
         {
            this.var_1906.texture = param1;
            return;
         }
         throw new Error("No specular method was set to assign the specularGlossMap to");
      }
      
      public function get gloss() : Number
      {
         return !!this.var_1906 ? Number(this.var_1906.gloss) : 0;
      }
      
      public function set gloss(param1:Number) : void
      {
         if(this.var_1906)
         {
            this.var_1906.gloss = param1;
         }
      }
      
      public function get ambient() : Number
      {
         return this.var_2401.ambient;
      }
      
      public function set ambient(param1:Number) : void
      {
         this.var_2401.ambient = param1;
      }
      
      public function get specular() : Number
      {
         return !!this.var_1906 ? Number(this.var_1906.specular) : 0;
      }
      
      public function set specular(param1:Number) : void
      {
         if(this.var_1906)
         {
            this.var_1906.specular = param1;
         }
      }
      
      public function get ambientColor() : uint
      {
         return this.var_2401.ambientColor;
      }
      
      public function set ambientColor(param1:uint) : void
      {
         this.var_2401.ambientColor = param1;
      }
      
      public function get specularColor() : uint
      {
         return this.var_1906.specularColor;
      }
      
      public function set specularColor(param1:uint) : void
      {
         this.var_1906.specularColor = param1;
      }
      
      override arcane function method_3403(param1:Context3D) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         if(this.var_1833)
         {
            this.method_1072();
            _loc2_ = true;
         }
         if(_loc2_ || Boolean(this.method_3209()))
         {
            method_2800();
            this.method_4944(this.var_38);
            if(this.var_3658)
            {
               _loc3_ = 0;
               while(_loc3_ < this.var_3658.length)
               {
                  this.method_4944(this.var_3658[_loc3_]);
                  _loc3_++;
               }
            }
            this.method_4944(this.var_3402);
            this.method_459(this.var_38);
            if(this.var_3658)
            {
               _loc3_ = 0;
               while(_loc3_ < this.var_3658.length)
               {
                  this.method_459(this.var_3658[_loc3_]);
                  _loc3_++;
               }
            }
            this.method_459(this.var_3402);
         }
      }
      
      private function method_459(param1:class_2243) : void
      {
         if(param1)
         {
            method_5388(param1);
            param1.arcane::var_4231 = false;
         }
      }
      
      private function method_3209() : Boolean
      {
         var _loc1_:int = 0;
         if(this.var_38 && this.var_38.arcane::var_4231 || this.var_3402 && this.var_3402.arcane::var_4231)
         {
            return true;
         }
         if(this.var_3658)
         {
            _loc1_ = 0;
            while(_loc1_ < this.var_3658.length)
            {
               if(this.var_3658[_loc1_].arcane::var_4231)
               {
                  return true;
               }
               _loc1_++;
            }
         }
         return false;
      }
      
      private function method_4944(param1:class_2243) : void
      {
         var _loc2_:* = 0;
         var _loc3_:Number = 0;
         if(!param1)
         {
            return;
         }
         if(param1.arcane::var_746)
         {
            _loc2_ = uint(param1.arcane::var_746.length);
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               method_5388(param1.arcane::var_746[_loc3_]);
               _loc3_++;
            }
         }
      }
      
      override arcane function method_5696(param1:uint, param2:class_1208, param3:class_1767) : void
      {
         if(param1 == 0)
         {
            param2.arcane::var_4582.setBlendFactors(Context3DBlendFactor.ONE,Context3DBlendFactor.ZERO);
         }
         super.arcane::method_5696(param1,param2,param3);
      }
      
      override arcane function deactivate(param1:class_1208) : void
      {
         super.arcane::deactivate(param1);
         param1.arcane::var_4582.setBlendFactors(Context3DBlendFactor.ONE,Context3DBlendFactor.ZERO);
      }
      
      protected function method_1072() : void
      {
         this.method_5556();
         this.method_5569();
         this.var_1833 = false;
      }
      
      private function method_5556() : void
      {
         if(this.name_108 == 0 || this.method_3114 > 0)
         {
            this.method_4634();
         }
         else if(Boolean(this.var_3402) && this.method_3114 == 0)
         {
            this.method_4745();
         }
         if(this.var_2047)
         {
            this.method_2551();
         }
         else
         {
            this.method_2880();
         }
         if(this.method_3717 > 0)
         {
            this.method_4901();
         }
         else
         {
            this.method_4359();
         }
      }
      
      private function method_5569() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:Boolean = Boolean(this.var_38 || this.var_3402);
         if(this.var_38)
         {
            this.var_38.method_4125(BlendMode.NORMAL);
            this.var_38.depthCompareMode = depthCompareMode;
            this.var_38.method_3848 = _loc1_;
         }
         if(this.var_3658)
         {
            _loc2_ = 0;
            if(!this.var_38)
            {
               this.var_3658[0].method_3848 = _loc1_;
               this.var_3658[0].method_4125(BlendMode.NORMAL);
               this.var_3658[0].depthCompareMode = depthCompareMode;
               _loc2_ = 1;
            }
            _loc3_ = _loc2_;
            while(_loc3_ < this.var_3658.length)
            {
               this.var_3658[_loc3_].method_3848 = _loc1_;
               this.var_3658[_loc3_].method_4125(BlendMode.ADD);
               this.var_3658[_loc3_].depthCompareMode = Context3DCompareMode.LESS_EQUAL;
               _loc3_++;
            }
         }
         if(Boolean(this.var_38) || Boolean(this.var_3658))
         {
            if(this.var_3402)
            {
               this.var_3402.arcane::method_1992 = true;
               this.var_3402.depthCompareMode = Context3DCompareMode.LESS_EQUAL;
               this.var_3402.method_4125(BlendMode.SCREEN);
               this.var_3402.method_3848 = _loc1_;
            }
         }
         else if(this.var_3402)
         {
            this.var_3402.arcane::method_1992 = false;
            this.var_3402.depthCompareMode = depthCompareMode;
            this.var_3402.method_4125(BlendMode.NORMAL);
            this.var_3402.method_3848 = false;
         }
      }
      
      private function method_2551() : void
      {
         this.var_38 = this.var_38 || new class_2644(this);
         this.var_38.diffuseMethod = null;
         this.var_38.ambientMethod = null;
         this.var_38.normalMethod = null;
         this.var_38.specularMethod = null;
         this.var_38.shadowMethod = null;
         this.var_38.method_1581 = this.var_673;
         this.var_38.arcane::lightPicker = new class_2101([this.var_2047.method_5833]);
         this.var_38.shadowMethod = this.var_2047;
         this.var_38.diffuseMethod = this.var_2753;
         this.var_38.ambientMethod = this.var_2401;
         this.var_38.normalMethod = this.var_491;
         this.var_38.specularMethod = this.var_1906;
         this.var_38.method_2793 = this.var_266;
         this.var_38.method_3842 = this.var_2151;
      }
      
      private function method_2880() : void
      {
         if(!this.var_38)
         {
            return;
         }
         this.var_38.dispose();
         method_5823(this.var_38);
         this.var_38 = null;
      }
      
      private function method_4901() : void
      {
         var _loc1_:* = null;
         this.method_4359();
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(!this.var_38)
         {
            _loc2_ += var_1149.method_5889;
            _loc3_ += var_1149.method_2416;
         }
         this.var_3658 = new Vector.<class_2645>();
         while(_loc5_ < _loc2_ || _loc6_ < _loc3_ || _loc7_ < _loc4_)
         {
            _loc1_ = new class_2645(this);
            _loc1_.method_1581 = this.var_673;
            _loc1_.method_1389 = this.var_2047 == null;
            _loc1_.method_3404 = _loc5_;
            _loc1_.method_5119 = _loc6_;
            _loc1_.method_563 = _loc7_;
            _loc1_.diffuseMethod = null;
            _loc1_.ambientMethod = null;
            _loc1_.normalMethod = null;
            _loc1_.specularMethod = null;
            _loc1_.arcane::lightPicker = var_1149;
            _loc1_.diffuseMethod = this.var_2753;
            _loc1_.ambientMethod = this.var_2401;
            _loc1_.normalMethod = this.var_491;
            _loc1_.specularMethod = this.var_1906;
            _loc1_.method_2793 = this.var_266;
            _loc1_.method_3842 = this.var_2151;
            this.var_3658.push(_loc1_);
            _loc5_ += _loc1_.arcane::method_3204;
            _loc6_ += _loc1_.arcane::method_2262;
            _loc7_ += _loc1_.arcane::method_1248;
         }
      }
      
      private function method_4359() : void
      {
         if(!this.var_3658)
         {
            return;
         }
         var _loc1_:int = 0;
         while(_loc1_ < this.var_3658.length)
         {
            method_5823(this.var_3658[_loc1_]);
            this.var_3658[_loc1_].dispose();
            _loc1_++;
         }
         this.var_3658 = null;
      }
      
      private function method_4745() : void
      {
         if(this.var_3402.diffuseMethod != this.var_2753)
         {
            this.var_3402.diffuseMethod.dispose();
         }
         method_5823(this.var_3402);
         this.var_3402.dispose();
         this.var_3402 = null;
      }
      
      private function method_4634() : class_2244
      {
         this.var_3402 = this.var_3402 || new class_2244(this);
         this.var_3402.method_1581 = this.var_673;
         if(this.name_108 == 0)
         {
            this.var_3402.diffuseMethod = null;
            this.var_3402.diffuseMethod = this.var_2753;
         }
         else
         {
            this.var_3402.diffuseMethod = null;
            this.var_3402.diffuseMethod = new class_2246();
            this.var_3402.diffuseMethod.method_5048 = 0;
            this.var_3402.diffuseMethod.method_111 = 0;
         }
         this.var_3402.method_4194 = false;
         this.var_3402.normalMethod = null;
         this.var_3402.normalMethod = this.var_491;
         return this.var_3402;
      }
      
      protected function get name_108() : int
      {
         return !!var_1149 ? 0 : 0;
      }
      
      private function get method_3717() : int
      {
         return !!var_1149 ? 0 : 0;
      }
      
      protected function method_1082() : void
      {
         this.var_1833 = true;
      }
      
      private function method_120(param1:Event) : void
      {
         this.method_1082();
      }
   }
}
