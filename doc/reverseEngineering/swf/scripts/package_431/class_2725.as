package package_431 {

import away3d.animators.class_2120;
import away3d.arcane;

import flash.geom.Vector3D;

import package_309.class_1774;

import package_385.class_2251;

import package_386.class_2238;
import package_386.class_2578;
import package_386.class_2580;

import package_430.class_2748;

public class class_2725 extends class_2406 {

    arcane static const const_2467: uint = 0;

    public static const const_2735: String = "OscillatorVector3D";


    arcane var var_3304: Vector3D;

    public function class_2725(param1: uint, param2: Vector3D = null) {
        super("ParticleOscillator", param1, 4);
        var_4797 = class_2748;
        this.arcane::var_3304 = param2 || new Vector3D();
    }

    override public function method_2174(param1: class_1774, param2: class_2238): String {
        param1 = param1;
        var _loc3_: class_2251 = _mode == class_2578.name_100 ? param2.method_5384() : param2.method_723();
        param2.method_5487(this, arcane::const_2467, _loc3_.index);
        var _loc4_: class_2251 = param2.method_3118();
        var _loc5_: class_2251 = new class_2251(_loc4_.method_3684, _loc4_.index, 0);
        var _loc6_: class_2251 = new class_2251(_loc4_.method_3684, _loc4_.index, 1);
        var _loc7_: class_2251 = new class_2251(_loc4_.method_3684, _loc4_.index, 2);
        param2.method_588(_loc4_, 1);
        var _loc8_: class_2251 = param2.method_3118();
        var _loc9_: class_2251 = new class_2251(_loc8_.method_3684, _loc8_.index);
        param2.method_5694(_loc4_);
        var _loc10_: String = (_loc10_ = (_loc10_ = (_loc10_ = (_loc10_ = "") + ("mul " + _loc5_ + "," + param2.var_2838 + "," + _loc3_ + ".w\n")) + ("sin " + _loc6_ + "," + _loc5_ + "\n")) + ("mul " + _loc9_ + ".xyz," + _loc6_ + "," + _loc3_ + ".xyz\n")) + ("add " + param2.var_1532 + ".xyz," + _loc9_ + ".xyz," + param2.var_1532 + ".xyz\n");
        if (param2.var_3696) {
            _loc10_ = (_loc10_ = (_loc10_ += "cos " + _loc7_ + "," + _loc5_ + "\n") + ("mul " + _loc9_ + ".xyz," + _loc7_ + "," + _loc3_ + ".xyz\n")) + ("add " + param2.var_1015 + ".xyz," + _loc9_ + ".xyz," + param2.var_1015 + ".xyz\n");
        }
        return _loc10_;
    }

    public function method_3412(param1: class_2120): class_2748 {
        return param1.method_3412(this) as class_2748;
    }

    override arcane function method_5880(param1: class_2580): void {
        var _loc2_: Vector3D = param1[const_2735];
        if (!_loc2_) {
            throw new Error("there is no " + const_2735 + " in param!");
        }
        var_2599[0] = _loc2_.x;
        var_2599[1] = _loc2_.y;
        var_2599[2] = _loc2_.z;
        if (_loc2_.w <= 0) {
            throw new Error("the cycle duration must greater than zero");
        }
        var_2599[3] = 0 / _loc2_.w;
    }
}
}
