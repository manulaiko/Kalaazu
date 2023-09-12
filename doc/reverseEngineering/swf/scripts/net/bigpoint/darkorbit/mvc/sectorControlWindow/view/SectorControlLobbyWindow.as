package net.bigpoint.darkorbit.mvc.sectorControlWindow.view {

import flash.display.BitmapData;
import flash.events.MouseEvent;
import flash.utils.getDefinitionByName;

import mx.binding.Binding;
import mx.binding.BindingManager;
import mx.binding.IBindingClient;
import mx.binding.IWatcherSetupUtil2;
import mx.collections.IList;
import mx.collections.ISort;
import mx.collections.Sort;
import mx.collections.SortField;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IFlexModuleFactory;
import mx.core.mx_internal;
import mx.events.FlexEvent;
import mx.events.PropertyChangeEvent;
import mx.graphics.SolidColor;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.mvc.common.view.components.DOWindow;
import net.bigpoint.darkorbit.mvc.common.view.skins.DOButtonSkinWithColoredText;
import net.bigpoint.darkorbit.mvc.common.view.skins.DOSkinnable9ScaleContainerSkin;

import package_158.class_1008;

import package_159.SectorControlLobbyWindowEvent;

import package_160.class_1009;
import package_160.class_1011;
import package_160.class_1014;

import package_161.class_1012;

import package_38.class_691;

import package_8.VectorCollection;

import package_9.ResourceManager;

import spark.components.Group;
import spark.components.SkinnableContainer;
import spark.components.VGroup;
import spark.events.GridSelectionEvent;
import spark.filters.BlurFilter;
import spark.primitives.Rect;

public class SectorControlLobbyWindow extends DOWindow implements IBindingClient, class_156 {

    private static const const_884: uint = 5;

    private static var _watcherSetupUtil: IWatcherSetupUtil2;


    public var _SectorControlLobbyWindow_Group1: Group;

    private var var_1027: class_1009;

    private var var_223: SkinnableContainer;

    private var var_614: class_1011;

    private var var_1142: class_1014;

    private var var_647: VGroup;

    private var __moduleFactoryInitialized: Boolean = false;

    private var var_4300: String;

    private var var_3504: String;

    private var var_4505: String;

    private var var_3622: String;

    private var selectedIndex: int = -1;

    protected var var_2739: VectorCollection;

    mx_internal var _bindings: Array;

    mx_internal var _watchers: Array;

    mx_internal var _bindingsByDestination: Object;

    mx_internal var _bindingsBeginWithWord: Object;

    public function SectorControlLobbyWindow() {
        var bindings: Array;
        var watchers: Array;
        var var_1: uint;
        var target: Object = null;
        var watcherSetupUtilClass: Object = null;
        this.var_2739 = new VectorCollection();
        this.mx_internal::_bindings = [];
        this.mx_internal::_watchers = [];
        this.mx_internal::_bindingsByDestination = {};
        this.mx_internal::_bindingsBeginWithWord = {};
        super();
        mx_internal::_document = this;
        bindings = this.method_1764();
        watchers = [];
        target = this;
        if (_watcherSetupUtil == null) {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_sectorControlWindow_view_SectorControlLobbyWindowWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }
        _watcherSetupUtil.setup(this, function (param1: String): * {
            return target[param1];
        }, function (param1: String): * {
            return SectorControlLobbyWindow[param1];
        }, bindings, watchers);
        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
        this.styleName = "questWindow";
        this.width = 524;
        this.minWidth = 524;
        this.height = 474;
        this.minHeight = 474;
        this.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_4546);
        this.addEventListener("preinitialize", this.method_823);
        this.addEventListener("creationComplete", this.method_5946);
        var_1 = 0;
        while (var_1 < bindings.length) {
            Binding(bindings[var_1]).execute();
            var_1++;
        }
    }

    public static function set watcherSetupUtil(param1: IWatcherSetupUtil2): void {
        SectorControlLobbyWindow._watcherSetupUtil = param1;
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

    private function method_1566(): void {
        this.method_1304(false);
    }

    protected function handleCreationComplete(): void {
        var _loc1_: ISort = new Sort();
        _loc1_.fields = [new SortField("matchID", false, false)];
        this.lobbyListCollection.sort = _loc1_;
        this.init();
    }

    public function init(): void {
        this.selectedIndex = -1;
        this.method_1304(false);
        this.method_5501();
        this.sendMatchOverviewRequest();
    }

    private function sendMatchOverviewRequest(): void {
        var _loc1_: SectorControlLobbyWindowEvent = new SectorControlLobbyWindowEvent(SectorControlLobbyWindowEvent.const_1519);
        dispatchEvent(_loc1_);
    }

    protected function method_5501(): void {
        this.var_3622 = class_88.getItem("ttip_sectorcontrol_lobbywindow_leavebutton");
        this.var_4505 = class_88.getItem("ttip_sectorcontrol_lobbywindow_joinbutton");
        this.var_4300 = class_88.getItem("sectorcontrol_lobby_window_popup_confirmation");
        this.var_3504 = class_88.getItem("sectorcontrol_lobby_window_popup_leave");
        var _loc1_: BitmapData = ResourceManager.getBitmapData(class_265.name_129, "iconMatchState_running");
        this.container.setStyle("libID", class_265.name_129);
        this.container.setStyle("skinID", class_265.const_1431);
        this.container.setStyle("scale9Grid", class_265.const_1803);
        this.container.setStyle("skinClass", DOSkinnable9ScaleContainerSkin);
        this.itemList.init();
        this.itemList.setStyle("libID", class_265.name_129);
        this.itemList.setStyle("skinID", class_265.const_2292);
        this.itemList.setStyle("scale9Grid", class_265.const_825);
        this.itemList.setStyle("skinClass", class_1012);
        this.matchStateDetailsPanel.init();
        this.matchStateDetailsPanel.setStyle("libID", class_265.name_129);
        this.matchStateDetailsPanel.setStyle("skinID", class_265.const_2475);
        this.matchStateDetailsPanel.setStyle("scale9Grid", class_265.const_395);
        this.matchStateDetailsPanel.setStyle("skinClass", DOSkinnable9ScaleContainerSkin);
        closeButton.toolTip = class_88.getItem("ttip_sectorcontrol_lobbywindow_closebutton");
        this.actionButton.toolTip = this.var_4505;
        this.actionButton.label = this.var_4300;
        this.actionButton.enabled = false;
    }

    public function method_1304(param1: Boolean): void {
        this.enabled = param1;
        this.mouseEnabled = param1;
        this.mouseChildren = param1;
        if (param1) {
            this.filters = [];
        } else {
            this.filters = [new BlurFilter(2, 2, 1)];
        }
    }

    protected function method_4100(param1: MouseEvent): void {
        var _loc2_: class_1008 = this.itemList.selectedItem as class_1008;
        var _loc3_: SectorControlLobbyWindowEvent = new SectorControlLobbyWindowEvent(SectorControlLobbyWindowEvent.const_199);
        _loc3_.method_4561 = _loc2_;
        _loc3_.action = this.actionButton.state;
        dispatchEvent(_loc3_);
    }

    public function method_2027(param1: class_691): void {
        if (this.matchStateDetailsPanel) {
            this.matchStateDetailsPanel.visible = true;
            this.matchStateDetailsPanel.update(param1);
        }
    }

    public function method_3255(param1: Boolean, param2: Boolean): void {
        if (this.matchStateDetailsPanel) {
            this.matchStateDetailsPanel.method_3255(param1, param2);
        }
    }

    public function method_968(param1: String): void {
        switch (param1) {
            case SectorControlLobbyWindowEvent.const_1355:
                this.method_288(SectorControlLobbyWindowEvent.const_1355);
                break;
            case SectorControlLobbyWindowEvent.const_500:
                this.method_2813();
                break;
            case SectorControlLobbyWindowEvent.const_3079:
                this.method_288(SectorControlLobbyWindowEvent.const_3079);
        }
    }

    protected function method_2813(): void {
        this.actionButton.enabled = true;
        this.actionButton.label = this.var_3504;
        this.actionButton.toolTip = this.var_3622;
        this.actionButton.state = SectorControlLobbyWindowEvent.const_500;
    }

    protected function method_288(param1: String): void {
        this.actionButton.enabled = true;
        this.actionButton.label = this.var_4300;
        this.actionButton.toolTip = this.var_4505;
        this.actionButton.state = param1;
    }

    public function method_1124(param1: int, param2: uint, param3: uint): void {
        var _loc4_: String = class_88.getItem("sectorcontrol_lobby_window_title");
        var _loc5_: String = (_loc5_ = param2.toString() + " - " + param3.toString()).replace(/999/, "∞");
        this.title = _loc4_.replace(class_265.var_2639, _loc5_);
    }

    public function updateMatchTime(param1: String): void {
        if (this.matchStateDetailsPanel) {
            this.matchStateDetailsPanel.method_464(param1);
        }
    }

    public function clearMatchTime(): void {
        if (this.matchStateDetailsPanel) {
            this.matchStateDetailsPanel.method_3336();
        }
    }

    public function method_5849(param1: Vector.<class_1008>): void {
        this.method_4502(param1);
        if (this.selectedIndex == -1) {
            this.method_1304(true);
        }
    }

    public function method_4502(param1: Vector.<class_1008>): void {
        this.lobbyListCollection.source = param1;
        this.method_712();
    }

    protected function method_712(): void {
        if (this.selectedIndex >= 0) {
            this.itemList.setSelectedIndex(this.selectedIndex);
            this.method_6010();
        }
    }

    protected function method_6010(): void {
        this.selectedIndex = this.itemList.selectedIndex;
        var _loc1_: class_1008 = this.itemList.selectedItem as class_1008;
        var _loc2_: SectorControlLobbyWindowEvent = new SectorControlLobbyWindowEvent(SectorControlLobbyWindowEvent.const_3272);
        _loc2_.method_4561 = _loc1_;
        dispatchEvent(_loc2_);
    }

    protected function method_1217(param1: GridSelectionEvent): void {
        this.method_6010();
    }

    public function method_1715(param1: int): void {
        this.matchStateDetailsPanel.method_5275(param1);
    }

    private function method_4546(): Array {
        return [this.method_663()];
    }

    private function method_663(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.horizontalAlign = "center";
        _loc1_.visible = true;
        _loc1_.mxmlContent = [this.method_4155(), this.method_5905(), this.method_4907()];
        _loc1_.id = "windowContainer";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.windowContainer = _loc1_;
        BindingManager.executeBindings(this, "windowContainer", this.windowContainer);
        return _loc1_;
    }

    private function method_4155(): SkinnableContainer {
        var _loc1_: SkinnableContainer = new SkinnableContainer();
        _loc1_.width = 474;
        _loc1_.height = 335;
        _loc1_.bottom = 25;
        _loc1_.top = 25;
        _loc1_.left = 25;
        _loc1_.right = 25;
        _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_2510);
        _loc1_.id = "container";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.container = _loc1_;
        BindingManager.executeBindings(this, "container", this.container);
        return _loc1_;
    }

    private function method_2510(): Array {
        return [this.method_374(), this.method_3474(), this.method_4734()];
    }

    private function method_374(): class_1011 {
        var _loc1_: class_1011 = new class_1011();
        _loc1_.percentWidth = 100;
        _loc1_.height = 166;
        _loc1_.focusEnabled = false;
        _loc1_.editable = false;
        _loc1_.resizableColumns = false;
        _loc1_.sortableColumns = false;
        _loc1_.setStyle("contentBackgroundColor", 1317149);
        _loc1_.setStyle("rollOverColor", 2106665);
        _loc1_.setStyle("selectionColor", 1975079);
        _loc1_.addEventListener("selectionChange", this.method_3433);
        _loc1_.id = "itemList";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.itemList = _loc1_;
        BindingManager.executeBindings(this, "itemList", this.itemList);
        return _loc1_;
    }

    public function method_3433(param1: GridSelectionEvent): void {
        this.method_1217(param1);
    }

    private function method_3474(): class_1014 {
        var _loc1_: class_1014 = new class_1014();
        _loc1_.percentWidth = 100;
        _loc1_.height = 140;
        _loc1_.top = 180;
        _loc1_.visible = false;
        _loc1_.id = "matchStateDetailsPanel";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.matchStateDetailsPanel = _loc1_;
        BindingManager.executeBindings(this, "matchStateDetailsPanel", this.matchStateDetailsPanel);
        return _loc1_;
    }

    private function method_4734(): Group {
        var _loc1_: Group = new Group();
        _loc1_.percentWidth = 100;
        _loc1_.height = 1;
        _loc1_.top = 290;
        _loc1_.mxmlContent = [this.method_43()];
        _loc1_.id = "_SectorControlLobbyWindow_Group1";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this._SectorControlLobbyWindow_Group1 = _loc1_;
        BindingManager.executeBindings(this, "_SectorControlLobbyWindow_Group1", this._SectorControlLobbyWindow_Group1);
        return _loc1_;
    }

    private function method_43(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.top = 0;
        _loc1_.bottom = 0;
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.fill = this.method_2391();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function method_2391(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 2895923;
        return _loc1_;
    }

    private function method_5905(): Group {
        var _loc1_: Group = new Group();
        _loc1_.width = 10;
        _loc1_.height = 10;
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_4907(): Group {
        var _loc1_: Group = new Group();
        _loc1_.x = 0;
        _loc1_.y = 0;
        _loc1_.percentWidth = 100;
        _loc1_.height = 32;
        _loc1_.mxmlContent = [this.method_3025()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_3025(): class_1009 {
        var _loc1_: class_1009 = new class_1009();
        _loc1_.enabled = false;
        _loc1_.width = 230;
        _loc1_.height = 32;
        _loc1_.styleName = "greenButtonWithColoredText";
        _loc1_.mouseChildren = false;
        _loc1_.buttonMode = true;
        _loc1_.horizontalCenter = 0;
        _loc1_.setStyle("fontSize", 14);
        _loc1_.setStyle("color", 16777215);
        _loc1_.setStyle("skinClass", DOButtonSkinWithColoredText);
        _loc1_.addEventListener("click", this.method_819);
        _loc1_.id = "actionButton";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.actionButton = _loc1_;
        BindingManager.executeBindings(this, "actionButton", this.actionButton);
        return _loc1_;
    }

    public function method_819(param1: MouseEvent): void {
        this.method_4100(param1);
    }

    public function method_823(param1: FlexEvent): void {
        this.method_1566();
    }

    public function method_5946(param1: FlexEvent): void {
        this.handleCreationComplete();
    }

    private function method_1764(): Array {
        var var_5: Array = [];
        var_5[0] = new Binding(this, function (): IList {
            return lobbyListCollection;
        }, null, "itemList.dataProvider");
        var_5[1] = new Binding(this, function (): Object {
            return const_884;
        }, null, "itemList.left");
        var_5[2] = new Binding(this, function (): Object {
            return const_884;
        }, null, "itemList.right");
        var_5[3] = new Binding(this, function (): Object {
            return const_884;
        }, null, "itemList.top");
        var_5[4] = new Binding(this, function (): Object {
            return const_884;
        }, null, "matchStateDetailsPanel.left");
        var_5[5] = new Binding(this, function (): Object {
            return const_884;
        }, null, "matchStateDetailsPanel.right");
        var_5[6] = new Binding(this, function (): Object {
            return const_884;
        }, null, "_SectorControlLobbyWindow_Group1.left");
        var_5[7] = new Binding(this, function (): Object {
            return const_884;
        }, null, "_SectorControlLobbyWindow_Group1.right");
        return var_5;
    }

    [Bindable(event="propertyChange")]
    public function get actionButton(): class_1009 {
        return this.var_1027;
    }

    public function set actionButton(param1: class_1009): void {
        var _loc2_: Object = this.var_1027;
        if (_loc2_ !== param1) {
            this.var_1027 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "actionButton", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get container(): SkinnableContainer {
        return this.var_223;
    }

    public function set container(param1: SkinnableContainer): void {
        var _loc2_: Object = this.var_223;
        if (_loc2_ !== param1) {
            this.var_223 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "container", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get itemList(): class_1011 {
        return this.var_614;
    }

    public function set itemList(param1: class_1011): void {
        var _loc2_: Object = this.var_614;
        if (_loc2_ !== param1) {
            this.var_614 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemList", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get matchStateDetailsPanel(): class_1014 {
        return this.var_1142;
    }

    public function set matchStateDetailsPanel(param1: class_1014): void {
        var _loc2_: Object = this.var_1142;
        if (_loc2_ !== param1) {
            this.var_1142 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "matchStateDetailsPanel", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get windowContainer(): VGroup {
        return this.var_647;
    }

    public function set windowContainer(param1: VGroup): void {
        var _loc2_: Object = this.var_647;
        if (_loc2_ !== param1) {
            this.var_647 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "windowContainer", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    protected function get lobbyListCollection(): VectorCollection {
        return this.var_2739;
    }

    protected function set lobbyListCollection(param1: VectorCollection): void {
        var _loc2_: Object = this.var_2739;
        if (_loc2_ !== param1) {
            this.var_2739 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lobbyListCollection", _loc2_, param1));
            }
        }
    }
}
}
