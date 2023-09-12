package package_10 {

import package_19.class_68;
import package_19.class_70;

public class class_20 {


    public const changed: class_68 = new class_70();

    public var minValue: int = -2147483648;

    public var maxValue: int = 2147483647;

    private var _value: int = 0;

    public function class_20(param1: int = 0, param2: int = -2147483648, param3: int = 2147483647) {
        super();
        this.minValue = param2;
        this.maxValue = param3;
        this.value = param1;
    }

    public function get value(): int {
        return this._value;
    }

    public function set value(param1: int): void {
        param1 = Math.max(this.minValue, Math.min(param1, this.maxValue));
        if (this._value != param1) {
            this._value = param1;
            this.changed.dispatch();
        }
    }
}
}
