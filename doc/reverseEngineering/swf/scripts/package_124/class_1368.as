package package_124 {

import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.net.class_1486;
import net.bigpoint.darkorbit.net.class_1834;

import package_37.class_170;

import package_38.class_585;
import package_38.class_603;

public class class_1368 extends class_170 {


    public function class_1368() {
        super();
    }

    public static function run(param1: class_585): void {
        class_1834.getInstance().method_2177(param1);
        var _loc2_: int = int(param1.var_2632);
        switch (param1.var_2632) {
            case class_126.const_1752:
            case class_126.const_545:
            case class_126.const_1685:
            case class_126.const_437:
                class_1486.getInstance().method_1485(new class_603(_loc2_, param1.var_4266, null));
                break;
            case class_126.const_1423:
            case class_126.const_806:
                class_1486.getInstance().method_2893(param1.var_2632, param1.var_4266);
        }
    }
}
}
