package package_457 {

import flash.events.Event;
import flash.utils.Dictionary;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.gui.windows.class_57;
import net.bigpoint.darkorbit.mvc.battlestationswindow.BattleStationNotification;
import net.bigpoint.darkorbit.mvc.battlestationswindow.class_1023;
import net.bigpoint.darkorbit.mvc.common.view.components.DOWindow;
import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.mediator.Mediator;

import package_163.BattleStationProxy;
import package_163.class_1908;

import package_48.class_137;
import package_48.class_2674;
import package_48.class_2675;

public class InventoryFilterMediator extends Mediator {

    public static const NAME: String = "InventoryFilterMediator";


    private var var_1854: Dictionary;

    public function InventoryFilterMediator(param1: class_137) {
        super(NAME, param1);
    }

    override public function onRegister(): void {
        super.onRegister();
        this.var_1854 = new Dictionary(true);
        this.view.addEventListener(DOWindow.CLOSE_WINDOW_CLICKED, this.closeWindowClickHandler);
        this.method_3522();
    }

    override public function listNotificationInterests(): Array {
        return [GuiNotifications.CLOSE_WINDOW_BY_TYPE];
    }

    override public function handleNotification(param1: INotification): void {
        switch (param1.getName()) {
            case GuiNotifications.CLOSE_WINDOW_BY_TYPE:
                if (param1.getBody() == class_57.const_394) {
                    this.closeWindowClickHandler();
                    sendNotification(GuiNotifications.CLOSE_WINDOW_BY_TYPE, class_57.const_602);
                    break;
                }
        }
    }

    private function method_3522(): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc1_: int = int(this.method_897.method_4562.length);
        var _loc2_: int = 0;
        while (_loc2_ != _loc1_) {
            _loc3_ = this.method_897.method_4562[_loc2_];
            (_loc4_ = new class_2675()).label = class_88.getItem("popup_bswin_module_filter_" + _loc3_.category);
            _loc4_.selected = _loc3_.selected;
            _loc4_.method_1399 = _loc2_ % 2 == 1;
            _loc4_.addEventListener(class_2674.const_2875, this.method_228);
            this.view.optionsContainer.addElement(_loc4_);
            this.var_1854[_loc4_] = _loc3_;
            _loc2_++;
        }
    }

    private function method_228(param1: Event): void {
        var _loc3_: * = null;
        var _loc2_: class_2675 = param1.target as class_2675;
        if (_loc2_) {
            _loc3_ = this.var_1854[_loc2_];
            if (_loc3_.category == class_1023.SHOW_ALL) {
                this.method_1205(!_loc3_.selected);
            } else {
                var _loc4_: * = !_loc3_.selected;
                _loc3_.selected = !_loc3_.selected;
                _loc2_.selected = _loc4_;
            }
            sendNotification(BattleStationNotification.const_1455);
        }
    }

    private function method_1205(param1: Boolean): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        for (_loc2_ in this.var_1854) {
            _loc3_ = this.var_1854[_loc2_];
            class_2675(_loc2_).selected = _loc3_.selected = param1;
        }
    }

    private function closeWindowClickHandler(param1: Event = null): void {
        facade.removeMediator(NAME);
    }

    protected function get method_897(): BattleStationProxy {
        return facade.retrieveProxy(BattleStationProxy.NAME) as BattleStationProxy;
    }

    protected function get view(): class_137 {
        return viewComponent as class_137;
    }
}
}
