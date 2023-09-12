package package_217 {

import net.bigpoint.darkorbit.mvc.battleStation.BattleStationViewNotifications;

import package_163.BattleStationProxy;
import package_163.class_1017;

import package_37.class_170;

import package_38.class_680;

public class class_1267 extends class_170 {


    public function class_1267() {
        super();
    }

    public static function run(param1: class_680): void {
        var _loc2_: BattleStationProxy = var_271.retrieveProxy(BattleStationProxy.NAME) as BattleStationProxy;
        _loc2_.var_1742 = var_574.method_6154();
        _loc2_.method_4704(param1.name_156);
        _loc2_.method_3555(param1.state, param1.var_2469);
        _loc2_.method_3727 = new class_1017(param1.var_4999, param1.var_3593, param1.var_3070);
        class_170.var_271.sendNotification(BattleStationViewNotifications.OPEN_BUILDING_UI_BUBBLE, param1.var_3184);
    }
}
}
