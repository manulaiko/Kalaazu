package org.osmf.net.httpstreaming {

import flash.net.URLRequest;

public class HTTPStreamRequest {


    private var _urlRequest: URLRequest;

    private var _quality: int;

    private var _truncateAt: Number;

    private var _retryAfter: Number;

    private var _unpublishNotify: Boolean;

    public function HTTPStreamRequest(param1: String = null, param2: int = -1, param3: Number = -1, param4: Number = -1, param5: Boolean = false) {
        super();
        if (param1) {
            this._urlRequest = new URLRequest(param1);
        } else {
            this._urlRequest = null;
        }
        this._quality = param2;
        this._truncateAt = param3;
        this._retryAfter = param4;
        this._unpublishNotify = param5;
    }

    public function get urlRequest(): URLRequest {
        return this._urlRequest;
    }

    public function get retryAfter(): Number {
        return this._retryAfter;
    }

    public function get unpublishNotify(): Boolean {
        return this._unpublishNotify;
    }
}
}
