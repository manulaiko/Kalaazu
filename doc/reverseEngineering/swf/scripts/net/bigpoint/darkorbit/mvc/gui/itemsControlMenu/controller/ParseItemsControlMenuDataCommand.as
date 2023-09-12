package net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.controller {

import com.bigpoint.utils.class_73;

import net.bigpoint.darkorbit.mvc.common.utils.ParserUtility;
import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
import net.bigpoint.darkorbit.mvc.gui.abstract.model.vo.AbstractMenuBarVO;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.ItemsControlMenuConstants;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.ItemsControlMenuNotifications;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.ItemsControlMenuProxy;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.vo.ItemTimerVO;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.vo.ItemVO;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.vo.categoryBar.CategoryBarVO;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.vo.categoryBar.CategoryVO;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.vo.slotBar.SlotBarVO;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.vo.slotBar.SlotVO;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_38.class_578;
import package_38.class_635;
import package_38.class_645;
import package_38.class_671;
import package_38.class_758;
import package_38.class_846;

import package_84.class_243;

public class ParseItemsControlMenuDataCommand extends class_243 {

    private static const SLOTBAR_SLOTS_NUM: int = 10;


    public function ParseItemsControlMenuDataCommand() {
        super();
    }

    override public function execute(param1: INotification): void {
        this.parseData(param1.getBody() as class_645);
    }

    private function parseData(param1: class_645): void {
        this.menuProxy.menuBars = new Vector.<AbstractMenuBarVO>();
        var _loc2_: * = null;
        this.menuProxy.proActionSlotBar = null;
        this.menuProxy.standartSlotBar = this.menuProxy.premiumSlotBar = _loc2_;
        this.parseCategories(param1);
        this.parseSlotBars(param1.slotBars);
        sendNotification(ItemsControlMenuNotifications.DATA_READY);
    }

    private function parseCategories(param1: class_645): void {
        var _loc2_: * = null;
        var _loc3_: int = 0;
        var _loc4_: int = 0;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        if (param1.categories.length) {
            _loc2_ = new Vector.<CategoryVO>();
            _loc3_ = int(param1.categories.length);
            _loc4_ = 0;
            while (_loc4_ != _loc3_) {
                _loc6_ = param1.categories[_loc4_];
                _loc7_ = new CategoryVO(_loc6_.var_4252, this.createCategoryItem(_loc6_));
                _loc2_.push(_loc7_);
                _loc4_++;
            }
            _loc5_ = ParserUtility.parseStringCords(param1.var_4159)[0];
            this.menuProxy.initCategoryBar(new CategoryBarVO(ItemsControlMenuConstants.CATEGORY_BAR, _loc5_, _loc2_));
        } else if (this.menuProxy.categoryBar) {
            this.menuProxy.menuBars.push(this.menuProxy.categoryBar);
        }
    }

    private function parseSlotBars(param1: Vector.<class_578>): void {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: int = 0;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc10_: * = null;
        var _loc2_: int = param1.length;
        var _loc3_: int = 0;
        while (_loc3_ != _loc2_) {
            _loc4_ = param1[_loc3_];
            _loc5_ = new Vector.<SlotVO>();
            _loc6_ = 1;
            while (_loc6_ <= SLOTBAR_SLOTS_NUM) {
                _loc9_ = this.getSlotInfoCmdBySlotId(_loc4_.var_268, _loc6_);
                _loc10_ = null;
                if (_loc9_) {
                    if (!(_loc10_ = this.menuProxy.getItemVOByItemId(_loc9_.var_2092))) {
                        throw new Error("no ItemVO has been found in categories for menuItemId: " + _loc9_.var_2092);
                    }
                }
                _loc5_.push(new SlotVO(_loc6_, _loc10_, _loc4_.slotBarId));
                _loc6_++;
            }
            _loc7_ = ParserUtility.parseStringCords(_loc4_.var_3106);
            _loc8_ = new SlotBarVO(_loc4_.slotBarId, GuiConstants.LAYOUTS_MAP[int(_loc4_.var_776)], _loc7_, _loc5_, _loc4_.visible);
            switch (_loc4_.slotBarId) {
                case ItemsControlMenuConstants.STANDARD_SLOT_BAR:
                    this.menuProxy.initStandartSlotBar(_loc8_);
                    break;
                case ItemsControlMenuConstants.PREMIUM_SLOT_BAR:
                    this.menuProxy.initPremiumSlotBar(_loc8_);
                    break;
                case ItemsControlMenuConstants.PRO_ACTION_BAR:
                    this.menuProxy.initProActionSlotBar(_loc8_);
                    break;
            }
            _loc3_++;
        }
    }

    private function getSlotInfoCmdBySlotId(param1: Vector.<class_671>, param2: int): class_671 {
        var _loc5_: * = null;
        var _loc3_: int = param1.length;
        var _loc4_: int = 0;
        while (_loc4_ != _loc3_) {
            if ((_loc5_ = param1[_loc4_]).slotId == param2) {
                return _loc5_;
            }
            _loc4_++;
        }
        return null;
    }

    private function createCategoryItem(param1: class_635): Vector.<ItemVO> {
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc2_: int = int(param1.var_805.length);
        var _loc3_: Vector.<ItemVO> = new Vector.<ItemVO>();
        var _loc4_: int = 0;
        while (_loc4_ != _loc2_) {
            _loc6_ = (_loc5_ = param1.var_805[_loc4_]).status;
            _loc7_ = ItemVO.parse(_loc6_, ItemsControlMenuConstants.COUNTER_TYPES_MAP[_loc5_.counterType], ItemsControlMenuConstants.ACTION_STYLES_MAP[_loc5_.actionStyle], ItemTimerVO.parseTimer(_loc5_.timer), _loc5_.var_1245.var_2008);
            _loc3_.push(_loc7_);
            _loc4_++;
        }
        return _loc3_;
    }

    private function get menuProxy(): ItemsControlMenuProxy {
        return facade.retrieveProxy(ItemsControlMenuProxy.NAME) as ItemsControlMenuProxy;
    }
}
}
