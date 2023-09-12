package package_217 {

import net.bigpoint.darkorbit.mvc.battleStation.BattleStationViewNotifications;

import package_163.BattleStationProxy;
import package_163.class_1017;

import package_37.class_170;

import package_38.class_964;

public class class_1447 extends class_170 {


    public function class_1447() {
        super();
    }

    public static function run(param1: class_964): void {
        var _loc2_: BattleStationProxy = var_271.retrieveProxy(BattleStationProxy.NAME) as BattleStationProxy;
        _loc2_.var_1742 = var_574.method_6154();
        _loc2_.method_4704(param1.name_156);
        _loc2_.method_3819(param1.var_3184, param1.var_1529, param1.var_2469, param1.progress);
        _loc2_.method_2339 = new class_1017(param1.var_2329, param1.var_1390, param1.var_2870);
        var_271.sendNotification(BattleStationViewNotifications.OPEN_BUILDING_UI_BUBBLE, param1.var_3184);
    }
}
}
