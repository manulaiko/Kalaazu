package net.bigpoint.darkorbit.mvc.boosterstation.view {

import com.bigpoint.utils.class_73;

import net.bigpoint.darkorbit.map.model.traits.class_2255;
import net.bigpoint.darkorbit.mvc.common.model.assets.UberAssetsLib;

import package_100.class_1174;

import package_29.class_85;

import package_38.class_868;

public class BoosterStation extends class_85 {


    public function BoosterStation(param1: class_868) {
        super(param1.name_115, new class_73(param1.var_4787, param1.var_2295));
        UberAssetsLib.instance.fillTraits(this, "boosterstation_" + param1.name_164, UberAssetsLib.LIB_DEFAULT);
        addTrait(new class_2255());
    }

    private function get pulsingRing(): class_2255 {
        return method_1954(class_2255) as class_2255;
    }

    public function activate(param1: int): void {
        this.pulsingRing.enable(param1, class_1174(method_1954(class_1174)).color);
    }

    public function deactivate(): void {
        this.pulsingRing.disable();
    }
}
}
