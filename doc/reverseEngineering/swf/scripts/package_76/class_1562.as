package package_76
{
   import package_341.class_1913;
   
   public class class_1562
   {
       
      
      public function class_1562()
      {
         super();
      }
      
      public static function interpolate(param1:uint, param2:uint, param3:Number) : uint
      {
         var _loc4_:uint = param1 >> 16 & 255;
         var _loc5_:uint = param1 >> 8 & 255;
         var _loc6_:uint = param1 & 255;
         var _loc7_:int = (param2 >> 16 & 255) - _loc4_;
         var _loc8_:int = (param2 >> 8 & 255) - _loc5_;
         var _loc9_:int = (param2 & 255) - _loc6_;
         return _loc4_ + _loc7_ * param3 << 16 | _loc5_ + _loc8_ * param3 << 8 | _loc6_ + _loc9_ * param3;
      }
      
      public static function method_2456() : uint
      {
         return new class_1913(Math.random() * 360,0.4 + Math.random() * 0.5,0.1 + Math.random() * 0.8).method_3795;
      }
   }
}
