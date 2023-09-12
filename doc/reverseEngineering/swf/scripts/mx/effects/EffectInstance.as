package mx.effects {

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import flash.events.TimerEvent;
import flash.utils.Timer;
import flash.utils.getTimer;

import mx.core.UIComponent;
import mx.core.mx_internal;
import mx.effects.effectClasses.PropertyChanges;
import mx.events.EffectEvent;
import mx.events.FlexEvent;
import mx.utils.NameUtil;

public class EffectInstance extends EventDispatcher implements IEffectInstance {

    mx_internal static const VERSION: String = "4.6.0.23201";


    mx_internal var delayTimer: Timer;

    private var delayStartTime: Number = 0;

    private var delayElapsedTime: Number = 0;

    mx_internal var durationExplicitlySet: Boolean = false;

    mx_internal var hideOnEffectEnd: Boolean = false;

    mx_internal var parentCompositeEffectInstance: EffectInstance;

    protected var playCount: int = 0;

    mx_internal var stopRepeat: Boolean = false;

    private var _duration: Number = 500;

    private var _effect: IEffect;

    private var _effectTargetHost: IEffectTargetHost;

    private var _hideFocusRing: Boolean;

    private var _playReversed: Boolean;

    private var _propertyChanges: PropertyChanges;

    private var _repeatCount: int = 0;

    private var _repeatDelay: int = 0;

    private var _startDelay: int = 0;

    private var _suspendBackgroundProcessing: Boolean = false;

    private var _target: Object;

    private var _triggerEvent: Event;

    public function EffectInstance(param1: Object) {
        super();
        this.target = param1;
    }

    mx_internal function get actualDuration(): Number {
        var _loc1_: Number = NaN;
        if (this.repeatCount > 0) {
            _loc1_ = this.duration * this.repeatCount + this.repeatDelay * (this.repeatCount - 1) + this.startDelay;
        }
        return _loc1_;
    }

    public function get className(): String {
        return NameUtil.getUnqualifiedClassName(this);
    }

    public function get duration(): Number {
        if (!this.mx_internal::durationExplicitlySet && Boolean(this.mx_internal::parentCompositeEffectInstance)) {
            return this.mx_internal::parentCompositeEffectInstance.duration;
        }
        return this._duration;
    }

    public function set duration(param1: Number): void {
        this.mx_internal::durationExplicitlySet = true;
        this._duration = param1;
    }

    public function get effect(): IEffect {
        return this._effect;
    }

    public function set effect(param1: IEffect): void {
        this._effect = param1;
    }

    public function get effectTargetHost(): IEffectTargetHost {
        return this._effectTargetHost;
    }

    public function set effectTargetHost(param1: IEffectTargetHost): void {
        this._effectTargetHost = param1;
    }

    public function get hideFocusRing(): Boolean {
        return this._hideFocusRing;
    }

    public function set hideFocusRing(param1: Boolean): void {
        this._hideFocusRing = param1;
    }

    public function get playheadTime(): Number {
        return Math.max(this.playCount - 1, 0) * (this.duration + this.repeatDelay) + (this.mx_internal::playReversed ? 0 : this.startDelay);
    }

    public function set playheadTime(param1: Number): void {
        if (Boolean(this.mx_internal::delayTimer) && this.mx_internal::delayTimer.running) {
            this.mx_internal::delayTimer.reset();
            if (param1 < this.startDelay) {
                this.mx_internal::delayTimer = new Timer(this.startDelay - param1, 1);
                this.delayStartTime = getTimer();
                this.mx_internal::delayTimer.addEventListener(TimerEvent.TIMER, this.delayTimerHandler);
                this.mx_internal::delayTimer.start();
            } else {
                this.playCount = 0;
                this.play();
            }
        }
    }

    mx_internal function get playReversed(): Boolean {
        return this._playReversed;
    }

    mx_internal function set playReversed(param1: Boolean): void {
        this._playReversed = param1;
    }

    public function get propertyChanges(): PropertyChanges {
        return this._propertyChanges;
    }

    public function set propertyChanges(param1: PropertyChanges): void {
        this._propertyChanges = param1;
    }

    public function get repeatCount(): int {
        return this._repeatCount;
    }

    public function set repeatCount(param1: int): void {
        this._repeatCount = param1;
    }

    public function get repeatDelay(): int {
        return this._repeatDelay;
    }

    public function set repeatDelay(param1: int): void {
        this._repeatDelay = param1;
    }

    public function get startDelay(): int {
        return this._startDelay;
    }

    public function set startDelay(param1: int): void {
        this._startDelay = param1;
    }

    public function get suspendBackgroundProcessing(): Boolean {
        return this._suspendBackgroundProcessing;
    }

    public function set suspendBackgroundProcessing(param1: Boolean): void {
        this._suspendBackgroundProcessing = param1;
    }

    public function get target(): Object {
        return this._target;
    }

    public function set target(param1: Object): void {
        this._target = param1;
    }

    public function get triggerEvent(): Event {
        return this._triggerEvent;
    }

    public function set triggerEvent(param1: Event): void {
        this._triggerEvent = param1;
    }

    public function initEffect(param1: Event): void {
        this.triggerEvent = param1;
        switch (param1.type) {
            case "resizeStart":
            case "resizeEnd":
                if (!this.mx_internal::durationExplicitlySet) {
                    this.duration = 250;
                    break;
                }
                break;
            case FlexEvent.HIDE:
                this.target.setVisible(true, true);
                this.mx_internal::hideOnEffectEnd = true;
                this.target.addEventListener(FlexEvent.SHOW, this.mx_internal::eventHandler);
        }
    }

    public function startEffect(): void {
        EffectManager.mx_internal::effectStarted(this);
        if (this.target is UIComponent) {
            UIComponent(this.target).effectStarted(this);
        }
        if (this.startDelay > 0 && !this.mx_internal::playReversed) {
            this.mx_internal::delayTimer = new Timer(this.startDelay, 1);
            this.delayStartTime = getTimer();
            this.mx_internal::delayTimer.addEventListener(TimerEvent.TIMER, this.delayTimerHandler);
            this.mx_internal::delayTimer.start();
        } else {
            this.play();
        }
    }

    public function play(): void {
        ++this.playCount;
        dispatchEvent(new EffectEvent(EffectEvent.EFFECT_START, false, false, this));
        if (Boolean(this.target) && this.target is IEventDispatcher) {
            this.target.dispatchEvent(new EffectEvent(EffectEvent.EFFECT_START, false, false, this));
        }
    }

    public function pause(): void {
        if (this.mx_internal::delayTimer && this.mx_internal::delayTimer.running && !isNaN(this.delayStartTime)) {
            this.mx_internal::delayTimer.stop();
            this.delayElapsedTime = getTimer() - this.delayStartTime;
        }
    }

    public function stop(): void {
        if (this.mx_internal::delayTimer) {
            this.mx_internal::delayTimer.reset();
        }
        this.mx_internal::stopRepeat = true;
        dispatchEvent(new EffectEvent(EffectEvent.EFFECT_STOP, false, false, this));
        if (Boolean(this.target) && this.target is IEventDispatcher) {
            this.target.dispatchEvent(new EffectEvent(EffectEvent.EFFECT_STOP, false, false, this));
        }
        this.finishEffect();
    }

    public function resume(): void {
        if (this.mx_internal::delayTimer && !this.mx_internal::delayTimer.running && !isNaN(this.delayElapsedTime)) {
            this.mx_internal::delayTimer.delay = !this.mx_internal::playReversed ? this.mx_internal::delayTimer.delay - this.delayElapsedTime : this.delayElapsedTime;
            this.delayStartTime = getTimer();
            this.mx_internal::delayTimer.start();
        }
    }

    public function reverse(): void {
        if (this.repeatCount > 0) {
            this.playCount = this.repeatCount - this.playCount + 1;
        }
    }

    public function end(): void {
        if (this.mx_internal::delayTimer) {
            this.mx_internal::delayTimer.reset();
        }
        this.mx_internal::stopRepeat = true;
        this.finishEffect();
    }

    public function finishEffect(): void {
        this.playCount = 0;
        dispatchEvent(new EffectEvent(EffectEvent.EFFECT_END, false, false, this));
        if (Boolean(this.target) && this.target is IEventDispatcher) {
            this.target.dispatchEvent(new EffectEvent(EffectEvent.EFFECT_END, false, false, this));
        }
        if (this.target is UIComponent) {
            UIComponent(this.target).effectFinished(this);
        }
        EffectManager.mx_internal::effectFinished(this);
    }

    public function finishRepeat(): void {
        if (!this.mx_internal::stopRepeat && this.playCount != 0 && (this.playCount < this.repeatCount || this.repeatCount == 0)) {
            if (this.repeatDelay > 0) {
                this.mx_internal::delayTimer = new Timer(this.repeatDelay, 1);
                this.delayStartTime = getTimer();
                this.mx_internal::delayTimer.addEventListener(TimerEvent.TIMER, this.delayTimerHandler);
                this.mx_internal::delayTimer.start();
            } else {
                this.play();
            }
        } else {
            this.finishEffect();
        }
    }

    mx_internal function playWithNoDuration(): void {
        this.duration = 0;
        this.repeatCount = 1;
        this.repeatDelay = 0;
        this.startDelay = 0;
        this.startEffect();
    }

    mx_internal function eventHandler(param1: Event): void {
        if (param1.type == FlexEvent.SHOW && this.mx_internal::hideOnEffectEnd == true) {
            this.mx_internal::hideOnEffectEnd = false;
            param1.target.removeEventListener(FlexEvent.SHOW, this.mx_internal::eventHandler);
        }
    }

    private function delayTimerHandler(param1: TimerEvent): void {
        this.mx_internal::delayTimer.reset();
        this.delayStartTime = NaN;
        this.delayElapsedTime = NaN;
        this.play();
    }
}
}
