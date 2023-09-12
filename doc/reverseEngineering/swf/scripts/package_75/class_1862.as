package package_75 {

import package_29.class_85;

import package_35.class_338;
import package_35.class_348;

public class class_1862 extends class_348 {

    public static const NORMAL: String = "normal";

    public static const const_1782: String = "emperor";


    private var var_4396: class_85;

    private var var_1650: String;

    public function class_1862(param1: class_85, param2: class_85, param3: String) {
        super(class_338.const_920, param2, const_2311);
        this.var_4396 = param1;
        this.var_1650 = param3;
    }

    public function get method_4766(): String {
        return this.var_1650;
    }

    public function get method_4676(): class_85 {
        return this.var_4396;
    }

    public function get method_5963(): class_85 {
        return source;
    }
}
}
