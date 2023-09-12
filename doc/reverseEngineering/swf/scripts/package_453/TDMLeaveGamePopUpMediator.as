package package_453 {

import flash.events.Event;

import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;
import net.bigpoint.darkorbit.mvc.common.view.components.DOWindow;
import net.bigpoint.darkorbit.mvc.common.view.components.LeaveGamePopUp;
import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.mediator.Mediator;

import package_38.class_687;

import package_98.MapNotification;

public class TDMLeaveGamePopUpMediator extends Mediator {

    public static const NAME: String = "TDMLeaveGamePopUpMediator";


    public function TDMLeaveGamePopUpMediator(param1: Object = null) {
        super(NAME, param1);
    }

    override public function listNotificationInterests(): Array {
        return [MapNotification.CLEANUP];
    }

    override public function handleNotification(param1: INotification): void {
        super.handleNotification(param1);
        var _loc2_: String = param1.getName();
        switch (_loc2_) {
            case MapNotification.CLEANUP:
                this.method_334();
        }
    }

    public function method_334(): void {
        this.method_2292();
    }

    override public function onRegister(): void {
        this.popUp.addEventListener(DOWindow.CLOSE_WINDOW_CLICKED, this.method_234);
        this.popUp.addEventListener(LeaveGamePopUp.EVENT_EXIT_MATCH_CONFIRMATION, this.method_311);
        this.popUp.addEventListener(LeaveGamePopUp.EVENT_EXIT_MATCH_CANCEL, this.handleCancelButtonClicked);
    }

    private function method_234(param1: Event): void {
        this.method_2292();
    }

    private function handleCancelButtonClicked(param1: Event): void {
        this.method_2292();
    }

    private function method_311(param1: Event): void {
        facade.sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST, new class_687());
        this.method_2292();
    }

    private function method_2292(): void {
        facade.removeMediator(getMediatorName());
    }

    override public function onRemove(): void {
        this.popUp.removeEventListener(DOWindow.CLOSE_WINDOW_CLICKED, this.method_234);
        this.popUp.removeEventListener(LeaveGamePopUp.EVENT_EXIT_MATCH_CONFIRMATION, this.method_311);
        this.popUp.removeEventListener(LeaveGamePopUp.EVENT_EXIT_MATCH_CANCEL, this.handleCancelButtonClicked);
        sendNotification(GuiNotifications.CLOSE_WINDOW_BY_TYPE, this.popUp.windowType);
    }

    protected function get popUp(): LeaveGamePopUp {
        return viewComponent as LeaveGamePopUp;
    }
}
}
