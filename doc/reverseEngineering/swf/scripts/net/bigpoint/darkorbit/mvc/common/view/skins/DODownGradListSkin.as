package net.bigpoint.darkorbit.mvc.common.view.skins {

import mx.binding.BindingManager;
import mx.core.ClassFactory;
import mx.core.DeferredInstanceFromFunction;
import mx.core.FlexVersion;
import mx.core.IFlexModuleFactory;
import mx.core.IStateClient2;
import mx.events.PropertyChangeEvent;
import mx.graphics.SolidColor;
import mx.states.SetProperty;
import mx.states.State;

import spark.components.BorderContainer;
import spark.components.DataGroup;
import spark.components.List;
import spark.components.Scroller;
import spark.layouts.VerticalLayout;
import spark.primitives.Rect;
import spark.skins.SparkSkin;
import spark.skins.spark.DefaultItemRenderer;

public class DODownGradListSkin extends SparkSkin implements IStateClient2 {

    private static const exclusions: Array = ["scroller", "background", "border"];

    private static const exclusions_4_0: Array = ["scroller", "background"];

    private static const contentFill: Array = ["bgFill"];


    private var _1332194002background: Rect;

    private var _1391998104bgFill: SolidColor;

    private var _1383304148border: BorderContainer;

    private var _385593099dataGroup: DataGroup;

    private var _1419185120dropIndicator: ClassFactory;

    private var _402164678scroller: Scroller;

    private var __moduleFactoryInitialized: Boolean = false;

    private var _213507019hostComponent: List;

    public function DODownGradListSkin() {
        super();
        mx_internal::_document = this;
        this.blendMode = "normal";
        this.mxmlContent = [this._DODownGradListSkin_BorderContainer1_i()];
        this.currentState = "normal";
        this._DODownGradListSkin_ClassFactory1_i();
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
        if (false) {
            return exclusions_4_0;
        }
        return exclusions;
    }

    override public function get contentItems(): Array {
        return contentFill;
    }

    override protected function initializationComplete(): void {
        useChromeColor = true;
        super.initializationComplete();
    }

    override protected function updateDisplayList(param1: Number, param2: Number): void {
        if (getStyle("borderVisible") == true) {
            this.border.visible = true;
            this.background.left = this.background.top = this.background.right = this.background.bottom = 1;
            this.scroller.minViewportInset = 1;
        } else {
            this.border.visible = false;
            this.background.left = this.background.top = this.background.right = this.background.bottom = 0;
            this.scroller.minViewportInset = 0;
        }
        this.border.setStyle("borderColor", getStyle("borderColor"));
        this.border.alpha = getStyle("borderAlpha");
        super.updateDisplayList(param1, param2);
    }

    private function _DODownGradListSkin_ClassFactory1_i(): ClassFactory {
        var _loc1_: ClassFactory = new ClassFactory();
        _loc1_.generator = DODownGradListSkinInnerClass0;
        _loc1_.properties = {"outerDocument": this};
        this.dropIndicator = _loc1_;
        BindingManager.executeBindings(this, "dropIndicator", this.dropIndicator);
        return _loc1_;
    }

    private function _DODownGradListSkin_BorderContainer1_i(): BorderContainer {
        var _loc1_: BorderContainer = new BorderContainer();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.top = 0;
        _loc1_.bottom = 0;
        _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._DODownGradListSkin_Array3_c);
        _loc1_.setStyle("borderWeight", 1);
        _loc1_.setStyle("cornerRadius", 2);
        _loc1_.setStyle("backgroundAlpha", 0);
        _loc1_.id = "border";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.border = _loc1_;
        BindingManager.executeBindings(this, "border", this.border);
        return _loc1_;
    }

    private function _DODownGradListSkin_Array3_c(): Array {
        return [this._DODownGradListSkin_Rect1_i(), this._DODownGradListSkin_Scroller1_i()];
    }

    private function _DODownGradListSkin_Rect1_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 1;
        _loc1_.right = 1;
        _loc1_.top = 1;
        _loc1_.bottom = 1;
        _loc1_.fill = this._DODownGradListSkin_SolidColor1_i();
        _loc1_.initialized(this, "background");
        this.background = _loc1_;
        BindingManager.executeBindings(this, "background", this.background);
        return _loc1_;
    }

    private function _DODownGradListSkin_SolidColor1_i(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 65535;
        _loc1_.alpha = 0;
        this.bgFill = _loc1_;
        BindingManager.executeBindings(this, "bgFill", this.bgFill);
        return _loc1_;
    }

    private function _DODownGradListSkin_Scroller1_i(): Scroller {
        var _loc1_: Scroller = new Scroller();
        _loc1_.left = 0;
        _loc1_.top = 0;
        _loc1_.right = 0;
        _loc1_.bottom = 2;
        _loc1_.minViewportInset = 1;
        _loc1_.hasFocusableChildren = false;
        _loc1_.styleName = "skinnedScroller";
        _loc1_.viewport = this._DODownGradListSkin_DataGroup1_i();
        _loc1_.id = "scroller";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.scroller = _loc1_;
        BindingManager.executeBindings(this, "scroller", this.scroller);
        return _loc1_;
    }

    private function _DODownGradListSkin_DataGroup1_i(): DataGroup {
        var _loc1_: DataGroup = new DataGroup();
        _loc1_.itemRenderer = this._DODownGradListSkin_ClassFactory2_c();
        _loc1_.layout = this._DODownGradListSkin_VerticalLayout1_c();
        _loc1_.id = "dataGroup";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.dataGroup = _loc1_;
        BindingManager.executeBindings(this, "dataGroup", this.dataGroup);
        return _loc1_;
    }

    private function _DODownGradListSkin_ClassFactory2_c(): ClassFactory {
        var _loc1_: ClassFactory = new ClassFactory();
        _loc1_.generator = DefaultItemRenderer;
        return _loc1_;
    }

    private function _DODownGradListSkin_VerticalLayout1_c(): VerticalLayout {
        var _loc1_: VerticalLayout = new VerticalLayout();
        _loc1_.gap = 0;
        _loc1_.horizontalAlign = "contentJustify";
        _loc1_.requestedMinRowCount = 1;
        return _loc1_;
    }

    [Bindable(event="propertyChange")]
    public function get background(): Rect {
        return this._1332194002background;
    }

    public function set background(param1: Rect): void {
        var _loc2_: Object = this._1332194002background;
        if (_loc2_ !== param1) {
            this._1332194002background = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "background", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get bgFill(): SolidColor {
        return this._1391998104bgFill;
    }

    public function set bgFill(param1: SolidColor): void {
        var _loc2_: Object = this._1391998104bgFill;
        if (_loc2_ !== param1) {
            this._1391998104bgFill = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bgFill", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get border(): BorderContainer {
        return this._1383304148border;
    }

    public function set border(param1: BorderContainer): void {
        var _loc2_: Object = this._1383304148border;
        if (_loc2_ !== param1) {
            this._1383304148border = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "border", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get dataGroup(): DataGroup {
        return this._385593099dataGroup;
    }

    public function set dataGroup(param1: DataGroup): void {
        var _loc2_: Object = this._385593099dataGroup;
        if (_loc2_ !== param1) {
            this._385593099dataGroup = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dataGroup", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get dropIndicator(): ClassFactory {
        return this._1419185120dropIndicator;
    }

    public function set dropIndicator(param1: ClassFactory): void {
        var _loc2_: Object = this._1419185120dropIndicator;
        if (_loc2_ !== param1) {
            this._1419185120dropIndicator = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dropIndicator", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get scroller(): Scroller {
        return this._402164678scroller;
    }

    public function set scroller(param1: Scroller): void {
        var _loc2_: Object = this._402164678scroller;
        if (_loc2_ !== param1) {
            this._402164678scroller = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "scroller", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get hostComponent(): List {
        return this._213507019hostComponent;
    }

    public function set hostComponent(param1: List): void {
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
