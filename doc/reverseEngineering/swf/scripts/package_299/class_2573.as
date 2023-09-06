package package_299
{
   import away3d.arcane;
   
   public class class_2573 extends class_1757
   {
       
      
      public function class_2573()
      {
         super();
         _matrix.copyFrom(new class_1758().matrix);
      }
      
      override public function set method_5049(param1:Number) : void
      {
         var_2628 = param1;
      }
      
      override public function set method_1840(param1:Number) : void
      {
         var_3375 = param1;
      }
      
      override arcane function set aspectRatio(param1:Number) : void
      {
         var_2640 = param1;
      }
      
      override public function clone() : class_1757
      {
         var _loc1_:* = null;
         _loc1_ = new class_2573();
         _loc1_._matrix.copyFrom(_matrix);
         _loc1_.var_2628 = var_2628;
         _loc1_.var_3375 = var_3375;
         _loc1_.var_2640 = var_2640;
         _loc1_.method_320();
         return _loc1_;
      }
      
      override protected function method_739() : void
      {
         var_585 = false;
      }
   }
}
