package package_54 {

import flash.events.Event;

import net.bigpoint.darkorbit.gui.windows.class_57;
import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;
import net.bigpoint.darkorbit.mvc.common.view.components.DOWindow;
import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_311.TeamDeathMatchPopupNotifications;

import package_38.class_504;

public class TeamDeathMatchParticipationPopupMediator extends class_1817 {

    public static const NAME: String = "TeamDeathMatchParticipationPopupMediator";


    public function TeamDeathMatchParticipationPopupMediator() {
        super(NAME);
    }

    override public function listNotificationInterests(): Array {
        super.listNotificationInterests();
        return [TeamDeathMatchPopupNotifications.const_1063, TeamDeathMatchPopupNotifications.const_2004];
    }

    override protected function method_378(): void {
        super.method_378();
        var_3129[TeamDeathMatchPopupNotifications.const_1063] = this.method_4135;
        var_3129[TeamDeathMatchPopupNotifications.const_2004] = this.method_334;
    }

    override public function handleNotification(param1: INotification): void {
        super.handleNotification(param1);
    }

    override protected function method_4135(param1: INotification = null): void {
        super.method_4135(param1);
        popup.addEventListener(class_157.const_2710, this.method_4348);
        popup.addEventListener(class_157.const_945, this.method_5907);
        popup.addEventListener(class_157.const_2235, this.method_3551);
        popup.addEventListener(DOWindow.CLOSE_WINDOW_CLICKED, this.method_4166);
        var _loc2_: int = param1.getBody() as int;
        var _loc3_: class_157 = popup as class_157;
        if (_loc3_) {
            _loc3_.startTimer(_loc2_);
        }
    }

    override protected function method_211(): void {
        var _loc1_: class_157 = class_57.getInstance().createWindow(class_57.const_1666, class_57.const_2956) as class_157;
        setViewComponent(_loc1_);
    }

    override protected function method_334(param1: INotification = null): void {
        popup.removeEventListener(class_157.const_2710, this.method_4348);
        popup.removeEventListener(class_157.const_945, this.method_5907);
        popup.removeEventListener(class_157.const_2235, this.method_3551);
        popup.removeEventListener(DOWindow.CLOSE_WINDOW_CLICKED, this.method_4166);
        var _loc2_: class_157 = popup as class_157;
        if (_loc2_) {
            _loc2_.method_849();
        }
        super.method_334(param1);
    }

    override protected function method_2956(): void {
        class_57.getInstance().method_2624(class_57.const_1666);
    }

    protected function method_5907(param1: Event): void {
        this.method_334();
        sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST, new class_504(true));
        sendNotification(GuiNotifications.CLOSE_WINDOW_BY_TYPE, class_57.const_378);
    }

    protected function method_4348(param1: Event): void {
        this.method_334();
        sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST, new class_504(false));
    }

    protected function method_3551(param1: Event): void {
        this.method_334();
        sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST, new class_504(false));
    }

    protected function method_4166(param1: Event): void {
        this.method_334();
    }
}
}
