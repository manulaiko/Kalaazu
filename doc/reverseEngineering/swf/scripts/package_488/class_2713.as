package package_488 {

import com.greensock.TweenLite;

import flash.utils.getDefinitionByName;

import mx.binding.Binding;
import mx.binding.BindingManager;
import mx.binding.IBindingClient;
import mx.binding.IWatcherSetupUtil2;
import mx.core.IFlexModuleFactory;
import mx.core.IStateClient2;
import mx.core.mx_internal;
import mx.events.PropertyChangeEvent;
import mx.graphics.SolidColor;
import mx.states.State;

import package_48.class_2675;

import package_9.ResourceManager;

import spark.components.Label;
import spark.primitives.BitmapImage;
import spark.primitives.Rect;
import spark.skins.SparkButtonSkin;

public class class_2713 extends SparkButtonSkin implements IBindingClient, IStateClient2 {

    private static var _watcherSetupUtil: IWatcherSetupUtil2;


    public var _FilterOptionButtonSkin_SolidColor1: SolidColor;

    public var _FilterOptionButtonSkin_SolidColor2: SolidColor;

    public var _FilterOptionButtonSkin_SolidColor3: SolidColor;

    public var _FilterOptionButtonSkin_SolidColor4: SolidColor;

    public var _FilterOptionButtonSkin_SolidColor5: SolidColor;

    private var var_3521: Rect;

    private var var_1440: Rect;

    private var var_4583: BitmapImage;

    private var var_4572: Rect;

    private var var_4574: Rect;

    private var var_4335: Rect;

    private var __moduleFactoryInitialized: Boolean = false;

    mx_internal var _bindings: Array;

    mx_internal var _watchers: Array;

    mx_internal var _bindingsByDestination: Object;

    mx_internal var _bindingsBeginWithWord: Object;

    public function class_2713() {
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
        bindings = this.method_1828();
        watchers = [];
        target = this;
        if (_watcherSetupUtil == null) {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_battlestationswindow_view_moduleInventory_inventoryFilter_skins_FilterOptionButtonSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }
        _watcherSetupUtil.setup(this, function (param1: String): * {
            return target[param1];
        }, function (param1: String): * {
            return class_2713[param1];
        }, bindings, watchers);
        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
        this.percentWidth = 100;
        this.minHeight = 20;
        this.mxmlContent = [this.method_4557(), this.method_2695(), this.method_3740(), this.method_2360(), this.method_3113(), this.method_2131(), this.method_2810()];
        this.currentState = "up";
        states = [new State({
            "name": "up",
            "overrides": []
        }), new State({
            "name": "down",
            "overrides": []
        }), new State({
            "name": "over",
            "overrides": []
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
        class_2713._watcherSetupUtil = param1;
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
        useChromeColor = true;
        super.initializationComplete();
        this.method_895();
    }

    private function method_895(): void {
        this.darkBackground.visible = this.method_4321.method_1399;
        this.brightBackground.visible = !this.method_4321.method_1399;
        this.updateSelection(this.method_4321.selected);
    }

    public function updateSelection(param1: Boolean): void {
        TweenLite.to(this.eyeIcon, 0.3, {"autoAlpha": int(param1)});
        setStyle("color", param1 ? getStyle("activeFontColor") : getStyle("unactiveFontColor"));
    }

    override protected function stateChanged(param1: String, param2: String, param3: Boolean): void {
        super.stateChanged(param1, param2, param3);
        TweenLite.to(this.overStateBackground, 0.3, {"autoAlpha": int(param2 == "over")});
    }

    override protected function commitProperties(): void {
        super.commitProperties();
        hostComponent.buttonMode = true;
    }

    public function get method_4321(): class_2675 {
        return hostComponent as class_2675;
    }

    private function method_4557(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 1;
        _loc1_.right = 1;
        _loc1_.top = 0;
        _loc1_.bottom = 0;
        _loc1_.fill = this.method_3358();
        _loc1_.initialized(this, "darkBackground");
        this.darkBackground = _loc1_;
        BindingManager.executeBindings(this, "darkBackground", this.darkBackground);
        return _loc1_;
    }

    private function method_3358(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        this._FilterOptionButtonSkin_SolidColor1 = _loc1_;
        BindingManager.executeBindings(this, "_FilterOptionButtonSkin_SolidColor1", this._FilterOptionButtonSkin_SolidColor1);
        return _loc1_;
    }

    private function method_2695(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 1;
        _loc1_.right = 1;
        _loc1_.top = 0;
        _loc1_.bottom = 0;
        _loc1_.fill = this.method_2468();
        _loc1_.initialized(this, "brightBackground");
        this.brightBackground = _loc1_;
        BindingManager.executeBindings(this, "brightBackground", this.brightBackground);
        return _loc1_;
    }

    private function method_2468(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        this._FilterOptionButtonSkin_SolidColor2 = _loc1_;
        BindingManager.executeBindings(this, "_FilterOptionButtonSkin_SolidColor2", this._FilterOptionButtonSkin_SolidColor2);
        return _loc1_;
    }

    private function method_3740(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 1;
        _loc1_.right = 1;
        _loc1_.top = 0;
        _loc1_.bottom = 0;
        _loc1_.alpha = 0;
        _loc1_.visible = false;
        _loc1_.fill = this.method_4173();
        _loc1_.initialized(this, "overStateBackground");
        this.overStateBackground = _loc1_;
        BindingManager.executeBindings(this, "overStateBackground", this.overStateBackground);
        return _loc1_;
    }

    private function method_4173(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        this._FilterOptionButtonSkin_SolidColor3 = _loc1_;
        BindingManager.executeBindings(this, "_FilterOptionButtonSkin_SolidColor3", this._FilterOptionButtonSkin_SolidColor3);
        return _loc1_;
    }

    private function method_2360(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 1;
        _loc1_.right = 1;
        _loc1_.top = 0;
        _loc1_.bottom = 0;
        _loc1_.alpha = 0;
        _loc1_.visible = false;
        _loc1_.fill = this.method_5700();
        _loc1_.initialized(this, "selectedBackground");
        this.selectedBackground = _loc1_;
        BindingManager.executeBindings(this, "selectedBackground", this.selectedBackground);
        return _loc1_;
    }

    private function method_5700(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        this._FilterOptionButtonSkin_SolidColor4 = _loc1_;
        BindingManager.executeBindings(this, "_FilterOptionButtonSkin_SolidColor4", this._FilterOptionButtonSkin_SolidColor4);
        return _loc1_;
    }

    private function method_3113(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.width = 1;
        _loc1_.right = 29;
        _loc1_.top = 0;
        _loc1_.bottom = 0;
        _loc1_.fill = this.method_1189();
        _loc1_.initialized(this, "separator");
        this.separator = _loc1_;
        BindingManager.executeBindings(this, "separator", this.separator);
        return _loc1_;
    }

    private function method_1189(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        this._FilterOptionButtonSkin_SolidColor5 = _loc1_;
        BindingManager.executeBindings(this, "_FilterOptionButtonSkin_SolidColor5", this._FilterOptionButtonSkin_SolidColor5);
        return _loc1_;
    }

    private function method_2131(): BitmapImage {
        var _loc1_: BitmapImage = new BitmapImage();
        _loc1_.verticalAlign = "middle";
        _loc1_.right = 5;
        _loc1_.visible = false;
        _loc1_.alpha = 0;
        _loc1_.initialized(this, "eyeIcon");
        this.eyeIcon = _loc1_;
        BindingManager.executeBindings(this, "eyeIcon", this.eyeIcon);
        return _loc1_;
    }

    private function method_2810(): Label {
        var _loc1_: Label = new Label();
        _loc1_.maxDisplayedLines = 1;
        _loc1_.left = 7;
        _loc1_.verticalCenter = 0;
        _loc1_.setStyle("fontSize", 11);
        _loc1_.setStyle("fontFamily", "EurostileT");
        _loc1_.setStyle("textAlign", "left");
        _loc1_.setStyle("verticalAlign", "middle");
        _loc1_.id = "labelDisplay";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        labelDisplay = _loc1_;
        BindingManager.executeBindings(this, "labelDisplay", labelDisplay);
        return _loc1_;
    }

    private function method_1828(): Array {
        var var_5: Array = [];
        var_5[0] = new Binding(this, function (): uint {
            return getStyle("darkBackgroundColor");
        }, null, "_FilterOptionButtonSkin_SolidColor1.color");
        var_5[1] = new Binding(this, function (): uint {
            return getStyle("brightBackgroundColor");
        }, null, "_FilterOptionButtonSkin_SolidColor2.color");
        var_5[2] = new Binding(this, function (): uint {
            return getStyle("overStateBackgroundColor");
        }, null, "_FilterOptionButtonSkin_SolidColor3.color");
        var_5[3] = new Binding(this, function (): uint {
            return getStyle("overStateBackgroundColor");
        }, null, "_FilterOptionButtonSkin_SolidColor4.color");
        var_5[4] = new Binding(this, function (): uint {
            return getStyle("separatorColor");
        }, null, "_FilterOptionButtonSkin_SolidColor5.color");
        var_5[5] = new Binding(this, function (): Object {
            return ResourceManager.getBitmapData("battleStationsUI", "eye_orange");
        }, null, "eyeIcon.source");
        return var_5;
    }

    [Bindable(event="propertyChange")]
    public function get brightBackground(): Rect {
        return this.var_3521;
    }

    public function set brightBackground(param1: Rect): void {
        var _loc2_: Object = this.var_3521;
        if (_loc2_ !== param1) {
            this.var_3521 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "brightBackground", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get darkBackground(): Rect {
        return this.var_1440;
    }

    public function set darkBackground(param1: Rect): void {
        var _loc2_: Object = this.var_1440;
        if (_loc2_ !== param1) {
            this.var_1440 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "darkBackground", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get eyeIcon(): BitmapImage {
        return this.var_4583;
    }

    public function set eyeIcon(param1: BitmapImage): void {
        var _loc2_: Object = this.var_4583;
        if (_loc2_ !== param1) {
            this.var_4583 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "eyeIcon", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get overStateBackground(): Rect {
        return this.var_4572;
    }

    public function set overStateBackground(param1: Rect): void {
        var _loc2_: Object = this.var_4572;
        if (_loc2_ !== param1) {
            this.var_4572 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "overStateBackground", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get selectedBackground(): Rect {
        return this.var_4574;
    }

    public function set selectedBackground(param1: Rect): void {
        var _loc2_: Object = this.var_4574;
        if (_loc2_ !== param1) {
            this.var_4574 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selectedBackground", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get separator(): Rect {
        return this.var_4335;
    }

    public function set separator(param1: Rect): void {
        var _loc2_: Object = this.var_4335;
        if (_loc2_ !== param1) {
            this.var_4335 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "separator", _loc2_, param1));
            }
        }
    }
}
}
