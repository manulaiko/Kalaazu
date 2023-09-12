package net.bigpoint.darkorbit.net {

import flash.utils.Dictionary;

import net.bigpoint.darkorbit.class_9;

import package_38.class_238;

public class class_110 {


    private var var_139: Dictionary;

    private var main: class_9;

    public function class_110() {
        super();
        this.method_709();
    }

    private static function method_336(): void {
    }

    private function method_709(): void {
        this.var_139 = new Dictionary();
        this.var_139[class_74.const_2162] = this.method_2222;
        this.var_139[class_74.const_1463] = this.method_3002;
        this.var_139[class_74.const_3039] = this.method_6311;
        this.var_139[class_74.const_2318] = this.method_1394;
        this.var_139[class_74.const_2561] = this.method_5439;
        this.var_139[class_74.const_1479] = this.method_6193;
    }

    public function method_6193(param1: int): void {
        this.main.method_2732().method_1676(param1);
    }

    public function method_5439(param1: int): void {
        this.main.method_2732().method_1351(param1);
    }

    public function method_1394(param1: int): void {
        this.main.method_2732().method_1881(param1);
    }

    public function method_6311(param1: int): void {
        this.main.method_2732().method_2106(param1);
    }

    public function method_3002(param1: int, param2: int, param3: int, param4: Boolean, param5: Boolean): void {
        this.main.method_2732().method_2655(param1, param2, param3, param5, param4);
    }

    private function method_2222(param1: Array): void {
        var _loc2_: * = null;
        _loc2_ = param1[3];
    }

    public function method_3154(param1: class_238): void {
        this.main.method_2732().method_5490(param1);
    }

    public function method_5080(param1: Array): void {
        var _loc2_: String = param1[2];
        if (this.var_139[_loc2_] != null) {
            this.var_139[_loc2_](param1);
        }
    }

    public function method_3489(param1: class_9): void {
        if (this.main == null) {
            this.main = param1;
        }
    }
}
}
