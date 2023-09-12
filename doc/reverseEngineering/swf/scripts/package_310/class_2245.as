package package_310 {

import away3d.arcane;

import package_293.class_1751;
import package_293.class_2131;

import package_364.class_2102;

import package_374.AbstractMethodError;

import package_385.class_2237;
import package_385.class_2251;

import package_429.class_2393;

public class class_2245 extends class_1779 implements class_1751 {


    protected var var_1527: class_2102;

    protected var var_2517: class_2393;

    protected var var_5040: Number = 0.02;

    protected var _alpha: Number = 1;

    public function class_2245(param1: class_2102) {
        super();
        this.var_1527 = param1;
        param1.method_825 = true;
        this.var_2517 = param1.method_493;
    }

    public function get assetType(): String {
        return class_2131.const_3103;
    }

    public function get alpha(): Number {
        return this._alpha;
    }

    public function set alpha(param1: Number): void {
        this._alpha = param1;
    }

    public function get method_5833(): class_2102 {
        return this.var_1527;
    }

    public function get epsilon(): Number {
        return this.var_5040;
    }

    public function set epsilon(param1: Number): void {
        this.var_5040 = param1;
    }

    arcane function getFragmentCode(param1: class_2252, param2: class_2237, param3: class_2251): String {
        throw new AbstractMethodError();
    }
}
}
