package package_483 {

import package_437.class_2592;

import package_438.class_2421;

import package_465.class_2594;

import package_466.class_2595;
import package_466.class_2598;

import package_493.class_2735;

public class FourDCompositeWithOneDValueSubParser extends class_2421 {


    private var var_1020: class_2421;

    private var var_1999: class_2421;

    private var var_1217: class_2421;

    private var var_2211: class_2421;

    public function FourDCompositeWithOneDValueSubParser(param1: String) {
        super(param1, const_1615);
    }

    public static function get identifier(): * {
        return class_2598.FourDCompositeWithOneDValueSubParser;
    }

    override protected function method_196(): Boolean {
        var _loc1_: * = null;
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        if (var_117) {
            _loc1_ = _data.x;
            if (_loc1_) {
                _loc2_ = _loc1_.id;
                _loc3_ = _loc1_.data;
                if (!(_loc4_ = class_2592.method_6525(_loc2_, class_2595.const_2681))) {
                    method_444("Unknown value");
                }
                this.var_1020 = new _loc4_(null);
                method_4558(this.var_1020);
                this.var_1020.method_5169(_loc3_);
            }
            _loc1_ = _data.y;
            if (_loc1_) {
                _loc2_ = _loc1_.id;
                _loc3_ = _loc1_.data;
                if (!(_loc4_ = class_2592.method_6525(_loc2_, class_2595.const_2681))) {
                    method_444("Unknown value");
                }
                this.var_1999 = new _loc4_(null);
                method_4558(this.var_1999);
                this.var_1999.method_5169(_loc3_);
            }
            _loc1_ = _data.z;
            if (_loc1_) {
                _loc2_ = _loc1_.id;
                _loc3_ = _loc1_.data;
                if (!(_loc4_ = class_2592.method_6525(_loc2_, class_2595.const_2681))) {
                    method_444("Unknown value");
                }
                this.var_1217 = new _loc4_(null);
                method_4558(this.var_1217);
                this.var_1217.method_5169(_loc3_);
            }
            _loc1_ = _data.w;
            if (_loc1_) {
                _loc2_ = _loc1_.id;
                _loc3_ = _loc1_.data;
                if (!(_loc4_ = class_2592.method_6525(_loc2_, class_2595.const_2681))) {
                    method_444("Unknown value");
                }
                this.var_2211 = new _loc4_(null);
                method_4558(this.var_2211);
                this.var_2211.method_5169(_loc3_);
            }
        }
        if (super.method_196() == const_2361) {
            this.method_383();
            return const_2361;
        }
        return const_2971;
    }

    private function method_383(): void {
        var _loc1_: class_2594 = !!this.var_1020 ? this.var_1020.setter : null;
        var _loc2_: class_2594 = !!this.var_1999 ? this.var_1999.setter : null;
        var _loc3_: class_2594 = !!this.var_1217 ? this.var_1217.setter : null;
        var _loc4_: class_2594 = !!this.var_2211 ? this.var_2211.setter : null;
        if ((!this.var_1020 || this.var_1020.method_5046 == const_376) && (!this.var_1999 || this.var_1999.method_5046 == const_376) && (!this.var_1217 || this.var_1217.method_5046 == const_376) && (!this.var_2211 || this.var_2211.method_5046 == const_376)) {
            var_3843 = const_376;
        } else {
            var_3843 = const_1615;
        }
        var_4689 = new class_2735(var_78, _loc1_, _loc2_, _loc3_, _loc4_);
    }
}
}
