package package_160 {

import flash.display.BitmapData;
import flash.utils.getDefinitionByName;

import mx.binding.Binding;
import mx.binding.BindingManager;
import mx.binding.IBindingClient;
import mx.binding.IWatcherSetupUtil2;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IFlexModuleFactory;
import mx.core.UIComponent;
import mx.core.mx_internal;
import mx.events.PropertyChangeEvent;
import mx.events.ToolTipEvent;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.mvc.common.view.components.DOHtmlTooltip;
import net.bigpoint.darkorbit.mvc.sectorControlWindow.view.class_265;

import package_38.class_439;
import package_38.class_479;
import package_38.class_691;
import package_38.class_946;

import package_76.class_1110;

import package_9.ResourceManager;

import spark.components.Group;
import spark.components.HGroup;
import spark.components.Label;
import spark.components.SkinnableContainer;
import spark.components.VGroup;
import spark.primitives.BitmapImage;

public class class_1014 extends SkinnableContainer implements IBindingClient, class_1013 {

    private static var _watcherSetupUtil: IWatcherSetupUtil2;


    private var var_473: Group;

    private var var_2776: Label;

    private var var_1383: Label;

    private var var_4780: Label;

    private var var_4647: Label;

    private var var_234: Label;

    private var _467213939labelMessage: Label;

    private var var_3116: Label;

    private var var_1373: Label;

    private var var_3255: BitmapImage;

    private var var_1356: BitmapImage;

    private var var_1075: BitmapImage;

    private var var_152: Group;

    private var var_3964: BitmapImage;

    private var var_1069: BitmapImage;

    private var var_615: BitmapImage;

    private var var_3508: Group;

    private var __moduleFactoryInitialized: Boolean = false;

    private var var_854: int = 5;

    mx_internal var _bindings: Array;

    mx_internal var _watchers: Array;

    mx_internal var _bindingsByDestination: Object;

    mx_internal var _bindingsBeginWithWord: Object;

    public function class_1014() {
        var bindings: Array;
        var watchers: Array;
        var var_1: uint;
        var target: Object = null;
        var watcherSetupUtilClass: Object = null;
        this.mx_internal::_bindings = [];
        this.mx_internal::_watchers = [];
        this.mx_internal::_bindingsByDestination = {};
        this.mx_internal::_bindingsBeginWithWord = {};
        super();
        mx_internal::_document = this;
        bindings = this.method_4837();
        watchers = [];
        target = this;
        if (_watcherSetupUtil == null) {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_sectorControlWindow_view_components_SectorControlLobbyWindowMatchDetailsPanelWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }
        _watcherSetupUtil.setup(this, function (param1: String): * {
            return target[param1];
        }, function (param1: String): * {
            return class_1014[param1];
        }, bindings, watchers);
        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
        this.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_1786);
        var_1 = 0;
        while (var_1 < bindings.length) {
            Binding(bindings[var_1]).execute();
            var_1++;
        }
    }

    public static function set watcherSetupUtil(param1: IWatcherSetupUtil2): void {
        class_1014._watcherSetupUtil = param1;
    }

    override public function set moduleFactory(param1: IFlexModuleFactory): void {
        super.moduleFactory = param1;
        if (this.__moduleFactoryInitialized) {
            return;
        }
        this.__moduleFactoryInitialized = true;
    }

    override public function initialize(): void {
        super.initialize();
    }

    public function init(): void {
        this.method_2299();
    }

    private function method_187(param1: ToolTipEvent): void {
        var _loc2_: * = null;
        if (param1.target is UIComponent) {
            _loc2_ = new DOHtmlTooltip();
            _loc2_.htmlText = (param1.target as UIComponent).toolTip;
            param1.toolTip = _loc2_;
        }
    }

    private function method_2299(): void {
        var _loc2_: * = null;
        var _loc1_: BitmapData = ResourceManager.getBitmapData(class_265.name_129, class_265.const_1345);
        this.panelEICBgnd.source = _loc1_;
        this.panelVRUBgnd.source = _loc1_;
        this.panelMMOBgnd.source = _loc1_;
        _loc2_ = ResourceManager.getBitmapData(class_265.name_129, class_265.const_2898);
        this.logoEIC.source = _loc2_;
        _loc2_ = ResourceManager.getBitmapData(class_265.name_129, class_265.const_454);
        this.logoVRU.source = _loc2_;
        _loc2_ = ResourceManager.getBitmapData(class_265.name_129, class_265.const_2424);
        this.logoMMO.source = _loc2_;
    }

    public function update(param1: class_691): void {
        var _loc9_: * = null;
        var _loc10_: * = null;
        var _loc11_: * = null;
        var _loc12_: * = null;
        var _loc13_: * = null;
        var _loc14_: * = null;
        var _loc15_: * = null;
        var _loc16_: * = null;
        var _loc2_: Array = class_126.instance.method_2276;
        var _loc3_: Array = class_126.instance.method_6115;
        var _loc4_: Vector.<class_946> = param1.var_3315;
        var _loc5_: int = 0;
        while (_loc5_ < _loc4_.length) {
            _loc10_ = (_loc9_ = _loc4_[_loc5_]).faction;
            _loc11_ = String(_loc9_.var_4992);
            _loc12_ = class_88.getItem("count_of_total_separator").replace(/%COUNT%/, _loc9_.var_4992).replace(/%TOTAL%/, _loc9_.var_5007);
            _loc13_ = class_88.getItem("ttip_sectorcontrol_ingame_status_tickets").replace(/%FACTION%/, _loc2_[_loc10_.faction] + " " + _loc12_);
            _loc13_ = class_1110.method_5670(_loc3_[_loc10_.faction], _loc13_);
            switch (_loc10_.faction) {
                case class_439.EIC:
                    this.labelEICTicketsValues.text = _loc11_;
                    this.eic_group.toolTip = _loc13_;
                    break;
                case class_439.MMO:
                    this.labelMMOTicketsValues.text = _loc11_;
                    this.mmo_group.toolTip = _loc13_;
                    break;
                case class_439.VRU:
                    this.labelVRUTicketsValues.text = _loc11_;
                    this.vru_group.toolTip = _loc13_;
                    break;
            }
            _loc5_++;
        }
        var _loc6_: Vector.<class_479>;
        var _loc7_: uint = (_loc6_ = param1.var_4832).length;
        var _loc8_: int = 0;
        while (_loc8_ < _loc7_) {
            _loc15_ = (_loc14_ = _loc6_[_loc8_]).faction;
            _loc16_ = class_88.getItem("count_of_total_separator").replace(/%COUNT%/, _loc14_.var_2004).replace(/%TOTAL%/, _loc14_.var_3339);
            switch (_loc15_.faction) {
                case class_439.EIC:
                    this.labelEICPlayersValues.text = _loc16_;
                    break;
                case class_439.MMO:
                    this.labelMMOPlayersValues.text = _loc16_;
                    break;
                case class_439.VRU:
                    this.labelVRUPlayersValues.text = _loc16_;
                    break;
            }
            _loc8_++;
        }
    }

    public function method_3255(param1: Boolean, param2: Boolean): void {
        var _loc3_: * = "";
        if (param1) {
            _loc3_ = class_88.getItem("sectorcontrol_lobby_window_buttonlabel_state_lessplayer_2") + "\n";
        } else if (param2) {
            _loc3_ = class_88.getItem("sectorcontrol_lobby_window_buttonlabel_state_lessplayer_1").replace(/%COUNT%/, this.var_854) + "\n";
        }
        this.labelMessage.text = _loc3_;
    }

    public function method_464(param1: String): void {
        var _loc2_: String = class_88.getItem("sectorcontrol_lobby_window_detailpanel_state_timer_message");
        _loc2_ = _loc2_.replace(class_265.var_3687, param1);
        this.labelMatchRunning.text = _loc2_;
    }

    public function method_3336(): void {
        this.labelMatchRunning.text = "";
    }

    public function method_5275(param1: int): void {
        this.var_854 = param1;
    }

    private function method_1786(): Array {
        return [this.method_862()];
    }

    private function method_862(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.percentWidth = 100;
        _loc1_.top = 12;
        _loc1_.mxmlContent = [this.method_2097(), this.method_67(), this.method_2584(), this.method_4294(), this.method_6280()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_2097(): HGroup {
        var _loc1_: HGroup = new HGroup();
        _loc1_.percentWidth = 100;
        _loc1_.horizontalAlign = "center";
        _loc1_.gap = 10;
        _loc1_.mxmlContent = [this.method_5496(), this.method_5116(), this.method_966()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_5496(): Group {
        var _loc1_: Group = new Group();
        _loc1_.x = 0;
        _loc1_.y = 0;
        _loc1_.width = 132;
        _loc1_.height = 56;
        _loc1_.mxmlContent = [this.method_2274(), this.method_2073(), this.method_3821(), this.method_4757()];
        _loc1_.addEventListener("toolTipCreate", this.method_4533);
        _loc1_.id = "mmo_group";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.mmo_group = _loc1_;
        BindingManager.executeBindings(this, "mmo_group", this.mmo_group);
        return _loc1_;
    }

    private function method_2274(): BitmapImage {
        var _loc1_: BitmapImage = new BitmapImage();
        _loc1_.initialized(this, "panelMMOBgnd");
        this.panelMMOBgnd = _loc1_;
        BindingManager.executeBindings(this, "panelMMOBgnd", this.panelMMOBgnd);
        return _loc1_;
    }

    private function method_2073(): BitmapImage {
        var _loc1_: BitmapImage = new BitmapImage();
        _loc1_.x = 10;
        _loc1_.initialized(this, "logoMMO");
        this.logoMMO = _loc1_;
        BindingManager.executeBindings(this, "logoMMO", this.logoMMO);
        return _loc1_;
    }

    private function method_3821(): Label {
        var _loc1_: Label = new Label();
        _loc1_.x = 64;
        _loc1_.y = 6;
        _loc1_.text = "0";
        _loc1_.width = 66;
        _loc1_.setStyle("textAlign", "center");
        _loc1_.setStyle("fontFamily", "EurostileT");
        _loc1_.id = "labelMMOTicketsValues";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.labelMMOTicketsValues = _loc1_;
        BindingManager.executeBindings(this, "labelMMOTicketsValues", this.labelMMOTicketsValues);
        return _loc1_;
    }

    private function method_4757(): Label {
        var _loc1_: Label = new Label();
        _loc1_.x = 66;
        _loc1_.y = 35;
        _loc1_.text = "0/0";
        _loc1_.width = 64;
        _loc1_.setStyle("textAlign", "center");
        _loc1_.setStyle("fontFamily", "EurostileT");
        _loc1_.id = "labelMMOPlayersValues";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.labelMMOPlayersValues = _loc1_;
        BindingManager.executeBindings(this, "labelMMOPlayersValues", this.labelMMOPlayersValues);
        return _loc1_;
    }

    public function method_4533(param1: ToolTipEvent): void {
        this.method_187(param1);
    }

    private function method_5116(): Group {
        var _loc1_: Group = new Group();
        _loc1_.x = 0;
        _loc1_.y = 0;
        _loc1_.width = 132;
        _loc1_.height = 56;
        _loc1_.mxmlContent = [this.method_5747(), this.method_5837(), this.method_5551(), this.method_6371()];
        _loc1_.addEventListener("toolTipCreate", this.method_3697);
        _loc1_.id = "eic_group";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.eic_group = _loc1_;
        BindingManager.executeBindings(this, "eic_group", this.eic_group);
        return _loc1_;
    }

    private function method_5747(): BitmapImage {
        var _loc1_: BitmapImage = new BitmapImage();
        _loc1_.initialized(this, "panelEICBgnd");
        this.panelEICBgnd = _loc1_;
        BindingManager.executeBindings(this, "panelEICBgnd", this.panelEICBgnd);
        return _loc1_;
    }

    private function method_5837(): BitmapImage {
        var _loc1_: BitmapImage = new BitmapImage();
        _loc1_.x = 9;
        _loc1_.y = 0;
        _loc1_.initialized(this, "logoEIC");
        this.logoEIC = _loc1_;
        BindingManager.executeBindings(this, "logoEIC", this.logoEIC);
        return _loc1_;
    }

    private function method_5551(): Label {
        var _loc1_: Label = new Label();
        _loc1_.x = 66;
        _loc1_.y = 6;
        _loc1_.text = "0";
        _loc1_.width = 64;
        _loc1_.setStyle("textAlign", "center");
        _loc1_.setStyle("fontFamily", "EurostileT");
        _loc1_.id = "labelEICTicketsValues";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.labelEICTicketsValues = _loc1_;
        BindingManager.executeBindings(this, "labelEICTicketsValues", this.labelEICTicketsValues);
        return _loc1_;
    }

    private function method_6371(): Label {
        var _loc1_: Label = new Label();
        _loc1_.x = 66;
        _loc1_.y = 35;
        _loc1_.text = "0/0";
        _loc1_.width = 64;
        _loc1_.setStyle("textAlign", "center");
        _loc1_.setStyle("fontFamily", "EurostileT");
        _loc1_.id = "labelEICPlayersValues";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.labelEICPlayersValues = _loc1_;
        BindingManager.executeBindings(this, "labelEICPlayersValues", this.labelEICPlayersValues);
        return _loc1_;
    }

    public function method_3697(param1: ToolTipEvent): void {
        this.method_187(param1);
    }

    private function method_966(): Group {
        var _loc1_: Group = new Group();
        _loc1_.x = 0;
        _loc1_.y = 0;
        _loc1_.width = 132;
        _loc1_.height = 56;
        _loc1_.mxmlContent = [this.method_1093(), this.method_5366(), this.method_3786(), this.method_476()];
        _loc1_.addEventListener("toolTipCreate", this.method_4414);
        _loc1_.id = "vru_group";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.vru_group = _loc1_;
        BindingManager.executeBindings(this, "vru_group", this.vru_group);
        return _loc1_;
    }

    private function method_1093(): BitmapImage {
        var _loc1_: BitmapImage = new BitmapImage();
        _loc1_.initialized(this, "panelVRUBgnd");
        this.panelVRUBgnd = _loc1_;
        BindingManager.executeBindings(this, "panelVRUBgnd", this.panelVRUBgnd);
        return _loc1_;
    }

    private function method_5366(): BitmapImage {
        var _loc1_: BitmapImage = new BitmapImage();
        _loc1_.x = 8;
        _loc1_.y = 0;
        _loc1_.initialized(this, "logoVRU");
        this.logoVRU = _loc1_;
        BindingManager.executeBindings(this, "logoVRU", this.logoVRU);
        return _loc1_;
    }

    private function method_3786(): Label {
        var _loc1_: Label = new Label();
        _loc1_.x = 66;
        _loc1_.y = 6;
        _loc1_.text = "0";
        _loc1_.width = 64;
        _loc1_.setStyle("textAlign", "center");
        _loc1_.setStyle("fontFamily", "EurostileT");
        _loc1_.id = "labelVRUTicketsValues";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.labelVRUTicketsValues = _loc1_;
        BindingManager.executeBindings(this, "labelVRUTicketsValues", this.labelVRUTicketsValues);
        return _loc1_;
    }

    private function method_476(): Label {
        var _loc1_: Label = new Label();
        _loc1_.x = 66;
        _loc1_.y = 35;
        _loc1_.text = "0/0";
        _loc1_.width = 64;
        _loc1_.setStyle("textAlign", "center");
        _loc1_.setStyle("fontFamily", "EurostileT");
        _loc1_.id = "labelVRUPlayersValues";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.labelVRUPlayersValues = _loc1_;
        BindingManager.executeBindings(this, "labelVRUPlayersValues", this.labelVRUPlayersValues);
        return _loc1_;
    }

    public function method_4414(param1: ToolTipEvent): void {
        this.method_187(param1);
    }

    private function method_67(): Group {
        var _loc1_: Group = new Group();
        _loc1_.width = 10;
        _loc1_.height = 10;
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_2584(): Label {
        var _loc1_: Label = new Label();
        _loc1_.percentWidth = 100;
        _loc1_.y = 20;
        _loc1_.text = "";
        _loc1_.verticalCenter = 0;
        _loc1_.setStyle("verticalAlign", "middle");
        _loc1_.setStyle("textAlign", "center");
        _loc1_.setStyle("fontFamily", "EurostileT");
        _loc1_.id = "labelMatchRunning";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.labelMatchRunning = _loc1_;
        BindingManager.executeBindings(this, "labelMatchRunning", this.labelMatchRunning);
        return _loc1_;
    }

    private function method_4294(): Group {
        var _loc1_: Group = new Group();
        _loc1_.width = 10;
        _loc1_.height = 0;
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_6280(): Label {
        var _loc1_: Label = new Label();
        _loc1_.percentWidth = 100;
        _loc1_.text = "";
        _loc1_.verticalCenter = 0;
        _loc1_.setStyle("verticalAlign", "middle");
        _loc1_.setStyle("textAlign", "center");
        _loc1_.setStyle("fontFamily", "EurostileT");
        _loc1_.id = "labelMessage";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.labelMessage = _loc1_;
        BindingManager.executeBindings(this, "labelMessage", this.labelMessage);
        return _loc1_;
    }

    private function method_4837(): Array {
        var var_5: Array = [];
        var_5[0] = new Binding(this, function (): uint {
            return class_265.const_372;
        }, function (param1: uint): void {
            labelMMOTicketsValues.setStyle("color", param1);
        }, "labelMMOTicketsValues.color");
        var_5[1] = new Binding(this, function (): Number {
            return class_265.const_1889;
        }, function (param1: Number): void {
            labelMMOTicketsValues.setStyle("fontSize", param1);
        }, "labelMMOTicketsValues.fontSize");
        var_5[2] = new Binding(this, function (): uint {
            return class_265.const_1434;
        }, function (param1: uint): void {
            labelMMOPlayersValues.setStyle("color", param1);
        }, "labelMMOPlayersValues.color");
        var_5[3] = new Binding(this, function (): Number {
            return class_265.const_1889;
        }, function (param1: Number): void {
            labelMMOPlayersValues.setStyle("fontSize", param1);
        }, "labelMMOPlayersValues.fontSize");
        var_5[4] = new Binding(this, function (): uint {
            return class_265.const_372;
        }, function (param1: uint): void {
            labelEICTicketsValues.setStyle("color", param1);
        }, "labelEICTicketsValues.color");
        var_5[5] = new Binding(this, function (): Number {
            return class_265.const_1889;
        }, function (param1: Number): void {
            labelEICTicketsValues.setStyle("fontSize", param1);
        }, "labelEICTicketsValues.fontSize");
        var_5[6] = new Binding(this, function (): uint {
            return class_265.const_1434;
        }, function (param1: uint): void {
            labelEICPlayersValues.setStyle("color", param1);
        }, "labelEICPlayersValues.color");
        var_5[7] = new Binding(this, function (): Number {
            return class_265.const_1889;
        }, function (param1: Number): void {
            labelEICPlayersValues.setStyle("fontSize", param1);
        }, "labelEICPlayersValues.fontSize");
        var_5[8] = new Binding(this, function (): uint {
            return class_265.const_372;
        }, function (param1: uint): void {
            labelVRUTicketsValues.setStyle("color", param1);
        }, "labelVRUTicketsValues.color");
        var_5[9] = new Binding(this, function (): Number {
            return class_265.const_1889;
        }, function (param1: Number): void {
            labelVRUTicketsValues.setStyle("fontSize", param1);
        }, "labelVRUTicketsValues.fontSize");
        var_5[10] = new Binding(this, function (): uint {
            return class_265.const_1434;
        }, function (param1: uint): void {
            labelVRUPlayersValues.setStyle("color", param1);
        }, "labelVRUPlayersValues.color");
        var_5[11] = new Binding(this, function (): Number {
            return class_265.const_1889;
        }, function (param1: Number): void {
            labelVRUPlayersValues.setStyle("fontSize", param1);
        }, "labelVRUPlayersValues.fontSize");
        var_5[12] = new Binding(this, function (): uint {
            return class_265.const_10;
        }, function (param1: uint): void {
            labelMatchRunning.setStyle("color", param1);
        }, "labelMatchRunning.color");
        var_5[13] = new Binding(this, function (): Number {
            return class_265.const_384;
        }, function (param1: Number): void {
            labelMatchRunning.setStyle("fontSize", param1);
        }, "labelMatchRunning.fontSize");
        var_5[14] = new Binding(this, function (): uint {
            return class_265.const_1611;
        }, function (param1: uint): void {
            labelMessage.setStyle("color", param1);
        }, "labelMessage.color");
        var_5[15] = new Binding(this, function (): Number {
            return class_265.const_2184;
        }, function (param1: Number): void {
            labelMessage.setStyle("fontSize", param1);
        }, "labelMessage.fontSize");
        return var_5;
    }

    [Bindable(event="propertyChange")]
    public function get eic_group(): Group {
        return this.var_473;
    }

    public function set eic_group(param1: Group): void {
        var _loc2_: Object = this.var_473;
        if (_loc2_ !== param1) {
            this.var_473 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "eic_group", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get labelEICPlayersValues(): Label {
        return this.var_2776;
    }

    public function set labelEICPlayersValues(param1: Label): void {
        var _loc2_: Object = this.var_2776;
        if (_loc2_ !== param1) {
            this.var_2776 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "labelEICPlayersValues", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get labelEICTicketsValues(): Label {
        return this.var_1383;
    }

    public function set labelEICTicketsValues(param1: Label): void {
        var _loc2_: Object = this.var_1383;
        if (_loc2_ !== param1) {
            this.var_1383 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "labelEICTicketsValues", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get labelMMOPlayersValues(): Label {
        return this.var_4780;
    }

    public function set labelMMOPlayersValues(param1: Label): void {
        var _loc2_: Object = this.var_4780;
        if (_loc2_ !== param1) {
            this.var_4780 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "labelMMOPlayersValues", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get labelMMOTicketsValues(): Label {
        return this.var_4647;
    }

    public function set labelMMOTicketsValues(param1: Label): void {
        var _loc2_: Object = this.var_4647;
        if (_loc2_ !== param1) {
            this.var_4647 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "labelMMOTicketsValues", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get labelMatchRunning(): Label {
        return this.var_234;
    }

    public function set labelMatchRunning(param1: Label): void {
        var _loc2_: Object = this.var_234;
        if (_loc2_ !== param1) {
            this.var_234 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "labelMatchRunning", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get labelMessage(): Label {
        return this._467213939labelMessage;
    }

    public function set labelMessage(param1: Label): void {
        var _loc2_: Object = this._467213939labelMessage;
        if (_loc2_ !== param1) {
            this._467213939labelMessage = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "labelMessage", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get labelVRUPlayersValues(): Label {
        return this.var_3116;
    }

    public function set labelVRUPlayersValues(param1: Label): void {
        var _loc2_: Object = this.var_3116;
        if (_loc2_ !== param1) {
            this.var_3116 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "labelVRUPlayersValues", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get labelVRUTicketsValues(): Label {
        return this.var_1373;
    }

    public function set labelVRUTicketsValues(param1: Label): void {
        var _loc2_: Object = this.var_1373;
        if (_loc2_ !== param1) {
            this.var_1373 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "labelVRUTicketsValues", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get logoEIC(): BitmapImage {
        return this.var_3255;
    }

    public function set logoEIC(param1: BitmapImage): void {
        var _loc2_: Object = this.var_3255;
        if (_loc2_ !== param1) {
            this.var_3255 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "logoEIC", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get logoMMO(): BitmapImage {
        return this.var_1356;
    }

    public function set logoMMO(param1: BitmapImage): void {
        var _loc2_: Object = this.var_1356;
        if (_loc2_ !== param1) {
            this.var_1356 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "logoMMO", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get logoVRU(): BitmapImage {
        return this.var_1075;
    }

    public function set logoVRU(param1: BitmapImage): void {
        var _loc2_: Object = this.var_1075;
        if (_loc2_ !== param1) {
            this.var_1075 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "logoVRU", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get mmo_group(): Group {
        return this.var_152;
    }

    public function set mmo_group(param1: Group): void {
        var _loc2_: Object = this.var_152;
        if (_loc2_ !== param1) {
            this.var_152 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mmo_group", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get panelEICBgnd(): BitmapImage {
        return this.var_3964;
    }

    public function set panelEICBgnd(param1: BitmapImage): void {
        var _loc2_: Object = this.var_3964;
        if (_loc2_ !== param1) {
            this.var_3964 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "panelEICBgnd", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get panelMMOBgnd(): BitmapImage {
        return this.var_1069;
    }

    public function set panelMMOBgnd(param1: BitmapImage): void {
        var _loc2_: Object = this.var_1069;
        if (_loc2_ !== param1) {
            this.var_1069 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "panelMMOBgnd", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get panelVRUBgnd(): BitmapImage {
        return this.var_615;
    }

    public function set panelVRUBgnd(param1: BitmapImage): void {
        var _loc2_: Object = this.var_615;
        if (_loc2_ !== param1) {
            this.var_615 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "panelVRUBgnd", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get vru_group(): Group {
        return this.var_3508;
    }

    public function set vru_group(param1: Group): void {
        var _loc2_: Object = this.var_3508;
        if (_loc2_ !== param1) {
            this.var_3508 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vru_group", _loc2_, param1));
            }
        }
    }
}
}
