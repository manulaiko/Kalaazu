package org.osmf.net.httpstreaming.flv {

import flash.utils.ByteArray;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

public class FLVParser {


    private var state: String;

    private var savedBytes: ByteArray;

    private var currentTag: FLVTag = null;

    private var flvHeader: FLVHeader;

    public function FLVParser(param1: Boolean) {
        super();
        this.savedBytes = new ByteArray();
        if (param1) {
            this.state = FLVParserState.FILE_HEADER;
        } else {
            this.state = FLVParserState.TYPE;
        }
    }

    public function flush(param1: IDataOutput): void {
        param1.writeBytes(this.savedBytes);
    }

    public function parse(param1: IDataInput, param2: Boolean, param3: Function): void {
        var _loc5_: * = null;
        var _loc6_: int = 0;
        var _loc4_: Boolean = true;
        while (_loc4_) {
            switch (this.state) {
                case FLVParserState.FILE_HEADER:
                    if ((_loc5_ = this.byteSource(param1, FLVHeader.MIN_FILE_HEADER_BYTE_COUNT)) != null) {
                        this.flvHeader = new FLVHeader();
                        this.flvHeader.readHeader(_loc5_);
                        this.state = FLVParserState.FILE_HEADER_REST;
                    } else {
                        _loc4_ = false;
                    }
                    break;
                case FLVParserState.FILE_HEADER_REST:
                    if ((_loc5_ = this.byteSource(param1, this.flvHeader.restBytesNeeded)) != null) {
                        this.flvHeader.readRest(_loc5_);
                        this.state = FLVParserState.TYPE;
                    } else {
                        _loc4_ = false;
                    }
                    break;
                case FLVParserState.TYPE:
                    if ((_loc5_ = this.byteSource(param1, 1)) != null) {
                        _loc6_ = int(_loc5_.readByte());
                        switch (_loc6_) {
                            case FLVTag.TAG_TYPE_AUDIO:
                            case FLVTag.TAG_TYPE_ENCRYPTED_AUDIO:
                                this.currentTag = new FLVTagAudio(_loc6_);
                                break;
                            case FLVTag.TAG_TYPE_VIDEO:
                            case FLVTag.TAG_TYPE_ENCRYPTED_VIDEO:
                                this.currentTag = new FLVTagVideo(_loc6_);
                                break;
                            case FLVTag.TAG_TYPE_SCRIPTDATAOBJECT:
                            case FLVTag.TAG_TYPE_ENCRYPTED_SCRIPTDATAOBJECT:
                                this.currentTag = new FLVTagScriptDataObject(_loc6_);
                                break;
                            default:
                                this.currentTag = new FLVTag(_loc6_);
                        }
                        this.state = FLVParserState.HEADER;
                    } else {
                        _loc4_ = false;
                    }
                    break;
                case FLVParserState.HEADER:
                    if ((_loc5_ = this.byteSource(param1, -1)) != null) {
                        this.currentTag.readRemainingHeader(_loc5_);
                        if (this.currentTag.dataSize) {
                            this.state = FLVParserState.DATA;
                        } else {
                            this.state = FLVParserState.PREV_TAG;
                        }
                    } else {
                        _loc4_ = false;
                    }
                    break;
                case FLVParserState.DATA:
                    if ((_loc5_ = this.byteSource(param1, this.currentTag.dataSize)) != null) {
                        this.currentTag.readData(_loc5_);
                        this.state = FLVParserState.PREV_TAG;
                    } else {
                        _loc4_ = false;
                    }
                    break;
                case FLVParserState.PREV_TAG:
                    if ((_loc5_ = this.byteSource(param1, FLVTag.PREV_TAG_BYTE_COUNT)) != null) {
                        this.currentTag.readPrevTag(_loc5_);
                        this.state = FLVParserState.TYPE;
                        _loc4_ = param3(this.currentTag);
                    } else {
                        _loc4_ = false;
                    }
                    break;
                default:
                    throw new Error("FLVParser state machine in unknown state");
            }
        }
        if (param2) {
            param1.readBytes(this.savedBytes, this.savedBytes.length);
        }
    }

    private function byteSource(param1: IDataInput, param2: int): IDataInput {
        var _loc3_: int = 0;
        if (this.savedBytes.bytesAvailable + param1.bytesAvailable < param2) {
            return null;
        }
        if (this.savedBytes.bytesAvailable) {
            _loc3_ = param2 - this.savedBytes.bytesAvailable;
            if (_loc3_ > 0) {
                param1.readBytes(this.savedBytes, this.savedBytes.length, _loc3_);
            }
            return this.savedBytes;
        }
        this.savedBytes.length = 0;
        return param1;
    }
}
}
