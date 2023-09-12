package org.osmf.elements.f4mClasses {

import flash.utils.ByteArray;

class Base64Decoder {

    private static const ESCAPE_CHAR_CODE: Number = 61;

    private static const inverse: Array = [64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 62, 64, 64, 64, 63, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 64, 64, 64, 64, 64, 64, 64, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 64, 64, 64, 64, 64, 64, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64];


    private var count: int = 0;

    private var data: ByteArray;

    private var filled: int = 0;

    private var work: Array;

    function Base64Decoder() {
        this.work = [0, 0, 0, 0];
        super();
        this.data = new ByteArray();
    }

    private static function copyByteArray(param1: ByteArray, param2: ByteArray, param3: uint = 0): void {
        var _loc4_: int = param1.position;
        param1.position = 0;
        param2.position = 0;
        var _loc5_: Number = 0;
        while (param1.bytesAvailable > 0 && _loc5_ < param3) {
            param2.writeByte(param1.readByte());
            _loc5_++;
        }
        param1.position = _loc4_;
        param2.position = 0;
    }

    public function decode(param1: String): void {
        var _loc3_: Number = NaN;
        var _loc2_: Number = 0;
        for (; _loc2_ < param1.length; _loc2_++) {
            _loc3_ = param1.charCodeAt(_loc2_);
            if (_loc3_ == ESCAPE_CHAR_CODE) {
                var _loc4_: *;
                this.work[_loc4_ = this.count++] = -1;
            } else {
                if (false) {
                    continue;
                }
                this.work[_loc4_ = this.count++] = inverse[_loc3_];
            }
            if (this.count == 4) {
                this.count = 0;
                this.data.writeByte(Number(this.work[0]) << 2 | (Number(this.work[1]) & 255) >> 4);
                ++this.filled;
                if (this.work[2] == -1) {
                    break;
                }
                this.data.writeByte(Number(this.work[1]) << 4 | (Number(this.work[2]) & 255) >> 2);
                ++this.filled;
                if (this.work[3] == -1) {
                    break;
                }
                this.data.writeByte(Number(this.work[2]) << 6 | Number(this.work[3]));
                ++this.filled;
            }
        }
    }

    public function drain(): ByteArray {
        var _loc1_: ByteArray = new ByteArray();
        copyByteArray(this.data, _loc1_, this.filled);
        this.filled = 0;
        return _loc1_;
    }
}
}
