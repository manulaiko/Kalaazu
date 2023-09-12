package package_54 {

import net.bigpoint.darkorbit.gui.windows.class_57;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_311.TeamDeathMatchPopupNotifications;

public class TeamDeathMatchLevelRequirementPopupMediator extends class_1817 {

    public static const NAME: String = "TeamDeathMatchLevelRequirementPopupMediator";


    public function TeamDeathMatchLevelRequirementPopupMediator() {
        super(NAME);
    }

    override public function listNotificationInterests(): Array {
        super.listNotificationInterests();
        return [TeamDeathMatchPopupNotifications.const_3102, TeamDeathMatchPopupNotifications.const_1888];
    }

    override protected function method_378(): void {
        super.method_378();
        var_3129[TeamDeathMatchPopupNotifications.const_3102] = this.method_4135;
        var_3129[TeamDeathMatchPopupNotifications.const_1888] = this.method_334;
    }

    override public function handleNotification(param1: INotification): void {
        super.handleNotification(param1);
    }

    override protected function method_4135(param1: INotification = null): void {
        super.method_4135(param1);
    }

    override protected function method_211(): void {
        popup = class_57.getInstance().createWindow(class_57.const_1347, class_57.const_2956) as class_160;
    }

    override protected function method_334(param1: INotification = null): void {
        super.method_334(param1);
    }

    override protected function method_2956(): void {
        class_57.getInstance().method_2624(class_57.const_1347);
    }
}
}
