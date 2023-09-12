package package_431 {

import away3d.animators.class_2579;
import away3d.arcane;

import flash.geom.ColorTransform;

import package_309.class_1774;

import package_385.class_2251;

import package_386.class_2238;
import package_386.class_2578;
import package_386.class_2580;

import package_430.class_2652;

public class class_2651 extends class_2406 {

    arcane static const const_160: uint = 0;

    arcane static const const_862: uint = 1;

    public static const const_1047: String = "ColorInitialColorTransform";


    arcane var var_291: Boolean;

    arcane var var_456: Boolean;

    arcane var var_1860: ColorTransform;

    public function class_2651(param1: uint, param2: Boolean = true, param3: Boolean = false, param4: ColorTransform = null) {
        var_4797 = class_2652;
        this.arcane::var_291 = param2;
        this.arcane::var_456 = param3;
        this.arcane::var_1860 = param4 || new ColorTransform();
        super("ParticleInitialColor", param1, Boolean(this.arcane::var_291) && Boolean(this.arcane::var_456) ? 8 : 4, class_2579.const_717);
    }

    override public function method_2174(param1: class_1774, param2: class_2238): String {
        var _loc4_: * = null;
        var _loc5_: * = null;
        param1 = param1;
        var _loc3_: String = "";
        if (param2.name_132) {
            if (this.arcane::var_291) {
                _loc4_ = _mode == class_2578.name_100 ? param2.method_5384() : param2.method_723();
                param2.method_5487(this, arcane::const_160, _loc4_.index);
                _loc3_ += "mul " + param2.var_1404 + "," + _loc4_ + "," + param2.var_1404 + "\n";
            }
            if (this.arcane::var_456) {
                _loc5_ = _mode == class_2578.name_24 ? param2.method_723() : param2.method_5384();
                param2.method_5487(this, arcane::const_862, _loc5_.index);
                _loc3_ += "add " + param2.var_3848 + "," + _loc5_ + "," + param2.var_3848 + "\n";
            }
        }
        return _loc3_;
    }

    override arcane function method_2127(param1: class_2579): void {
        if (this.arcane::var_291) {
            param1.var_3056 = true;
        }
        if (this.arcane::var_456) {
            param1.var_3262 = true;
        }
    }

    override arcane function method_5880(param1: class_2580): void {
        var _loc3_: Number = 0;
        var _loc2_: ColorTransform = param1[const_1047];
        if (!_loc2_) {
            throw new Error("there is no " + const_1047 + " in param!");
        }
        if (this.arcane::var_291) {
            var _loc4_: *;
            var_2599[_loc4_ = _loc3_++] = _loc2_.redMultiplier;
            var _loc5_: *;
            var_2599[_loc5_ = _loc3_++] = _loc2_.greenMultiplier;
            var _loc6_: *;
            var_2599[_loc6_ = _loc3_++] = _loc2_.blueMultiplier;
            var _loc7_: *;
            var_2599[_loc7_ = _loc3_++] = _loc2_.alphaMultiplier;
        }
        if (this.arcane::var_456) {
            var_2599[_loc4_ = _loc3_++] = _loc2_.redOffset / 255;
            var_2599[_loc5_ = _loc3_++] = _loc2_.greenOffset / 255;
            var_2599[_loc6_ = _loc3_++] = _loc2_.blueOffset / 255;
            var_2599[_loc7_ = _loc3_++] = _loc2_.alphaOffset / 255;
        }
    }
}
}
