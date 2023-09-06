package package_304
{
   import away3d.arcane;
   import flash.geom.Matrix3D;
   import package_199.class_2139;
   import package_293.class_2131;
   import package_295.class_1752;
   import package_299.class_1758;
   import package_369.class_2116;
   
   public class class_2418 extends class_1752
   {
       
      
      private var var_4129:class_1758;
      
      private var var_2354:Boolean = true;
      
      private var var_2067:Matrix3D;
      
      private var _texture:class_2116;
      
      public function class_2418(param1:class_2116)
      {
         this.var_2067 = new Matrix3D();
         super();
         this.var_4129 = new class_1758();
         this.var_4129.addEventListener(class_2139.const_2979,this.method_5440,false,0,true);
         this._texture = param1;
         this.var_4129.arcane::aspectRatio = Number(param1.width) / Number(param1.height);
         rotationX = -90;
      }
      
      public function get aspectRatio() : Number
      {
         return this.var_4129.arcane::aspectRatio;
      }
      
      public function set aspectRatio(param1:Number) : void
      {
         this.var_4129.arcane::aspectRatio = param1;
      }
      
      public function get fieldOfView() : Number
      {
         return this.var_4129.fieldOfView;
      }
      
      public function set fieldOfView(param1:Number) : void
      {
         this.var_4129.fieldOfView = param1;
      }
      
      override public function get assetType() : String
      {
         return class_2131.const_2510;
      }
      
      public function get texture() : class_2116
      {
         return this._texture;
      }
      
      public function set texture(param1:class_2116) : void
      {
         if(param1 == this._texture)
         {
            return;
         }
         this._texture = param1;
      }
      
      public function get method_2785() : Matrix3D
      {
         if(this.var_2354)
         {
            this.var_2067.copyFrom(method_2908);
            this.var_2067.append(this.var_4129.matrix);
            this.var_2354 = false;
         }
         return this.var_2067;
      }
      
      override protected function method_3172() : void
      {
         super.method_3172();
         this.var_2354 = true;
      }
      
      private function method_5440(param1:class_2139) : void
      {
         this.var_2354 = true;
      }
   }
}
