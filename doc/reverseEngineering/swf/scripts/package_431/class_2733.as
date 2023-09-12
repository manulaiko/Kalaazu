package package_431 {

import away3d.animators.class_2120;
import away3d.arcane;

import flash.geom.Vector3D;

import package_309.class_1774;

import package_385.class_2251;

import package_386.class_2238;
import package_386.class_2578;
import package_386.class_2580;

import package_430.class_2753;

public class class_2733 extends class_2406 {

    arcane static const const_843: int = 0;

    public static const const_338: String = "VelocityVector3D";


    arcane var var_747: Vector3D;

    public function class_2733(param1: uint, param2: Vector3D = null) {
        super("ParticleVelocity", param1, 3);
        var_4797 = class_2753;
        this.arcane::var_747 = param2 || new Vector3D();
    }

    override public function method_2174(param1: class_1774, param2: class_2238): String {
        param1 = param1;
        var _loc3_: class_2251 = _mode == class_2578.name_100 ? param2.method_5384() : param2.method_723();
        param2.method_5487(this, arcane::const_843, _loc3_.index);
        var _loc4_: class_2251 = param2.method_3118();
        var _loc5_: String = (_loc5_ = (_loc5_ = "") + ("mul " + _loc4_ + "," + param2.var_2838 + "," + _loc3_ + "\n")) + ("add " + param2.var_1532 + ".xyz," + _loc4_ + "," + param2.var_1532 + ".xyz\n");
        if (param2.var_3696) {
            _loc5_ += "add " + param2.var_1015 + ".xyz," + _loc3_ + ".xyz," + param2.var_1015 + ".xyz\n";
        }
        return _loc5_;
    }

    public function method_3412(param1: class_2120): class_2753 {
        return param1.method_3412(this) as class_2753;
    }

    override arcane function method_5880(param1: class_2580): void {
        var _loc2_: Vector3D = param1[const_338];
        if (!_loc2_) {
            throw new Error("there is no " + const_338 + " in param!");
        }
        var_2599[0] = _loc2_.x;
        var_2599[1] = _loc2_.y;
        var_2599[2] = _loc2_.z;
    }
}
}
