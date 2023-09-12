package org.osmf.net.httpstreaming.f4f {

class FragmentDurationPair {


    private var _firstFragment: uint;

    private var _duration: uint;

    private var _durationAccrued: Number;

    private var _discontinuityIndicator: uint = 0;

    function FragmentDurationPair() {
        super();
    }

    public function get firstFragment(): uint {
        return this._firstFragment;
    }

    public function set firstFragment(param1: uint): void {
        this._firstFragment = param1;
    }

    public function get duration(): uint {
        return this._duration;
    }

    public function set duration(param1: uint): void {
        this._duration = param1;
    }

    public function get durationAccrued(): Number {
        return this._durationAccrued;
    }

    public function set durationAccrued(param1: Number): void {
        this._durationAccrued = param1;
    }

    public function get discontinuityIndicator(): uint {
        return this._discontinuityIndicator;
    }

    public function set discontinuityIndicator(param1: uint): void {
        this._discontinuityIndicator = param1;
    }
}
}
