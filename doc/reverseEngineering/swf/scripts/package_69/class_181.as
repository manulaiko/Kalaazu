package package_69 {

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.map.model.traits.class_319;
import net.bigpoint.darkorbit.settings.Settings;

import package_22.class_169;
import package_22.class_198;

public class class_181 extends class_180 {

    public static var var_2567: Array = ["ore_prometium", "ore_endurium", "ore_terbium", "ore_xenomit", "ore_prometid", "ore_duranium", "ore_promerium", "ore_seprom", "ore_palladium"];


    public function class_181(param1: int, param2: String, param3: int, param4: int) {
        super("ore_" + param1, param2, param3, param4, false, Settings.displayResources);
        class_319(method_1954(class_319)).toolTip = class_88.getItem(class_198.var_4944[param1].languageKey);
    }

    public static function method_4666(param1: Array): Array {
        var _loc4_: int = 0;
        var _loc5_: * = null;
        var _loc2_: * = [];
        var _loc3_: int = 0;
        while (_loc3_ < param1.length) {
            _loc4_ = int(param1[_loc3_]);
            _loc5_ = class_198.var_4944[_loc4_];
            _loc2_.push(_loc5_);
            _loc3_++;
        }
        return _loc2_;
    }
}
}
