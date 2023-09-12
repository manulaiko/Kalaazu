package package_124 {

import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.net.class_112;
import net.bigpoint.darkorbit.net.class_116;
import net.bigpoint.darkorbit.net.class_1834;
import net.bigpoint.darkorbit.net.class_1842;
import net.bigpoint.darkorbit.net.class_74;

import package_37.class_170;

import package_38.class_890;

public class class_1407 extends class_170 {


    public function class_1407() {
        super();
    }

    public static function run(param1: class_890): void {
        var _loc2_: * = null;
        var _loc3_: int = 0;
        class_1834.getInstance().method_1003(param1);
        switch (param1.var_2632) {
            case class_126.const_1952:
                _loc2_ = ["0", class_74.const_74, class_74.const_3307, class_74.const_2243, param1.var_2632, param1.var_4266];
                for each(_loc3_ in param1.var_21) {
                    _loc2_.push(_loc3_);
                }
                class_112.getInstance().method_3891(_loc2_);
                break;
            case class_126.const_80:
                _loc2_ = ["0", class_74.const_74, class_74.const_1572, class_74.const_2834, class_74.SPEED_BUFF, param1.var_4266];
                class_116.getInstance().method_5080(_loc2_);
                break;
            case class_126.const_1423:
            case class_126.const_806:
            case class_126.const_437:
            case class_126.const_448:
            case class_126.const_3104:
            case class_126.const_1752:
            case class_126.const_1685:
                class_1842.getInstance().method_5074(param1);
        }
    }
}
}
