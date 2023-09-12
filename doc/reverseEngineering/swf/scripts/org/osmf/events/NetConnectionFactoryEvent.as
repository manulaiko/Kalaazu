package org.osmf.events {

import flash.events.Event;
import flash.net.NetConnection;

import org.osmf.media.URLResource;

public class NetConnectionFactoryEvent extends Event {

    public static const CREATION_COMPLETE: String = "creationComplete";

    public static const CREATION_ERROR: String = "creationError";


    private var _netConnection: NetConnection;

    private var _resource: URLResource;

    private var _mediaError: MediaError;

    public function NetConnectionFactoryEvent(param1: String, param2: Boolean = false, param3: Boolean = false, param4: NetConnection = null, param5: URLResource = null, param6: MediaError = null) {
        super(param1, param2, param3);
        this._netConnection = param4;
        this._resource = param5;
        this._mediaError = param6;
    }

    public function get netConnection(): NetConnection {
        return this._netConnection;
    }

    public function get resource(): URLResource {
        return this._resource;
    }

    public function get mediaError(): MediaError {
        return this._mediaError;
    }

    override public function clone(): Event {
        return new NetConnectionFactoryEvent(type, bubbles, cancelable, this._netConnection, this._resource, this._mediaError);
    }
}
}
