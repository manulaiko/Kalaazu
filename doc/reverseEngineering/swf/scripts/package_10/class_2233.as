package package_10 {

import package_19.class_68;
import package_19.class_70;

public class class_2233 {


    public const changed: class_68 = new class_70();

    public var minValue: uint = 0;

    public var maxValue: uint = 4294967295;

    private var _value: uint = 0;

    public function class_2233(param1: uint = 0, param2: uint = 0, param3: uint = 4294967295) {
        super();
        this._value = param1;
        this.minValue = param2;
        this.maxValue = param3;
    }

    public function get value(): uint {
        return this._value;
    }

    public function set value(param1: uint): void {
        param1 = Math.max(this.minValue, Math.min(param1, this.maxValue));
        if (this._value != param1) {
            this._value = param1;
            this.changed.dispatch();
        }
    }
}
}
