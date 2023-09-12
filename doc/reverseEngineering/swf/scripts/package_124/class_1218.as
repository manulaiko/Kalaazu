package package_124 {

import package_17.class_62;

import package_175.StarmapBattleStationIconProxy;

import package_37.class_170;

import package_38.class_473;

public class class_1218 extends class_170 {


    public function class_1218() {
        super();
    }

    public static function run(param1: class_473): void {
        method_1175.method_4784(param1.var_2416, param1.var_4076);
    }

    private static function get method_1175(): StarmapBattleStationIconProxy {
        return class_62.getInstance().retrieveProxy(StarmapBattleStationIconProxy.NAME) as StarmapBattleStationIconProxy;
    }
}
}
