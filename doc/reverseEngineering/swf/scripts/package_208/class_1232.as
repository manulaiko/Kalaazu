package package_208 {

import com.bigpoint.utils.class_122;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.mvc.gui.GuiConstants;

import package_30.class_91;

import package_33.class_93;

import package_38.class_740;

import package_72.class_190;

public class class_1232 extends class_1231 {


    public function class_1232() {
        super();
    }

    public static function run(param1: class_740): void {
        var _loc2_: int = int(param1.var_2168);
        var _loc3_: int = int(param1.score);
        var _loc4_: uint = uint(param1.updateMode);
        switch (_loc4_) {
            case class_740.const_682:
                method_5953(_loc2_, _loc3_);
                break;
            case class_740.const_3280:
                method_1426(_loc2_, _loc3_);
        }
        class_1231.method_4720(_loc2_);
    }

    private static function method_5953(param1: int, param2: int): void {
        var _loc3_: class_190 = class_1231.method_4924(param1);
        if (_loc3_.var_3850 != 0) {
            _loc3_.var_2347 = param2 - Number(_loc3_.var_3850);
        }
        _loc3_.var_3850 = param2;
        if (_loc3_.var_2347 > 0 && _loc3_.targetList != null) {
            if (_loc3_.var_2347 == 1) {
                var_574.method_4489().writeToLog(class_88.getItem("log_msg_ranked_hunt_point_s"));
            } else {
                var_574.method_4489().writeToLog(class_88.getItem("log_msg_ranked_hunt_point_p").replace(/%AMOUNT%/, class_122.method_98(_loc3_.var_2347)));
            }
            var_574.method_4489().updateInfoField(GuiConstants.RANKED_HUNT_EVENT_WINDOW, class_93.const_1784, class_91.const_1504);
        }
        _loc3_.var_1443 = false;
    }

    private static function method_1426(param1: int, param2: int): void {
        var _loc3_: class_190 = class_1231.method_4924(param1);
        _loc3_.var_2347 = 0;
        _loc3_.var_1443 = false;
        _loc3_.var_1443 = true;
        _loc3_.var_1138 = param2;
    }
}
}
