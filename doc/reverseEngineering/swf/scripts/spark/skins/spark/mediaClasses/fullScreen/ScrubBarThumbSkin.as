package spark.skins.spark.mediaClasses.fullScreen {

import mx.binding.BindingManager;
import mx.core.IFlexModuleFactory;
import mx.core.IStateClient2;
import mx.events.PropertyChangeEvent;
import mx.graphics.GradientEntry;
import mx.graphics.LinearGradient;
import mx.graphics.SolidColor;
import mx.graphics.SolidColorStroke;
import mx.states.SetProperty;
import mx.states.State;

import spark.components.Button;
import spark.components.Group;
import spark.components.supportClasses.Skin;
import spark.primitives.Line;
import spark.primitives.Path;
import spark.primitives.Rect;

public class ScrubBarThumbSkin extends Skin implements IStateClient2 {


    private var _757787230_ScrubBarThumbSkin_Path2: Path;

    private var __moduleFactoryInitialized: Boolean = false;

    private var _213507019hostComponent: Button;

    public function ScrubBarThumbSkin() {
        super();
        mx_internal::_document = this;
        this.mxmlContent = [this._ScrubBarThumbSkin_Rect1_c(), this._ScrubBarThumbSkin_Group1_c(), this._ScrubBarThumbSkin_Rect2_c()];
        this.currentState = "up";
        states = [new State({
            "name": "up",
            "overrides": []
        }), new State({
            "name": "over",
            "overrides": [new SetProperty().initializeFromObject({
                "target": "_ScrubBarThumbSkin_Path2",
                "name": "fill",
                "value": this._ScrubBarThumbSkin_LinearGradient2_c()
            })]
        }), new State({
            "name": "down",
            "overrides": [new SetProperty().initializeFromObject({
                "target": "_ScrubBarThumbSkin_Path2",
                "name": "fill",
                "value": this._ScrubBarThumbSkin_LinearGradient3_c()
            })]
        }), new State({
            "name": "disabled",
            "overrides": []
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

    private function _ScrubBarThumbSkin_Rect1_c(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.width = 1;
        _loc1_.x = 7;
        _loc1_.y = 0;
        _loc1_.height = 7;
        _loc1_.fill = this._ScrubBarThumbSkin_SolidColor1_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _ScrubBarThumbSkin_SolidColor1_c(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 0;
        return _loc1_;
    }

    private function _ScrubBarThumbSkin_Group1_c(): Group {
        var _loc1_: Group = new Group();
        _loc1_.y = 6;
        _loc1_.mxmlContent = [this._ScrubBarThumbSkin_Line1_c(), this._ScrubBarThumbSkin_Line2_c(), this._ScrubBarThumbSkin_Line3_c(), this._ScrubBarThumbSkin_Path1_c(), this._ScrubBarThumbSkin_Path2_i(), this._ScrubBarThumbSkin_Path3_c()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function _ScrubBarThumbSkin_Line1_c(): Line {
        var _loc1_: Line = new Line();
        _loc1_.xFrom = 4;
        _loc1_.xTo = 11;
        _loc1_.y = 10;
        _loc1_.stroke = this._ScrubBarThumbSkin_SolidColorStroke1_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _ScrubBarThumbSkin_SolidColorStroke1_c(): SolidColorStroke {
        var _loc1_: SolidColorStroke = new SolidColorStroke();
        _loc1_.color = 0;
        _loc1_.alpha = 0.5;
        return _loc1_;
    }

    private function _ScrubBarThumbSkin_Line2_c(): Line {
        var _loc1_: Line = new Line();
        _loc1_.yFrom = 4;
        _loc1_.yTo = 11;
        _loc1_.x = 3;
        _loc1_.stroke = this._ScrubBarThumbSkin_SolidColorStroke2_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _ScrubBarThumbSkin_SolidColorStroke2_c(): SolidColorStroke {
        var _loc1_: SolidColorStroke = new SolidColorStroke();
        _loc1_.color = 0;
        _loc1_.alpha = 0.12;
        return _loc1_;
    }

    private function _ScrubBarThumbSkin_Line3_c(): Line {
        var _loc1_: Line = new Line();
        _loc1_.yFrom = 4;
        _loc1_.yTo = 11;
        _loc1_.x = 11;
        _loc1_.stroke = this._ScrubBarThumbSkin_SolidColorStroke3_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _ScrubBarThumbSkin_SolidColorStroke3_c(): SolidColorStroke {
        var _loc1_: SolidColorStroke = new SolidColorStroke();
        _loc1_.color = 0;
        _loc1_.alpha = 0.12;
        return _loc1_;
    }

    private function _ScrubBarThumbSkin_Path1_c(): Path {
        var _loc1_: Path = new Path();
        _loc1_.winding = "evenOdd";
        _loc1_.data = "M 4 2 L 4 10 L 11 10 L 11 3 L 10 3 L 10 2 L 9 2 L 9 1 L 6 1 L 6 2 L 5 2 L 5 3 L 4 3 L 4 2 Z";
        _loc1_.fill = this._ScrubBarThumbSkin_SolidColor2_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _ScrubBarThumbSkin_SolidColor2_c(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 0;
        return _loc1_;
    }

    private function _ScrubBarThumbSkin_Path2_i(): Path {
        var _loc1_: Path = new Path();
        _loc1_.winding = "evenOdd";
        _loc1_.data = "M 5 4 L 5 9 L 10 9 L 10 4 L 9 4 L 9 3 L 8 3 L 8 2 L 8 1 L 8 2 L 7 2 L 7 3 L 6 3 L 6 4 L 5 4 Z";
        _loc1_.fill = this._ScrubBarThumbSkin_LinearGradient1_c();
        _loc1_.initialized(this, "_ScrubBarThumbSkin_Path2");
        this._ScrubBarThumbSkin_Path2 = _loc1_;
        BindingManager.executeBindings(this, "_ScrubBarThumbSkin_Path2", this._ScrubBarThumbSkin_Path2);
        return _loc1_;
    }

    private function _ScrubBarThumbSkin_LinearGradient1_c(): LinearGradient {
        var _loc1_: LinearGradient = new LinearGradient();
        _loc1_.rotation = 90;
        _loc1_.entries = [this._ScrubBarThumbSkin_GradientEntry1_c(), this._ScrubBarThumbSkin_GradientEntry2_c()];
        return _loc1_;
    }

    private function _ScrubBarThumbSkin_GradientEntry1_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 16777215;
        return _loc1_;
    }

    private function _ScrubBarThumbSkin_GradientEntry2_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 14803425;
        return _loc1_;
    }

    private function _ScrubBarThumbSkin_Path3_c(): Path {
        var _loc1_: Path = new Path();
        _loc1_.winding = "evenOdd";
        _loc1_.data = "M 5 4 L 5 9 L 10 9 L 10 4 L 9 4 L 9 3 L 8 3 L 8 2 L 8 1 L 8 2 L 7 2 L 7 3 L 6 3 L 6 4 L 5 4 Z";
        _loc1_.fill = this._ScrubBarThumbSkin_SolidColor3_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _ScrubBarThumbSkin_SolidColor3_c(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 16777215;
        _loc1_.alpha = 0.22;
        return _loc1_;
    }

    private function _ScrubBarThumbSkin_Rect2_c(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.width = 13;
        _loc1_.height = 19;
        _loc1_.fill = this._ScrubBarThumbSkin_SolidColor4_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _ScrubBarThumbSkin_SolidColor4_c(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 0;
        _loc1_.alpha = 0;
        return _loc1_;
    }

    private function _ScrubBarThumbSkin_LinearGradient2_c(): LinearGradient {
        var _loc1_: LinearGradient = new LinearGradient();
        _loc1_.rotation = 90;
        _loc1_.entries = [this._ScrubBarThumbSkin_GradientEntry3_c(), this._ScrubBarThumbSkin_GradientEntry4_c()];
        return _loc1_;
    }

    private function _ScrubBarThumbSkin_GradientEntry3_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 6776679;
        return _loc1_;
    }

    private function _ScrubBarThumbSkin_GradientEntry4_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 3552822;
        return _loc1_;
    }

    private function _ScrubBarThumbSkin_LinearGradient3_c(): LinearGradient {
        var _loc1_: LinearGradient = new LinearGradient();
        _loc1_.rotation = 90;
        _loc1_.entries = [this._ScrubBarThumbSkin_GradientEntry5_c(), this._ScrubBarThumbSkin_GradientEntry6_c()];
        return _loc1_;
    }

    private function _ScrubBarThumbSkin_GradientEntry5_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 10132122;
        return _loc1_;
    }

    private function _ScrubBarThumbSkin_GradientEntry6_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 11184810;
        return _loc1_;
    }

    [Bindable(event="propertyChange")]
    public function get _ScrubBarThumbSkin_Path2(): Path {
        return this._757787230_ScrubBarThumbSkin_Path2;
    }

    public function set _ScrubBarThumbSkin_Path2(param1: Path): void {
        var _loc2_: Object = this._757787230_ScrubBarThumbSkin_Path2;
        if (_loc2_ !== param1) {
            this._757787230_ScrubBarThumbSkin_Path2 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_ScrubBarThumbSkin_Path2", _loc2_, param1));
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
