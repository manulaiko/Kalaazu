package spark.effects {

import flash.geom.Point;

import mx.core.mx_internal;

import spark.effects.animation.Keyframe;
import spark.effects.animation.MotionPath;
import spark.effects.animation.SimpleMotionPath;
import spark.effects.easing.IEaser;
import spark.effects.easing.Power;
import spark.effects.easing.Sine;

public class ThrowEffect extends Animate {

    private static const THROW_OVERSHOOT_TIME: int = 200;

    private static const THROW_SETTLE_TIME: int = 600;

    private static const THROW_CURVE_EXPONENT: Number = 3;

    private static const OVERSHOOT_CURVE_EXPONENT: Number = 2;


    mx_internal var propertyNameX: String = null;

    mx_internal var propertyNameY: String = null;

    mx_internal var startingVelocityX: Number = 0;

    mx_internal var startingVelocityY: Number = 0;

    mx_internal var startingPositionX: Number = 0;

    mx_internal var startingPositionY: Number = 0;

    mx_internal var minPositionX: Number = 0;

    mx_internal var minPositionY: Number = 0;

    mx_internal var maxPositionX: Number = 0;

    mx_internal var maxPositionY: Number = 0;

    mx_internal var decelerationFactor: Number;

    mx_internal var finalPosition: Point;

    mx_internal var finalPositionFilterFunction: Function;

    mx_internal var isSnapping: Boolean = false;

    private var horizontalMP: SimpleMotionPath = null;

    private var verticalMP: SimpleMotionPath = null;

    public function ThrowEffect() {
        super();
    }

    private function calculateThrowEffectTime(param1: Number, param2: Number): int {
        var _loc3_: int = param1 == 0 ? 0 : Math.log(0.01 / Math.abs(param1)) / Math.log(this.mx_internal::decelerationFactor);
        var _loc4_: int = param2 == 0 ? 0 : Math.log(0.01 / Math.abs(param2)) / Math.log(this.mx_internal::decelerationFactor);
        return Math.max(_loc3_, _loc4_);
    }

    mx_internal function setup(): Boolean {
        var _loc1_: IEaser = new Power(0, THROW_CURVE_EXPONENT);
        this.easer = _loc1_;
        var _loc2_: int = this.calculateThrowEffectTime(this.mx_internal::startingVelocityX, this.mx_internal::startingVelocityY);
        var _loc3_: Vector.<MotionPath> = new Vector.<MotionPath>();
        this.mx_internal::isSnapping = false;
        var _loc4_: Number = 0;
        var _loc5_: Number = 0;
        this.horizontalMP = null;
        if (this.mx_internal::propertyNameX) {
            this.horizontalMP = this.createThrowMotionPath(this.mx_internal::propertyNameX, this.mx_internal::startingVelocityX, this.mx_internal::startingPositionX, this.mx_internal::minPositionX, this.mx_internal::maxPositionX, _loc2_);
            if (this.horizontalMP) {
                _loc3_.push(this.horizontalMP);
                _loc4_ = this.horizontalMP.keyframes[this.horizontalMP.keyframes.length - 1].time;
                _loc5_ = Number(this.horizontalMP.keyframes[this.horizontalMP.keyframes.length - 1].value);
            }
        }
        var _loc6_: Number = 0;
        var _loc7_: Number = 0;
        this.verticalMP = null;
        if (this.mx_internal::propertyNameY) {
            this.verticalMP = this.createThrowMotionPath(this.mx_internal::propertyNameY, this.mx_internal::startingVelocityY, this.mx_internal::startingPositionY, this.mx_internal::minPositionY, this.mx_internal::maxPositionY, _loc2_);
            if (this.verticalMP) {
                _loc3_.push(this.verticalMP);
                _loc6_ = this.verticalMP.keyframes[this.verticalMP.keyframes.length - 1].time;
                _loc7_ = Number(this.verticalMP.keyframes[this.verticalMP.keyframes.length - 1].value);
            }
        }
        if (_loc3_.length != 0) {
            this.duration = Math.max(_loc4_, _loc6_);
            this.motionPaths = _loc3_;
            this.mx_internal::finalPosition = new Point(_loc5_, _loc7_);
            return true;
        }
        return false;
    }

    private function getMotionPathCurrentVelocity(param1: MotionPath, param2: Number, param3: Number): Number {
        var _loc4_: Number = param2 / param3;
        var _loc6_: Number = Number(param1.getValue(_loc4_));
        var _loc7_: Number;
        return ((_loc7_ = Number(param1.getValue(_loc4_ + 0.00001 / param3))) - _loc6_) / 0.00001;
    }

    mx_internal function getCurrentVelocity(): Point {
        var _loc1_: Number = this.playheadTime;
        if (isNaN(_loc1_)) {
            _loc1_ = 0;
        }
        var _loc2_: Number = this.duration;
        var _loc3_: Number = !!this.horizontalMP ? this.getMotionPathCurrentVelocity(this.horizontalMP, _loc1_, _loc2_) : 0;
        var _loc4_: Number = !!this.verticalMP ? this.getMotionPathCurrentVelocity(this.verticalMP, _loc1_, _loc2_) : 0;
        return new Point(_loc3_, _loc4_);
    }

    private function addKeyframe(param1: SimpleMotionPath, param2: Number, param3: Number, param4: IEaser): Number {
        var _loc5_: Keyframe;
        (_loc5_ = new Keyframe(param2, param3)).easer = param4;
        param1.keyframes.push(_loc5_);
        return param2;
    }

    private function createThrowMotionPath(param1: String, param2: Number, param3: Number, param4: Number, param5: Number, param6: Number): SimpleMotionPath {
        var _loc10_: Number = NaN;
        var _loc11_: Number = NaN;
        var _loc12_: Number = NaN;
        var _loc13_: Number = NaN;
        var _loc14_: Number = NaN;
        var _loc15_: Number = NaN;
        var _loc16_: Number = NaN;
        var _loc17_: Number = NaN;
        var _loc18_: Number = NaN;
        var _loc19_: Number = NaN;
        var _loc20_: Number = NaN;
        var _loc7_: SimpleMotionPath;
        (_loc7_ = new SimpleMotionPath(param1)).keyframes = Vector.<Keyframe>([new Keyframe(0, param3)]);
        var _loc9_: Number = 0;
        if (param2 == 0) {
            if (param3 < param4 || param3 > param5) {
                param3 = param3 < param4 ? param4 : param5;
                if (this.mx_internal::finalPositionFilterFunction != null) {
                    param3 = this.mx_internal::finalPositionFilterFunction(param3, param1);
                }
                _loc9_ = this.addKeyframe(_loc7_, _loc9_ + THROW_SETTLE_TIME, param3, new Power(0, THROW_CURVE_EXPONENT));
            } else {
                _loc10_ = param3;
                if (this.mx_internal::finalPositionFilterFunction != null) {
                    _loc10_ = this.mx_internal::finalPositionFilterFunction(param3, param1);
                }
                if (_loc10_ == param3) {
                    return null;
                }
                this.mx_internal::isSnapping = true;
                _loc9_ = this.addKeyframe(_loc7_, _loc9_ + THROW_SETTLE_TIME, _loc10_, new Power(0, THROW_CURVE_EXPONENT));
            }
        }
        while (param2 != 0) {
            if (param3 < param4 && param2 > 0 || param3 > param5 && param2 < 0) {
                _loc11_ = param3 < param4 ? param4 : param5;
                if (this.mx_internal::finalPositionFilterFunction != null) {
                    _loc11_ = this.mx_internal::finalPositionFilterFunction(_loc11_, param1);
                }
                _loc12_ = Math.round(param3 - param2 / OVERSHOOT_CURVE_EXPONENT * THROW_OVERSHOOT_TIME);
                _loc9_ = this.addKeyframe(_loc7_, _loc9_ + THROW_OVERSHOOT_TIME, _loc12_, new Power(0, OVERSHOOT_CURVE_EXPONENT));
                _loc9_ = this.addKeyframe(_loc7_, _loc9_ + THROW_SETTLE_TIME, _loc11_, new Sine(0.25));
                param2 = 0;
                param3 = _loc11_;
            } else {
                _loc13_ = param6;
                if (param3 < param4 || param3 > param5) {
                    _loc14_ = (param3 - (param3 < param4 ? param4 : param5)) / THROW_SETTLE_TIME * THROW_CURVE_EXPONENT;
                    if (Math.abs(param2) < Math.abs(_loc14_)) {
                        param2 = _loc14_;
                        _loc13_ = THROW_SETTLE_TIME;
                    }
                }
                if ((_loc15_ = Math.round(param3 - param2 / THROW_CURVE_EXPONENT * _loc13_)) < param4 || _loc15_ > param5) {
                    _loc16_ = _loc15_ < param4 ? param4 : param5;
                    _loc17_ = _loc13_ * (1 - Math.pow(1 - (_loc16_ - param3) / (_loc15_ - param3), 1 / THROW_CURVE_EXPONENT));
                    _loc9_ = this.addKeyframe(_loc7_, _loc9_ + _loc17_, _loc16_, new PartialExponentialCurve(THROW_CURVE_EXPONENT, _loc17_ / _loc13_));
                    if (_loc15_ < param4) {
                        param3 = param4 - 1;
                    }
                    if (_loc15_ > param5) {
                        param3 = param5 + 1;
                    }
                    _loc18_ = _loc17_ / _loc13_;
                    param2 = -(_loc19_ = 3 * Math.pow(_loc18_, 2) - 6 * _loc18_ + 3) * (_loc15_ - param3) / _loc13_;
                } else {
                    if (this.mx_internal::finalPositionFilterFunction != null) {
                        _loc15_ = this.mx_internal::finalPositionFilterFunction(_loc15_, param1);
                    }
                    _loc20_ = 0.62;
                    _loc9_ = this.addKeyframe(_loc7_, _loc9_ + _loc13_ * _loc20_, _loc15_, new PartialExponentialCurve(THROW_CURVE_EXPONENT, _loc20_));
                    param2 = 0;
                }
            }
        }
        return _loc7_;
    }
}
}

import spark.effects.easing.EaseInOutBase;

class PartialExponentialCurve extends EaseInOutBase {


    private var _xscale: Number;

    private var _ymult: Number;

    private var _exponent: Number;

    function PartialExponentialCurve(param1: Number, param2: Number) {
        super(0);
        this._exponent = param1;
        this._xscale = param2;
        this._ymult = 1 / (1 - Math.pow(1 - Number(this._xscale), this._exponent));
    }

    override protected function easeOut(param1: Number): Number {
        return Number(this._ymult) * (1 - Math.pow(1 - param1 * Number(this._xscale), this._exponent));
    }
}
