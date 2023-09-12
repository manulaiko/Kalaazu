package package_310 {

import away3d.arcane;

import package_198.class_1208;

import package_364.class_2102;

import package_385.class_2237;
import package_385.class_2251;

public class class_2620 extends class_2608 {


    public function class_2620(param1: class_2102) {
        super(param1);
    }

    override protected function method_157(param1: class_2252, param2: class_2237, param3: class_2251): String {
        var _loc5_: * = null;
        var _loc4_: class_2251 = param2.method_3238();
        _loc5_ = param2.method_1853();
        var _loc6_: class_2251 = _loc6_ = param2.method_1853();
        var _loc7_: class_2251 = param2.method_4834();
        var _loc8_: String = "";
        param1.var_2676 = Number(_loc5_.index) * 4;
        param1.var_2852 = _loc4_.index;
        return _loc8_ + ("tex " + _loc7_ + ", " + var_1513 + ", " + _loc4_ + " <2d, nearest, clamp>\n" + "dp4 " + _loc7_ + ".z, " + _loc7_ + ", " + _loc5_ + "\n" + "slt " + param3 + ".w, " + var_1513 + ".z, " + _loc7_ + ".z\n");
    }

    override protected function method_3119(param1: class_2252, param2: class_2237, param3: class_2251): String {
        var _loc4_: class_2251 = param2.method_3238();
        var _loc5_: class_2251 = param2.method_1853();
        var _loc6_: class_2251 = param2.method_1853();
        var _loc7_: class_2251 = param2.method_1853();
        var _loc8_: class_2251 = param2.method_4834();
        param2.method_4539(_loc8_, 1);
        var _loc9_: class_2251 = param2.method_4834();
        var _loc10_: String = "";
        param1.var_2676 = Number(_loc5_.index) * 4;
        param1.var_2852 = _loc4_.index;
        _loc10_ += "sub " + _loc9_ + ", " + var_1283.var_1489 + ", " + _loc7_ + "\n" + "dp3 " + _loc9_ + ".w, " + _loc9_ + ".xyz, " + _loc9_ + ".xyz\n" + "mul " + _loc9_ + ".w, " + _loc9_ + ".w, " + _loc7_ + ".w\n" + "nrm " + _loc9_ + ".xyz, " + _loc9_ + ".xyz\n" + "tex " + _loc8_ + ", " + _loc9_ + ", " + _loc4_ + " <cube, nearest, clamp>\n" + "dp4 " + _loc8_ + ".z, " + _loc8_ + ", " + _loc5_ + "\n" + "add " + param3 + ".w, " + _loc9_ + ".w, " + _loc6_ + ".x\n" + "slt " + param3 + ".w, " + param3 + ".w, " + _loc8_ + ".z\n";
        param2.method_771(_loc8_);
        return _loc10_;
    }

    override arcane function method_6039(param1: class_2252, param2: class_2237, param3: class_2251, param4: class_2251, param5: class_2251, param6: class_2251): String {
        var _loc7_: class_2251 = param2.method_4834();
        return "tex " + _loc7_ + ", " + param5 + ", " + param4 + " <2d, nearest, clamp>\n" + "dp4 " + _loc7_ + ".z, " + _loc7_ + ", " + param3 + "\n" + "slt " + param6 + ".w, " + param5 + ".z, " + _loc7_ + ".z\n";
    }

    override arcane function method_766(param1: class_2252, param2: class_1208): void {
    }
}
}
