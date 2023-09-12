package org.osmf.events {

import flash.events.Event;
import flash.net.URLRequest;

import org.osmf.net.httpstreaming.flv.FLVTagScriptDataObject;

public class HTTPStreamingIndexHandlerEvent extends Event {

    public static const NOTIFY_INDEX_READY: String = "notifyIndexReady";

    public static const NOTIFY_RATES: String = "notifyRates";

    public static const REQUEST_LOAD_INDEX: String = "requestLoadIndex";

    public static const NOTIFY_ERROR: String = "notifyError";

    public static const NOTIFY_SEGMENT_DURATION: String = "notifySegmentDuration";

    public static const NOTIFY_SCRIPT_DATA: String = "notifyScriptData";


    private var _streamNames: Array;

    private var _rates: Array;

    private var _request: URLRequest;

    private var _requestContext: Object;

    private var _binaryData: Boolean;

    private var _segmentDuration: Number;

    private var _scriptDataObject: FLVTagScriptDataObject;

    private var _scriptDataFirst: Boolean;

    private var _scriptDataImmediate: Boolean;

    private var _live: Boolean;

    private var _offset: Number;

    public function HTTPStreamingIndexHandlerEvent(param1: String, param2: Boolean = false, param3: Boolean = false, param4: Boolean = false, param5: Number = NaN, param6: Array = null, param7: Array = null, param8: URLRequest = null, param9: Object = null, param10: Boolean = true, param11: Number = 0, param12: FLVTagScriptDataObject = null, param13: Boolean = false, param14: Boolean = false) {
        super(param1, param2, param3);
        this._live = param4;
        this._offset = param5;
        this._streamNames = param6;
        this._rates = param7;
        this._request = param8;
        this._requestContext = param9;
        this._binaryData = param10;
        this._segmentDuration = param11;
        this._scriptDataObject = param12;
        this._scriptDataFirst = param13;
        this._scriptDataImmediate = param14;
    }

    public function get live(): Boolean {
        return this._live;
    }

    public function get offset(): Number {
        return this._offset;
    }

    public function get streamNames(): Array {
        return this._streamNames;
    }

    public function get rates(): Array {
        return this._rates;
    }

    public function get request(): URLRequest {
        return this._request;
    }

    public function get requestContext(): Object {
        return this._requestContext;
    }

    public function get binaryData(): Boolean {
        return this._binaryData;
    }

    public function get segmentDuration(): Number {
        return this._segmentDuration;
    }

    public function get scriptDataObject(): FLVTagScriptDataObject {
        return this._scriptDataObject;
    }

    public function get scriptDataFirst(): Boolean {
        return this._scriptDataFirst;
    }

    public function get scriptDataImmediate(): Boolean {
        return this._scriptDataImmediate;
    }

    override public function clone(): Event {
        return new HTTPStreamingIndexHandlerEvent(type, bubbles, cancelable, this.live, this.offset, this.streamNames, this.rates, this.request, this.requestContext, this.binaryData, this.segmentDuration, this.scriptDataObject, this.scriptDataFirst, this.scriptDataImmediate);
    }
}
}
