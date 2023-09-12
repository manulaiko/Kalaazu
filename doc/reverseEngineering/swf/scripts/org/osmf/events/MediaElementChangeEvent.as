package org.osmf.events {

import flash.events.Event;

public class MediaElementChangeEvent extends Event {

    public static const MEDIA_ELEMENT_CHANGE: String = "mediaElementChange";


    public function MediaElementChangeEvent(param1: String, param2: Boolean = false, param3: Boolean = false) {
        super(param1, param2, param3);
    }

    override public function clone(): Event {
        return new MediaElementChangeEvent(type, bubbles, cancelable);
    }
}
}
