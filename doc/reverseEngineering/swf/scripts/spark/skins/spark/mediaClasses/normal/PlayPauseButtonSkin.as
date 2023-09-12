package spark.skins.spark.mediaClasses.normal {

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
import spark.primitives.Line;
import spark.primitives.Path;
import spark.primitives.Rect;
import spark.skins.SparkSkin;

public class PlayPauseButtonSkin extends SparkSkin implements IStateClient2 {

    private static const exclusions: Array = ["playSymbol", "pauseSymbol"];

    private static const symbols: Array = ["playSymbolFill", "pauseSymbolFill1_1", "pauseSymbolFill1_2", "pauseSymbolFill1_3", "pauseSymbolFill1_4", "pauseSymbolFill1_5", "pauseSymbolFill2_1", "pauseSymbolFill2_2", "pauseSymbolFill2_3", "pauseSymbolFill2_4", "pauseSymbolFill2_5"];


    private var _110636132_PlayPauseButtonSkin_GradientEntry1: GradientEntry;

    private var _110636131_PlayPauseButtonSkin_GradientEntry2: GradientEntry;

    private var _110636130_PlayPauseButtonSkin_GradientEntry3: GradientEntry;

    private var _110636129_PlayPauseButtonSkin_GradientEntry4: GradientEntry;

    public var _PlayPauseButtonSkin_Rect1: Rect;

    public var _PlayPauseButtonSkin_Rect2: Rect;

    public var _PlayPauseButtonSkin_Rect3: Rect;

    public var _PlayPauseButtonSkin_Rect4: Rect;

    public var _PlayPauseButtonSkin_Rect5: Rect;

    public var _PlayPauseButtonSkin_Rect6: Rect;

    public var _PlayPauseButtonSkin_Rect7: Rect;

    public var _PlayPauseButtonSkin_Rect8: Rect;

    private var _88293236_PlayPauseButtonSkin_SolidColor1: SolidColor;

    private var _1801210066pauseSymbol: Group;

    private var _1338723378pauseSymbolFill1_1: GradientEntry;

    private var _1338723379pauseSymbolFill1_2: GradientEntry;

    private var _1338723380pauseSymbolFill1_3: GradientEntry;

    private var _1338723381pauseSymbolFill1_4: GradientEntry;

    private var _1338723382pauseSymbolFill1_5: GradientEntry;

    private var _1338724339pauseSymbolFill2_1: GradientEntry;

    private var _1338724340pauseSymbolFill2_2: GradientEntry;

    private var _1338724341pauseSymbolFill2_3: GradientEntry;

    private var _1338724342pauseSymbolFill2_4: GradientEntry;

    private var _1338724343pauseSymbolFill2_5: GradientEntry;

    private var _1587721708playSymbol: Group;

    private var _1096763791playSymbolFill: SolidColor;

    private var __moduleFactoryInitialized: Boolean = false;

    private var _213507019hostComponent: ToggleButton;

    public function PlayPauseButtonSkin() {
        super();
        mx_internal::_document = this;
        this.mxmlContent = [this._PlayPauseButtonSkin_Rect1_i(), this._PlayPauseButtonSkin_Rect8_i()];
        this.currentState = "up";
        var _loc1_: DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._PlayPauseButtonSkin_Group1_i);
        var _loc2_: DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._PlayPauseButtonSkin_Group2_i);
        var _loc3_: DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._PlayPauseButtonSkin_Rect2_i);
        var _loc4_: DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._PlayPauseButtonSkin_Rect3_i);
        var _loc5_: DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._PlayPauseButtonSkin_Rect4_i);
        var _loc6_: DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._PlayPauseButtonSkin_Rect5_i);
        var _loc7_: DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._PlayPauseButtonSkin_Rect6_i);
        var _loc8_: DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._PlayPauseButtonSkin_Rect7_i);
        states = [new State({
            "name": "up",
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _loc1_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_PlayPauseButtonSkin_Rect8"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _loc4_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_PlayPauseButtonSkin_Rect1"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _loc3_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_PlayPauseButtonSkin_Rect1"]
            })]
        }), new State({
            "name": "over",
            "stateGroups": ["overStates"],
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _loc1_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_PlayPauseButtonSkin_Rect8"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _loc4_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_PlayPauseButtonSkin_Rect1"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _loc3_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_PlayPauseButtonSkin_Rect1"]
            }), new SetProperty().initializeFromObject({
                "target": "_PlayPauseButtonSkin_GradientEntry1",
                "name": "color",
                "value": 13290186
            }), new SetProperty().initializeFromObject({
                "target": "_PlayPauseButtonSkin_GradientEntry2",
                "name": "color",
                "value": 9276813
            }), new SetProperty().initializeFromObject({
                "target": "_PlayPauseButtonSkin_GradientEntry3",
                "name": "alpha",
                "value": 0.22
            }), new SetProperty().initializeFromObject({
                "target": "_PlayPauseButtonSkin_GradientEntry4",
                "name": "alpha",
                "value": 0.22
            }), new SetProperty().initializeFromObject({
                "target": "_PlayPauseButtonSkin_SolidColor1",
                "name": "alpha",
                "value": 0.12
            })]
        }), new State({
            "name": "down",
            "stateGroups": ["downStates"],
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _loc1_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_PlayPauseButtonSkin_Rect8"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _loc8_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_PlayPauseButtonSkin_Rect1"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _loc7_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_PlayPauseButtonSkin_Rect1"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _loc6_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_PlayPauseButtonSkin_Rect1"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _loc5_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_PlayPauseButtonSkin_Rect1"]
            }), new SetProperty().initializeFromObject({
                "target": "_PlayPauseButtonSkin_GradientEntry1",
                "name": "color",
                "value": 11053224
            }), new SetProperty().initializeFromObject({
                "target": "_PlayPauseButtonSkin_GradientEntry2",
                "name": "color",
                "value": 7039851
            })]
        }), new State({
            "name": "disabled",
            "stateGroups": ["disabledStates"],
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _loc1_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_PlayPauseButtonSkin_Rect8"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _loc4_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_PlayPauseButtonSkin_Rect1"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _loc3_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_PlayPauseButtonSkin_Rect1"]
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
                "relativeTo": ["_PlayPauseButtonSkin_Rect8"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _loc4_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_PlayPauseButtonSkin_Rect1"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _loc3_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_PlayPauseButtonSkin_Rect1"]
            })]
        }), new State({
            "name": "overAndSelected",
            "stateGroups": ["overStates", "selectedStates"],
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _loc2_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_PlayPauseButtonSkin_Rect8"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _loc4_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_PlayPauseButtonSkin_Rect1"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _loc3_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_PlayPauseButtonSkin_Rect1"]
            }), new SetProperty().initializeFromObject({
                "target": "_PlayPauseButtonSkin_GradientEntry1",
                "name": "color",
                "value": 13290186
            }), new SetProperty().initializeFromObject({
                "target": "_PlayPauseButtonSkin_GradientEntry2",
                "name": "color",
                "value": 9276813
            }), new SetProperty().initializeFromObject({
                "target": "_PlayPauseButtonSkin_GradientEntry3",
                "name": "alpha",
                "value": 0.22
            }), new SetProperty().initializeFromObject({
                "target": "_PlayPauseButtonSkin_GradientEntry4",
                "name": "alpha",
                "value": 0.22
            }), new SetProperty().initializeFromObject({
                "target": "_PlayPauseButtonSkin_SolidColor1",
                "name": "alpha",
                "value": 0.12
            })]
        }), new State({
            "name": "downAndSelected",
            "stateGroups": ["downStates", "selectedStates"],
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _loc2_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_PlayPauseButtonSkin_Rect8"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _loc8_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_PlayPauseButtonSkin_Rect1"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _loc7_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_PlayPauseButtonSkin_Rect1"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _loc6_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_PlayPauseButtonSkin_Rect1"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _loc5_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_PlayPauseButtonSkin_Rect1"]
            }), new SetProperty().initializeFromObject({
                "target": "_PlayPauseButtonSkin_GradientEntry1",
                "name": "color",
                "value": 11053224
            }), new SetProperty().initializeFromObject({
                "target": "_PlayPauseButtonSkin_GradientEntry2",
                "name": "color",
                "value": 7039851
            })]
        }), new State({
            "name": "disabledAndSelected",
            "stateGroups": ["disabledStates", "selectedUpStates", "selectedStates"],
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _loc2_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_PlayPauseButtonSkin_Rect8"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _loc4_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_PlayPauseButtonSkin_Rect1"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _loc3_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_PlayPauseButtonSkin_Rect1"]
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
        return exclusions;
    }

    override public function get symbolItems(): Array {
        return symbols;
    }

    override protected function initializationComplete(): void {
        useChromeColor = true;
        super.initializationComplete();
    }

    private function _PlayPauseButtonSkin_Rect1_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 1;
        _loc1_.right = 1;
        _loc1_.top = 1;
        _loc1_.bottom = 1;
        _loc1_.fill = this._PlayPauseButtonSkin_LinearGradient1_c();
        _loc1_.initialized(this, "_PlayPauseButtonSkin_Rect1");
        this._PlayPauseButtonSkin_Rect1 = _loc1_;
        BindingManager.executeBindings(this, "_PlayPauseButtonSkin_Rect1", this._PlayPauseButtonSkin_Rect1);
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
        _loc1_.color = 16777215;
        this._PlayPauseButtonSkin_GradientEntry1 = _loc1_;
        BindingManager.executeBindings(this, "_PlayPauseButtonSkin_GradientEntry1", this._PlayPauseButtonSkin_GradientEntry1);
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_GradientEntry2_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 14474460;
        this._PlayPauseButtonSkin_GradientEntry2 = _loc1_;
        BindingManager.executeBindings(this, "_PlayPauseButtonSkin_GradientEntry2", this._PlayPauseButtonSkin_GradientEntry2);
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_Rect2_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 1;
        _loc1_.right = 1;
        _loc1_.top = 1;
        _loc1_.bottom = 1;
        _loc1_.stroke = this._PlayPauseButtonSkin_LinearGradientStroke1_c();
        _loc1_.initialized(this, "_PlayPauseButtonSkin_Rect2");
        this._PlayPauseButtonSkin_Rect2 = _loc1_;
        BindingManager.executeBindings(this, "_PlayPauseButtonSkin_Rect2", this._PlayPauseButtonSkin_Rect2);
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_LinearGradientStroke1_c(): LinearGradientStroke {
        var _loc1_: LinearGradientStroke = new LinearGradientStroke();
        _loc1_.weight = 1;
        _loc1_.rotation = 90;
        _loc1_.entries = [this._PlayPauseButtonSkin_GradientEntry3_i(), this._PlayPauseButtonSkin_GradientEntry4_i()];
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_GradientEntry3_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 16711422;
        this._PlayPauseButtonSkin_GradientEntry3 = _loc1_;
        BindingManager.executeBindings(this, "_PlayPauseButtonSkin_GradientEntry3", this._PlayPauseButtonSkin_GradientEntry3);
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_GradientEntry4_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 15395562;
        this._PlayPauseButtonSkin_GradientEntry4 = _loc1_;
        BindingManager.executeBindings(this, "_PlayPauseButtonSkin_GradientEntry4", this._PlayPauseButtonSkin_GradientEntry4);
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_Rect3_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 1;
        _loc1_.right = 1;
        _loc1_.top = 1;
        _loc1_.height = 11;
        _loc1_.fill = this._PlayPauseButtonSkin_SolidColor1_i();
        _loc1_.initialized(this, "_PlayPauseButtonSkin_Rect3");
        this._PlayPauseButtonSkin_Rect3 = _loc1_;
        BindingManager.executeBindings(this, "_PlayPauseButtonSkin_Rect3", this._PlayPauseButtonSkin_Rect3);
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_SolidColor1_i(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 16777215;
        _loc1_.alpha = 0.3;
        this._PlayPauseButtonSkin_SolidColor1 = _loc1_;
        BindingManager.executeBindings(this, "_PlayPauseButtonSkin_SolidColor1", this._PlayPauseButtonSkin_SolidColor1);
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_Rect4_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 1;
        _loc1_.top = 1;
        _loc1_.right = 1;
        _loc1_.height = 1;
        _loc1_.fill = this._PlayPauseButtonSkin_SolidColor2_c();
        _loc1_.initialized(this, "_PlayPauseButtonSkin_Rect4");
        this._PlayPauseButtonSkin_Rect4 = _loc1_;
        BindingManager.executeBindings(this, "_PlayPauseButtonSkin_Rect4", this._PlayPauseButtonSkin_Rect4);
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_SolidColor2_c(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 0;
        _loc1_.alpha = 0.4;
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_Rect5_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 1;
        _loc1_.top = 2;
        _loc1_.right = 1;
        _loc1_.height = 1;
        _loc1_.fill = this._PlayPauseButtonSkin_SolidColor3_c();
        _loc1_.initialized(this, "_PlayPauseButtonSkin_Rect5");
        this._PlayPauseButtonSkin_Rect5 = _loc1_;
        BindingManager.executeBindings(this, "_PlayPauseButtonSkin_Rect5", this._PlayPauseButtonSkin_Rect5);
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_SolidColor3_c(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 0;
        _loc1_.alpha = 0.12;
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_Rect6_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 1;
        _loc1_.top = 1;
        _loc1_.bottom = 1;
        _loc1_.width = 1;
        _loc1_.fill = this._PlayPauseButtonSkin_SolidColor4_c();
        _loc1_.initialized(this, "_PlayPauseButtonSkin_Rect6");
        this._PlayPauseButtonSkin_Rect6 = _loc1_;
        BindingManager.executeBindings(this, "_PlayPauseButtonSkin_Rect6", this._PlayPauseButtonSkin_Rect6);
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_SolidColor4_c(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 0;
        _loc1_.alpha = 0.12;
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_Rect7_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.right = 1;
        _loc1_.top = 1;
        _loc1_.bottom = 1;
        _loc1_.width = 1;
        _loc1_.fill = this._PlayPauseButtonSkin_SolidColor5_c();
        _loc1_.initialized(this, "_PlayPauseButtonSkin_Rect7");
        this._PlayPauseButtonSkin_Rect7 = _loc1_;
        BindingManager.executeBindings(this, "_PlayPauseButtonSkin_Rect7", this._PlayPauseButtonSkin_Rect7);
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_SolidColor5_c(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 0;
        _loc1_.alpha = 0.12;
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_Rect8_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.top = 0;
        _loc1_.bottom = 0;
        _loc1_.width = 38;
        _loc1_.height = 24;
        _loc1_.stroke = this._PlayPauseButtonSkin_SolidColorStroke1_c();
        _loc1_.initialized(this, "_PlayPauseButtonSkin_Rect8");
        this._PlayPauseButtonSkin_Rect8 = _loc1_;
        BindingManager.executeBindings(this, "_PlayPauseButtonSkin_Rect8", this._PlayPauseButtonSkin_Rect8);
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_SolidColorStroke1_c(): SolidColorStroke {
        var _loc1_: SolidColorStroke = new SolidColorStroke();
        _loc1_.color = 1250067;
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
        _loc1_.fill = this._PlayPauseButtonSkin_SolidColor6_i();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_SolidColor6_i(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 5592405;
        _loc1_.alpha = 0.75;
        this.playSymbolFill = _loc1_;
        BindingManager.executeBindings(this, "playSymbolFill", this.playSymbolFill);
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_Line1_c(): Line {
        var _loc1_: Line = new Line();
        _loc1_.xFrom = 1;
        _loc1_.xTo = 7;
        _loc1_.yFrom = 0;
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
        _loc1_.alpha = 0.5;
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_Group2_i(): Group {
        var _loc1_: Group = new Group();
        _loc1_.horizontalCenter = 0;
        _loc1_.verticalCenter = 0;
        _loc1_.mxmlContent = [this._PlayPauseButtonSkin_Rect9_c(), this._PlayPauseButtonSkin_Rect10_c()];
        _loc1_.id = "pauseSymbol";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.pauseSymbol = _loc1_;
        BindingManager.executeBindings(this, "pauseSymbol", this.pauseSymbol);
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_Rect9_c(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 0;
        _loc1_.top = 0;
        _loc1_.height = 11;
        _loc1_.width = 3;
        _loc1_.fill = this._PlayPauseButtonSkin_LinearGradient2_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_LinearGradient2_c(): LinearGradient {
        var _loc1_: LinearGradient = new LinearGradient();
        _loc1_.rotation = 90;
        _loc1_.entries = [this._PlayPauseButtonSkin_GradientEntry5_i(), this._PlayPauseButtonSkin_GradientEntry6_i(), this._PlayPauseButtonSkin_GradientEntry7_i(), this._PlayPauseButtonSkin_GradientEntry8_i(), this._PlayPauseButtonSkin_GradientEntry9_i()];
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_GradientEntry5_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 2434341;
        _loc1_.alpha = 0.75;
        _loc1_.ratio = 0.1;
        this.pauseSymbolFill1_1 = _loc1_;
        BindingManager.executeBindings(this, "pauseSymbolFill1_1", this.pauseSymbolFill1_1);
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_GradientEntry6_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 4210752;
        _loc1_.alpha = 0.75;
        _loc1_.ratio = 0.2;
        this.pauseSymbolFill1_2 = _loc1_;
        BindingManager.executeBindings(this, "pauseSymbolFill1_2", this.pauseSymbolFill1_2);
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_GradientEntry7_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 4934475;
        _loc1_.alpha = 0.75;
        _loc1_.ratio = 0.55;
        this.pauseSymbolFill1_3 = _loc1_;
        BindingManager.executeBindings(this, "pauseSymbolFill1_3", this.pauseSymbolFill1_3);
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_GradientEntry8_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 4342338;
        _loc1_.alpha = 0.75;
        _loc1_.ratio = 0.9;
        this.pauseSymbolFill1_4 = _loc1_;
        BindingManager.executeBindings(this, "pauseSymbolFill1_4", this.pauseSymbolFill1_4);
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_GradientEntry9_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 12895428;
        _loc1_.alpha = 0.75;
        _loc1_.ratio = 1;
        this.pauseSymbolFill1_5 = _loc1_;
        BindingManager.executeBindings(this, "pauseSymbolFill1_5", this.pauseSymbolFill1_5);
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_Rect10_c(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 4;
        _loc1_.top = 0;
        _loc1_.height = 11;
        _loc1_.width = 3;
        _loc1_.fill = this._PlayPauseButtonSkin_LinearGradient3_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_LinearGradient3_c(): LinearGradient {
        var _loc1_: LinearGradient = new LinearGradient();
        _loc1_.rotation = 90;
        _loc1_.entries = [this._PlayPauseButtonSkin_GradientEntry10_i(), this._PlayPauseButtonSkin_GradientEntry11_i(), this._PlayPauseButtonSkin_GradientEntry12_i(), this._PlayPauseButtonSkin_GradientEntry13_i(), this._PlayPauseButtonSkin_GradientEntry14_i()];
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_GradientEntry10_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 2434341;
        _loc1_.alpha = 0.75;
        _loc1_.ratio = 0.1;
        this.pauseSymbolFill2_1 = _loc1_;
        BindingManager.executeBindings(this, "pauseSymbolFill2_1", this.pauseSymbolFill2_1);
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_GradientEntry11_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 4210752;
        _loc1_.alpha = 0.75;
        _loc1_.ratio = 0.2;
        this.pauseSymbolFill2_2 = _loc1_;
        BindingManager.executeBindings(this, "pauseSymbolFill2_2", this.pauseSymbolFill2_2);
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_GradientEntry12_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 4934475;
        _loc1_.alpha = 0.75;
        _loc1_.ratio = 0.55;
        this.pauseSymbolFill2_3 = _loc1_;
        BindingManager.executeBindings(this, "pauseSymbolFill2_3", this.pauseSymbolFill2_3);
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_GradientEntry13_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 4342338;
        _loc1_.alpha = 0.75;
        _loc1_.ratio = 0.9;
        this.pauseSymbolFill2_4 = _loc1_;
        BindingManager.executeBindings(this, "pauseSymbolFill2_4", this.pauseSymbolFill2_4);
        return _loc1_;
    }

    private function _PlayPauseButtonSkin_GradientEntry14_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 12895428;
        _loc1_.alpha = 0.75;
        _loc1_.ratio = 1;
        this.pauseSymbolFill2_5 = _loc1_;
        BindingManager.executeBindings(this, "pauseSymbolFill2_5", this.pauseSymbolFill2_5);
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
    public function get _PlayPauseButtonSkin_GradientEntry3(): GradientEntry {
        return this._110636130_PlayPauseButtonSkin_GradientEntry3;
    }

    public function set _PlayPauseButtonSkin_GradientEntry3(param1: GradientEntry): void {
        var _loc2_: Object = this._110636130_PlayPauseButtonSkin_GradientEntry3;
        if (_loc2_ !== param1) {
            this._110636130_PlayPauseButtonSkin_GradientEntry3 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_PlayPauseButtonSkin_GradientEntry3", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get _PlayPauseButtonSkin_GradientEntry4(): GradientEntry {
        return this._110636129_PlayPauseButtonSkin_GradientEntry4;
    }

    public function set _PlayPauseButtonSkin_GradientEntry4(param1: GradientEntry): void {
        var _loc2_: Object = this._110636129_PlayPauseButtonSkin_GradientEntry4;
        if (_loc2_ !== param1) {
            this._110636129_PlayPauseButtonSkin_GradientEntry4 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_PlayPauseButtonSkin_GradientEntry4", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get _PlayPauseButtonSkin_SolidColor1(): SolidColor {
        return this._88293236_PlayPauseButtonSkin_SolidColor1;
    }

    public function set _PlayPauseButtonSkin_SolidColor1(param1: SolidColor): void {
        var _loc2_: Object = this._88293236_PlayPauseButtonSkin_SolidColor1;
        if (_loc2_ !== param1) {
            this._88293236_PlayPauseButtonSkin_SolidColor1 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_PlayPauseButtonSkin_SolidColor1", _loc2_, param1));
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
    public function get pauseSymbolFill1_1(): GradientEntry {
        return this._1338723378pauseSymbolFill1_1;
    }

    public function set pauseSymbolFill1_1(param1: GradientEntry): void {
        var _loc2_: Object = this._1338723378pauseSymbolFill1_1;
        if (_loc2_ !== param1) {
            this._1338723378pauseSymbolFill1_1 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pauseSymbolFill1_1", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get pauseSymbolFill1_2(): GradientEntry {
        return this._1338723379pauseSymbolFill1_2;
    }

    public function set pauseSymbolFill1_2(param1: GradientEntry): void {
        var _loc2_: Object = this._1338723379pauseSymbolFill1_2;
        if (_loc2_ !== param1) {
            this._1338723379pauseSymbolFill1_2 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pauseSymbolFill1_2", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get pauseSymbolFill1_3(): GradientEntry {
        return this._1338723380pauseSymbolFill1_3;
    }

    public function set pauseSymbolFill1_3(param1: GradientEntry): void {
        var _loc2_: Object = this._1338723380pauseSymbolFill1_3;
        if (_loc2_ !== param1) {
            this._1338723380pauseSymbolFill1_3 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pauseSymbolFill1_3", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get pauseSymbolFill1_4(): GradientEntry {
        return this._1338723381pauseSymbolFill1_4;
    }

    public function set pauseSymbolFill1_4(param1: GradientEntry): void {
        var _loc2_: Object = this._1338723381pauseSymbolFill1_4;
        if (_loc2_ !== param1) {
            this._1338723381pauseSymbolFill1_4 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pauseSymbolFill1_4", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get pauseSymbolFill1_5(): GradientEntry {
        return this._1338723382pauseSymbolFill1_5;
    }

    public function set pauseSymbolFill1_5(param1: GradientEntry): void {
        var _loc2_: Object = this._1338723382pauseSymbolFill1_5;
        if (_loc2_ !== param1) {
            this._1338723382pauseSymbolFill1_5 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pauseSymbolFill1_5", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get pauseSymbolFill2_1(): GradientEntry {
        return this._1338724339pauseSymbolFill2_1;
    }

    public function set pauseSymbolFill2_1(param1: GradientEntry): void {
        var _loc2_: Object = this._1338724339pauseSymbolFill2_1;
        if (_loc2_ !== param1) {
            this._1338724339pauseSymbolFill2_1 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pauseSymbolFill2_1", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get pauseSymbolFill2_2(): GradientEntry {
        return this._1338724340pauseSymbolFill2_2;
    }

    public function set pauseSymbolFill2_2(param1: GradientEntry): void {
        var _loc2_: Object = this._1338724340pauseSymbolFill2_2;
        if (_loc2_ !== param1) {
            this._1338724340pauseSymbolFill2_2 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pauseSymbolFill2_2", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get pauseSymbolFill2_3(): GradientEntry {
        return this._1338724341pauseSymbolFill2_3;
    }

    public function set pauseSymbolFill2_3(param1: GradientEntry): void {
        var _loc2_: Object = this._1338724341pauseSymbolFill2_3;
        if (_loc2_ !== param1) {
            this._1338724341pauseSymbolFill2_3 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pauseSymbolFill2_3", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get pauseSymbolFill2_4(): GradientEntry {
        return this._1338724342pauseSymbolFill2_4;
    }

    public function set pauseSymbolFill2_4(param1: GradientEntry): void {
        var _loc2_: Object = this._1338724342pauseSymbolFill2_4;
        if (_loc2_ !== param1) {
            this._1338724342pauseSymbolFill2_4 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pauseSymbolFill2_4", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get pauseSymbolFill2_5(): GradientEntry {
        return this._1338724343pauseSymbolFill2_5;
    }

    public function set pauseSymbolFill2_5(param1: GradientEntry): void {
        var _loc2_: Object = this._1338724343pauseSymbolFill2_5;
        if (_loc2_ !== param1) {
            this._1338724343pauseSymbolFill2_5 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pauseSymbolFill2_5", _loc2_, param1));
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
    public function get playSymbolFill(): SolidColor {
        return this._1096763791playSymbolFill;
    }

    public function set playSymbolFill(param1: SolidColor): void {
        var _loc2_: Object = this._1096763791playSymbolFill;
        if (_loc2_ !== param1) {
            this._1096763791playSymbolFill = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "playSymbolFill", _loc2_, param1));
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
