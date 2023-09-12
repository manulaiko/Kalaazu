package org.osmf.net.httpstreaming.f4f {

import flash.errors.IllegalOperationError;
import flash.events.EventDispatcher;
import flash.utils.ByteArray;

class BoxParser extends EventDispatcher {

    private static const FULL_BOX_FIELD_FLAGS_LENGTH: uint = 3;

    private static const AFRA_MASK_LONG_ID: uint = 128;

    private static const AFRA_MASK_LONG_OFFSET: uint = 64;

    private static const AFRA_MASK_GLOBAL_ENTRIES: uint = 32;


    private var _ba: ByteArray;

    function BoxParser() {
        super();
        this._ba = null;
    }

    public function init(param1: ByteArray): void {
        this._ba = param1;
        this._ba.position = 0;
    }

    public function getNextBoxInfo(): BoxInfo {
        if (this._ba == null || this._ba.bytesAvailable < NaN) {
            return null;
        }
        var _loc1_: Number = this._ba.readUnsignedInt();
        var _loc2_: String = this._ba.readUTFBytes(F4FConstants.FIELD_TYPE_LENGTH);
        return new BoxInfo(_loc1_, _loc2_);
    }

    public function getBoxes(): Vector.<Box> {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc1_: Vector.<Box> = new Vector.<Box>();
        var _loc2_: BoxInfo = this.getNextBoxInfo();
        while (_loc2_ != null) {
            if (_loc2_.type == F4FConstants.BOX_TYPE_ABST) {
                _loc3_ = new AdobeBootstrapBox();
                this.parseAdobeBootstrapBox(_loc2_, _loc3_);
                _loc1_.push(_loc3_);
            } else if (_loc2_.type == F4FConstants.BOX_TYPE_AFRA) {
                _loc4_ = new AdobeFragmentRandomAccessBox();
                this.parseAdobeFragmentRandomAccessBox(_loc2_, _loc4_);
                _loc1_.push(_loc4_);
            } else if (_loc2_.type == F4FConstants.BOX_TYPE_MDAT) {
                _loc5_ = new MediaDataBox();
                this.parseMediaDataBox(_loc2_, _loc5_);
                _loc1_.push(_loc5_);
            } else {
                this._ba.position = this._ba.position + _loc2_.size - NaN;
            }
            _loc2_ = this.getNextBoxInfo();
            if (_loc2_ != null && _loc2_.size <= 0) {
                break;
            }
        }
        return _loc1_;
    }

    public function readFragmentRandomAccessBox(param1: BoxInfo): AdobeFragmentRandomAccessBox {
        var _loc2_: AdobeFragmentRandomAccessBox = new AdobeFragmentRandomAccessBox();
        this.parseAdobeFragmentRandomAccessBox(param1, _loc2_);
        return _loc2_;
    }

    public function readAdobeBootstrapBox(param1: BoxInfo): AdobeBootstrapBox {
        var _loc2_: AdobeBootstrapBox = new AdobeBootstrapBox();
        this.parseAdobeBootstrapBox(param1, _loc2_);
        return _loc2_;
    }

    function readLongUIntToNumber(): Number {
        if (this._ba == null || this._ba.bytesAvailable < 8) {
            throw new IllegalOperationError("not enough length for readLongUIntToNumer");
        }
        var _loc1_: Number = this._ba.readUnsignedInt();
        _loc1_ *= 4294967296;
        return _loc1_ + this._ba.readUnsignedInt();
    }

    private function readUnsignedInt(): uint {
        if (this._ba == null || this._ba.bytesAvailable < 4) {
            throw new IllegalOperationError("not enough length for readUnsignedInt");
        }
        return this._ba.readUnsignedInt();
    }

    private function readBytes(param1: ByteArray, param2: uint = 0, param3: uint = 0): void {
        if (this._ba == null || this._ba.bytesAvailable < param3) {
            throw new IllegalOperationError("not enough length for readBytes: " + param3);
        }
        return this._ba.readBytes(param1, param2, param3);
    }

    private function readUnsignedByte(): uint {
        if (this._ba == null || this._ba.bytesAvailable < 1) {
            throw new IllegalOperationError("not enough length for readUnsingedByte");
        }
        return this._ba.readUnsignedByte();
    }

    private function readBytesToUint(param1: uint): uint {
        var _loc4_: * = 0;
        if (this._ba == null || this._ba.bytesAvailable < param1) {
            throw new IllegalOperationError("not enough length for readUnsingedByte");
        }
        if (param1 > 4) {
            throw new IllegalOperationError("number of bytes to read must be equal or less than 4");
        }
        var _loc2_: * = 0;
        var _loc3_: Number = 0;
        while (_loc3_ < param1) {
            _loc2_ <<= 8;
            _loc4_ = this._ba.readUnsignedByte();
            _loc2_ += _loc4_;
            _loc3_++;
        }
        return _loc2_;
    }

    private function readString(): String {
        var _loc3_: * = 0;
        var _loc1_: uint = this._ba.position;
        while (this._ba.position < this._ba.length) {
            _loc3_ = this._ba.readByte();
            if (_loc3_ == 0) {
                break;
            }
        }
        var _loc2_: uint = this._ba.position - _loc1_;
        this._ba.position = _loc1_;
        return this._ba.readUTFBytes(_loc2_);
    }

    private function parseBox(param1: BoxInfo, param2: Box): void {
        var _loc5_: * = null;
        var _loc3_: Number = param1.size;
        var _loc4_: * = 0;
        if (param1.size == F4FConstants.FLAG_USE_LARGE_SIZE) {
            _loc3_ = this.readLongUIntToNumber();
            _loc4_ += F4FConstants.FIELD_LARGE_SIZE_LENGTH;
        }
        if (param1.type == F4FConstants.EXTENDED_TYPE) {
            _loc5_ = new ByteArray();
            this.readBytes(_loc5_, 0, F4FConstants.FIELD_EXTENDED_TYPE_LENGTH);
            _loc4_ += F4FConstants.FIELD_EXTENDED_TYPE_LENGTH;
        }
        param2.size = _loc3_;
        param2.type = param1.type;
        param2.boxLength = _loc4_;
    }

    private function parseFullBox(param1: BoxInfo, param2: FullBox): void {
        this.parseBox(param1, param2);
        param2.version = this.readUnsignedByte();
        param2.flags = this.readBytesToUint(FULL_BOX_FIELD_FLAGS_LENGTH);
    }

    private function parseAdobeBootstrapBox(param1: BoxInfo, param2: AdobeBootstrapBox): void {
        var _loc13_: * = null;
        var _loc14_: * = null;
        this.parseFullBox(param1, param2);
        param2.bootstrapVersion = this.readUnsignedInt();
        var _loc3_: uint = this.readUnsignedByte();
        param2.profile = _loc3_ >> 6;
        param2.live = (_loc3_ & 32) == 32;
        param2.update = (_loc3_ & 1) == 1;
        param2.timeScale = this.readUnsignedInt();
        param2.currentMediaTime = this.readLongUIntToNumber();
        param2.smpteTimeCodeOffset = this.readLongUIntToNumber();
        param2.movieIdentifier = this.readString();
        var _loc4_: uint = this.readUnsignedByte();
        var _loc5_: Vector.<String> = new Vector.<String>();
        var _loc6_: int = 0;
        while (_loc6_ < _loc4_) {
            _loc5_.push(this.readString());
            _loc6_++;
        }
        param2.serverBaseURLs = _loc5_;
        var _loc7_: uint = this.readUnsignedByte();
        var _loc8_: Vector.<String> = new Vector.<String>();
        _loc6_ = 0;
        while (_loc6_ < _loc7_) {
            _loc8_.push(this.readString());
            _loc6_++;
        }
        param2.qualitySegmentURLModifiers = _loc8_;
        param2.drmData = this.readString();
        param2.metadata = this.readString();
        var _loc9_: uint = this.readUnsignedByte();
        var _loc10_: Vector.<AdobeSegmentRunTable> = new Vector.<AdobeSegmentRunTable>();
        _loc6_ = 0;
        while (_loc6_ < _loc9_) {
            param1 = this.getNextBoxInfo();
            if (param1.type != F4FConstants.BOX_TYPE_ASRT) {
                throw new IllegalOperationError("Unexpected data structure: " + param1.type);
            }
            _loc13_ = new AdobeSegmentRunTable();
            this.parseAdobeSegmentRunTable(param1, _loc13_);
            _loc10_.push(_loc13_);
            _loc6_++;
        }
        param2.segmentRunTables = _loc10_;
        var _loc11_: uint = this.readUnsignedByte();
        var _loc12_: Vector.<AdobeFragmentRunTable> = new Vector.<AdobeFragmentRunTable>();
        _loc6_ = 0;
        while (_loc6_ < _loc11_) {
            param1 = this.getNextBoxInfo();
            if (param1.type != F4FConstants.BOX_TYPE_AFRT) {
                throw new IllegalOperationError("Unexpected data structure: " + param1.type);
            }
            _loc14_ = new AdobeFragmentRunTable();
            this.parseAdobeFragmentRunTable(param1, _loc14_);
            _loc12_.push(_loc14_);
            _loc6_++;
        }
        param2.fragmentRunTables = _loc12_;
    }

    private function parseAdobeSegmentRunTable(param1: BoxInfo, param2: AdobeSegmentRunTable): void {
        this.parseFullBox(param1, param2);
        var _loc3_: uint = this.readUnsignedByte();
        var _loc4_: Vector.<String> = new Vector.<String>();
        var _loc5_: Number = 0;
        while (_loc5_ < _loc3_) {
            _loc4_.push(this.readString());
            _loc5_++;
        }
        param2.qualitySegmentURLModifiers = _loc4_;
        var _loc6_: uint = this.readUnsignedInt();
        _loc5_ = 0;
        while (_loc5_ < _loc6_) {
            param2.addSegmentFragmentPair(new SegmentFragmentPair(this.readUnsignedInt(), this.readUnsignedInt()));
            _loc5_++;
        }
    }

    private function parseAdobeFragmentRunTable(param1: BoxInfo, param2: AdobeFragmentRunTable): void {
        var _loc7_: * = null;
        this.parseFullBox(param1, param2);
        param2.timeScale = this.readUnsignedInt();
        var _loc3_: uint = this.readUnsignedByte();
        var _loc4_: Vector.<String> = new Vector.<String>();
        var _loc5_: Number = 0;
        while (_loc5_ < _loc3_) {
            _loc4_.push(this.readString());
            _loc5_++;
        }
        param2.qualitySegmentURLModifiers = _loc4_;
        var _loc6_: uint = this.readUnsignedInt();
        _loc5_ = 0;
        while (_loc5_ < _loc6_) {
            _loc7_ = new FragmentDurationPair();
            this.parseFragmentDurationPair(_loc7_);
            param2.addFragmentDurationPair(_loc7_);
            _loc5_++;
        }
    }

    private function parseFragmentDurationPair(param1: FragmentDurationPair): void {
        param1.firstFragment = this.readUnsignedInt();
        param1.durationAccrued = this.readLongUIntToNumber();
        param1.duration = this.readUnsignedInt();
        if (param1.duration == 0) {
            param1.discontinuityIndicator = this.readUnsignedByte();
        }
    }

    private function parseAdobeFragmentRandomAccessBox(param1: BoxInfo, param2: AdobeFragmentRandomAccessBox): void {
        var _loc11_: * = null;
        var _loc12_: * = null;
        this.parseFullBox(param1, param2);
        var _loc3_: uint = this.readBytesToUint(1);
        var _loc4_: * = (_loc3_ & AFRA_MASK_LONG_ID) > 0;
        var _loc5_: * = (_loc3_ & AFRA_MASK_LONG_OFFSET) > 0;
        var _loc6_: * = (_loc3_ & AFRA_MASK_GLOBAL_ENTRIES) > 0;
        param2.timeScale = this.readUnsignedInt();
        var _loc7_: uint = this.readUnsignedInt();
        var _loc8_: Vector.<LocalRandomAccessEntry> = new Vector.<LocalRandomAccessEntry>();
        var _loc9_: Number = 0;
        while (_loc9_ < _loc7_) {
            _loc11_ = new LocalRandomAccessEntry();
            this.parseLocalRandomAccessEntry(_loc11_, _loc5_);
            _loc8_.push(_loc11_);
            _loc9_++;
        }
        param2.localRandomAccessEntries = _loc8_;
        var _loc10_: Vector.<GlobalRandomAccessEntry> = new Vector.<GlobalRandomAccessEntry>();
        if (_loc6_) {
            _loc7_ = this.readUnsignedInt();
            _loc9_ = 0;
            while (_loc9_ < _loc7_) {
                _loc12_ = new GlobalRandomAccessEntry();
                this.parseGlobalRandomAccessEntry(_loc12_, _loc4_, _loc5_);
                _loc10_.push(_loc12_);
                _loc9_++;
            }
        }
        param2.globalRandomAccessEntries = _loc10_;
    }

    private function parseLocalRandomAccessEntry(param1: LocalRandomAccessEntry, param2: Boolean): void {
        param1.time = this.readLongUIntToNumber();
        if (param2) {
            param1.offset = this.readLongUIntToNumber();
        } else {
            param1.offset = this.readUnsignedInt();
        }
    }

    private function parseGlobalRandomAccessEntry(param1: GlobalRandomAccessEntry, param2: Boolean, param3: Boolean): void {
        param1.time = this.readLongUIntToNumber();
        if (param2) {
            param1.segment = this.readUnsignedInt();
            param1.fragment = this.readUnsignedInt();
        } else {
            param1.segment = this.readBytesToUint(2);
            param1.fragment = this.readBytesToUint(2);
        }
        if (param3) {
            param1.afraOffset = this.readLongUIntToNumber();
            param1.offsetFromAfra = this.readLongUIntToNumber();
        } else {
            param1.afraOffset = this.readUnsignedInt();
            param1.offsetFromAfra = this.readUnsignedInt();
        }
    }

    private function parseMediaDataBox(param1: BoxInfo, param2: MediaDataBox): void {
        this.parseBox(param1, param2);
        var _loc3_: ByteArray = new ByteArray();
        this.readBytes(_loc3_, 0, param2.size - param2.boxLength);
        param2.data = _loc3_;
    }
}
}
