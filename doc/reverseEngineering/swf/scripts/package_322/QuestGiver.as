package package_322 {

import com.bigpoint.utils.class_73;

import net.bigpoint.darkorbit.map.model.traits.class_1180;
import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;
import net.bigpoint.darkorbit.mvc.common.model.assets.UberAssetsLib;
import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;

import package_17.class_62;

import package_29.class_85;

import package_38.class_588;
import package_38.class_868;

import package_81.class_237;

public class QuestGiver extends class_85 {


    public function QuestGiver(param1: class_868) {
        super(param1.name_115, new class_73(param1.var_4787, param1.var_2295));
        UberAssetsLib.instance.fillTraits(this, "questgiver_" + param1.name_164, UberAssetsLib.LIB_DEFAULT, !!param1.var_4985 ? this.handleIconClick : null, null, param1.var_3438);
        var _loc2_: class_1180 = method_1954(class_1180) as class_1180;
        if (_loc2_) {
            _loc2_.const_3038.add(this.method_1860);
        }
    }

    private function handleIconClick(): void {
        class_62.getInstance().sendNotification(GuiNotifications.OPEN_QUEST_WINDOW, id);
        class_62.getInstance().sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST, new class_588(id));
        class_62.getInstance().sendNotification(class_237.const_2967);
    }

    private function method_1860(): void {
        class_62.getInstance().sendNotification(GuiNotifications.CLOSE_QUEST_WINDOW);
    }
}
}
