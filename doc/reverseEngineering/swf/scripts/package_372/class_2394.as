package package_372 {

import package_364.DirectionalLight;

import package_376.class_2144;

public class class_2394 extends class_2225 {


    private var _light: DirectionalLight;

    public function class_2394(param1: DirectionalLight) {
        super(param1);
        this._light = param1;
    }

    public function get light(): DirectionalLight {
        return this._light;
    }

    override public function method_2995(param1: class_2144): void {
        if (param1.method_4368(this)) {
            super.method_2995(param1);
            param1.method_2048(this._light);
        }
    }
}
}
