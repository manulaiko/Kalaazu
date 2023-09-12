package package_383 {

import flash.geom.Matrix3D;
import flash.geom.Vector3D;

import package_294.class_2429;

import package_371.class_2230;
import package_371.class_2491;

import package_436.class_2489;
import package_436.class_2492;

public class class_2231 extends class_2226 {


    private var _alwaysIn: Boolean;

    private var var_3808: class_2489;

    public function class_2231(param1: Boolean = true, param2: class_2489 = null) {
        super();
        this._alwaysIn = param1;
        this.var_3808 = param2;
        _max.x = _max.y = _max.z = Number.POSITIVE_INFINITY;
        _min.x = _min.y = _min.z = !!this._alwaysIn ? 0 : Number.POSITIVE_INFINITY;
    }

    override public function clone(): class_2226 {
        return new class_2231(this._alwaysIn);
    }

    override protected function method_2569(): class_2489 {
        return this.var_3808 || new class_2492(100, 16, 12, 16777215, 0.5);
    }

    override public function method_3128(param1: Vector.<class_2230>, param2: int): Boolean {
        param1 = param1;
        param2 = param2;
        return this._alwaysIn;
    }

    override public function method_5132(param1: class_2429): void {
    }

    override public function method_5432(param1: Vector3D, param2: Number): void {
    }

    override public function method_5348(param1: Number, param2: Number, param3: Number, param4: Number, param5: Number, param6: Number): void {
    }

    override public function method_2618(param1: class_2230): int {
        param1 = param1;
        return class_2491.const_2149;
    }

    override public function method_2232(param1: class_2226, param2: Matrix3D): void {
        param2 = param2;
        this._alwaysIn = class_2231(param1)._alwaysIn;
    }
}
}
