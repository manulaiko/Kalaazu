package net.bigpoint.darkorbit.fui.system.utils.threads {

import flash.events.Event;

public class ThreadEvent extends Event {

    public static const TIMEOUT: String = "timeout";


    private var _thread: GreenThread;

    public function ThreadEvent(param1: String, param2: GreenThread = null, param3: Boolean = false, param4: Boolean = false) {
        super(param1, param3, param4);
        this._thread = param2;
    }

    public function get thread(): GreenThread {
        return this._thread;
    }
}
}
