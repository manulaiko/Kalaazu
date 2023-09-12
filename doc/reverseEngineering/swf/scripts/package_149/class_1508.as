package package_149 {

import flash.events.MouseEvent;
import flash.utils.getDefinitionByName;

import mx.binding.Binding;
import mx.binding.BindingManager;
import mx.binding.IBindingClient;
import mx.binding.IWatcherSetupUtil2;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IFlexModuleFactory;
import mx.core.IStateClient2;
import mx.core.mx_internal;
import mx.events.FlexEvent;
import mx.events.PropertyChangeEvent;
import mx.states.SetStyle;
import mx.states.State;

import net.bigpoint.as3toolbox.guicomponents.components.Scale9GridImage;

import spark.components.Image;
import spark.components.RichText;
import spark.components.SkinnableContainer;
import spark.components.VGroup;
import spark.layouts.VerticalAlign;

public class class_1508 extends SkinnableContainer implements IBindingClient, IStateClient2 {

    private static var _watcherSetupUtil: IWatcherSetupUtil2;


    private var var_540: Scale9GridImage;

    private var var_3985: Scale9GridImage;

    private var var_1414: Scale9GridImage;

    private var var_3400: Scale9GridImage;

    private var var_3368: Scale9GridImage;

    private var var_2829: RichText;

    private var var_2297: RichText;

    private var var_1951: Image;

    private var var_412: Scale9GridImage;

    private var var_4886: Scale9GridImage;

    private var var_3682: VGroup;

    private var __moduleFactoryInitialized: Boolean = false;

    mx_internal var _bindings: Array;

    mx_internal var _watchers: Array;

    mx_internal var _bindingsByDestination: Object;

    mx_internal var _bindingsBeginWithWord: Object;

    public function class_1508() {
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
        bindings = this.method_1138();
        watchers = [];
        target = this;
        if (_watcherSetupUtil == null) {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_questWindow_view_questsSection_renderers_questList_QuestListItemRendererContentComponentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }
        _watcherSetupUtil.setup(this, function (param1: String): * {
            return target[param1];
        }, function (param1: String): * {
            return class_1508[param1];
        }, bindings, watchers);
        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
        this.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_2657);
        this.currentState = "normal";
        this.addEventListener("creationComplete", this.method_2340);
        this.addEventListener("stateChangeComplete", this.method_1019);
        this.addEventListener("rollOut", this.method_2973);
        this.addEventListener("rollOver", this.method_1888);
        this.addEventListener("click", this.method_6505);
        states = [new State({
            "name": "normal",
            "overrides": []
        }), new State({
            "name": "disabled",
            "overrides": [new SetStyle().initializeFromObject({
                "target": "questNameLabel",
                "name": "color",
                "value": 12632256
            }), new SetStyle().initializeFromObject({
                "target": "questAdditionalInfo",
                "name": "color",
                "value": 12632256
            })]
        }), new State({
            "name": "selected",
            "overrides": []
        })];
        var_1 = 0;
        while (var_1 < bindings.length) {
            Binding(bindings[var_1]).execute();
            var_1++;
        }
    }

    public static function set watcherSetupUtil(param1: IWatcherSetupUtil2): void {
        class_1508._watcherSetupUtil = param1;
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
            this.backgroundColor = 1844009;
        };
    }

    override public function initialize(): void {
        super.initialize();
    }

    protected function creationCompleteHandler(): void {
    }

    protected function method_31(): void {
    }

    protected function rollHandler(param1: MouseEvent): void {
    }

    protected function clickHandler(param1: MouseEvent): void {
    }

    private function method_2657(): Array {
        return [this.method_6472(), this.method_4750(), this.method_5115(), this.method_4288(), this.method_4108(), this.method_1213(), this.method_1256(), this.method_879(), this.method_3793()];
    }

    private function method_6472(): Scale9GridImage {
        var _loc1_: Scale9GridImage = new Scale9GridImage();
        _loc1_.percentWidth = 100;
        _loc1_.height = 35;
        _loc1_.id = "backgroundImage";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.backgroundImage = _loc1_;
        BindingManager.executeBindings(this, "backgroundImage", this.backgroundImage);
        return _loc1_;
    }

    private function method_4750(): Scale9GridImage {
        var _loc1_: Scale9GridImage = new Scale9GridImage();
        _loc1_.percentWidth = 100;
        _loc1_.height = 35;
        _loc1_.alpha = 0;
        _loc1_.id = "disabledImage";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.disabledImage = _loc1_;
        BindingManager.executeBindings(this, "disabledImage", this.disabledImage);
        return _loc1_;
    }

    private function method_5115(): Scale9GridImage {
        var _loc1_: Scale9GridImage = new Scale9GridImage();
        _loc1_.percentWidth = 100;
        _loc1_.height = 35;
        _loc1_.alpha = 0;
        _loc1_.id = "completedImage";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.completedImage = _loc1_;
        BindingManager.executeBindings(this, "completedImage", this.completedImage);
        return _loc1_;
    }

    private function method_4288(): Scale9GridImage {
        var _loc1_: Scale9GridImage = new Scale9GridImage();
        _loc1_.percentWidth = 100;
        _loc1_.height = 35;
        _loc1_.alpha = 0;
        _loc1_.id = "selectedImage";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.selectedImage = _loc1_;
        BindingManager.executeBindings(this, "selectedImage", this.selectedImage);
        return _loc1_;
    }

    private function method_4108(): Scale9GridImage {
        var _loc1_: Scale9GridImage = new Scale9GridImage();
        _loc1_.percentWidth = 100;
        _loc1_.height = 35;
        _loc1_.alpha = 0;
        _loc1_.id = "lockedGlowImage";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.lockedGlowImage = _loc1_;
        BindingManager.executeBindings(this, "lockedGlowImage", this.lockedGlowImage);
        return _loc1_;
    }

    private function method_1213(): Scale9GridImage {
        var _loc1_: Scale9GridImage = new Scale9GridImage();
        _loc1_.percentWidth = 100;
        _loc1_.height = 35;
        _loc1_.alpha = 0;
        _loc1_.id = "inProgressGlowImage";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.inProgressGlowImage = _loc1_;
        BindingManager.executeBindings(this, "inProgressGlowImage", this.inProgressGlowImage);
        return _loc1_;
    }

    private function method_1256(): Scale9GridImage {
        var _loc1_: Scale9GridImage = new Scale9GridImage();
        _loc1_.percentWidth = 100;
        _loc1_.height = 35;
        _loc1_.alpha = 0;
        _loc1_.id = "rollOverGlowImage";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.rollOverGlowImage = _loc1_;
        BindingManager.executeBindings(this, "rollOverGlowImage", this.rollOverGlowImage);
        return _loc1_;
    }

    private function method_879(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.left = 35;
        _loc1_.top = 4;
        _loc1_.verticalCenter = 0;
        _loc1_.gap = 0;
        _loc1_.mxmlContent = [this.method_4958(), this.method_551()];
        _loc1_.id = "textsContainer";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.textsContainer = _loc1_;
        BindingManager.executeBindings(this, "textsContainer", this.textsContainer);
        return _loc1_;
    }

    private function method_4958(): RichText {
        var _loc1_: RichText = new RichText();
        _loc1_.text = "-";
        _loc1_.maxWidth = 170;
        _loc1_.maxDisplayedLines = 1;
        _loc1_.setStyle("fontSize", 12);
        _loc1_.setStyle("color", 16777215);
        _loc1_.setStyle("fontFamily", "EurostileT");
        _loc1_.id = "questNameLabel";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.questNameLabel = _loc1_;
        BindingManager.executeBindings(this, "questNameLabel", this.questNameLabel);
        return _loc1_;
    }

    private function method_551(): RichText {
        var _loc1_: RichText = new RichText();
        _loc1_.text = "-";
        _loc1_.maxWidth = 170;
        _loc1_.maxDisplayedLines = 1;
        _loc1_.setStyle("fontSize", 10);
        _loc1_.setStyle("color", 16777215);
        _loc1_.setStyle("fontFamily", "EurostileT");
        _loc1_.id = "questAdditionalInfo";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.questAdditionalInfo = _loc1_;
        BindingManager.executeBindings(this, "questAdditionalInfo", this.questAdditionalInfo);
        return _loc1_;
    }

    private function method_3793(): Image {
        var _loc1_: Image = new Image();
        _loc1_.left = 5;
        _loc1_.verticalCenter = 0;
        _loc1_.id = "questTypeIcon";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.questTypeIcon = _loc1_;
        BindingManager.executeBindings(this, "questTypeIcon", this.questTypeIcon);
        return _loc1_;
    }

    public function method_2340(param1: FlexEvent): void {
        this.creationCompleteHandler();
    }

    public function method_1019(param1: FlexEvent): void {
        this.method_31();
    }

    public function method_2973(param1: MouseEvent): void {
        this.rollHandler(param1);
    }

    public function method_1888(param1: MouseEvent): void {
        this.rollHandler(param1);
    }

    public function method_6505(param1: MouseEvent): void {
        this.clickHandler(param1);
    }

    private function method_1138(): Array {
        var var_5: Array = [];
        var_5[0] = new Binding(this, function (): String {
            var _loc1_: * = VerticalAlign.MIDDLE;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "textsContainer.verticalAlign");
        return var_5;
    }

    [Bindable(event="propertyChange")]
    public function get backgroundImage(): Scale9GridImage {
        return this.var_540;
    }

    public function set backgroundImage(param1: Scale9GridImage): void {
        var _loc2_: Object = this.var_540;
        if (_loc2_ !== param1) {
            this.var_540 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "backgroundImage", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get completedImage(): Scale9GridImage {
        return this.var_3985;
    }

    public function set completedImage(param1: Scale9GridImage): void {
        var _loc2_: Object = this.var_3985;
        if (_loc2_ !== param1) {
            this.var_3985 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "completedImage", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get disabledImage(): Scale9GridImage {
        return this.var_1414;
    }

    public function set disabledImage(param1: Scale9GridImage): void {
        var _loc2_: Object = this.var_1414;
        if (_loc2_ !== param1) {
            this.var_1414 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "disabledImage", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get inProgressGlowImage(): Scale9GridImage {
        return this.var_3400;
    }

    public function set inProgressGlowImage(param1: Scale9GridImage): void {
        var _loc2_: Object = this.var_3400;
        if (_loc2_ !== param1) {
            this.var_3400 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "inProgressGlowImage", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get lockedGlowImage(): Scale9GridImage {
        return this.var_3368;
    }

    public function set lockedGlowImage(param1: Scale9GridImage): void {
        var _loc2_: Object = this.var_3368;
        if (_loc2_ !== param1) {
            this.var_3368 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lockedGlowImage", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get questAdditionalInfo(): RichText {
        return this.var_2829;
    }

    public function set questAdditionalInfo(param1: RichText): void {
        var _loc2_: Object = this.var_2829;
        if (_loc2_ !== param1) {
            this.var_2829 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "questAdditionalInfo", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get questNameLabel(): RichText {
        return this.var_2297;
    }

    public function set questNameLabel(param1: RichText): void {
        var _loc2_: Object = this.var_2297;
        if (_loc2_ !== param1) {
            this.var_2297 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "questNameLabel", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get questTypeIcon(): Image {
        return this.var_1951;
    }

    public function set questTypeIcon(param1: Image): void {
        var _loc2_: Object = this.var_1951;
        if (_loc2_ !== param1) {
            this.var_1951 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "questTypeIcon", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get rollOverGlowImage(): Scale9GridImage {
        return this.var_412;
    }

    public function set rollOverGlowImage(param1: Scale9GridImage): void {
        var _loc2_: Object = this.var_412;
        if (_loc2_ !== param1) {
            this.var_412 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rollOverGlowImage", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get selectedImage(): Scale9GridImage {
        return this.var_4886;
    }

    public function set selectedImage(param1: Scale9GridImage): void {
        var _loc2_: Object = this.var_4886;
        if (_loc2_ !== param1) {
            this.var_4886 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selectedImage", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get textsContainer(): VGroup {
        return this.var_3682;
    }

    public function set textsContainer(param1: VGroup): void {
        var _loc2_: Object = this.var_3682;
        if (_loc2_ !== param1) {
            this.var_3682 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "textsContainer", _loc2_, param1));
            }
        }
    }
}
}
