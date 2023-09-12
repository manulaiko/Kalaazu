package org.osmf.traits {

import org.osmf.events.TimeEvent;

public class TimeTrait extends MediaTraitBase {


    private var _duration: Number;

    private var _currentTime: Number;

    public function TimeTrait(param1: Number = NaN) {
        super(MediaTraitType.TIME);
        this._duration = param1;
    }

    public function get duration(): Number {
        return this._duration;
    }

    public function get currentTime(): Number {
        return this._currentTime;
    }

    protected function durationChangeStart(param1: Number): void {
    }

    protected function durationChangeEnd(param1: Number): void {
        dispatchEvent(new TimeEvent(TimeEvent.DURATION_CHANGE, false, false, this._duration));
    }

    protected function currentTimeChangeStart(param1: Number): void {
    }

    protected function currentTimeChangeEnd(param1: Number): void {
    }

    protected function signalComplete(): void {
        dispatchEvent(new TimeEvent(TimeEvent.COMPLETE));
    }

    protected final function setCurrentTime(param1: Number): void {
        var _loc2_: Number = NaN;
        if (!isNaN(param1)) {
            if (!isNaN(this._duration)) {
                param1 = Math.min(param1, this._duration);
            } else {
                param1 = 0;
            }
        }
        if (this._currentTime != param1 && !(isNaN(this._currentTime) && isNaN(param1))) {
            this.currentTimeChangeStart(param1);
            _loc2_ = this._currentTime;
            this._currentTime = param1;
            this.currentTimeChangeEnd(_loc2_);
            if (this.currentTime == this.duration && this.currentTime > 0) {
                this.signalComplete();
            }
        }
    }

    protected final function setDuration(param1: Number): void {
        var _loc2_: Number = NaN;
        if (this._duration != param1) {
            this.durationChangeStart(param1);
            _loc2_ = this._duration;
            this._duration = param1;
            this.durationChangeEnd(_loc2_);
            if (!isNaN(this._currentTime) && !isNaN(this._duration) && this._currentTime > this._duration) {
                this.setCurrentTime(this.duration);
            }
        }
    }
}
}
