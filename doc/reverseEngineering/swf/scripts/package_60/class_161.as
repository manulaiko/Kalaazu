package package_60 {

import flash.display.BitmapData;
import flash.utils.getDefinitionByName;

import mx.binding.Binding;
import mx.binding.BindingManager;
import mx.binding.IBindingClient;
import mx.binding.IWatcherSetupUtil2;
import mx.collections.ArrayList;
import mx.collections.IList;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IFlexModuleFactory;
import mx.core.mx_internal;
import mx.events.FlexEvent;
import mx.events.PropertyChangeEvent;

import net.bigpoint.darkorbit.mvc.common.view.components.DOWindow;

import package_167.class_1029;
import package_167.class_1035;

import spark.components.BorderContainer;
import spark.components.Button;
import spark.components.HGroup;
import spark.components.Label;
import spark.components.SkinnableContainer;
import spark.components.TabBar;
import spark.components.VGroup;
import spark.events.IndexChangeEvent;

public class class_161 extends DOWindow implements IBindingClient {

    private static var _watcherSetupUtil: IWatcherSetupUtil2;


    private var var_2111: Button;

    private var var_420: SkinnableContainer;

    private var var_1829: Label;

    private var var_2215: TabBar;

    private var var_4547: Button;

    private var var_552: Button;

    private var var_4084: BorderContainer;

    private var __moduleFactoryInitialized: Boolean = false;

    private var var_2274: ArrayList;

    private var var_4556: class_1033;

    private var var_2084: class_1036;

    private var var_3984: class_1034;

    private var var_4110: class_1027;

    private var var_252: String;

    private var var_4353: BitmapData;

    private var var_515: Class;

    private var var_1710: Class;

    private var var_4349: Class;

    private var var_4372: Class;

    mx_internal var _bindings: Array;

    mx_internal var _watchers: Array;

    mx_internal var _bindingsByDestination: Object;

    mx_internal var _bindingsBeginWithWord: Object;

    public function class_161() {
        var bindings: Array;
        var watchers: Array;
        var var_1: uint;
        var target: Object = null;
        var watcherSetupUtilClass: Object = null;
        this.var_2274 = new ArrayList([{"label": "Display"}, {"label": "Gameplay"}, {"label": "Interface"}, {"label": "Sound"}]);
        this.var_515 = class_1028;
        this.var_1710 = class_1032;
        this.var_4349 = class_1030;
        this.var_4372 = class_1031;
        this.mx_internal::_bindings = [];
        this.mx_internal::_watchers = [];
        this.mx_internal::_bindingsByDestination = {};
        this.mx_internal::_bindingsBeginWithWord = {};
        super();
        mx_internal::_document = this;
        bindings = this.method_1775();
        watchers = [];
        target = this;
        if (_watcherSetupUtil == null) {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_settings_view_components_SettingsWindowWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }
        _watcherSetupUtil.setup(this, function (param1: String): * {
            return target[param1];
        }, function (param1: String): * {
            return class_161[param1];
        }, bindings, watchers);
        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
        this.styleName = "settingsWindow";
        this.title = "Settings | Rework";
        this.width = 420;
        this.height = 480;
        this.minWidth = 420;
        this.minHeight = 480;
        this.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_2113);
        this.addEventListener("creationComplete", this.method_5091);
        var_1 = 0;
        while (var_1 < bindings.length) {
            Binding(bindings[var_1]).execute();
            var_1++;
        }
    }

    public static function set watcherSetupUtil(param1: IWatcherSetupUtil2): void {
        class_161._watcherSetupUtil = param1;
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

    private function handleCreationComplete(): void {
        this.var_252 = "Display";
        this.var_4556 = new class_1033();
        this.currentOpenTabContent.addElement(this.var_4556);
    }

    private function method_1005(param1: IndexChangeEvent): void {
        var _loc2_: String = TabBar(param1.target).selectedItem.label;
        this.debugLabel.text = "Selected Tab: " + _loc2_;
        if (this.var_252 == _loc2_) {
            return;
        }
        this.var_252 = _loc2_;
        switch (_loc2_) {
            case "Display":
                this.currentOpenTabContent.removeAllElements();
                this.var_4556 = new class_1033();
                this.currentOpenTabContent.addElement(this.var_4556);
                break;
            case "Gameplay":
                this.currentOpenTabContent.removeAllElements();
                this.var_2084 = new class_1036();
                this.currentOpenTabContent.addElement(this.var_2084);
                break;
            case "Interface":
                this.currentOpenTabContent.removeAllElements();
                this.var_3984 = new class_1034();
                this.currentOpenTabContent.addElement(this.var_3984);
                break;
            case "Sound":
                this.currentOpenTabContent.removeAllElements();
                this.var_4110 = new class_1027();
                this.currentOpenTabContent.addElement(this.var_4110);
        }
    }

    private function method_2113(): Array {
        return [this.method_392(), this.method_5041(), this.method_2245()];
    }

    private function method_392(): BorderContainer {
        var _loc1_: BorderContainer = new BorderContainer();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_3374);
        _loc1_.setStyle("backgroundAlpha", 0);
        _loc1_.id = "settingsWindowContent";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.settingsWindowContent = _loc1_;
        BindingManager.executeBindings(this, "settingsWindowContent", this.settingsWindowContent);
        return _loc1_;
    }

    private function method_3374(): Array {
        return [this.method_5086()];
    }

    private function method_5086(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.percentWidth = 100;
        _loc1_.mxmlContent = [this.method_3939(), this.method_6430()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_3939(): TabBar {
        var _loc1_: TabBar = new TabBar();
        _loc1_.top = 5;
        _loc1_.setStyle("skinClass", class_1029);
        _loc1_.addEventListener("change", this.method_5779);
        _loc1_.id = "mainTabBar";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.mainTabBar = _loc1_;
        BindingManager.executeBindings(this, "mainTabBar", this.mainTabBar);
        return _loc1_;
    }

    public function method_5779(param1: IndexChangeEvent): void {
        this.method_1005(param1);
    }

    private function method_6430(): SkinnableContainer {
        var _loc1_: SkinnableContainer = new SkinnableContainer();
        _loc1_.percentWidth = 100;
        _loc1_.id = "currentOpenTabContent";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.currentOpenTabContent = _loc1_;
        BindingManager.executeBindings(this, "currentOpenTabContent", this.currentOpenTabContent);
        return _loc1_;
    }

    private function method_5041(): HGroup {
        var _loc1_: HGroup = new HGroup();
        _loc1_.bottom = 5;
        _loc1_.mxmlContent = [this.method_3938(), this.method_6345(), this.method_3542()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_3938(): Button {
        var _loc1_: Button = new Button();
        _loc1_.label = "Save";
        _loc1_.setStyle("skinClass", class_1035);
        _loc1_.id = "saveBtn";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.saveBtn = _loc1_;
        BindingManager.executeBindings(this, "saveBtn", this.saveBtn);
        return _loc1_;
    }

    private function method_6345(): Button {
        var _loc1_: Button = new Button();
        _loc1_.label = "Cancel";
        _loc1_.setStyle("skinClass", class_1035);
        _loc1_.id = "cancelBtn";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.cancelBtn = _loc1_;
        BindingManager.executeBindings(this, "cancelBtn", this.cancelBtn);
        return _loc1_;
    }

    private function method_3542(): Button {
        var _loc1_: Button = new Button();
        _loc1_.label = "Reset";
        _loc1_.setStyle("skinClass", class_1035);
        _loc1_.id = "resetBtn";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.resetBtn = _loc1_;
        BindingManager.executeBindings(this, "resetBtn", this.resetBtn);
        return _loc1_;
    }

    private function method_2245(): Label {
        var _loc1_: Label = new Label();
        _loc1_.bottom = 25;
        _loc1_.setStyle("color", 16777215);
        _loc1_.id = "debugLabel";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.debugLabel = _loc1_;
        BindingManager.executeBindings(this, "debugLabel", this.debugLabel);
        return _loc1_;
    }

    public function method_5091(param1: FlexEvent): void {
        this.handleCreationComplete();
    }

    private function method_1775(): Array {
        var var_5: Array = [];
        var_5[0] = new Binding(this, function (): IList {
            return tabList;
        }, null, "mainTabBar.dataProvider");
        return var_5;
    }

    [Bindable(event="propertyChange")]
    public function get cancelBtn(): Button {
        return this.var_2111;
    }

    public function set cancelBtn(param1: Button): void {
        var _loc2_: Object = this.var_2111;
        if (_loc2_ !== param1) {
            this.var_2111 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cancelBtn", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get currentOpenTabContent(): SkinnableContainer {
        return this.var_420;
    }

    public function set currentOpenTabContent(param1: SkinnableContainer): void {
        var _loc2_: Object = this.var_420;
        if (_loc2_ !== param1) {
            this.var_420 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "currentOpenTabContent", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get debugLabel(): Label {
        return this.var_1829;
    }

    public function set debugLabel(param1: Label): void {
        var _loc2_: Object = this.var_1829;
        if (_loc2_ !== param1) {
            this.var_1829 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "debugLabel", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get mainTabBar(): TabBar {
        return this.var_2215;
    }

    public function set mainTabBar(param1: TabBar): void {
        var _loc2_: Object = this.var_2215;
        if (_loc2_ !== param1) {
            this.var_2215 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mainTabBar", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get resetBtn(): Button {
        return this.var_4547;
    }

    public function set resetBtn(param1: Button): void {
        var _loc2_: Object = this.var_4547;
        if (_loc2_ !== param1) {
            this.var_4547 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "resetBtn", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get saveBtn(): Button {
        return this.var_552;
    }

    public function set saveBtn(param1: Button): void {
        var _loc2_: Object = this.var_552;
        if (_loc2_ !== param1) {
            this.var_552 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "saveBtn", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get settingsWindowContent(): BorderContainer {
        return this.var_4084;
    }

    public function set settingsWindowContent(param1: BorderContainer): void {
        var _loc2_: Object = this.var_4084;
        if (_loc2_ !== param1) {
            this.var_4084 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "settingsWindowContent", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    private function get tabList(): ArrayList {
        return this.var_2274;
    }

    private function set tabList(param1: ArrayList): void {
        var _loc2_: Object = this.var_2274;
        if (_loc2_ !== param1) {
            this.var_2274 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabList", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    private function get btm(): BitmapData {
        return this.var_4353;
    }

    private function set btm(param1: BitmapData): void {
        var _loc2_: Object = this.var_4353;
        if (_loc2_ !== param1) {
            this.var_4353 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btm", _loc2_, param1));
            }
        }
    }
}
}
