package package_191 {

import net.bigpoint.darkorbit.map.model.class_90;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.ItemsControlMenuConstants;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.ItemsControlMenuNotifications;

import package_17.class_62;

public class class_1168 implements class_1157 {

    public static const NAME: String = "activatePremiumSlot";


    public function class_1168() {
        super();
    }

    public function execute(param1: class_90, param2: Vector.<String>): void {
        var _loc3_: int = int(param2[0]);
        _loc3_++;
        class_62.getInstance().sendNotification(ItemsControlMenuNotifications.SEND_HOT_KEY_ACTION_REQUEST, _loc3_, ItemsControlMenuConstants.PREMIUM_SLOT_BAR);
        new class_1162().execute(param1, new <String>["25"]);
    }
}
}
