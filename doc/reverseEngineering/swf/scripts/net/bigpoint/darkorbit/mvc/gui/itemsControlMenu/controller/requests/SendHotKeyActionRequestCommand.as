package net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.controller.requests {

import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.ItemsControlMenuConstants;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.ItemsControlMenuProxy;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.vo.ItemVO;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.ItemsControlMenuMediator;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_38.class_757;

import package_84.class_243;

public class SendHotKeyActionRequestCommand extends class_243 {


    public function SendHotKeyActionRequestCommand() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc5_: int = 0;
        var _loc6_: * = null;
        var _loc2_: int = int(param1.getBody());
        var _loc3_: String = param1.getType();
        var _loc4_: ItemVO;
        if (_loc4_ = this.menuMediator.getItemVOBySlotId(_loc2_, _loc3_)) {
            switch (_loc4_.actionStyle) {
                case ItemsControlMenuConstants.ACTION_SELECTION:
                    _loc5_ = 0;
                    break;
                case ItemsControlMenuConstants.ACTION_TOOGLE:
                    _loc5_ = 0;
                    break;
                case ItemsControlMenuConstants.ACTION_ONE_SHOT:
                    _loc5_ = 0;
            }
            _loc6_ = new class_757(_loc4_.id, _loc5_, class_757.const_2628);
            connectionProxy.connectionManager.sendRequest(_loc6_);
        }
    }

    private function get menuMediator(): ItemsControlMenuMediator {
        return facade.retrieveMediator(ItemsControlMenuMediator.NAME) as ItemsControlMenuMediator;
    }

    private function get menuProxy(): ItemsControlMenuProxy {
        return facade.retrieveProxy(ItemsControlMenuProxy.NAME) as ItemsControlMenuProxy;
    }
}
}
