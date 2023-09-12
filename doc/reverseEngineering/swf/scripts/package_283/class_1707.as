package package_283 {

import flash.utils.Dictionary;
import flash.utils.getQualifiedClassName;

public class class_1707 {

    public static const const_1210: String = "";

    public static const const_121: String = "";

    public static const DROP_SHADOW_FILTER: String = "";

    public static const const_3152: String = "";

    public static const const_1677: String = "";


    private var _impl: Dictionary;

    public function class_1707(param1: Class, param2: Class, param3: Class, param4: Class) {
        super();
        this._impl = new Dictionary(true);
        this.method_3794(class_1710, param1);
        this.method_3794(class_1711, param2);
        this.method_3794(class_1725, param3);
        this.method_3794(class_1714, param4);
    }

    public function method_3794(param1: Class, param2: Class): void {
        this._impl[param1] = param2;
    }

    public function build(param1: Class): Object {
        var _loc2_: Class = this._impl[param1] as Class;
        if (_loc2_) {
            return new _loc2_();
        }
        throw new Error("No implementation for " + getQualifiedClassName(param1) + " interface");
    }

    public function method_5214(): class_1710 {
        return this.build(class_1710) as class_1710;
    }

    public function method_5640(): class_1711 {
        return this.build(class_1711) as class_1711;
    }

    public function method_4760(): class_1725 {
        return this.build(class_1725) as class_1725;
    }

    public function method_3713(): class_1714 {
        return this.build(class_1714) as class_1714;
    }
}
}
