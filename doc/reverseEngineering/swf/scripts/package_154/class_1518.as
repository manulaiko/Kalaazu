package package_154 {

import flash.display.Bitmap;
import flash.utils.getDefinitionByName;

import mx.binding.Binding;
import mx.binding.BindingManager;
import mx.binding.IBindingClient;
import mx.binding.IWatcherSetupUtil2;
import mx.core.IFlexModuleFactory;
import mx.core.IStateClient2;
import mx.core.mx_internal;
import mx.events.FlexEvent;
import mx.events.PropertyChangeEvent;
import mx.states.SetProperty;
import mx.states.State;

import package_9.ResourceManager;

import spark.components.Button;
import spark.components.Group;
import spark.primitives.BitmapImage;
import spark.skins.SparkSkin;

public class class_1518 extends SparkSkin implements IBindingClient, IStateClient2 {

    private static var _watcherSetupUtil: IWatcherSetupUtil2;


    private var var_3359: BitmapImage;

    private var var_1492: SetProperty;

    private var var_4465: SetProperty;

    private var var_3243: SetProperty;

    private var var_3179: SetProperty;

    private var __moduleFactoryInitialized: Boolean = false;

    private var var_4731: Bitmap;

    private var var_4873: Bitmap;

    mx_internal var _bindings: Array;

    mx_internal var _watchers: Array;

    mx_internal var _bindingsByDestination: Object;

    mx_internal var _bindingsBeginWithWord: Object;

    private var _213507019hostComponent: Button;

    public function class_1518() {
        var watchers: Array;
        var var_1: uint;
        var bindings: Array = null;
        var target: Object = null;
        var watcherSetupUtilClass: Object = null;
        this.mx_internal::_bindings = [];
        this.mx_internal::_watchers = [];
        this.mx_internal::_bindingsByDestination = {};
        this.mx_internal::_bindingsBeginWithWord = {};
        super();
        mx_internal::_document = this;
        bindings = this.method_121();
        watchers = [];
        target = this;
        if (_watcherSetupUtil == null) {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_battlestationswindow_view_skins_DOHSliderThumbSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }
        _watcherSetupUtil.setup(this, function (param1: String): * {
            return target[param1];
        }, function (param1: String): * {
            return class_1518[param1];
        }, bindings, watchers);
        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
        this.mxmlContent = [this.method_1560()];
        this.currentState = "up";
        this.addEventListener("creationComplete", this.method_3023);
        states = [new State({
            "name": "up",
            "overrides": [this._DOHSliderThumbSkin_SetProperty1 = SetProperty(new SetProperty().initializeFromObject({
                "target": "_DOHSliderThumbSkin_BitmapImage1",
                "name": "source",
                "value": undefined
            }))]
        }), new State({
            "name": "over",
            "overrides": [this._DOHSliderThumbSkin_SetProperty2 = SetProperty(new SetProperty().initializeFromObject({
                "target": "_DOHSliderThumbSkin_BitmapImage1",
                "name": "source",
                "value": undefined
            }))]
        }), new State({
            "name": "down",
            "overrides": [this._DOHSliderThumbSkin_SetProperty3 = SetProperty(new SetProperty().initializeFromObject({
                "target": "_DOHSliderThumbSkin_BitmapImage1",
                "name": "source",
                "value": undefined
            }))]
        }), new State({
            "name": "disabled",
            "overrides": [this._DOHSliderThumbSkin_SetProperty4 = SetProperty(new SetProperty().initializeFromObject({
                "target": "_DOHSliderThumbSkin_BitmapImage1",
                "name": "source",
                "value": undefined
            }))]
        })];
        BindingManager.executeBindings(this, "_DOHSliderThumbSkin_SetProperty1", this._DOHSliderThumbSkin_SetProperty1);
        BindingManager.executeBindings(this, "_DOHSliderThumbSkin_SetProperty2", this._DOHSliderThumbSkin_SetProperty2);
        BindingManager.executeBindings(this, "_DOHSliderThumbSkin_SetProperty3", this._DOHSliderThumbSkin_SetProperty3);
        BindingManager.executeBindings(this, "_DOHSliderThumbSkin_SetProperty4", this._DOHSliderThumbSkin_SetProperty4);
        var_1 = 0;
        while (var_1 < bindings.length) {
            Binding(bindings[var_1]).execute();
            var_1++;
        }
    }

    public static function set watcherSetupUtil(param1: IWatcherSetupUtil2): void {
        class_1518._watcherSetupUtil = param1;
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
        this._normalStateBitmap = ResourceManager.getBitmap("battleStationsUI", "slider_handle_normal");
        this._rollOverStateBitmap = ResourceManager.getBitmap("battleStationsUI", "slider_handle_hover");
    }

    override protected function initializationComplete(): void {
        useChromeColor = true;
        super.initializationComplete();
    }

    private function method_1560(): Group {
        var _loc1_: Group = new Group();
        _loc1_.mxmlContent = [this.method_4755()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_4755(): BitmapImage {
        var _loc1_: BitmapImage = new BitmapImage();
        _loc1_.initialized(this, "_DOHSliderThumbSkin_BitmapImage1");
        this._DOHSliderThumbSkin_BitmapImage1 = _loc1_;
        BindingManager.executeBindings(this, "_DOHSliderThumbSkin_BitmapImage1", this._DOHSliderThumbSkin_BitmapImage1);
        return _loc1_;
    }

    public function method_3023(param1: FlexEvent): void {
        this.creationCompleteHandler(param1);
    }

    private function method_121(): Array {
        var var_5: Array = [];
        var_5[0] = new Binding(this, function (): * {
            return _normalStateBitmap;
        }, null, "_DOHSliderThumbSkin_SetProperty1.value");
        var_5[1] = new Binding(this, function (): * {
            return _rollOverStateBitmap;
        }, null, "_DOHSliderThumbSkin_SetProperty2.value");
        var_5[2] = new Binding(this, function (): * {
            return _normalStateBitmap;
        }, null, "_DOHSliderThumbSkin_SetProperty3.value");
        var_5[3] = new Binding(this, function (): * {
            return _normalStateBitmap;
        }, null, "_DOHSliderThumbSkin_SetProperty4.value");
        return var_5;
    }

    [Bindable(event="propertyChange")]
    public function get _DOHSliderThumbSkin_BitmapImage1(): BitmapImage {
        return this.var_3359;
    }

    public function set _DOHSliderThumbSkin_BitmapImage1(param1: BitmapImage): void {
        var _loc2_: Object = this.var_3359;
        if (_loc2_ !== param1) {
            this.var_3359 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_DOHSliderThumbSkin_BitmapImage1", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get _DOHSliderThumbSkin_SetProperty1(): SetProperty {
        return this.var_1492;
    }

    public function set _DOHSliderThumbSkin_SetProperty1(param1: SetProperty): void {
        var _loc2_: Object = this.var_1492;
        if (_loc2_ !== param1) {
            this.var_1492 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_DOHSliderThumbSkin_SetProperty1", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get _DOHSliderThumbSkin_SetProperty2(): SetProperty {
        return this.var_4465;
    }

    public function set _DOHSliderThumbSkin_SetProperty2(param1: SetProperty): void {
        var _loc2_: Object = this.var_4465;
        if (_loc2_ !== param1) {
            this.var_4465 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_DOHSliderThumbSkin_SetProperty2", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get _DOHSliderThumbSkin_SetProperty3(): SetProperty {
        return this.var_3243;
    }

    public function set _DOHSliderThumbSkin_SetProperty3(param1: SetProperty): void {
        var _loc2_: Object = this.var_3243;
        if (_loc2_ !== param1) {
            this.var_3243 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_DOHSliderThumbSkin_SetProperty3", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get _DOHSliderThumbSkin_SetProperty4(): SetProperty {
        return this.var_3179;
    }

    public function set _DOHSliderThumbSkin_SetProperty4(param1: SetProperty): void {
        var _loc2_: Object = this.var_3179;
        if (_loc2_ !== param1) {
            this.var_3179 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_DOHSliderThumbSkin_SetProperty4", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    private function get _normalStateBitmap(): Bitmap {
        return this.var_4731;
    }

    private function set _normalStateBitmap(param1: Bitmap): void {
        var _loc2_: Object = this.var_4731;
        if (_loc2_ !== param1) {
            this.var_4731 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_normalStateBitmap", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    private function get _rollOverStateBitmap(): Bitmap {
        return this.var_4873;
    }

    private function set _rollOverStateBitmap(param1: Bitmap): void {
        var _loc2_: Object = this.var_4873;
        if (_loc2_ !== param1) {
            this.var_4873 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_rollOverStateBitmap", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get hostComponent(): Button {
        return this._213507019hostComponent;
    }

    public function set hostComponent(param1: Button): void {
        var _loc2_: Object = this._213507019hostComponent;
        if (_loc2_ !== param1) {
            this._213507019hostComponent = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hostComponent", _loc2_, param1));
            }
        }
    }
}
}
