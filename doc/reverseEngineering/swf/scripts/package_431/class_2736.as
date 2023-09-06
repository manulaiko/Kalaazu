package package_431
{
   import away3d.animators.class_2120;
   import away3d.animators.class_2579;
   import away3d.arcane;
   import package_309.class_1774;
   import package_385.class_2251;
   import package_386.class_2238;
   import package_386.class_2578;
   import package_430.class_2754;
   
   public class class_2736 extends class_2406
   {
      
      arcane static const const_947:int = 0;
       
      
      public function class_2736()
      {
         super("ParticleRotateToHeading",class_2578.name_100,0,3);
         var_4797 = class_2754;
      }
      
      override public function method_2174(param1:class_1774, param2:class_2238) : String
      {
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         param1 = param1;
         var _loc3_:String = "";
         var _loc4_:int = int(param2.var_3853.length);
         if(param2.var_3591)
         {
            _loc6_ = param2.method_3118();
            param2.method_588(_loc6_,1);
            _loc7_ = param2.method_3118();
            param2.method_588(_loc7_,1);
            _loc8_ = param2.method_3118();
            _loc9_ = param2.method_5384();
            param2.method_5487(this,arcane::const_947,_loc9_.index);
            param2.method_5384();
            param2.method_5384();
            param2.method_5384();
            param2.method_5694(_loc6_);
            param2.method_5694(_loc7_);
            _loc3_ += "m33 " + _loc6_ + ".xyz," + param2.var_1015 + ".xyz," + _loc9_ + "\n";
            _loc3_ += "mov " + _loc8_ + "," + param2.var_4178 + "\n";
            _loc3_ += "mov " + _loc8_ + ".xy," + _loc6_ + ".xy\n";
            _loc3_ += "nrm " + _loc8_ + ".xyz," + _loc8_ + ".xyz\n";
            _loc3_ += "mov " + _loc7_ + "," + param2.var_4178 + "\n";
            _loc3_ += "mov " + _loc7_ + ".x," + _loc8_ + ".y\n";
            _loc3_ += "mov " + _loc7_ + ".y," + _loc8_ + ".x\n";
            _loc3_ += "mov " + _loc6_ + "," + param2.var_4178 + "\n";
            _loc3_ += "mov " + _loc6_ + ".x," + _loc8_ + ".x\n";
            _loc3_ += "neg " + _loc6_ + ".y," + _loc8_ + ".y\n";
            _loc3_ += "mov " + _loc8_ + "," + param2.var_4178 + "\n";
            _loc3_ += "mov " + _loc8_ + ".z," + param2.var_748 + "\n";
            _loc3_ += "m33 " + param2.var_705 + ".xyz," + param2.var_705 + ".xyz," + _loc6_ + "\n";
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc3_ += "m33 " + param2.var_3853[_loc5_] + ".xyz," + param2.var_3853[_loc5_] + "," + _loc6_ + "\n";
               _loc5_++;
            }
         }
         else
         {
            _loc10_ = param2.method_3118();
            param2.method_588(_loc10_,1);
            _loc11_ = param2.method_3118();
            param2.method_588(_loc11_,1);
            _loc12_ = param2.method_3118();
            param2.method_588(_loc12_,1);
            _loc13_ = param2.method_3118();
            _loc14_ = new class_2251(_loc12_.method_3684,_loc12_.index,3);
            _loc15_ = new class_2251(_loc13_.method_3684,_loc13_.index,3);
            _loc16_ = new class_2251(_loc10_.method_3684,_loc10_.index,3);
            _loc17_ = _loc15_;
            param2.method_5694(_loc10_);
            param2.method_5694(_loc11_);
            param2.method_5694(_loc12_);
            _loc3_ += "mov " + _loc11_ + ".x," + param2.var_748 + "\n";
            _loc3_ += "mov " + _loc11_ + ".yz," + param2.var_4178 + "\n";
            _loc3_ += "nrm " + _loc10_ + ".xyz," + param2.var_1015 + ".xyz\n";
            _loc3_ += "dp3 " + _loc16_ + "," + _loc10_ + ".xyz," + _loc11_ + ".xyz\n";
            _loc3_ += "crs " + _loc10_ + ".xyz," + _loc11_ + ".xyz," + _loc10_ + ".xyz\n";
            _loc3_ += "nrm " + _loc10_ + ".xyz," + _loc10_ + ".xyz\n";
            _loc3_ += "dp3 " + _loc12_ + ".x," + _loc10_ + ".xyz," + _loc10_ + ".xyz\n";
            _loc3_ += "sge " + _loc12_ + ".x," + param2.var_4178 + "," + _loc12_ + ".x\n";
            _loc3_ += "add " + _loc10_ + ".z," + _loc12_ + ".x," + _loc10_ + ".z\n";
            _loc3_ += "add " + _loc17_ + "," + _loc16_ + "," + param2.var_748 + "\n";
            _loc3_ += "div " + _loc17_ + "," + _loc17_ + "," + param2.var_4235 + "\n";
            _loc3_ += "sqt " + _loc14_ + "," + _loc17_ + "\n";
            _loc3_ += "sub " + _loc17_ + "," + param2.var_748 + "," + _loc16_ + "\n";
            _loc3_ += "div " + _loc17_ + "," + _loc17_ + "," + param2.var_4235 + "\n";
            _loc3_ += "sqt " + _loc15_ + "," + _loc17_ + "\n";
            _loc3_ += "mul " + _loc12_ + ".xyz," + _loc15_ + "," + _loc10_ + ".xyz\n";
            _loc3_ += "mul " + _loc13_ + ".xyz," + _loc15_ + "," + _loc10_ + ".xyz\n";
            _loc3_ += "neg " + _loc13_ + ".xyz," + _loc13_ + ".xyz\n";
            _loc3_ += "crs " + _loc10_ + ".xyz," + _loc12_ + ".xyz," + param2.var_705 + ".xyz\n";
            _loc3_ += "mul " + _loc11_ + ".xyz," + _loc14_ + "," + param2.var_705 + ".xyz\n";
            _loc3_ += "add " + _loc10_ + ".xyz," + _loc10_ + ".xyz," + _loc11_ + ".xyz\n";
            _loc3_ += "dp3 " + _loc11_ + ".w," + _loc12_ + ".xyz," + param2.var_705 + ".xyz\n";
            _loc3_ += "neg " + _loc10_ + ".w," + _loc11_ + ".w\n";
            _loc3_ += "crs " + _loc12_ + ".xyz," + _loc10_ + ".xyz," + _loc13_ + ".xyz\n";
            _loc3_ += "mul " + _loc11_ + ".xyzw," + _loc10_ + ".xyzw," + _loc14_ + "\n";
            _loc3_ += "add " + _loc12_ + ".xyz," + _loc12_ + ".xyz," + _loc11_ + ".xyz\n";
            _loc3_ += "mul " + _loc11_ + ".xyz," + _loc10_ + ".w," + _loc13_ + ".xyz\n";
            _loc3_ += "add " + param2.var_705 + ".xyz," + _loc12_ + ".xyz," + _loc11_ + ".xyz\n";
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc3_ += "mov " + _loc11_ + ".x," + param2.var_748 + "\n";
               _loc3_ += "mov " + _loc11_ + ".yz," + param2.var_4178 + "\n";
               _loc3_ += "nrm " + _loc10_ + ".xyz," + param2.var_1015 + ".xyz\n";
               _loc3_ += "dp3 " + _loc16_ + "," + _loc10_ + ".xyz," + _loc11_ + ".xyz\n";
               _loc3_ += "crs " + _loc10_ + ".xyz," + _loc11_ + ".xyz," + _loc10_ + ".xyz\n";
               _loc3_ += "nrm " + _loc10_ + ".xyz," + _loc10_ + ".xyz\n";
               _loc3_ += "dp3 " + _loc12_ + ".x," + _loc10_ + ".xyz," + _loc10_ + ".xyz\n";
               _loc3_ += "sge " + _loc12_ + ".x," + param2.var_4178 + "," + _loc12_ + ".x\n";
               _loc3_ += "add " + _loc10_ + ".z," + _loc12_ + ".x," + _loc10_ + ".z\n";
               _loc3_ += "add " + _loc17_ + "," + _loc16_ + "," + param2.var_748 + "\n";
               _loc3_ += "div " + _loc17_ + "," + _loc17_ + "," + param2.var_4235 + "\n";
               _loc3_ += "sqt " + _loc14_ + "," + _loc17_ + "\n";
               _loc3_ += "sub " + _loc17_ + "," + param2.var_748 + "," + _loc16_ + "\n";
               _loc3_ += "div " + _loc17_ + "," + _loc17_ + "," + param2.var_4235 + "\n";
               _loc3_ += "sqt " + _loc15_ + "," + _loc17_ + "\n";
               _loc3_ += "mul " + _loc12_ + ".xyz," + _loc15_ + "," + _loc10_ + ".xyz\n";
               _loc3_ += "mul " + _loc13_ + ".xyz," + _loc15_ + "," + _loc10_ + ".xyz\n";
               _loc3_ += "neg " + _loc13_ + ".xyz," + _loc13_ + ".xyz\n";
               _loc3_ += "crs " + _loc10_ + ".xyz," + _loc12_ + ".xyz," + param2.var_3853[_loc5_] + ".xyz\n";
               _loc3_ += "mul " + _loc11_ + ".xyz," + _loc14_ + "," + param2.var_3853[_loc5_] + ".xyz\n";
               _loc3_ += "add " + _loc10_ + ".xyz," + _loc10_ + ".xyz," + _loc11_ + ".xyz\n";
               _loc3_ += "dp3 " + _loc11_ + ".w," + _loc12_ + ".xyz," + param2.var_3853[_loc5_] + ".xyz\n";
               _loc3_ += "neg " + _loc10_ + ".w," + _loc11_ + ".w\n";
               _loc3_ += "crs " + _loc12_ + ".xyz," + _loc10_ + ".xyz," + _loc13_ + ".xyz\n";
               _loc3_ += "mul " + _loc11_ + ".xyzw," + _loc10_ + ".xyzw," + _loc14_ + "\n";
               _loc3_ += "add " + _loc12_ + ".xyz," + _loc12_ + ".xyz," + _loc11_ + ".xyz\n";
               _loc3_ += "mul " + _loc11_ + ".xyz," + _loc10_ + ".w," + _loc13_ + ".xyz\n";
               _loc3_ += "add " + param2.var_3853[_loc5_] + ".xyz," + _loc12_ + ".xyz," + _loc11_ + ".xyz\n";
               _loc5_++;
            }
         }
         return _loc3_;
      }
      
      public function method_3412(param1:class_2120) : class_2754
      {
         return param1.method_3412(this) as class_2754;
      }
      
      override arcane function method_2127(param1:class_2579) : void
      {
         param1.var_3696 = true;
      }
   }
}
