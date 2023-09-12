package package_431 {

import away3d.animators.class_2120;
import away3d.arcane;

import flash.geom.Vector3D;

import package_309.class_1774;

import package_385.class_2251;

import package_386.class_2238;
import package_386.class_2578;
import package_386.class_2580;

import package_430.class_2750;

public class class_2728 extends class_2406 {

    arcane static const const_515: uint = 0;

    public static const const_1748: String = "PositionVector3D";


    arcane var _position: Vector3D;

    public function class_2728(param1: uint, param2: Vector3D = null) {
        super("ParticlePosition", param1, 3);
        var_4797 = class_2750;
        this.arcane::_position = param2 || new Vector3D();
    }

    override public function method_2174(param1: class_1774, param2: class_2238): String {
        param1 = param1;
        var _loc3_: class_2251 = _mode == class_2578.name_100 ? param2.method_5384() : param2.method_723();
        param2.method_5487(this, arcane::const_515, _loc3_.index);
        return "add " + param2.var_1532 + ".xyz," + _loc3_ + ".xyz," + param2.var_1532 + ".xyz\n";
    }

    public function method_3412(param1: class_2120): class_2750 {
        return param1.method_3412(this) as class_2750;
    }

    override arcane function method_5880(param1: class_2580): void {
        var _loc2_: Vector3D = param1[const_1748];
        if (!_loc2_) {
            throw new Error("there is no " + const_1748 + " in param!");
        }
        var_2599[0] = _loc2_.x;
        var_2599[1] = _loc2_.y;
        var_2599[2] = _loc2_.z;
    }
}
}
