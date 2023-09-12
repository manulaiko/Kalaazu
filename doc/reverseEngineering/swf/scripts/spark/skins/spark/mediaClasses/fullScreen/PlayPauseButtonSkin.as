package spark.skins.spark.mediaClasses.fullScreen {

import mx.binding.BindingManager;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IFlexModuleFactory;
import mx.core.IStateClient2;
import mx.events.PropertyChangeEvent;
import mx.graphics.GradientEntry;
import mx.graphics.LinearGradient;
import mx.graphics.LinearGradientStroke;
import mx.graphics.SolidColor;
import mx.graphics.SolidColorStroke;
import mx.states.AddItems;
import mx.states.SetProperty;
import mx.states.State;

import spark.components.Group;
import spark.components.ToggleButton;
import spark.components.supportClasses.Skin;
import spark.primitives.Line;
import spark.primitives.Path;
import spark.primitives.Rect;

public class PlayPauseButtonSkin extends Skin implements IStateClient2 {


    private var _110636132_PlayPauseButtonSkin_GradientEntry1: GradientEntry;

    private var _110636131_PlayPauseButtonSkin_GradientEntry2: GradientEntry;

    public var _PlayPauseButtonSkin_Rect3: Rect;

    private var _1801210066pauseSymbol: Group;

    private var _1587721708playSymbol: Group;

    private var __moduleFactoryInitialized: Boolean = false;

    private var _213507019hostComponent: ToggleButton;

    public function PlayPauseButtonSkin() {
        super();
        mx_internal::_document = this;
        this.mxmlContent = [this._PlayPauseButtonSkin_Rect1_c(), this._PlayPauseButtonSkin_Rect2_c(), this._PlayPauseButtonSkin_Rect3_i()];
        this.currentState = "up";
        var _loc1_: DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._PlayPauseButtonSkin_Group1_i);
        var _loc2_: DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._PlayPauseButtonSkin_Group2_i);
        states = [new State({
            "name": "up",
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _loc1_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_PlayPauseButtonSkin_Rect3"]
            })]
        }), new State({
            "name": "over",
            "stateGroups": ["overStates"],
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _loc1_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_PlayPauseButtonSkin_Rect3"]
            }), new SetProperty().initializeFromObject({
                "target": "_PlayPauseButtonSkin_GradientEntry1",
                "name": "color",
                "value": 6776679
            }), new SetProperty().initializeFromObject({
                "target": "_PlayPauseButtonSkin_GradientEntry2",
                "name": "color",
                "value": 3552822
            })]
        }), new State({
            "name": "down",
            "stateGroups": ["downStates"],
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _loc1_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_PlayPauseButtonSkin_Rect3"]
            }), new SetProperty().initializeFromObject({
                "target": "_PlayPauseButtonSkin_GradientEntry1",
                "name": "color",
                "value": 2894892
            }), new SetProperty().initializeFromObject({
                "target": "_PlayPauseButtonSkin_GradientEntry2",
                "name": "color",
                "value": 5789784
            })]
        }), new State({
            "name": "disabled",
            "stateGroups": ["disabledStates"],
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _loc1_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_PlayPauseButtonSkin_Rect3"]
            }), new SetProperty().initializeFromObject({
                "name": "alpha",
                "value": 0.5
            })]
        }), new State({
            "name": "upAndSelected",
            "stateGroups": ["selectedUpStates", "selectedStates"],
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _loc2_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_PlayPauseButtonSkin_Rect3"]
            })]
        }), new State({
            "name": "overAndSelected",
            "stateGroups": ["overStates", "selectedStates"],
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _loc2_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_PlayPauseButtonSkin_Rect3"]
            }), new SetProperty().initializeFromObject({
                "target": "_PlayPauseButtonSkin_GradientEntry1",
                "name": "color",
                "value": 6776679
            }), new SetProperty().initializeFromObject({
                "target": "_PlayPauseButtonSkin_GradientEntry2",
                "name": "color",
                "value": 3552822
            })]
        }), new State({
            "name": "downAndSelected",
            "stateGroups": ["downStates", "selectedStates"],
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _loc2_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_PlayPauseButtonSkin_Rect3"]
            }), new SetProperty().initializeFromObject({
                "target": "_PlayPauseButtonSkin_GradientEntry1",
                "name": "color",
                "value": 2894892
            }), new SetProperty().initializeFromObject({
                "target": "_PlayPauseButtonSkin_GradientEntry2",
                "name": "color",
                "value": 5789784
            })]
        }), new State({
            "name": "disabledAndSelected",
            "stateGroups": ["disabledStates", "selectedUpStates", "selectedStates"],
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _loc2_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_PlayPauseButtonSkin_Rect3"]
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

    private function _PlayPauseButtonSkin_Rect1_c(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 1;
        _loc1_.right = 1;
        _loc1_.top = 1;
        _loc1_.bottom = 1;
        _loc1_.fill = this._PlayPauseButtonSkin_LinearGradient1_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_LinearGradient1_c(): LinearGradient {
        var _loc1_: LinearGradient = new LinearGradient();
        _loc1_.rotation = 90;
        _loc1_.entries = [this._PlayPauseButtonSkin_GradientEntry1_i(), this._PlayPauseButtonSkin_GradientEntry2_i()];
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_GradientEntry1_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 5789784;
        _loc1_.alpha = 0.55;
        this._PlayPauseButtonSkin_GradientEntry1 = _loc1_;
        BindingManager.executeBindings(this, "_PlayPauseButtonSkin_GradientEntry1", this._PlayPauseButtonSkin_GradientEntry1);
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_GradientEntry2_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 1973790;
        _loc1_.alpha = 0.55;
        this._PlayPauseButtonSkin_GradientEntry2 = _loc1_;
        BindingManager.executeBindings(this, "_PlayPauseButtonSkin_GradientEntry2", this._PlayPauseButtonSkin_GradientEntry2);
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_Rect2_c(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 1;
        _loc1_.right = 1;
        _loc1_.top = 1;
        _loc1_.bottom = 1;
        _loc1_.stroke = this._PlayPauseButtonSkin_LinearGradientStroke1_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_LinearGradientStroke1_c(): LinearGradientStroke {
        var _loc1_: LinearGradientStroke = new LinearGradientStroke();
        _loc1_.weight = 1;
        _loc1_.rotation = 90;
        _loc1_.entries = [this._PlayPauseButtonSkin_GradientEntry3_c(), this._PlayPauseButtonSkin_GradientEntry4_c()];
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_GradientEntry3_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 16777215;
        _loc1_.alpha = 0.12;
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_GradientEntry4_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 16777215;
        _loc1_.alpha = 0.09;
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_Rect3_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.top = 0;
        _loc1_.bottom = 0;
        _loc1_.width = 38;
        _loc1_.height = 24;
        _loc1_.stroke = this._PlayPauseButtonSkin_SolidColorStroke1_c();
        _loc1_.initialized(this, "_PlayPauseButtonSkin_Rect3");
        this._PlayPauseButtonSkin_Rect3 = _loc1_;
        BindingManager.executeBindings(this, "_PlayPauseButtonSkin_Rect3", this._PlayPauseButtonSkin_Rect3);
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_SolidColorStroke1_c(): SolidColorStroke {
        var _loc1_: SolidColorStroke = new SolidColorStroke();
        _loc1_.color = 2236962;
        _loc1_.alpha = 0.66;
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_Group1_i(): Group {
        var _loc1_: Group = new Group();
        _loc1_.horizontalCenter = 0;
        _loc1_.verticalCenter = 0;
        _loc1_.mxmlContent = [this._PlayPauseButtonSkin_Path1_c(), this._PlayPauseButtonSkin_Line1_c(), this._PlayPauseButtonSkin_Line2_c()];
        _loc1_.id = "playSymbol";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.playSymbol = _loc1_;
        BindingManager.executeBindings(this, "playSymbol", this.playSymbol);
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_Path1_c(): Path {
        var _loc1_: Path = new Path();
        _loc1_.winding = "evenOdd";
        _loc1_.data = "M 1 0 L 1 13 L 8 7 L 1 0 Z";
        _loc1_.fill = this._PlayPauseButtonSkin_SolidColor1_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_SolidColor1_c(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 16777215;
        _loc1_.alpha = 0.75;
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_Line1_c(): Line {
        var _loc1_: Line = new Line();
        _loc1_.xFrom = 1;
        _loc1_.xTo = 7;
        _loc1_.yFrom = 13;
        _loc1_.yTo = 7;
        _loc1_.stroke = this._PlayPauseButtonSkin_SolidColorStroke2_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_SolidColorStroke2_c(): SolidColorStroke {
        var _loc1_: SolidColorStroke = new SolidColorStroke();
        _loc1_.color = 0;
        _loc1_.alpha = 0.33;
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_Line2_c(): Line {
        var _loc1_: Line = new Line();
        _loc1_.x = 0;
        _loc1_.yFrom = 0;
        _loc1_.yTo = 13;
        _loc1_.stroke = this._PlayPauseButtonSkin_SolidColorStroke3_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_SolidColorStroke3_c(): SolidColorStroke {
        var _loc1_: SolidColorStroke = new SolidColorStroke();
        _loc1_.color = 0;
        _loc1_.alpha = 0.33;
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_Group2_i(): Group {
        var _loc1_: Group = new Group();
        _loc1_.horizontalCenter = 0;
        _loc1_.verticalCenter = 0;
        _loc1_.mxmlContent = [this._PlayPauseButtonSkin_Rect4_c(), this._PlayPauseButtonSkin_Rect5_c(), this._PlayPauseButtonSkin_Line3_c(), this._PlayPauseButtonSkin_Line4_c()];
        _loc1_.id = "pauseSymbol";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.pauseSymbol = _loc1_;
        BindingManager.executeBindings(this, "pauseSymbol", this.pauseSymbol);
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_Rect4_c(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 0;
        _loc1_.top = 0;
        _loc1_.height = 10;
        _loc1_.width = 3;
        _loc1_.fill = this._PlayPauseButtonSkin_SolidColor2_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_SolidColor2_c(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 16777215;
        _loc1_.alpha = 0.75;
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_Rect5_c(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 4;
        _loc1_.top = 0;
        _loc1_.height = 10;
        _loc1_.width = 3;
        _loc1_.fill = this._PlayPauseButtonSkin_SolidColor3_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_SolidColor3_c(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 16777215;
        _loc1_.alpha = 0.75;
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_Line3_c(): Line {
        var _loc1_: Line = new Line();
        _loc1_.xFrom = 0;
        _loc1_.xTo = 3;
        _loc1_.y = 11;
        _loc1_.stroke = this._PlayPauseButtonSkin_SolidColorStroke4_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_SolidColorStroke4_c(): SolidColorStroke {
        var _loc1_: SolidColorStroke = new SolidColorStroke();
        _loc1_.color = 4210752;
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_Line4_c(): Line {
        var _loc1_: Line = new Line();
        _loc1_.xFrom = 4;
        _loc1_.xTo = 7;
        _loc1_.y = 11;
        _loc1_.stroke = this._PlayPauseButtonSkin_SolidColorStroke5_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_SolidColorStroke5_c(): SolidColorStroke {
        var _loc1_: SolidColorStroke = new SolidColorStroke();
        _loc1_.color = 4210752;
        return _loc1_;
    }

    [Bindable(event="propertyChange")]
    public function get _PlayPauseButtonSkin_GradientEntry1(): GradientEntry {
        return this._110636132_PlayPauseButtonSkin_GradientEntry1;
    }

    public function set _PlayPauseButtonSkin_GradientEntry1(param1: GradientEntry): void {
        var _loc2_: Object = this._110636132_PlayPauseButtonSkin_GradientEntry1;
        if (_loc2_ !== param1) {
            this._110636132_PlayPauseButtonSkin_GradientEntry1 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_PlayPauseButtonSkin_GradientEntry1", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get _PlayPauseButtonSkin_GradientEntry2(): GradientEntry {
        return this._110636131_PlayPauseButtonSkin_GradientEntry2;
    }

    public function set _PlayPauseButtonSkin_GradientEntry2(param1: GradientEntry): void {
        var _loc2_: Object = this._110636131_PlayPauseButtonSkin_GradientEntry2;
        if (_loc2_ !== param1) {
            this._110636131_PlayPauseButtonSkin_GradientEntry2 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_PlayPauseButtonSkin_GradientEntry2", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get pauseSymbol(): Group {
        return this._1801210066pauseSymbol;
    }

    public function set pauseSymbol(param1: Group): void {
        var _loc2_: Object = this._1801210066pauseSymbol;
        if (_loc2_ !== param1) {
            this._1801210066pauseSymbol = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pauseSymbol", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get playSymbol(): Group {
        return this._1587721708playSymbol;
    }

    public function set playSymbol(param1: Group): void {
        var _loc2_: Object = this._1587721708playSymbol;
        if (_loc2_ !== param1) {
            this._1587721708playSymbol = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "playSymbol", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get hostComponent(): ToggleButton {
        return this._213507019hostComponent;
    }

    public function set hostComponent(param1: ToggleButton): void {
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
