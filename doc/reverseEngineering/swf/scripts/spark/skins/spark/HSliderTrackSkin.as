package spark.skins.spark {

import mx.core.IFlexModuleFactory;
import mx.core.IStateClient2;
import mx.events.PropertyChangeEvent;
import mx.graphics.GradientEntry;
import mx.graphics.LinearGradient;
import mx.graphics.SolidColor;
import mx.states.State;

import spark.components.Button;
import spark.primitives.Rect;
import spark.skins.SparkSkin;

public class HSliderTrackSkin extends SparkSkin implements IStateClient2 {


    private var __moduleFactoryInitialized: Boolean = false;

    private var _213507019hostComponent: Button;

    public function HSliderTrackSkin() {
        super();
        mx_internal::_document = this;
        this.mxmlContent = [this._HSliderTrackSkin_Rect1_c(), this._HSliderTrackSkin_Rect2_c(), this._HSliderTrackSkin_Rect3_c(), this._HSliderTrackSkin_Rect4_c()];
        this.currentState = "up";
        states = [new State({
            "name": "up",
            "overrides": []
        }), new State({
            "name": "down",
            "overrides": []
        }), new State({
            "name": "over",
            "overrides": []
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

    override protected function initializationComplete(): void {
        useChromeColor = true;
        super.initializationComplete();
    }

    private function _HSliderTrackSkin_Rect1_c(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.top = 3;
        _loc1_.bottom = 3;
        _loc1_.radiusX = 2;
        _loc1_.radiusY = 2;
        _loc1_.height = 5;
        _loc1_.fill = this._HSliderTrackSkin_LinearGradient1_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _HSliderTrackSkin_LinearGradient1_c(): LinearGradient {
        var _loc1_: LinearGradient = new LinearGradient();
        _loc1_.rotation = 90;
        _loc1_.entries = [this._HSliderTrackSkin_GradientEntry1_c(), this._HSliderTrackSkin_GradientEntry2_c()];
        return _loc1_;
    }

    private function _HSliderTrackSkin_GradientEntry1_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 0;
        _loc1_.alpha = 0.55;
        return _loc1_;
    }

    private function _HSliderTrackSkin_GradientEntry2_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 16777215;
        _loc1_.alpha = 0.55;
        _loc1_.ratio = 0.8;
        return _loc1_;
    }

    private function _HSliderTrackSkin_Rect2_c(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 1;
        _loc1_.right = 1;
        _loc1_.top = 4;
        _loc1_.bottom = 4;
        _loc1_.radiusX = 2;
        _loc1_.radiusY = 2;
        _loc1_.fill = this._HSliderTrackSkin_SolidColor1_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _HSliderTrackSkin_SolidColor1_c(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 13290186;
        return _loc1_;
    }

    private function _HSliderTrackSkin_Rect3_c(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 2;
        _loc1_.right = 2;
        _loc1_.top = 4;
        _loc1_.height = 1;
        _loc1_.fill = this._HSliderTrackSkin_SolidColor2_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _HSliderTrackSkin_SolidColor2_c(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 10395294;
        return _loc1_;
    }

    private function _HSliderTrackSkin_Rect4_c(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.top = 0;
        _loc1_.bottom = 0;
        _loc1_.fill = this._HSliderTrackSkin_SolidColor3_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _HSliderTrackSkin_SolidColor3_c(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.alpha = 0;
        return _loc1_;
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
