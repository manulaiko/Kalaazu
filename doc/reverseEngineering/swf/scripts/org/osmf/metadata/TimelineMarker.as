package org.osmf.metadata {

public class TimelineMarker {


    private var _time: Number;

    private var _duration: Number;

    public function TimelineMarker(param1: Number, param2: Number = NaN) {
        super();
        this._time = param1;
        this._duration = param2;
    }

    public function get time(): Number {
        return this._time;
    }

    public function get duration(): Number {
        return this._duration;
    }
}
}
