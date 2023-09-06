package package_431
{
   import away3d.animators.class_2120;
   import away3d.arcane;
   import flash.geom.Vector3D;
   import package_309.class_1774;
   import package_385.class_2251;
   import package_386.class_2238;
   import package_386.class_2578;
   import package_386.class_2580;
   import package_430.class_2756;
   
   public class class_2739 extends class_2406
   {
      
      arcane static const const_1898:uint = 0;
      
      public static const const_1069:String = "RotationalVelocityVector3D";
       
      
      arcane var var_2574:Vector3D;
      
      public function class_2739(param1:uint, param2:Vector3D = null)
      {
         var_4797 = class_2756;
         super("ParticleRotationalVelocity",param1,4);
         this.arcane::var_2574 = param2 || new Vector3D();
      }
      
      override public function method_2174(param1:class_1774, param2:class_2238) : String
      {
         param1 = param1;
         var _loc3_:class_2251 = _mode == class_2578.name_100 ? param2.method_5384() : param2.method_723();
         param2.method_5487(this,arcane::const_1898,_loc3_.index);
         var _loc4_:class_2251 = param2.method_3118();
         param2.method_588(_loc4_,1);
         var _loc5_:class_2251 = param2.method_3118();
         param2.method_588(_loc5_,1);
         var _loc6_:class_2251 = param2.method_3118();
         param2.method_588(_loc6_,1);
         var _loc7_:class_2251 = new class_2251(_loc6_.method_3684,_loc6_.index);
         var _loc8_:class_2251 = param2.method_3118();
         _loc8_ = new class_2251(_loc8_.method_3684,_loc8_.index);
         var _loc9_:class_2251 = new class_2251(_loc7_.method_3684,_loc7_.index,3);
         var _loc10_:class_2251 = new class_2251(_loc8_.method_3684,_loc8_.index,3);
         param2.method_5694(_loc4_);
         param2.method_5694(_loc5_);
         param2.method_5694(_loc6_);
         var _loc11_:String = (_loc11_ = (_loc11_ = (_loc11_ = (_loc11_ = (_loc11_ = (_loc11_ = (_loc11_ = (_loc11_ = (_loc11_ = (_loc11_ = (_loc11_ = (_loc11_ = (_loc11_ = (_loc11_ = (_loc11_ = (_loc11_ = (_loc11_ = (_loc11_ = "") + ("mov " + _loc4_ + ".xyz," + _loc3_ + ".xyz\n")) + ("mov " + _loc4_ + ".w," + param2.var_4178 + "\n")) + ("mul " + _loc9_ + "," + param2.var_2838 + "," + _loc3_ + ".w\n")) + ("sin " + _loc10_ + "," + _loc9_ + "\n")) + ("cos " + _loc9_ + "," + _loc9_ + "\n")) + ("mul " + _loc7_ + ".xyz," + _loc10_ + "," + _loc4_ + ".xyz\n")) + ("mul " + _loc8_ + ".xyz," + _loc10_ + "," + _loc4_ + ".xyz\n")) + ("neg " + _loc8_ + ".xyz," + _loc8_ + ".xyz\n")) + ("crs " + _loc4_ + ".xyz," + _loc7_ + ".xyz," + param2.var_705 + ".xyz\n")) + ("mul " + _loc5_ + ".xyz," + _loc9_ + "," + param2.var_705 + ".xyz\n")) + ("add " + _loc4_ + ".xyz," + _loc4_ + ".xyz," + _loc5_ + ".xyz\n")) + ("dp3 " + _loc5_ + ".w," + _loc7_ + ".xyz," + param2.var_705 + ".xyz\n")) + ("neg " + _loc4_ + ".w," + _loc5_ + ".w\n")) + ("crs " + _loc7_ + ".xyz," + _loc4_ + ".xyz," + _loc8_ + ".xyz\n")) + ("mul " + _loc5_ + ".xyzw," + _loc4_ + ".xyzw," + _loc9_ + "\n")) + ("add " + _loc7_ + ".xyz," + _loc7_ + ".xyz," + _loc5_ + ".xyz\n")) + ("mul " + _loc5_ + ".xyz," + _loc4_ + ".w," + _loc8_ + ".xyz\n")) + ("add " + param2.var_705 + ".xyz," + _loc7_ + ".xyz," + _loc5_ + ".xyz\n");
         var _loc12_:int = int(param2.var_3853.length);
         var _loc13_:int = 0;
         while(_loc13_ < _loc12_)
         {
            _loc11_ = (_loc11_ = (_loc11_ = (_loc11_ = (_loc11_ = (_loc11_ = (_loc11_ = (_loc11_ = (_loc11_ = (_loc11_ = (_loc11_ = (_loc11_ = (_loc11_ = (_loc11_ = (_loc11_ = (_loc11_ = (_loc11_ = (_loc11_ += "mov " + _loc4_ + ".xyz," + _loc3_ + ".xyz\n") + ("mov " + _loc4_ + ".w," + param2.var_4178 + "\n")) + ("mul " + _loc9_ + "," + param2.var_2838 + "," + _loc3_ + ".w\n")) + ("sin " + _loc10_ + "," + _loc9_ + "\n")) + ("cos " + _loc9_ + "," + _loc9_ + "\n")) + ("mul " + _loc7_ + ".xyz," + _loc10_ + "," + _loc4_ + ".xyz\n")) + ("mul " + _loc8_ + ".xyz," + _loc10_ + "," + _loc4_ + ".xyz\n")) + ("neg " + _loc8_ + ".xyz," + _loc8_ + ".xyz\n")) + ("crs " + _loc4_ + ".xyz," + _loc7_ + ".xyz," + param2.var_3853[_loc13_] + ".xyz\n")) + ("mul " + _loc5_ + ".xyz," + _loc9_ + "," + param2.var_3853[_loc13_] + "\n")) + ("add " + _loc4_ + ".xyz," + _loc4_ + ".xyz," + _loc5_ + ".xyz\n")) + ("dp3 " + _loc5_ + ".w," + _loc7_ + ".xyz," + param2.var_3853[_loc13_] + "\n")) + ("neg " + _loc4_ + ".w," + _loc5_ + ".w\n")) + ("crs " + _loc7_ + ".xyz," + _loc4_ + ".xyz," + _loc8_ + ".xyz\n")) + ("mul " + _loc5_ + ".xyzw," + _loc4_ + ".xyzw," + _loc9_ + "\n")) + ("add " + _loc7_ + ".xyz," + _loc7_ + ".xyz," + _loc5_ + ".xyz\n")) + ("mul " + _loc5_ + ".xyz," + _loc4_ + ".w," + _loc8_ + ".xyz\n")) + ("add " + param2.var_3853[_loc13_] + "," + _loc7_ + ".xyz," + _loc5_ + ".xyz\n");
            _loc13_++;
         }
         return _loc11_;
      }
      
      public function method_3412(param1:class_2120) : class_2756
      {
         return param1.method_3412(this) as class_2756;
      }
      
      override arcane function method_5880(param1:class_2580) : void
      {
         var _loc2_:Vector3D = param1[const_1069];
         if(!_loc2_)
         {
            throw new Error("there is no " + const_1069 + " in param!");
         }
         if(_loc2_.length <= 0)
         {
            _loc2_.z = 1;
         }
         else
         {
            _loc2_.normalize();
         }
         var_2599[0] = _loc2_.x;
         var_2599[1] = _loc2_.y;
         var_2599[2] = _loc2_.z;
         if(_loc2_.w <= 0)
         {
            throw new Error("the cycle duration must greater than zero");
         }
         var_2599[3] = 0 / _loc2_.w;
      }
   }
}
