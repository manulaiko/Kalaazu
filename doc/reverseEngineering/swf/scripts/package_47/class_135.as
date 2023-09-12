package package_47 {

import flash.accessibility.*;
import flash.debugger.*;
import flash.display.*;
import flash.errors.*;
import flash.events.*;
import flash.external.*;
import flash.filters.BlurFilter;
import flash.geom.*;
import flash.media.*;
import flash.net.*;
import flash.printing.*;
import flash.profiler.*;
import flash.system.*;
import flash.text.*;
import flash.ui.*;
import flash.utils.*;
import flash.xml.*;

import mx.binding.*;
import mx.collections.IList;
import mx.collections.ISort;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IFlexModuleFactory;
import mx.core.mx_internal;
import mx.events.FlexEvent;
import mx.events.PropertyChangeEvent;
import mx.filters.*;
import mx.graphics.SolidColor;
import mx.styles.*;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase;
import net.bigpoint.darkorbit.mvc.common.view.components.DOWindow;
import net.bigpoint.darkorbit.mvc.common.view.skins.DOButtonSkinWithColoredText;

import package_143.class_979;

import package_144.class_980;
import package_144.class_981;

import package_21.class_978;

import package_38.class_776;
import package_38.class_787;
import package_38.class_924;

import package_8.VectorCollection;

import spark.collections.Sort;
import spark.collections.SortField;
import spark.components.Group;
import spark.components.SkinnableContainer;
import spark.components.VGroup;
import spark.events.GridSelectionEvent;
import spark.primitives.Rect;

public class class_135 extends DOWindow implements IBindingClient, class_134 {

    private static const const_884: uint = 5;

    private static var _watcherSetupUtil: IWatcherSetupUtil2;


    public var _TeamDeathMatchLobbywindow_Group1: Group;

    private var var_1027: DOButtonBase;

    private var var_223: SkinnableContainer;

    private var var_3961: class_980;

    private var var_1142: class_981;

    private var var_647: VGroup;

    private var __moduleFactoryInitialized: Boolean = false;

    protected const const_1411: uint = 1;

    protected const const_1165: uint = 2;

    protected const const_409: uint = 3;

    private var var_1049: int = -13;

    private var var_3694: int;

    private var var_3623: int = -1;

    private var var_1905: Boolean = false;

    protected var var_2739: VectorCollection;

    mx_internal var _bindings: Array;

    mx_internal var _watchers: Array;

    mx_internal var _bindingsByDestination: Object;

    mx_internal var _bindingsBeginWithWord: Object;

    public function class_135() {
        var bindings: Array;
        var watchers: Array;
        var var_1: uint;
        var target: Object = null;
        var watcherSetupUtilClass: Object = null;
        this.var_3694 = this.var_1049;
        this.var_2739 = new VectorCollection();
        this.mx_internal::_bindings = [];
        this.mx_internal::_watchers = [];
        this.mx_internal::_bindingsByDestination = {};
        this.mx_internal::_bindingsBeginWithWord = {};
        super();
        mx_internal::_document = this;
        bindings = this.method_6191();
        watchers = [];
        target = this;
        if (_watcherSetupUtil == null) {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_tdm_lobbyWindow_view_TeamDeathMatchLobbywindowWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }
        _watcherSetupUtil.setup(this, function (param1: String): * {
            return target[param1];
        }, function (param1: String): * {
            return class_135[param1];
        }, bindings, watchers);
        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
        this.width = 524;
        this.minWidth = 524;
        this.height = 474;
        this.minHeight = 474;
        this.styleName = "questWindow";
        this.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_930);
        this.addEventListener("preinitialize", this.method_6393);
        this.addEventListener("creationComplete", this.method_5199);
        var_1 = 0;
        while (var_1 < bindings.length) {
            Binding(bindings[var_1]).execute();
            var_1++;
        }
    }

    public static function set watcherSetupUtil(param1: IWatcherSetupUtil2): void {
        class_135._watcherSetupUtil = param1;
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
        _loc1_.fields = [new SortField("matchID", false, true)];
        this.lobbyListCollection.sort = _loc1_;
        this.init();
    }

    private function init(): void {
        this.method_3153 = this.var_1049;
        this.method_5501();
        dispatchEvent(new class_979(class_979.const_3289));
        this.method_1304(true);
    }

    protected function method_5501(): void {
        this.matchStateDetailsPanel.alpha = 0.1;
        closeButton.toolTip = class_88.getItem("ttip_teamdeathmatch_lobbywindow_close_button");
    }

    public function method_1304(param1: Boolean): void {
        this.enabled = param1;
        this.mouseEnabled = param1;
        this.mouseChildren = param1;
        this.var_1905 = param1;
        if (this.var_1905) {
            this.filters = [];
        } else {
            this.filters = [new BlurFilter(2, 2, 1)];
        }
    }

    public function method_722(param1: uint, param2: uint): void {
        var _loc3_: String = class_88.getItem("teamdeathmatch_lobbywindow_title");
        var _loc4_: String = (_loc4_ = param1.toString() + " - " + param2.toString()).replace(/999/, "∞");
        this.title = _loc4_.toString();
        this.title = _loc3_.replace(class_976.var_2639, _loc4_);
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

    protected function method_2742(param1: uint): void {
        this.actionButton.removeEventListener(MouseEvent.CLICK, this.method_483);
        this.actionButton.removeEventListener(MouseEvent.CLICK, this.method_3285);
        switch (param1) {
            case 2:
                this.actionButton.enabled = true;
                this.actionButton.toolTip = class_88.getItem("ttip_teamdeathmatch_lobbywindow_joinbutton");
                this.actionButton.label = class_88.getItem("teamdeathmatch_lobbywindow_button_join");
                this.actionButton.addEventListener(MouseEvent.CLICK, this.method_483);
                break;
            case 3:
                this.actionButton.enabled = true;
                this.actionButton.toolTip = class_88.getItem("ttip_teamdeathmatch_lobbywindow_leave_button");
                this.actionButton.label = class_88.getItem("teamdeathmatch_lobbywindow_button_leave");
                this.actionButton.addEventListener(MouseEvent.CLICK, this.method_3285);
                break;
            case 1:
                this.actionButton.enabled = false;
        }
    }

    protected function method_483(param1: MouseEvent): void {
        var _loc3_: * = null;
        var _loc2_: int = int(this.method_6265());
        if (_loc2_ >= 0) {
            _loc3_ = new class_979(class_979.const_935);
            _loc3_.name_93 = _loc2_;
            dispatchEvent(_loc3_);
        }
    }

    protected function method_3285(param1: MouseEvent): void {
        var _loc3_: * = null;
        var _loc2_: int = int(this.method_6265());
        if (_loc2_ >= 0) {
            _loc3_ = new class_979(class_979.const_1817);
            _loc3_.name_93 = this.method_6265();
            dispatchEvent(_loc3_);
        }
    }

    protected function method_1970(param1: Event = null): void {
        this.method_1357();
    }

    public function method_3096(param1: class_924): void {
        var _loc2_: * = null;
        var _loc3_: int = 0;
        if (param1) {
            _loc2_ = param1.var_2830;
            this.lobbyListCollection.source = _loc2_;
            _loc3_ = int(param1.var_1413);
            if (_loc3_ == -1) {
                this.method_3153 = _loc3_;
                this.method_830();
            } else if (_loc3_ >= 0) {
                if (this.method_3153 == this.var_1049) {
                    this.method_3153 = _loc3_;
                    this.method_795(_loc3_);
                } else {
                    this.method_3153 = _loc3_;
                    this.method_830();
                }
            }
            this.method_1304(this.var_1905);
        }
    }

    public function method_194(param1: class_776): void {
        this.method_1534(param1);
    }

    protected function method_1534(param1: class_776): void {
        var _loc2_: int = 0;
        if (this.matchStateDetailsPanel) {
            if (param1) {
                this.matchStateDetailsPanel.update(param1);
                _loc2_ = int(this.method_343(param1.name_93));
                if (_loc2_ == class_787.const_2746) {
                    this.matchStateDetailsPanel.message = "";
                }
            }
            this.matchStateDetailsPanel.fadeIn();
        }
    }

    protected function method_343(param1: int): int {
        var _loc4_: * = null;
        var _loc2_: Vector.<class_787> = this.lobbyListCollection.source as Vector.<class_787>;
        var _loc3_: int = 0;
        while (_loc3_ < _loc2_.length) {
            if ((_loc4_ = _loc2_[_loc3_]).name_93 == param1) {
                return _loc4_.var_572;
            }
            _loc3_++;
        }
        return -1;
    }

    protected function method_6265(): int {
        var _loc1_: * = null;
        if (this.matchOverview.selectedItem) {
            _loc1_ = this.matchOverview.selectedItem as class_787;
            return _loc1_.name_93;
        }
        return -1;
    }

    private function method_830(): void {
        if (this.var_3623 == -1) {
            this.method_347();
        } else if (this.var_3623 >= 0) {
            this.method_795(this.var_3623);
        }
    }

    private function method_795(param1: int): void {
        var _loc2_: * = null;
        var _loc3_: int = 0;
        var _loc4_: int = 0;
        var _loc5_: * = null;
        if (this.matchOverview) {
            _loc2_ = this.matchOverview.dataProvider;
            _loc3_ = _loc2_.length;
            if (_loc3_ > 0) {
                _loc4_ = 0;
                while (_loc4_ < _loc3_) {
                    if ((_loc5_ = _loc2_[_loc4_]).name_93 == param1) {
                        this.matchOverview.selectedIndex = _loc4_;
                        this.var_3623 = param1;
                        this.method_1357();
                    }
                    _loc4_++;
                }
            } else {
                this.method_2742(1);
            }
        }
    }

    private function method_347(): void {
        var _loc1_: * = null;
        var _loc2_: int = 0;
        var _loc3_: * = null;
        if (this.matchOverview) {
            _loc1_ = this.matchOverview.dataProvider;
            _loc2_ = _loc1_.length;
            if (_loc2_ > 0) {
                this.matchOverview.selectedIndex = 0;
                _loc3_ = _loc1_[0];
                this.var_3623 = _loc3_.name_93;
                this.method_1357();
            }
        }
    }

    private function method_1357(): void {
        var _loc2_: * = null;
        var _loc1_: class_787 = this.matchOverview.selectedItem as class_787;
        if (_loc1_) {
            this.method_1365(_loc1_, this.method_3153);
            _loc2_ = new class_979(class_979.const_3011);
            this.var_3623 = _loc1_.name_93;
            _loc2_.name_93 = _loc1_.name_93;
            dispatchEvent(_loc2_);
        }
    }

    private function method_1365(param1: class_787, param2: int): void {
        var _loc3_: * = param1.name_93 == param2;
        var _loc4_: int = _loc3_ ? 3 : 2;
        this.method_2742(_loc4_);
    }

    public function get method_3153(): int {
        return this.var_3694;
    }

    public function set method_3153(param1: int): void {
        this.var_3694 = param1;
        class_978.var_2784 = param1;
    }

    private function method_930(): Array {
        return [this.method_3571()];
    }

    private function method_3571(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.horizontalAlign = "center";
        _loc1_.visible = true;
        _loc1_.mxmlContent = [this.method_3202(), this.method_6206(), this.method_4942()];
        _loc1_.id = "windowContainer";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.windowContainer = _loc1_;
        BindingManager.executeBindings(this, "windowContainer", this.windowContainer);
        return _loc1_;
    }

    private function method_3202(): SkinnableContainer {
        var _loc1_: SkinnableContainer = new SkinnableContainer();
        _loc1_.styleName = "teamDeathMatchLobbywindow";
        _loc1_.width = 474;
        _loc1_.height = 335;
        _loc1_.bottom = 25;
        _loc1_.top = 25;
        _loc1_.left = 25;
        _loc1_.right = 25;
        _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_4618);
        _loc1_.id = "container";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.container = _loc1_;
        BindingManager.executeBindings(this, "container", this.container);
        return _loc1_;
    }

    private function method_4618(): Array {
        return [this.method_5686(), this.method_6463(), this.method_4789()];
    }

    private function method_5686(): class_980 {
        var _loc1_: class_980 = new class_980();
        _loc1_.styleName = "TeamDeathMatchLobbyWindowMatchoverviewCSS";
        _loc1_.percentWidth = 100;
        _loc1_.height = 166;
        _loc1_.focusEnabled = false;
        _loc1_.editable = false;
        _loc1_.resizableColumns = false;
        _loc1_.sortableColumns = false;
        _loc1_.setStyle("contentBackgroundColor", 1317149);
        _loc1_.setStyle("rollOverColor", 2106665);
        _loc1_.setStyle("selectionColor", 1975079);
        _loc1_.addEventListener("selectionChange", this.method_3657);
        _loc1_.id = "matchOverview";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.matchOverview = _loc1_;
        BindingManager.executeBindings(this, "matchOverview", this.matchOverview);
        return _loc1_;
    }

    public function method_3657(param1: GridSelectionEvent): void {
        this.method_1970(param1);
    }

    private function method_6463(): class_981 {
        var _loc1_: class_981 = new class_981();
        _loc1_.styleName = "TeamDeathMatchLobbyWindowMatchdetailCSS";
        _loc1_.percentWidth = 100;
        _loc1_.height = 140;
        _loc1_.top = 180;
        _loc1_.visible = true;
        _loc1_.id = "matchStateDetailsPanel";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.matchStateDetailsPanel = _loc1_;
        BindingManager.executeBindings(this, "matchStateDetailsPanel", this.matchStateDetailsPanel);
        return _loc1_;
    }

    private function method_4789(): Group {
        var _loc1_: Group = new Group();
        _loc1_.percentWidth = 100;
        _loc1_.height = 1;
        _loc1_.top = 290;
        _loc1_.mxmlContent = [this.method_5209()];
        _loc1_.id = "_TeamDeathMatchLobbywindow_Group1";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this._TeamDeathMatchLobbywindow_Group1 = _loc1_;
        BindingManager.executeBindings(this, "_TeamDeathMatchLobbywindow_Group1", this._TeamDeathMatchLobbywindow_Group1);
        return _loc1_;
    }

    private function method_5209(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.top = 0;
        _loc1_.bottom = 0;
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.fill = this.method_3803();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function method_3803(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 2895923;
        return _loc1_;
    }

    private function method_6206(): Group {
        var _loc1_: Group = new Group();
        _loc1_.width = 10;
        _loc1_.height = 10;
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_4942(): Group {
        var _loc1_: Group = new Group();
        _loc1_.x = 0;
        _loc1_.y = 0;
        _loc1_.percentWidth = 100;
        _loc1_.height = 32;
        _loc1_.mxmlContent = [this.method_2290()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_2290(): DOButtonBase {
        var _loc1_: DOButtonBase = new DOButtonBase();
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
        _loc1_.id = "actionButton";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.actionButton = _loc1_;
        BindingManager.executeBindings(this, "actionButton", this.actionButton);
        return _loc1_;
    }

    public function method_6393(param1: FlexEvent): void {
        this.method_1566();
    }

    public function method_5199(param1: FlexEvent): void {
        this.handleCreationComplete();
    }

    private function method_6191(): Array {
        var var_5: Array = [];
        var_5[0] = new Binding(this, function (): IList {
            return lobbyListCollection;
        }, null, "matchOverview.dataProvider");
        var_5[1] = new Binding(this, function (): Object {
            return const_884;
        }, null, "matchOverview.left");
        var_5[2] = new Binding(this, function (): Object {
            return const_884;
        }, null, "matchOverview.right");
        var_5[3] = new Binding(this, function (): Object {
            return const_884;
        }, null, "matchOverview.top");
        var_5[4] = new Binding(this, function (): Object {
            return const_884;
        }, null, "matchStateDetailsPanel.left");
        var_5[5] = new Binding(this, function (): Object {
            return const_884;
        }, null, "matchStateDetailsPanel.right");
        var_5[6] = new Binding(this, function (): Object {
            return const_884;
        }, null, "_TeamDeathMatchLobbywindow_Group1.left");
        var_5[7] = new Binding(this, function (): Object {
            return const_884;
        }, null, "_TeamDeathMatchLobbywindow_Group1.right");
        return var_5;
    }

    [Bindable(event="propertyChange")]
    public function get actionButton(): DOButtonBase {
        return this.var_1027;
    }

    public function set actionButton(param1: DOButtonBase): void {
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
    public function get matchOverview(): class_980 {
        return this.var_3961;
    }

    public function set matchOverview(param1: class_980): void {
        var _loc2_: Object = this.var_3961;
        if (_loc2_ !== param1) {
            this.var_3961 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "matchOverview", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get matchStateDetailsPanel(): class_981 {
        return this.var_1142;
    }

    public function set matchStateDetailsPanel(param1: class_981): void {
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
