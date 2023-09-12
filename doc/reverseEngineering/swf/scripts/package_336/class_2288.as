package package_336 {

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

import spark.components.HGroup;
import spark.components.Label;
import spark.components.SkinnableContainer;

public class class_2288 extends SkinnableContainer implements IBindingClient {

    private static var _watcherSetupUtil: IWatcherSetupUtil2;


    private var var_462: Label;

    private var var_3907: Label;

    private var __moduleFactoryInitialized: Boolean = false;

    private var var_4193: String;

    private var name_31: int;

    mx_internal var _bindings: Array;

    mx_internal var _watchers: Array;

    mx_internal var _bindingsByDestination: Object;

    mx_internal var _bindingsBeginWithWord: Object;

    public function class_2288() {
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
        bindings = this.method_2718();
        watchers = [];
        target = this;
        if (_watcherSetupUtil == null) {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_questWindow_view_questsSection_questRewards_renderers_RewardsListItemRendererContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }
        _watcherSetupUtil.setup(this, function (param1: String): * {
            return target[param1];
        }, function (param1: String): * {
            return class_2288[param1];
        }, bindings, watchers);
        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
        this.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_5783);
        this.addEventListener("creationComplete", this.method_1156);
        var_1 = 0;
        while (var_1 < bindings.length) {
            Binding(bindings[var_1]).execute();
            var_1++;
        }
    }

    public static function set watcherSetupUtil(param1: IWatcherSetupUtil2): void {
        class_2288._watcherSetupUtil = param1;
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

    private function creationCompleteHandler(param1: FlexEvent): void {
        this.rewardNameLabel.setStyle("color", getStyle("rewardNameFontColor"));
        this.amountLabel.setStyle("color", getStyle("amountFontColor"));
    }

    private function method_5783(): Array {
        return [this.method_6403()];
    }

    private function method_6403(): HGroup {
        var _loc1_: HGroup = new HGroup();
        _loc1_.percentWidth = 100;
        _loc1_.mxmlContent = [this.method_4075(), this.method_857()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_4075(): Label {
        var _loc1_: Label = new Label();
        _loc1_.setStyle("fontFamily", "EurostileT");
        _loc1_.id = "rewardNameLabel";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.rewardNameLabel = _loc1_;
        BindingManager.executeBindings(this, "rewardNameLabel", this.rewardNameLabel);
        return _loc1_;
    }

    private function method_857(): Label {
        var _loc1_: Label = new Label();
        _loc1_.setStyle("fontFamily", "EurostileT");
        _loc1_.id = "amountLabel";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.amountLabel = _loc1_;
        BindingManager.executeBindings(this, "amountLabel", this.amountLabel);
        return _loc1_;
    }

    public function method_1156(param1: FlexEvent): void {
        this.creationCompleteHandler(param1);
    }

    private function method_2718(): Array {
        var var_5: Array = [];
        var_5[0] = new Binding(this, null, null, "rewardNameLabel.text", "rewardName");
        var_5[1] = new Binding(this, function (): uint {
            return getStyle("rewardNameFontColor");
        }, function (param1: uint): void {
            rewardNameLabel.setStyle("color", param1);
        }, "rewardNameLabel.color");
        var_5[2] = new Binding(this, function (): Number {
            return getStyle("labelsPaddingTop");
        }, function (param1: Number): void {
            rewardNameLabel.setStyle("paddingTop", param1);
        }, "rewardNameLabel.paddingTop");
        var_5[3] = new Binding(this, function (): Number {
            return getStyle("labelsPaddingBottom");
        }, function (param1: Number): void {
            rewardNameLabel.setStyle("paddingBottom", param1);
        }, "rewardNameLabel.paddingBottom");
        var_5[4] = new Binding(this, null, null, "amountLabel.text", "amount");
        var_5[5] = new Binding(this, function (): uint {
            return getStyle("amountFontColor");
        }, function (param1: uint): void {
            amountLabel.setStyle("color", param1);
        }, "amountLabel.color");
        var_5[6] = new Binding(this, function (): Number {
            return getStyle("labelsPaddingTop");
        }, function (param1: Number): void {
            amountLabel.setStyle("paddingTop", param1);
        }, "amountLabel.paddingTop");
        var_5[7] = new Binding(this, function (): Number {
            return getStyle("labelsPaddingBottom");
        }, function (param1: Number): void {
            amountLabel.setStyle("paddingBottom", param1);
        }, "amountLabel.paddingBottom");
        return var_5;
    }

    [Bindable(event="propertyChange")]
    public function get amountLabel(): Label {
        return this.var_462;
    }

    public function set amountLabel(param1: Label): void {
        var _loc2_: Object = this.var_462;
        if (_loc2_ !== param1) {
            this.var_462 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "amountLabel", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get rewardNameLabel(): Label {
        return this.var_3907;
    }

    public function set rewardNameLabel(param1: Label): void {
        var _loc2_: Object = this.var_3907;
        if (_loc2_ !== param1) {
            this.var_3907 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rewardNameLabel", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get rewardName(): String {
        return this.var_4193;
    }

    public function set rewardName(param1: String): void {
        var _loc2_: Object = this.var_4193;
        if (_loc2_ !== param1) {
            this.var_4193 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rewardName", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get amount(): int {
        return this.name_31;
    }

    public function set amount(param1: int): void {
        var _loc2_: Object = this.name_31;
        if (_loc2_ !== param1) {
            this.name_31 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "amount", _loc2_, param1));
            }
        }
    }
}
}
