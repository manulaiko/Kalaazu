package package_230 {

import net.bigpoint.darkorbit.mvc.battleStation.Asteroid;
import net.bigpoint.darkorbit.mvc.battleStation.BattleStation;
import net.bigpoint.darkorbit.mvc.battleStation.BattleStationModule;
import net.bigpoint.darkorbit.mvc.boosterstation.view.BoosterStation;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_124.class_392;

import package_312.class_1785;
import package_312.class_1803;
import package_312.class_1812;

import package_322.QuestGiver;
import package_322.class_1801;
import package_322.class_1802;
import package_322.class_1804;
import package_322.class_1807;
import package_322.class_1808;

import package_323.class_1810;
import package_323.class_1811;

import package_38.class_315;
import package_38.class_445;
import package_38.class_868;

import package_45.class_1800;
import package_45.class_1805;
import package_45.class_1806;
import package_45.class_1809;

import package_84.class_243;

public class class_1327 extends class_243 {

    private static const MAP: Object = {};

    {
        MAP[class_445.const_2448] = class_1804;
        MAP[class_445.const_1208] = class_1804;
        MAP[class_445.const_3031] = class_1802;
        MAP[class_445.const_229] = class_1802;
        MAP[class_445.const_2947] = class_1802;
        MAP[class_445.const_603] = class_1807;
        MAP[class_445.const_784] = class_1807;
        MAP[class_445.const_2477] = class_1808;
        MAP[class_445.const_1965] = class_1808;
        MAP[class_445.const_63] = class_1801;
        MAP[class_445.const_443] = class_1801;
        MAP[class_445.const_2209] = class_1801;
        MAP[class_445.const_287] = class_1801;
        MAP[class_445.const_1178] = QuestGiver;
        MAP[class_445.const_715] = class_1812;
        MAP[class_445.const_3199] = class_1811;
        MAP[class_445.const_3105] = BoosterStation;
        MAP[class_445.const_2838] = Asteroid;
        MAP[class_445.const_2695] = class_1803;
        MAP[class_445.const_2246] = class_1810;
        MAP[class_445.const_1417] = class_1785;
        MAP[class_445.const_2100] = class_1806;
        MAP[class_445.const_942] = BattleStation;
        MAP[class_445.const_1795] = BattleStationModule;
        MAP[class_445.const_1759] = class_1800;
        MAP[class_445.const_2034] = class_1805;
        MAP[class_445.const_771] = class_1809;
    }

    public function class_1327() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc3_: * = null;
        var _loc2_: class_868 = param1.getBody() as class_868;
        if (MAP[_loc2_.type.var_2008] is Class) {
            name_47.map.method_4903(new MAP[_loc2_.type.var_2008](_loc2_));
        }
        for each(_loc3_ in _loc2_.var_2708) {
            class_392.run(_loc3_);
        }
    }
}
}
