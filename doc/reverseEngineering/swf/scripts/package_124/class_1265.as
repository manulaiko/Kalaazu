package package_124 {

import com.greensock.TweenNano;

import package_37.class_170;
import package_37.class_363;

import package_38.class_111;
import package_38.class_763;

public class class_1265 extends class_170 {


    public function class_1265() {
        super();
    }

    public static function run(param1: class_763): void {
        TweenNano.delayedCall(Number(param1.var_304) / 1000, class_363.execute, [new class_111("0|i|" + param1.mapID)]);
    }
}
}
