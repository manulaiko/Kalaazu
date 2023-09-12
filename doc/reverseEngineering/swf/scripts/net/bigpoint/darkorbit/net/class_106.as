package net.bigpoint.darkorbit.net {

import net.bigpoint.darkorbit.class_9;

import package_38.class_361;

import package_66.class_175;

public class class_106 {


    private var main: class_9;

    public function class_106() {
        super();
    }

    public function method_3489(param1: class_9): void {
        this.main = param1;
    }

    public function method_5053(param1: Vector.<class_361>): void {
        var _loc2_: * = null;
        for each(_loc2_ in param1) {
            this.main.method_4489().method_6320.method_4040(class_175.method_517(_loc2_.var_200.var_3265), _loc2_.var_3013.var_4809.var_2008, _loc2_.var_3013.count);
        }
    }
}
}
