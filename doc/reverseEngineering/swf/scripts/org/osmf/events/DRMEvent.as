package org.osmf.events {

import flash.events.Event;

public class DRMEvent extends Event {

    public static const DRM_STATE_CHANGE: String = "drmStateChange";


    private var _drmState: String;

    private var _startDate: Date;

    private var _endDate: Date;

    private var _period: Number;

    private var _serverURL: String;

    private var _token: Object;

    private var _mediaError: MediaError;

    public function DRMEvent(param1: String, param2: String, param3: Boolean = false, param4: Boolean = false, param5: Date = null, param6: Date = null, param7: Number = 0, param8: String = null, param9: Object = null, param10: MediaError = null) {
        super(param1, param3, param4);
        this._drmState = param2;
        this._token = param9;
        this._mediaError = param10;
        this._startDate = param5;
        this._endDate = param6;
        this._period = param7;
        this._serverURL = param8;
    }

    public function get token(): Object {
        return this._token;
    }

    public function get mediaError(): MediaError {
        return this._mediaError;
    }

    public function get startDate(): Date {
        return this._startDate;
    }

    public function get endDate(): Date {
        return this._endDate;
    }

    public function get period(): Number {
        return this._period;
    }

    public function get drmState(): String {
        return this._drmState;
    }

    public function get serverURL(): String {
        return this._serverURL;
    }

    override public function clone(): Event {
        return new DRMEvent(type, this._drmState, bubbles, cancelable, this._startDate, this._endDate, this._period, this._serverURL, this._token, this._mediaError);
    }
}
}
