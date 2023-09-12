package package_375 {

import package_376.class_2145;

import package_377.class_2146;

public class class_2142 implements class_2141 {


    public function class_2142() {
        super();
    }

    public function sort(param1: class_2145): void {
        param1.method_6033 = this.method_4639(param1.method_6033);
        param1.method_51 = this.method_3160(param1.method_51);
    }

    private function method_3160(param1: class_2146): class_2146 {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        if (!param1 || !param1.next) {
            return param1;
        }
        _loc4_ = param1;
        _loc3_ = param1.next;
        while (_loc3_) {
            _loc3_ = _loc3_.next;
            if (_loc3_) {
                _loc4_ = _loc4_.next;
                _loc3_ = _loc3_.next;
            }
        }
        _loc2_ = _loc4_.next;
        _loc4_.next = null;
        param1 = this.method_3160(param1);
        _loc2_ = this.method_3160(_loc2_);
        if (!param1) {
            return _loc2_;
        }
        if (!_loc2_) {
            return param1;
        }
        while (param1 && _loc2_ && param1 != null && _loc2_ != null) {
            if (param1.var_2496 < _loc2_.var_2496) {
                _loc7_ = param1;
                param1 = param1.next;
            } else {
                _loc7_ = _loc2_;
                _loc2_ = _loc2_.next;
            }
            if (!_loc5_) {
                _loc5_ = _loc7_;
            } else {
                _loc6_.next = _loc7_;
            }
            _loc6_ = _loc7_;
        }
        if (param1) {
            _loc6_.next = param1;
        } else if (_loc2_) {
            _loc6_.next = _loc2_;
        }
        return _loc5_;
    }

    private function method_4639(param1: class_2146): class_2146 {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: int = 0;
        var _loc9_: * = 0;
        var _loc10_: * = 0;
        var _loc11_: * = 0;
        var _loc12_: * = 0;
        if (!param1 || !param1.next) {
            return param1;
        }
        _loc4_ = param1;
        _loc3_ = param1.next;
        while (_loc3_) {
            _loc3_ = _loc3_.next;
            if (_loc3_) {
                _loc4_ = _loc4_.next;
                _loc3_ = _loc3_.next;
            }
        }
        _loc2_ = _loc4_.next;
        _loc4_.next = null;
        param1 = this.method_4639(param1);
        _loc2_ = this.method_4639(_loc2_);
        if (!param1) {
            return _loc2_;
        }
        if (!_loc2_) {
            return param1;
        }
        while (param1 && _loc2_ && param1 != null && _loc2_ != null) {
            _loc9_ = uint(param1.var_1123);
            _loc10_ = uint(_loc2_.var_1123);
            if (_loc9_ == _loc10_) {
                _loc11_ = uint(param1.var_3099);
                _loc12_ = uint(_loc2_.var_3099);
                if (_loc11_ == _loc12_) {
                    if (param1.var_2496 < _loc2_.var_2496) {
                        _loc8_ = 1;
                    } else {
                        _loc8_ = -1;
                    }
                } else if (_loc11_ > _loc12_) {
                    _loc8_ = 1;
                } else {
                    _loc8_ = -1;
                }
            } else if (_loc9_ > _loc10_) {
                _loc8_ = 1;
            } else {
                _loc8_ = -1;
            }
            if (_loc8_ < 0) {
                _loc7_ = param1;
                param1 = param1.next;
            } else {
                _loc7_ = _loc2_;
                _loc2_ = _loc2_.next;
            }
            if (!_loc5_) {
                _loc5_ = _loc7_;
                _loc6_ = _loc7_;
            } else {
                _loc6_.next = _loc7_;
                _loc6_ = _loc7_;
            }
        }
        if (param1) {
            _loc6_.next = param1;
        } else if (_loc2_) {
            _loc6_.next = _loc2_;
        }
        return _loc5_;
    }
}
}
