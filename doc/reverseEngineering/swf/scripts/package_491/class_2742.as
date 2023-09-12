package package_491 {

import flash.geom.ColorTransform;

import package_386.class_2580;

import package_465.class_2594;

public class class_2742 extends class_2594 {


    private var _color: ColorTransform;

    public function class_2742(param1: String, param2: ColorTransform) {
        super(param1);
        this._color = param2;
    }

    override public function method_1777(param1: class_2580): void {
        param1[var_78] = this._color;
    }

    override public function generateOneValue(param1: int = 0, param2: int = 1): * {
        return this._color;
    }
}
}
