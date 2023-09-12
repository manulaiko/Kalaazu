package spark.skins.spark {

import mx.binding.BindingManager;
import mx.core.ClassFactory;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IFlexModuleFactory;
import mx.core.IStateClient2;
import mx.events.PropertyChangeEvent;
import mx.graphics.SolidColor;
import mx.graphics.SolidColorStroke;
import mx.states.AddItems;
import mx.states.SetProperty;
import mx.states.State;

import spark.components.Button;
import spark.components.DataGroup;
import spark.components.DropDownList;
import spark.components.Group;
import spark.components.Label;
import spark.components.PopUpAnchor;
import spark.components.Scroller;
import spark.layouts.VerticalLayout;
import spark.primitives.Rect;
import spark.primitives.RectangularDropShadow;
import spark.skins.SparkSkin;

public class DropDownListSkin extends SparkSkin implements IStateClient2 {

    private static const contentFill: Array = ["bgFill"];


    private var _1332194002background: Rect;

    private var _1391998104bgFill: SolidColor;

    private var _1383304148border: Rect;

    private var _1395787140borderStroke: SolidColorStroke;

    private var _385593099dataGroup: DataGroup;

    private var _433014735dropDown: Group;

    private var _906978543dropShadow: RectangularDropShadow;

    private var _1184053038labelDisplay: Label;

    private var _137111012openButton: Button;

    private var _106851532popUp: PopUpAnchor;

    private var _402164678scroller: Scroller;

    private var __moduleFactoryInitialized: Boolean = false;

    private var _213507019hostComponent: DropDownList;

    public function DropDownListSkin() {
        super();
        mx_internal::_document = this;
        this.mxmlContent = [this._DropDownListSkin_Button1_i(), this._DropDownListSkin_Label1_i()];
        this.currentState = "normal";
        var _loc1_: DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._DropDownListSkin_PopUpAnchor1_i, this._DropDownListSkin_PopUpAnchor1_r);
        states = [new State({
            "name": "normal",
            "overrides": [new SetProperty().initializeFromObject({
                "target": "popUp",
                "name": "displayPopUp",
                "value": false
            })]
        }), new State({
            "name": "open",
            "overrides": [new AddItems().initializeFromObject({
                "destructionPolicy": "auto",
                "itemsFactory": _loc1_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "first"
            }), new SetProperty().initializeFromObject({
                "target": "popUp",
                "name": "displayPopUp",
                "value": true
            })]
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

    override public function get contentItems(): Array {
        return contentFill;
    }

    override protected function updateDisplayList(param1: Number, param2: Number): void {
        if (getStyle("borderVisible") == false) {
            if (this.border) {
                this.border.visible = false;
            }
            if (this.background) {
                this.background.left = this.background.top = this.background.right = this.background.bottom = 0;
            }
            if (this.scroller) {
                this.scroller.minViewportInset = 0;
            }
        } else {
            if (this.border) {
                this.border.visible = true;
            }
            if (this.background) {
                this.background.left = this.background.top = this.background.right = this.background.bottom = 1;
            }
            if (this.scroller) {
                this.scroller.minViewportInset = 1;
            }
        }
        if (this.dropShadow) {
            this.dropShadow.visible = getStyle("dropShadowVisible");
        }
        this.openButton.setStyle("cornerRadius", getStyle("cornerRadius"));
        if (this.borderStroke) {
            this.borderStroke.color = getStyle("borderColor");
            this.borderStroke.alpha = getStyle("borderAlpha");
        }
        super.updateDisplayList(param1, param2);
    }

    private function _DropDownListSkin_PopUpAnchor1_i(): PopUpAnchor {
        var _loc1_: PopUpAnchor = new PopUpAnchor();
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.top = 0;
        _loc1_.bottom = 0;
        _loc1_.popUpPosition = "below";
        _loc1_.popUpWidthMatchesAnchorWidth = true;
        _loc1_.popUp = this._DropDownListSkin_Group1_i();
        _loc1_.id = "popUp";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.popUp = _loc1_;
        BindingManager.executeBindings(this, "popUp", this.popUp);
        return _loc1_;
    }

    private function _DropDownListSkin_PopUpAnchor1_r(): void {
        var _loc1_: * = null;
        this.popUp = null;
        _loc1_ = null;
        this.dropDown = null;
        _loc1_ = null;
        this.dropShadow = null;
        _loc1_ = null;
        this.border = null;
        _loc1_ = null;
        this.borderStroke = null;
        _loc1_ = null;
        this.background = null;
        _loc1_ = null;
        this.bgFill = null;
        _loc1_ = null;
        this.scroller = null;
        _loc1_ = null;
        this.dataGroup = null;
        _loc1_;
        _loc1_;
        _loc1_;
        _loc1_;
        _loc1_;
        _loc1_;
        _loc1_;
        _loc1_;
        _loc1_;
    }

    private function _DropDownListSkin_Group1_i(): Group {
        var _loc1_: Group = new Group();
        _loc1_.mxmlContent = [this._DropDownListSkin_RectangularDropShadow1_i(), this._DropDownListSkin_Rect1_i(), this._DropDownListSkin_Rect2_i(), this._DropDownListSkin_Scroller1_i()];
        _loc1_.id = "dropDown";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.dropDown = _loc1_;
        BindingManager.executeBindings(this, "dropDown", this.dropDown);
        return _loc1_;
    }

    private function _DropDownListSkin_RectangularDropShadow1_i(): RectangularDropShadow {
        var _loc1_: RectangularDropShadow = new RectangularDropShadow();
        _loc1_.blurX = 20;
        _loc1_.blurY = 20;
        _loc1_.alpha = 0.45;
        _loc1_.distance = 7;
        _loc1_.angle = 90;
        _loc1_.color = 0;
        _loc1_.left = 0;
        _loc1_.top = 0;
        _loc1_.right = 0;
        _loc1_.bottom = 0;
        _loc1_.id = "dropShadow";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.dropShadow = _loc1_;
        BindingManager.executeBindings(this, "dropShadow", this.dropShadow);
        return _loc1_;
    }

    private function _DropDownListSkin_Rect1_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.top = 0;
        _loc1_.bottom = 0;
        _loc1_.stroke = this._DropDownListSkin_SolidColorStroke1_i();
        _loc1_.initialized(this, "border");
        this.border = _loc1_;
        BindingManager.executeBindings(this, "border", this.border);
        return _loc1_;
    }

    private function _DropDownListSkin_SolidColorStroke1_i(): SolidColorStroke {
        var _loc1_: SolidColorStroke = new SolidColorStroke();
        _loc1_.weight = 1;
        this.borderStroke = _loc1_;
        BindingManager.executeBindings(this, "borderStroke", this.borderStroke);
        return _loc1_;
    }

    private function _DropDownListSkin_Rect2_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 1;
        _loc1_.right = 1;
        _loc1_.top = 1;
        _loc1_.bottom = 1;
        _loc1_.fill = this._DropDownListSkin_SolidColor1_i();
        _loc1_.initialized(this, "background");
        this.background = _loc1_;
        BindingManager.executeBindings(this, "background", this.background);
        return _loc1_;
    }

    private function _DropDownListSkin_SolidColor1_i(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 16777215;
        this.bgFill = _loc1_;
        BindingManager.executeBindings(this, "bgFill", this.bgFill);
        return _loc1_;
    }

    private function _DropDownListSkin_Scroller1_i(): Scroller {
        var _loc1_: Scroller = new Scroller();
        _loc1_.left = 0;
        _loc1_.top = 0;
        _loc1_.right = 0;
        _loc1_.bottom = 0;
        _loc1_.hasFocusableChildren = false;
        _loc1_.minViewportInset = 1;
        _loc1_.viewport = this._DropDownListSkin_DataGroup1_i();
        _loc1_.id = "scroller";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.scroller = _loc1_;
        BindingManager.executeBindings(this, "scroller", this.scroller);
        return _loc1_;
    }

    private function _DropDownListSkin_DataGroup1_i(): DataGroup {
        var _loc1_: DataGroup = new DataGroup();
        _loc1_.itemRenderer = this._DropDownListSkin_ClassFactory1_c();
        _loc1_.layout = this._DropDownListSkin_VerticalLayout1_c();
        _loc1_.id = "dataGroup";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.dataGroup = _loc1_;
        BindingManager.executeBindings(this, "dataGroup", this.dataGroup);
        return _loc1_;
    }

    private function _DropDownListSkin_ClassFactory1_c(): ClassFactory {
        var _loc1_: ClassFactory = new ClassFactory();
        _loc1_.generator = DefaultItemRenderer;
        return _loc1_;
    }

    private function _DropDownListSkin_VerticalLayout1_c(): VerticalLayout {
        var _loc1_: VerticalLayout = new VerticalLayout();
        _loc1_.gap = 0;
        _loc1_.horizontalAlign = "contentJustify";
        _loc1_.requestedMinRowCount = 1;
        _loc1_.requestedMaxRowCount = 6;
        return _loc1_;
    }

    private function _DropDownListSkin_Button1_i(): Button {
        var _loc1_: Button = new Button();
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.top = 0;
        _loc1_.bottom = 0;
        _loc1_.focusEnabled = false;
        _loc1_.tabEnabled = false;
        _loc1_.setStyle("skinClass", DropDownListButtonSkin);
        _loc1_.id = "openButton";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.openButton = _loc1_;
        BindingManager.executeBindings(this, "openButton", this.openButton);
        return _loc1_;
    }

    private function _DropDownListSkin_Label1_i(): Label {
        var _loc1_: Label = new Label();
        _loc1_.maxDisplayedLines = 1;
        _loc1_.mouseEnabled = false;
        _loc1_.mouseChildren = false;
        _loc1_.left = 7;
        _loc1_.right = 30;
        _loc1_.top = 2;
        _loc1_.bottom = 2;
        _loc1_.width = 75;
        _loc1_.verticalCenter = 1;
        _loc1_.setStyle("verticalAlign", "middle");
        _loc1_.id = "labelDisplay";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.labelDisplay = _loc1_;
        BindingManager.executeBindings(this, "labelDisplay", this.labelDisplay);
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
    public function get border(): Rect {
        return this._1383304148border;
    }

    public function set border(param1: Rect): void {
        var _loc2_: Object = this._1383304148border;
        if (_loc2_ !== param1) {
            this._1383304148border = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "border", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get borderStroke(): SolidColorStroke {
        return this._1395787140borderStroke;
    }

    public function set borderStroke(param1: SolidColorStroke): void {
        var _loc2_: Object = this._1395787140borderStroke;
        if (_loc2_ !== param1) {
            this._1395787140borderStroke = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "borderStroke", _loc2_, param1));
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
    public function get dropDown(): Group {
        return this._433014735dropDown;
    }

    public function set dropDown(param1: Group): void {
        var _loc2_: Object = this._433014735dropDown;
        if (_loc2_ !== param1) {
            this._433014735dropDown = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dropDown", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get dropShadow(): RectangularDropShadow {
        return this._906978543dropShadow;
    }

    public function set dropShadow(param1: RectangularDropShadow): void {
        var _loc2_: Object = this._906978543dropShadow;
        if (_loc2_ !== param1) {
            this._906978543dropShadow = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dropShadow", _loc2_, param1));
            }
        }
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
    public function get openButton(): Button {
        return this._137111012openButton;
    }

    public function set openButton(param1: Button): void {
        var _loc2_: Object = this._137111012openButton;
        if (_loc2_ !== param1) {
            this._137111012openButton = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "openButton", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get popUp(): PopUpAnchor {
        return this._106851532popUp;
    }

    public function set popUp(param1: PopUpAnchor): void {
        var _loc2_: Object = this._106851532popUp;
        if (_loc2_ !== param1) {
            this._106851532popUp = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "popUp", _loc2_, param1));
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
    public function get hostComponent(): DropDownList {
        return this._213507019hostComponent;
    }

    public function set hostComponent(param1: DropDownList): void {
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
