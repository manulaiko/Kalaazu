package spark.effects.animation {

import flash.utils.getTimer;

class Timeline {

    private static var startTime: int = -1;

    private static var _currentTime: int = -1;


    function Timeline() {
        super();
    }

    public static function pulse(): int {
        if (startTime < 0) {
            startTime = getTimer();
            _currentTime = 0;
            return _currentTime;
        }
        _currentTime = getTimer() - startTime;
        return _currentTime;
    }

    public static function get currentTime(): int {
        var _loc1_: int = 0;
        if (_currentTime < 0) {
            _loc1_ = pulse();
            return pulse();
        }
        return _currentTime;
    }
}
}
