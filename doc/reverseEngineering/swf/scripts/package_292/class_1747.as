package package_292 {

import flash.utils.Dictionary;

import package_365.class_2103;

public class class_1747 {


    protected const const_2355: Dictionary = new Dictionary();

    protected var var_196: class_2103;

    public function class_1747(param1: Function = null, param2: Number = 0) {
        this.var_196 = new class_2103();
        super();
        this.var_196 = new class_2103(param2);
        if (param1 != null) {
            this.var_196.const_2704.add(param1);
        }
        this.reset(0);
    }

    public function reset(param1: uint): void {
        this.var_196.reset();
    }

    public function method_1708(param1: Object): void {
        if (param1) {
            this.var_196.method_6270(param1).method_5231();
        }
    }

    public function method_5039(param1: Object): void {
        if (param1) {
            this.var_196.method_6270(param1).method_5124();
        }
    }
}
}
