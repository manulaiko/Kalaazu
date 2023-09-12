package package_431 {

import away3d.animators.class_2120;
import away3d.animators.class_2579;
import away3d.arcane;

import package_309.class_1774;

import package_385.class_2251;

import package_386.class_2238;
import package_386.class_2578;

import package_430.class_2581;

public class class_2407 extends class_2406 {

    arcane static const const_905: uint = 0;

    arcane static const const_1712: uint = 1;


    arcane var var_2896: Boolean;

    arcane var var_3361: Boolean;

    arcane var _smooth: Boolean;

    public function class_2407(param1: Boolean = true, param2: Boolean = true, param3: Boolean = false) {
        var_4797 = class_2581;
        this.arcane::var_2896 = param1;
        this.arcane::var_3361 = param2;
        this.arcane::_smooth = param3;
        super("ParticleFollow", class_2578.name_117, Boolean(this.arcane::var_2896) && Boolean(this.arcane::var_3361) ? 6 : 3, class_2579.const_1763);
    }

    override public function method_2174(param1: class_1774, param2: class_2238): String {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc9_: int = 0;
        var _loc10_: int = 0;
        var _loc11_: * = null;
        param1 = param1;
        var _loc3_: String = "";
        if (this.arcane::var_3361) {
            _loc4_ = param2.method_723();
            param2.method_5487(this, arcane::const_1712, _loc4_.index);
            _loc5_ = param2.method_3118();
            param2.method_588(_loc5_, 1);
            _loc6_ = param2.method_3118();
            param2.method_588(_loc6_, 1);
            _loc7_ = param2.method_3118();
            if (param2.var_3591) {
                param2.method_588(_loc7_, 1);
                _loc8_ = param2.method_3118();
            }
            param2.method_5694(_loc5_);
            param2.method_5694(_loc6_);
            if (param2.var_3591) {
                param2.method_5694(_loc7_);
            }
            _loc9_ = int(param2.var_3853.length);
            _loc3_ += "mov " + _loc5_ + "," + param2.var_4178 + "\n";
            _loc3_ += "mov " + _loc5_ + ".x," + param2.var_748 + "\n";
            _loc3_ += "mov " + _loc7_ + "," + param2.var_4178 + "\n";
            _loc3_ += "sin " + _loc7_ + ".y," + _loc4_ + ".x\n";
            _loc3_ += "cos " + _loc7_ + ".z," + _loc4_ + ".x\n";
            _loc3_ += "mov " + _loc6_ + ".x," + param2.var_4178 + "\n";
            _loc3_ += "mov " + _loc6_ + ".y," + _loc7_ + ".z\n";
            _loc3_ += "neg " + _loc6_ + ".z," + _loc7_ + ".y\n";
            if (param2.var_3591) {
                _loc3_ += "m33 " + _loc8_ + ".xyz," + param2.var_1532 + ".xyz," + _loc5_ + "\n";
            } else {
                _loc3_ += "m33 " + param2.var_705 + ".xyz," + param2.var_705 + ".xyz," + _loc5_ + "\n";
                _loc10_ = 0;
                while (_loc10_ < _loc9_) {
                    _loc3_ += "m33 " + param2.var_3853[_loc10_] + ".xyz," + param2.var_3853[_loc10_] + "," + _loc5_ + "\n";
                    _loc10_++;
                }
            }
            _loc3_ += "mov " + _loc5_ + "," + param2.var_4178 + "\n";
            _loc3_ += "cos " + _loc5_ + ".x," + _loc4_ + ".y\n";
            _loc3_ += "sin " + _loc5_ + ".z," + _loc4_ + ".y\n";
            _loc3_ += "mov " + _loc6_ + "," + param2.var_4178 + "\n";
            _loc3_ += "mov " + _loc6_ + ".y," + param2.var_748 + "\n";
            _loc3_ += "mov " + _loc7_ + "," + param2.var_4178 + "\n";
            _loc3_ += "neg " + _loc7_ + ".x," + _loc5_ + ".z\n";
            _loc3_ += "mov " + _loc7_ + ".z," + _loc5_ + ".x\n";
            if (param2.var_3591) {
                _loc3_ += "m33 " + _loc8_ + ".xyz," + _loc8_ + ".xyz," + _loc5_ + "\n";
            } else {
                _loc3_ += "m33 " + param2.var_705 + ".xyz," + param2.var_705 + ".xyz," + _loc5_ + "\n";
                _loc10_ = 0;
                while (_loc10_ < _loc9_) {
                    _loc3_ += "m33 " + param2.var_3853[_loc10_] + ".xyz," + param2.var_3853[_loc10_] + "," + _loc5_ + "\n";
                    _loc10_++;
                }
            }
            _loc3_ += "mov " + _loc6_ + "," + param2.var_4178 + "\n";
            _loc3_ += "sin " + _loc6_ + ".x," + _loc4_ + ".z\n";
            _loc3_ += "cos " + _loc6_ + ".y," + _loc4_ + ".z\n";
            _loc3_ += "mov " + _loc5_ + "," + param2.var_4178 + "\n";
            _loc3_ += "mov " + _loc5_ + ".x," + _loc6_ + ".y\n";
            _loc3_ += "neg " + _loc5_ + ".y," + _loc6_ + ".x\n";
            _loc3_ += "mov " + _loc7_ + "," + param2.var_4178 + "\n";
            _loc3_ += "mov " + _loc7_ + ".z," + param2.var_748 + "\n";
            if (param2.var_3591) {
                _loc3_ += "m33 " + _loc8_ + ".xyz," + _loc8_ + ".xyz," + _loc5_ + "\n";
                _loc3_ += "sub " + _loc8_ + ".xyz," + _loc8_ + ".xyz," + param2.var_1532 + ".xyz\n";
                _loc3_ += "add " + param2.var_705 + ".xyz," + _loc8_ + ".xyz," + param2.var_705 + ".xyz\n";
            } else {
                _loc3_ += "m33 " + param2.var_705 + ".xyz," + param2.var_705 + ".xyz," + _loc5_ + "\n";
                _loc10_ = 0;
                while (_loc10_ < _loc9_) {
                    _loc3_ += "m33 " + param2.var_3853[_loc10_] + ".xyz," + param2.var_3853[_loc10_] + "," + _loc5_ + "\n";
                    _loc10_++;
                }
            }
        }
        if (this.arcane::var_2896) {
            _loc11_ = param2.method_723();
            param2.method_5487(this, arcane::const_905, _loc11_.index);
            _loc3_ += "add " + param2.var_705 + ".xyz," + _loc11_ + "," + param2.var_705 + ".xyz\n";
        }
        return _loc3_;
    }

    public function method_3412(param1: class_2120): class_2581 {
        return param1.method_3412(this) as class_2581;
    }
}
}
