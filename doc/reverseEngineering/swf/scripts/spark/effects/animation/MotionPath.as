package spark.effects.animation {

import mx.core.mx_internal;

import spark.effects.interpolation.IInterpolator;
import spark.effects.interpolation.NumberInterpolator;

public class MotionPath {

    mx_internal static const VERSION: String = "4.6.0.23201";


    public var property: String;

    public var interpolator: IInterpolator;

    public var keyframes: Vector.<Keyframe>;

    public function MotionPath(param1: String = null) {
        this.interpolator = NumberInterpolator.getInstance();
        super();
        this.property = param1;
    }

    public function clone(): MotionPath {
        var _loc2_: int = 0;
        var _loc1_: MotionPath = new MotionPath(this.property);
        _loc1_.interpolator = this.interpolator;
        if (this.keyframes !== null) {
            _loc1_.keyframes = new Vector.<Keyframe>();
            _loc2_ = 0;
            while (_loc2_ < this.keyframes.length) {
                _loc1_.keyframes[_loc2_] = this.keyframes[_loc2_].clone();
                _loc2_++;
            }
        }
        return _loc1_;
    }

    mx_internal function scaleKeyframes(param1: Number): void {
        var _loc3_: int = 0;
        var _loc4_: * = null;
        var _loc2_: int = this.keyframes.length;
        while (_loc3_ < _loc2_) {
            _loc4_ = this.keyframes[_loc3_];
            _loc4_.mx_internal::timeFraction = _loc4_.time / param1;
            _loc3_++;
        }
    }

    public function getValue(param1: Number): Object {
        var _loc6_: Number = NaN;
        var _loc7_: * = null;
        var _loc8_: Number = NaN;
        var _loc9_: Number = NaN;
        if (!this.keyframes) {
            return null;
        }
        var _loc2_: int = this.keyframes.length;
        if (_loc2_ == 2 && this.keyframes[1].mx_internal::timeFraction == 1) {
            _loc6_ = !!this.keyframes[1].easer ? this.keyframes[1].easer.ease(param1) : param1;
            return this.interpolator.interpolate(_loc6_, this.keyframes[0].value, this.keyframes[1].value);
        }
        if (isNaN(this.keyframes[0].mx_internal::timeFraction)) {
            this.mx_internal::scaleKeyframes(this.keyframes[this.keyframes.length - 1].time);
        }
        var _loc3_: Number = 0;
        var _loc4_: Object = this.keyframes[0].value;
        var _loc5_: int = 1;
        while (_loc5_ < _loc2_) {
            _loc7_ = this.keyframes[_loc5_];
            if (param1 >= _loc3_ && param1 < _loc7_.mx_internal::timeFraction) {
                _loc8_ = (param1 - _loc3_) / (_loc7_.mx_internal::timeFraction - _loc3_);
                _loc9_ = !!_loc7_.easer ? _loc7_.easer.ease(_loc8_) : _loc8_;
                return this.interpolator.interpolate(_loc9_, _loc4_, _loc7_.value);
            }
            _loc3_ = _loc7_.mx_internal::timeFraction;
            _loc4_ = _loc7_.value;
            _loc5_++;
        }
        return this.keyframes[_loc2_ - 1].value;
    }
}
}
