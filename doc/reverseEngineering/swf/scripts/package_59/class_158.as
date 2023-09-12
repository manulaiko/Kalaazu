package package_59 {

import mx.collections.ArrayCollection;
import mx.events.PropertyChangeEvent;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_81;
import net.bigpoint.darkorbit.gui.windows.class_57;
import net.bigpoint.darkorbit.mvc.battlestationswindow.class_1023;
import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;
import net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase;
import net.bigpoint.darkorbit.mvc.common.view.components.DOWindow;

import package_150.class_988;

import package_155.class_998;
import package_155.class_999;

import package_162.class_1016;

import package_163.class_1017;
import package_163.class_1018;

import package_164.class_1020;

import package_165.class_1022;

import package_166.class_1026;

import package_17.class_62;

import package_38.class_191;
import package_38.class_683;

import package_50.class_140;
import package_50.class_144;
import package_50.class_147;
import package_50.class_148;

import spark.components.Label;
import spark.components.VGroup;

public class class_158 extends DOWindow {

    public static var var_4374: String = "AsteroidMode";

    public static var var_676: String = "BattleStationMode";

    private static var var_722: int = 510;

    private static var var_4327: int = 655;

    public static const const_2365: Object = {
        "AsteroidMode": var_722,
        "BattleStationMode": var_4327
    };


    private var var_122: String;

    public var handler: class_1024;

    private var var_3976: class_1020;

    private var var_4852: class_1016;

    private var var_3363: class_1022;

    private var var_1875: class_1026;

    private var var_1596: VGroup;

    private var var_1442: DOButtonBase;

    private var var_3725: Label;

    protected var var_1874: int;

    public var var_4502: String;

    private var var_4639: int;

    private var var_1018: class_1017;

    private var var_1916: class_1017;

    public function class_158() {
        this.var_1874 = const_2365[var_4374];
        super();
    }

    public function method_453(): void {
        this.moduleInstallationView.addEventListener(class_988.EQUIP_MODULE, this.method_1907);
        this.moduleInstallationView.addEventListener(class_988.BATTLE_STATION_MODULE_CLICKED, this.method_3182);
        this.moduleInstallationView.addEventListener(class_988.CONFIRM_BTN_CLICKED, this.method_2236);
        resizeHandle.visible = false;
        this.moduleInventoryView.method_3558 = true;
        this.oreTradeTitle.text = class_88.getItem("title_trade");
        this.oreTradeButton.label = class_88.getItem("sta_rohstoff_lowercase");
    }

    private function method_3182(param1: class_988): void {
        switch (this.var_4502) {
            case var_4374:
                this.method_5219(param1.itemId, param1.slotId, param1.moduleType);
                break;
            case var_676:
                this.method_6025(param1.itemId, param1.slotId, param1.moduleType, param1.moduleItem);
        }
    }

    private function method_6151(param1: class_988): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        if (class_81.var_3732 >= param1.moduleItem.moduleVO.name_30) {
            this.handler.method_2717(this.var_4639, param1.slotId);
        } else {
            _loc2_ = class_147(class_57.getInstance().createWindow(class_57.const_716));
            _loc2_.title = class_88.getItem("popup_bswin_title_error_message");
            _loc3_ = class_88.getItem(class_1023.const_2968[class_683.const_1812]);
            _loc2_.method_4130(_loc3_);
        }
    }

    public function method_5156(param1: String): void {
        switch (param1) {
            case var_4374:
                this.installationStatusView.visible = true;
                this.installationStatusView.addEventListener(class_988.SHOW_BUILD_TIME_SELECTION_POPUP, this.method_2763);
                this.ratingsView.visible = false;
                this.var_4502 = var_4374;
                title = class_88.getItem("title_bswin_installation");
                break;
            case var_676:
                this.installationStatusView.visible = false;
                this.ratingsView.visible = true;
                this.ratingsView.addEventListener(class_988.SHOW_DEFLECTOR_DEACTIVATION_POPUP, this.method_6108);
                this.var_4502 = var_676;
                title = class_88.getItem("title_bswin_management");
        }
        this._windowHeight = false || false;
    }

    private function method_1907(param1: class_988): void {
        this.handler.method_469(this.var_4639, param1.slotId, param1.itemId, param1.var_1959);
    }

    private function method_222(param1: class_988): void {
        this.handler.method_1367(this.var_4639, param1.var_381);
    }

    private function method_5(param1: class_988): void {
        this.handler.method_951(this.var_4639, param1.var_381);
    }

    public function method_5336(param1: class_1018, param2: ArrayCollection, param3: class_1017): void {
        var _loc4_: Boolean = false;
        this.var_4639 = param1.var_1529;
        this.var_122 = param1.var_2469;
        this.title = this.var_122;
        this.moduleInventoryView.method_3785(param2);
        if (param1 != null) {
            this.moduleInstallationView.method_2982(class_998.INSTALLING_STATE, param1.modules);
            _loc4_ = param1.var_3060 == false && param1.var_3652 == 1;
            this.installationStatusView.setData(param1.var_3652, param1.var_4415, param1.var_3060, param1.var_740, param1.owningClanName, _loc4_);
        }
        this.var_1018 = param3;
        this.oreTradeSection.visible = param1.state == class_1018.const_1368;
    }

    public function method_4436(param1: class_1018, param2: ArrayCollection, param3: class_1017, param4: Boolean = true): void {
        this.var_4639 = param1.var_1529;
        this.var_122 = param1.var_2469;
        this.title = this.var_122;
        if (param4) {
            this.moduleInventoryView.method_3785(param2);
        }
        if (param1 != null) {
            this.moduleInstallationView.method_2982(class_998.INSTALLED_STATE, param1.modules);
            this.ratingsView.method_5495 = param1;
        }
        this.var_1916 = param3;
        this.oreTradeButton.enabled = param1.var_1094;
        this.oreTradeSection.visible = param1.state == class_1018.const_1368;
    }

    private function method_5219(param1: int, param2: int, param3: int, param4: class_999 = null): void {
        var _loc5_: class_140;
        (_loc5_ = class_140(class_57.getInstance().createWindow(class_57.const_2120))).var_820 = param2;
        _loc5_.var_3884 = param1;
        _loc5_.var_1050 = param3;
        _loc5_.title = class_88.getItem("popup_bswin_title_confirm_module_removal");
        _loc5_.method_4022(class_88.getItem("popup_bswin_message_confirm_module_removal"));
        _loc5_.method_2210(class_88.getItem("popup_bswin_btn_confirm_module_removal"), class_88.getItem("popup_bswin_btn_cancel_module_removal"));
        _loc5_.addEventListener(class_988.CONFIRM_BTN_CLICKED, this.method_2236);
    }

    private function method_2236(param1: class_988): void {
        this.handler.method_4317(this.var_4639, param1.itemId);
    }

    private function method_6025(param1: int, param2: int, param3: int, param4: class_999): void {
        var _loc5_: class_148;
        (_loc5_ = class_148(class_57.getInstance().createWindow(class_57.const_3015))).slotId = param2;
        _loc5_.itemId = param1;
        _loc5_.moduleType = param3;
        _loc5_.moduleItem = param4;
        _loc5_.title = param4.method_3247;
        var _loc6_: String = class_88.getItem("popup_bswin_message_repair_module");
        _loc5_.method_4130(_loc6_, class_88.getItem("popup_bswin_title_repair_module"));
        _loc5_.method_4503(String(param4.moduleVO.name_30) + " U.");
        _loc5_.method_5659(class_88.getItem("popup_bswin_activation_btn_repair_module"));
        _loc5_.addEventListener(class_988.ACTIVATE_BUTTON_CLICKED, this.method_6151);
    }

    public function method_2763(param1: class_988): void {
        var _loc2_: class_144 = class_144(class_57.getInstance().createWindow(class_57.const_2902));
        _loc2_.method_442(this.var_1018.min, this.var_1018.max, this.var_1018.method_1398, this.var_1018.increment);
        _loc2_.title = this.var_122;
        var _loc3_: String = class_88.getItem("popup_bswin_message_choose_build_time");
        _loc3_ = _loc3_.replace("%VALUE%", this.var_1018.min);
        _loc3_ = _loc3_.replace("%VALUE%", this.var_1018.max);
        _loc2_.height = 190;
        _loc2_.method_4130(_loc3_);
        _loc2_.method_5659(class_88.getItem("popup_bswin_btn_confirm_module_removal"), class_88.getItem("popup_bswin_btn_cancel_module_removal"));
        _loc2_.addEventListener(class_988.const_1634, this.method_5);
    }

    private function method_6108(param1: class_988): void {
        var _loc2_: class_144 = class_144(class_57.getInstance().createWindow(class_57.const_2902));
        _loc2_.method_442(this.var_1916.min, this.var_1916.max, this.var_1916.method_1398, this.var_1916.increment);
        _loc2_.title = this.var_122;
        _loc2_.height = 175;
        _loc2_.method_4130(class_88.getItem("popup_bswin_title_deactivate_deflector"));
        _loc2_.method_5659(class_88.getItem("popup_bswin_btn_deactivate_deflector"), class_88.getItem("popup_bswin_btn_cancel_module_removal"));
        _loc2_.addEventListener(class_988.const_1634, this.method_222);
    }

    public function method_2348(param1: int): void {
        var _loc2_: class_147 = class_147(class_57.getInstance().createWindow(class_57.const_716));
        _loc2_.title = class_88.getItem("popup_bswin_title_error_message");
        var _loc3_: String = class_88.getItem(class_1023.const_2968[param1]);
        _loc2_.method_4130(_loc3_);
    }

    public function method_4164(param1: Number): void {
        this.installationStatusView.yourClanProgress.setProgress(param1, 100);
    }

    public function method_910(param1: Number): void {
        this.installationStatusView.yourClanProgress.setProgress(param1, 100);
    }

    protected function method_2013(): void {
        var _loc1_: class_191 = new class_191();
        class_62.getInstance().sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST, _loc1_);
    }

    [Bindable(event="propertyChange")]
    public function get moduleInventoryView(): class_1020 {
        return this.var_3976;
    }

    public function set moduleInventoryView(param1: class_1020): void {
        var _loc2_: Object = this.var_3976;
        if (_loc2_ !== param1) {
            this.var_3976 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moduleInventoryView", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get moduleInstallationView(): class_1016 {
        return this.var_4852;
    }

    public function set moduleInstallationView(param1: class_1016): void {
        var _loc2_: Object = this.var_4852;
        if (_loc2_ !== param1) {
            this.var_4852 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moduleInstallationView", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get installationStatusView(): class_1022 {
        return this.var_3363;
    }

    public function set installationStatusView(param1: class_1022): void {
        var _loc2_: Object = this.var_3363;
        if (_loc2_ !== param1) {
            this.var_3363 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "installationStatusView", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get ratingsView(): class_1026 {
        return this.var_1875;
    }

    public function set ratingsView(param1: class_1026): void {
        var _loc2_: Object = this.var_1875;
        if (_loc2_ !== param1) {
            this.var_1875 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ratingsView", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get oreTradeSection(): VGroup {
        return this.var_1596;
    }

    public function set oreTradeSection(param1: VGroup): void {
        var _loc2_: Object = this.var_1596;
        if (_loc2_ !== param1) {
            this.var_1596 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "oreTradeSection", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get oreTradeButton(): DOButtonBase {
        return this.var_1442;
    }

    public function set oreTradeButton(param1: DOButtonBase): void {
        var _loc2_: Object = this.var_1442;
        if (_loc2_ !== param1) {
            this.var_1442 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "oreTradeButton", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get oreTradeTitle(): Label {
        return this.var_3725;
    }

    public function set oreTradeTitle(param1: Label): void {
        var _loc2_: Object = this.var_3725;
        if (_loc2_ !== param1) {
            this.var_3725 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "oreTradeTitle", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    protected function get _windowHeight(): int {
        return this.var_1874;
    }

    protected function set _windowHeight(param1: int): void {
        var _loc2_: Object = this.var_1874;
        if (_loc2_ !== param1) {
            this.var_1874 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_windowHeight", _loc2_, param1));
            }
        }
    }
}
}
