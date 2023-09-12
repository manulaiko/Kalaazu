package package_484 {

import flash.geom.Vector3D;

import package_386.class_2580;

import package_465.class_2594;

public class class_2694 extends class_2594 {


    private var _value: Vector3D;

    public function class_2694(param1: String, param2: Vector3D) {
        super(param1);
        this._value = param2;
    }

    override public function method_1777(param1: class_2580): void {
        param1[var_78] = this._value;
    }

    override public function generateOneValue(param1: int = 0, param2: int = 1): * {
        return this._value;
    }
}
}
