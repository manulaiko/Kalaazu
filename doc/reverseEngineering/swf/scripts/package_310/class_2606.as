package package_310 {

import away3d.arcane;

import package_385.class_2237;
import package_385.class_2251;

public class class_2606 extends class_2246 {


    public function class_2606() {
        super();
    }

    override arcane function method_4956(param1: class_2252): void {
        var _loc2_: Vector.<Number> = param1.var_3329;
        var _loc3_: int = int(param1.var_2676);
        _loc2_[_loc3_] = 1;
        _loc2_[_loc3_ + 1] = 0.00392156862745098;
        _loc2_[_loc3_ + 2] = 0.000015378700499807768;
        _loc2_[_loc3_ + 3] = 6.030862941101084e-8;
    }

    override arcane function method_5951(param1: class_2252, param2: class_2237, param3: class_2251): String {
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc4_: String = "";
        if (!_useTexture) {
            throw new Error("DepthDiffuseMethod requires texture!");
        }
        if (param1.name_108 > 0) {
            if (var_712) {
                _loc4_ += "mul " + var_800 + ".xyz, " + var_800 + ".xyz, " + var_712 + ".w\n";
            }
            _loc4_ += "add " + param3 + ".xyz, " + var_800 + ".xyz, " + param3 + ".xyz\n" + "sat " + param3 + ".xyz, " + param3 + ".xyz\n";
            param2.method_771(var_800);
        }
        _loc5_ = param1.name_108 > 0 ? param2.method_4834() : param3;
        var_3489 = param2.method_3238();
        param1.var_2852 = var_3489.index;
        _loc6_ = param2.method_1853();
        param1.var_2676 = Number(_loc6_.index) * 4;
        _loc4_ += getTex2DSampleCode(param1, _loc5_, var_3489, texture) + "dp4 " + _loc5_ + ".x, " + _loc5_ + ", " + _loc6_ + "\n" + "mov " + _loc5_ + ".yz, " + _loc5_ + ".xx\t\t\t\n" + "mov " + _loc5_ + ".w, " + _loc6_ + ".x\n" + "sub " + _loc5_ + ".xyz, " + _loc6_ + ".xxx, " + _loc5_ + ".xyz\n";
        if (param1.name_108 == 0) {
            return _loc4_;
        }
        return _loc4_ + ("mul " + param3 + ".xyz, " + _loc5_ + ".xyz, " + param3 + ".xyz\n" + "mov " + param3 + ".w, " + _loc5_ + ".w\n");
    }
}
}
