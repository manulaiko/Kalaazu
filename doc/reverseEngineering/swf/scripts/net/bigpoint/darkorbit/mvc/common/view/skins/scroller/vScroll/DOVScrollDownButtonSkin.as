package net.bigpoint.darkorbit.mvc.common.view.skins.scroller.vScroll {

import flash.display.BitmapData;
import flash.utils.getDefinitionByName;

import mx.binding.Binding;
import mx.binding.BindingManager;
import mx.binding.IBindingClient;
import mx.binding.IWatcherSetupUtil2;
import mx.core.IFlexModuleFactory;
import mx.core.IStateClient2;
import mx.core.mx_internal;
import mx.events.PropertyChangeEvent;
import mx.states.SetProperty;
import mx.states.State;

import net.bigpoint.as3toolbox.guicomponents.components.Scale9GridImage;

import package_9.ResourceManager;

import spark.components.Button;
import spark.skins.SparkSkin;

public class DOVScrollDownButtonSkin extends SparkSkin implements IBindingClient, IStateClient2 {

    private static var _watcherSetupUtil: IWatcherSetupUtil2;


    private var _1242916911_DOVScrollDownButtonSkin_SetProperty1: SetProperty;

    private var _621239974upImageActive: Scale9GridImage;

    private var __moduleFactoryInitialized: Boolean = false;

    private var _1552339376_upStateBitmapData: BitmapData;

    private var _654920375_overStateBitmapData: BitmapData;

    mx_internal var _bindings: Array;

    mx_internal var _watchers: Array;

    mx_internal var _bindingsByDestination: Object;

    mx_internal var _bindingsBeginWithWord: Object;

    private var _213507019hostComponent: Button;

    public function DOVScrollDownButtonSkin() {
        var bindings: Array;
        var watchers: Array;
        var i: uint;
        var target: Object = null;
        var watcherSetupUtilClass: Object = null;
        this.mx_internal::_bindings = [];
        this.mx_internal::_watchers = [];
        this.mx_internal::_bindingsByDestination = {};
        this.mx_internal::_bindingsBeginWithWord = {};
        super();
        mx_internal::_document = this;
        bindings = this._DOVScrollDownButtonSkin_bindingsSetup();
        watchers = [];
        target = this;
        if (_watcherSetupUtil == null) {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_common_view_skins_scroller_vScroll_DOVScrollDownButtonSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }
        _watcherSetupUtil.setup(this, function (param1: String): * {
            return target[param1];
        }, function (param1: String): * {
            return DOVScrollDownButtonSkin[param1];
        }, bindings, watchers);
        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
        this.mxmlContent = [this._DOVScrollDownButtonSkin_Scale9GridImage1_i()];
        this.currentState = "up";
        states = [new State({
            "name": "up",
            "overrides": []
        }), new State({
            "name": "over",
            "overrides": [this._DOVScrollDownButtonSkin_SetProperty1 = SetProperty(new SetProperty().initializeFromObject({
                "isBaseValueDataBound": true,
                "target": "upImageActive",
                "name": "source",
                "value": undefined
            }))]
        }), new State({
            "name": "down",
            "overrides": []
        }), new State({
            "name": "disabled",
            "overrides": []
        })];
        BindingManager.executeBindings(this, "_DOVScrollDownButtonSkin_SetProperty1", this._DOVScrollDownButtonSkin_SetProperty1);
        i = 0;
        while (i < bindings.length) {
            Binding(bindings[i]).execute();
            i++;
        }
    }

    public static function set watcherSetupUtil(param1: IWatcherSetupUtil2): void {
        DOVScrollDownButtonSkin._watcherSetupUtil = param1;
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

    override public function get symbolItems(): Array {
        return [];
    }

    override protected function initializationComplete(): void {
        useChromeColor = true;
        super.initializationComplete();
        this._upStateBitmapData = ResourceManager.getBitmapData(getStyle("libID"), getStyle("upState"));
        this._overStateBitmapData = ResourceManager.getBitmapData(getStyle("libID"), getStyle("overState"));
    }

    private function _DOVScrollDownButtonSkin_Scale9GridImage1_i(): Scale9GridImage {
        var _loc1_: Scale9GridImage = new Scale9GridImage();
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.height = 16;
        _loc1_.width = 16;
        _loc1_.id = "upImageActive";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.upImageActive = _loc1_;
        BindingManager.executeBindings(this, "upImageActive", this.upImageActive);
        return _loc1_;
    }

    private function _DOVScrollDownButtonSkin_bindingsSetup(): Array {
        var result: Array = [];
        result[0] = new Binding(this, function (): * {
            return _upStateBitmapData;
        }, null, "upImageActive.source");
        result[1] = new Binding(this, function (): * {
            return _overStateBitmapData;
        }, null, "_DOVScrollDownButtonSkin_SetProperty1.value");
        return result;
    }

    [Bindable(event="propertyChange")]
    public function get _DOVScrollDownButtonSkin_SetProperty1(): SetProperty {
        return this._1242916911_DOVScrollDownButtonSkin_SetProperty1;
    }

    public function set _DOVScrollDownButtonSkin_SetProperty1(param1: SetProperty): void {
        var _loc2_: Object = this._1242916911_DOVScrollDownButtonSkin_SetProperty1;
        if (_loc2_ !== param1) {
            this._1242916911_DOVScrollDownButtonSkin_SetProperty1 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_DOVScrollDownButtonSkin_SetProperty1", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get upImageActive(): Scale9GridImage {
        return this._621239974upImageActive;
    }

    public function set upImageActive(param1: Scale9GridImage): void {
        var _loc2_: Object = this._621239974upImageActive;
        if (_loc2_ !== param1) {
            this._621239974upImageActive = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "upImageActive", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    private function get _upStateBitmapData(): BitmapData {
        return this._1552339376_upStateBitmapData;
    }

    private function set _upStateBitmapData(param1: BitmapData): void {
        var _loc2_: Object = this._1552339376_upStateBitmapData;
        if (_loc2_ !== param1) {
            this._1552339376_upStateBitmapData = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_upStateBitmapData", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    private function get _overStateBitmapData(): BitmapData {
        return this._654920375_overStateBitmapData;
    }

    private function set _overStateBitmapData(param1: BitmapData): void {
        var _loc2_: Object = this._654920375_overStateBitmapData;
        if (_loc2_ !== param1) {
            this._654920375_overStateBitmapData = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_overStateBitmapData", _loc2_, param1));
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
