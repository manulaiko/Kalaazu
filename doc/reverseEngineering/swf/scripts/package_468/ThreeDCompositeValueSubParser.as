package package_468 {

import package_437.class_2592;

import package_438.class_2421;

import package_466.class_2595;
import package_466.class_2598;

import package_484.class_2732;

public class ThreeDCompositeValueSubParser extends class_2421 {


    private var var_1020: class_2421;

    private var var_1999: class_2421;

    private var var_1217: class_2421;

    private var var_959: Boolean;

    public function ThreeDCompositeValueSubParser(param1: String) {
        super(param1, const_1615);
    }

    public static function get identifier(): * {
        return class_2598.ThreeDCompositeValueSubParser;
    }

    override protected function method_196(): Boolean {
        var _loc1_: * = null;
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        if (var_117) {
            this.var_959 = _data.isometric;
            _loc1_ = _data.x;
            _loc2_ = _loc1_.id;
            _loc3_ = _loc1_.data;
            if (!(_loc4_ = class_2592.method_6525(_loc2_, class_2595.const_2681))) {
                method_444("Unknown value");
            }
            this.var_1020 = new _loc4_(null);
            method_4558(this.var_1020);
            this.var_1020.method_5169(_loc3_);
            _loc1_ = _data.y;
            _loc2_ = _loc1_.id;
            _loc3_ = _loc1_.data;
            if (!(_loc4_ = class_2592.method_6525(_loc2_, class_2595.const_2681))) {
                method_444("Unknown value");
            }
            this.var_1999 = new _loc4_(null);
            method_4558(this.var_1999);
            this.var_1999.method_5169(_loc3_);
            _loc1_ = _data.z;
            _loc2_ = _loc1_.id;
            _loc3_ = _loc1_.data;
            if (!(_loc4_ = class_2592.method_6525(_loc2_, class_2595.const_2681))) {
                method_444("Unknown value");
            }
            this.var_1217 = new _loc4_(null);
            method_4558(this.var_1217);
            this.var_1217.method_5169(_loc3_);
        }
        if (super.method_196() == const_2361) {
            this.method_383();
            return const_2361;
        }
        return const_2971;
    }

    private function method_383(): void {
        if (this.var_1020.method_5046 == const_376 && (Boolean(this.var_959) || this.var_1999.method_5046 == const_376 && this.var_1217.method_5046 == const_376)) {
            var_3843 = const_376;
        }
        var_4689 = new class_2732(var_78, this.var_1020.setter, this.var_1999.setter, this.var_1217.setter, this.var_959);
    }
}
}
