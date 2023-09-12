package package_156 {

import flash.utils.getDefinitionByName;

import mx.binding.Binding;
import mx.binding.BindingManager;
import mx.binding.IBindingClient;
import mx.binding.IWatcherSetupUtil2;
import mx.core.IFlexModuleFactory;
import mx.core.mx_internal;
import mx.events.PropertyChangeEvent;

import net.bigpoint.darkorbit.mvc.companyhierarchy.model.vo.IRankedClanViewData;
import net.bigpoint.darkorbit.mvc.companyhierarchy.model.vo.class_1001;

import package_55.class_1000;

import spark.components.supportClasses.ItemRenderer;

public class class_1002 extends ItemRenderer implements IBindingClient {

    private static var _watcherSetupUtil: IWatcherSetupUtil2;


    private var var_3965: class_1000;

    private var __moduleFactoryInitialized: Boolean = false;

    mx_internal var _bindings: Array;

    mx_internal var _watchers: Array;

    mx_internal var _bindingsByDestination: Object;

    mx_internal var _bindingsBeginWithWord: Object;

    public function class_1002() {
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
        bindings = this.method_1276();
        watchers = [];
        target = this;
        if (_watcherSetupUtil == null) {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_companyhierarchy_itemrenderers_RankedClanItemRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }
        _watcherSetupUtil.setup(this, function (param1: String): * {
            return target[param1];
        }, function (param1: String): * {
            return class_1002[param1];
        }, bindings, watchers);
        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
        this.percentWidth = 100;
        this.mxmlContent = [this.method_4869()];
        var_1 = 0;
        while (var_1 < bindings.length) {
            Binding(bindings[var_1]).execute();
            var_1++;
        }
    }

    public static function set watcherSetupUtil(param1: IWatcherSetupUtil2): void {
        class_1002._watcherSetupUtil = param1;
    }

    override public function set moduleFactory(param1: IFlexModuleFactory): void {
        var factory: IFlexModuleFactory = param1;
        super.moduleFactory = factory;
        if (this.__moduleFactoryInitialized) {
            return;
        }
        this.__moduleFactoryInitialized = true;
        if (!this.styleDeclaration) {
            this.styleDeclaration = new CSSStyleDeclaration(null, styleManager);
        }
        this.styleDeclaration.defaultFactory = function (): void {
            this.focusColor = 16711680;
        };
    }

    override public function initialize(): void {
        super.initialize();
    }

    override protected function set hovered(param1: Boolean): void {
        super.hovered = false;
    }

    override public function set selected(param1: Boolean): void {
        super.selected = false;
        this.showsCaret = false;
    }

    private function method_4869(): class_1000 {
        var _loc1_: class_1000 = new class_1000();
        _loc1_.percentWidth = 100;
        _loc1_.id = "rci";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.rci = _loc1_;
        BindingManager.executeBindings(this, "rci", this.rci);
        return _loc1_;
    }

    private function method_1276(): Array {
        var var_5: Array = [];
        var_5[0] = new Binding(this, function (): IRankedClanViewData {
            return data as class_1001;
        }, null, "rci.rankedClanVO");
        return var_5;
    }

    [Bindable(event="propertyChange")]
    public function get rci(): class_1000 {
        return this.var_3965;
    }

    public function set rci(param1: class_1000): void {
        var _loc2_: Object = this.var_3965;
        if (_loc2_ !== param1) {
            this.var_3965 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rci", _loc2_, param1));
            }
        }
    }
}
}
