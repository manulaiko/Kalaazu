package mx.skins.spark {

import mx.core.IFlexModuleFactory;
import mx.graphics.GradientEntry;
import mx.graphics.LinearGradient;
import mx.graphics.LinearGradientStroke;
import mx.graphics.SolidColor;
import mx.graphics.SolidColorStroke;

import spark.primitives.Rect;
import spark.skins.SparkSkin;

public class ProgressBarTrackSkin extends SparkSkin {


    private var __moduleFactoryInitialized: Boolean = false;

    public function ProgressBarTrackSkin() {
        super();
        mx_internal::_document = this;
        this.minHeight = 9;
        this.mxmlContent = [this._ProgressBarTrackSkin_Rect1_c(), this._ProgressBarTrackSkin_Rect2_c(), this._ProgressBarTrackSkin_Rect3_c(), this._ProgressBarTrackSkin_Rect4_c(), this._ProgressBarTrackSkin_Rect5_c(), this._ProgressBarTrackSkin_Rect6_c()];
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

    private function _ProgressBarTrackSkin_Rect1_c(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.top = 0;
        _loc1_.bottom = 0;
        _loc1_.width = 199;
        _loc1_.stroke = this._ProgressBarTrackSkin_LinearGradientStroke1_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _ProgressBarTrackSkin_LinearGradientStroke1_c(): LinearGradientStroke {
        var _loc1_: LinearGradientStroke = new LinearGradientStroke();
        _loc1_.rotation = 90;
        _loc1_.entries = [this._ProgressBarTrackSkin_GradientEntry1_c(), this._ProgressBarTrackSkin_GradientEntry2_c()];
        return _loc1_;
    }

    private function _ProgressBarTrackSkin_GradientEntry1_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 16777215;
        _loc1_.alpha = 0.12;
        return _loc1_;
    }

    private function _ProgressBarTrackSkin_GradientEntry2_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 16777215;
        _loc1_.alpha = 0.8;
        return _loc1_;
    }

    private function _ProgressBarTrackSkin_Rect2_c(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 1;
        _loc1_.right = 1;
        _loc1_.top = 1;
        _loc1_.bottom = 1;
        _loc1_.stroke = this._ProgressBarTrackSkin_SolidColorStroke1_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _ProgressBarTrackSkin_SolidColorStroke1_c(): SolidColorStroke {
        var _loc1_: SolidColorStroke = new SolidColorStroke();
        _loc1_.color = 6513507;
        _loc1_.alpha = 1;
        return _loc1_;
    }

    private function _ProgressBarTrackSkin_Rect3_c(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 2;
        _loc1_.right = 2;
        _loc1_.top = 2;
        _loc1_.bottom = 2;
        _loc1_.fill = this._ProgressBarTrackSkin_LinearGradient1_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _ProgressBarTrackSkin_LinearGradient1_c(): LinearGradient {
        var _loc1_: LinearGradient = new LinearGradient();
        _loc1_.rotation = 90;
        _loc1_.entries = [this._ProgressBarTrackSkin_GradientEntry3_c(), this._ProgressBarTrackSkin_GradientEntry4_c()];
        return _loc1_;
    }

    private function _ProgressBarTrackSkin_GradientEntry3_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 10132122;
        _loc1_.alpha = 1;
        return _loc1_;
    }

    private function _ProgressBarTrackSkin_GradientEntry4_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 12434877;
        _loc1_.alpha = 1;
        return _loc1_;
    }

    private function _ProgressBarTrackSkin_Rect4_c(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 2;
        _loc1_.top = 2;
        _loc1_.bottom = 2;
        _loc1_.width = 1;
        _loc1_.fill = this._ProgressBarTrackSkin_SolidColor1_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _ProgressBarTrackSkin_SolidColor1_c(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 0;
        _loc1_.alpha = 0.12;
        return _loc1_;
    }

    private function _ProgressBarTrackSkin_Rect5_c(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.right = 2;
        _loc1_.top = 2;
        _loc1_.bottom = 2;
        _loc1_.width = 1;
        _loc1_.fill = this._ProgressBarTrackSkin_SolidColor2_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _ProgressBarTrackSkin_SolidColor2_c(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 0;
        _loc1_.alpha = 0.12;
        return _loc1_;
    }

    private function _ProgressBarTrackSkin_Rect6_c(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 3;
        _loc1_.top = 2;
        _loc1_.right = 3;
        _loc1_.height = 1;
        _loc1_.fill = this._ProgressBarTrackSkin_SolidColor3_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _ProgressBarTrackSkin_SolidColor3_c(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 0;
        _loc1_.alpha = 0.12;
        return _loc1_;
    }
}
}
