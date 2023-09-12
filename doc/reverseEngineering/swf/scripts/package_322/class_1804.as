package package_322 {

import com.bigpoint.utils.class_73;

import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;
import net.bigpoint.darkorbit.mvc.common.model.assets.UberAssetsLib;

import package_17.class_62;

import package_27.class_82;

import package_29.class_85;

import package_38.class_445;
import package_38.class_847;
import package_38.class_868;

public class class_1804 extends class_85 {

    private static const const_1896: Object = {};

    {
        const_1896[class_445.const_2448] = "repairstation_home";
        const_1896[class_445.const_1208] = "repairstation_outpost";
    }

    public function class_1804(param1: class_868) {
        super(param1.name_115, new class_73(param1.var_4787, param1.var_2295));
        UberAssetsLib.instance.fillTraits(this, "undefined_" + param1.factionId, UberAssetsLib.LIB_DEFAULT, !!param1.var_4985 ? this.handleIconClick : null);
    }

    private function handleIconClick(): void {
        class_82.playSoundEffect(class_126.const_2208);
        class_62.getInstance().sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST, new class_847(id));
    }
}
}
