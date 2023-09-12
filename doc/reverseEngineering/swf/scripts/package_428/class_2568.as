package package_428 {

import net.bigpoint.darkorbit.settings.Settings;

import package_116.class_1178;

import package_360.class_2381;

public class class_2568 extends class_2381 {


    private var var_569: class_1178;

    public function class_2568(param1: class_1178) {
        var _loc2_: * = null;
        super();
        this.var_569 = param1;
        if (Settings.qualityShip.value == Settings.QUALITY_HIGH) {
            load("drones", this.var_569.pattern.resKey);
        } else {
            _loc2_ = this.var_569.pattern.resKey.slice(0, this.var_569.pattern.resKey.length - 1) + "0";
            load("replacementShips", _loc2_);
        }
    }
}
}
