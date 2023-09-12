package package_124 {

import org.puremvc.as3.multicore.interfaces.INotification;

import package_22.class_198;
import package_22.class_222;

import package_29.class_85;

import package_36.class_184;

import package_38.class_452;

import package_75.class_1797;

import package_84.class_243;

public class class_1300 extends class_243 {


    public function class_1300() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: * = null;
        var _loc5_: * = null;
        var _loc8_: * = null;
        super.execute(param1);
        _loc2_ = param1.getBody() as class_452;
        var _loc3_: class_85 = map.method_327(_loc2_.var_4266);
        var _loc4_: Vector.<class_85> = new Vector.<class_85>(0);
        var _loc6_: int = int(_loc2_.var_21.length);
        var _loc7_: int = 0;
        while (_loc7_ < _loc6_) {
            if (_loc5_ = map.method_327(_loc2_.var_21[_loc7_])) {
                _loc4_.push(_loc5_);
            }
            _loc7_++;
        }
        switch (_loc2_.var_4050) {
            case class_452.const_1769:
                _loc6_ = _loc4_.length;
                _loc7_ = 0;
                while (_loc7_ < _loc6_) {
                    map.effects.method_5565(new class_1797(_loc4_[_loc7_]));
                    _loc7_++;
                }
                break;
            case class_452.const_86:
                _loc6_ = _loc4_.length;
                _loc8_ = class_198.method_1020(3, 2);
                _loc7_ = 0;
                while (_loc7_ < _loc6_) {
                    map.effects.method_5084(new class_184(_loc4_[_loc7_].x, _loc4_[_loc7_].y, _loc4_[_loc7_].z, _loc8_));
                    _loc7_++;
                }
        }
    }
}
}
