package package_28 {

import flash.utils.ByteArray;

public class class_303 {

    private static const const_3313: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";

    public static const version: String = "1.1.0";


    public function class_303() {
        super();
        throw new Error("Base64 class is static container only");
    }

    public static function encode(param1: String): String {
        var _loc2_: ByteArray = new ByteArray();
        _loc2_.writeUTFBytes(param1);
        return method_816(_loc2_);
    }

    public static function method_816(param1: ByteArray): String {
        var _loc3_: * = null;
        var _loc5_: Number = 0;
        var _loc6_: * = 0;
        var _loc7_: Number = 0;
        var _loc2_: String = "";
        var _loc4_: Array = new Array(4);
        param1.position = 0;
        while (param1.bytesAvailable > 0) {
            _loc3_ = new Array();
            _loc5_ = 0;
            while (_loc5_ < 3 && param1.bytesAvailable > 0) {
                _loc3_[_loc5_] = param1.readUnsignedByte();
                _loc5_++;
            }
            _loc4_[0] = (Number(_loc3_[0]) & 252) >> 2;
            _loc4_[1] = (Number(_loc3_[0]) & 3) << 4 | Number(_loc3_[1]) >> 4;
            _loc4_[2] = (Number(_loc3_[1]) & 15) << 2 | Number(_loc3_[2]) >> 6;
            _loc4_[3] = Number(_loc3_[2]) & 63;
            _loc6_ = _loc3_.length;
            while (_loc6_ < 3) {
                _loc4_[_loc6_ + 1] = 64;
                _loc6_++;
            }
            _loc7_ = 0;
            while (_loc7_ < _loc4_.length) {
                _loc2_ += const_3313.charAt(_loc4_[_loc7_]);
                _loc7_++;
            }
        }
        return _loc2_;
    }

    public static function decode(param1: String): String {
        var _loc2_: ByteArray = method_136(param1);
        return _loc2_.readUTFBytes(_loc2_.length);
    }

    public static function method_136(param1: String): ByteArray {
        var _loc6_: Number = 0;
        var _loc7_: Number = 0;
        var _loc2_: ByteArray = new ByteArray();
        var _loc3_: Array = new Array(4);
        var _loc4_: Array = new Array(3);
        var _loc5_: * = 0;
        while (_loc5_ < param1.length) {
            _loc6_ = 0;
            while (_loc6_ < 4 && _loc5_ + _loc6_ < param1.length) {
                _loc3_[_loc6_] = const_3313.indexOf(param1.charAt(_loc5_ + _loc6_));
                _loc6_++;
            }
            _loc4_[0] = (Number(_loc3_[0]) << 2) + ((Number(_loc3_[1]) & 48) >> 4);
            _loc4_[1] = ((Number(_loc3_[1]) & 15) << 4) + ((Number(_loc3_[2]) & 60) >> 2);
            _loc4_[2] = ((Number(_loc3_[2]) & 3) << 6) + _loc3_[3];
            _loc7_ = 0;
            while (_loc7_ < _loc4_.length) {
                if (_loc3_[_loc7_ + 1] == 64) {
                    break;
                }
                _loc2_.writeByte(_loc4_[_loc7_]);
                _loc7_++;
            }
            _loc5_ += 4;
        }
        _loc2_.position = 0;
        return _loc2_;
    }
}
}
