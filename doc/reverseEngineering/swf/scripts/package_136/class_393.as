package package_136 {

import package_29.class_85;

import package_35.class_348;

public class class_393 extends class_348 {


    private var _target: class_85;

    private var _color: uint = 0;

    public function class_393(param1: int, param2: class_85, param3: class_85, param4: int, param5: uint, param6: Number = -1) {
        super(param1, param2, const_2856, null, param6);
        this._target = param3;
        method_2711 = param4;
        this._color = param5;
    }

    public function get target(): class_85 {
        return this._target;
    }

    public function get color(): uint {
        return this._color;
    }

    override public function isValid(): Boolean {
        return super.isValid() && this._target != null;
    }
}
}
