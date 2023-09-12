package package_75 {

import net.bigpoint.darkorbit.map.model.ship.class_86;

import package_35.class_338;
import package_35.class_348;

public class class_355 extends class_348 {


    private var var_2202: Number = 1;

    private var var_3570: Boolean;

    public function class_355(param1: class_86, param2: Number, param3: Boolean) {
        super(class_338.const_2285, param1, const_2856);
        method_2711 = Math.max(1000, param2 * 1000);
        this.var_2202 = param2;
        this.var_3570 = param3;
    }

    public function get method_3034(): Number {
        return this.var_2202;
    }

    public function set method_3034(param1: Number): void {
        this.var_2202 = param1;
    }

    public function get method_3435(): Boolean {
        return this.var_3570;
    }
}
}
