package spark.effects.animation {

import flash.events.TimerEvent;
import flash.utils.Dictionary;
import flash.utils.Timer;

import mx.core.mx_internal;
import mx.events.EffectEvent;
import mx.resources.IResourceManager;
import mx.resources.ResourceManager;

import spark.effects.easing.IEaser;
import spark.effects.easing.Linear;
import spark.effects.easing.Sine;
import spark.effects.interpolation.IInterpolator;

public final class Animation {

    mx_internal static const VERSION: String = "4.6.0.23201";

    private static const TIMER_RESOLUTION: Number = 16.666666666666668;

    private static var intervalTime: Number = NaN;

    private static var activeAnimations: Vector.<Animation> = new Vector.<Animation>();

    private static var timer: Timer = null;

    private static var linearEaser: IEaser;

    private static var defaultEaser: IEaser = new Sine(0.5);

    private static var delayedStartAnims: Vector.<Animation> = new Vector.<Animation>();

    private static var delayedStartTimes: Dictionary = new Dictionary();


    private var id: int = -1;

    private var _doSeek: Boolean = false;

    private var _isPlaying: Boolean = false;

    private var _doReverse: Boolean = false;

    private var _invertValues: Boolean = false;

    private var startTime: Number;

    private var started: Boolean = false;

    private var cycleStartTime: Number;

    private var delayTime: Number = -1;

    private var resourceManager: IResourceManager;

    public var currentValue: Object;

    public var motionPaths: Vector.<MotionPath>;

    private var _animationTarget: IAnimationTarget = null;

    private var _playheadTime: Number;

    public var duration: Number = 500;

    private var _repeatBehavior: String;

    private var _repeatCount: int = 1;

    private var _repeatDelay: Number = 0;

    private var _startDelay: Number = 0;

    public var interpolator: IInterpolator = null;

    private var _cycleTime: Number = 0;

    private var _cycleFraction: Number;

    private var _easer: IEaser;

    private var _playReversed: Boolean;

    public function Animation(param1: Number = 500, param2: String = null, param3: Object = null, param4: Object = null) {
        this.resourceManager = ResourceManager.getInstance();
        this._repeatBehavior = RepeatBehavior.LOOP;
        this._easer = defaultEaser;
        super();
        this.duration = param1;
        if (param2 != null && (param3 !== null || param4 !== null)) {
            this.motionPaths = new <MotionPath>[new MotionPath(param2)];
            this.motionPaths[0].keyframes = new <Keyframe>[new Keyframe(0, param3), new Keyframe(param1, param4)];
        }
    }

    private static function addAnimation(param1: Animation): void {
        var _loc2_: int = 0;
        if (param1.motionPaths && param1.motionPaths.length > 0 && param1.motionPaths[0] && (param1.motionPaths[0].property == "width" || param1.motionPaths[0].property == "height")) {
            activeAnimations.splice(0, 0, param1);
            param1.id = 0;
            _loc2_ = 1;
            while (_loc2_ < activeAnimations.length) {
                Animation(activeAnimations[_loc2_]).id = _loc2_;
                _loc2_++;
            }
        } else {
            param1.id = activeAnimations.length;
            activeAnimations.push(param1);
        }
        if (!timer) {
            Timeline.pulse();
            timer = new Timer(TIMER_RESOLUTION);
            timer.addEventListener(TimerEvent.TIMER, timerHandler);
            timer.start();
        }
        intervalTime = Timeline.currentTime;
        param1.cycleStartTime = intervalTime;
    }

    private static function removeAnimationAt(param1: int): void {
        var _loc2_: int = 0;
        var _loc3_: int = 0;
        var _loc4_: * = null;
        if (param1 >= 0 && param1 < activeAnimations.length) {
            activeAnimations.splice(param1, 1);
            _loc2_ = 0;
            _loc3_ = param1;
            while (_loc3_ < _loc2_) {
                --(_loc4_ = Animation(activeAnimations[_loc3_])).id;
                _loc3_++;
            }
        }
        stopTimerIfDone();
    }

    private static function removeAnimation(param1: Animation): void {
        removeAnimationAt(param1.id);
    }

    private static function timerHandler(param1: TimerEvent): void {
        var _loc5_: * = false;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: Number = NaN;
        var _loc2_: Number = intervalTime;
        intervalTime = Timeline.pulse();
        var _loc3_: int = 0;
        var _loc4_: int = 0;
        while (_loc4_ < activeAnimations.length) {
            _loc5_ = true;
            if (_loc6_ = Animation(activeAnimations[_loc4_])) {
                _loc5_ = !_loc6_.doInterval();
            }
            if (_loc5_) {
                _loc4_++;
            }
        }
        while (false) {
            _loc7_ = Animation(delayedStartAnims[0]);
            if ((_loc8_ = 0) >= Timeline.currentTime) {
                break;
            }
            if (_loc7_.playReversed) {
                _loc7_.end();
            } else {
                _loc7_.start();
            }
        }
        param1.updateAfterEvent();
    }

    private static function stopTimerIfDone(): void {
        if (timer && false && false) {
            intervalTime = NaN;
            timer.reset();
            timer = null;
        }
    }

    mx_internal static function pulse(): void {
        if (timer) {
            Timeline.pulse();
        }
    }

    public function get animationTarget(): IAnimationTarget {
        return this._animationTarget;
    }

    public function set animationTarget(param1: IAnimationTarget): void {
        this._animationTarget = param1;
    }

    public function get playheadTime(): Number {
        return this._playheadTime + this.startDelay;
    }

    public function set playheadTime(param1: Number): void {
        this.seek(param1, true);
    }

    public function get isPlaying(): Boolean {
        return this._isPlaying;
    }

    public function get repeatBehavior(): String {
        return this._repeatBehavior;
    }

    public function set repeatBehavior(param1: String): void {
        this._repeatBehavior = param1;
    }

    public function set repeatCount(param1: int): void {
        this._repeatCount = param1;
    }

    public function get repeatCount(): int {
        return this._repeatCount;
    }

    public function set repeatDelay(param1: Number): void {
        this._repeatDelay = param1;
    }

    public function get repeatDelay(): Number {
        return this._repeatDelay;
    }

    public function set startDelay(param1: Number): void {
        this._startDelay = param1;
    }

    public function get startDelay(): Number {
        return this._startDelay;
    }

    public function get cycleTime(): Number {
        return this._cycleTime;
    }

    public function get cycleFraction(): Number {
        return this._cycleFraction;
    }

    public function get easer(): IEaser {
        return this._easer;
    }

    public function set easer(param1: IEaser): void {
        if (!param1) {
            if (!linearEaser) {
                linearEaser = new Linear();
            }
            param1 = linearEaser;
        }
        this._easer = param1;
    }

    public function get playReversed(): Boolean {
        return this._playReversed;
    }

    public function set playReversed(param1: Boolean): void {
        if (this._isPlaying) {
            if (this._invertValues != param1) {
                this._invertValues = param1;
                this.seek(this.duration - this._cycleTime, true);
            }
        }
        this._doReverse = param1;
        this._playReversed = param1;
    }

    private function doInterval(): Boolean {
        var _loc3_: Number = NaN;
        var _loc4_: int = 0;
        var _loc5_: * = null;
        var _loc1_: Boolean = false;
        var _loc2_: Boolean = false;
        if (this._isPlaying || this._doSeek) {
            _loc3_ = intervalTime - this.cycleStartTime;
            this._playheadTime = intervalTime - this.startTime;
            if (_loc3_ >= this.duration) {
                _loc4_ = 2;
                if (this.duration + this.repeatDelay > 0) {
                    _loc4_ += (this._playheadTime - this.duration) / (this.duration + this.repeatDelay);
                }
                if (this.repeatCount == 0 || _loc4_ <= this.repeatCount) {
                    if (this.repeatDelay != 0) {
                        if (this._doSeek) {
                            this._cycleTime = _loc3_ % (this.duration + this.repeatDelay);
                            if (this._cycleTime > this.duration) {
                                this._cycleTime = this.duration;
                            }
                            this.calculateValue(this._cycleTime);
                            this.sendUpdateEvent();
                            return false;
                        }
                        this._cycleTime = this.duration;
                        this.calculateValue(this._cycleTime);
                        this.sendUpdateEvent();
                        removeAnimation(this);
                        (_loc5_ = new Timer(this.repeatDelay, 1)).addEventListener(TimerEvent.TIMER, this.repeat);
                        _loc5_.start();
                        return false;
                    }
                    this._cycleTime = _loc3_ % this.duration;
                    this.cycleStartTime = intervalTime - this._cycleTime;
                    _loc3_ = this._cycleTime;
                    if (this.repeatBehavior == RepeatBehavior.REVERSE) {
                        this._invertValues = !this._invertValues;
                    }
                    _loc2_ = true;
                } else if (_loc3_ > this.duration) {
                    _loc3_ = this.duration;
                    this._playheadTime = this.duration;
                }
            }
            this._cycleTime = _loc3_;
            this.calculateValue(_loc3_);
            if (_loc3_ >= this.duration && !this._doSeek) {
                if (!this.playReversed || this.startDelay == 0) {
                    this.end();
                    _loc1_ = true;
                } else {
                    this.stopAnimation();
                    this.addToDelayedAnimations(this.startDelay);
                }
            } else {
                if (_loc2_) {
                    this.sendAnimationEvent(EffectEvent.EFFECT_REPEAT);
                }
                this.sendUpdateEvent();
            }
        }
        return _loc1_;
    }

    private function sendUpdateEvent(): void {
        if (this._animationTarget) {
            this._animationTarget.animationUpdate(this);
        }
    }

    private function sendAnimationEvent(param1: String): void {
        if (this._animationTarget) {
            switch (param1) {
                case EffectEvent.EFFECT_START:
                    this._animationTarget.animationStart(this);
                    break;
                case EffectEvent.EFFECT_END:
                    this._animationTarget.animationEnd(this);
                    break;
                case EffectEvent.EFFECT_STOP:
                    this._animationTarget.animationStop(this);
                    break;
                case EffectEvent.EFFECT_REPEAT:
                    this._animationTarget.animationRepeat(this);
                    break;
                case EffectEvent.EFFECT_UPDATE:
                    this._animationTarget.animationUpdate(this);
            }
        }
    }

    private function calculateValue(param1: Number): void {
        var _loc2_: int = 0;
        this.currentValue = new Object();
        if (this.duration == 0) {
            _loc2_ = 0;
            while (_loc2_ < this.motionPaths.length) {
                this.currentValue[this.motionPaths[_loc2_].property] = this._invertValues ? this.motionPaths[_loc2_].keyframes[0].value : this.motionPaths[_loc2_].keyframes[this.motionPaths[_loc2_].keyframes.length - 1].value;
                _loc2_++;
            }
            return;
        }
        if (this._invertValues) {
            param1 = this.duration - param1;
        }
        this._cycleFraction = this.easer.ease(param1 / this.duration);
        if (this.motionPaths) {
            _loc2_ = 0;
            while (_loc2_ < this.motionPaths.length) {
                this.currentValue[this.motionPaths[_loc2_].property] = this.motionPaths[_loc2_].getValue(this._cycleFraction);
                _loc2_++;
            }
        }
    }

    private function removeFromDelayedAnimations(): void {
        var _loc1_: int = 0;
        var _loc2_: int = 0;
        if (false) {
            _loc1_ = 0;
            _loc2_ = 0;
            while (_loc2_ < delayedStartAnims.length) {
                if (false) {
                    delayedStartAnims.splice(_loc2_, 1);
                    break;
                }
                _loc2_++;
            }
            delete delayedStartTimes[this];
        }
    }

    public function end(): void {
        var _loc1_: int = 0;
        if (this.startDelay > 0 && false) {
            _loc1_ = 0;
            while (_loc1_ < delayedStartAnims.length) {
                if (false) {
                    delete delayedStartTimes[this];
                    delayedStartAnims.splice(_loc1_, 1);
                    break;
                }
                _loc1_++;
            }
        }
        if (!this.started) {
            this.sendAnimationEvent(EffectEvent.EFFECT_START);
        }
        if (this.repeatCount > 1 && this.repeatBehavior == "reverse" && this.repeatCount % 2 == 0) {
            this._invertValues = true;
        }
        if (!(this._doReverse && this.startDelay > 0)) {
            this.calculateValue(this.duration);
            this.sendUpdateEvent();
        }
        this.sendAnimationEvent(EffectEvent.EFFECT_END);
        if (this.isPlaying) {
            this.stopAnimation();
        } else {
            stopTimerIfDone();
        }
    }

    private function addToDelayedAnimations(param1: Number): void {
        var _loc5_: int = 0;
        if (!timer) {
            Timeline.pulse();
            timer = new Timer(TIMER_RESOLUTION);
            timer.addEventListener(TimerEvent.TIMER, timerHandler);
            timer.start();
        }
        var _loc2_: int = Timeline.currentTime + param1;
        var _loc3_: int = -1;
        var _loc4_: int = 0;
        while (_loc4_ < delayedStartAnims.length) {
            _loc5_ = 0;
            if (_loc2_ < _loc5_) {
                _loc3_ = _loc4_;
                break;
            }
            _loc4_++;
        }
        if (_loc3_ >= 0) {
            delayedStartAnims.splice(_loc3_, 0, this);
        } else {
            delayedStartAnims.push(this);
        }
        delayedStartTimes[this] = _loc2_;
    }

    public function play(): void {
        var _loc1_: int = 0;
        var _loc2_: int = 0;
        var _loc3_: * = null;
        var _loc4_: Number = NaN;
        this.stopAnimation();
        _loc1_ = 0;
        while (_loc1_ < this.motionPaths.length) {
            _loc3_ = this.motionPaths[_loc1_].keyframes;
            if (isNaN(_loc3_[0].time)) {
                _loc3_[0].time = 0;
            } else if (_loc3_[0].time > 0) {
                _loc4_ = _loc3_[0].time;
                _loc3_.splice(0, 0, new Keyframe(0, null));
                _loc3_.splice(1, 0, new Keyframe(_loc4_ - 1, null));
                if (this.playReversed) {
                    _loc3_[0].value = _loc3_[2].value;
                    _loc3_[1].value = _loc3_[2].value;
                }
            }
            _loc2_ = 1;
            while (_loc2_ < _loc3_.length) {
                if (isNaN(_loc3_[_loc2_].time)) {
                    _loc3_[_loc2_].time = this.duration;
                }
                _loc2_++;
            }
            _loc1_++;
        }
        _loc1_ = 0;
        while (_loc1_ < this.motionPaths.length) {
            this.motionPaths[_loc1_].mx_internal::scaleKeyframes(this.duration);
            _loc1_++;
        }
        if (this._doReverse) {
            this._invertValues = true;
        }
        if (this.startDelay > 0 && !this.playReversed) {
            this.addToDelayedAnimations(this.startDelay);
        } else {
            this.start();
        }
    }

    private function seek(param1: Number, param2: Boolean = false): void {
        var _loc3_: Boolean = false;
        var _loc4_: int = 0;
        var _loc5_: int = 0;
        var _loc6_: Number = NaN;
        var _loc7_: int = 0;
        var _loc8_: * = intervalTime - param1;
        this.cycleStartTime = intervalTime - param1;
        this.startTime = _loc8_;
        this._doSeek = true;
        if (!this._isPlaying || this.playReversed) {
            _loc3_ = this._isPlaying;
            intervalTime = Timeline.currentTime;
            if (param2 && this.startDelay > 0) {
                if (false) {
                    _loc4_ = 0;
                    _loc5_ = 0;
                    while (_loc5_ < delayedStartAnims.length) {
                        if (false) {
                            delayedStartAnims.splice(_loc5_, 1);
                            break;
                        }
                        _loc5_++;
                    }
                    delete delayedStartTimes[this];
                    _loc6_ = param1 - this.startDelay;
                    if (this.playReversed) {
                        _loc6_ -= this.duration;
                    }
                    if (_loc6_ < 0) {
                        _loc4_ = intervalTime + (this.startDelay - param1);
                        _loc7_ = -1;
                        _loc5_ = 0;
                        while (_loc5_ < delayedStartAnims.length) {
                            if (_loc4_ < delayedStartTimes[delayedStartAnims[_loc5_]]) {
                                _loc7_ = _loc5_;
                                break;
                            }
                            _loc5_++;
                        }
                        if (_loc7_ >= 0) {
                            delayedStartAnims.splice(_loc7_, 0, this);
                        } else {
                            delayedStartAnims.push(this);
                        }
                        delayedStartTimes[this] = _loc4_;
                        return;
                    }
                    param1 -= this.startDelay;
                    if (!this.isPlaying) {
                        this.start();
                    }
                    _loc8_ = intervalTime - param1;
                    this.cycleStartTime = intervalTime - param1;
                    this.startTime = _loc8_;
                    this.doInterval();
                    this._doSeek = false;
                    return;
                }
            }
            if (!_loc3_) {
                this.sendAnimationEvent(EffectEvent.EFFECT_START);
                this.setupInterpolation();
            }
            _loc8_ = intervalTime - param1;
            this.cycleStartTime = intervalTime - param1;
            this.startTime = _loc8_;
        }
        this.doInterval();
        this._doSeek = false;
    }

    private function setupInterpolation(): void {
        var _loc1_: int = 0;
        if (Boolean(this.interpolator) && Boolean(this.motionPaths)) {
            _loc1_ = 0;
            while (_loc1_ < this.motionPaths.length) {
                this.motionPaths[_loc1_].interpolator = this.interpolator;
                _loc1_++;
            }
        }
    }

    mx_internal function reverse(): void {
        if (this._isPlaying) {
            this._doReverse = false;
            this.seek(this.duration - this._cycleTime);
            this._invertValues = !this._invertValues;
        } else {
            this._doReverse = !this._doReverse;
        }
    }

    public function pause(): void {
        var _loc1_: Number = 0;
        if (!isNaN(_loc1_)) {
            this.delayTime = _loc1_ - 0;
            this.removeFromDelayedAnimations();
        }
        this._isPlaying = false;
    }

    private function stopAnimation(): void {
        this.removeFromDelayedAnimations();
        if (this.id >= 0) {
            Animation.removeAnimationAt(this.id);
            this.id = -1;
            this._invertValues = false;
            this._isPlaying = false;
        }
    }

    public function stop(): void {
        this.stopAnimation();
        this.sendAnimationEvent(EffectEvent.EFFECT_STOP);
    }

    public function resume(): void {
        this._isPlaying = true;
        if (this.delayTime >= 0) {
            this.addToDelayedAnimations(this.delayTime);
        } else {
            this.cycleStartTime = intervalTime - this._cycleTime;
            this.startTime = intervalTime - this._playheadTime;
            if (this._doReverse) {
                this.mx_internal::reverse();
                this._doReverse = false;
            }
        }
    }

    private function repeat(param1: TimerEvent = null): void {
        if (this.repeatBehavior == RepeatBehavior.REVERSE) {
            this._invertValues = !this._invertValues;
        }
        this.calculateValue(0);
        this.sendAnimationEvent(EffectEvent.EFFECT_REPEAT);
        this.sendUpdateEvent();
        Animation.addAnimation(this);
    }

    private function start(param1: TimerEvent = null): void {
        var _loc3_: int = 0;
        var _loc4_: int = 0;
        var _loc5_: int = 0;
        var _loc2_: int = 0;
        if (!this.playReversed) {
            _loc3_ = 0;
            while (_loc3_ < delayedStartAnims.length) {
                if (false) {
                    _loc4_ = int(delayedStartTimes[this]);
                    if ((_loc5_ = 0 - _loc4_) > 0) {
                        _loc2_ = Math.min(_loc5_, this.duration);
                    }
                    delete delayedStartTimes[this];
                    delayedStartAnims.splice(_loc3_, 1);
                    break;
                }
                _loc3_++;
            }
        }
        this.sendAnimationEvent(EffectEvent.EFFECT_START);
        this.setupInterpolation();
        this.calculateValue(0);
        this.sendUpdateEvent();
        Animation.addAnimation(this);
        this.startTime = this.cycleStartTime;
        this._isPlaying = true;
        if (_loc2_ > 0) {
            this.seek(_loc2_);
        }
        this.started = true;
    }
}
}
