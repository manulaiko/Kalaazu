package package_482 {

import package_437.class_2592;

import package_438.class_2421;

import package_465.class_2594;

import package_466.class_2595;
import package_466.class_2598;

import package_492.class_2734;

public class Matrix3DCompositeValueSubParser extends class_2421 {


    private var var_303: Vector.<class_2421>;

    public function Matrix3DCompositeValueSubParser(param1: String) {
        this.var_303 = new Vector.<class_2421>();
        super(param1, const_1615);
    }

    public static function get identifier(): * {
        return class_2598.Matrix3DCompositeValueSubParser;
    }

    override protected function method_196(): Boolean {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        if (var_117) {
            _loc6_ = _data.transforms;
            for each(_loc7_ in _loc6_) {
                _loc3_ = (_loc5_ = _loc7_.data).data;
                _loc2_ = _loc5_.id;
                if (!(_loc4_ = class_2592.method_6525(_loc2_, class_2595.const_972))) {
                    method_444("Unknown value parser");
                }
                _loc8_ = new _loc4_(_loc7_.type);
                method_4558(_loc8_);
                _loc8_.method_5169(_loc3_);
                this.var_303.push(_loc8_);
            }
        }
        if (super.method_196() == const_2361) {
            this.method_383();
            return const_2361;
        }
        return const_2971;
    }

    private function method_383(): void {
        var _loc2_: int = 0;
        var _loc1_: Vector.<class_2594> = new Vector.<class_2594>();
        while (_loc2_ < this.var_303.length) {
            _loc1_.push(this.var_303[_loc2_].setter);
            _loc2_++;
        }
        var_4689 = new class_2734(var_78, _loc1_);
    }
}
}
