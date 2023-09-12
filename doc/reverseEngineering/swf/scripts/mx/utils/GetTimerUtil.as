package mx.utils {

import flash.utils.getTimer;

import mx.core.mx_internal;

public class GetTimerUtil {

    mx_internal static var fakeTimeValue = undefined;


    public function GetTimerUtil() {
        super();
    }

    mx_internal static function getTimer(): int {
        if (mx_internal::fakeTimeValue !== undefined) {
            return mx_internal::fakeTimeValue;
        }
        return getTimer();
    }
}
}
