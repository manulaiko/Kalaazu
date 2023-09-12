package package_217 {

import package_163.BattleStationProxy;

import package_37.class_170;

import package_38.class_677;

public class class_1316 extends class_170 {


    public function class_1316() {
        super();
    }

    public static function run(param1: class_677): void {
        var _loc2_: BattleStationProxy = var_271.retrieveProxy(BattleStationProxy.NAME) as BattleStationProxy;
        _loc2_.var_1742 = var_574.method_6154();
        _loc2_.method_3555(param1, param1.var_2469, false);
    }
}
}
