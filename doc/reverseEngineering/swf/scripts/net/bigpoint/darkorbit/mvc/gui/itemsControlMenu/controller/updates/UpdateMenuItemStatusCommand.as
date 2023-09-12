package net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.controller.updates {

import net.bigpoint.darkorbit.mvc.common.utils.TextUtils;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.ItemsControlMenuConstants;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.ItemsControlMenuProxy;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.vo.ItemVO;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.vo.categoryBar.CategoryVO;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.ItemsControlMenuMediator;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.elements.slotAndItemElement.SlotAndItemBarElement;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_38.class_758;

import package_84.class_243;

public class UpdateMenuItemStatusCommand extends class_243 {


    public function UpdateMenuItemStatusCommand() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: class_758 = param1.getBody() as class_758;
        if (this.menuProxy) {
            this.updateModel(_loc2_);
            this.updateView(_loc2_.var_2092);
        }
    }

    public function updateModel(param1: class_758): void {
        var _loc2_: int = 0;
        var _loc3_: int = 0;
        var _loc4_: * = null;
        var _loc5_: int = 0;
        var _loc6_: int = 0;
        var _loc7_: * = null;
        var _loc8_: * = null;
        if (Boolean(this.menuProxy.categoryBar) && Boolean(this.menuProxy.categoryBar.categories)) {
            _loc2_ = this.menuProxy.categoryBar.categories.length;
            _loc3_ = 0;
            while (_loc3_ != _loc2_) {
                _loc5_ = (_loc4_ = this.menuProxy.categoryBar.categories[_loc3_]).items.length;
                _loc6_ = 0;
                while (_loc6_ != _loc5_) {
                    if ((_loc7_ = _loc4_.items[_loc6_]).id == param1.var_2092) {
                        _loc8_ = ItemVO.parse(param1, _loc7_.counterType, _loc7_.actionStyle, _loc7_.timerVO, _loc7_.cooldownGroupType);
                        _loc4_.items[_loc6_] = _loc8_;
                    }
                    _loc6_++;
                }
                _loc3_++;
            }
        }
    }

    private function updateView(param1: String): void {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc2_: SlotAndItemBarElement = this.menuMediator.getSlotAndItemBarElementById(param1);
        var _loc3_: ItemVO = this.menuProxy.getItemVOByItemId(param1);
        if (_loc3_) {
            if (_loc2_) {
                _loc2_.setData(_loc3_, assetsProxy.getBitmapDataFromAtlas(_loc3_.iconLootId, ItemsControlMenuConstants.ICONS_BITMAP_ATLAS), TextUtils.getTooltipText(_loc3_.toolTipItemBar));
            }
            _loc4_ = this.menuMediator.getSlotBarsItemElementsById(param1);
            for each(_loc5_ in _loc4_) {
                _loc5_.setData(_loc3_, assetsProxy.getBitmapDataFromAtlas(_loc3_.iconLootId, ItemsControlMenuConstants.ICONS_BITMAP_ATLAS), TextUtils.getTooltipText(_loc3_.toolTipSlotBar));
            }
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
