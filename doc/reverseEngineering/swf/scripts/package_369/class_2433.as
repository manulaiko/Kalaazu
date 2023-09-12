package package_369 {

import flash.display3D.Context3DTextureFormat;
import flash.utils.ByteArray;

public class class_2433 {

    public static const const_1364: int = 0;

    public static const const_100: int = 1;


    public var type: int;

    public var format: String;

    public var width: int;

    public var height: int;

    public var numTextures: int;

    public var data: ByteArray;

    public function class_2433(param1: ByteArray) {
        super();
        param1.position = 0;
        var _loc2_: String = param1.readUTFBytes(3);
        if (_loc2_ != "ATF") {
            throw new Error("ATF parsing error, unknown format " + _loc2_);
        }
        if (param1[6] == 255) {
            param1.position = 12;
        } else {
            param1.position = 6;
        }
        var _loc3_: uint = param1.readUnsignedByte();
        var _loc4_: * = _loc3_ >> 7;
        var _loc5_: * = _loc3_ & 127;
        loop0:
            switch (_loc5_) {
                case 0:
                case 1:
                    this.format = Context3DTextureFormat.BGRA;
                    addr120:
                        switch (_loc4_) {
                            case 0:
                                break loop0;
                            case 1:
                                this.type = class_2433.const_100;
                     §§goto(addr135);
                            default:
                                throw new Error("Invalid ATF type");
                        }
                    break;
                case 2:
                case 3:
                    this.format = Context3DTextureFormat.COMPRESSED;
               §§goto(addr120);
                case 4:
                case 5:
                    this.format = "compressedAlpha";
               §§goto(addr120);
                default:
                    throw new Error("Invalid ATF format");
            }
        this.type = class_2433.const_1364;
        addr135:
            this.width = Math.pow(2, param1.readUnsignedByte());
        this.height = Math.pow(2, param1.readUnsignedByte());
        this.numTextures = param1.readUnsignedByte();
        this.data = param1;
    }
}
}
