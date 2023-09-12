package package_431 {

import away3d.animators.class_2120;
import away3d.arcane;

import package_309.class_1774;

import package_385.class_2251;

import package_386.class_2238;
import package_386.class_2578;
import package_386.class_2580;

import package_430.class_2402;

public class class_2577 extends class_2406 {

    arcane static const const_2342: uint = 0;

    arcane static const const_3056: uint = 1;


    arcane var var_3721: Boolean;

    arcane var var_2272: Boolean;

    arcane var var_1539: Boolean;

    public function class_2577(param1: Boolean = false, param2: Boolean = false, param3: Boolean = false) {
        var_4797 = class_2402;
        this.arcane::var_3721 = param1;
        this.arcane::var_1539 = param2;
        this.arcane::var_2272 = param3;
        super("ParticleTime", class_2578.name_24, 4, 0);
    }

    override public function method_2174(param1: class_1774, param2: class_2238): String {
        var _loc7_: * = null;
        var _loc8_: * = null;
        param1 = param1;
        var _loc3_: class_2251 = param2.method_723();
        param2.method_5487(this, arcane::const_2342, _loc3_.index);
        var _loc4_: class_2251 = param2.method_5384();
        param2.method_5487(this, arcane::const_3056, _loc4_.index);
        var _loc5_: String = (_loc5_ = "") + ("sub " + param2.var_2838 + "," + _loc4_ + "," + _loc3_ + ".x\n");
        var _loc6_: class_2251 = param2.method_2395();
        _loc5_ = (_loc5_ += "sge " + _loc6_ + "," + param2.var_2838 + "," + param2.var_4178 + "\n") + ("mul " + param2.var_705 + ".xyz," + param2.var_705 + ".xyz," + _loc6_ + "\n");
        if (this.arcane::var_3721) {
            if (this.arcane::var_1539) {
                _loc7_ = param2.method_2395();
                if (this.arcane::var_2272) {
                    _loc5_ = (_loc5_ = (_loc5_ = (_loc5_ = (_loc5_ += "div " + _loc7_ + "," + param2.var_2838 + "," + _loc3_ + ".z\n") + ("frc " + _loc7_ + "," + _loc7_ + "\n")) + ("mul " + param2.var_2838 + "," + _loc7_ + "," + _loc3_ + ".z\n")) + ("slt " + _loc7_ + "," + param2.var_2838 + "," + _loc3_ + ".y\n")) + ("mul " + param2.var_705 + ".xyz," + param2.var_705 + ".xyz," + _loc7_ + "\n");
                } else {
                    _loc5_ = (_loc5_ = (_loc5_ += "mul " + _loc7_ + "," + param2.var_2838 + "," + _loc3_ + ".w\n") + ("frc " + _loc7_ + "," + _loc7_ + "\n")) + ("mul " + param2.var_2838 + "," + _loc7_ + "," + _loc3_ + ".y\n");
                }
            } else {
                _loc8_ = param2.method_2395();
                _loc5_ = (_loc5_ += "sge " + _loc8_ + "," + _loc3_ + ".y," + param2.var_2838 + "\n") + ("mul " + param2.var_705 + ".xyz," + param2.var_705 + ".xyz," + _loc8_ + "\n");
            }
        }
        return _loc5_ + ("mul " + param2.var_4785 + "," + param2.var_2838 + "," + _loc3_ + ".w\n");
    }

    public function method_3412(param1: class_2120): class_2402 {
        return param1.method_3412(this) as class_2402;
    }

    override arcane function method_5880(param1: class_2580): void {
        var_2599[0] = param1.startTime;
        var_2599[1] = param1.duration;
        var_2599[2] = param1.delay + param1.duration;
        var_2599[3] = 1 / Number(param1.duration);
    }
}
}
