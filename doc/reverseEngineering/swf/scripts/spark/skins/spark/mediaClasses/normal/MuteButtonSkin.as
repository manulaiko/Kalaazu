package spark.skins.spark.mediaClasses.normal {

import flash.events.Event;

import mx.binding.BindingManager;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IFlexModuleFactory;
import mx.core.IStateClient2;
import mx.events.FlexEvent;
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
import spark.components.mediaClasses.MuteButton;
import spark.primitives.Line;
import spark.primitives.Path;
import spark.primitives.Rect;
import spark.skins.SparkSkin;

public class MuteButtonSkin extends SparkSkin implements IStateClient2 {

    private static const exclusions: Array = ["volumeSymbol"];

    private static const symbols: Array = ["trapezoid1", "trapezoid2", "bar1_1", "bar1_2", "bar1_3", "bar2_1", "bar2_2", "bar2_3", "bar3_1", "bar3_2", "bar3_3", "bar4_1", "bar4_2", "bar4_3"];


    private var _720010151_MuteButtonSkin_GradientEntry1: GradientEntry;

    private var _720010152_MuteButtonSkin_GradientEntry2: GradientEntry;

    private var _720010153_MuteButtonSkin_GradientEntry3: GradientEntry;

    private var _720010154_MuteButtonSkin_GradientEntry4: GradientEntry;

    public var _MuteButtonSkin_Rect1: Rect;

    public var _MuteButtonSkin_Rect2: Rect;

    public var _MuteButtonSkin_Rect3: Rect;

    public var _MuteButtonSkin_Rect4: Rect;

    public var _MuteButtonSkin_Rect5: Rect;

    public var _MuteButtonSkin_Rect6: Rect;

    public var _MuteButtonSkin_Rect7: Rect;

    private var _1475546209_MuteButtonSkin_SolidColor1: SolidColor;

    private var _1396282704bar1_1: GradientEntry;

    private var _1396282703bar1_2: GradientEntry;

    private var _1396282702bar1_3: GradientEntry;

    private var _1396281743bar2_1: GradientEntry;

    private var _1396281742bar2_2: GradientEntry;

    private var _1396281741bar2_3: GradientEntry;

    private var _1396280782bar3_1: GradientEntry;

    private var _1396280781bar3_2: GradientEntry;

    private var _1396280780bar3_3: GradientEntry;

    private var _1396279821bar4_1: GradientEntry;

    private var _1396279820bar4_2: GradientEntry;

    private var _1396279819bar4_3: GradientEntry;

    private var _334408887trapezoid1: SolidColor;

    private var _334408886trapezoid2: SolidColor;

    private var _1685975726volumeSymbol: Group;

    private var __moduleFactoryInitialized: Boolean = false;

    private var _volume: Number = 1;

    private var _213507019hostComponent: MuteButton;

    public function MuteButtonSkin() {
        super();
        mx_internal::_document = this;
        this.mxmlContent = [this._MuteButtonSkin_Rect1_i(), this._MuteButtonSkin_Rect8_c(), this._MuteButtonSkin_Group1_i()];
        this.currentState = "up";
        this.addEventListener("creationComplete", this.___MuteButtonSkin_SparkSkin1_creationComplete);
        var _loc1_: DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._MuteButtonSkin_Rect2_i);
        var _loc2_: DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._MuteButtonSkin_Rect3_i);
        var _loc3_: DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._MuteButtonSkin_Rect4_i);
        var _loc4_: DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._MuteButtonSkin_Rect5_i);
        var _loc5_: DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._MuteButtonSkin_Rect6_i);
        var _loc6_: DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._MuteButtonSkin_Rect7_i);
        states = [new State({
            "name": "up",
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _loc2_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_MuteButtonSkin_Rect1"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _loc1_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_MuteButtonSkin_Rect1"]
            })]
        }), new State({
            "name": "over",
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _loc2_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_MuteButtonSkin_Rect1"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _loc1_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_MuteButtonSkin_Rect1"]
            }), new SetProperty().initializeFromObject({
                "target": "_MuteButtonSkin_GradientEntry1",
                "name": "color",
                "value": 13290186
            }), new SetProperty().initializeFromObject({
                "target": "_MuteButtonSkin_GradientEntry2",
                "name": "color",
                "value": 9276813
            }), new SetProperty().initializeFromObject({
                "target": "_MuteButtonSkin_GradientEntry3",
                "name": "alpha",
                "value": 0.22
            }), new SetProperty().initializeFromObject({
                "target": "_MuteButtonSkin_GradientEntry4",
                "name": "alpha",
                "value": 0.22
            }), new SetProperty().initializeFromObject({
                "target": "_MuteButtonSkin_SolidColor1",
                "name": "alpha",
                "value": 0.12
            })]
        }), new State({
            "name": "down",
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _loc6_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_MuteButtonSkin_Rect1"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _loc5_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_MuteButtonSkin_Rect1"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _loc4_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_MuteButtonSkin_Rect1"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _loc3_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_MuteButtonSkin_Rect1"]
            }), new SetProperty().initializeFromObject({
                "target": "_MuteButtonSkin_GradientEntry1",
                "name": "color",
                "value": 11053224
            }), new SetProperty().initializeFromObject({
                "target": "_MuteButtonSkin_GradientEntry2",
                "name": "color",
                "value": 7039851
            })]
        }), new State({
            "name": "disabled",
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _loc2_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_MuteButtonSkin_Rect1"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _loc1_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_MuteButtonSkin_Rect1"]
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

    private function init(): void {
        this.volume = this.hostComponent.muted ? 0 : this.hostComponent.volume;
        this.hostComponent.addEventListener(FlexEvent.VALUE_COMMIT, this.valueCommitHandler);
        this.hostComponent.addEventListener(FlexEvent.MUTED_CHANGE, this.valueCommitHandler);
    }

    private function valueCommitHandler(param1: Event): void {
        this.volume = this.hostComponent.muted ? 0 : this.hostComponent.volume;
    }

    public function get volume(): Number {
        return this._volume;
    }

    public function set volume(param1: Number): void {
        if (param1 == this._volume) {
            return;
        }
        this._volume = param1;
        var _loc2_: Array = [this.bar1_1, this.bar1_2, this.bar1_3];
        var _loc3_: Array = [this.bar2_1, this.bar2_2, this.bar2_3];
        var _loc4_: Array = [this.bar3_1, this.bar3_2, this.bar3_3];
        var _loc5_: Array = [this.bar4_1, this.bar4_2, this.bar4_3];
        var _loc6_: Array = [_loc2_, _loc3_, _loc4_, _loc5_];
        var _loc7_: Number = 0;
        var _loc8_: int = 0;
        while (_loc8_ < _loc6_.length) {
            if (param1 <= _loc7_) {
                this.setAlphaTo(_loc6_[_loc8_], 0);
            } else if (param1 >= _loc7_ + 0.25) {
                this.setAlphaTo(_loc6_[_loc8_], 1);
            } else {
                this.setAlphaTo(_loc6_[_loc8_], (param1 - _loc7_) * 4);
            }
            _loc7_ += 0.25;
            _loc8_++;
        }
    }

    private function setAlphaTo(param1: Array, param2: Number): void {
        var _loc3_: int = 0;
        while (_loc3_ < param1.length) {
            param1[_loc3_].alpha = param2;
            _loc3_++;
        }
    }

    private function _MuteButtonSkin_Rect1_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 1;
        _loc1_.right = 1;
        _loc1_.top = 1;
        _loc1_.bottom = 1;
        _loc1_.fill = this._MuteButtonSkin_LinearGradient1_c();
        _loc1_.initialized(this, "_MuteButtonSkin_Rect1");
        this._MuteButtonSkin_Rect1 = _loc1_;
        BindingManager.executeBindings(this, "_MuteButtonSkin_Rect1", this._MuteButtonSkin_Rect1);
        return _loc1_;
    }

    private function _MuteButtonSkin_LinearGradient1_c(): LinearGradient {
        var _loc1_: LinearGradient = new LinearGradient();
        _loc1_.rotation = 90;
        _loc1_.entries = [this._MuteButtonSkin_GradientEntry1_i(), this._MuteButtonSkin_GradientEntry2_i()];
        return _loc1_;
    }

    private function _MuteButtonSkin_GradientEntry1_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 16777215;
        this._MuteButtonSkin_GradientEntry1 = _loc1_;
        BindingManager.executeBindings(this, "_MuteButtonSkin_GradientEntry1", this._MuteButtonSkin_GradientEntry1);
        return _loc1_;
    }

    private function _MuteButtonSkin_GradientEntry2_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 14474460;
        this._MuteButtonSkin_GradientEntry2 = _loc1_;
        BindingManager.executeBindings(this, "_MuteButtonSkin_GradientEntry2", this._MuteButtonSkin_GradientEntry2);
        return _loc1_;
    }

    private function _MuteButtonSkin_Rect2_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 1;
        _loc1_.right = 1;
        _loc1_.top = 1;
        _loc1_.bottom = 1;
        _loc1_.stroke = this._MuteButtonSkin_LinearGradientStroke1_c();
        _loc1_.initialized(this, "_MuteButtonSkin_Rect2");
        this._MuteButtonSkin_Rect2 = _loc1_;
        BindingManager.executeBindings(this, "_MuteButtonSkin_Rect2", this._MuteButtonSkin_Rect2);
        return _loc1_;
    }

    private function _MuteButtonSkin_LinearGradientStroke1_c(): LinearGradientStroke {
        var _loc1_: LinearGradientStroke = new LinearGradientStroke();
        _loc1_.weight = 1;
        _loc1_.rotation = 90;
        _loc1_.entries = [this._MuteButtonSkin_GradientEntry3_i(), this._MuteButtonSkin_GradientEntry4_i()];
        return _loc1_;
    }

    private function _MuteButtonSkin_GradientEntry3_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 16711422;
        this._MuteButtonSkin_GradientEntry3 = _loc1_;
        BindingManager.executeBindings(this, "_MuteButtonSkin_GradientEntry3", this._MuteButtonSkin_GradientEntry3);
        return _loc1_;
    }

    private function _MuteButtonSkin_GradientEntry4_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 15395562;
        this._MuteButtonSkin_GradientEntry4 = _loc1_;
        BindingManager.executeBindings(this, "_MuteButtonSkin_GradientEntry4", this._MuteButtonSkin_GradientEntry4);
        return _loc1_;
    }

    private function _MuteButtonSkin_Rect3_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 1;
        _loc1_.right = 1;
        _loc1_.top = 1;
        _loc1_.height = 11;
        _loc1_.fill = this._MuteButtonSkin_SolidColor1_i();
        _loc1_.initialized(this, "_MuteButtonSkin_Rect3");
        this._MuteButtonSkin_Rect3 = _loc1_;
        BindingManager.executeBindings(this, "_MuteButtonSkin_Rect3", this._MuteButtonSkin_Rect3);
        return _loc1_;
    }

    private function _MuteButtonSkin_SolidColor1_i(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 16777215;
        _loc1_.alpha = 0.3;
        this._MuteButtonSkin_SolidColor1 = _loc1_;
        BindingManager.executeBindings(this, "_MuteButtonSkin_SolidColor1", this._MuteButtonSkin_SolidColor1);
        return _loc1_;
    }

    private function _MuteButtonSkin_Rect4_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 1;
        _loc1_.top = 1;
        _loc1_.right = 1;
        _loc1_.height = 1;
        _loc1_.fill = this._MuteButtonSkin_SolidColor2_c();
        _loc1_.initialized(this, "_MuteButtonSkin_Rect4");
        this._MuteButtonSkin_Rect4 = _loc1_;
        BindingManager.executeBindings(this, "_MuteButtonSkin_Rect4", this._MuteButtonSkin_Rect4);
        return _loc1_;
    }

    private function _MuteButtonSkin_SolidColor2_c(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 0;
        _loc1_.alpha = 0.4;
        return _loc1_;
    }

    private function _MuteButtonSkin_Rect5_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 1;
        _loc1_.top = 2;
        _loc1_.right = 1;
        _loc1_.height = 1;
        _loc1_.fill = this._MuteButtonSkin_SolidColor3_c();
        _loc1_.initialized(this, "_MuteButtonSkin_Rect5");
        this._MuteButtonSkin_Rect5 = _loc1_;
        BindingManager.executeBindings(this, "_MuteButtonSkin_Rect5", this._MuteButtonSkin_Rect5);
        return _loc1_;
    }

    private function _MuteButtonSkin_SolidColor3_c(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 0;
        _loc1_.alpha = 0.12;
        return _loc1_;
    }

    private function _MuteButtonSkin_Rect6_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 1;
        _loc1_.top = 1;
        _loc1_.bottom = 1;
        _loc1_.width = 1;
        _loc1_.fill = this._MuteButtonSkin_SolidColor4_c();
        _loc1_.initialized(this, "_MuteButtonSkin_Rect6");
        this._MuteButtonSkin_Rect6 = _loc1_;
        BindingManager.executeBindings(this, "_MuteButtonSkin_Rect6", this._MuteButtonSkin_Rect6);
        return _loc1_;
    }

    private function _MuteButtonSkin_SolidColor4_c(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 0;
        _loc1_.alpha = 0.12;
        return _loc1_;
    }

    private function _MuteButtonSkin_Rect7_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.right = 1;
        _loc1_.top = 1;
        _loc1_.bottom = 1;
        _loc1_.width = 1;
        _loc1_.fill = this._MuteButtonSkin_SolidColor5_c();
        _loc1_.initialized(this, "_MuteButtonSkin_Rect7");
        this._MuteButtonSkin_Rect7 = _loc1_;
        BindingManager.executeBindings(this, "_MuteButtonSkin_Rect7", this._MuteButtonSkin_Rect7);
        return _loc1_;
    }

    private function _MuteButtonSkin_SolidColor5_c(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 0;
        _loc1_.alpha = 0.12;
        return _loc1_;
    }

    private function _MuteButtonSkin_Rect8_c(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.top = 0;
        _loc1_.bottom = 0;
        _loc1_.width = 38;
        _loc1_.height = 24;
        _loc1_.stroke = this._MuteButtonSkin_SolidColorStroke1_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _MuteButtonSkin_SolidColorStroke1_c(): SolidColorStroke {
        var _loc1_: SolidColorStroke = new SolidColorStroke();
        _loc1_.color = 1250067;
        return _loc1_;
    }

    private function _MuteButtonSkin_Group1_i(): Group {
        var _loc1_: Group = new Group();
        _loc1_.horizontalCenter = 0;
        _loc1_.verticalCenter = 0;
        _loc1_.mxmlContent = [this._MuteButtonSkin_Path1_c(), this._MuteButtonSkin_Path2_c(), this._MuteButtonSkin_Line1_c(), this._MuteButtonSkin_Line2_c(), this._MuteButtonSkin_Line3_c(), this._MuteButtonSkin_Line4_c()];
        _loc1_.id = "volumeSymbol";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.volumeSymbol = _loc1_;
        BindingManager.executeBindings(this, "volumeSymbol", this.volumeSymbol);
        return _loc1_;
    }

    private function _MuteButtonSkin_Path1_c(): Path {
        var _loc1_: Path = new Path();
        _loc1_.winding = "evenOdd";
        _loc1_.data = "M 9 13 L 9 0 L 4 4 L 4 9 L 9 13 Z";
        _loc1_.fill = this._MuteButtonSkin_SolidColor6_i();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _MuteButtonSkin_SolidColor6_i(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 2171169;
        _loc1_.alpha = 0.85;
        this.trapezoid1 = _loc1_;
        BindingManager.executeBindings(this, "trapezoid1", this.trapezoid1);
        return _loc1_;
    }

    private function _MuteButtonSkin_Path2_c(): Path {
        var _loc1_: Path = new Path();
        _loc1_.winding = "evenOdd";
        _loc1_.data = "M 3 9 L 3 4 L 0 5 L 0 8 L 3 9 Z";
        _loc1_.fill = this._MuteButtonSkin_SolidColor7_i();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _MuteButtonSkin_SolidColor7_i(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 2171169;
        _loc1_.alpha = 0.75;
        this.trapezoid2 = _loc1_;
        BindingManager.executeBindings(this, "trapezoid2", this.trapezoid2);
        return _loc1_;
    }

    private function _MuteButtonSkin_Line1_c(): Line {
        var _loc1_: Line = new Line();
        _loc1_.yFrom = 0;
        _loc1_.yTo = 12;
        _loc1_.x = 16;
        _loc1_.stroke = this._MuteButtonSkin_LinearGradientStroke2_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _MuteButtonSkin_LinearGradientStroke2_c(): LinearGradientStroke {
        var _loc1_: LinearGradientStroke = new LinearGradientStroke();
        _loc1_.rotation = 90;
        _loc1_.entries = [this._MuteButtonSkin_GradientEntry5_i(), this._MuteButtonSkin_GradientEntry6_i(), this._MuteButtonSkin_GradientEntry7_i()];
        return _loc1_;
    }

    private function _MuteButtonSkin_GradientEntry5_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 2565927;
        _loc1_.ratio = 0.1;
        this.bar4_1 = _loc1_;
        BindingManager.executeBindings(this, "bar4_1", this.bar4_1);
        return _loc1_;
    }

    private function _MuteButtonSkin_GradientEntry6_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 4013373;
        _loc1_.ratio = 0.2;
        this.bar4_2 = _loc1_;
        BindingManager.executeBindings(this, "bar4_2", this.bar4_2);
        return _loc1_;
    }

    private function _MuteButtonSkin_GradientEntry7_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 4737096;
        _loc1_.ratio = 0.3;
        this.bar4_3 = _loc1_;
        BindingManager.executeBindings(this, "bar4_3", this.bar4_3);
        return _loc1_;
    }

    private function _MuteButtonSkin_Line2_c(): Line {
        var _loc1_: Line = new Line();
        _loc1_.yFrom = 2;
        _loc1_.yTo = 10;
        _loc1_.x = 14;
        _loc1_.stroke = this._MuteButtonSkin_LinearGradientStroke3_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _MuteButtonSkin_LinearGradientStroke3_c(): LinearGradientStroke {
        var _loc1_: LinearGradientStroke = new LinearGradientStroke();
        _loc1_.rotation = 90;
        _loc1_.entries = [this._MuteButtonSkin_GradientEntry8_i(), this._MuteButtonSkin_GradientEntry9_i(), this._MuteButtonSkin_GradientEntry10_i()];
        return _loc1_;
    }

    private function _MuteButtonSkin_GradientEntry8_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 2565927;
        _loc1_.ratio = 0.1;
        this.bar3_1 = _loc1_;
        BindingManager.executeBindings(this, "bar3_1", this.bar3_1);
        return _loc1_;
    }

    private function _MuteButtonSkin_GradientEntry9_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 4013373;
        _loc1_.ratio = 0.2;
        this.bar3_2 = _loc1_;
        BindingManager.executeBindings(this, "bar3_2", this.bar3_2);
        return _loc1_;
    }

    private function _MuteButtonSkin_GradientEntry10_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 4737096;
        _loc1_.ratio = 0.3;
        this.bar3_3 = _loc1_;
        BindingManager.executeBindings(this, "bar3_3", this.bar3_3);
        return _loc1_;
    }

    private function _MuteButtonSkin_Line3_c(): Line {
        var _loc1_: Line = new Line();
        _loc1_.yFrom = 3;
        _loc1_.yTo = 9;
        _loc1_.x = 12;
        _loc1_.stroke = this._MuteButtonSkin_LinearGradientStroke4_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _MuteButtonSkin_LinearGradientStroke4_c(): LinearGradientStroke {
        var _loc1_: LinearGradientStroke = new LinearGradientStroke();
        _loc1_.rotation = 90;
        _loc1_.entries = [this._MuteButtonSkin_GradientEntry11_i(), this._MuteButtonSkin_GradientEntry12_i(), this._MuteButtonSkin_GradientEntry13_i()];
        return _loc1_;
    }

    private function _MuteButtonSkin_GradientEntry11_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 2565927;
        _loc1_.ratio = 0.1;
        this.bar2_1 = _loc1_;
        BindingManager.executeBindings(this, "bar2_1", this.bar2_1);
        return _loc1_;
    }

    private function _MuteButtonSkin_GradientEntry12_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 4013373;
        _loc1_.ratio = 0.2;
        this.bar2_2 = _loc1_;
        BindingManager.executeBindings(this, "bar2_2", this.bar2_2);
        return _loc1_;
    }

    private function _MuteButtonSkin_GradientEntry13_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 4737096;
        _loc1_.ratio = 0.3;
        this.bar2_3 = _loc1_;
        BindingManager.executeBindings(this, "bar2_3", this.bar2_3);
        return _loc1_;
    }

    private function _MuteButtonSkin_Line4_c(): Line {
        var _loc1_: Line = new Line();
        _loc1_.yFrom = 5;
        _loc1_.yTo = 7;
        _loc1_.x = 10;
        _loc1_.stroke = this._MuteButtonSkin_LinearGradientStroke5_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _MuteButtonSkin_LinearGradientStroke5_c(): LinearGradientStroke {
        var _loc1_: LinearGradientStroke = new LinearGradientStroke();
        _loc1_.rotation = 90;
        _loc1_.entries = [this._MuteButtonSkin_GradientEntry14_i(), this._MuteButtonSkin_GradientEntry15_i(), this._MuteButtonSkin_GradientEntry16_i()];
        return _loc1_;
    }

    private function _MuteButtonSkin_GradientEntry14_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 2565927;
        _loc1_.ratio = 0.1;
        this.bar1_1 = _loc1_;
        BindingManager.executeBindings(this, "bar1_1", this.bar1_1);
        return _loc1_;
    }

    private function _MuteButtonSkin_GradientEntry15_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 4013373;
        _loc1_.ratio = 0.2;
        this.bar1_2 = _loc1_;
        BindingManager.executeBindings(this, "bar1_2", this.bar1_2);
        return _loc1_;
    }

    private function _MuteButtonSkin_GradientEntry16_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 4737096;
        _loc1_.ratio = 0.3;
        this.bar1_3 = _loc1_;
        BindingManager.executeBindings(this, "bar1_3", this.bar1_3);
        return _loc1_;
    }

    public function ___MuteButtonSkin_SparkSkin1_creationComplete(param1: FlexEvent): void {
        this.init();
    }

    [Bindable(event="propertyChange")]
    public function get _MuteButtonSkin_GradientEntry1(): GradientEntry {
        return this._720010151_MuteButtonSkin_GradientEntry1;
    }

    public function set _MuteButtonSkin_GradientEntry1(param1: GradientEntry): void {
        var _loc2_: Object = this._720010151_MuteButtonSkin_GradientEntry1;
        if (_loc2_ !== param1) {
            this._720010151_MuteButtonSkin_GradientEntry1 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_MuteButtonSkin_GradientEntry1", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get _MuteButtonSkin_GradientEntry2(): GradientEntry {
        return this._720010152_MuteButtonSkin_GradientEntry2;
    }

    public function set _MuteButtonSkin_GradientEntry2(param1: GradientEntry): void {
        var _loc2_: Object = this._720010152_MuteButtonSkin_GradientEntry2;
        if (_loc2_ !== param1) {
            this._720010152_MuteButtonSkin_GradientEntry2 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_MuteButtonSkin_GradientEntry2", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get _MuteButtonSkin_GradientEntry3(): GradientEntry {
        return this._720010153_MuteButtonSkin_GradientEntry3;
    }

    public function set _MuteButtonSkin_GradientEntry3(param1: GradientEntry): void {
        var _loc2_: Object = this._720010153_MuteButtonSkin_GradientEntry3;
        if (_loc2_ !== param1) {
            this._720010153_MuteButtonSkin_GradientEntry3 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_MuteButtonSkin_GradientEntry3", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get _MuteButtonSkin_GradientEntry4(): GradientEntry {
        return this._720010154_MuteButtonSkin_GradientEntry4;
    }

    public function set _MuteButtonSkin_GradientEntry4(param1: GradientEntry): void {
        var _loc2_: Object = this._720010154_MuteButtonSkin_GradientEntry4;
        if (_loc2_ !== param1) {
            this._720010154_MuteButtonSkin_GradientEntry4 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_MuteButtonSkin_GradientEntry4", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get _MuteButtonSkin_SolidColor1(): SolidColor {
        return this._1475546209_MuteButtonSkin_SolidColor1;
    }

    public function set _MuteButtonSkin_SolidColor1(param1: SolidColor): void {
        var _loc2_: Object = this._1475546209_MuteButtonSkin_SolidColor1;
        if (_loc2_ !== param1) {
            this._1475546209_MuteButtonSkin_SolidColor1 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_MuteButtonSkin_SolidColor1", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get bar1_1(): GradientEntry {
        return this._1396282704bar1_1;
    }

    public function set bar1_1(param1: GradientEntry): void {
        var _loc2_: Object = this._1396282704bar1_1;
        if (_loc2_ !== param1) {
            this._1396282704bar1_1 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bar1_1", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get bar1_2(): GradientEntry {
        return this._1396282703bar1_2;
    }

    public function set bar1_2(param1: GradientEntry): void {
        var _loc2_: Object = this._1396282703bar1_2;
        if (_loc2_ !== param1) {
            this._1396282703bar1_2 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bar1_2", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get bar1_3(): GradientEntry {
        return this._1396282702bar1_3;
    }

    public function set bar1_3(param1: GradientEntry): void {
        var _loc2_: Object = this._1396282702bar1_3;
        if (_loc2_ !== param1) {
            this._1396282702bar1_3 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bar1_3", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get bar2_1(): GradientEntry {
        return this._1396281743bar2_1;
    }

    public function set bar2_1(param1: GradientEntry): void {
        var _loc2_: Object = this._1396281743bar2_1;
        if (_loc2_ !== param1) {
            this._1396281743bar2_1 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bar2_1", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get bar2_2(): GradientEntry {
        return this._1396281742bar2_2;
    }

    public function set bar2_2(param1: GradientEntry): void {
        var _loc2_: Object = this._1396281742bar2_2;
        if (_loc2_ !== param1) {
            this._1396281742bar2_2 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bar2_2", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get bar2_3(): GradientEntry {
        return this._1396281741bar2_3;
    }

    public function set bar2_3(param1: GradientEntry): void {
        var _loc2_: Object = this._1396281741bar2_3;
        if (_loc2_ !== param1) {
            this._1396281741bar2_3 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bar2_3", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get bar3_1(): GradientEntry {
        return this._1396280782bar3_1;
    }

    public function set bar3_1(param1: GradientEntry): void {
        var _loc2_: Object = this._1396280782bar3_1;
        if (_loc2_ !== param1) {
            this._1396280782bar3_1 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bar3_1", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get bar3_2(): GradientEntry {
        return this._1396280781bar3_2;
    }

    public function set bar3_2(param1: GradientEntry): void {
        var _loc2_: Object = this._1396280781bar3_2;
        if (_loc2_ !== param1) {
            this._1396280781bar3_2 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bar3_2", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get bar3_3(): GradientEntry {
        return this._1396280780bar3_3;
    }

    public function set bar3_3(param1: GradientEntry): void {
        var _loc2_: Object = this._1396280780bar3_3;
        if (_loc2_ !== param1) {
            this._1396280780bar3_3 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bar3_3", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get bar4_1(): GradientEntry {
        return this._1396279821bar4_1;
    }

    public function set bar4_1(param1: GradientEntry): void {
        var _loc2_: Object = this._1396279821bar4_1;
        if (_loc2_ !== param1) {
            this._1396279821bar4_1 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bar4_1", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get bar4_2(): GradientEntry {
        return this._1396279820bar4_2;
    }

    public function set bar4_2(param1: GradientEntry): void {
        var _loc2_: Object = this._1396279820bar4_2;
        if (_loc2_ !== param1) {
            this._1396279820bar4_2 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bar4_2", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get bar4_3(): GradientEntry {
        return this._1396279819bar4_3;
    }

    public function set bar4_3(param1: GradientEntry): void {
        var _loc2_: Object = this._1396279819bar4_3;
        if (_loc2_ !== param1) {
            this._1396279819bar4_3 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bar4_3", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get trapezoid1(): SolidColor {
        return this._334408887trapezoid1;
    }

    public function set trapezoid1(param1: SolidColor): void {
        var _loc2_: Object = this._334408887trapezoid1;
        if (_loc2_ !== param1) {
            this._334408887trapezoid1 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "trapezoid1", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get trapezoid2(): SolidColor {
        return this._334408886trapezoid2;
    }

    public function set trapezoid2(param1: SolidColor): void {
        var _loc2_: Object = this._334408886trapezoid2;
        if (_loc2_ !== param1) {
            this._334408886trapezoid2 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "trapezoid2", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get volumeSymbol(): Group {
        return this._1685975726volumeSymbol;
    }

    public function set volumeSymbol(param1: Group): void {
        var _loc2_: Object = this._1685975726volumeSymbol;
        if (_loc2_ !== param1) {
            this._1685975726volumeSymbol = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "volumeSymbol", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get hostComponent(): MuteButton {
        return this._213507019hostComponent;
    }

    public function set hostComponent(param1: MuteButton): void {
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
