package package_75 {

import package_29.class_85;

import package_35.class_338;
import package_35.class_348;

public class class_1874 extends class_348 {

    public static const const_226: String = "inRange";

    public static const const_826: String = "outOfRange";


    private var var_4576: String;

    public function class_1874(param1: class_85, param2: String) {
        this.var_4576 = param2;
        super(class_338.const_314, param1);
    }

    public function get method_5174(): String {
        return this.var_4576;
    }

    override public function get method_5314(): Boolean {
        return true;
    }
}
}
