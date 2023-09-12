package package_230 {

import net.bigpoint.darkorbit.mvc.battleStation.BattleStationViewNotifications;
import net.bigpoint.darkorbit.mvc.battlestationswindow.BattleStationNotification;
import net.bigpoint.darkorbit.mvc.mapElements.assets.MapAssetNotification;

import package_37.ICommand;
import package_37.class_170;

import package_38.class_445;
import package_38.class_883;

public class class_1351 extends class_170 {


    public function class_1351() {
        super();
    }

    public static function run(param1: ICommand): void {
        var _loc2_: class_883 = param1 as class_883;
        switch (_loc2_.type.var_2008) {
            case class_445.const_2838:
                var_271.method_2407(BattleStationNotification.const_2108, _loc2_.name_115);
                break;
            case class_445.const_942:
                var_271.method_2407(BattleStationViewNotifications.UPDATE_BATTLESTATION_VIEW, _loc2_);
                break;
            case class_445.const_1795:
                var_271.method_2407(BattleStationViewNotifications.UPDATE_BATTLESTATION_MODULE_VIEW, _loc2_);
                break;
            case class_445.const_3251:
        }
        var_271.method_2407(MapAssetNotification.MAP_ASSET_UPDATE_HP, [_loc2_.name_115, _loc2_.name_90, _loc2_.maxHitpoints]);
        if (_loc2_.var_661) {
            var_271.method_2407(MapAssetNotification.MAP_ASSET_UPDATE_SHIELD, [_loc2_.name_115, _loc2_.var_124, _loc2_.var_2703]);
        }
    }
}
}
