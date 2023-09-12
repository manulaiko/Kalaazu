package package_191 {

import net.bigpoint.darkorbit.map.model.class_90;

import package_17.class_62;

import package_63.ChatNotifications;

public class FocusChatCommand implements class_1157 {

    public static const NAME: String = "FocusChatCommand";


    public function FocusChatCommand() {
        super();
    }

    public function execute(param1: class_90, param2: Vector.<String>): void {
        class_62.getInstance().sendNotification(ChatNotifications.const_99);
    }
}
}
