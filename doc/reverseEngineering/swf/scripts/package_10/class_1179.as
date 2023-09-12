package package_10 {

import package_19.class_68;
import package_19.class_70;

public class class_1179 {


    public const changed: class_68 = new class_70();

    public var minValue: Number;

    public var maxValue: Number = 1.7976931348623157e+308;

    private var _value: Number = NaN;

    public function class_1179(param1: Number = NaN, param2: Number = -Infinity, param3: Number = Infinity) {
        this.minValue = Number.MIN_VALUE;
        super();
        this._value = param1;
        this.minValue = param2;
        this.maxValue = param3;
    }

    public function get value(): Number {
        return this._value;
    }

    public function set value(param1: Number): void {
        param1 = Math.max(this.minValue, Math.min(param1, this.maxValue));
        if (this._value != param1) {
            this._value = param1;
            this.changed.dispatch();
        }
    }
}
}
