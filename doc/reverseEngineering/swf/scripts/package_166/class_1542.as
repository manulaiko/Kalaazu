package package_166 {

import flash.utils.getDefinitionByName;

import mx.binding.Binding;
import mx.binding.BindingManager;
import mx.binding.IBindingClient;
import mx.binding.IWatcherSetupUtil2;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IFlexModuleFactory;
import mx.core.mx_internal;

import spark.components.Image;
import spark.components.Label;
import spark.components.VGroup;

public class class_1542 extends class_1541 implements IBindingClient {

    private static var _watcherSetupUtil: IWatcherSetupUtil2;


    private var __moduleFactoryInitialized: Boolean = false;

    mx_internal var _bindings: Array;

    mx_internal var _watchers: Array;

    mx_internal var _bindingsByDestination: Object;

    mx_internal var _bindingsBeginWithWord: Object;

    public function class_1542() {
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
        bindings = this.method_245();
        watchers = [];
        target = this;
        if (_watcherSetupUtil == null) {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_battlestationswindow_view_ratings_components_StatItemWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }
        _watcherSetupUtil.setup(this, function (param1: String): * {
            return target[param1];
        }, function (param1: String): * {
            return class_1542[param1];
        }, bindings, watchers);
        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
        this.width = 36;
        this.height = 79;
        this.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_134);
        var_1 = 0;
        while (var_1 < bindings.length) {
            Binding(bindings[var_1]).execute();
            var_1++;
        }
    }

    public static function set watcherSetupUtil(param1: IWatcherSetupUtil2): void {
        class_1542._watcherSetupUtil = param1;
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

    private function method_134(): Array {
        return [this.method_1380()];
    }

    private function method_1380(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.top = 16;
        _loc1_.horizontalCenter = 0;
        _loc1_.horizontalAlign = "center";
        _loc1_.gap = 3;
        _loc1_.mxmlContent = [this.method_4196(), this.method_3907()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_4196(): Image {
        var _loc1_: Image = new Image();
        _loc1_.horizontalCenter = 0;
        _loc1_.horizontalAlign = "center";
        _loc1_.id = "statIcon";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        statIcon = _loc1_;
        BindingManager.executeBindings(this, "statIcon", statIcon);
        return _loc1_;
    }

    private function method_3907(): Label {
        var _loc1_: Label = new Label();
        _loc1_.percentWidth = 100;
        _loc1_.setStyle("textAlign", "center");
        _loc1_.setStyle("fontSize", 11);
        _loc1_.setStyle("fontFamily", "EurostileT");
        _loc1_.setStyle("color", 15327423);
        _loc1_.id = "valueLabel";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        valueLabel = _loc1_;
        BindingManager.executeBindings(this, "valueLabel", valueLabel);
        return _loc1_;
    }

    private function method_245(): Array {
        var var_5: Array = [];
        var_5[0] = new Binding(this, function (): String {
            var _loc1_: * = _tooltipText;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "this.toolTip");
        return var_5;
    }
}
}
