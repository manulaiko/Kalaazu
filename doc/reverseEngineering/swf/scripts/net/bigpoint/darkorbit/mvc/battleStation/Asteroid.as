package net.bigpoint.darkorbit.mvc.battleStation {

import com.bigpoint.utils.class_73;

import net.bigpoint.darkorbit.map.model.traits.class_1182;
import net.bigpoint.darkorbit.mvc.battlestationswindow.BattleStationNotification;
import net.bigpoint.darkorbit.mvc.common.model.assets.UberAssetsLib;

import package_17.class_62;

import package_29.class_85;

import package_38.class_868;

public class Asteroid extends class_85 {


    public function Asteroid(param1: class_868) {
        super(param1.name_115, new class_73(param1.var_4787, param1.var_2295));
        UberAssetsLib.instance.fillTraits(this, "asteroid", UberAssetsLib.LIB_BATTLE_STATION, !!param1.var_4985 ? this.handleIconClick : null, null, param1.var_3438);
    }

    private function handleIconClick(): void {
        class_62.getInstance().sendNotification(BattleStationNotification.const_2108, [id, class_1182(method_1954(class_1182)).text.value]);
    }
}
}
