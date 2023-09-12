package net.bigpoint.darkorbit.net {

import net.bigpoint.darkorbit.class_9;
import net.bigpoint.darkorbit.map.model.class_90;

import package_9.class_50;

public class class_96 {

    protected static var var_574: class_9;


    public function class_96() {
        super();
    }

    public static function method_3489(param1: class_9): void {
        var_574 = param1;
    }

    protected static function get map(): class_90 {
        return class_50.getInstance().map;
    }
}
}
