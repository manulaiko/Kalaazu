package package_292 {

import flash.display.BitmapData;
import flash.net.URLLoaderDataFormat;
import flash.utils.ByteArray;
import flash.utils.Endian;

import package_366.class_2105;

import package_369.class_2117;

public class class_2106 extends class_2105 {

    private static const DXT1: uint = 827611204;

    private static const DXT5: uint = 894720068;


    private var var_4151: Function;

    private var var_2009: ByteArray;

    private var var_1550: int;

    private var var_3067: int;

    private var var_1298: int;

    private var var_2783: int;

    private var _width: int;

    private var _height: int;

    private var _depth: int;

    private var var_3190: int;

    private var var_2821: int;

    public function class_2106() {
        super(URLLoaderDataFormat.BINARY);
    }

    public static function supportsType(param1: String): Boolean {
        return param1.toLowerCase() == "dds";
    }

    public static function supportsData(param1: *): Boolean {
        return false;
    }

    public function get width(): int {
        return this._width;
    }

    public function get height(): int {
        return this._height;
    }

    override protected function method_196(): Boolean {
        if (this.method_5803(_data) == null) {
            parsingFailure = true;
            return const_2361;
        }
        var _loc1_: BitmapData = new BitmapData(this._width, this._height, true, 0);
        _loc1_.setPixels(_loc1_.rect, this.var_2009);
        var _loc2_: class_2117 = new class_2117(_loc1_);
        method_3342(_loc2_);
        return const_2361;
    }

    private function method_5803(param1: ByteArray): ByteArray {
        param1.position = 0;
        param1.endian = Endian.LITTLE_ENDIAN;
        this.readHeader(param1);
        if (!this.method_3742()) {
            return null;
        }
        this.var_2009 = new ByteArray();
        this.var_2009.endian = Endian.LITTLE_ENDIAN;
        this.var_2009.length = Number(this._width) * Number(this._height) * 4;
        this.var_4151(param1);
        this.var_2009.position = 0;
        return this.var_2009;
    }

    private function readHeader(param1: ByteArray): void {
        this.var_1550 = param1.readUnsignedByte();
        this.var_3067 = param1.readUnsignedByte();
        this.var_1298 = param1.readUnsignedByte();
        this.var_2783 = param1.readUnsignedByte();
        param1.readUnsignedInt();
        param1.readUnsignedInt();
        this._height = param1.readUnsignedInt();
        this._width = param1.readUnsignedInt();
        param1.readUnsignedInt();
        this._depth = param1.readUnsignedInt();
        param1.readUnsignedInt();
        param1.readUnsignedInt();
        var _loc2_: int = 0;
        while (_loc2_ < 10) {
            param1.readUnsignedInt();
            _loc2_++;
        }
        param1.readUnsignedInt();
        this.var_3190 = param1.readUnsignedInt();
        this.var_2821 = param1.readUnsignedInt();
        param1.readUnsignedInt();
        param1.readUnsignedInt();
        param1.readUnsignedInt();
        param1.readUnsignedInt();
        param1.readUnsignedInt();
        param1.readUnsignedInt();
        param1.readUnsignedInt();
        param1.readUnsignedInt();
        param1.readUnsignedInt();
        param1.readUnsignedInt();
        if (this._depth == 0) {
            this._depth = 1;
        }
    }

    private function method_3742(): Boolean {
        if (this.var_1550 != 68 || this.var_3067 != 68 || this.var_1298 != 83) {
            return false;
        }
        if (this._width == 0 || this._height == 0) {
            return false;
        }
        if (this.var_3190 != 4) {
            return false;
        }
        if (this.var_2821 == DXT1) {
            this.var_4151 = this.method_2619;
        } else {
            if (this.var_2821 != DXT5) {
                return false;
            }
            this.var_4151 = this.method_2336;
        }
        return true;
    }

    private function method_2619(param1: ByteArray): void {
        var _loc2_: int = 0;
        var _loc8_: int = 0;
        var _loc9_: int = 0;
        var _loc10_: int = 0;
        var _loc11_: int = 0;
        var _loc12_: int = 0;
        var _loc13_: int = 0;
        var _loc14_: int = 0;
        var _loc15_: int = 0;
        var _loc16_: * = 0;
        var _loc17_: * = 0;
        var _loc18_: * = 0;
        var _loc19_: * = 0;
        var _loc20_: * = null;
        var _loc21_: int = 0;
        var _loc3_: Vector.<int> = new Vector.<int>(4, true);
        var _loc4_: Vector.<int> = new Vector.<int>(4, true);
        var _loc5_: Vector.<int> = new Vector.<int>(4, true);
        var _loc6_: Vector.<int> = new Vector.<int>(4, true);
        _loc3_[3] = 255;
        _loc4_[3] = 255;
        _loc5_[3] = 255;
        var _loc7_: int = 0;
        while (_loc7_ < this._depth) {
            _loc8_ = 0;
            while (_loc8_ < this._height) {
                _loc9_ = 0;
                while (_loc9_ < this._width) {
                    _loc10_ = param1.readUnsignedShort();
                    _loc11_ = param1.readUnsignedShort();
                    _loc2_ = param1.readUnsignedInt();
                    this.method_299(_loc10_, _loc3_);
                    this.method_299(_loc11_, _loc4_);
                    if (_loc10_ > _loc11_) {
                        _loc5_[2] = (2 * _loc3_[2] + _loc4_[2] + 1) / 3;
                        _loc5_[1] = (2 * _loc3_[1] + _loc4_[1] + 1) / 3;
                        _loc5_[0] = (2 * _loc3_[0] + _loc4_[0] + 1) / 3;
                        _loc6_[2] = (_loc3_[2] + 2 * _loc4_[2] + 1) / 3;
                        _loc6_[1] = (_loc3_[1] + 2 * _loc4_[1] + 1) / 3;
                        _loc6_[0] = (_loc3_[0] + 2 * _loc4_[0] + 1) / 3;
                        _loc6_[3] = 255;
                    } else {
                        _loc5_[2] = (_loc3_[2] + _loc4_[2]) / 2;
                        _loc5_[1] = (_loc3_[1] + _loc4_[1]) / 2;
                        _loc5_[0] = (_loc3_[0] + _loc4_[0]) / 2;
                        _loc6_[2] = (_loc3_[2] + 2 * _loc4_[2] + 1) / 3;
                        _loc6_[1] = (_loc3_[1] + 2 * _loc4_[1] + 1) / 3;
                        _loc6_[0] = (_loc3_[0] + 2 * _loc4_[0] + 1) / 3;
                        _loc6_[3] = 0;
                    }
                    _loc12_ = 0;
                    _loc13_ = 0;
                    while (_loc13_ < 4) {
                        _loc14_ = 0;
                        while (_loc14_ < 4) {
                            _loc15_ = _loc12_ * 2;
                            _loc16_ = _loc2_ & 3 << _loc12_ * 2;
                            _loc17_ = (_loc2_ & 3 << _loc12_ * 2) >> _loc15_;
                            if (_loc15_ > 0) {
                                _loc18_ = 2147483648 >> _loc15_ - 1;
                                _loc18_ = ~(2147483648 >> _loc15_ - 1);
                            } else {
                                _loc18_ = -1;
                            }
                            _loc19_ = _loc17_ & _loc18_;
                            switch (_loc19_) {
                                case 0:
                                    _loc20_ = _loc3_;
                                    break;
                                case 1:
                                    _loc20_ = _loc4_;
                                    break;
                                case 2:
                                    _loc20_ = _loc5_;
                                    break;
                                case 3:
                                    _loc20_ = _loc6_;
                                    break;
                                default:
                                    throw new Error("DDS Parser2 error");
                            }
                            if (_loc9_ + _loc14_ < this._width && _loc8_ + _loc13_ < this._height) {
                                _loc21_ = _loc7_ * (Number(this._height) * Number(this._width) * 4) + (_loc8_ + _loc13_) * (Number(this._width) * 4) + (_loc9_ + _loc14_) * 4;
                                this.var_2009.position = _loc21_;
                                this.var_2009.writeByte(_loc20_[2]);
                                this.var_2009.writeByte(_loc20_[1]);
                                this.var_2009.writeByte(_loc20_[0]);
                                this.var_2009.writeByte(_loc20_[3]);
                            }
                            _loc12_++;
                            _loc14_++;
                        }
                        _loc13_++;
                    }
                    _loc9_ += 4;
                }
                _loc8_ += 4;
            }
            _loc7_++;
        }
    }

    private function method_299(param1: int, param2: Vector.<int>): void {
        var _loc3_: * = param1 & 31;
        var _loc4_: * = (param1 & 2016) >> 5;
        var _loc5_: * = (param1 & 63488) >> 11;
        var _loc6_: * = (param1 & 63488) >> 11 << 3 | _loc5_ >> 2;
        var _loc7_: * = _loc4_ << 2 | _loc4_ >> 3;
        var _loc8_: * = _loc3_ << 3 | _loc5_ >> 2;
        param2[0] = _loc6_;
        param2[1] = _loc7_;
        param2[2] = _loc8_;
    }

    private function method_2336(param1: ByteArray): void {
        var _loc9_: int = 0;
        var _loc10_: int = 0;
        var _loc11_: int = 0;
        var _loc12_: * = 0;
        var _loc13_: int = 0;
        var _loc14_: int = 0;
        var _loc15_: int = 0;
        var _loc16_: * = 0;
        var _loc17_: int = 0;
        var _loc18_: * = 0;
        var _loc19_: * = 0;
        var _loc20_: * = 0;
        var _loc21_: * = 0;
        var _loc22_: * = null;
        var _loc23_: int = 0;
        var _loc2_: Vector.<int> = new Vector.<int>(8, true);
        var _loc3_: Vector.<int> = new Vector.<int>(6, true);
        var _loc4_: Vector.<int> = new Vector.<int>(4, true);
        var _loc5_: Vector.<int> = new Vector.<int>(4, true);
        var _loc6_: Vector.<int> = new Vector.<int>(4, true);
        var _loc7_: Vector.<int> = new Vector.<int>(4, true);
        var _loc8_: int = 0;
        while (_loc8_ < this._depth) {
            _loc9_ = 0;
            while (_loc9_ < this._height) {
                _loc10_ = 0;
                while (_loc10_ < this._width) {
                    if (_loc9_ >= this._height || _loc10_ >= this._width) {
                        break;
                    }
                    _loc2_[0] = param1.readUnsignedByte();
                    _loc2_[1] = param1.readUnsignedByte();
                    _loc3_[0] = param1.readUnsignedByte();
                    _loc3_[1] = param1.readUnsignedByte();
                    _loc3_[2] = param1.readUnsignedByte();
                    _loc3_[3] = param1.readUnsignedByte();
                    _loc3_[4] = param1.readUnsignedByte();
                    _loc3_[5] = param1.readUnsignedByte();
                    _loc11_ = param1.readUnsignedInt();
                    this.method_6111(_loc11_, _loc4_, _loc5_);
                    _loc12_ = param1.readUnsignedInt();
                    _loc6_[2] = (2 * _loc4_[2] + _loc5_[2] + 1) / 3;
                    _loc6_[1] = (2 * _loc4_[1] + _loc5_[1] + 1) / 3;
                    _loc6_[0] = (2 * _loc4_[0] + _loc5_[0] + 1) / 3;
                    _loc7_[2] = (_loc4_[2] + 2 * _loc5_[2] + 1) / 3;
                    _loc7_[1] = (_loc4_[1] + 2 * _loc5_[1] + 1) / 3;
                    _loc7_[0] = (_loc4_[0] + 2 * _loc5_[0] + 1) / 3;
                    _loc13_ = 0;
                    _loc14_ = 0;
                    _loc15_ = 0;
                    _loc14_ = 0;
                    while (_loc14_ < 4) {
                        _loc15_ = 0;
                        while (_loc15_ < 4) {
                            _loc17_ = _loc13_ * 2;
                            _loc18_ = _loc12_ & 3 << _loc13_ * 2;
                            _loc19_ = (_loc12_ & 3 << _loc13_ * 2) >> _loc17_;
                            if (_loc17_ > 0) {
                                _loc20_ = 2147483648 >> _loc17_ - 1;
                                _loc20_ = ~(2147483648 >> _loc17_ - 1);
                            } else {
                                _loc20_ = -1;
                            }
                            _loc21_ = _loc19_ & _loc20_;
                            switch (_loc21_) {
                                case 0:
                                    _loc22_ = _loc4_;
                                    break;
                                case 1:
                                    _loc22_ = _loc5_;
                                    break;
                                case 2:
                                    _loc22_ = _loc6_;
                                    break;
                                case 3:
                                    _loc22_ = _loc7_;
                                    break;
                                default:
                                    throw new Error("DDS Parser2 error");
                            }
                            if (_loc10_ + _loc15_ < this._width && _loc9_ + _loc14_ < this._height) {
                                _loc23_ = _loc8_ * (Number(this._height) * Number(this._width) * 4) + (_loc9_ + _loc14_) * (Number(this._width) * 4) + (_loc10_ + _loc15_) * 4;
                                this.var_2009.position = _loc23_;
                                this.var_2009.writeByte(_loc22_[2]);
                                this.var_2009.writeByte(_loc22_[1]);
                                this.var_2009.writeByte(_loc22_[0]);
                            }
                            _loc13_++;
                            _loc15_++;
                        }
                        _loc14_++;
                    }
                    if (_loc2_[0] > _loc2_[1]) {
                        _loc2_[2] = (6 * _loc2_[0] + 1 * _loc2_[1] + 3) / 7;
                        _loc2_[3] = (5 * _loc2_[0] + 2 * _loc2_[1] + 3) / 7;
                        _loc2_[4] = (4 * _loc2_[0] + 3 * _loc2_[1] + 3) / 7;
                        _loc2_[5] = (3 * _loc2_[0] + 4 * _loc2_[1] + 3) / 7;
                        _loc2_[6] = (2 * _loc2_[0] + 5 * _loc2_[1] + 3) / 7;
                        _loc2_[7] = (1 * _loc2_[0] + 6 * _loc2_[1] + 3) / 7;
                    } else {
                        _loc2_[2] = (4 * _loc2_[0] + 1 * _loc2_[1] + 2) / 5;
                        _loc2_[3] = (3 * _loc2_[0] + 2 * _loc2_[1] + 2) / 5;
                        _loc2_[4] = (2 * _loc2_[0] + 3 * _loc2_[1] + 2) / 5;
                        _loc2_[5] = (1 * _loc2_[0] + 4 * _loc2_[1] + 2) / 5;
                        _loc2_[6] = 0;
                        _loc2_[7] = 255;
                    }
                    _loc16_ = _loc3_[0] | _loc3_[1] << 8 | _loc3_[2] << 16;
                    _loc14_ = 0;
                    while (_loc14_ < 2) {
                        _loc15_ = 0;
                        while (_loc15_ < 4) {
                            if (_loc10_ + _loc15_ < this._width && _loc9_ + _loc14_ < this._height) {
                                _loc23_ = _loc8_ * (Number(this._height) * Number(this._width) * 4) + (_loc9_ + _loc14_) * (Number(this._width) * 4) + (_loc10_ + _loc15_) * 4 + 3;
                                this.var_2009.position = _loc23_;
                                this.var_2009.writeByte(_loc2_[_loc16_ & 7]);
                            }
                            _loc16_ >>= 3;
                            _loc15_++;
                        }
                        _loc14_++;
                    }
                    _loc16_ = _loc3_[3] | _loc3_[4] << 8 | _loc3_[5] << 16;
                    _loc14_ = 2;
                    while (_loc14_ < 4) {
                        _loc15_ = 0;
                        while (_loc15_ < 4) {
                            if (_loc10_ + _loc15_ < this._width && _loc9_ + _loc14_ < this._height) {
                                _loc23_ = _loc8_ * (Number(this._height) * Number(this._width) * 4) + (_loc9_ + _loc14_) * (Number(this._width) * 4) + (_loc10_ + _loc15_) * 4 + 3;
                                this.var_2009.position = _loc23_;
                                this.var_2009.writeByte(_loc2_[_loc16_ & 7]);
                            }
                            _loc16_ >>= 3;
                            _loc15_++;
                        }
                        _loc14_++;
                    }
                    _loc10_ += 4;
                }
                _loc9_ += 4;
            }
            _loc8_++;
        }
    }

    private function method_6111(param1: int, param2: Vector.<int>, param3: Vector.<int>): void {
        var _loc8_: * = 0;
        var _loc9_: * = 0;
        var _loc10_: * = 0;
        var _loc11_: * = 0;
        var _loc12_: * = 0;
        var _loc13_: * = 0;
        var _loc4_: * = param1 & 255;
        var _loc5_: * = (param1 & 65280) >> 8;
        var _loc6_: * = (param1 & 16711680) >> 16;
        var _loc7_: * = (param1 & 4278190080) >> 24;
        _loc10_ = _loc4_ & 31;
        _loc9_ = (_loc4_ & 224) >> 5 | (_loc5_ & 7) << 3;
        _loc8_ = (_loc5_ & 248) >> 3;
        _loc13_ = _loc6_ & 31;
        _loc12_ = (_loc6_ & 224) >> 5 | (_loc7_ & 7) << 3;
        _loc11_ = (_loc7_ & 248) >> 3;
        param2[0] = _loc8_ << 3 | _loc8_ >> 2;
        param2[1] = _loc9_ << 2 | _loc9_ >> 3;
        param2[2] = _loc10_ << 3 | _loc10_ >> 2;
        param3[0] = _loc11_ << 3 | _loc11_ >> 2;
        param3[1] = _loc12_ << 2 | _loc12_ >> 3;
        param3[2] = _loc13_ << 3 | _loc13_ >> 2;
    }
}
}
