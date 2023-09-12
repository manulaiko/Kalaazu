package package_183 {

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.class_81;

import package_38.class_445;

public class class_1608 extends Condition {


    public function class_1608() {
        super();
    }

    override protected function method_153(param1: Vector.<String>): void {
        var _loc2_: int = 0;
        var _loc3_: * = null;
        super.method_153(param1);
        if (param1.length) {
            _loc2_ = int(param1[0]);
            _description = _description.replace(/%TYPE%/, class_88.getItem(class_126.instance.method_2318[_loc2_]));
            switch (_loc2_) {
                case class_445.const_603:
                    var_3277 = method_6395("homestation_hangar");
                    break;
                case class_445.const_2477:
                    _loc3_ = class_126.getInstance().method_1709[class_81.factionID];
                    var_3277 = method_6395("homestation_company_" + _loc3_);
                    break;
                case class_445.const_3031:
                    var_3277 = method_6395("homestation_ore_trade");
                    break;
                case class_445.const_2448:
                    var_3277 = method_6395("homestation_instant_repair");
            }
        }
    }
}
}
