package net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view {

import flash.events.Event;
import flash.utils.Dictionary;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_81;
import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;
import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
import net.bigpoint.darkorbit.mvc.gui.abstract.view.AbstractMenuMediator;
import net.bigpoint.darkorbit.mvc.gui.highlights.HighLightItemNotification;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.ItemsControlMenuConstants;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.ItemsControlMenuNotifications;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.ItemsControlMenuProxy;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.ItemsControlMenu;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.elements.slotAndItemElement.SlotAndItemBarElement;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.menuBar.MenuBar;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.menuBar.actionButtons.BuyButton;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.menuBar.actionButtons.CategoryButton;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.menuBar.actionButtons.ProActionBarToggleButton;
import net.bigpoint.darkorbit.settings.Settings;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_11.class_39;

import package_141.class_2008;

import package_242.DragEvent;

import package_38.class_675;

public class MenuBarsMediator extends AbstractMenuMediator {

    public static const NAME: String = "ActionButtonsMediator";


    public function MenuBarsMediator(param1: ItemsControlMenu, param2: class_39) {
        super(NAME, param1);
        _swfFinisher = param2;
    }

    override public function onRegister(): void {
        super.onRegister();
        method_3041.method_4605(this.view.standardSlotBar, class_88.getItem("httip_quickmenu"), 0, 0, MenuBar.DEFAULT_BAR_WIDTH, true);
    }

    override public function listNotificationInterests(): Array {
        return [ItemsControlMenuNotifications.DATA_READY, ItemsControlMenuNotifications.TOGGLE_CATEGORY_BUTTON, ItemsControlMenuNotifications.TOGGLE_PRO_ACTION_BUTTON, GuiNotifications.MANAGE_MENUS_CONFIG_MODE];
    }

    override public function handleNotification(param1: INotification): void {
        var _loc2_: Boolean = false;
        switch (param1.getName()) {
            case ItemsControlMenuNotifications.DATA_READY:
                this.initBarsMap();
                this.view.standardSlotBar.categoryBtn.visible = true;
                this.view.proActionBar.proActionBarButton.visible = this.menuProxy.proActionSlotBar != null;
                sendNotification(ItemsControlMenuNotifications.UPDATE_MENUS_POSITION, GuiConstants.SET_MENUS_INIT_POSITION);
                break;
            case ItemsControlMenuNotifications.TOGGLE_PRO_ACTION_BUTTON:
                this.view.proActionBar.proActionBarButton.toggle();
                break;
            case ItemsControlMenuNotifications.TOGGLE_CATEGORY_BUTTON:
                this.view.standardSlotBar.categoryBtn.toggle();
            case GuiNotifications.MANAGE_MENUS_CONFIG_MODE:
                _loc2_ = Boolean(param1.getBody());
                this.manageConfigMode(_loc2_);
        }
    }

    override protected function initBarsMap(): void {
        _menuBars = new <class_2008>[this.view.proActionBar, this.view.premiumSlotBar, this.view.standardSlotBar, this.view.categoryBar];
        _menuBarsMap = new Dictionary();
        _menuBarsMap[this.view.categoryBar] = this.menuProxy.getMenuBarVOById(ItemsControlMenuConstants.CATEGORY_BAR);
        _menuBarsMap[this.view.standardSlotBar] = this.menuProxy.getMenuBarVOById(ItemsControlMenuConstants.STANDARD_SLOT_BAR);
        _menuBarsMap[this.view.premiumSlotBar] = this.menuProxy.getMenuBarVOById(ItemsControlMenuConstants.PREMIUM_SLOT_BAR);
        _menuBarsMap[this.view.proActionBar] = this.menuProxy.getMenuBarVOById(ItemsControlMenuConstants.PRO_ACTION_BAR);
    }

    override protected function addListeners(): void {
        super.addListeners();
        this.view.addEventListener(CategoryButton.CATEGORY_TOOGLE, this.categoryToogleHandler);
        this.view.addEventListener(ProActionBarToggleButton.PRO_ACTION_BAR_TOGGLE, this.proActionBarToggleHandler);
        this.view.addEventListener(BuyButton.BUY_MODE_TOOGLE, this.buyToogleHandler);
    }

    private function categoryToogleHandler(param1: Event): void {
        var _loc3_: * = !this.menuProxy.categoryBarVisible;
        this.menuProxy.categoryBarVisible = !this.menuProxy.categoryBarVisible;
        var _loc2_: Boolean = _loc3_;
        sendNotification(ItemsControlMenuNotifications.TOOGLE_CATEGORY_VISIBILITY, _loc2_);
        if (_loc2_) {
            method_3041.method_4605(this.view.categoryBar, class_88.getItem("httip_mainmenu"), 0, 0, MenuBar.DEFAULT_BAR_WIDTH, true);
        } else {
            sendNotification(HighLightItemNotification.REMOVE_HIGHLIGHT_BY_CATEGORY, ItemsControlMenuConstants.CATEGORY_BAR);
            method_3041.method_4106(this.view.categoryBar);
        }
    }

    private function proActionBarToggleHandler(param1: Event): void {
        var _loc4_: * = !this.menuProxy.proActionBarVisible;
        this.menuProxy.proActionBarVisible = !this.menuProxy.proActionBarVisible;
        var _loc2_: Boolean = _loc4_;
        this.view.proActionBar.barVisibility = _loc2_;
        if (!_loc2_) {
            sendNotification(HighLightItemNotification.REMOVE_HIGHLIGHT_BY_CATEGORY, ItemsControlMenuConstants.PRO_ACTION_BAR);
        }
        var _loc3_: class_675 = new class_675(_loc2_);
        sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST, _loc3_);
    }

    override protected function manageConfigMode(param1: Boolean): void {
        super.manageConfigMode(param1);
        this.toggleCategoryBarInConfigMode(param1);
    }

    override protected function updateLayoutButtonsVisibility(param1: Boolean): void {
        var _loc2_: * = null;
        for each(_loc2_ in menuBars) {
            if (Boolean(class_81.premium.value) && Settings.proActionBarEnabled.value || _loc2_ == this.view.standardSlotBar) {
                this.view.method_4622(param1, _loc2_.dragButton);
                if (_loc2_ != this.view.categoryBar) {
                    this.view.method_4622(param1, _loc2_.rotateButton);
                } else {
                    _loc2_.method_246();
                }
            }
        }
    }

    private function toggleCategoryBarInConfigMode(param1: Boolean): void {
        if (param1 && !this.menuProxy.categoryBarVisible) {
            this.menuProxy.closeCategoryBarOnConfigExit = true;
            this.view.standardSlotBar.categoryBtn.toggle();
            sendNotification(ItemsControlMenuNotifications.TOOGLE_CATEGORY_VISIBILITY, true);
        }
        if (!param1 && this.menuProxy.categoryBarVisible && this.menuProxy.closeCategoryBarOnConfigExit) {
            this.menuProxy.closeCategoryBarOnConfigExit = false;
            this.view.standardSlotBar.categoryBtn.toggle();
            sendNotification(ItemsControlMenuNotifications.TOOGLE_CATEGORY_VISIBILITY, false);
        }
    }

    override protected function barChangeLayout(param1: Event): void {
        super.barChangeLayout(param1);
        sendNotification(ItemsControlMenuNotifications.CHECK_BOUNDS_AND_SAVE_POS);
    }

    override protected function barDragOverHandler(param1: DragEvent): void {
        super.barDragOverHandler(param1);
        sendNotification(ItemsControlMenuNotifications.CHECK_BOUNDS_AND_SAVE_POS);
    }

    private function buyToogleHandler(param1: Event): void {
    }

    protected function get menuProxy(): ItemsControlMenuProxy {
        return facade.retrieveProxy(ItemsControlMenuProxy.NAME) as ItemsControlMenuProxy;
    }

    public function get view(): ItemsControlMenu {
        return viewComponent as ItemsControlMenu;
    }
}
}
