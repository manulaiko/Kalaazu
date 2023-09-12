package package_336 {

import flash.events.Event;
import flash.utils.getDefinitionByName;

import mx.binding.Binding;
import mx.binding.BindingManager;
import mx.binding.IBindingClient;
import mx.binding.IWatcherSetupUtil2;
import mx.core.IFlexModuleFactory;
import mx.core.mx_internal;
import mx.events.PropertyChangeEvent;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.mvc.questWindow.model.vo.class_1055;

import spark.components.supportClasses.ItemRenderer;

public class class_1897 extends ItemRenderer implements IBindingClient {

    public static const const_1746: String = "layoutChanged";

    private static var _watcherSetupUtil: IWatcherSetupUtil2;


    private var var_846: class_2288;

    private var __moduleFactoryInitialized: Boolean = false;

    mx_internal var _bindings: Array;

    mx_internal var _watchers: Array;

    mx_internal var _bindingsByDestination: Object;

    mx_internal var _bindingsBeginWithWord: Object;

    public function class_1897() {
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
        bindings = this.method_4326();
        watchers = [];
        target = this;
        if (_watcherSetupUtil == null) {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_questWindow_view_questsSection_questRewards_renderers_RewardsListItemRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }
        _watcherSetupUtil.setup(this, function (param1: String): * {
            return target[param1];
        }, function (param1: String): * {
            return class_1897[param1];
        }, bindings, watchers);
        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
        this.autoDrawBackground = false;
        this.mxmlContent = [this.method_5067()];
        var_1 = 0;
        while (var_1 < bindings.length) {
            Binding(bindings[var_1]).execute();
            var_1++;
        }
    }

    public static function set watcherSetupUtil(param1: IWatcherSetupUtil2): void {
        class_1897._watcherSetupUtil = param1;
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

    [Bindable(event="dataChange")]
    private function get rewardData(): class_1055 {
        this.rendererContent.rewardNameLabel.addEventListener(Event.RESIZE, this.method_5690);
        return data as class_1055;
    }

    private function method_5690(param1: Event): void {
        dispatchEvent(new Event(class_1897.const_1746, true));
    }

    private function method_5067(): class_2288 {
        var _loc1_: class_2288 = new class_2288();
        _loc1_.id = "rendererContent";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.rendererContent = _loc1_;
        BindingManager.executeBindings(this, "rendererContent", this.rendererContent);
        return _loc1_;
    }

    private function method_4326(): Array {
        var var_5: Array = [];
        var_5[0] = new Binding(this, function (): String {
            var _loc1_: * = class_88.method_734("items", "items_" + rewardData.lootId.toString() + "_fullname");
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "rendererContent.rewardName");
        var_5[1] = new Binding(this, function (): int {
            return rewardData.amount;
        }, null, "rendererContent.amount");
        return var_5;
    }

    [Bindable(event="propertyChange")]
    public function get rendererContent(): class_2288 {
        return this.var_846;
    }

    public function set rendererContent(param1: class_2288): void {
        var _loc2_: Object = this.var_846;
        if (_loc2_ !== param1) {
            this.var_846 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rendererContent", _loc2_, param1));
            }
        }
    }
}
}
