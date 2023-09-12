package package_219 {

import net.bigpoint.darkorbit.gui.class_58;
import net.bigpoint.darkorbit.mvc.gui.GuiConstants;

import package_33.class_93;

import package_38.class_708;

import package_45.class_366;

import package_9.class_50;

public class class_1452 extends class_1262 {


    public function class_1452() {
        super();
    }

    public static function run(param1: class_708): void {
        var _loc2_: int = int(param1.factionId);
        var _loc3_: int = int(param1.var_5014);
        var _loc4_: int = int(param1.score);
        var _loc5_: class_58;
        (_loc5_ = var_574.method_4489()).method_2694(GuiConstants.SPACEBALL_WINDOW, class_93.const_752, _loc2_, _loc4_);
        var _loc6_: class_366;
        if (_loc6_ = class_50.getInstance().map.method_327(_loc3_) as class_366) {
            _loc6_.jump(2);
        }
    }
}
}
