package net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model {

import net.bigpoint.darkorbit.mvc.gui.abstract.model.AbstractMenuProxy;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.vo.ItemVO;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.vo.categoryBar.CategoryBarVO;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.vo.categoryBar.CategoryVO;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.vo.slotBar.SlotBarVO;

import org.puremvc.as3.multicore.interfaces.IProxy;

import package_38.class_757;

public class ItemsControlMenuProxy extends AbstractMenuProxy implements IProxy {

    public static const NAME: String = "ItemsControlMenuProxy";


    private var _categoryBarVisible: Boolean;

    private var _proActionBarVisible: Boolean = true;

    private var _closeCategoryBarOnConfigExit: Boolean;

    private var _configMode: Boolean;

    private var _categoryBar: CategoryBarVO;

    private var _standartSlotBar: SlotBarVO;

    private var _premiumSlotBar: SlotBarVO;

    private var _proActionSlotBar: SlotBarVO;

    public function ItemsControlMenuProxy() {
        super(NAME);
    }

    public function initCategoryBar(param1: CategoryBarVO): void {
        _menuBars.push(this._categoryBar = param1);
    }

    public function initStandartSlotBar(param1: SlotBarVO): void {
        _menuBars.push(this._standartSlotBar = param1);
    }

    public function initPremiumSlotBar(param1: SlotBarVO): void {
        _menuBars.push(this._premiumSlotBar = param1);
    }

    public function initProActionSlotBar(param1: SlotBarVO): void {
        _menuBars.push(this._proActionSlotBar = param1);
    }

    public function sendActionRequest(param1: class_757): void {
        connectionProxy.connectionManager.sendRequest(param1);
    }

    public function getItemVOByItemId(param1: String): ItemVO {
        var _loc2_: int = 0;
        var _loc3_: int = 0;
        var _loc4_: * = null;
        var _loc5_: int = 0;
        var _loc6_: int = 0;
        var _loc7_: * = null;
        if (Boolean(this._categoryBar) && Boolean(this._categoryBar.categories)) {
            _loc2_ = this._categoryBar.categories.length;
            _loc3_ = 0;
            while (_loc3_ != _loc2_) {
                _loc5_ = (_loc4_ = this._categoryBar.categories[_loc3_]).items.length;
                _loc6_ = 0;
                while (_loc6_ != _loc5_) {
                    if ((_loc7_ = _loc4_.items[_loc6_]).id == param1) {
                        return _loc7_;
                    }
                    _loc6_++;
                }
                _loc3_++;
            }
        }
        return null;
    }

    public function getCategoryIdByItemVO(param1: ItemVO): String {
        var _loc4_: * = null;
        var _loc2_: int = this._categoryBar.categories.length;
        var _loc3_: int = 0;
        while (_loc3_ != _loc2_) {
            if ((_loc4_ = this._categoryBar.categories[_loc3_]).items.indexOf(param1) != -1) {
                return _loc4_.id;
            }
            _loc3_++;
        }
        return null;
    }

    public function getItemBarItems(param1: String): Vector.<ItemVO> {
        var _loc2_: int = this._categoryBar.categories.length;
        var _loc3_: int = 0;
        while (_loc3_ != _loc2_) {
            if (this._categoryBar.categories[_loc3_].id == param1) {
                return this._categoryBar.categories[_loc3_].items;
            }
            _loc3_++;
        }
        return null;
    }

    public function get categoryBarVisible(): Boolean {
        return this._categoryBarVisible;
    }

    public function set categoryBarVisible(param1: Boolean): void {
        this._categoryBarVisible = param1;
    }

    public function get proActionBarVisible(): Boolean {
        return this._proActionBarVisible;
    }

    public function set proActionBarVisible(param1: Boolean): void {
        this._proActionBarVisible = param1;
    }

    public function get configMode(): Boolean {
        return this._configMode;
    }

    public function set configMode(param1: Boolean): void {
        this._configMode = param1;
    }

    public function get closeCategoryBarOnConfigExit(): Boolean {
        return this._closeCategoryBarOnConfigExit;
    }

    public function set closeCategoryBarOnConfigExit(param1: Boolean): void {
        this._closeCategoryBarOnConfigExit = param1;
    }

    public function get categoryBar(): CategoryBarVO {
        return this._categoryBar;
    }

    public function get standartSlotBar(): SlotBarVO {
        return this._standartSlotBar;
    }

    public function get premiumSlotbar(): SlotBarVO {
        return this._premiumSlotBar;
    }

    public function get proActionSlotBar(): SlotBarVO {
        return this._proActionSlotBar;
    }

    public function set categoryBar(param1: CategoryBarVO): void {
        this._categoryBar = param1;
    }

    public function set standartSlotBar(param1: SlotBarVO): void {
        this._standartSlotBar = param1;
    }

    public function set premiumSlotBar(param1: SlotBarVO): void {
        this._premiumSlotBar = param1;
    }

    public function set proActionSlotBar(param1: SlotBarVO): void {
        this._proActionSlotBar = param1;
    }
}
}
