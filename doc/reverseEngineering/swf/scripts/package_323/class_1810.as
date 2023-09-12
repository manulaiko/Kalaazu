package package_323 {

import com.bigpoint.utils.class_73;

import net.bigpoint.darkorbit.class_81;
import net.bigpoint.darkorbit.map.model.traits.class_1783;
import net.bigpoint.darkorbit.mvc.common.model.assets.UberAssetsLib;

import package_17.class_62;

import package_29.class_85;

import package_38.class_868;

import package_394.class_2271;

import package_395.class_2272;

public class class_1810 extends class_85 {


    public function class_1810(param1: class_868) {
        super(param1.name_115, new class_73(param1.var_4787, param1.var_2295));
        UberAssetsLib.instance.fillTraits(this, "tdm_exit_" + param1.factionId, UberAssetsLib.LIB_DEFAULT, Boolean(param1.var_4985) && param1.factionId == class_81.factionID ? this.method_3349 : null);
        addTrait(new class_1783());
    }

    private function method_3349(): void {
        if (!class_62.getInstance().hasCommand(class_2271.OPEN_TDM_LEAVEMATCH_WINDOW)) {
            class_62.getInstance().registerCommand(class_2271.OPEN_TDM_LEAVEMATCH_WINDOW, class_2272);
        }
        class_62.getInstance().sendNotification(class_2271.OPEN_TDM_LEAVEMATCH_WINDOW);
    }
}
}
