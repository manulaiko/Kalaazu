package package_167 {

import flash.display.BitmapData;
import flash.geom.Rectangle;
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
import mx.states.SetStyle;
import mx.states.State;

import net.bigpoint.as3toolbox.guicomponents.components.Scale9GridImage;

import package_9.ResourceManager;

import spark.components.Button;
import spark.components.Label;
import spark.skins.SparkSkin;

public class class_1035 extends SparkSkin implements IBindingClient, IStateClient2 {

    private static var _watcherSetupUtil: IWatcherSetupUtil2;


    private var _1184053038labelDisplay: Label;

    private var _1404868679scale9Graphic: Scale9GridImage;

    private var __moduleFactoryInitialized: Boolean = false;

    private var var_2154: BitmapData;

    mx_internal var _bindings: Array;

    mx_internal var _watchers: Array;

    mx_internal var _bindingsByDestination: Object;

    mx_internal var _bindingsBeginWithWord: Object;

    private var _213507019hostComponent: Button;

    public function class_1035() {
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
        bindings = this.method_5200();
        watchers = [];
        target = this;
        if (_watcherSetupUtil == null) {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_settings_view_skins_DOButtonSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }
        _watcherSetupUtil.setup(this, function (param1: String): * {
            return target[param1];
        }, function (param1: String): * {
            return class_1035[param1];
        }, bindings, watchers);
        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
        this.mxmlContent = [this.method_5506(), this.method_6307()];
        this.currentState = "up";
        this.addEventListener("creationComplete", this.method_130);
        states = [new State({
            "name": "up",
            "overrides": [new SetStyle().initializeFromObject({
                "target": "labelDisplay",
                "name": "color",
                "value": 16777215
            })]
        }), new State({
            "name": "down",
            "overrides": []
        }), new State({
            "name": "over",
            "overrides": [new SetProperty().initializeFromObject({
                "target": "scale9Graphic",
                "name": "alpha",
                "value": 0.5
            }), new SetStyle().initializeFromObject({
                "target": "labelDisplay",
                "name": "color",
                "value": 10533542
            })]
        }), new State({
            "name": "disabled",
            "overrides": []
        })];
        var_1 = 0;
        while (var_1 < bindings.length) {
            Binding(bindings[var_1]).execute();
            var_1++;
        }
    }

    public static function set watcherSetupUtil(param1: IWatcherSetupUtil2): void {
        class_1035._watcherSetupUtil = param1;
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

    private function method_5996(): void {
        this.btnBitmap = ResourceManager.getBitmapData("questWin", "button_green_normal");
        this.scale9Graphic.scale9Grid = new Rectangle(75, 14, 1, 1);
    }

    private function method_5506(): Scale9GridImage {
        var _loc1_: Scale9GridImage = new Scale9GridImage();
        _loc1_.id = "scale9Graphic";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.scale9Graphic = _loc1_;
        BindingManager.executeBindings(this, "scale9Graphic", this.scale9Graphic);
        return _loc1_;
    }

    private function method_6307(): Label {
        var _loc1_: Label = new Label();
        _loc1_.horizontalCenter = 0;
        _loc1_.verticalCenter = 0;
        _loc1_.maxDisplayedLines = 1;
        _loc1_.setStyle("textAlign", "center");
        _loc1_.setStyle("verticalAlign", "middle");
        _loc1_.setStyle("fontSize", 12);
        _loc1_.setStyle("fontFamily", "EurostileT");
        _loc1_.id = "labelDisplay";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.labelDisplay = _loc1_;
        BindingManager.executeBindings(this, "labelDisplay", this.labelDisplay);
        return _loc1_;
    }

    public function method_130(param1: FlexEvent): void {
        this.method_5996();
    }

    private function method_5200(): Array {
        var var_5: Array = [];
        var_5[0] = new Binding(this, function (): * {
            return btnBitmap;
        }, null, "scale9Graphic.source");
        return var_5;
    }

    [Bindable(event="propertyChange")]
    public function get labelDisplay(): Label {
        return this._1184053038labelDisplay;
    }

    public function set labelDisplay(param1: Label): void {
        var _loc2_: Object = this._1184053038labelDisplay;
        if (_loc2_ !== param1) {
            this._1184053038labelDisplay = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "labelDisplay", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get scale9Graphic(): Scale9GridImage {
        return this._1404868679scale9Graphic;
    }

    public function set scale9Graphic(param1: Scale9GridImage): void {
        var _loc2_: Object = this._1404868679scale9Graphic;
        if (_loc2_ !== param1) {
            this._1404868679scale9Graphic = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "scale9Graphic", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    private function get btnBitmap(): BitmapData {
        return this.var_2154;
    }

    private function set btnBitmap(param1: BitmapData): void {
        var _loc2_: Object = this.var_2154;
        if (_loc2_ !== param1) {
            this.var_2154 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnBitmap", _loc2_, param1));
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
