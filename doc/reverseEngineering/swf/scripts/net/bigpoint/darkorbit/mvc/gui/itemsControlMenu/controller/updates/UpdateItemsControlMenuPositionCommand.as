package net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.controller.updates {

import com.bigpoint.utils.class_73;

import net.bigpoint.darkorbit.mvc.common.utils.ScreenScaleUtils;
import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
import net.bigpoint.darkorbit.mvc.gui.abstract.controller.MenuPositionsAbstractCommand;
import net.bigpoint.darkorbit.mvc.gui.abstract.model.AbstractMenuProxy;
import net.bigpoint.darkorbit.mvc.gui.abstract.view.AbstractMenuMediator;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.ItemsControlMenuConstants;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.ItemsControlMenuProxy;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.vo.slotBar.SlotBarVO;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.MenuBarsMediator;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.ItemsControlMenu;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.elements.slotAndItemElement.SlotAndItemBarElement;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.menuBar.MenuBar;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_103.class_2007;

import package_141.class_2008;

import package_9.class_50;

public class UpdateItemsControlMenuPositionCommand extends MenuPositionsAbstractCommand {


    public function UpdateItemsControlMenuPositionCommand() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: * = null;
        if (this.menuProxy.menuBars) {
            _loc2_ = String(param1.getBody());
            switch (_loc2_) {
                case GuiConstants.SET_MENUS_INIT_POSITION:
                    setInitBarPosition(this.itemControlMenu.categoryBar);
                    this.setInitSlotBarPosition(this.itemControlMenu.standardSlotBar);
                    this.setInitSlotBarPosition(this.itemControlMenu.proActionBar);
                    this.setInitSlotBarPosition(this.itemControlMenu.premiumSlotBar);
                    break;
                case GuiConstants.CONFIG_RESET_AND_EXIT:
                    this.resetAllBarsPositions();
                    break;
                default:
                    this.updateMenuPosistions();
            }
        }
    }

    private function setInitSlotBarPosition(param1: MenuBar): void {
        var _loc2_: SlotBarVO = this.menuMediator.menuBarsMap[param1] as SlotBarVO;
        if (_loc2_) {
            if (Boolean(_loc2_.stickOffset.x) || Boolean(_loc2_.stickOffset.y)) {
                setBarPositionAndLayout(param1, this.itemControlMenu.categoryBar.x + _loc2_.stickOffset.x, this.itemControlMenu.categoryBar.y + _loc2_.stickOffset.y, class_2007.method_3824(_loc2_.layoutId));
            } else {
                setInitBarPosition(param1);
            }
        }
    }

    private function updateMenuPosistions(): void {
        var _loc1_: MenuBar = this.itemControlMenu.categoryBar;
        var _loc2_: class_73 = new class_73(_loc1_.boundsWidth, _loc1_.boundsHeight);
        var _loc3_: class_73 = new class_73(_loc1_.x, _loc1_.y);
        updateBarPosition(_loc1_);
        var _loc4_: class_73 = new class_73(_loc1_.x, _loc1_.y);
        this.updateSlotBarPosition(this.itemControlMenu.standardSlotBar, _loc2_, _loc3_, _loc4_);
        this.updateSlotBarPosition(this.itemControlMenu.proActionBar, _loc2_, _loc3_, _loc4_);
        this.updateSlotBarPosition(this.itemControlMenu.premiumSlotBar, _loc2_, _loc3_, _loc4_);
    }

    private function updateSlotBarPosition(param1: MenuBar, param2: class_73, param3: class_73, param4: class_73): void {
        var _loc5_: class_73 = new class_73(param1.boundsWidth, param1.boundsHeight);
        var _loc6_: class_73;
        if (_loc6_ = ScreenScaleUtils.getStickedBarOffset(new class_73(param1.x, param1.y), _loc5_, param3, param2)) {
            updateBarStickOffset(param1, _loc6_);
            param1.x = param4.x + _loc6_.x;
            param1.y = param4.y + _loc6_.y;
        } else {
            updateBarStickOffset(param1, new class_73());
            updateBarPosition(param1);
        }
    }

    private function resetAllBarsPositions(): void {
        var _loc5_: * = null;
        var _loc1_: Number = (0 - 0) / 0;
        var _loc2_: Number = 0 * _loc1_;
        var _loc3_: * = stageWidth - 0 >> 1;
        var _loc4_: int = stageHeight - _loc2_;
        for each(_loc5_ in this.menuMediator.menuBars) {
            _loc4_ -= 0;
            resetBarPosition(_loc5_, new class_73(_loc3_, _loc4_));
        }
    }

    override protected function get menuProxy(): AbstractMenuProxy {
        return retrieveProxy(ItemsControlMenuProxy.NAME) as AbstractMenuProxy;
    }

    protected function get itemControlMenu(): ItemsControlMenu {
        return (this.menuMediator as MenuBarsMediator).view;
    }

    override protected function get menuMediator(): AbstractMenuMediator {
        return retrieveMediator(MenuBarsMediator.NAME) as AbstractMenuMediator;
    }
}
}
