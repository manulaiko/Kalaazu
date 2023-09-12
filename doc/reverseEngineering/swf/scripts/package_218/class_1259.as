package package_218 {

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.gui.class_187;

import package_37.class_170;

import package_38.class_643;
import package_38.class_647;

public class class_1259 extends class_170 {


    public function class_1259() {
        super();
    }

    public static function run(param1: class_643): void {
        var _loc5_: * = null;
        var _loc2_: uint = uint(param1.var_4107);
        var _loc3_: class_647 = param1.var_158;
        var _loc4_: int = int(_loc3_.var_3759);
        switch (_loc4_) {
            case class_647.STANDARD:
                _loc5_ = "null";
                break;
            case class_647.const_737:
                _loc5_ = "null";
        }
        var_574.method_4489().writeToLog(class_88.getItem("msg_jackpot_players_left").replace(/%COUNT%/, _loc2_), _loc5_);
    }
}
}
