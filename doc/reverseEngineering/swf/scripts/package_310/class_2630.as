package package_310
{
   import away3d.arcane;
   import package_385.class_2237;
   import package_385.class_2251;
   
   public class class_2630 extends class_2241
   {
       
      
      public function class_2630()
      {
         super();
      }
      
      override arcane function initVO(param1:class_2252) : void
      {
         param1.var_3863 = true;
         param1.var_3475 = true;
      }
      
      override arcane function method_4161(param1:class_2252, param2:class_2251, param3:class_2251, param4:class_2237) : String
      {
         var _loc6_:* = null;
         var _loc5_:String = "";
         if(var_3130)
         {
            _loc6_ = var_800;
         }
         else
         {
            _loc6_ = param4.method_4834();
            param4.method_4539(_loc6_,1);
         }
         _loc5_ = (_loc5_ += "nrm " + _loc6_ + ".xyz, " + var_1283.var_1141 + ".xyz\n" + "dp3 " + _loc6_ + ".w, " + _loc6_ + ".xyz, " + param2 + ".xyz\n" + "dp3 " + _loc6_ + ".z, " + _loc6_ + ".xyz, " + var_1283.var_4238 + ".xyz\n") + ("sin " + _loc6_ + ".x, " + _loc6_ + ".w\n" + "sin " + _loc6_ + ".y, " + _loc6_ + ".z\n" + "mul " + _loc6_ + ".x, " + _loc6_ + ".x, " + _loc6_ + ".y\n" + "cos " + _loc6_ + ".z, " + _loc6_ + ".z\n" + "cos " + _loc6_ + ".w, " + _loc6_ + ".w\n" + "mul " + _loc6_ + ".w, " + _loc6_ + ".w, " + _loc6_ + ".z\n" + "sub " + _loc6_ + ".w, " + _loc6_ + ".x, " + _loc6_ + ".w\n");
         if(_useTexture)
         {
            _loc5_ += "mul " + var_1287 + ".w, " + var_1287 + ".y, " + var_2626 + ".w\n" + "pow " + _loc6_ + ".w, " + _loc6_ + ".w, " + var_1287 + ".w\n";
         }
         else
         {
            _loc5_ += "pow " + _loc6_ + ".w, " + _loc6_ + ".w, " + var_2626 + ".w\n";
         }
         _loc5_ += "mul " + _loc6_ + ".w, " + _loc6_ + ".w, " + param2 + ".w\n";
         if(arcane::var_366 != null)
         {
            _loc5_ += arcane::var_366(param1,_loc6_,param4,var_1283);
         }
         _loc5_ += "mul " + _loc6_ + ".xyz, " + param3 + ".xyz, " + _loc6_ + ".w\n";
         if(!var_3130)
         {
            _loc5_ += "add " + var_800 + ".xyz, " + var_800 + ".xyz, " + _loc6_ + ".xyz\n";
            param4.method_771(_loc6_);
         }
         var_3130 = false;
         return _loc5_;
      }
   }
}
