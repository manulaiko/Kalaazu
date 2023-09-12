package package_429 {

import away3d.arcane;

import package_305.class_1767;

public class NearDirectionalShadowMapper extends DirectionalShadowMapper {


    private var var_4052: Number;

    public function NearDirectionalShadowMapper(param1: Number = 0.5) {
        super();
        this.method_1334 = param1;
    }

    public function get method_1334(): Number {
        return this.var_4052;
    }

    public function set method_1334(param1: Number): void {
        if (param1 > 1) {
            param1 = 1;
        } else if (param1 < 0) {
            param1 = 0;
        }
        this.var_4052 = param1;
    }

    override protected function method_873(param1: class_1767): void {
        var _loc4_: Number = NaN;
        var _loc2_: Vector.<Number> = param1.lens.method_2727;
        var _loc3_: int = 0;
        while (_loc3_ < 12) {
            _loc4_ = _loc2_[_loc3_];
            var_4534[_loc3_] = _loc4_;
            var_4534[uint(_loc3_ + 12)] = _loc4_ + (_loc2_[uint(_loc3_ + 12)] - _loc4_) * Number(this.var_4052);
            _loc3_++;
        }
        method_5949(param1, var_4534, _matrix);
        var_1025.matrix = _matrix;
    }
}
}
