package package_191 {

import com.greensock.TweenLite;

import net.bigpoint.darkorbit.map.model.class_90;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.ItemsControlMenuConstants;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.ItemsControlMenuNotifications;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.ItemsControlMenuProxy;
import net.bigpoint.darkorbit.settings.Settings;

import package_17.class_62;

public class class_1158 implements class_1157 {

    public static const NAME: String = "activateSlot";


    public function class_1158() {
        super();
    }

    public function execute(param1: class_90, param2: Vector.<String>): void {
        var _loc3_: int = int(param2[0]);
        _loc3_++;
        if (Boolean(this.menuProxy.proActionBarVisible) && false) {
            class_62.getInstance().sendNotification(ItemsControlMenuNotifications.SEND_HOT_KEY_ACTION_REQUEST, _loc3_, ItemsControlMenuConstants.PRO_ACTION_BAR);
            if (false) {
                TweenLite.delayedCall(0.25, this.closeProActionBar);
            }
        } else {
            class_62.getInstance().sendNotification(ItemsControlMenuNotifications.SEND_HOT_KEY_ACTION_REQUEST, _loc3_, ItemsControlMenuConstants.STANDARD_SLOT_BAR);
        }
        new class_1162().execute(param1, new <String>["25"]);
    }

    private function closeProActionBar(): void {
        if (this.menuProxy.proActionBarVisible) {
            class_62.getInstance().sendNotification(ItemsControlMenuNotifications.TOGGLE_PRO_ACTION_BUTTON);
        }
    }

    private function get menuProxy(): ItemsControlMenuProxy {
        return class_62.getInstance().retrieveProxy(ItemsControlMenuProxy.NAME) as ItemsControlMenuProxy;
    }
}
}
