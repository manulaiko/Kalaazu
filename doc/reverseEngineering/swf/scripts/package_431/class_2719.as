package package_431 {

import away3d.animators.class_2120;
import away3d.animators.class_2579;
import away3d.arcane;

import flash.geom.Vector3D;

import package_309.class_1774;

import package_385.class_2251;

import package_386.class_2238;
import package_386.class_2578;
import package_386.class_2580;

import package_430.class_2744;

public class class_2719 extends class_2406 {

    arcane static const const_1800: uint = 0;

    arcane static const const_3227: uint = 1;

    public static const const_2470: String = "UVVector3D";


    arcane var var_219: Boolean;

    arcane var var_81: Boolean;

    arcane var var_1099: int;

    arcane var _numColumns: int;

    arcane var var_2462: int;

    arcane var var_872: Number;

    arcane var var_544: Number;

    public function class_2719(param1: uint, param2: Boolean, param3: Boolean, param4: int = 1, param5: uint = 1, param6: Number = 1, param7: Number = 0, param8: uint = 4294967295) {
        var _loc9_: int = 0;
        if (param2) {
            _loc9_ = 2;
            if (param3) {
                _loc9_++;
            }
        }
        super("ParticleSpriteSheet", param1, _loc9_, NaN);
        var_4797 = class_2744;
        this.arcane::var_219 = param2;
        this.arcane::var_81 = param3;
        this.arcane::_numColumns = param4;
        this.arcane::var_2462 = param5;
        this.arcane::var_544 = param7;
        this.arcane::var_872 = param6;
        this.arcane::var_1099 = Math.min(param8, param4 * param5);
    }

    public function get numColumns(): Number {
        return this.arcane::_numColumns;
    }

    public function get numRows(): Number {
        return this.arcane::var_2462;
    }

    public function get totalFrames(): Number {
        return this.arcane::var_1099;
    }

    override public function method_45(param1: class_1774, param2: class_2238): String {
        param1 = param1;
        var _loc3_: class_2251 = param2.method_5384();
        var _loc4_: class_2251 = _mode == class_2578.name_100 ? param2.method_5384() : param2.method_723();
        param2.method_5487(this, arcane::const_1800, _loc3_.index);
        param2.method_5487(this, arcane::const_3227, _loc4_.index);
        var _loc5_: class_2251 = new class_2251(_loc3_.method_3684, _loc3_.index, 0);
        var _loc6_: class_2251 = new class_2251(_loc3_.method_3684, _loc3_.index, 1);
        var _loc7_: class_2251 = new class_2251(_loc3_.method_3684, _loc3_.index, 2);
        var _loc8_: class_2251 = new class_2251(_loc4_.method_3684, _loc4_.index, 0);
        var _loc9_: class_2251 = new class_2251(_loc4_.method_3684, _loc4_.index, 1);
        var _loc10_: class_2251 = new class_2251(_loc4_.method_3684, _loc4_.index, 2);
        var _loc11_: class_2251 = param2.method_3118();
        var _loc12_: class_2251 = new class_2251(_loc11_.method_3684, _loc11_.index, 0);
        var _loc13_: class_2251 = new class_2251(_loc11_.method_3684, _loc11_.index, 1);
        _loc11_ = new class_2251(_loc11_.method_3684, _loc11_.index, 2);
        var _loc14_: class_2251 = new class_2251(_loc11_.method_3684, _loc11_.index, 3);
        var _loc15_: class_2251 = new class_2251(param2.var_741.method_3684, param2.var_741.index, 0);
        var _loc16_: class_2251 = new class_2251(param2.var_741.method_3684, param2.var_741.index, 1);
        var _loc17_: String = (_loc17_ = "") + ("mul " + _loc15_ + "," + _loc15_ + "," + _loc6_ + "\n");
        if (this.arcane::var_2462 > 1) {
            _loc17_ += "mul " + _loc16_ + "," + _loc16_ + "," + _loc7_ + "\n";
        }
        if (this.arcane::var_219) {
            if (this.arcane::var_81) {
                _loc17_ += "add " + _loc12_ + "," + param2.var_2838 + "," + _loc10_ + "\n";
            } else {
                _loc17_ += "mov " + _loc12_ + "," + param2.var_2838 + "\n";
            }
            _loc17_ = (_loc17_ = (_loc17_ = (_loc17_ += "div " + _loc12_ + "," + _loc12_ + "," + _loc9_ + "\n") + ("frc " + _loc12_ + "," + _loc12_ + "\n")) + ("mul " + _loc12_ + "," + _loc12_ + "," + _loc9_ + "\n")) + ("mul " + _loc11_ + "," + _loc12_ + "," + _loc8_ + "\n");
        } else {
            _loc17_ += "mul " + _loc11_.toString() + "," + param2.var_4785 + "," + _loc5_ + "\n";
        }
        if (this.arcane::var_2462 > 1) {
            _loc17_ = (_loc17_ = (_loc17_ = (_loc17_ += "frc " + _loc14_ + "," + _loc11_ + "\n") + ("sub " + _loc13_ + "," + _loc11_ + "," + _loc14_ + "\n")) + ("mul " + _loc13_ + "," + _loc13_ + "," + _loc7_ + "\n")) + ("add " + _loc16_ + "," + _loc16_ + "," + _loc13_ + "\n");
        }
        _loc17_ = (_loc17_ = (_loc17_ = (_loc17_ += "div " + _loc14_ + "," + _loc11_ + "," + _loc6_ + "\n") + ("frc " + _loc11_ + "," + _loc14_ + "\n")) + ("sub " + _loc14_ + "," + _loc14_ + "," + _loc11_ + "\n")) + ("mul " + _loc11_ + "," + _loc14_ + "," + _loc6_ + "\n");
        if (this.arcane::var_2462 > 1) {
            _loc17_ += "frc " + _loc11_ + "," + _loc11_ + "\n";
        }
        return _loc17_ + ("add " + _loc15_ + "," + _loc15_ + "," + _loc11_ + "\n");
    }

    public function method_3412(param1: class_2120): class_2744 {
        return param1.method_3412(this) as class_2744;
    }

    override arcane function method_2127(param1: class_2579): void {
        param1.var_4176 = true;
    }

    override arcane function method_5880(param1: class_2580): void {
        var _loc2_: * = null;
        var _loc3_: Number = NaN;
        if (this.arcane::var_219) {
            _loc2_ = param1[const_2470];
            if (!_loc2_) {
                throw new Error("there is no " + const_2470 + " in param!");
            }
            if (_loc2_.x <= 0) {
                throw new Error("the cycle duration must be greater than zero");
            }
            _loc3_ = Number(this.arcane::var_1099) / Number(this.arcane::_numColumns);
            var_2599[0] = _loc3_ / _loc2_.x;
            var_2599[1] = _loc2_.x;
            if (this.arcane::var_81) {
                var_2599[2] = _loc2_.y;
            }
        }
    }
}
}
