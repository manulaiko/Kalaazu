package spark.skins.spark {

import mx.binding.BindingManager;
import mx.core.DeferredInstanceFromFunction;
import mx.core.FlexVersion;
import mx.core.IFlexModuleFactory;
import mx.core.IStateClient2;
import mx.events.PropertyChangeEvent;
import mx.graphics.SolidColor;
import mx.graphics.SolidColorStroke;
import mx.states.AddItems;
import mx.states.SetProperty;
import mx.states.State;

import spark.components.Label;
import spark.components.RichEditableText;
import spark.components.Scroller;
import spark.components.TextArea;
import spark.primitives.Rect;
import spark.skins.SparkSkin;

public class TextAreaSkin extends SparkSkin implements IStateClient2 {

    private static const exclusions: Array = ["background", "scroller", "promptDisplay", "border"];

    private static const exclusions_4_0: Array = ["background", "scroller", "promptDisplay"];

    private static const contentFill: Array = ["bgFill"];

    private static const focusExclusions: Array = ["textDisplay"];


    private var _1332194002background: Rect;

    private var _1391998104bgFill: SolidColor;

    private var _1383304148border: Rect;

    private var _1395787140borderStroke: SolidColorStroke;

    private var _263438014promptDisplay: Label;

    private var _402164678scroller: Scroller;

    private var _903579360shadow: Rect;

    private var _831827669textDisplay: RichEditableText;

    private var __moduleFactoryInitialized: Boolean = false;

    private var lineBreakChanged: Boolean;

    private var paddingChanged: Boolean;

    private var verticalAlignChanged: Boolean;

    private var _213507019hostComponent: TextArea;

    public function TextAreaSkin() {
        super();
        mx_internal::_document = this;
        this.blendMode = "normal";
        this.mxmlContent = [this._TextAreaSkin_Rect1_i(), this._TextAreaSkin_Rect2_i(), this._TextAreaSkin_Rect3_i(), this._TextAreaSkin_Scroller1_i()];
        this.currentState = "normal";
        var _loc1_: DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._TextAreaSkin_Label1_i);
        states = [new State({
            "name": "normal",
            "overrides": []
        }), new State({
            "name": "disabled",
            "stateGroups": ["disabledStates"],
            "overrides": [new SetProperty().initializeFromObject({
                "name": "alpha",
                "value": 0.5
            })]
        }), new State({
            "name": "normalWithPrompt",
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _loc1_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["scroller"]
            })]
        }), new State({
            "name": "disabledWithPrompt",
            "stateGroups": ["disabledStates"],
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _loc1_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["scroller"]
            }), new SetProperty().initializeFromObject({
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

    override protected function commitProperties(): void {
        super.commitProperties();
        if (this.lineBreakChanged) {
            this.updateStringStyle("lineBreak");
            this.lineBreakChanged = false;
        }
        if (this.paddingChanged) {
            this.updatePadding();
            this.paddingChanged = false;
        }
        if (this.verticalAlignChanged) {
            this.updateStringStyle("verticalAlign");
            this.verticalAlignChanged = false;
        }
    }

    override protected function initializationComplete(): void {
        useChromeColor = true;
        super.initializationComplete();
    }

    override protected function updateDisplayList(param1: Number, param2: Number): void {
        if (getStyle("borderVisible") == true) {
            this.border.visible = true;
            this.shadow.visible = true;
            this.background.left = this.background.top = this.background.right = this.background.bottom = 1;
            this.textDisplay.left = this.textDisplay.top = this.textDisplay.right = this.textDisplay.bottom = 1;
            if (this.promptDisplay) {
                this.promptDisplay.setLayoutBoundsSize(param1 - 2, param2 - 2);
                this.promptDisplay.setLayoutBoundsPosition(1, 1);
            }
        } else {
            this.border.visible = false;
            this.shadow.visible = false;
            this.background.left = this.background.top = this.background.right = this.background.bottom = 0;
            if (this.promptDisplay) {
                this.promptDisplay.setLayoutBoundsSize(param1 - 1, param2 - 1);
                this.promptDisplay.setLayoutBoundsPosition(1, 1);
            }
        }
        this.borderStroke.color = getStyle("borderColor");
        this.borderStroke.alpha = getStyle("borderAlpha");
        super.updateDisplayList(param1, param2);
    }

    private function updatePadding(): void {
        var _loc1_: Number = NaN;
        if (!this.textDisplay) {
            return;
        }
        _loc1_ = getStyle("paddingLeft");
        if (this.textDisplay.getStyle("paddingLeft") != _loc1_) {
            this.textDisplay.setStyle("paddingLeft", _loc1_);
        }
        _loc1_ = getStyle("paddingTop");
        if (this.textDisplay.getStyle("paddingTop") != _loc1_) {
            this.textDisplay.setStyle("paddingTop", _loc1_);
        }
        _loc1_ = getStyle("paddingRight");
        if (this.textDisplay.getStyle("paddingRight") != _loc1_) {
            this.textDisplay.setStyle("paddingRight", _loc1_);
        }
        _loc1_ = getStyle("paddingBottom");
        if (this.textDisplay.getStyle("paddingBottom") != _loc1_) {
            this.textDisplay.setStyle("paddingBottom", _loc1_);
        }
        if (!this.promptDisplay) {
            return;
        }
        _loc1_ = getStyle("paddingLeft");
        if (this.promptDisplay.getStyle("paddingLeft") != _loc1_) {
            this.promptDisplay.setStyle("paddingLeft", _loc1_);
        }
        _loc1_ = getStyle("paddingTop");
        if (this.promptDisplay.getStyle("paddingTop") != _loc1_) {
            this.promptDisplay.setStyle("paddingTop", _loc1_);
        }
        _loc1_ = getStyle("paddingRight");
        if (this.promptDisplay.getStyle("paddingRight") != _loc1_) {
            this.promptDisplay.setStyle("paddingRight", _loc1_);
        }
        _loc1_ = getStyle("paddingBottom");
        if (this.promptDisplay.getStyle("paddingBottom") != _loc1_) {
            this.promptDisplay.setStyle("paddingBottom", _loc1_);
        }
    }

    private function updateStringStyle(param1: String): void {
        var _loc2_: * = null;
        if (!this.textDisplay) {
            return;
        }
        _loc2_ = getStyle(param1);
        if (this.textDisplay.getStyle(param1) != _loc2_) {
            this.textDisplay.setStyle(param1, _loc2_);
        }
        if (!this.promptDisplay) {
            return;
        }
        _loc2_ = getStyle(param1);
        if (this.promptDisplay.getStyle(param1) != _loc2_) {
            this.promptDisplay.setStyle(param1, _loc2_);
        }
    }

    override public function styleChanged(param1: String): void {
        var _loc2_: Boolean = !param1 || param1 == "styleName";
        super.styleChanged(param1);
        if (_loc2_ || param1.indexOf("lineBreak") == 0) {
            this.lineBreakChanged = true;
            invalidateProperties();
        }
        if (_loc2_ || param1.indexOf("padding") == 0) {
            this.paddingChanged = true;
            invalidateProperties();
        }
        if (_loc2_ || param1.indexOf("verticalAlign") == 0) {
            this.verticalAlignChanged = true;
            invalidateProperties();
        }
    }

    override public function get focusSkinExclusions(): Array {
        return focusExclusions;
    }

    private function _TextAreaSkin_Rect1_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.top = 0;
        _loc1_.bottom = 0;
        _loc1_.stroke = this._TextAreaSkin_SolidColorStroke1_i();
        _loc1_.initialized(this, "border");
        this.border = _loc1_;
        BindingManager.executeBindings(this, "border", this.border);
        return _loc1_;
    }

    private function _TextAreaSkin_SolidColorStroke1_i(): SolidColorStroke {
        var _loc1_: SolidColorStroke = new SolidColorStroke();
        _loc1_.weight = 1;
        this.borderStroke = _loc1_;
        BindingManager.executeBindings(this, "borderStroke", this.borderStroke);
        return _loc1_;
    }

    private function _TextAreaSkin_Rect2_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 1;
        _loc1_.right = 1;
        _loc1_.top = 1;
        _loc1_.bottom = 1;
        _loc1_.fill = this._TextAreaSkin_SolidColor1_i();
        _loc1_.initialized(this, "background");
        this.background = _loc1_;
        BindingManager.executeBindings(this, "background", this.background);
        return _loc1_;
    }

    private function _TextAreaSkin_SolidColor1_i(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 16777215;
        this.bgFill = _loc1_;
        BindingManager.executeBindings(this, "bgFill", this.bgFill);
        return _loc1_;
    }

    private function _TextAreaSkin_Rect3_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 1;
        _loc1_.top = 1;
        _loc1_.right = 1;
        _loc1_.height = 1;
        _loc1_.fill = this._TextAreaSkin_SolidColor2_c();
        _loc1_.initialized(this, "shadow");
        this.shadow = _loc1_;
        BindingManager.executeBindings(this, "shadow", this.shadow);
        return _loc1_;
    }

    private function _TextAreaSkin_SolidColor2_c(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 0;
        _loc1_.alpha = 0.12;
        return _loc1_;
    }

    private function _TextAreaSkin_Scroller1_i(): Scroller {
        var _loc1_: Scroller = new Scroller();
        _loc1_.left = 0;
        _loc1_.top = 0;
        _loc1_.right = 0;
        _loc1_.bottom = 0;
        _loc1_.minViewportInset = 1;
        _loc1_.measuredSizeIncludesScrollBars = false;
        _loc1_.hasFocusableChildren = false;
        _loc1_.viewport = this._TextAreaSkin_RichEditableText1_i();
        _loc1_.id = "scroller";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.scroller = _loc1_;
        BindingManager.executeBindings(this, "scroller", this.scroller);
        return _loc1_;
    }

    private function _TextAreaSkin_RichEditableText1_i(): RichEditableText {
        var _loc1_: RichEditableText = new RichEditableText();
        _loc1_.heightInLines = 10;
        _loc1_.widthInChars = 15;
        _loc1_.id = "textDisplay";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.textDisplay = _loc1_;
        BindingManager.executeBindings(this, "textDisplay", this.textDisplay);
        return _loc1_;
    }

    private function _TextAreaSkin_Label1_i(): Label {
        var _loc1_: Label = new Label();
        _loc1_.mouseEnabled = false;
        _loc1_.mouseChildren = false;
        _loc1_.includeInLayout = false;
        _loc1_.id = "promptDisplay";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.promptDisplay = _loc1_;
        BindingManager.executeBindings(this, "promptDisplay", this.promptDisplay);
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
    public function get promptDisplay(): Label {
        return this._263438014promptDisplay;
    }

    public function set promptDisplay(param1: Label): void {
        var _loc2_: Object = this._263438014promptDisplay;
        if (_loc2_ !== param1) {
            this._263438014promptDisplay = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "promptDisplay", _loc2_, param1));
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
    public function get shadow(): Rect {
        return this._903579360shadow;
    }

    public function set shadow(param1: Rect): void {
        var _loc2_: Object = this._903579360shadow;
        if (_loc2_ !== param1) {
            this._903579360shadow = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shadow", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get textDisplay(): RichEditableText {
        return this._831827669textDisplay;
    }

    public function set textDisplay(param1: RichEditableText): void {
        var _loc2_: Object = this._831827669textDisplay;
        if (_loc2_ !== param1) {
            this._831827669textDisplay = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "textDisplay", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get hostComponent(): TextArea {
        return this._213507019hostComponent;
    }

    public function set hostComponent(param1: TextArea): void {
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
