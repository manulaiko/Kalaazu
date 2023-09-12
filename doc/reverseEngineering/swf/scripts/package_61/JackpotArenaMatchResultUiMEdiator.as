package package_61 {

import flash.display.Bitmap;
import flash.display.DisplayObject;
import flash.events.Event;

import net.bigpoint.darkorbit.gui.windows.class_57;
import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;
import net.bigpoint.darkorbit.mvc.common.view.components.DOWindow;
import net.bigpoint.darkorbit.mvc.common.view.components.resultHeader.IResultWindowMediator;
import net.bigpoint.darkorbit.mvc.common.view.components.resultHeader.model.StatsHeaderLableTweenVo;
import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.mediator.Mediator;

import package_38.class_552;

import package_8.VectorCollection;

public class JackpotArenaMatchResultUiMEdiator extends Mediator implements IResultWindowMediator {

    public static const NAME: String = "JackpotArenaMatchResultUiMEdiator";


    public function JackpotArenaMatchResultUiMEdiator(param1: Object = null) {
        super(NAME, param1);
    }

    override public function listNotificationInterests(): Array {
        return [GuiNotifications.CLOSE_ALL_FLEX_WINDOWS];
    }

    override public function handleNotification(param1: INotification): void {
        super.handleNotification(param1);
        switch (param1.getName()) {
            case GuiNotifications.CLOSE_ALL_FLEX_WINDOWS:
                this.method_2519();
                break;
            case GuiNotifications.CLOSE_WINDOW_BY_TYPE:
                if (param1.getBody() as String == class_57.const_1792) {
                    this.method_2519();
                }
        }
    }

    override public function onRegister(): void {
        super.onRegister();
        this.view.addEventListener(DOWindow.CLOSE_WINDOW_CLICKED, this.method_2519);
    }

    override public function onRemove(): void {
        sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST, new class_552());
        super.onRemove();
    }

    private function get view(): JackpotArenaMatchResultWindow {
        return viewComponent as JackpotArenaMatchResultWindow;
    }

    private function method_2519(param1: Event = null): void {
        facade.removeMediator(getMediatorName());
    }

    public function set title(param1: String): void {
        this.view.title = param1;
    }

    public function set headerText(param1: String): void {
        this.view.victoryLabel.headerText = param1;
    }

    public function set name_122(param1: String): void {
        this.view.name_122 = param1;
    }

    public function set method_3261(param1: String): void {
        this.view.itemList.method_1511 = param1;
    }

    public function set method_4240(param1: String): void {
        this.view.itemList.method_4588 = param1;
    }

    public function set method_6061(param1: String): void {
        this.view.itemList.method_3150 = param1;
    }

    public function set dataProvider(param1: VectorCollection): void {
        this.view.itemList.dataProvider = param1;
    }

    public function setHeaderImage(param1: Bitmap): void {
        this.view.setHeaderImage(param1);
    }

    public function setGradient(param1: Bitmap): void {
        this.view.victoryLabel.gradient = param1;
    }

    public function setEffectImg(param1: DisplayObject): void {
        this.view.victoryLabel.effectImg = param1;
    }

    public function setTexture(param1: DisplayObject): void {
        this.view.victoryLabel.texture = param1;
    }

    public function setBackground(param1: DisplayObject): void {
        this.view.victoryLabel.backGround = param1;
    }

    public function updateWindowTweens(param1: StatsHeaderLableTweenVo): void {
        this.view.victoryLabel.tweenVo = param1;
    }
}
}
