package mx.skins.spark {

import mx.core.IFlexModuleFactory;
import mx.graphics.GradientEntry;
import mx.graphics.LinearGradient;
import mx.graphics.LinearGradientStroke;
import mx.graphics.SolidColor;

import spark.primitives.Rect;
import spark.skins.SparkSkin;

public class ProgressBarSkin extends SparkSkin {


    private var __moduleFactoryInitialized: Boolean = false;

    public function ProgressBarSkin() {
        super();
        mx_internal::_document = this;
        this.mxmlContent = [this._ProgressBarSkin_Rect1_c(), this._ProgressBarSkin_Rect2_c(), this._ProgressBarSkin_Rect3_c()];
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

    private function _ProgressBarSkin_Rect1_c(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 2;
        _loc1_.right = 2;
        _loc1_.top = 2;
        _loc1_.bottom = 2;
        _loc1_.fill = this._ProgressBarSkin_LinearGradient1_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _ProgressBarSkin_LinearGradient1_c(): LinearGradient {
        var _loc1_: LinearGradient = new LinearGradient();
        _loc1_.rotation = 90;
        _loc1_.entries = [this._ProgressBarSkin_GradientEntry1_c(), this._ProgressBarSkin_GradientEntry2_c()];
        return _loc1_;
    }

    private function _ProgressBarSkin_GradientEntry1_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 16777215;
        _loc1_.alpha = 1;
        return _loc1_;
    }

    private function _ProgressBarSkin_GradientEntry2_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 14211288;
        _loc1_.alpha = 1;
        return _loc1_;
    }

    private function _ProgressBarSkin_Rect2_c(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 2;
        _loc1_.right = 2;
        _loc1_.top = 2;
        _loc1_.bottom = 2;
        _loc1_.stroke = this._ProgressBarSkin_LinearGradientStroke1_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _ProgressBarSkin_LinearGradientStroke1_c(): LinearGradientStroke {
        var _loc1_: LinearGradientStroke = new LinearGradientStroke();
        _loc1_.rotation = 90;
        _loc1_.entries = [this._ProgressBarSkin_GradientEntry3_c(), this._ProgressBarSkin_GradientEntry4_c()];
        return _loc1_;
    }

    private function _ProgressBarSkin_GradientEntry3_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 16777215;
        _loc1_.alpha = 0.9;
        return _loc1_;
    }

    private function _ProgressBarSkin_GradientEntry4_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 16777215;
        _loc1_.alpha = 0.5;
        return _loc1_;
    }

    private function _ProgressBarSkin_Rect3_c(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.right = 1;
        _loc1_.top = 2;
        _loc1_.bottom = 2;
        _loc1_.width = 1;
        _loc1_.fill = this._ProgressBarSkin_SolidColor1_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _ProgressBarSkin_SolidColor1_c(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 0;
        _loc1_.alpha = 0.55;
        return _loc1_;
    }
}
}
