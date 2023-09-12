package package_217 {

import package_163.BattleStationProxy;

import package_37.class_170;

import package_38.class_640;

public class class_1462 extends class_170 {


    public function class_1462() {
        super();
    }

    public static function run(param1: class_640): void {
        var _loc2_: BattleStationProxy = var_271.retrieveProxy(BattleStationProxy.NAME) as BattleStationProxy;
        _loc2_.var_1742 = var_574.method_6154();
        _loc2_.method_4704(param1);
    }
}
}
