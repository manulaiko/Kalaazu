package package_212 {

import flash.utils.Dictionary;

import package_185.class_1113;

import package_260.class_1659;

import package_38.class_467;
import package_38.class_468;
import package_38.class_477;
import package_38.class_513;
import package_38.class_565;
import package_38.class_817;
import package_38.class_882;
import package_38.class_889;
import package_38.class_929;
import package_38.class_930;

import package_84.class_243;

public class class_1240 extends class_243 {


    public function class_1240() {
        super();
        this.method_262();
    }

    protected function method_262(): void {
        throw new Error("Tried to instatiate abstract Command! [object class_1240]");
    }

    protected function method_4097(param1: Vector.<class_929>): Vector.<class_1659> {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = 0;
        var _loc2_: Vector.<class_1659> = new Vector.<class_1659>();
        for each(_loc3_ in param1) {
            _loc5_ = retrieveProxy(class_1113.NAME) as class_1113;
            if (_loc3_.var_1274) {
                if ((_loc6_ = uint(_loc3_.var_1274.name_128)) == 0) {
                    if (_loc3_.var_4897) {
                        _loc6_ = uint(_loc3_.var_4897.name_128);
                    }
                }
            }
            if (_loc6_ > 0) {
                _loc4_ = _loc5_.method_1909(_loc6_);
            }
            if (_loc4_ == null) {
                _loc4_ = new class_1659();
            }
            if (Boolean(_loc3_.var_1274) && _loc3_.var_1274.name_128 != 0) {
                this.method_1930(_loc4_, _loc3_);
            }
            if (Boolean(_loc3_.var_4897) && _loc3_.var_4897.name_128 != 0) {
                this.method_2744(_loc4_, _loc3_);
            }
            _loc4_.method_1438();
            _loc2_.push(_loc4_);
        }
        return _loc2_;
    }

    private function method_2744(param1: class_1659, param2: class_929): void {
        var _loc4_: * = null;
        var _loc5_: * = null;
        param1.userID = param2.var_4897.name_128;
        param1.method_1934 = false;
        param1.method_1281();
        var _loc3_: Dictionary = new Dictionary();
        _loc3_[class_882.const_3049] = this.method_1415;
        _loc3_[class_882.const_321] = this.method_2542;
        _loc3_[class_882.const_2607] = this.method_2198;
        _loc3_[class_882.const_2050] = this.method_1323;
        _loc3_[class_882.const_612] = this.method_2909;
        _loc3_[class_882.const_1246] = this.method_5975;
        for each(_loc4_ in param2.var_4897.var_2332) {
            if ((_loc5_ = _loc3_[_loc4_.var_2931]) != null) {
                _loc5_(param1);
            }
        }
    }

    protected function method_1415(param1: class_1659): void {
        param1.method_2938(class_1659.const_1517);
    }

    protected function method_2542(param1: class_1659): void {
        param1.method_1934 = true;
    }

    protected function method_2198(param1: class_1659): void {
        param1.method_2938(class_1659.const_2640);
    }

    protected function method_1323(param1: class_1659): void {
        param1.method_2938(class_1659.const_1891);
    }

    protected function method_2909(param1: class_1659): void {
        param1.method_2938(class_1659.const_650);
    }

    protected function method_5975(param1: class_1659): void {
        param1.method_2938(class_1659.const_698);
    }

    private function method_1930(param1: class_1659, param2: class_929): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = 0;
        param1.userID = param2.var_1274.name_128;
        for each(_loc3_ in param2.var_1274.attributes) {
            switch (_loc3_.method_1330()) {
                case class_513.ID:
                    param1.name_148 = (_loc3_ as class_513).var_3438;
                    break;
                case class_889.ID:
                    param1.name_81 = (_loc3_ as class_889).name_81;
                    break;
                case class_477.ID:
                    param1.mapID = (_loc3_ as class_477).var_4654;
                    break;
                case class_565.ID:
                    param1.level = (_loc3_ as class_565).level;
                    break;
                case class_817.ID:
                    param1.name_145 = (_loc3_ as class_817).name_145;
                    break;
                case class_468.ID:
                    _loc5_ = uint((_loc4_ = (_loc3_ as class_468).name_98).type);
                    switch (_loc5_) {
                        case class_930.const_425:
                            param1.name_98 = class_1659.const_3261;
                            continue;
                        case class_930.const_1930:
                            param1.name_98 = class_1659.const_3196;
                            continue;
                        case class_930.NONE:
                            param1.name_98 = class_1659.const_861;
                            continue;
                        case class_930.const_754:
                            param1.name_98 = class_1659.const_1772;
                        default:
                            continue;
                    }
                    break;
            }
        }
    }
}
}
