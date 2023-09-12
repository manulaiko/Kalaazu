package package_37 {

import net.bigpoint.darkorbit.class_9;
import net.bigpoint.darkorbit.map.model.class_90;

import package_17.class_62;

import package_9.class_50;

public class class_170 {

    protected static var var_574: class_9;

    protected static var var_271: class_62;


    public function class_170() {
        super();
    }

    public static function method_3489(param1: class_9): void {
        var_574 = param1;
    }

    public static function method_2515(param1: class_62): void {
        var_271 = param1;
    }

    protected static function get map(): class_90 {
        return class_50.getInstance().map;
    }

    public static function get main(): class_9 {
        return var_574;
    }

    public function method_4738(param1: Vector.<String>): void {
    }
}
}
