package package_192 {

import package_191.FocusChatCommand;
import package_191.PetRepairShipCommand;
import package_191.ToggleCategoryBarCommand;
import package_191.ZoomInCommand;
import package_191.ZoomOutCommand;
import package_191.class_1158;
import package_191.class_1159;
import package_191.class_1160;
import package_191.class_1161;
import package_191.class_1163;
import package_191.class_1164;
import package_191.class_1165;
import package_191.class_1166;
import package_191.class_1167;
import package_191.class_1168;
import package_191.class_1169;
import package_191.class_1170;

import package_38.class_510;
import package_38.class_617;

public class class_1784 implements class_1171 {

    private static const const_217: Object = new Object();

    {
        const_217[class_617.const_1882] = class_1169.NAME;
        const_217[class_617.const_1219] = class_1167.NAME;
        const_217[class_617.JUMP] = class_1161.NAME;
        const_217[class_617.const_1566] = class_1165.NAME;
        const_217[class_617.const_1107] = class_1163.NAME;
        const_217[class_617.const_2005] = class_1159.NAME;
        const_217[class_617.const_1199] = class_1158.NAME;
        const_217[class_617.const_795] = class_1168.NAME;
        const_217[class_617.LOGOUT] = class_1164.NAME;
        const_217[class_617.const_1234] = class_1160.NAME;
        const_217[class_617.const_995] = class_1170.NAME;
        const_217[class_617.const_402] = ZoomInCommand.NAME;
        const_217[class_617.const_705] = ZoomOutCommand.NAME;
        const_217[class_617.const_2160] = PetRepairShipCommand.NAME;
        const_217[class_617.const_1027] = FocusChatCommand.NAME;
        const_217[class_617.const_1789] = ToggleCategoryBarCommand.NAME;
        const_217[class_617.const_1391] = class_1166.NAME;
    }

    private var var_1585: class_510;

    public function class_1784(param1: class_510) {
        super();
        this.var_1585 = param1;
    }

    public static function get name_95(): Object {
        return const_217;
    }

    public function parse(): Object {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: int = 0;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc1_: Object = new Object();
        for each(_loc3_ in this.var_1585.var_3518) {
            for each(_loc4_ in _loc3_.var_3729) {
                _loc5_ = _loc4_.toString();
                _loc1_[_loc5_] = new Vector.<Object>(1);
                (_loc6_ = _loc1_[_loc5_] as Vector.<Object>)[0] = new Object();
                _loc1_[_loc5_][0][class_1172.NAME] = const_217[_loc3_.var_2201];
                _loc2_ = new <String>[_loc3_.parameter.toString()];
                _loc1_[_loc5_][0][class_1172.const_882] = new Object();
                _loc1_[_loc5_][0][class_1172.const_882][_loc1_[_loc5_][0][class_1172.NAME]] = _loc2_;
            }
        }
        return _loc1_;
    }
}
}
