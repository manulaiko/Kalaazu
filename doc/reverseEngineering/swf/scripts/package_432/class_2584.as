package package_432 {

public class class_2584 {

    private static const ALPHA_CHAR_CODES: Array = [48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70];


    public function class_2584() {
        super();
    }

    public static function createUID(): String {
        var _loc3_: int = 0;
        var _loc4_: int = 0;
        var _loc1_: Array = new Array(36);
        var _loc2_: int = 0;
        _loc3_ = 0;
        while (_loc3_ < 8) {
            var _loc7_: *;
            _loc1_[_loc7_ = _loc2_++] = ALPHA_CHAR_CODES[Math.floor(Math.random() * 16)];
            _loc3_++;
        }
        _loc3_ = 0;
        while (_loc3_ < 3) {
            _loc1_[_loc7_ = _loc2_++] = 45;
            _loc4_ = 0;
            while (_loc4_ < 4) {
                var _loc8_: *;
                _loc1_[_loc8_ = _loc2_++] = ALPHA_CHAR_CODES[Math.floor(Math.random() * 16)];
                _loc4_++;
            }
            _loc3_++;
        }
        _loc1_[_loc7_ = _loc2_++] = 45;
        var _loc5_: Number = new Date().getTime();
        var _loc6_: String = ("0000000" + _loc5_.toString(16).toUpperCase()).substr(-8);
        _loc3_ = 0;
        while (_loc3_ < 8) {
            _loc1_[_loc8_ = _loc2_++] = _loc6_.charCodeAt(_loc3_);
            _loc3_++;
        }
        _loc3_ = 0;
        while (_loc3_ < 4) {
            _loc1_[_loc8_ = _loc2_++] = ALPHA_CHAR_CODES[Math.floor(Math.random() * 16)];
            _loc3_++;
        }
        return String.fromCharCode.apply(null, _loc1_);
    }

    private static function getDigit(param1: String): uint {
        switch (param1) {
            case "A":
            case "a":
                return 10;
            case "B":
            case "b":
                return 11;
            case "C":
            case "c":
                return 12;
            case "D":
            case "d":
                return 13;
            case "E":
            case "e":
                return 14;
            case "F":
            case "f":
                return 15;
            default:
                return new uint(param1);
        }
    }
}
}
