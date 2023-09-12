package mx.logging {

import flash.events.Event;

import mx.core.mx_internal;

public class LogEvent extends Event {

    mx_internal static const VERSION: String = "4.6.0.23201";

    public static const LOG: String = "log";


    public var level: int;

    public var message: String;

    public function LogEvent(param1: String = "", param2: int = 0) {
        super(LogEvent.LOG, false, false);
        this.message = param1;
        this.level = param2;
    }

    public static function getLevelString(param1: uint): String {
        switch (param1) {
            case LogEventLevel.INFO:
                return "INFO";
            case LogEventLevel.DEBUG:
                return "DEBUG";
            case LogEventLevel.ERROR:
                return "ERROR";
            case LogEventLevel.WARN:
                return "WARN";
            case LogEventLevel.FATAL:
                return "FATAL";
            case LogEventLevel.ALL:
                return "ALL";
            default:
                return "UNKNOWN";
        }
    }

    override public function clone(): Event {
        return new LogEvent(this.message, this.level);
    }
}
}
