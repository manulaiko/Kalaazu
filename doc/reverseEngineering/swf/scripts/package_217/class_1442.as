package package_217 {

import net.bigpoint.darkorbit.class_81;
import net.bigpoint.darkorbit.mvc.battleStation.BattleStationViewNotifications;

import package_37.class_170;

import package_38.class_925;

public class class_1442 extends class_170 {


    public function class_1442() {
        super();
    }

    public static function run(param1: class_925): void {
        class_81.name_145 = "";
        class_170.var_271.sendNotification(BattleStationViewNotifications.OPEN_BUILDING_UI_BUBBLE, param1.var_3184);
    }
}
}
