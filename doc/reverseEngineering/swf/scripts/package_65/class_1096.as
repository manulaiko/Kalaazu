package package_65 {

import flash.utils.Dictionary;

import package_38.class_861;

public class class_1096 {

    public static const const_1484: int = -1;


    private var var_509: Dictionary;

    public function class_1096() {
        this.var_509 = new Dictionary();
        super();
    }

    public function init(param1: Vector.<class_861>): void {
        this.var_509 = new Dictionary();
        this.method_5027(param1);
    }

    public function method_5027(param1: Vector.<class_861>): void {
        var _loc2_: * = null;
        for each(_loc2_ in param1) {
            this.setType(_loc2_.type);
        }
    }

    public function setType(param1: int, param2: Boolean = true): void {
        this.var_509[param1] = param2;
    }

    public function method_6399(param1: int): Boolean {
        return Boolean(this.var_509[param1]);
    }
}
}
