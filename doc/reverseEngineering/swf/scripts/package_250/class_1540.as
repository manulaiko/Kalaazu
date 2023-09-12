package package_250 {

import flash.display.BitmapData;
import flash.utils.getDefinitionByName;

import mx.binding.Binding;
import mx.binding.BindingManager;
import mx.binding.IBindingClient;
import mx.binding.IWatcherSetupUtil2;
import mx.core.IFlexModuleFactory;
import mx.core.mx_internal;
import mx.events.PropertyChangeEvent;
import mx.graphics.BitmapFill;

import package_9.ResourceManager;

import spark.primitives.Rect;
import spark.skins.SparkSkin;

public class class_1540 extends SparkSkin implements IBindingClient {

    private static var _watcherSetupUtil: IWatcherSetupUtil2;


    public var _DOProgressBarSkin_BitmapFill1: BitmapFill;

    private var __moduleFactoryInitialized: Boolean = false;

    private var var_2875: BitmapData;

    mx_internal var _bindings: Array;

    mx_internal var _watchers: Array;

    mx_internal var _bindingsByDestination: Object;

    mx_internal var _bindingsBeginWithWord: Object;

    public function class_1540() {
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
        bindings = this.method_3640();
        watchers = [];
        target = this;
        if (_watcherSetupUtil == null) {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_battlestationswindow_view_installationStatus_skins_DOProgressBarSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }
        _watcherSetupUtil.setup(this, function (param1: String): * {
            return target[param1];
        }, function (param1: String): * {
            return class_1540[param1];
        }, bindings, watchers);
        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
        this.name = "CustomProgressBarTrackSkin";
        this.height = 3;
        this.mxmlContent = [this.method_3185()];
        var_1 = 0;
        while (var_1 < bindings.length) {
            Binding(bindings[var_1]).execute();
            var_1++;
        }
    }

    public static function set watcherSetupUtil(param1: IWatcherSetupUtil2): void {
        class_1540._watcherSetupUtil = param1;
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

    override protected function initializationComplete(): void {
        super.initializationComplete();
        this._trackBgBitmapData = ResourceManager.getBitmapData("battleStationsUI", "progress_bar_bg");
    }

    private function method_3185(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 4;
        _loc1_.right = 4;
        _loc1_.top = 2;
        _loc1_.bottom = 1;
        _loc1_.height = 3;
        _loc1_.fill = this.method_1989();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function method_1989(): BitmapFill {
        var _loc1_: BitmapFill = new BitmapFill();
        this._DOProgressBarSkin_BitmapFill1 = _loc1_;
        BindingManager.executeBindings(this, "_DOProgressBarSkin_BitmapFill1", this._DOProgressBarSkin_BitmapFill1);
        return _loc1_;
    }

    private function method_3640(): Array {
        var var_5: Array = [];
        var_5[0] = new Binding(this, function (): Object {
            return _trackBgBitmapData;
        }, null, "_DOProgressBarSkin_BitmapFill1.source");
        return var_5;
    }

    [Bindable(event="propertyChange")]
    private function get _trackBgBitmapData(): BitmapData {
        return this.var_2875;
    }

    private function set _trackBgBitmapData(param1: BitmapData): void {
        var _loc2_: Object = this.var_2875;
        if (_loc2_ !== param1) {
            this.var_2875 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_trackBgBitmapData", _loc2_, param1));
            }
        }
    }
}
}
