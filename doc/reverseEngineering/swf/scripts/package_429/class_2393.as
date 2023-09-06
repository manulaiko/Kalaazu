package package_429
{
   import away3d.arcane;
   import flash.display3D.textures.TextureBase;
   import package_198.class_1208;
   import package_295.class_2128;
   import package_300.class_2152;
   import package_305.class_1767;
   import package_364.class_2102;
   import package_369.class_2115;
   import package_369.class_2572;
   import package_374.AbstractMethodError;
   import package_376.class_2145;
   import package_376.class_2571;
   
   public class class_2393
   {
       
      
      protected var var_3449:class_2571;
      
      private var var_4666:class_2115;
      
      protected var var_3256:uint = 2048;
      
      protected var _light:class_2102;
      
      private var var_1528:Boolean;
      
      private var var_3477:Boolean = true;
      
      arcane var var_2459:Boolean;
      
      public function class_2393()
      {
         super();
         this.var_3449 = this.method_2719();
      }
      
      protected function method_2719() : class_2571
      {
         return new class_2571();
      }
      
      public function get method_3634() : Boolean
      {
         return this.var_3477;
      }
      
      public function set method_3634(param1:Boolean) : void
      {
         this.var_3477 = param1;
      }
      
      public function method_1439() : void
      {
         this.arcane::var_2459 = true;
      }
      
      arcane function method_6535(param1:class_2115) : void
      {
         if(this.var_4666 == param1)
         {
            return;
         }
         if(Boolean(this.var_4666) && !this.var_1528)
         {
            this.var_4666.dispose();
         }
         this.var_4666 = param1;
         if(this.var_4666)
         {
            this.var_1528 = true;
            this.var_3256 = this.var_4666.width;
         }
         else
         {
            this.var_1528 = false;
         }
      }
      
      public function get light() : class_2102
      {
         return this._light;
      }
      
      public function set light(param1:class_2102) : void
      {
         this._light = param1;
      }
      
      public function get method_3585() : class_2115
      {
         var _loc1_:* = this.var_4666 || this.method_571();
         this.var_4666 = this.var_4666 || this.method_571();
         return _loc1_;
      }
      
      public function get depthMapSize() : uint
      {
         return this.var_3256;
      }
      
      public function set depthMapSize(param1:uint) : void
      {
         if(param1 == this.var_3256)
         {
            return;
         }
         this.var_3256 = param1;
         if(this.var_1528)
         {
            throw Error("Cannot set depth map size for the current renderer.");
         }
         if(this.var_4666)
         {
            this.var_4666.dispose();
            this.var_4666 = null;
         }
      }
      
      public function dispose() : void
      {
         this.var_3449 = null;
         if(Boolean(this.var_4666) && !this.var_1528)
         {
            this.var_4666.dispose();
         }
         this.var_4666 = null;
      }
      
      protected function method_571() : class_2115
      {
         return new class_2572(this.var_3256,this.var_3256);
      }
      
      arcane function method_1457(param1:class_1208, param2:class_2145, param3:class_2152) : void
      {
         this.arcane::var_2459 = false;
         this.method_873(param2.camera);
         this.var_4666 = this.var_4666 || this.method_571();
         this.method_2669(this.var_4666.method_6425(param1),param2.scene,param3);
      }
      
      protected function method_873(param1:class_1767) : void
      {
         throw new AbstractMethodError();
      }
      
      protected function method_2669(param1:TextureBase, param2:class_2128, param3:class_2152) : void
      {
         throw new AbstractMethodError();
      }
   }
}
