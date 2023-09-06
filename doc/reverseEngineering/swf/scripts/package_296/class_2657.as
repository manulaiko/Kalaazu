package package_296
{
   import flash.geom.Point;
   import flash.geom.Vector3D;
   import package_294.class_2398;
   import package_294.class_2427;
   import package_434.class_2450;
   
   public class class_2657
   {
       
      
      protected var name_34:Vector3D;
      
      protected var rayDirection:Vector3D;
      
      public function class_2657()
      {
         super();
      }
      
      protected function method_3018(param1:Vector.<uint>, param2:Vector.<Number>, param3:uint, param4:Vector3D = null) : Vector3D
      {
         var _loc5_:uint = param1[param3] * 3;
         var _loc6_:uint = param1[param3 + 1] * 3;
         var _loc7_:uint = param1[param3 + 2] * 3;
         var _loc8_:Number = param2[_loc6_] - param2[_loc5_];
         var _loc9_:Number = param2[_loc6_ + 1] - param2[_loc5_ + 1];
         var _loc10_:Number = param2[_loc6_ + 2] - param2[_loc5_ + 2];
         var _loc11_:Number = param2[_loc7_] - param2[_loc5_];
         var _loc12_:Number = param2[_loc7_ + 1] - param2[_loc5_ + 1];
         var _loc13_:Number = param2[_loc7_ + 2] - param2[_loc5_ + 2];
         if(!param4)
         {
            param4 = new Vector3D();
         }
         param4.x = _loc9_ * _loc13_ - _loc10_ * _loc12_;
         param4.y = _loc10_ * _loc11_ - _loc8_ * _loc13_;
         param4.z = _loc8_ * _loc12_ - _loc9_ * _loc11_;
         param4.w = 1;
         param4.normalize();
         return param4;
      }
      
      protected function method_6005(param1:Vector.<uint>, param2:Vector.<Number>, param3:uint, param4:Number, param5:Number, param6:Number, param7:uint, param8:uint, param9:Point = null) : Point
      {
         var _loc10_:uint = param1[param3] * param8 + param7;
         var _loc11_:Number = param2[_loc10_];
         var _loc12_:Number = param2[_loc10_ + 1];
         _loc10_ = param1[param3 + 1] * param8 + param7;
         var _loc13_:Number = param2[_loc10_];
         var _loc14_:Number = param2[_loc10_ + 1];
         _loc10_ = param1[param3 + 2] * param8 + param7;
         var _loc15_:Number = param2[_loc10_];
         var _loc16_:Number = param2[_loc10_ + 1];
         if(!param9)
         {
            param9 = new Point();
         }
         param9.x = param6 * _loc11_ + param4 * _loc13_ + param5 * _loc15_;
         param9.y = param6 * _loc12_ + param4 * _loc14_ + param5 * _loc16_;
         return param9;
      }
      
      protected function method_258(param1:class_2427) : uint
      {
         return class_2450.method_258(param1);
      }
      
      protected function method_1832(param1:class_2398) : uint
      {
         return class_2450.method_1832(param1);
      }
      
      public function method_2991(param1:Vector3D, param2:Vector3D) : void
      {
         this.name_34 = param1;
         this.rayDirection = param2;
      }
   }
}
