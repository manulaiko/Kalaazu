package package_107 {

import flash.utils.Dictionary;
import flash.utils.getQualifiedClassName;

public class class_2549 {


    public function class_2549() {
        super();
    }

    public static function method_1096(param1: Boolean, param2: String = ""): void {
        if (!param1) {
            if (param2 == null || param2.length == 0) {
                param2 = "[Assertion failed] - this expression must be true";
            }
            throw new class_1151(param2);
        }
    }

    public static function method_5047(param1: Object, param2: Class, param3: String = ""): void {
        var _loc4_: String = getQualifiedClassName(param1);
        var _loc5_: String = getQualifiedClassName(param2);
        if (_loc4_ == _loc5_) {
            if (param3 == null || param3.length == 0) {
                param3 = "[Assertion failed] - instance is an instance of an abstract class";
            }
            throw new class_1151(param3);
        }
    }

    public static function method_2478(param1: Object, param2: String = ""): void {
        if (param1 == null) {
            if (param2 == null || param2.length == 0) {
                param2 = "[Assertion failed] - this argument is required; it must not null";
            }
            throw new class_1151(param2);
        }
    }

    public static function method_1620(param1: *, param2: Class, param3: String = ""): void {
        if (!(param1 is param2)) {
            if (param3 == null || param3.length == 0) {
                param3 = "[Assertion failed] - this argument is not of type \'" + param2 + "\'";
            }
            throw new class_1151(param3);
        }
    }

    public static function method_5333(param1: Class, param2: Class, param3: String = ""): void {
        if (!ClassUtils.method_5726(param1, param2)) {
            if (param3 == null || param3.length == 0) {
                param3 = "[Assertion failed] - this argument is not a subclass of \'" + param2 + "\'";
            }
            throw new class_1151(param3);
        }
    }

    public static function method_5400(param1: *, param2: Class, param3: String = ""): void {
        if (!ClassUtils.method_3458(ClassUtils.method_541(param1), param2)) {
            if (param3 == null || param3.length == 0) {
                param3 = "[Assertion failed] - this argument does not implement the interface \'" + param2 + "\'";
            }
            throw new class_1151(param3);
        }
    }

    public static function state(param1: Boolean, param2: String = ""): void {
        if (!param1) {
            if (param2 == null || param2.length == 0) {
                param2 = "[Assertion failed] - this state invariant must be true";
            }
            throw new class_2682(param2);
        }
    }

    public static function method_4582(param1: String, param2: String = ""): void {
        if (class_294.method_539(param1)) {
            if (param2 == null || param2.length == 0) {
                param2 = "[Assertion failed] - this String argument must have text; it must not be <code>null</code>, empty, or blank";
            }
            throw new class_1151(param2);
        }
    }

    public static function method_2564(param1: Dictionary, param2: Class, param3: String = ""): void {
        var _loc4_: * = null;
        for (_loc4_ in param1) {
            if (!(_loc4_ is param2)) {
                if (param3 == null || param3.length == 0) {
                    param3 = "[Assertion failed] - this Dictionary argument must have keys of type \'" + param2 + "\'";
                }
                throw new class_1151(param3);
            }
        }
    }

    public static function method_5505(param1: Array, param2: *, param3: String = ""): void {
        if (param1.indexOf(param2) == -1) {
            if (param3 == null || param3.length == 0) {
                param3 = "[Assertion failed] - this Array argument does not contain the item \'" + param2 + "\'";
            }
            throw new class_1151(param3);
        }
    }

    public static function method_3801(param1: Array, param2: Class, param3: String = ""): void {
        var _loc4_: * = undefined;
        for each(_loc4_ in param1) {
            if (!(_loc4_ is param2)) {
                if (param3 == null || param3.length == 0) {
                    param3 = "[Assertion failed] - this Array must have items of type \'" + param2 + "\'";
                }
                throw new class_1151(param3);
            }
        }
    }
}
}
