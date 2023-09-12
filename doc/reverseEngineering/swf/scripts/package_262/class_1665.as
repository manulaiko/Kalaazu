package package_262 {

import package_33.class_93;

import package_46.class_131;

import package_83.class_1926;

public class class_1665 {


    private var var_2031: class_1928;

    private var var_1127: class_1928;

    private var var_4408: class_1929;

    private var var_2366: class_1930;

    private var var_841: class_131;

    public function class_1665(param1: class_131) {
        super();
        this.var_841 = param1;
        this.decorate(param1);
    }

    private function decorate(param1: class_131): void {
        this.method_2052(param1);
    }

    private function method_2052(param1: class_131): void {
        var _loc10_: * = null;
        var _loc2_: class_93 = param1.method_3694(0);
        var _loc3_: class_93 = param1.method_3694(1);
        var _loc4_: class_93 = param1.method_3694(2);
        var _loc5_: class_93 = param1.method_3694(3);
        this.var_2031 = new class_1928(_loc2_);
        this.var_1127 = new class_1928(_loc3_);
        this.var_2366 = new class_1930(_loc4_);
        this.var_4408 = new class_1929(_loc5_);
        var _loc6_: Vector.<class_93>;
        (_loc6_ = new Vector.<class_93>()).unshift(_loc2_, _loc3_, _loc4_, _loc5_);
        var _loc7_: int = _loc6_.length;
        var _loc8_: int = int(class_1926.const_2702.x);
        var _loc9_: int = int(class_1926.const_2702.y);
        var _loc11_: int = 0;
        while (_loc11_ < _loc7_) {
            (_loc10_ = _loc6_[_loc11_]).x = _loc8_;
            _loc10_.y = _loc9_;
            _loc9_ += _loc10_.height;
            _loc11_++;
        }
    }

    public function get method_5081(): class_1928 {
        return this.var_2031;
    }

    public function get method_606(): class_1928 {
        return this.var_1127;
    }

    public function get method_1434(): class_1929 {
        return this.var_4408;
    }

    public function get method_1371(): class_1930 {
        return this.var_2366;
    }

    public function get window(): class_131 {
        return this.var_841;
    }
}
}
