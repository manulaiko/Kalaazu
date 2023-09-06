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
   import package_430.class_2757;
   
   public class class_2740 extends class_2406
   {
      
      arcane static const const_2185:int = 0;
      
      public static const const_2443:String = "AccelerationVector3D";
       
      
      arcane var var_205:Vector3D;
      
      public function class_2740(param1:uint, param2:Vector3D = null)
      {
         super("ParticleAcceleration",param1,3);
         var_4797 = class_2757;
         this.arcane::var_205 = param2 || new Vector3D();
      }
      
      override public function method_2174(param1:class_1774, param2:class_2238) : String
      {
         var _loc6_:* = null;
         param1 = param1;
         var _loc3_:class_2251 = _mode == class_2578.name_100 ? param2.method_5384() : param2.method_723();
         param2.method_5487(this,arcane::const_2185,_loc3_.index);
         var _loc4_:class_2251 = param2.method_3118();
         param2.method_588(_loc4_,1);
         var _loc5_:* = "mul " + _loc4_ + "," + param2.var_2838 + "," + _loc3_ + "\n";
         if(param2.var_3696)
         {
            _loc6_ = param2.method_3118();
            _loc5_ = (_loc5_ += "mul " + _loc6_ + "," + _loc4_ + "," + param2.var_4235 + "\n") + ("add " + param2.var_1015 + ".xyz," + _loc6_ + ".xyz," + param2.var_1015 + ".xyz\n");
         }
         param2.method_5694(_loc4_);
         return (_loc5_ += "mul " + _loc4_ + "," + _loc4_ + "," + param2.var_2838 + "\n") + ("add " + param2.var_1532 + ".xyz," + _loc4_ + "," + param2.var_1532 + ".xyz\n");
      }
      
      public function method_3412(param1:class_2120) : class_2757
      {
         return param1.method_3412(this) as class_2757;
      }
      
      override arcane function method_5880(param1:class_2580) : void
      {
         var _loc2_:Vector3D = param1[const_2443];
         if(!_loc2_)
         {
            throw new Error("there is no " + const_2443 + " in param!");
         }
         var_2599[0] = _loc2_.x / 2;
         var_2599[1] = _loc2_.y / 2;
         var_2599[2] = _loc2_.z / 2;
      }
   }
}
