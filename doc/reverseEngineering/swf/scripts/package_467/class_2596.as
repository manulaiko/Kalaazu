package package_467 {

import away3d.arcane;

import package_307.class_1772;

import package_366.class_2108;

import package_374.AbstractMethodError;

public class class_2596 extends class_2108 {


    protected var var_1273: Boolean;

    protected var _blendMode: String = "normal";

    public function class_2596() {
        super();
    }

    override protected function method_196(): Boolean {
        if (var_117) {
            this.var_1273 = _data.bothSide;
            if (false) {
                this._blendMode = _data.blendMode;
            }
        }
        return super.method_196();
    }

    public function get material(): class_1772 {
        throw new AbstractMethodError();
    }
}
}
