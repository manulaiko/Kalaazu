package package_58 {

import flash.events.Event;

import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;
import net.bigpoint.darkorbit.mvc.common.view.components.DOWindow;
import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
import net.bigpoint.darkorbit.mvc.sectorControlWindow.SectorControlWindowNotifications;

import org.puremvc.as3.multicore.patterns.mediator.Mediator;

import package_38.class_662;

public class SectorControlDraftConfirmationPopUpMediator extends Mediator {

    public static const NAME: String = "SectorControlDraftConfirmationPopUpMediator";


    public function SectorControlDraftConfirmationPopUpMediator(param1: Object = null) {
        super(NAME, param1);
    }

    override public function onRegister(): void {
        sendNotification(SectorControlWindowNotifications.SET_UI_INTERACTIVITY, false);
        this.popUp.addEventListener(DOWindow.CLOSE_WINDOW_CLICKED, this.method_234);
        this.popUp.addEventListener(class_155.const_2235, this.method_1127);
        this.popUp.addEventListener(class_155.EVENT_ACCEPT_DRAFT_CONFIRMATION, this.method_198);
        this.popUp.addEventListener(class_155.EVENT_REFUSE_DRAFT_CONFIRMATION, this.method_2971);
    }

    override public function onRemove(): void {
        sendNotification(SectorControlWindowNotifications.SET_UI_INTERACTIVITY, true);
        this.popUp.removeEventListener(DOWindow.CLOSE_WINDOW_CLICKED, this.method_234);
        this.popUp.removeEventListener(class_155.const_2235, this.method_1127);
        this.popUp.removeEventListener(class_155.EVENT_ACCEPT_DRAFT_CONFIRMATION, this.method_198);
        this.popUp.removeEventListener(class_155.EVENT_REFUSE_DRAFT_CONFIRMATION, this.method_2971);
        sendNotification(GuiNotifications.CLOSE_WINDOW_BY_TYPE, this.popUp.windowType);
    }

    private function method_1127(param1: Event): void {
        this.removeMediator();
    }

    private function method_234(param1: Event): void {
        this.removeMediator();
    }

    private function method_2971(param1: Event): void {
        this.method_3324(false);
    }

    private function removeMediator(): void {
        facade.removeMediator(NAME);
    }

    private function method_198(param1: Event): void {
        this.method_3324(true);
    }

    private function method_3324(param1: Boolean): void {
        sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST, new class_662(param1));
        this.removeMediator();
    }

    protected function get popUp(): class_155 {
        return viewComponent as class_155;
    }
}
}
