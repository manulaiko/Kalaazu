package net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.controller.requests {

import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.ItemsControlMenuConstants;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.ItemsControlMenuProxy;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.vo.ItemVO;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.vo.MenuActionRequestVO;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_38.class_757;

import package_84.class_243;

public class SendMenuActionRequestCommand extends class_243 {


    public function SendMenuActionRequestCommand() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc4_: int = 0;
        var _loc2_: MenuActionRequestVO = param1.getBody() as MenuActionRequestVO;
        var _loc3_: ItemVO = _loc2_.itemVO;
        switch (_loc3_.actionStyle) {
            case ItemsControlMenuConstants.ACTION_SELECTION:
                if (_loc2_.doubleClick || _loc2_.barId != ItemsControlMenuConstants.CATEGORY_BAR) {
                    _loc4_ = 0;
                    break;
                }
                _loc4_ = 0;
                break;
            case ItemsControlMenuConstants.ACTION_TOOGLE:
                _loc4_ = 0;
                break;
            case ItemsControlMenuConstants.ACTION_ONE_SHOT:
                _loc4_ = 0;
        }
        var _loc5_: int = _loc2_.barId == ItemsControlMenuConstants.CATEGORY_BAR ? 0 : int(class_757.const_2628);
        var _loc6_: class_757 = new class_757(_loc2_.itemVO.id, _loc4_, _loc5_);
        connectionProxy.connectionManager.sendRequest(_loc6_);
    }

    private function get menuProxy(): ItemsControlMenuProxy {
        return facade.retrieveProxy(ItemsControlMenuProxy.NAME) as ItemsControlMenuProxy;
    }
}
}
