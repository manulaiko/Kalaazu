package mx.skins.spark {

import mx.binding.BindingManager;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IFlexModuleFactory;
import mx.core.IStateClient2;
import mx.events.PropertyChangeEvent;
import mx.graphics.GradientEntry;
import mx.graphics.LinearGradient;
import mx.graphics.LinearGradientStroke;
import mx.states.AddItems;
import mx.states.SetProperty;
import mx.states.State;

import spark.primitives.Rect;

public class ButtonSkin extends SparkSkinForHalo implements IStateClient2 {

    private static const borderItem: Array = ["borderEntry1", "borderEntry2"];


    private var _1785931840_ButtonSkin_GradientEntry1: GradientEntry;

    private var _470687759_ButtonSkin_GradientEntry11: GradientEntry;

    private var _470687758_ButtonSkin_GradientEntry12: GradientEntry;

    private var _1785931841_ButtonSkin_GradientEntry2: GradientEntry;

    private var _1785931842_ButtonSkin_GradientEntry3: GradientEntry;

    private var _1785931843_ButtonSkin_GradientEntry4: GradientEntry;

    private var _1785931847_ButtonSkin_GradientEntry8: GradientEntry;

    private var _1785931848_ButtonSkin_GradientEntry9: GradientEntry;

    private var _1383304148border: Rect;

    private var _989500747borderEntry1: GradientEntry;

    private var _989500748borderEntry2: GradientEntry;

    private var _3143043fill: Rect;

    private var _681210700highlight: Rect;

    private var _1507289076highlightStroke: Rect;

    private var _1472494227hldownstroke1: Rect;

    private var _1472494228hldownstroke2: Rect;

    private var _1811511742lowlight: Rect;

    private var _903579360shadow: Rect;

    private var __moduleFactoryInitialized: Boolean = false;

    private var cornerRadius: Number = 2;

    public function ButtonSkin() {
        super();
        mx_internal::_document = this;
        this.minWidth = 21;
        this.minHeight = 19;
        this.mxmlContent = [this._ButtonSkin_Rect1_i(), this._ButtonSkin_Rect2_i(), this._ButtonSkin_Rect3_i(), this._ButtonSkin_Rect4_i(), this._ButtonSkin_Rect8_i()];
        this.currentState = "up";
        var _loc1_: DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ButtonSkin_Rect5_i);
        var _loc2_: DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ButtonSkin_Rect6_i);
        var _loc3_: DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ButtonSkin_Rect7_i);
        states = [new State({
            "name": "up",
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _loc1_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["highlight"]
            })]
        }), new State({
            "name": "over",
            "stateGroups": ["overStates"],
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _loc1_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["highlight"]
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry3",
                "name": "color",
                "value": 12303805
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry4",
                "name": "color",
                "value": 10461345
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry8",
                "name": "alpha",
                "value": 0.22
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry9",
                "name": "alpha",
                "value": 0.22
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry11",
                "name": "alpha",
                "value": 0.22
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry12",
                "name": "alpha",
                "value": 0.22
            })]
        }), new State({
            "name": "down",
            "stateGroups": ["downStates"],
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _loc3_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["highlight"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _loc2_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["highlight"]
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry1",
                "name": "color",
                "value": 16777215
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry1",
                "name": "alpha",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry2",
                "name": "color",
                "value": 16777215
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry2",
                "name": "alpha",
                "value": 0.5
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry3",
                "name": "color",
                "value": 11184810
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry4",
                "name": "color",
                "value": 9606294
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry8",
                "name": "alpha",
                "value": 0.12
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry9",
                "name": "alpha",
                "value": 0.12
            }), new SetProperty().initializeFromObject({
                "target": "borderEntry1",
                "name": "alpha",
                "value": 0.6375
            }), new SetProperty().initializeFromObject({
                "target": "borderEntry2",
                "name": "alpha",
                "value": 0.85
            })]
        }), new State({
            "name": "disabled",
            "stateGroups": ["disabledStates"],
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _loc1_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["highlight"]
            }), new SetProperty().initializeFromObject({
                "name": "alpha",
                "value": 0.5
            })]
        }), new State({
            "name": "selectedUp",
            "stateGroups": ["selectedUpStates", "selectedStates"],
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _loc3_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["highlight"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _loc2_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["highlight"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _loc1_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["highlight"]
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry3",
                "name": "color",
                "value": 12303805
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry4",
                "name": "color",
                "value": 10461345
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry8",
                "name": "alpha",
                "value": 0.22
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry9",
                "name": "alpha",
                "value": 0.22
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry11",
                "name": "alpha",
                "value": 0.33
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry12",
                "name": "alpha",
                "value": 0.33
            }), new SetProperty().initializeFromObject({
                "target": "borderEntry1",
                "name": "alpha",
                "value": 0.6375
            }), new SetProperty().initializeFromObject({
                "target": "borderEntry2",
                "name": "alpha",
                "value": 0.85
            })]
        }), new State({
            "name": "selectedOver",
            "stateGroups": ["overStates", "selectedStates"],
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _loc3_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["highlight"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _loc2_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["highlight"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _loc1_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["highlight"]
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry3",
                "name": "color",
                "value": 12303805
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry3",
                "name": "alpha",
                "value": 1
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry4",
                "name": "color",
                "value": 9342864
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry4",
                "name": "alpha",
                "value": 1
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry8",
                "name": "alpha",
                "value": 0.22
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry9",
                "name": "alpha",
                "value": 0.22
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry11",
                "name": "alpha",
                "value": 0.22
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry12",
                "name": "alpha",
                "value": 0.22
            }), new SetProperty().initializeFromObject({
                "target": "borderEntry1",
                "name": "alpha",
                "value": 0.6375
            }), new SetProperty().initializeFromObject({
                "target": "borderEntry2",
                "name": "alpha",
                "value": 0.85
            })]
        }), new State({
            "name": "selectedDown",
            "stateGroups": ["downStates", "selectedStates"],
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _loc3_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["highlight"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _loc2_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["highlight"]
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry1",
                "name": "color",
                "value": 16777215
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry1",
                "name": "alpha",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry2",
                "name": "color",
                "value": 16777215
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry2",
                "name": "alpha",
                "value": 0.5
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry3",
                "name": "color",
                "value": 11184810
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry4",
                "name": "color",
                "value": 9606294
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry8",
                "name": "alpha",
                "value": 0.12
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry9",
                "name": "alpha",
                "value": 0.12
            }), new SetProperty().initializeFromObject({
                "target": "borderEntry1",
                "name": "alpha",
                "value": 0.6375
            }), new SetProperty().initializeFromObject({
                "target": "borderEntry2",
                "name": "alpha",
                "value": 0.85
            })]
        }), new State({
            "name": "selectedDisabled",
            "stateGroups": ["disabledStates", "selectedUpStates", "selectedStates"],
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _loc3_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["highlight"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _loc2_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["highlight"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _loc1_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["highlight"]
            }), new SetProperty().initializeFromObject({
                "name": "alpha",
                "value": 0.5
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry3",
                "name": "color",
                "value": 12303805
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry4",
                "name": "color",
                "value": 10461345
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry8",
                "name": "alpha",
                "value": 0.22
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry9",
                "name": "alpha",
                "value": 0.22
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry11",
                "name": "alpha",
                "value": 0.33
            }), new SetProperty().initializeFromObject({
                "target": "_ButtonSkin_GradientEntry12",
                "name": "alpha",
                "value": 0.33
            }), new SetProperty().initializeFromObject({
                "target": "borderEntry1",
                "name": "alpha",
                "value": 0.6375
            }), new SetProperty().initializeFromObject({
                "target": "borderEntry2",
                "name": "alpha",
                "value": 0.85
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

    override protected function get borderItems(): Array {
        return borderItem;
    }

    override protected function initializationComplete(): void {
        useChromeColor = true;
        super.initializationComplete();
    }

    override protected function updateDisplayList(param1: Number, param2: Number): void {
        var _loc3_: Number = getStyle("cornerRadius");
        if (this.cornerRadius != _loc3_) {
            this.cornerRadius = _loc3_;
            this.shadow.radiusX = this.cornerRadius;
            this.fill.radiusX = this.cornerRadius;
            this.lowlight.radiusX = this.cornerRadius;
            this.highlight.radiusX = this.cornerRadius;
            this.border.radiusX = this.cornerRadius;
        }
        if (this.highlightStroke) {
            this.highlightStroke.radiusX = this.cornerRadius;
        }
        if (this.hldownstroke1) {
            this.hldownstroke1.radiusX = this.cornerRadius;
        }
        if (this.hldownstroke2) {
            this.hldownstroke2.radiusX = this.cornerRadius;
        }
        super.updateDisplayList(param1, param2);
    }

    private function _ButtonSkin_Rect1_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = -1;
        _loc1_.right = -1;
        _loc1_.top = -1;
        _loc1_.bottom = -1;
        _loc1_.radiusX = 2;
        _loc1_.fill = this._ButtonSkin_LinearGradient1_c();
        _loc1_.initialized(this, "shadow");
        this.shadow = _loc1_;
        BindingManager.executeBindings(this, "shadow", this.shadow);
        return _loc1_;
    }

    private function _ButtonSkin_LinearGradient1_c(): LinearGradient {
        var _loc1_: LinearGradient = new LinearGradient();
        _loc1_.rotation = 90;
        _loc1_.entries = [this._ButtonSkin_GradientEntry1_i(), this._ButtonSkin_GradientEntry2_i()];
        return _loc1_;
    }

    private function _ButtonSkin_GradientEntry1_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 0;
        _loc1_.alpha = 0.01;
        this._ButtonSkin_GradientEntry1 = _loc1_;
        BindingManager.executeBindings(this, "_ButtonSkin_GradientEntry1", this._ButtonSkin_GradientEntry1);
        return _loc1_;
    }

    private function _ButtonSkin_GradientEntry2_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 0;
        _loc1_.alpha = 0.07;
        this._ButtonSkin_GradientEntry2 = _loc1_;
        BindingManager.executeBindings(this, "_ButtonSkin_GradientEntry2", this._ButtonSkin_GradientEntry2);
        return _loc1_;
    }

    private function _ButtonSkin_Rect2_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 1;
        _loc1_.right = 1;
        _loc1_.top = 1;
        _loc1_.bottom = 1;
        _loc1_.radiusX = 2;
        _loc1_.fill = this._ButtonSkin_LinearGradient2_c();
        _loc1_.initialized(this, "fill");
        this.fill = _loc1_;
        BindingManager.executeBindings(this, "fill", this.fill);
        return _loc1_;
    }

    private function _ButtonSkin_LinearGradient2_c(): LinearGradient {
        var _loc1_: LinearGradient = new LinearGradient();
        _loc1_.rotation = 90;
        _loc1_.entries = [this._ButtonSkin_GradientEntry3_i(), this._ButtonSkin_GradientEntry4_i()];
        return _loc1_;
    }

    private function _ButtonSkin_GradientEntry3_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 16777215;
        _loc1_.alpha = 0.85;
        this._ButtonSkin_GradientEntry3 = _loc1_;
        BindingManager.executeBindings(this, "_ButtonSkin_GradientEntry3", this._ButtonSkin_GradientEntry3);
        return _loc1_;
    }

    private function _ButtonSkin_GradientEntry4_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 14211288;
        _loc1_.alpha = 0.85;
        this._ButtonSkin_GradientEntry4 = _loc1_;
        BindingManager.executeBindings(this, "_ButtonSkin_GradientEntry4", this._ButtonSkin_GradientEntry4);
        return _loc1_;
    }

    private function _ButtonSkin_Rect3_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 1;
        _loc1_.right = 1;
        _loc1_.top = 1;
        _loc1_.bottom = 1;
        _loc1_.radiusX = 2;
        _loc1_.fill = this._ButtonSkin_LinearGradient3_c();
        _loc1_.initialized(this, "lowlight");
        this.lowlight = _loc1_;
        BindingManager.executeBindings(this, "lowlight", this.lowlight);
        return _loc1_;
    }

    private function _ButtonSkin_LinearGradient3_c(): LinearGradient {
        var _loc1_: LinearGradient = new LinearGradient();
        _loc1_.rotation = 270;
        _loc1_.entries = [this._ButtonSkin_GradientEntry5_c(), this._ButtonSkin_GradientEntry6_c(), this._ButtonSkin_GradientEntry7_c()];
        return _loc1_;
    }

    private function _ButtonSkin_GradientEntry5_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 0;
        _loc1_.ratio = 0;
        _loc1_.alpha = 0.0627;
        return _loc1_;
    }

    private function _ButtonSkin_GradientEntry6_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 0;
        _loc1_.ratio = 0.48;
        _loc1_.alpha = 0.0099;
        return _loc1_;
    }

    private function _ButtonSkin_GradientEntry7_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 0;
        _loc1_.ratio = 0.48001;
        _loc1_.alpha = 0;
        return _loc1_;
    }

    private function _ButtonSkin_Rect4_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 1;
        _loc1_.right = 1;
        _loc1_.top = 1;
        _loc1_.bottom = 1;
        _loc1_.radiusX = 2;
        _loc1_.fill = this._ButtonSkin_LinearGradient4_c();
        _loc1_.initialized(this, "highlight");
        this.highlight = _loc1_;
        BindingManager.executeBindings(this, "highlight", this.highlight);
        return _loc1_;
    }

    private function _ButtonSkin_LinearGradient4_c(): LinearGradient {
        var _loc1_: LinearGradient = new LinearGradient();
        _loc1_.rotation = 90;
        _loc1_.entries = [this._ButtonSkin_GradientEntry8_i(), this._ButtonSkin_GradientEntry9_i(), this._ButtonSkin_GradientEntry10_c()];
        return _loc1_;
    }

    private function _ButtonSkin_GradientEntry8_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 16777215;
        _loc1_.ratio = 0;
        _loc1_.alpha = 0.33;
        this._ButtonSkin_GradientEntry8 = _loc1_;
        BindingManager.executeBindings(this, "_ButtonSkin_GradientEntry8", this._ButtonSkin_GradientEntry8);
        return _loc1_;
    }

    private function _ButtonSkin_GradientEntry9_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 16777215;
        _loc1_.ratio = 0.48;
        _loc1_.alpha = 0.33;
        this._ButtonSkin_GradientEntry9 = _loc1_;
        BindingManager.executeBindings(this, "_ButtonSkin_GradientEntry9", this._ButtonSkin_GradientEntry9);
        return _loc1_;
    }

    private function _ButtonSkin_GradientEntry10_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 16777215;
        _loc1_.ratio = 0.48001;
        _loc1_.alpha = 0;
        return _loc1_;
    }

    private function _ButtonSkin_Rect5_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 1;
        _loc1_.right = 1;
        _loc1_.top = 1;
        _loc1_.bottom = 1;
        _loc1_.radiusX = 2;
        _loc1_.stroke = this._ButtonSkin_LinearGradientStroke1_c();
        _loc1_.initialized(this, "highlightStroke");
        this.highlightStroke = _loc1_;
        BindingManager.executeBindings(this, "highlightStroke", this.highlightStroke);
        return _loc1_;
    }

    private function _ButtonSkin_LinearGradientStroke1_c(): LinearGradientStroke {
        var _loc1_: LinearGradientStroke = new LinearGradientStroke();
        _loc1_.rotation = 90;
        _loc1_.weight = 1;
        _loc1_.entries = [this._ButtonSkin_GradientEntry11_i(), this._ButtonSkin_GradientEntry12_i()];
        return _loc1_;
    }

    private function _ButtonSkin_GradientEntry11_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 16777215;
        this._ButtonSkin_GradientEntry11 = _loc1_;
        BindingManager.executeBindings(this, "_ButtonSkin_GradientEntry11", this._ButtonSkin_GradientEntry11);
        return _loc1_;
    }

    private function _ButtonSkin_GradientEntry12_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 14211288;
        this._ButtonSkin_GradientEntry12 = _loc1_;
        BindingManager.executeBindings(this, "_ButtonSkin_GradientEntry12", this._ButtonSkin_GradientEntry12);
        return _loc1_;
    }

    private function _ButtonSkin_Rect6_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 1;
        _loc1_.right = 1;
        _loc1_.top = 1;
        _loc1_.bottom = 1;
        _loc1_.radiusX = 2;
        _loc1_.stroke = this._ButtonSkin_LinearGradientStroke2_c();
        _loc1_.initialized(this, "hldownstroke1");
        this.hldownstroke1 = _loc1_;
        BindingManager.executeBindings(this, "hldownstroke1", this.hldownstroke1);
        return _loc1_;
    }

    private function _ButtonSkin_LinearGradientStroke2_c(): LinearGradientStroke {
        var _loc1_: LinearGradientStroke = new LinearGradientStroke();
        _loc1_.rotation = 90;
        _loc1_.weight = 1;
        _loc1_.entries = [this._ButtonSkin_GradientEntry13_c(), this._ButtonSkin_GradientEntry14_c(), this._ButtonSkin_GradientEntry15_c(), this._ButtonSkin_GradientEntry16_c(), this._ButtonSkin_GradientEntry17_c()];
        return _loc1_;
    }

    private function _ButtonSkin_GradientEntry13_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 0;
        _loc1_.alpha = 0.25;
        _loc1_.ratio = 0;
        return _loc1_;
    }

    private function _ButtonSkin_GradientEntry14_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 0;
        _loc1_.alpha = 0.25;
        _loc1_.ratio = 0.001;
        return _loc1_;
    }

    private function _ButtonSkin_GradientEntry15_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 0;
        _loc1_.alpha = 0.07;
        _loc1_.ratio = 0.0011;
        return _loc1_;
    }

    private function _ButtonSkin_GradientEntry16_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 0;
        _loc1_.alpha = 0.07;
        _loc1_.ratio = 0.965;
        return _loc1_;
    }

    private function _ButtonSkin_GradientEntry17_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 0;
        _loc1_.alpha = 0;
        _loc1_.ratio = 0.9651;
        return _loc1_;
    }

    private function _ButtonSkin_Rect7_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 2;
        _loc1_.right = 2;
        _loc1_.top = 2;
        _loc1_.bottom = 2;
        _loc1_.radiusX = 2;
        _loc1_.stroke = this._ButtonSkin_LinearGradientStroke3_c();
        _loc1_.initialized(this, "hldownstroke2");
        this.hldownstroke2 = _loc1_;
        BindingManager.executeBindings(this, "hldownstroke2", this.hldownstroke2);
        return _loc1_;
    }

    private function _ButtonSkin_LinearGradientStroke3_c(): LinearGradientStroke {
        var _loc1_: LinearGradientStroke = new LinearGradientStroke();
        _loc1_.rotation = 90;
        _loc1_.weight = 1;
        _loc1_.entries = [this._ButtonSkin_GradientEntry18_c(), this._ButtonSkin_GradientEntry19_c()];
        return _loc1_;
    }

    private function _ButtonSkin_GradientEntry18_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 0;
        _loc1_.alpha = 0.09;
        _loc1_.ratio = 0;
        return _loc1_;
    }

    private function _ButtonSkin_GradientEntry19_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 0;
        _loc1_.alpha = 0;
        _loc1_.ratio = 0.0001;
        return _loc1_;
    }

    private function _ButtonSkin_Rect8_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.top = 0;
        _loc1_.bottom = 0;
        _loc1_.width = 69;
        _loc1_.height = 20;
        _loc1_.radiusX = 2;
        _loc1_.stroke = this._ButtonSkin_LinearGradientStroke4_c();
        _loc1_.initialized(this, "border");
        this.border = _loc1_;
        BindingManager.executeBindings(this, "border", this.border);
        return _loc1_;
    }

    private function _ButtonSkin_LinearGradientStroke4_c(): LinearGradientStroke {
        var _loc1_: LinearGradientStroke = new LinearGradientStroke();
        _loc1_.rotation = 90;
        _loc1_.weight = 1;
        _loc1_.entries = [this._ButtonSkin_GradientEntry20_i(), this._ButtonSkin_GradientEntry21_i()];
        return _loc1_;
    }

    private function _ButtonSkin_GradientEntry20_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.alpha = 0.5625;
        this.borderEntry1 = _loc1_;
        BindingManager.executeBindings(this, "borderEntry1", this.borderEntry1);
        return _loc1_;
    }

    private function _ButtonSkin_GradientEntry21_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.alpha = 0.75;
        this.borderEntry2 = _loc1_;
        BindingManager.executeBindings(this, "borderEntry2", this.borderEntry2);
        return _loc1_;
    }

    [Bindable(event="propertyChange")]
    public function get _ButtonSkin_GradientEntry1(): GradientEntry {
        return this._1785931840_ButtonSkin_GradientEntry1;
    }

    public function set _ButtonSkin_GradientEntry1(param1: GradientEntry): void {
        var _loc2_: Object = this._1785931840_ButtonSkin_GradientEntry1;
        if (_loc2_ !== param1) {
            this._1785931840_ButtonSkin_GradientEntry1 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_ButtonSkin_GradientEntry1", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get _ButtonSkin_GradientEntry11(): GradientEntry {
        return this._470687759_ButtonSkin_GradientEntry11;
    }

    public function set _ButtonSkin_GradientEntry11(param1: GradientEntry): void {
        var _loc2_: Object = this._470687759_ButtonSkin_GradientEntry11;
        if (_loc2_ !== param1) {
            this._470687759_ButtonSkin_GradientEntry11 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_ButtonSkin_GradientEntry11", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get _ButtonSkin_GradientEntry12(): GradientEntry {
        return this._470687758_ButtonSkin_GradientEntry12;
    }

    public function set _ButtonSkin_GradientEntry12(param1: GradientEntry): void {
        var _loc2_: Object = this._470687758_ButtonSkin_GradientEntry12;
        if (_loc2_ !== param1) {
            this._470687758_ButtonSkin_GradientEntry12 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_ButtonSkin_GradientEntry12", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get _ButtonSkin_GradientEntry2(): GradientEntry {
        return this._1785931841_ButtonSkin_GradientEntry2;
    }

    public function set _ButtonSkin_GradientEntry2(param1: GradientEntry): void {
        var _loc2_: Object = this._1785931841_ButtonSkin_GradientEntry2;
        if (_loc2_ !== param1) {
            this._1785931841_ButtonSkin_GradientEntry2 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_ButtonSkin_GradientEntry2", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get _ButtonSkin_GradientEntry3(): GradientEntry {
        return this._1785931842_ButtonSkin_GradientEntry3;
    }

    public function set _ButtonSkin_GradientEntry3(param1: GradientEntry): void {
        var _loc2_: Object = this._1785931842_ButtonSkin_GradientEntry3;
        if (_loc2_ !== param1) {
            this._1785931842_ButtonSkin_GradientEntry3 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_ButtonSkin_GradientEntry3", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get _ButtonSkin_GradientEntry4(): GradientEntry {
        return this._1785931843_ButtonSkin_GradientEntry4;
    }

    public function set _ButtonSkin_GradientEntry4(param1: GradientEntry): void {
        var _loc2_: Object = this._1785931843_ButtonSkin_GradientEntry4;
        if (_loc2_ !== param1) {
            this._1785931843_ButtonSkin_GradientEntry4 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_ButtonSkin_GradientEntry4", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get _ButtonSkin_GradientEntry8(): GradientEntry {
        return this._1785931847_ButtonSkin_GradientEntry8;
    }

    public function set _ButtonSkin_GradientEntry8(param1: GradientEntry): void {
        var _loc2_: Object = this._1785931847_ButtonSkin_GradientEntry8;
        if (_loc2_ !== param1) {
            this._1785931847_ButtonSkin_GradientEntry8 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_ButtonSkin_GradientEntry8", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get _ButtonSkin_GradientEntry9(): GradientEntry {
        return this._1785931848_ButtonSkin_GradientEntry9;
    }

    public function set _ButtonSkin_GradientEntry9(param1: GradientEntry): void {
        var _loc2_: Object = this._1785931848_ButtonSkin_GradientEntry9;
        if (_loc2_ !== param1) {
            this._1785931848_ButtonSkin_GradientEntry9 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_ButtonSkin_GradientEntry9", _loc2_, param1));
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
    public function get borderEntry1(): GradientEntry {
        return this._989500747borderEntry1;
    }

    public function set borderEntry1(param1: GradientEntry): void {
        var _loc2_: Object = this._989500747borderEntry1;
        if (_loc2_ !== param1) {
            this._989500747borderEntry1 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "borderEntry1", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get borderEntry2(): GradientEntry {
        return this._989500748borderEntry2;
    }

    public function set borderEntry2(param1: GradientEntry): void {
        var _loc2_: Object = this._989500748borderEntry2;
        if (_loc2_ !== param1) {
            this._989500748borderEntry2 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "borderEntry2", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get fill(): Rect {
        return this._3143043fill;
    }

    public function set fill(param1: Rect): void {
        var _loc2_: Object = this._3143043fill;
        if (_loc2_ !== param1) {
            this._3143043fill = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fill", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get highlight(): Rect {
        return this._681210700highlight;
    }

    public function set highlight(param1: Rect): void {
        var _loc2_: Object = this._681210700highlight;
        if (_loc2_ !== param1) {
            this._681210700highlight = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "highlight", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get highlightStroke(): Rect {
        return this._1507289076highlightStroke;
    }

    public function set highlightStroke(param1: Rect): void {
        var _loc2_: Object = this._1507289076highlightStroke;
        if (_loc2_ !== param1) {
            this._1507289076highlightStroke = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "highlightStroke", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get hldownstroke1(): Rect {
        return this._1472494227hldownstroke1;
    }

    public function set hldownstroke1(param1: Rect): void {
        var _loc2_: Object = this._1472494227hldownstroke1;
        if (_loc2_ !== param1) {
            this._1472494227hldownstroke1 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hldownstroke1", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get hldownstroke2(): Rect {
        return this._1472494228hldownstroke2;
    }

    public function set hldownstroke2(param1: Rect): void {
        var _loc2_: Object = this._1472494228hldownstroke2;
        if (_loc2_ !== param1) {
            this._1472494228hldownstroke2 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hldownstroke2", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get lowlight(): Rect {
        return this._1811511742lowlight;
    }

    public function set lowlight(param1: Rect): void {
        var _loc2_: Object = this._1811511742lowlight;
        if (_loc2_ !== param1) {
            this._1811511742lowlight = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lowlight", _loc2_, param1));
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
}
}
