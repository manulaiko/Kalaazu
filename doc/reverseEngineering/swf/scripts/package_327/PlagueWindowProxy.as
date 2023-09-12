package package_327 {

import net.bigpoint.darkorbit.mvc.gui.abstract.model.DOAbstractProxy;

import package_326.PlagueWindowNotifications;

import package_38.class_456;
import package_38.class_540;
import package_38.class_856;

import package_9.class_50;

public class PlagueWindowProxy extends DOAbstractProxy {

    public static const NAME: String = "PlagueWindowProxy";


    public function PlagueWindowProxy(param1: Object = null) {
        super(NAME, param1);
    }

    private function get model(): class_2275 {
        return data as class_2275;
    }

    override public function onRegister(): void {
        super.onRegister();
        this.model.name_11.changed.add(this.updateTimer);
        this.method_5296();
        class_50.getInstance().const_733.add(this.method_5296);
    }

    override public function onRemove(): void {
        super.onRemove();
        this.model.name_11.changed.remove(this.updateView);
        class_50.getInstance().const_733.remove(this.method_5296);
    }

    public function updateView(): void {
        sendNotification(PlagueWindowNotifications.UPDATE_VIEW, this.model);
    }

    public function method_2659(param1: Vector.<class_856>): void {
        this.model.method_2659(param1);
        this.updateView();
    }

    public function method_1131(param1: class_456): void {
        this.model.method_1131(param1);
        this.updateView();
    }

    public function method_5449(param1: class_540): void {
        this.model.method_5449(param1);
        this.updateView();
    }

    private function updateTimer(): void {
        sendNotification(PlagueWindowNotifications.UPDATE_TIMER, this.model);
    }

    private function method_5296(): void {
        this.model.method_2173(class_50.getInstance().map.mapID);
        this.updateView();
    }
}
}
