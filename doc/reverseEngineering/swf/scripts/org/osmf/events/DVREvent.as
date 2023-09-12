package org.osmf.events {

import flash.events.Event;

public class DVREvent extends Event {

    public static const IS_RECORDING_CHANGE: String = "isRecordingChange";


    public function DVREvent(param1: String, param2: Boolean = false, param3: Boolean = false) {
        super(param1, param2, param3);
    }
}
}
