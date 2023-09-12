package package_144 {

import com.greensock.TweenMax;

import flash.utils.getDefinitionByName;

import mx.binding.Binding;
import mx.binding.BindingManager;
import mx.binding.IBindingClient;
import mx.binding.IWatcherSetupUtil2;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IFlexModuleFactory;
import mx.core.UIComponent;
import mx.core.mx_internal;
import mx.events.FlexEvent;
import mx.events.PropertyChangeEvent;
import mx.events.ToolTipEvent;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.mvc.common.view.components.DOHtmlTooltip;
import net.bigpoint.darkorbit.mvc.sectorControlWindow.view.class_265;

import package_38.class_439;
import package_38.class_776;

import spark.components.Group;
import spark.components.HGroup;
import spark.components.Label;
import spark.components.SkinnableContainer;
import spark.components.VGroup;

public class class_981 extends SkinnableContainer implements IBindingClient {

    private static var _watcherSetupUtil: IWatcherSetupUtil2;


    private var var_473: Group;

    private var var_234: Label;

    private var _467213939labelMessage: Label;

    private var var_152: Group;

    private var var_1902: SkinnableContainer;

    private var var_969: SkinnableContainer;

    private var var_1131: Label;

    private var var_4093: Label;

    private var var_925: SkinnableContainer;

    private var var_4649: SkinnableContainer;

    private var var_3979: Label;

    private var var_4655: Label;

    private var __moduleFactoryInitialized: Boolean = false;

    private var var_854: int = 5;

    private var var_1753: String;

    private var var_3750: String;

    mx_internal var _bindings: Array;

    mx_internal var _watchers: Array;

    mx_internal var _bindingsByDestination: Object;

    mx_internal var _bindingsBeginWithWord: Object;

    public function class_981() {
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
        bindings = this.method_3290();
        watchers = [];
        target = this;
        if (_watcherSetupUtil == null) {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_tdm_lobbyWindow_view_components_TeamDeathMatchDetailsPanelWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }
        _watcherSetupUtil.setup(this, function (param1: String): * {
            return target[param1];
        }, function (param1: String): * {
            return class_981[param1];
        }, bindings, watchers);
        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
        this.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_1401);
        this.addEventListener("creationComplete", this.method_6523);
        var_1 = 0;
        while (var_1 < bindings.length) {
            Binding(bindings[var_1]).execute();
            var_1++;
        }
    }

    public static function set watcherSetupUtil(param1: IWatcherSetupUtil2): void {
        class_981._watcherSetupUtil = param1;
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

    protected function handleCreationComplete(): void {
        this.toolTipPoints = class_88.getItem("ttip_teamdeathmatch_lobbywindow_factionpanel_pointslabel");
        this.toolTipPlayerAmount = class_88.getItem("ttip_teamdeathmatch_lobbywindow_factionpanel_playeramountlabel");
        this.alpha = 0.2;
    }

    private function method_187(param1: ToolTipEvent): void {
        var _loc2_: * = null;
        if (param1.target is UIComponent) {
            _loc2_ = new DOHtmlTooltip();
            _loc2_.htmlText = (param1.target as UIComponent).toolTip;
            param1.toolTip = _loc2_;
        }
    }

    public function update(param1: class_776): void {
        if (param1 == null) {
            return;
        }
        this.method_4629(param1);
        this.method_4133(param1);
        this.method_2300(param1);
        this.method_4590(param1);
        this.method_3255(param1);
    }

    private function method_4590(param1: class_776): void {
        this.ownerPointsLabel.text = param1.var_2596.toString();
        this.opponentPointsLabel.text = param1.var_1965.toString();
    }

    private function method_2300(param1: class_776): void {
        this.ownerPlayerAmoutLabel.text = param1.var_3387 + "/" + param1.var_365;
        this.opponentPlayerAmoutLabel.text = param1.var_3789 + "/" + param1.var_365;
    }

    private function method_4133(param1: class_776): void {
        switch (param1.var_3014.faction) {
            case class_439.EIC:
                this.opponentFactionLogo.styleName = "teamDeathMatchFactionLogoEIC";
                break;
            case class_439.MMO:
                this.opponentFactionLogo.styleName = "teamDeathMatchFactionLogoMMO";
                break;
            case class_439.VRU:
                this.opponentFactionLogo.styleName = "teamDeathMatchFactionLogoVRU";
                break;
            default:
                this.opponentFactionLogo.styleName = "";
        }
    }

    private function method_4629(param1: class_776): void {
        switch (param1.var_4243.faction) {
            case class_439.EIC:
                this.ownerFactionLogo.styleName = "teamDeathMatchFactionLogoEIC";
                break;
            case class_439.MMO:
                this.ownerFactionLogo.styleName = "teamDeathMatchFactionLogoMMO";
                break;
            case class_439.VRU:
                this.ownerFactionLogo.styleName = "teamDeathMatchFactionLogoVRU";
                break;
            default:
                this.ownerFactionLogo.styleName = "";
        }
    }

    private function method_3255(param1: class_776): void {
        var _loc4_: * = null;
        var _loc2_: * = param1.var_3387 >= param1.var_3044;
        var _loc3_: * = param1.var_3789 >= param1.var_3044;
        if (_loc2_ && _loc3_) {
            _loc4_ = "";
        } else {
            _loc4_ = class_88.getItem("teamdeathmatch_lobbywindow_detailpanel_message_playerrequirement");
        }
        this.labelMessage.text = _loc4_;
    }

    public function set message(param1: String): void {
        this.labelMessage.text = "";
    }

    public function method_464(param1: String): void {
        var _loc2_: String = class_88.getItem("sectorcontrol_lobby_window_detailpanel_state_timer_message");
        _loc2_ = _loc2_.replace(class_265.var_3687, param1);
        this.labelMatchRunning.text = _loc2_;
    }

    public function method_3336(): void {
        this.labelMatchRunning.text = "";
    }

    public function fadeIn(): void {
        TweenMax.to(this, 2.5, {"alpha": 1});
    }

    public function fadeOut(): void {
        TweenMax.to(this, 0.5, {"alpha": 0});
    }

    private function method_1401(): Array {
        return [this.method_2587()];
    }

    private function method_2587(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.percentWidth = 100;
        _loc1_.top = 12;
        _loc1_.mxmlContent = [this.method_2494(), this.method_6401(), this.method_908(), this.method_1187(), this.method_6331()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_2494(): HGroup {
        var _loc1_: HGroup = new HGroup();
        _loc1_.percentWidth = 100;
        _loc1_.horizontalAlign = "center";
        _loc1_.gap = 40;
        _loc1_.mxmlContent = [this.method_5641(), this.method_1286()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_5641(): Group {
        var _loc1_: Group = new Group();
        _loc1_.x = 0;
        _loc1_.y = 0;
        _loc1_.width = 132;
        _loc1_.height = 56;
        _loc1_.mxmlContent = [this.method_4654(), this.method_2935(), this.method_6023(), this.method_3519()];
        _loc1_.id = "mmo_group";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.mmo_group = _loc1_;
        BindingManager.executeBindings(this, "mmo_group", this.mmo_group);
        return _loc1_;
    }

    private function method_4654(): SkinnableContainer {
        var _loc1_: SkinnableContainer = new SkinnableContainer();
        _loc1_.styleName = "teamDeathMatchFactionLogoPanel";
        _loc1_.id = "ownerPanelBgnd";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.ownerPanelBgnd = _loc1_;
        BindingManager.executeBindings(this, "ownerPanelBgnd", this.ownerPanelBgnd);
        return _loc1_;
    }

    private function method_2935(): SkinnableContainer {
        var _loc1_: SkinnableContainer = new SkinnableContainer();
        _loc1_.x = 10;
        _loc1_.id = "ownerFactionLogo";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.ownerFactionLogo = _loc1_;
        BindingManager.executeBindings(this, "ownerFactionLogo", this.ownerFactionLogo);
        return _loc1_;
    }

    private function method_6023(): Label {
        var _loc1_: Label = new Label();
        _loc1_.x = 64;
        _loc1_.y = 6;
        _loc1_.text = "0";
        _loc1_.width = 66;
        _loc1_.setStyle("textAlign", "center");
        _loc1_.setStyle("fontFamily", "EurostileT");
        _loc1_.addEventListener("toolTipCreate", this.method_680);
        _loc1_.id = "ownerPointsLabel";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.ownerPointsLabel = _loc1_;
        BindingManager.executeBindings(this, "ownerPointsLabel", this.ownerPointsLabel);
        return _loc1_;
    }

    public function method_680(param1: ToolTipEvent): void {
        this.method_187(param1);
    }

    private function method_3519(): Label {
        var _loc1_: Label = new Label();
        _loc1_.x = 66;
        _loc1_.y = 35;
        _loc1_.text = "0/0";
        _loc1_.width = 64;
        _loc1_.setStyle("textAlign", "center");
        _loc1_.setStyle("fontFamily", "EurostileT");
        _loc1_.addEventListener("toolTipCreate", this.method_3840);
        _loc1_.id = "ownerPlayerAmoutLabel";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.ownerPlayerAmoutLabel = _loc1_;
        BindingManager.executeBindings(this, "ownerPlayerAmoutLabel", this.ownerPlayerAmoutLabel);
        return _loc1_;
    }

    public function method_3840(param1: ToolTipEvent): void {
        this.method_187(param1);
    }

    private function method_1286(): Group {
        var _loc1_: Group = new Group();
        _loc1_.x = 0;
        _loc1_.y = 0;
        _loc1_.width = 132;
        _loc1_.height = 56;
        _loc1_.mxmlContent = [this.method_5743(), this.method_2426(), this.method_1680(), this.method_6093()];
        _loc1_.addEventListener("toolTipCreate", this.method_3697);
        _loc1_.id = "eic_group";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.eic_group = _loc1_;
        BindingManager.executeBindings(this, "eic_group", this.eic_group);
        return _loc1_;
    }

    private function method_5743(): SkinnableContainer {
        var _loc1_: SkinnableContainer = new SkinnableContainer();
        _loc1_.styleName = "teamDeathMatchFactionLogoPanel";
        _loc1_.id = "opponentPanelBgnd";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.opponentPanelBgnd = _loc1_;
        BindingManager.executeBindings(this, "opponentPanelBgnd", this.opponentPanelBgnd);
        return _loc1_;
    }

    private function method_2426(): SkinnableContainer {
        var _loc1_: SkinnableContainer = new SkinnableContainer();
        _loc1_.x = 10;
        _loc1_.id = "opponentFactionLogo";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.opponentFactionLogo = _loc1_;
        BindingManager.executeBindings(this, "opponentFactionLogo", this.opponentFactionLogo);
        return _loc1_;
    }

    private function method_1680(): Label {
        var _loc1_: Label = new Label();
        _loc1_.x = 66;
        _loc1_.y = 6;
        _loc1_.text = "0";
        _loc1_.width = 64;
        _loc1_.setStyle("textAlign", "center");
        _loc1_.setStyle("fontFamily", "EurostileT");
        _loc1_.addEventListener("toolTipCreate", this.method_3168);
        _loc1_.id = "opponentPointsLabel";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.opponentPointsLabel = _loc1_;
        BindingManager.executeBindings(this, "opponentPointsLabel", this.opponentPointsLabel);
        return _loc1_;
    }

    public function method_3168(param1: ToolTipEvent): void {
        this.method_187(param1);
    }

    private function method_6093(): Label {
        var _loc1_: Label = new Label();
        _loc1_.x = 66;
        _loc1_.y = 35;
        _loc1_.text = "0/0";
        _loc1_.width = 64;
        _loc1_.setStyle("textAlign", "center");
        _loc1_.setStyle("fontFamily", "EurostileT");
        _loc1_.addEventListener("toolTipCreate", this.method_1373);
        _loc1_.id = "opponentPlayerAmoutLabel";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.opponentPlayerAmoutLabel = _loc1_;
        BindingManager.executeBindings(this, "opponentPlayerAmoutLabel", this.opponentPlayerAmoutLabel);
        return _loc1_;
    }

    public function method_1373(param1: ToolTipEvent): void {
        this.method_187(param1);
    }

    public function method_3697(param1: ToolTipEvent): void {
        this.method_187(param1);
    }

    private function method_6401(): Group {
        var _loc1_: Group = new Group();
        _loc1_.width = 10;
        _loc1_.height = 10;
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_908(): Label {
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

    private function method_1187(): Group {
        var _loc1_: Group = new Group();
        _loc1_.width = 10;
        _loc1_.height = 0;
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_6331(): Label {
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

    public function method_6523(param1: FlexEvent): void {
        this.handleCreationComplete();
    }

    private function method_3290(): Array {
        var var_5: Array = [];
        var_5[0] = new Binding(this, function (): String {
            var _loc1_: * = toolTipPoints;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "ownerPointsLabel.toolTip");
        var_5[1] = new Binding(this, function (): uint {
            return class_265.const_372;
        }, function (param1: uint): void {
            ownerPointsLabel.setStyle("color", param1);
        }, "ownerPointsLabel.color");
        var_5[2] = new Binding(this, function (): Number {
            return class_265.const_1889;
        }, function (param1: Number): void {
            ownerPointsLabel.setStyle("fontSize", param1);
        }, "ownerPointsLabel.fontSize");
        var_5[3] = new Binding(this, function (): String {
            var _loc1_: * = toolTipPlayerAmount;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "ownerPlayerAmoutLabel.toolTip");
        var_5[4] = new Binding(this, function (): uint {
            return class_265.const_1434;
        }, function (param1: uint): void {
            ownerPlayerAmoutLabel.setStyle("color", param1);
        }, "ownerPlayerAmoutLabel.color");
        var_5[5] = new Binding(this, function (): Number {
            return class_265.const_1889;
        }, function (param1: Number): void {
            ownerPlayerAmoutLabel.setStyle("fontSize", param1);
        }, "ownerPlayerAmoutLabel.fontSize");
        var_5[6] = new Binding(this, function (): String {
            var _loc1_: * = toolTipPoints;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "opponentPointsLabel.toolTip");
        var_5[7] = new Binding(this, function (): uint {
            return class_265.const_372;
        }, function (param1: uint): void {
            opponentPointsLabel.setStyle("color", param1);
        }, "opponentPointsLabel.color");
        var_5[8] = new Binding(this, function (): Number {
            return class_265.const_1889;
        }, function (param1: Number): void {
            opponentPointsLabel.setStyle("fontSize", param1);
        }, "opponentPointsLabel.fontSize");
        var_5[9] = new Binding(this, function (): String {
            var _loc1_: * = toolTipPlayerAmount;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "opponentPlayerAmoutLabel.toolTip");
        var_5[10] = new Binding(this, function (): uint {
            return class_265.const_1434;
        }, function (param1: uint): void {
            opponentPlayerAmoutLabel.setStyle("color", param1);
        }, "opponentPlayerAmoutLabel.color");
        var_5[11] = new Binding(this, function (): Number {
            return class_265.const_1889;
        }, function (param1: Number): void {
            opponentPlayerAmoutLabel.setStyle("fontSize", param1);
        }, "opponentPlayerAmoutLabel.fontSize");
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
    public function get opponentFactionLogo(): SkinnableContainer {
        return this.var_1902;
    }

    public function set opponentFactionLogo(param1: SkinnableContainer): void {
        var _loc2_: Object = this.var_1902;
        if (_loc2_ !== param1) {
            this.var_1902 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "opponentFactionLogo", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get opponentPanelBgnd(): SkinnableContainer {
        return this.var_969;
    }

    public function set opponentPanelBgnd(param1: SkinnableContainer): void {
        var _loc2_: Object = this.var_969;
        if (_loc2_ !== param1) {
            this.var_969 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "opponentPanelBgnd", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get opponentPlayerAmoutLabel(): Label {
        return this.var_1131;
    }

    public function set opponentPlayerAmoutLabel(param1: Label): void {
        var _loc2_: Object = this.var_1131;
        if (_loc2_ !== param1) {
            this.var_1131 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "opponentPlayerAmoutLabel", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get opponentPointsLabel(): Label {
        return this.var_4093;
    }

    public function set opponentPointsLabel(param1: Label): void {
        var _loc2_: Object = this.var_4093;
        if (_loc2_ !== param1) {
            this.var_4093 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "opponentPointsLabel", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get ownerFactionLogo(): SkinnableContainer {
        return this.var_925;
    }

    public function set ownerFactionLogo(param1: SkinnableContainer): void {
        var _loc2_: Object = this.var_925;
        if (_loc2_ !== param1) {
            this.var_925 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ownerFactionLogo", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get ownerPanelBgnd(): SkinnableContainer {
        return this.var_4649;
    }

    public function set ownerPanelBgnd(param1: SkinnableContainer): void {
        var _loc2_: Object = this.var_4649;
        if (_loc2_ !== param1) {
            this.var_4649 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ownerPanelBgnd", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get ownerPlayerAmoutLabel(): Label {
        return this.var_3979;
    }

    public function set ownerPlayerAmoutLabel(param1: Label): void {
        var _loc2_: Object = this.var_3979;
        if (_loc2_ !== param1) {
            this.var_3979 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ownerPlayerAmoutLabel", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get ownerPointsLabel(): Label {
        return this.var_4655;
    }

    public function set ownerPointsLabel(param1: Label): void {
        var _loc2_: Object = this.var_4655;
        if (_loc2_ !== param1) {
            this.var_4655 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ownerPointsLabel", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    private function get toolTipPoints(): String {
        return this.var_1753;
    }

    private function set toolTipPoints(param1: String): void {
        var _loc2_: Object = this.var_1753;
        if (_loc2_ !== param1) {
            this.var_1753 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "toolTipPoints", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    private function get toolTipPlayerAmount(): String {
        return this.var_3750;
    }

    private function set toolTipPlayerAmount(param1: String): void {
        var _loc2_: Object = this.var_3750;
        if (_loc2_ !== param1) {
            this.var_3750 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "toolTipPlayerAmount", _loc2_, param1));
            }
        }
    }
}
}
