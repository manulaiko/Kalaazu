package spark.layouts.supportClasses {

import flash.geom.Rectangle;

import mx.core.ILayoutElement;
import mx.resources.IResourceManager;
import mx.resources.ResourceManager;

public final class LinearLayoutVector {

    public static const VERTICAL: uint = 0;

    public static const HORIZONTAL: uint = 1;

    static const BLOCK_SIZE: uint = 128;

    static const BLOCK_SHIFT: uint = 7;

    static const BLOCK_MASK: uint = 127;


    private const blockTable: Vector.<Block> = new Vector.<Block>(0, false);

    private var pendingRemoves: Vector.<int> = null;

    private var pendingInserts: Vector.<int> = null;

    private var pendingLength: int = -1;

    private var _length: uint = 0;

    private var _defaultMajorSize: Number = 0;

    private var _defaultMinorSize: Number = 0;

    private var _minorSize: Number = 0;

    private var _minMinorSize: Number = 0;

    private var _majorAxis: uint = 0;

    private var _majorAxisOffset: Number = 0;

    private var _gap: Number = 6;

    public function LinearLayoutVector(param1: uint = 0) {
        super();
        this.majorAxis = param1;
    }

    private function get resourceManager(): IResourceManager {
        return ResourceManager.getInstance();
    }

    public function get length(): uint {
        return this.pendingLength == -1 ? this._length : this.pendingLength;
    }

    public function set length(param1: uint): void {
        this.flushPendingChanges();
        this.setLength(param1);
    }

    private function setLength(param1: uint): void {
        var _loc3_: * = 0;
        var _loc4_: int = 0;
        if (param1 < this._length) {
            _loc3_ = param1 >> BLOCK_SHIFT;
            _loc4_ = Math.min(_loc3_ * BLOCK_SIZE + BLOCK_SIZE, this._length) - 1;
            this.clearInterval(param1, _loc4_);
        }
        this._length = param1;
        var _loc2_: uint = (this._length & BLOCK_MASK) == 0 ? 0 : 1;
        this.blockTable.length = (this._length >> BLOCK_SHIFT) + _loc2_;
    }

    public function get defaultMajorSize(): Number {
        return this._defaultMajorSize;
    }

    public function set defaultMajorSize(param1: Number): void {
        this._defaultMajorSize = param1;
    }

    public function get defaultMinorSize(): Number {
        return this._defaultMinorSize;
    }

    public function set defaultMinorSize(param1: Number): void {
        this._defaultMinorSize = param1;
    }

    public function get minorSize(): Number {
        return Math.max(this.defaultMinorSize, this._minorSize);
    }

    public function set minorSize(param1: Number): void {
        this._minorSize = param1;
    }

    public function get minMinorSize(): Number {
        return this._minMinorSize;
    }

    public function set minMinorSize(param1: Number): void {
        this._minMinorSize = param1;
    }

    public function get majorAxis(): uint {
        return this._majorAxis;
    }

    public function set majorAxis(param1: uint): void {
        this._majorAxis = param1;
    }

    public function get majorAxisOffset(): Number {
        return this._majorAxisOffset;
    }

    public function set majorAxisOffset(param1: Number): void {
        this._majorAxisOffset = param1;
    }

    public function get gap(): Number {
        return this._gap;
    }

    public function set gap(param1: Number): void {
        this._gap = param1;
    }

    public function getMajorSize(param1: uint): Number {
        var _loc3_: Number = NaN;
        this.flushPendingChanges();
        var _loc2_: Block = this.blockTable[param1 >> BLOCK_SHIFT];
        if (_loc2_) {
            _loc3_ = _loc2_.sizes[param1 & BLOCK_MASK];
            return isNaN(_loc3_) ? this._defaultMajorSize : _loc3_;
        }
        return this._defaultMajorSize;
    }

    public function setMajorSize(param1: uint, param2: Number): void {
        this.flushPendingChanges();
        if (param1 >= this.length) {
            throw new Error(this.resourceManager.getString("layout", "invalidIndex"));
        }
        var _loc3_: uint = param1 >> BLOCK_SHIFT;
        var _loc4_: Block;
        if (!(_loc4_ = this.blockTable[_loc3_])) {
            _loc4_ = this.blockTable[_loc3_] = new Block();
        }
        var _loc5_: uint = param1 & BLOCK_MASK;
        var _loc7_: Number;
        var _loc6_: Vector.<Number>;
        if ((_loc7_ = (_loc6_ = _loc4_.sizes)[_loc5_]) == param2) {
            return;
        }
        if (isNaN(_loc7_)) {
            --_loc4_.defaultCount;
            _loc4_.sizesSum += param2;
        } else if (isNaN(param2)) {
            _loc4_.defaultCount += 1;
            _loc4_.sizesSum -= _loc7_;
        } else {
            _loc4_.sizesSum += param2 - _loc7_;
        }
        _loc4_.sizes[_loc5_] = param2;
    }

    public function insert(param1: uint): void {
        var _loc2_: int = 0;
        var _loc3_: int = 0;
        if (this.pendingRemoves) {
            this.flushPendingChanges();
        }
        if (this.pendingInserts) {
            _loc2_ = this.pendingInserts.length - 1;
            _loc3_ = this.pendingInserts[_loc2_];
            if (param1 == _loc3_ + 1) {
                this.pendingInserts[_loc2_] = param1;
            } else if (param1 > _loc3_) {
                this.pendingInserts.push(param1);
                this.pendingInserts.push(param1);
            } else {
                this.flushPendingChanges();
            }
        }
        this.pendingLength = Math.max(this.length + 1, param1 + 1);
        if (!this.pendingInserts) {
            this.pendingInserts = new Vector.<int>();
            this.pendingInserts.push(param1);
            this.pendingInserts.push(param1);
        }
    }

    public function remove(param1: uint): void {
        var _loc2_: int = 0;
        var _loc3_: int = 0;
        if (this.pendingInserts) {
            this.flushPendingChanges();
        }
        if (param1 >= this.length) {
            throw new Error(this.resourceManager.getString("layout", "invalidIndex"));
        }
        if (this.pendingRemoves) {
            _loc2_ = this.pendingRemoves.length - 1;
            _loc3_ = this.pendingRemoves[_loc2_];
            if (param1 == _loc3_ - 1) {
                this.pendingRemoves[_loc2_] = param1;
            } else if (param1 < _loc3_) {
                this.pendingRemoves.push(param1);
                this.pendingRemoves.push(param1);
            } else {
                this.flushPendingChanges();
            }
        }
        this.pendingLength = this.pendingLength == -1 ? this.length - 1 : this.pendingLength - 1;
        if (!this.pendingRemoves) {
            this.pendingRemoves = new Vector.<int>();
            this.pendingRemoves.push(param1);
            this.pendingRemoves.push(param1);
        }
    }

    private function isIntervalClear(param1: Block, param2: int, param3: int): Boolean {
        var _loc4_: Vector.<Number> = param1.sizes;
        var _loc5_: int = 0;
        while (_loc5_ < param3) {
            if (!isNaN(_loc4_[param2 + _loc5_])) {
                return true;
            }
            _loc5_++;
        }
        return false;
    }

    private function inBlockCopy(param1: Block, param2: int, param3: Block, param4: int, param5: int): void {
        var _loc6_: * = param2 < param4;
        var _loc7_: int = param2 < param4 ? param4 : param4 + param5 - 1;
        var _loc8_: int = _loc6_ ? param2 : param2 + param5 - 1;
        var _loc9_: int = _loc6_ ? 1 : -1;
        var _loc10_: Vector.<Number> = param1.sizes;
        var _loc11_: Vector.<Number> = !!param3 ? param3.sizes : null;
        var _loc12_: Number = NaN;
        var _loc13_: Number = NaN;
        var _loc14_: Number = 0;
        var _loc15_: int = 0;
        while (param5 > 0) {
            if (_loc11_) {
                _loc13_ = _loc11_[_loc7_];
            }
            _loc12_ = _loc10_[_loc8_];
            if (_loc13_ !== _loc12_) {
                if (isNaN(_loc12_)) {
                    _loc15_--;
                } else {
                    _loc14_ -= _loc12_;
                }
                if (isNaN(_loc13_)) {
                    _loc15_++;
                } else {
                    _loc14_ += _loc13_;
                }
                _loc10_[_loc8_] = _loc13_;
            }
            _loc7_ += _loc9_;
            _loc8_ += _loc9_;
            param5--;
        }
        param1.sizesSum += _loc14_;
        param1.defaultCount += _loc15_;
    }

    private function copyInterval(param1: int, param2: int, param3: int): void {
        var _loc5_: * = 0;
        var _loc6_: * = 0;
        var _loc7_: * = null;
        var _loc8_: * = 0;
        var _loc9_: * = 0;
        var _loc10_: * = null;
        var _loc11_: int = 0;
        var _loc12_: int = 0;
        var _loc13_: int = 0;
        var _loc14_: Boolean = false;
        var _loc4_: * = param1 < param2;
        if (param1 >= param2) {
            param1 += param3 - 1;
            param2 += param3 - 1;
        }
        while (param3 > 0) {
            _loc5_ = param1 >> BLOCK_SHIFT;
            _loc6_ = param1 & BLOCK_MASK;
            _loc7_ = this.blockTable[_loc5_];
            _loc8_ = param2 >> BLOCK_SHIFT;
            _loc9_ = param2 & BLOCK_MASK;
            _loc10_ = this.blockTable[_loc8_];
            if (_loc4_) {
                _loc11_ = Math.min(BLOCK_SIZE - _loc6_, BLOCK_SIZE - _loc9_);
            } else {
                _loc11_ = 1 + Math.min(_loc6_, _loc9_);
            }
            _loc11_ = Math.min(_loc11_, param3);
            _loc12_ = _loc4_ ? _loc6_ : _loc6_ - _loc11_ + 1;
            _loc13_ = _loc4_ ? _loc9_ : _loc9_ - _loc11_ + 1;
            if (_loc10_ && !_loc7_ && this.isIntervalClear(_loc10_, _loc13_, _loc11_)) {
                _loc7_ = new Block();
                this.blockTable[_loc5_] = _loc7_;
            }
            if (_loc7_) {
                this.inBlockCopy(_loc7_, _loc12_, _loc10_, _loc13_, _loc11_);
                if (_loc7_.defaultCount == BLOCK_SIZE) {
                    if ((_loc14_ = _loc4_ ? _loc12_ + _loc11_ == BLOCK_SIZE : _loc12_ == 0) || param3 == _loc11_) {
                        this.blockTable[_loc5_] = null;
                    }
                }
            }
            param1 += _loc4_ ? _loc11_ : -_loc11_;
            param2 += _loc4_ ? _loc11_ : -_loc11_;
            param3 -= _loc11_;
        }
    }

    private function clearInterval(param1: int, param2: int): void {
        var _loc3_: * = 0;
        var _loc4_: * = 0;
        var _loc5_: * = null;
        var _loc6_: int = 0;
        while (param1 <= param2) {
            _loc3_ = param1 >> BLOCK_SHIFT;
            _loc4_ = param1 & BLOCK_MASK;
            _loc5_ = this.blockTable[_loc3_];
            _loc6_ = BLOCK_SIZE - _loc4_;
            _loc6_ = Math.min(_loc6_, param2 - param1 + 1);
            if (_loc5_) {
                if (_loc6_ == BLOCK_SIZE) {
                    this.blockTable[_loc3_] = null;
                } else {
                    this.inBlockCopy(_loc5_, _loc4_, null, 0, _loc6_);
                    if (_loc5_.defaultCount == BLOCK_SIZE) {
                        this.blockTable[_loc3_] = null;
                    }
                }
            }
            param1 += _loc6_;
        }
    }

    private function removeIntervals(param1: Vector.<int>): void {
        var _loc4_: int = 0;
        var _loc5_: int = 0;
        var _loc7_: int = 0;
        var _loc8_: int = 0;
        var _loc2_: int = param1.length;
        if (_loc2_ == 0) {
            return;
        }
        param1.reverse();
        param1.push(this.length);
        var _loc3_: int = param1[0];
        var _loc6_: int = 0;
        do {
            _loc7_ = param1[_loc6_ + 1];
            _loc8_ = param1[_loc6_ + 2];
            _loc6_ += 2;
            _loc4_ = _loc7_ + 1;
            _loc5_ = _loc8_ - _loc4_;
            this.copyInterval(_loc3_, _loc4_, _loc5_);
            _loc3_ += _loc5_;
        }
        while (_loc6_ < _loc2_);

        this.setLength(_loc3_);
    }

    private function insertIntervals(param1: Vector.<int>, param2: int): void {
        var _loc8_: int = 0;
        var _loc9_: int = 0;
        var _loc10_: int = 0;
        var _loc11_: int = 0;
        var _loc12_: int = 0;
        var _loc3_: int = param1.length;
        if (_loc3_ == 0) {
            return;
        }
        var _loc4_: int = this.length;
        this.setLength(param2);
        var _loc5_: int = _loc4_ - 1;
        var _loc6_: int = param2 - 1;
        var _loc7_: int = _loc3_ - 2;
        while (_loc7_ >= 0) {
            _loc8_ = param1[_loc7_];
            _loc9_ = param1[_loc7_ + 1];
            _loc7_ -= 2;
            _loc10_ = _loc9_ + 1;
            _loc11_ = _loc6_ - _loc10_ + 1;
            _loc12_ = _loc5_ - _loc11_ + 1;
            this.copyInterval(_loc10_, _loc12_, _loc11_);
            _loc5_ -= _loc11_;
            _loc6_ = _loc8_ - 1;
            this.clearInterval(_loc8_, _loc9_);
        }
    }

    private function flushPendingChanges(): void {
        var _loc1_: * = null;
        var _loc2_: int = 0;
        if (this.pendingRemoves) {
            _loc1_ = this.pendingRemoves;
            this.pendingRemoves = null;
            this.pendingLength = -1;
            this.removeIntervals(_loc1_);
        } else if (this.pendingInserts) {
            _loc1_ = this.pendingInserts;
            _loc2_ = this.pendingLength;
            this.pendingInserts = null;
            this.pendingLength = -1;
            this.insertIntervals(_loc1_, _loc2_);
        }
    }

    public function start(param1: uint): Number {
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc10_: Number = NaN;
        this.flushPendingChanges();
        if (this._length == 0 || param1 == 0) {
            return this.majorAxisOffset;
        }
        if (param1 >= this._length) {
            throw new Error(this.resourceManager.getString("layout", "invalidIndex"));
        }
        var _loc2_: Number = this.majorAxisOffset;
        var _loc3_: uint = param1 >> BLOCK_SHIFT;
        var _loc4_: int = 0;
        while (_loc4_ < _loc3_) {
            if (_loc8_ = this.blockTable[_loc4_]) {
                _loc2_ += _loc8_.sizesSum + _loc8_.defaultCount * this._defaultMajorSize;
            } else {
                _loc2_ += BLOCK_SIZE * this._defaultMajorSize;
            }
            _loc4_++;
        }
        var _loc5_: Block = this.blockTable[_loc3_];
        var _loc6_: uint = param1 & ~BLOCK_MASK;
        var _loc7_: uint = param1 - _loc6_;
        if (_loc5_) {
            _loc9_ = _loc5_.sizes;
            _loc4_ = 0;
            while (_loc4_ < _loc7_) {
                _loc10_ = _loc9_[_loc4_];
                _loc2_ += isNaN(_loc10_) ? this._defaultMajorSize : _loc10_;
                _loc4_++;
            }
        } else {
            _loc2_ += this._defaultMajorSize * _loc7_;
        }
        return _loc2_ + param1 * this.gap;
    }

    public function end(param1: uint): Number {
        this.flushPendingChanges();
        return this.start(param1) + this.getMajorSize(param1);
    }

    public function indexOf(param1: Number): int {
        this.flushPendingChanges();
        var _loc2_: int = this.indexOfInternal(param1);
        return _loc2_ >= this._length ? -1 : _loc2_;
    }

    private function indexOfInternal(param1: Number): int {
        var _loc7_: Number = NaN;
        var _loc8_: * = null;
        var _loc9_: int = 0;
        var _loc10_: Number = NaN;
        if (this._length == 0 || param1 < 0) {
            return -1;
        }
        var _loc2_: Number = this.majorAxisOffset;
        if (param1 < _loc2_) {
            return 0;
        }
        var _loc3_: * = -1;
        var _loc4_: * = null;
        var _loc5_: Number = this._gap * BLOCK_SIZE;
        var _loc6_: Number = 0;
        while (_loc6_ < this.blockTable.length) {
            _loc4_ = this.blockTable[_loc6_];
            _loc7_ = _loc5_;
            if (_loc4_) {
                _loc7_ += _loc4_.sizesSum + _loc4_.defaultCount * this._defaultMajorSize;
            } else {
                _loc7_ += BLOCK_SIZE * this._defaultMajorSize;
            }
            if (param1 == _loc2_ || param1 >= _loc2_ && param1 < _loc2_ + _loc7_) {
                _loc3_ = _loc6_ << BLOCK_SHIFT;
                break;
            }
            _loc2_ += _loc7_;
            _loc6_++;
        }
        if (_loc3_ == -1 || param1 == _loc2_) {
            return _loc3_;
        }
        if (_loc4_) {
            _loc8_ = _loc4_.sizes;
            _loc9_ = 0;
            while (_loc9_ < BLOCK_SIZE - 1) {
                _loc10_ = _loc8_[_loc9_];
                _loc2_ += this._gap + (isNaN(_loc10_) ? this._defaultMajorSize : _loc10_);
                if (_loc2_ > param1) {
                    return _loc3_ + _loc9_;
                }
                _loc9_++;
            }
            return _loc3_ + BLOCK_SIZE - 1;
        }
        return _loc3_ + Math.floor(Number(param1 - _loc2_) / Number(this._defaultMajorSize + this._gap));
    }

    public function cacheDimensions(param1: uint, param2: ILayoutElement): void {
        var _loc3_: Number = NaN;
        var _loc4_: Number = NaN;
        this.flushPendingChanges();
        if (!param2 || param1 >= this._length) {
            return;
        }
        if (this.majorAxis == VERTICAL) {
            this.setMajorSize(param1, param2.getLayoutBoundsHeight());
            _loc3_ = Math.min(param2.getPreferredBoundsWidth(), param2.getLayoutBoundsWidth());
            this._minorSize = Math.max(this._minorSize, _loc3_);
            this.minMinorSize = Math.max(this.minMinorSize, param2.getMinBoundsWidth());
        } else {
            this.setMajorSize(param1, param2.getLayoutBoundsWidth());
            _loc4_ = Math.min(param2.getPreferredBoundsHeight(), param2.getLayoutBoundsHeight());
            this._minorSize = Math.max(this._minorSize, _loc4_);
            this.minMinorSize = Math.max(this.minMinorSize, param2.getMinBoundsHeight());
        }
    }

    public function getBounds(param1: uint, param2: Rectangle = null): Rectangle {
        this.flushPendingChanges();
        if (!param2) {
            param2 = new Rectangle();
        }
        var _loc3_: Number = this.getMajorSize(param1);
        var _loc4_: Number = this.minorSize;
        if (this.majorAxis == VERTICAL) {
            param2.x = 0;
            param2.y = this.start(param1);
            param2.height = _loc3_;
            param2.width = _loc4_;
        } else {
            param2.x = this.start(param1);
            param2.y = 0;
            param2.height = _loc4_;
            param2.width = _loc3_;
        }
        return param2;
    }

    public function clear(): void {
        this.pendingRemoves = null;
        this.pendingInserts = null;
        this.pendingLength = -1;
        this.length = 0;
        this.minorSize = 0;
        this.minMinorSize = 0;
    }

    public function toString(): String {
        return "LinearLayoutVector{length=" + this._length + " [blocks=" + this.blockTable.length + "]" + " " + (this.majorAxis == VERTICAL ? "VERTICAL" : "HORIZONTAL") + " gap=" + this._gap + " defaultMajorSize=" + this._defaultMajorSize + " pendingRemoves=" + (!!this.pendingRemoves ? this.pendingRemoves.length : 0) + " pendingInserts=" + (!!this.pendingInserts ? this.pendingInserts.length : 0) + "}";
    }
}
}
