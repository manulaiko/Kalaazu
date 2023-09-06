package package_307
{
   import away3d.arcane;
   import flash.display.BlendMode;
   import flash.display3D.Context3D;
   import flash.geom.ColorTransform;
   import package_198.class_1208;
   import package_305.class_1767;
   import package_309.class_2244;
   import package_310.class_1780;
   import package_310.class_2239;
   import package_310.class_2241;
   import package_310.class_2242;
   import package_310.class_2245;
   import package_310.class_2246;
   import package_363.class_2100;
   import package_369.class_2116;
   
   public class class_1775 extends class_1772
   {
       
      
      protected var var_1462:class_2244;
      
      private var var_979:Boolean;
      
      public function class_1775()
      {
         super();
         method_5388(this.var_1462 = new class_2244(this));
      }
      
      public function get method_1581() : Boolean
      {
         return this.var_1462.method_1581;
      }
      
      public function set method_1581(param1:Boolean) : void
      {
         this.var_1462.method_1581 = param1;
      }
      
      public function get alphaThreshold() : Number
      {
         return this.var_1462.diffuseMethod.alphaThreshold;
      }
      
      public function set alphaThreshold(param1:Number) : void
      {
         this.var_1462.diffuseMethod.alphaThreshold = param1;
         var_2616.alphaThreshold = param1;
         var_4376.alphaThreshold = param1;
      }
      
      override public function set blendMode(param1:String) : void
      {
         super.blendMode = param1;
         this.var_1462.method_4125(blendMode == BlendMode.NORMAL && Boolean(this.method_4490) ? "null" : blendMode);
      }
      
      override public function set depthCompareMode(param1:String) : void
      {
         super.depthCompareMode = param1;
         this.var_1462.depthCompareMode = param1;
      }
      
      override arcane function method_1463(param1:class_1208, param2:class_1767, param3:Boolean = false) : void
      {
         if(param3)
         {
            var_4376.alphaMask = this.var_1462.diffuseMethod.texture;
         }
         else
         {
            var_2616.alphaMask = this.var_1462.diffuseMethod.texture;
         }
         super.arcane::method_1463(param1,param2,param3);
      }
      
      public function get method_3842() : uint
      {
         return this.var_1462.method_3842;
      }
      
      public function set method_3842(param1:uint) : void
      {
         this.var_1462.method_3842 = param1;
      }
      
      public function get method_2793() : uint
      {
         return this.var_1462.method_2793;
      }
      
      public function set method_2793(param1:uint) : void
      {
         this.var_1462.method_2793 = param1;
      }
      
      override public function get method_4490() : Boolean
      {
         return super.method_4490 || Boolean(this.var_979) || Boolean(this.var_1462.colorTransform) && this.var_1462.colorTransform.alphaMultiplier < 1;
      }
      
      public function get colorTransform() : ColorTransform
      {
         return this.var_1462.colorTransform;
      }
      
      public function set colorTransform(param1:ColorTransform) : void
      {
         this.var_1462.colorTransform = param1;
      }
      
      public function get ambientMethod() : class_2239
      {
         return this.var_1462.ambientMethod;
      }
      
      public function set ambientMethod(param1:class_2239) : void
      {
         this.var_1462.ambientMethod = param1;
      }
      
      public function get shadowMethod() : class_2245
      {
         return this.var_1462.shadowMethod;
      }
      
      public function set shadowMethod(param1:class_2245) : void
      {
         this.var_1462.shadowMethod = param1;
      }
      
      public function get diffuseMethod() : class_2246
      {
         return this.var_1462.diffuseMethod;
      }
      
      public function set diffuseMethod(param1:class_2246) : void
      {
         this.var_1462.diffuseMethod = param1;
      }
      
      public function get normalMethod() : class_2242
      {
         return this.var_1462.normalMethod;
      }
      
      public function set normalMethod(param1:class_2242) : void
      {
         this.var_1462.normalMethod = param1;
      }
      
      public function get specularMethod() : class_2241
      {
         return this.var_1462.specularMethod;
      }
      
      public function set specularMethod(param1:class_2241) : void
      {
         this.var_1462.specularMethod = param1;
      }
      
      public function addMethod(param1:class_1780) : void
      {
         this.var_1462.addMethod(param1);
      }
      
      public function get method_3114() : int
      {
         return this.var_1462.method_3114;
      }
      
      public function method_4896(param1:class_1780) : Boolean
      {
         return this.var_1462.method_4896(param1);
      }
      
      public function method_2311(param1:int) : class_1780
      {
         return this.var_1462.method_2311(param1);
      }
      
      public function method_5104(param1:class_1780, param2:int) : void
      {
         this.var_1462.method_5104(param1,param2);
      }
      
      public function method_804(param1:class_1780) : void
      {
         this.var_1462.method_804(param1);
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
         return this.var_1462.normalMap;
      }
      
      public function set normalMap(param1:class_2116) : void
      {
         this.var_1462.normalMap = param1;
      }
      
      public function get specularMap() : class_2116
      {
         return this.var_1462.specularMethod.texture;
      }
      
      public function set specularMap(param1:class_2116) : void
      {
         if(this.var_1462.specularMethod)
         {
            this.var_1462.specularMethod.texture = param1;
            return;
         }
         throw new Error("No specular method was set to assign the specularGlossMap to");
      }
      
      public function get gloss() : Number
      {
         return !!this.var_1462.specularMethod ? Number(this.var_1462.specularMethod.gloss) : 0;
      }
      
      public function set gloss(param1:Number) : void
      {
         if(this.var_1462.specularMethod)
         {
            this.var_1462.specularMethod.gloss = param1;
         }
      }
      
      public function get ambient() : Number
      {
         return this.var_1462.ambientMethod.ambient;
      }
      
      public function set ambient(param1:Number) : void
      {
         this.var_1462.ambientMethod.ambient = param1;
      }
      
      public function get specular() : Number
      {
         return !!this.var_1462.specularMethod ? Number(this.var_1462.specularMethod.specular) : 0;
      }
      
      public function set specular(param1:Number) : void
      {
         if(this.var_1462.specularMethod)
         {
            this.var_1462.specularMethod.specular = param1;
         }
      }
      
      public function get ambientColor() : uint
      {
         return this.var_1462.ambientMethod.ambientColor;
      }
      
      public function set ambientColor(param1:uint) : void
      {
         this.var_1462.ambientMethod.ambientColor = param1;
      }
      
      public function get specularColor() : uint
      {
         return this.var_1462.specularMethod.specularColor;
      }
      
      public function set specularColor(param1:uint) : void
      {
         this.var_1462.specularMethod.specularColor = param1;
      }
      
      public function get alphaBlending() : Boolean
      {
         return this.var_979;
      }
      
      public function set alphaBlending(param1:Boolean) : void
      {
         this.var_979 = param1;
         this.var_1462.method_4125(blendMode == BlendMode.NORMAL && Boolean(this.method_4490) ? "null" : blendMode);
         this.var_1462.method_4194 = this.method_4490;
      }
      
      override arcane function method_3403(param1:Context3D) : void
      {
         var _loc2_:* = 0;
         var _loc3_:Number = 0;
         if(this.var_1462.arcane::var_4231)
         {
            method_2800();
            if(this.var_1462.arcane::var_746)
            {
               _loc2_ = uint(this.var_1462.arcane::var_746.length);
               _loc3_ = 0;
               while(_loc3_ < _loc2_)
               {
                  method_5388(this.var_1462.arcane::var_746[_loc3_]);
                  _loc3_++;
               }
            }
            method_5388(this.var_1462);
            this.var_1462.arcane::var_4231 = false;
         }
      }
      
      override public function set lightPicker(param1:class_2100) : void
      {
         super.lightPicker = param1;
         this.var_1462.arcane::lightPicker = param1;
      }
   }
}
