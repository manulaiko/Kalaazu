package package_154 {

import flash.display.Bitmap;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.utils.getDefinitionByName;

import mx.binding.Binding;
import mx.binding.BindingManager;
import mx.binding.IBindingClient;
import mx.binding.IWatcherSetupUtil2;
import mx.core.ClassFactory;
import mx.core.IFlexModuleFactory;
import mx.core.IStateClient2;
import mx.core.mx_internal;
import mx.events.PropertyChangeEvent;
import mx.states.SetProperty;
import mx.states.State;

import net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase;
import net.bigpoint.darkorbit.mvc.common.view.skins.DOButtonBaseSkin;

import spark.components.Button;
import spark.components.Group;
import spark.components.HGroup;
import spark.components.HSlider;
import spark.components.Label;
import spark.components.VGroup;
import spark.skins.SparkSkin;

public class DOHSliderSkin extends SparkSkin implements IBindingClient, IStateClient2 {

    private static const exclusions: Array = ["track", "thumb"];

    public static const const_368: String = "leftArrowClicked";

    public static const const_966: String = "rightArrowClicked";

    private static var _watcherSetupUtil: IWatcherSetupUtil2;


    public var _DOHSliderSkin_DOButtonBase1: DOButtonBase;

    public var _DOHSliderSkin_DOButtonBase2: DOButtonBase;

    private var _1443184785dataTip: ClassFactory;

    private var var_4089: Label;

    private var var_949: Label;

    private var _110342614thumb: Button;

    private var _110621003track: Button;

    private var __moduleFactoryInitialized: Boolean = false;

    private var var_4152: Bitmap;

    mx_internal var _bindings: Array;

    mx_internal var _watchers: Array;

    mx_internal var _bindingsByDestination: Object;

    mx_internal var _bindingsBeginWithWord: Object;

    private var _213507019hostComponent: HSlider;

    public function DOHSliderSkin() {
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
        bindings = this.method_2930();
        watchers = [];
        target = this;
        if (_watcherSetupUtil == null) {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_battlestationswindow_view_skins_DOHSliderSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }
        _watcherSetupUtil.setup(this, function (param1: String): * {
            return target[param1];
        }, function (param1: String): * {
            return DOHSliderSkin[param1];
        }, bindings, watchers);
        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
        this.name = "DOHSliderSkin";
        this.minHeight = 11;
        this.mxmlContent = [this.method_1643()];
        this.currentState = "normal";
        this.method_3887();
        states = [new State({
            "name": "normal",
            "overrides": []
        }), new State({
            "name": "disabled",
            "overrides": [new SetProperty().initializeFromObject({
                "name": "alpha",
                "value": 0.5
            })]
        })];
        var_1 = 0;
        while (var_1 < bindings.length) {
            Binding(bindings[var_1]).execute();
            var_1++;
        }
    }

    public static function set watcherSetupUtil(param1: IWatcherSetupUtil2): void {
        DOHSliderSkin._watcherSetupUtil = param1;
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

    private function method_4591(param1: MouseEvent): void {
        dispatchEvent(new Event(const_368, true));
    }

    private function method_5932(param1: MouseEvent): void {
        dispatchEvent(new Event(const_966, true));
    }

    override protected function measure(): void {
        var _loc1_: Number = Number(this.thumb.getLayoutBoundsX());
        this.thumb.setLayoutBoundsPosition(0, this.thumb.getLayoutBoundsY());
        super.measure();
        this.thumb.setLayoutBoundsPosition(_loc1_, this.thumb.getLayoutBoundsY());
    }

    private function method_3887(): ClassFactory {
        var _loc1_: ClassFactory = new ClassFactory();
        _loc1_.generator = class_1519;
        _loc1_.properties = {"outerDocument": this};
        this.dataTip = _loc1_;
        BindingManager.executeBindings(this, "dataTip", this.dataTip);
        return _loc1_;
    }

    private function method_1643(): HGroup {
        var _loc1_: HGroup = new HGroup();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.gap = 0;
        _loc1_.mxmlContent = [this.method_1044(), this.method_4336(), this.method_4585()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_1044(): DOButtonBase {
        var _loc1_: DOButtonBase = new DOButtonBase();
        _loc1_.width = 18;
        _loc1_.height = 15;
        _loc1_.mouseChildren = false;
        _loc1_.buttonMode = true;
        _loc1_.rotation = 180;
        _loc1_.setStyle("skinClass", DOButtonBaseSkin);
        _loc1_.addEventListener("click", this.method_2460);
        _loc1_.id = "_DOHSliderSkin_DOButtonBase1";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this._DOHSliderSkin_DOButtonBase1 = _loc1_;
        BindingManager.executeBindings(this, "_DOHSliderSkin_DOButtonBase1", this._DOHSliderSkin_DOButtonBase1);
        return _loc1_;
    }

    public function method_2460(param1: MouseEvent): void {
        this.method_4591(param1);
    }

    private function method_4336(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.gap = 0;
        _loc1_.top = -5;
        _loc1_.mxmlContent = [this.method_6251(), this.method_1810()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_6251(): Group {
        var _loc1_: Group = new Group();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.mxmlContent = [this.method_4157(), this.method_5499()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_4157(): Button {
        var _loc1_: Button = new Button();
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.top = 0;
        _loc1_.bottom = 0;
        _loc1_.minWidth = 33;
        _loc1_.width = 173;
        _loc1_.visible = false;
        _loc1_.id = "track";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.track = _loc1_;
        BindingManager.executeBindings(this, "track", this.track);
        return _loc1_;
    }

    private function method_5499(): Button {
        var _loc1_: Button = new Button();
        _loc1_.top = 0;
        _loc1_.bottom = 0;
        _loc1_.width = 31;
        _loc1_.height = 15;
        _loc1_.setStyle("skinClass", class_1518);
        _loc1_.id = "thumb";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.thumb = _loc1_;
        BindingManager.executeBindings(this, "thumb", this.thumb);
        return _loc1_;
    }

    private function method_1810(): Group {
        var _loc1_: Group = new Group();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.mxmlContent = [this.method_312(), this.method_3391()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_312(): Label {
        var _loc1_: Label = new Label();
        _loc1_.text = "";
        _loc1_.left = 0;
        _loc1_.setStyle("textAlign", "right");
        _loc1_.setStyle("color", 8553844);
        _loc1_.setStyle("fontSize", 11);
        _loc1_.setStyle("fontFamily", "EurostileT");
        _loc1_.id = "minVal";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.minVal = _loc1_;
        BindingManager.executeBindings(this, "minVal", this.minVal);
        return _loc1_;
    }

    private function method_3391(): Label {
        var _loc1_: Label = new Label();
        _loc1_.text = "";
        _loc1_.right = 0;
        _loc1_.setStyle("textAlign", "left");
        _loc1_.setStyle("color", 8553844);
        _loc1_.setStyle("fontSize", 11);
        _loc1_.setStyle("fontFamily", "EurostileT");
        _loc1_.id = "maxVal";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.maxVal = _loc1_;
        BindingManager.executeBindings(this, "maxVal", this.maxVal);
        return _loc1_;
    }

    private function method_4585(): DOButtonBase {
        var _loc1_: DOButtonBase = new DOButtonBase();
        _loc1_.width = 18;
        _loc1_.height = 15;
        _loc1_.mouseChildren = false;
        _loc1_.buttonMode = true;
        _loc1_.setStyle("skinClass", DOButtonBaseSkin);
        _loc1_.addEventListener("click", this.method_3026);
        _loc1_.id = "_DOHSliderSkin_DOButtonBase2";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this._DOHSliderSkin_DOButtonBase2 = _loc1_;
        BindingManager.executeBindings(this, "_DOHSliderSkin_DOButtonBase2", this._DOHSliderSkin_DOButtonBase2);
        return _loc1_;
    }

    public function method_3026(param1: MouseEvent): void {
        this.method_5932(param1);
    }

    private function method_2930(): Array {
        var var_5: Array = [];
        var_5[0] = new Binding(this, function (): Object {
            return getStyle("arrowButtonStyleName");
        }, null, "_DOHSliderSkin_DOButtonBase1.styleName");
        var_5[1] = new Binding(this, function (): Object {
            return getStyle("arrowButtonStyleName");
        }, null, "_DOHSliderSkin_DOButtonBase2.styleName");
        return var_5;
    }

    [Bindable(event="propertyChange")]
    public function get dataTip(): ClassFactory {
        return this._1443184785dataTip;
    }

    public function set dataTip(param1: ClassFactory): void {
        var _loc2_: Object = this._1443184785dataTip;
        if (_loc2_ !== param1) {
            this._1443184785dataTip = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dataTip", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get maxVal(): Label {
        return this.var_4089;
    }

    public function set maxVal(param1: Label): void {
        var _loc2_: Object = this.var_4089;
        if (_loc2_ !== param1) {
            this.var_4089 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "maxVal", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get minVal(): Label {
        return this.var_949;
    }

    public function set minVal(param1: Label): void {
        var _loc2_: Object = this.var_949;
        if (_loc2_ !== param1) {
            this.var_949 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "minVal", _loc2_, param1));
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
    public function get _dataTipBgBitmap(): Bitmap {
        return this.var_4152;
    }

    public function set _dataTipBgBitmap(param1: Bitmap): void {
        var _loc2_: Object = this.var_4152;
        if (_loc2_ !== param1) {
            this.var_4152 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_dataTipBgBitmap", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get hostComponent(): HSlider {
        return this._213507019hostComponent;
    }

    public function set hostComponent(param1: HSlider): void {
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
