package net.bigpoint.darkorbit.mvc.common.view.skins.scroller.hScroll {

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

import spark.components.Button;
import spark.components.HScrollBar;
import spark.skins.SparkSkin;

public class DOHScrollBarSkin extends SparkSkin implements IBindingClient, IStateClient2 {

    private static const exclusions: Array = ["track", "thumb", "decrementButton", "incrementButton"];

    private static var _watcherSetupUtil: IWatcherSetupUtil2;


    private var _853009829decrementButton: Button;

    private var _454226047incrementButton: Button;

    private var _110342614thumb: Button;

    private var _110621003track: Button;

    private var __moduleFactoryInitialized: Boolean = false;

    mx_internal var _bindings: Array;

    mx_internal var _watchers: Array;

    mx_internal var _bindingsByDestination: Object;

    mx_internal var _bindingsBeginWithWord: Object;

    private var _213507019hostComponent: HScrollBar;

    public function DOHScrollBarSkin() {
        var watchers: Array;
        var i: uint;
        var bindings: Array = null;
        var target: Object = null;
        var watcherSetupUtilClass: Object = null;
        this.mx_internal::_bindings = [];
        this.mx_internal::_watchers = [];
        this.mx_internal::_bindingsByDestination = {};
        this.mx_internal::_bindingsBeginWithWord = {};
        super();
        mx_internal::_document = this;
        bindings = this._DOHScrollBarSkin_bindingsSetup();
        watchers = [];
        target = this;
        if (_watcherSetupUtil == null) {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_common_view_skins_scroller_hScroll_DOHScrollBarSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }
        _watcherSetupUtil.setup(this, function (param1: String): * {
            return target[param1];
        }, function (param1: String): * {
            return DOHScrollBarSkin[param1];
        }, bindings, watchers);
        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
        this.minWidth = 15;
        this.minHeight = 35;
        this.mxmlContent = [this._DOHScrollBarSkin_Button1_i(), this._DOHScrollBarSkin_Button2_i(), this._DOHScrollBarSkin_Button3_i(), this._DOHScrollBarSkin_Button4_i()];
        this.currentState = "normal";
        states = [new State({
            "name": "normal",
            "overrides": []
        }), new State({
            "name": "disabled",
            "overrides": [new SetProperty().initializeFromObject({
                "name": "alpha",
                "value": 0.5
            })]
        }), new State({
            "name": "inactive",
            "overrides": [new SetProperty().initializeFromObject({
                "name": "alpha",
                "value": 0.5
            }), new SetProperty().initializeFromObject({
                "target": "thumb",
                "name": "visible",
                "value": false
            }), new SetProperty().initializeFromObject({
                "target": "decrementButton",
                "name": "enabled",
                "value": false
            }), new SetProperty().initializeFromObject({
                "target": "incrementButton",
                "name": "enabled",
                "value": false
            })]
        })];
        i = 0;
        while (i < bindings.length) {
            Binding(bindings[i]).execute();
            i++;
        }
    }

    public static function set watcherSetupUtil(param1: IWatcherSetupUtil2): void {
        DOHScrollBarSkin._watcherSetupUtil = param1;
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

    override public function get colorizeExclusions(): Array {
        return exclusions;
    }

    override protected function initializationComplete(): void {
        useChromeColor = true;
        super.initializationComplete();
    }

    private function _DOHScrollBarSkin_Button1_i(): Button {
        var _loc1_: Button = new Button();
        _loc1_.styleName = "skinnedHScrollBarTrack";
        _loc1_.percentWidth = 100;
        _loc1_.focusEnabled = false;
        _loc1_.tabEnabled = false;
        _loc1_.id = "track";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.track = _loc1_;
        BindingManager.executeBindings(this, "track", this.track);
        return _loc1_;
    }

    private function _DOHScrollBarSkin_Button2_i(): Button {
        var _loc1_: Button = new Button();
        _loc1_.styleName = "skinnedHScrollBarThumb";
        _loc1_.focusEnabled = false;
        _loc1_.tabEnabled = false;
        _loc1_.id = "thumb";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.thumb = _loc1_;
        BindingManager.executeBindings(this, "thumb", this.thumb);
        return _loc1_;
    }

    private function _DOHScrollBarSkin_Button3_i(): Button {
        var _loc1_: Button = new Button();
        _loc1_.styleName = "skinnedHScrollBarLeftButton";
        _loc1_.left = 0;
        _loc1_.focusEnabled = false;
        _loc1_.tabEnabled = false;
        _loc1_.id = "decrementButton";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.decrementButton = _loc1_;
        BindingManager.executeBindings(this, "decrementButton", this.decrementButton);
        return _loc1_;
    }

    private function _DOHScrollBarSkin_Button4_i(): Button {
        var _loc1_: Button = new Button();
        _loc1_.styleName = "skinnedHScrollBarRightButton";
        _loc1_.right = 0;
        _loc1_.focusEnabled = false;
        _loc1_.tabEnabled = false;
        _loc1_.id = "incrementButton";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.incrementButton = _loc1_;
        BindingManager.executeBindings(this, "incrementButton", this.incrementButton);
        return _loc1_;
    }

    private function _DOHScrollBarSkin_bindingsSetup(): Array {
        var result: Array = [];
        result[0] = new Binding(this, function (): Object {
            return decrementButton.width;
        }, null, "track.left");
        result[1] = new Binding(this, function (): Object {
            return incrementButton.width;
        }, null, "track.right");
        return result;
    }

    [Bindable(event="propertyChange")]
    public function get decrementButton(): Button {
        return this._853009829decrementButton;
    }

    public function set decrementButton(param1: Button): void {
        var _loc2_: Object = this._853009829decrementButton;
        if (_loc2_ !== param1) {
            this._853009829decrementButton = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "decrementButton", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get incrementButton(): Button {
        return this._454226047incrementButton;
    }

    public function set incrementButton(param1: Button): void {
        var _loc2_: Object = this._454226047incrementButton;
        if (_loc2_ !== param1) {
            this._454226047incrementButton = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "incrementButton", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get thumb(): Button {
        return this._110342614thumb;
    }

    public function set thumb(param1: Button): void {
        var _loc2_: Object = this._110342614thumb;
        if (_loc2_ !== param1) {
            this._110342614thumb = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "thumb", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get track(): Button {
        return this._110621003track;
    }

    public function set track(param1: Button): void {
        var _loc2_: Object = this._110621003track;
        if (_loc2_ !== param1) {
            this._110621003track = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "track", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get hostComponent(): HScrollBar {
        return this._213507019hostComponent;
    }

    public function set hostComponent(param1: HScrollBar): void {
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
