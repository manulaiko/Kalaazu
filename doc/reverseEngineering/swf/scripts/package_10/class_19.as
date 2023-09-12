package package_10 {

import package_19.class_68;
import package_19.class_70;

public class class_19 {


    public const changed: class_68 = new class_70();

    private var _value: Boolean = false;

    public function class_19(param1: Boolean = false) {
        super();
        this._value = param1;
    }

    public function get value(): Boolean {
        return this._value;
    }

    public function set value(param1: Boolean): void {
        if (this._value != param1) {
            this._value = param1;
            this.changed.dispatch();
        }
    }
}
}
