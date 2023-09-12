package spark.skins.spark {

import mx.binding.BindingManager;
import mx.core.IFlexModuleFactory;
import mx.core.IStateClient2;
import mx.events.PropertyChangeEvent;
import mx.graphics.SolidColor;
import mx.graphics.SolidColorStroke;
import mx.states.SetProperty;
import mx.states.State;

import spark.components.Button;
import spark.components.Group;
import spark.primitives.Path;
import spark.primitives.Rect;
import spark.primitives.RectangularDropShadow;
import spark.skins.SparkSkin;

public class TitleWindowCloseButtonSkin extends SparkSkin implements IStateClient2 {

    private static const exclusions: Array = ["xSymbol"];

    private static const symbols: Array = ["xFill1", "xFill2"];


    private var _1248768264_TitleWindowCloseButtonSkin_SolidColor1: SolidColor;

    private var _1248768263_TitleWindowCloseButtonSkin_SolidColor2: SolidColor;

    private var _1125595552_TitleWindowCloseButtonSkin_SolidColorStroke1: SolidColorStroke;

    private var _1366647273cbshad: Rect;

    private var _906978543dropShadow: RectangularDropShadow;

    private var _791587466xFill1: SolidColor;

    private var _791587465xFill2: SolidColor;

    private var _1617569840xSymbol: Group;

    private var __moduleFactoryInitialized: Boolean = false;

    private var _213507019hostComponent: Button;

    public function TitleWindowCloseButtonSkin() {
        super();
        mx_internal::_document = this;
        this.mxmlContent = [this._TitleWindowCloseButtonSkin_RectangularDropShadow1_i(), this._TitleWindowCloseButtonSkin_Rect1_c(), this._TitleWindowCloseButtonSkin_Rect2_i(), this._TitleWindowCloseButtonSkin_Group1_i()];
        this.currentState = "up";
        states = [new State({
            "name": "up",
            "overrides": []
        }), new State({
            "name": "over",
            "overrides": [new SetProperty().initializeFromObject({
                "target": "dropShadow",
                "name": "alpha",
                "value": 0.85
            }), new SetProperty().initializeFromObject({
                "target": "_TitleWindowCloseButtonSkin_SolidColorStroke1",
                "name": "alpha",
                "value": 0.7
            }), new SetProperty().initializeFromObject({
                "target": "_TitleWindowCloseButtonSkin_SolidColor2",
                "name": "color",
                "value": 16777215
            }), new SetProperty().initializeFromObject({
                "target": "_TitleWindowCloseButtonSkin_SolidColor2",
                "name": "alpha",
                "value": 0.85
            })]
        }), new State({
            "name": "down",
            "overrides": [new SetProperty().initializeFromObject({
                "target": "dropShadow",
                "name": "alpha",
                "value": 0.85
            }), new SetProperty().initializeFromObject({
                "target": "_TitleWindowCloseButtonSkin_SolidColorStroke1",
                "name": "alpha",
                "value": 0.7
            }), new SetProperty().initializeFromObject({
                "target": "_TitleWindowCloseButtonSkin_SolidColor1",
                "name": "alpha",
                "value": 0.7
            }), new SetProperty().initializeFromObject({
                "target": "_TitleWindowCloseButtonSkin_SolidColor2",
                "name": "alpha",
                "value": 0.22
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

    override public function get colorizeExclusions(): Array {
        return exclusions;
    }

    override public function get symbolItems(): Array {
        return symbols;
    }

    private function _TitleWindowCloseButtonSkin_RectangularDropShadow1_i(): RectangularDropShadow {
        var _loc1_: RectangularDropShadow = new RectangularDropShadow();
        _loc1_.blurX = 0;
        _loc1_.blurY = 0;
        _loc1_.alpha = 0;
        _loc1_.distance = 1;
        _loc1_.angle = 90;
        _loc1_.color = 16777215;
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

    private function _TitleWindowCloseButtonSkin_Rect1_c(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 0;
        _loc1_.top = 0;
        _loc1_.right = 0;
        _loc1_.bottom = 0;
        _loc1_.stroke = this._TitleWindowCloseButtonSkin_SolidColorStroke1_i();
        _loc1_.fill = this._TitleWindowCloseButtonSkin_SolidColor1_i();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _TitleWindowCloseButtonSkin_SolidColorStroke1_i(): SolidColorStroke {
        var _loc1_: SolidColorStroke = new SolidColorStroke();
        _loc1_.color = 0;
        _loc1_.alpha = 0;
        _loc1_.weight = 1;
        this._TitleWindowCloseButtonSkin_SolidColorStroke1 = _loc1_;
        BindingManager.executeBindings(this, "_TitleWindowCloseButtonSkin_SolidColorStroke1", this._TitleWindowCloseButtonSkin_SolidColorStroke1);
        return _loc1_;
    }

    private function _TitleWindowCloseButtonSkin_SolidColor1_i(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 13421772;
        _loc1_.alpha = 0;
        this._TitleWindowCloseButtonSkin_SolidColor1 = _loc1_;
        BindingManager.executeBindings(this, "_TitleWindowCloseButtonSkin_SolidColor1", this._TitleWindowCloseButtonSkin_SolidColor1);
        return _loc1_;
    }

    private function _TitleWindowCloseButtonSkin_Rect2_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 1;
        _loc1_.right = 1;
        _loc1_.top = 1;
        _loc1_.height = 1;
        _loc1_.fill = this._TitleWindowCloseButtonSkin_SolidColor2_i();
        _loc1_.initialized(this, "cbshad");
        this.cbshad = _loc1_;
        BindingManager.executeBindings(this, "cbshad", this.cbshad);
        return _loc1_;
    }

    private function _TitleWindowCloseButtonSkin_SolidColor2_i(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 0;
        _loc1_.alpha = 0;
        this._TitleWindowCloseButtonSkin_SolidColor2 = _loc1_;
        BindingManager.executeBindings(this, "_TitleWindowCloseButtonSkin_SolidColor2", this._TitleWindowCloseButtonSkin_SolidColor2);
        return _loc1_;
    }

    private function _TitleWindowCloseButtonSkin_Group1_i(): Group {
        var _loc1_: Group = new Group();
        _loc1_.top = 1;
        _loc1_.left = 1;
        _loc1_.mxmlContent = [this._TitleWindowCloseButtonSkin_Path1_c(), this._TitleWindowCloseButtonSkin_Path2_c(), this._TitleWindowCloseButtonSkin_Path3_c()];
        _loc1_.id = "xSymbol";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.xSymbol = _loc1_;
        BindingManager.executeBindings(this, "xSymbol", this.xSymbol);
        return _loc1_;
    }

    private function _TitleWindowCloseButtonSkin_Path1_c(): Path {
        var _loc1_: Path = new Path();
        _loc1_.blendMode = "normal";
        _loc1_.alpha = 0.85;
        _loc1_.data = "M 3 5 L 4 5 L 4 6 L 5 6 L 5 7 L 4 7 L 4 8 L 3 8 L 3 9 L 4 9 L 4 10 L 5 10 L 5 9 L 6 9 L 6 8 L 7 8 L 7 9 L 8 9 L 8 10 L 9 10 L 9 9 L 10 9 L 10 8 L 9 8 L 9 7 L 8 7 L 8 6 L 9 6 L 9 5 L 10 5 L 10 4 L 9 4 L 9 3 L 8 3 L 8 4 L 7 4 L 7 5 L 6 5 L 6 4 L 5 4 L 5 3 L 4 3 L 4 4 L 3 4 L 3 5 Z";
        _loc1_.fill = this._TitleWindowCloseButtonSkin_SolidColor3_i();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _TitleWindowCloseButtonSkin_SolidColor3_i(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 0;
        this.xFill1 = _loc1_;
        BindingManager.executeBindings(this, "xFill1", this.xFill1);
        return _loc1_;
    }

    private function _TitleWindowCloseButtonSkin_Path2_c(): Path {
        var _loc1_: Path = new Path();
        _loc1_.blendMode = "normal";
        _loc1_.alpha = 0.75;
        _loc1_.data = "M 3 3 L 4 3 L 4 4 L 3 4 L 3 3 M 3 9 L 4 9 L 4 10 L 3 10 L 3 9 M 9 3 L 10 3 L 10 4 L 9 4 L 9 3 M 9 9 L 10 9 L 10 10 L 9 10 L 9 9 Z";
        _loc1_.fill = this._TitleWindowCloseButtonSkin_SolidColor4_i();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _TitleWindowCloseButtonSkin_SolidColor4_i(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 0;
        this.xFill2 = _loc1_;
        BindingManager.executeBindings(this, "xFill2", this.xFill2);
        return _loc1_;
    }

    private function _TitleWindowCloseButtonSkin_Path3_c(): Path {
        var _loc1_: Path = new Path();
        _loc1_.blendMode = "normal";
        _loc1_.alpha = 0.85;
        _loc1_.data = "M 3 5 L 3 6 L 4 6 L 4 7 L 5 7 L 5 6 L 4 6 L 4 5 L 3 5 M 8 6 L 8 7 L 9 7 L 9 6 L 10 6 L 10 5 L 9 5 L 9 6 L 8 6 M 3 10 L 3 11 L 5 11 5 10 L 6 10 L 6 9 L 7 9 L 7 10 L 8 10 L 8 11 L 10 11 L 10 10 L 8 10 L 8 9 L 7 9 L 7 8 L 6 8 L 6 9 L 5 9 L 5 10 L 3 10 Z";
        _loc1_.fill = this._TitleWindowCloseButtonSkin_SolidColor5_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _TitleWindowCloseButtonSkin_SolidColor5_c(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 16777215;
        return _loc1_;
    }

    [Bindable(event="propertyChange")]
    public function get _TitleWindowCloseButtonSkin_SolidColor1(): SolidColor {
        return this._1248768264_TitleWindowCloseButtonSkin_SolidColor1;
    }

    public function set _TitleWindowCloseButtonSkin_SolidColor1(param1: SolidColor): void {
        var _loc2_: Object = this._1248768264_TitleWindowCloseButtonSkin_SolidColor1;
        if (_loc2_ !== param1) {
            this._1248768264_TitleWindowCloseButtonSkin_SolidColor1 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_TitleWindowCloseButtonSkin_SolidColor1", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get _TitleWindowCloseButtonSkin_SolidColor2(): SolidColor {
        return this._1248768263_TitleWindowCloseButtonSkin_SolidColor2;
    }

    public function set _TitleWindowCloseButtonSkin_SolidColor2(param1: SolidColor): void {
        var _loc2_: Object = this._1248768263_TitleWindowCloseButtonSkin_SolidColor2;
        if (_loc2_ !== param1) {
            this._1248768263_TitleWindowCloseButtonSkin_SolidColor2 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_TitleWindowCloseButtonSkin_SolidColor2", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get _TitleWindowCloseButtonSkin_SolidColorStroke1(): SolidColorStroke {
        return this._1125595552_TitleWindowCloseButtonSkin_SolidColorStroke1;
    }

    public function set _TitleWindowCloseButtonSkin_SolidColorStroke1(param1: SolidColorStroke): void {
        var _loc2_: Object = this._1125595552_TitleWindowCloseButtonSkin_SolidColorStroke1;
        if (_loc2_ !== param1) {
            this._1125595552_TitleWindowCloseButtonSkin_SolidColorStroke1 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_TitleWindowCloseButtonSkin_SolidColorStroke1", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get cbshad(): Rect {
        return this._1366647273cbshad;
    }

    public function set cbshad(param1: Rect): void {
        var _loc2_: Object = this._1366647273cbshad;
        if (_loc2_ !== param1) {
            this._1366647273cbshad = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cbshad", _loc2_, param1));
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
    public function get xFill1(): SolidColor {
        return this._791587466xFill1;
    }

    public function set xFill1(param1: SolidColor): void {
        var _loc2_: Object = this._791587466xFill1;
        if (_loc2_ !== param1) {
            this._791587466xFill1 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xFill1", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get xFill2(): SolidColor {
        return this._791587465xFill2;
    }

    public function set xFill2(param1: SolidColor): void {
        var _loc2_: Object = this._791587465xFill2;
        if (_loc2_ !== param1) {
            this._791587465xFill2 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xFill2", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get xSymbol(): Group {
        return this._1617569840xSymbol;
    }

    public function set xSymbol(param1: Group): void {
        var _loc2_: Object = this._1617569840xSymbol;
        if (_loc2_ !== param1) {
            this._1617569840xSymbol = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xSymbol", _loc2_, param1));
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
