package package_59 {

import flash.events.MouseEvent;
import flash.utils.getDefinitionByName;

import mx.binding.Binding;
import mx.binding.BindingManager;
import mx.binding.IBindingClient;
import mx.binding.IWatcherSetupUtil2;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IFlexModuleFactory;
import mx.core.mx_internal;
import mx.events.FlexEvent;
import mx.events.PropertyChangeEvent;

import net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase;
import net.bigpoint.darkorbit.mvc.common.view.skins.DOButtonBaseSkin;
import net.bigpoint.darkorbit.mvc.common.view.skins.DOViewContainerSkin;

import package_162.class_1016;

import package_164.class_1020;

import package_165.class_1022;

import package_166.class_1026;

import spark.components.Group;
import spark.components.Label;
import spark.components.SkinnableContainer;
import spark.components.VGroup;

public class class_159 extends class_158 implements IBindingClient {

    private static var _watcherSetupUtil: IWatcherSetupUtil2;


    private var _1719531403bigTopLevelHoldingGroupObjectThingy: Group;

    private var _315970861groupDepth1: VGroup;

    private var __moduleFactoryInitialized: Boolean = false;

    mx_internal var _bindings: Array;

    mx_internal var _watchers: Array;

    mx_internal var _bindingsByDestination: Object;

    mx_internal var _bindingsBeginWithWord: Object;

    public function class_159() {
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
        bindings = this.method_4602();
        watchers = [];
        target = this;
        if (_watcherSetupUtil == null) {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_battlestationswindow_view_BattleStationBuildWindowViewWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }
        _watcherSetupUtil.setup(this, function (param1: String): * {
            return target[param1];
        }, function (param1: String): * {
            return class_159[param1];
        }, bindings, watchers);
        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
        this.styleName = "battleStationBuildWindow";
        this.title = "Battle Station Installation";
        this.width = 250;
        this.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_735);
        this.addEventListener("creationComplete", this.method_358);
        var_1 = 0;
        while (var_1 < bindings.length) {
            Binding(bindings[var_1]).execute();
            var_1++;
        }
    }

    public static function set watcherSetupUtil(param1: IWatcherSetupUtil2): void {
        class_159._watcherSetupUtil = param1;
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

    override public function set height(param1: Number): void {
        super.height = param1;
    }

    private function method_735(): Array {
        return [this.method_1141()];
    }

    private function method_1141(): Group {
        var _loc1_: Group = new Group();
        _loc1_.top = 0;
        _loc1_.left = 13;
        _loc1_.percentHeight = 100;
        _loc1_.mxmlContent = [this.method_2068()];
        _loc1_.id = "bigTopLevelHoldingGroupObjectThingy";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.bigTopLevelHoldingGroupObjectThingy = _loc1_;
        BindingManager.executeBindings(this, "bigTopLevelHoldingGroupObjectThingy", this.bigTopLevelHoldingGroupObjectThingy);
        return _loc1_;
    }

    private function method_2068(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.horizontalAlign = "center";
        _loc1_.gap = 10;
        _loc1_.mxmlContent = [this.method_5075(), this.method_6279(), this.method_4716()];
        _loc1_.id = "groupDepth1";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.groupDepth1 = _loc1_;
        BindingManager.executeBindings(this, "groupDepth1", this.groupDepth1);
        return _loc1_;
    }

    private function method_5075(): class_1020 {
        var _loc1_: class_1020 = new class_1020();
        _loc1_.percentWidth = 100;
        _loc1_.id = "moduleInventoryView";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        moduleInventoryView = _loc1_;
        BindingManager.executeBindings(this, "moduleInventoryView", moduleInventoryView);
        return _loc1_;
    }

    private function method_6279(): class_1016 {
        var _loc1_: class_1016 = new class_1016();
        _loc1_.percentWidth = 100;
        _loc1_.id = "moduleInstallationView";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        moduleInstallationView = _loc1_;
        BindingManager.executeBindings(this, "moduleInstallationView", moduleInstallationView);
        return _loc1_;
    }

    private function method_4716(): Group {
        var _loc1_: Group = new Group();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.mxmlContent = [this.method_4491(), this.method_6009(), this.method_6364()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_4491(): class_1022 {
        var _loc1_: class_1022 = new class_1022();
        _loc1_.percentHeight = 100;
        _loc1_.visible = true;
        _loc1_.id = "installationStatusView";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        installationStatusView = _loc1_;
        BindingManager.executeBindings(this, "installationStatusView", installationStatusView);
        return _loc1_;
    }

    private function method_6009(): class_1026 {
        var _loc1_: class_1026 = new class_1026();
        _loc1_.percentHeight = 100;
        _loc1_.visible = false;
        _loc1_.id = "ratingsView";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        ratingsView = _loc1_;
        BindingManager.executeBindings(this, "ratingsView", ratingsView);
        return _loc1_;
    }

    private function method_6364(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.percentWidth = 100;
        _loc1_.bottom = 5;
        _loc1_.mxmlContent = [this.method_6134(), this.method_2563()];
        _loc1_.id = "oreTradeSection";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        oreTradeSection = _loc1_;
        BindingManager.executeBindings(this, "oreTradeSection", oreTradeSection);
        return _loc1_;
    }

    private function method_6134(): Label {
        var _loc1_: Label = new Label();
        _loc1_.text = "Erzhandel";
        _loc1_.setStyle("fontSize", 13);
        _loc1_.setStyle("fontFamily", "EurostileTHea");
        _loc1_.setStyle("color", 16763904);
        _loc1_.setStyle("paddingBottom", -4);
        _loc1_.id = "oreTradeTitle";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        oreTradeTitle = _loc1_;
        BindingManager.executeBindings(this, "oreTradeTitle", oreTradeTitle);
        return _loc1_;
    }

    private function method_2563(): SkinnableContainer {
        var _loc1_: SkinnableContainer = new SkinnableContainer();
        _loc1_.percentWidth = 100;
        _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_3830);
        _loc1_.setStyle("skinClass", DOViewContainerSkin);
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_3830(): Array {
        return [this.method_2704()];
    }

    private function method_2704(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.gap = -5;
        _loc1_.top = 3;
        _loc1_.mxmlContent = [this.method_287()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_287(): DOButtonBase {
        var _loc1_: DOButtonBase = new DOButtonBase();
        _loc1_.percentWidth = 100;
        _loc1_.enabled = true;
        _loc1_.styleName = "scalableGreenConfirmButton";
        _loc1_.mouseChildren = false;
        _loc1_.buttonMode = true;
        _loc1_.label = "Verkaufe Erze";
        _loc1_.setStyle("fontSize", 14);
        _loc1_.setStyle("color", 16777215);
        _loc1_.setStyle("skinClass", DOButtonBaseSkin);
        _loc1_.addEventListener("click", this.method_300);
        _loc1_.id = "oreTradeButton";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        oreTradeButton = _loc1_;
        BindingManager.executeBindings(this, "oreTradeButton", oreTradeButton);
        return _loc1_;
    }

    public function method_300(param1: MouseEvent): void {
        method_2013();
    }

    public function method_358(param1: FlexEvent): void {
        method_453();
    }

    private function method_4602(): Array {
        var var_5: Array = [];
        var_5[0] = new Binding(this, function (): Number {
            return _windowHeight;
        }, null, "this.height");
        return var_5;
    }

    [Bindable(event="propertyChange")]
    public function get bigTopLevelHoldingGroupObjectThingy(): Group {
        return this._1719531403bigTopLevelHoldingGroupObjectThingy;
    }

    public function set bigTopLevelHoldingGroupObjectThingy(param1: Group): void {
        var _loc2_: Object = this._1719531403bigTopLevelHoldingGroupObjectThingy;
        if (_loc2_ !== param1) {
            this._1719531403bigTopLevelHoldingGroupObjectThingy = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bigTopLevelHoldingGroupObjectThingy", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get groupDepth1(): VGroup {
        return this._315970861groupDepth1;
    }

    public function set groupDepth1(param1: VGroup): void {
        var _loc2_: Object = this._315970861groupDepth1;
        if (_loc2_ !== param1) {
            this._315970861groupDepth1 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "groupDepth1", _loc2_, param1));
            }
        }
    }
}
}
