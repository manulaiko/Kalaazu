package net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.controller.updates {

import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.ItemsControlMenuProxy;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.vo.ItemTimerVO;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.vo.ItemVO;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.vo.categoryBar.CategoryVO;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.ItemsControlMenuMediator;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.elements.slotAndItemElement.SlotAndItemBarElement;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_38.class_555;

import package_84.class_243;

public class UpdateMenuItemTimerCommand extends class_243 {


    public function UpdateMenuItemTimerCommand() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        var _loc2_: class_555 = param1.getBody() as class_555;
        if (this.menuProxy) {
            this.updateModel(_loc2_);
            this.updateView(_loc2_);
        }
    }

    public function updateModel(param1: class_555): void {
        var _loc2_: int = 0;
        var _loc3_: int = 0;
        var _loc4_: * = null;
        var _loc5_: int = 0;
        var _loc6_: int = 0;
        var _loc7_: * = null;
        var _loc8_: * = null;
        if (this.menuProxy.categoryBar) {
            _loc2_ = this.menuProxy.categoryBar.categories.length;
            _loc3_ = 0;
            while (_loc3_ != _loc2_) {
                _loc5_ = (_loc4_ = this.menuProxy.categoryBar.categories[_loc3_]).items.length;
                _loc6_ = 0;
                while (_loc6_ != _loc5_) {
                    if ((_loc7_ = _loc4_.items[_loc6_]).id == param1.var_2092) {
                        _loc8_ = ItemTimerVO.parseTimer(param1);
                        _loc4_.items[_loc6_].activatable = param1.activatable;
                        _loc4_.items[_loc6_].timerVO = _loc8_;
                    }
                    _loc6_++;
                }
                _loc3_++;
            }
        }
    }

    private function updateView(param1: class_555): void {
        var _loc5_: * = null;
        var _loc2_: String = param1.var_2092;
        var _loc3_: SlotAndItemBarElement = this.menuMediator.getSlotAndItemBarElementById(_loc2_);
        if (_loc3_) {
            _loc3_.updateTimerAndActivatable();
        }
        var _loc4_: Vector.<SlotAndItemBarElement> = this.menuMediator.getSlotBarsItemElementsById(_loc2_);
        for each(_loc5_ in _loc4_) {
            _loc5_.updateTimerAndActivatable();
        }
    }

    private function get menuMediator(): ItemsControlMenuMediator {
        return facade.retrieveMediator(ItemsControlMenuMediator.NAME) as ItemsControlMenuMediator;
    }

    protected function get menuProxy(): ItemsControlMenuProxy {
        return facade.retrieveProxy(ItemsControlMenuProxy.NAME) as ItemsControlMenuProxy;
    }
}
}
