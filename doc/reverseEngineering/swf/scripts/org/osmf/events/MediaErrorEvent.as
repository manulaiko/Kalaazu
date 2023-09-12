package org.osmf.events {

import flash.events.Event;

public class MediaErrorEvent extends Event {

    public static const MEDIA_ERROR: String = "mediaError";


    private var _error: MediaError;

    public function MediaErrorEvent(param1: String, param2: Boolean = false, param3: Boolean = false, param4: MediaError = null) {
        super(param1, param2, param3);
        this._error = param4;
    }

    override public function clone(): Event {
        return new MediaErrorEvent(type, bubbles, cancelable, this.error);
    }

    public function get error(): MediaError {
        return this._error;
    }
}
}
