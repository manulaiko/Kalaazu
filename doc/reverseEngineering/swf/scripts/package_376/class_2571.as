package package_376
{
   import away3d.arcane;
   import flash.geom.Vector3D;
   import package_294.class_2133;
   import package_304.class_1766;
   import package_307.class_1772;
   import package_364.DirectionalLight;
   import package_364.PointLight;
   import package_364.class_2102;
   import package_364.class_2390;
   import package_377.class_2146;
   
   public class class_2571 extends class_2145
   {
       
      
      public function class_2571()
      {
         super();
      }
      
      override public function method_82(param1:class_2133) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc2_:class_1772 = param1.material;
         var _loc3_:class_1766 = param1.method_1409;
         if(Boolean(param1.method_825) && Boolean(_loc2_))
         {
            (_loc4_ = var_4436.getItem()).var_3785 = param1;
            _loc4_.next = var_4346;
            _loc4_.var_474 = false;
            _loc5_ = _loc3_.method_3037;
            _loc6_ = 0 - _loc5_.x;
            _loc7_ = 0 - _loc5_.y;
            _loc8_ = 0 - _loc5_.z;
            _loc4_.var_2496 = _loc6_ * 0 + _loc7_ * 0 + _loc8_ * 0;
            _loc4_.var_2920 = param1.method_846(var_116);
            _loc4_.var_1123 = _loc2_.arcane::var_2666;
            var_4346 = _loc4_;
         }
      }
      
      override public function method_5654(param1:class_2102) : void
      {
      }
      
      override public function method_2048(param1:DirectionalLight) : void
      {
      }
      
      override public function method_1287(param1:PointLight) : void
      {
      }
      
      override public function method_2774(param1:class_2390) : void
      {
      }
      
      override public function method_2327(param1:class_2133) : void
      {
      }
   }
}
