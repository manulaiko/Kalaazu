package package_436
{
   import away3d.arcane;
   import flash.geom.Matrix3D;
   import package_294.class_2425;
   import package_294.class_2429;
   import package_294.class_2602;
   import package_374.AbstractMethodError;
   
   public class class_2474 extends class_2429
   {
       
      
      protected var var_2543:Boolean = true;
      
      protected var var_1182:Boolean = true;
      
      private var var_2331:class_2602;
      
      public function class_2474()
      {
         super();
         this.var_2331 = new class_2602();
         this.var_2331.method_1688 = false;
         method_1586(this.var_2331);
      }
      
      override public function get subGeometries() : Vector.<class_2425>
      {
         if(this.var_2543)
         {
            this.method_3934();
         }
         if(this.var_1182)
         {
            this.method_4309();
         }
         return super.subGeometries;
      }
      
      override public function clone() : class_2429
      {
         if(this.var_2543)
         {
            this.method_3934();
         }
         if(this.var_1182)
         {
            this.method_4309();
         }
         return super.clone();
      }
      
      override public function scale(param1:Number) : void
      {
         if(this.var_2543)
         {
            this.method_3934();
         }
         super.scale(param1);
      }
      
      override public function method_3965(param1:Number = 1, param2:Number = 1) : void
      {
         if(this.var_1182)
         {
            this.method_4309();
         }
         super.method_3965(param1,param2);
      }
      
      override public function method_1695(param1:Matrix3D) : void
      {
         if(this.var_2543)
         {
            this.method_3934();
         }
         super.method_1695(param1);
      }
      
      protected function method_389(param1:class_2602) : void
      {
         throw new AbstractMethodError();
      }
      
      protected function method_1765(param1:class_2602) : void
      {
         throw new AbstractMethodError();
      }
      
      protected function method_2121() : void
      {
         this.var_2543 = true;
      }
      
      protected function method_596() : void
      {
         this.var_1182 = true;
      }
      
      private function method_3934() : void
      {
         this.method_389(this.var_2331);
         this.var_2543 = false;
      }
      
      private function method_4309() : void
      {
         this.method_1765(this.var_2331);
         this.var_1182 = false;
      }
      
      override arcane function validate() : void
      {
         if(this.var_2543)
         {
            this.method_3934();
         }
         if(this.var_1182)
         {
            this.method_4309();
         }
      }
   }
}
