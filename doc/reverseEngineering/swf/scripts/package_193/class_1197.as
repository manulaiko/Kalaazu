package package_193 {

import com.bigpoint.utils.class_73;

import flash.geom.Rectangle;

import package_10.class_20;

import package_120.class_431;

public class class_1197 extends class_431 {

    private static const const_555: int = 384;


    private var var_126: class_20;

    public function class_1197(param1: int, param2: String, param3: class_73, param4: int, param5: Boolean, param6: int) {
        this.var_126 = new class_20(0);
        super(param1, param3, param2, param5, param6, new Rectangle(Number(param3.x) - param4, Number(param3.y) - param4, param4 * 2, param4 * 2));
        this.var_126.value = param4;
        if (param6 > 0) {
            addTrait(new class_1692());
        }
        if (param2 == class_431.const_2513 || param2 == class_431.const_941) {
            if (param5) {
                method_4219.value = const_555;
            }
            addTrait(new class_1694());
        }
        if (method_5472()) {
            addTrait(new class_1693());
        }
    }

    public function get radius(): class_20 {
        return this.var_126;
    }
}
}
