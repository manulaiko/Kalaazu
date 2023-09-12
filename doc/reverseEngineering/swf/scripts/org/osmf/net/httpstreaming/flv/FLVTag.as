package org.osmf.net.httpstreaming.flv {

import flash.utils.ByteArray;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

public class FLVTag {

    public static const TAG_TYPE_AUDIO: int = 8;

    public static const TAG_TYPE_VIDEO: int = 9;

    public static const TAG_TYPE_SCRIPTDATAOBJECT: int = 18;

    public static const TAG_FLAG_ENCRYPTED: int = 32;

    public static const TAG_TYPE_ENCRYPTED_AUDIO: int = TAG_TYPE_AUDIO + TAG_FLAG_ENCRYPTED;

    public static const TAG_TYPE_ENCRYPTED_VIDEO: int = TAG_TYPE_VIDEO + TAG_FLAG_ENCRYPTED;

    public static const TAG_TYPE_ENCRYPTED_SCRIPTDATAOBJECT: int = TAG_TYPE_SCRIPTDATAOBJECT + TAG_FLAG_ENCRYPTED;

    static const TAG_HEADER_BYTE_COUNT: int = 11;

    static const PREV_TAG_BYTE_COUNT: int = 4;


    protected var bytes: ByteArray = null;

    public function FLVTag(param1: int) {
        super();
        this.bytes = new ByteArray();
        this.bytes.length = TAG_HEADER_BYTE_COUNT;
        this.bytes[0] = param1;
    }

    public function read(param1: IDataInput): void {
        this.readType(param1);
        this.readRemainingHeader(param1);
        this.readData(param1);
        this.readPrevTag(param1);
    }

    public function readType(param1: IDataInput): void {
        if (param1.bytesAvailable < 1) {
            throw new Error("FLVTag.readType() input too short");
        }
        param1.readBytes(this.bytes, 0, 1);
    }

    public function readRemaining(param1: IDataInput): void {
        this.readRemainingHeader(param1);
        this.readData(param1);
        this.readPrevTag(param1);
    }

    public function readRemainingHeader(param1: IDataInput): void {
        if (param1.bytesAvailable < 10) {
            throw new Error("FLVTag.readHeader() input too short");
        }
        param1.readBytes(this.bytes, 1, TAG_HEADER_BYTE_COUNT - 1);
    }

    public function readData(param1: IDataInput): void {
        if (this.dataSize > 0) {
            if (param1.bytesAvailable < this.dataSize) {
                throw new Error("FLVTag().readData input shorter than dataSize");
            }
            param1.readBytes(this.bytes, TAG_HEADER_BYTE_COUNT, this.dataSize);
        }
    }

    public function readPrevTag(param1: IDataInput): void {
        if (param1.bytesAvailable < 4) {
            throw new Error("FLVTag.readPrevTag() input too short");
        }
        param1.readUnsignedInt();
    }

    public function write(param1: IDataOutput): void {
        param1.writeBytes(this.bytes, 0, TAG_HEADER_BYTE_COUNT + this.dataSize);
        param1.writeUnsignedInt(TAG_HEADER_BYTE_COUNT + this.dataSize);
    }

    public function get tagType(): uint {
        return this.bytes[0];
    }

    public function set tagType(param1: uint): void {
        this.bytes[0] = param1;
    }

    public function get isEncrpted(): Boolean {
        return !!(Number(this.bytes[0]) & TAG_FLAG_ENCRYPTED) ? true : false;
    }

    public function get dataSize(): uint {
        return Number(this.bytes[1]) << 16 | Number(this.bytes[2]) << 8 | Number(this.bytes[3]);
    }

    public function set dataSize(param1: uint): void {
        this.bytes[1] = param1 >> 16 & 255;
        this.bytes[2] = param1 >> 8 & 255;
        this.bytes[3] = param1 & 255;
        this.bytes.length = TAG_HEADER_BYTE_COUNT + param1;
    }

    public function get timestamp(): uint {
        return Number(this.bytes[7]) << 24 | Number(this.bytes[4]) << 16 | Number(this.bytes[5]) << 8 | Number(this.bytes[6]);
    }

    public function set timestamp(param1: uint): void {
        this.bytes[7] = param1 >> 24 & 255;
        this.bytes[4] = param1 >> 16 & 255;
        this.bytes[5] = param1 >> 8 & 255;
        this.bytes[6] = param1 & 255;
    }

    public function get data(): ByteArray {
        var _loc1_: ByteArray = new ByteArray();
        _loc1_.writeBytes(this.bytes, TAG_HEADER_BYTE_COUNT, this.dataSize);
        return _loc1_;
    }

    public function set data(param1: ByteArray): void {
        this.bytes.length = TAG_HEADER_BYTE_COUNT + param1.length;
        this.bytes.position = TAG_HEADER_BYTE_COUNT;
        this.bytes.writeBytes(param1, 0, param1.length);
        this.dataSize = param1.length;
    }
}
}
