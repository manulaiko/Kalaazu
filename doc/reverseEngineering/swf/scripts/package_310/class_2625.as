package package_310
{
   import away3d.arcane;
   import package_198.class_1208;
   import package_364.DirectionalLight;
   import package_385.class_2237;
   import package_385.class_2251;
   
   public class class_2625 extends class_2608
   {
       
      
      public function class_2625(param1:DirectionalLight)
      {
         super(param1);
      }
      
      override arcane function method_4956(param1:class_2252) : void
      {
         super.arcane::method_4956(param1);
         var _loc2_:Vector.<Number> = param1.var_3329;
         var _loc3_:int = int(param1.var_2676);
         _loc2_[_loc3_ + 8] = 0.5;
         var _loc4_:int = int(method_5833.method_493.depthMapSize);
         _loc2_[_loc3_ + 9] = _loc4_;
         _loc2_[_loc3_ + 10] = 1 / _loc4_;
      }
      
      override protected function method_157(param1:class_2252, param2:class_2237, param3:class_2251) : String
      {
         var _loc4_:* = null;
         var _loc9_:* = null;
         _loc4_ = param2.method_3238();
         var _loc5_:class_2251 = param2.method_1853();
         var _loc6_:class_2251 = _loc6_ = param2.method_1853();
         var _loc7_:class_2251 = param2.method_1853();
         var _loc8_:class_2251 = param2.method_4834();
         var _loc10_:String = "";
         param1.var_2676 = Number(_loc5_.index) * 4;
         param2.method_4539(_loc8_,1);
         _loc9_ = param2.method_4834();
         param2.method_4539(_loc9_,1);
         _loc10_ += "mov " + _loc9_ + ", " + var_1513 + "\n" + "tex " + _loc8_ + ", " + var_1513 + ", " + _loc4_ + " <2d, nearest, clamp>\n" + "dp4 " + _loc8_ + ".z, " + _loc8_ + ", " + _loc5_ + "\n" + "slt " + _loc9_ + ".z, " + var_1513 + ".z, " + _loc8_ + ".z\n" + "add " + _loc9_ + ".x, " + var_1513 + ".x, " + _loc7_ + ".z\n" + "tex " + _loc8_ + ", " + _loc9_ + ", " + _loc4_ + " <2d, nearest, clamp>\n" + "dp4 " + _loc8_ + ".z, " + _loc8_ + ", " + _loc5_ + "\n" + "slt " + _loc9_ + ".w, " + var_1513 + ".z, " + _loc8_ + ".z\n" + "mul " + _loc8_ + ".x, " + var_1513 + ".x, " + _loc7_ + ".y\n" + "frc " + _loc8_ + ".x, " + _loc8_ + ".x\n" + "sub " + _loc9_ + ".w, " + _loc9_ + ".w, " + _loc9_ + ".z\n" + "mul " + _loc9_ + ".w, " + _loc9_ + ".w, " + _loc8_ + ".x\n" + "add " + param3 + ".w, " + _loc9_ + ".z, " + _loc9_ + ".w\n" + "mov " + _loc9_ + ".x, " + var_1513 + ".x\n" + "add " + _loc9_ + ".y, " + var_1513 + ".y, " + _loc7_ + ".z\n" + "tex " + _loc8_ + ", " + _loc9_ + ", " + _loc4_ + " <2d, nearest, clamp>\n" + "dp4 " + _loc8_ + ".z, " + _loc8_ + ", " + _loc5_ + "\n" + "slt " + _loc9_ + ".z, " + var_1513 + ".z, " + _loc8_ + ".z\n" + "add " + _loc9_ + ".x, " + var_1513 + ".x, " + _loc7_ + ".z\n" + "tex " + _loc8_ + ", " + _loc9_ + ", " + _loc4_ + " <2d, nearest, clamp>\n" + "dp4 " + _loc8_ + ".z, " + _loc8_ + ", " + _loc5_ + "\n" + "slt " + _loc9_ + ".w, " + var_1513 + ".z, " + _loc8_ + ".z\n" + "mul " + _loc8_ + ".x, " + var_1513 + ".x, " + _loc7_ + ".y\n" + "frc " + _loc8_ + ".x, " + _loc8_ + ".x\n" + "sub " + _loc9_ + ".w, " + _loc9_ + ".w, " + _loc9_ + ".z\n" + "mul " + _loc9_ + ".w, " + _loc9_ + ".w, " + _loc8_ + ".x\n" + "add " + _loc9_ + ".w, " + _loc9_ + ".z, " + _loc9_ + ".w\n" + "mul " + _loc8_ + ".x, " + var_1513 + ".y, " + _loc7_ + ".y\n" + "frc " + _loc8_ + ".x, " + _loc8_ + ".x\n" + "sub " + _loc9_ + ".w, " + _loc9_ + ".w, " + param3 + ".w\n" + "mul " + _loc9_ + ".w, " + _loc9_ + ".w, " + _loc8_ + ".x\n" + "add " + param3 + ".w, " + param3 + ".w, " + _loc9_ + ".w\n";
         param2.method_771(_loc8_);
         param2.method_771(_loc9_);
         param1.var_2852 = _loc4_.index;
         return _loc10_;
      }
      
      override arcane function method_766(param1:class_2252, param2:class_1208) : void
      {
         var _loc3_:int = int(var_1527.method_493.depthMapSize);
         var _loc4_:int = int(param1.var_4227);
         var _loc5_:Vector.<Number>;
         (_loc5_ = param1.var_3329)[_loc4_] = _loc3_;
         _loc5_[_loc4_ + 1] = 1 / _loc3_;
      }
      
      override arcane function method_6039(param1:class_2252, param2:class_2237, param3:class_2251, param4:class_2251, param5:class_2251, param6:class_2251) : String
      {
         var _loc7_:* = null;
         var _loc8_:class_2251 = param2.method_1853();
         param1.var_4227 = Number(_loc8_.index) * 4;
         var _loc9_:class_2251 = param2.method_4834();
         param2.method_4539(_loc9_,1);
         var _loc10_:class_2251 = param2.method_4834();
         param2.method_4539(_loc10_,1);
         _loc7_ = "tex " + _loc9_ + ", " + param5 + ", " + param4 + " <2d, nearest, clamp>\n" + "dp4 " + _loc9_ + ".z, " + _loc9_ + ", " + param3 + "\n" + "slt " + _loc10_ + ".x, " + param5 + ".z, " + _loc9_ + ".z\n" + "add " + param5 + ".x, " + param5 + ".x, " + _loc8_ + ".y\n" + "tex " + _loc9_ + ", " + param5 + ", " + param4 + " <2d, nearest, clamp>\n" + "dp4 " + _loc9_ + ".z, " + _loc9_ + ", " + param3 + "\n" + "slt " + _loc10_ + ".z, " + param5 + ".z, " + _loc9_ + ".z\n" + "add " + param5 + ".y, " + param5 + ".y, " + _loc8_ + ".y\n" + "tex " + _loc9_ + ", " + param5 + ", " + param4 + " <2d, nearest, clamp>\n" + "dp4 " + _loc9_ + ".z, " + _loc9_ + ", " + param3 + "\n" + "slt " + _loc10_ + ".w, " + param5 + ".z, " + _loc9_ + ".z\n" + "sub " + param5 + ".x, " + param5 + ".x, " + _loc8_ + ".y\n" + "tex " + _loc9_ + ", " + param5 + ", " + param4 + " <2d, nearest, clamp>\n" + "dp4 " + _loc9_ + ".z, " + _loc9_ + ", " + param3 + "\n" + "slt " + _loc10_ + ".y, " + param5 + ".z, " + _loc9_ + ".z\n" + "mul " + _loc9_ + ".xy, " + param5 + ".xy, " + _loc8_ + ".x\n" + "frc " + _loc9_ + ".xy, " + _loc9_ + ".xy\n" + "sub " + param5 + ", " + _loc10_ + ".xyzw, " + _loc10_ + ".zwxy\n" + "mul " + param5 + ", " + param5 + ", " + _loc9_ + ".x\n" + "add " + _loc10_ + ".xy, " + _loc10_ + ".xy, " + param5 + ".zw\n" + "sub " + _loc10_ + ".y, " + _loc10_ + ".y, " + _loc10_ + ".x\n" + "mul " + _loc10_ + ".y, " + _loc10_ + ".y, " + _loc9_ + ".y\n" + "add " + param6 + ".w, " + _loc10_ + ".x, " + _loc10_ + ".y\n";
         param2.method_771(_loc9_);
         param2.method_771(_loc10_);
         return _loc7_;
      }
   }
}
