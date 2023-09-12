package spark.components.gridClasses {

import flash.geom.Rectangle;

import mx.collections.IList;
import mx.core.mx_internal;
import mx.events.CollectionEvent;
import mx.events.CollectionEventKind;
import mx.events.PropertyChangeEvent;

public class GridDimensions {

    mx_internal static const VERSION: String = "4.6.0.23201";


    private var rowList: GridRowList;

    private var _columnWidths: Vector.<Number>;

    private var startY: Number = 0;

    private var recentNode: GridRowNode = null;

    private var startY2: Number = 0;

    private var recentNode2: GridRowNode = null;

    private const typicalCellWidths: Vector.<Number> = new Vector.<Number>();

    private const typicalCellHeights: Vector.<Number> = new Vector.<Number>();

    private var maxTypicalCellHeight: Number = NaN;

    private var useMaxTypicalCellHeight: Boolean = true;

    private var _rowCount: int = 0;

    private var _columnCount: int = 0;

    private var _rowGap: Number = 0;

    private var _columnGap: Number = 0;

    private var _defaultRowHeight: Number = NaN;

    public var defaultColumnWidth: Number = 150;

    public var variableRowHeight: Boolean = false;

    private var _minRowHeight: Number = 0;

    private var _maxRowHeight: Number = 10000;

    public function GridDimensions() {
        this.rowList = new GridRowList();
        this._columnWidths = new Vector.<Number>();
        super();
    }

    public static function insertElementsToVector(param1: Vector.<Number>, param2: int, param3: Vector.<Number>): void {
        var _loc7_: int = 0;
        var _loc4_: int = param1.length;
        var _loc5_: int = param3.length;
        param1.length += _loc5_;
        var _loc6_: int = param1.length;
        _loc7_ = _loc4_ - 1;
        while (_loc7_ >= param2) {
            param1[_loc7_ + _loc5_] = param1[_loc7_];
            _loc7_--;
        }
        var _loc8_: int = param2 + param3.length;
        var _loc9_: int = 0;
        _loc7_ = param2;
        while (_loc7_ < _loc8_) {
            param1[_loc7_] = param3[_loc9_++];
            _loc7_++;
        }
    }

    public static function insertValueToVector(param1: Vector.<Number>, param2: int, param3: int, param4: Number): void {
        var _loc5_: int = param1.length;
        param1.length += param3;
        var _loc6_: int = param1.length;
        var _loc7_: int = _loc5_ - 1;
        while (_loc7_ >= param2) {
            param1[_loc7_ + param3] = param1[_loc7_];
            _loc7_--;
        }
        clearVector(param1, param4, param2, param3);
    }

    public static function clearVector(param1: Vector.<Number>, param2: Number, param3: int = 0, param4: int = -1): void {
        var _loc5_: int = param4 == -1 ? param1.length : param3 + param4;
        var _loc6_: int = param3;
        while (_loc6_ < _loc5_) {
            param1[_loc6_] = param2;
            _loc6_++;
        }
    }

    private static function bound(param1: Number, param2: Number, param3: Number): Number {
        if (param1 < param2) {
            param1 = param2;
        } else if (param1 > param3) {
            param1 = param3;
        }
        return param1;
    }

    public function get rowCount(): int {
        return this._rowCount;
    }

    public function set rowCount(param1: int): void {
        if (param1 == this._rowCount) {
            return;
        }
        if (param1 < this._rowCount) {
            this.removeRowsAt(param1, param1 - this._rowCount);
        }
        this._rowCount = param1;
    }

    public function get columnCount(): int {
        return this._columnCount;
    }

    public function set columnCount(param1: int): void {
        this.clearHeights();
        this._columnCount = param1;
        this._columnWidths.length = param1;
        this.typicalCellHeights.length = param1;
        this.typicalCellWidths.length = param1;
        this.rowList.numColumns = param1;
        this.clearTypicalCellWidthsAndHeights();
        clearVector(this._columnWidths, NaN, 0, this._columnCount);
    }

    public function get rowGap(): Number {
        return this._rowGap;
    }

    public function set rowGap(param1: Number): void {
        if (param1 == this._rowGap) {
            return;
        }
        this._rowGap = param1;
        this.recentNode = null;
        this.recentNode2 = null;
    }

    public function get columnGap(): Number {
        return this._columnGap;
    }

    public function set columnGap(param1: Number): void {
        if (param1 == this._columnGap) {
            return;
        }
        this._columnGap = param1;
        this.recentNode = null;
        this.recentNode2 = null;
    }

    public function get defaultRowHeight(): Number {
        return this.useMaxTypicalCellHeight ? this.maxTypicalCellHeight : this._defaultRowHeight;
    }

    public function set defaultRowHeight(param1: Number): void {
        if (param1 == this._defaultRowHeight) {
            return;
        }
        this._defaultRowHeight = bound(param1, this._minRowHeight, this._maxRowHeight);
        this.useMaxTypicalCellHeight = isNaN(this._defaultRowHeight);
        this.recentNode = null;
        this.recentNode2 = null;
    }

    public function get minRowHeight(): Number {
        return this._minRowHeight;
    }

    public function set minRowHeight(param1: Number): void {
        if (param1 == this._minRowHeight) {
            return;
        }
        this._minRowHeight = param1;
        this._defaultRowHeight = Math.max(this._defaultRowHeight, this._minRowHeight);
    }

    public function get maxRowHeight(): Number {
        return this._maxRowHeight;
    }

    public function set maxRowHeight(param1: Number): void {
        if (param1 == this._maxRowHeight) {
            return;
        }
        this._maxRowHeight = param1;
        this._defaultRowHeight = Math.min(this._defaultRowHeight, this._maxRowHeight);
    }

    public function getRowHeight(param1: int): Number {
        var _loc3_: * = null;
        var _loc2_: Number = this.defaultRowHeight;
        if (this.variableRowHeight) {
            _loc3_ = this.rowList.find(param1);
            if (_loc3_) {
                if (_loc3_.fixedHeight >= 0) {
                    _loc2_ = _loc3_.fixedHeight;
                } else if (_loc3_.maxCellHeight >= 0) {
                    _loc2_ = _loc3_.maxCellHeight;
                }
            }
        }
        return !isNaN(_loc2_) ? bound(_loc2_, this.minRowHeight, this.maxRowHeight) : _loc2_;
    }

    public function setRowHeight(param1: int, param2: Number): void {
        if (!this.variableRowHeight) {
            return;
        }
        var _loc3_: GridRowNode = this.rowList.find(param1);
        if (_loc3_) {
            _loc3_.fixedHeight = bound(param2, this.minRowHeight, this.maxRowHeight);
        } else {
            _loc3_ = this.rowList.insert(param1);
            if (_loc3_) {
                _loc3_.fixedHeight = bound(param2, this.minRowHeight, this.maxRowHeight);
            }
        }
    }

    public function getColumnWidth(param1: int): Number {
        var _loc2_: Number = NaN;
        _loc2_ = this._columnWidths[param1];
        if (isNaN(_loc2_)) {
            _loc2_ = this.typicalCellWidths[param1];
        }
        if (isNaN(_loc2_)) {
            _loc2_ = this.defaultColumnWidth;
        }
        return _loc2_;
    }

    public function setColumnWidth(param1: int, param2: Number): void {
        this._columnWidths[param1] = param2;
    }

    public function getCellHeight(param1: int, param2: int): Number {
        var _loc3_: GridRowNode = this.rowList.find(param1);
        if (_loc3_) {
            return _loc3_.getCellHeight(param2);
        }
        return NaN;
    }

    public function setCellHeight(param1: int, param2: int, param3: Number): void {
        if (!this.variableRowHeight) {
            return;
        }
        var _loc4_: GridRowNode = this.rowList.find(param1);
        var _loc5_: Number = this.defaultRowHeight;
        if (_loc4_ == null) {
            _loc4_ = this.rowList.insert(param1);
        } else {
            _loc5_ = _loc4_.maxCellHeight;
        }
        if (Boolean(_loc4_) && _loc4_.setCellHeight(param2, param3)) {
            if (Boolean(this.recentNode) && _loc4_.rowIndex < this.recentNode.rowIndex) {
                this.startY += _loc4_.maxCellHeight - _loc5_;
            }
            if (Boolean(this.recentNode2) && _loc4_.rowIndex < this.recentNode2.rowIndex) {
                this.startY2 += _loc4_.maxCellHeight - _loc5_;
            }
        }
    }

    public function getCellBounds(param1: int, param2: int): Rectangle {
        if (param1 < 0 || param1 >= this.rowCount || param2 < 0 || param2 >= this.columnCount) {
            return null;
        }
        var _loc3_: Number = this.getCellX(param1, param2);
        var _loc4_: Number = this.getCellY(param1, param2);
        var _loc5_: Number = this.getColumnWidth(param2);
        var _loc6_: Number = this.getRowHeight(param1);
        return new Rectangle(_loc3_, _loc4_, _loc5_, _loc6_);
    }

    public function getCellX(param1: int, param2: int): Number {
        var _loc3_: Number = 0;
        var _loc4_: int = 0;
        while (_loc4_ < param2) {
            _loc3_ += this.getColumnWidth(_loc4_) + this.columnGap;
            _loc4_++;
        }
        return _loc3_;
    }

    public function getCellY(param1: int, param2: int): Number {
        var _loc3_: Number = NaN;
        if (!this.variableRowHeight || this.rowList.length == 0) {
            return param1 * (this.defaultRowHeight + this.rowGap);
        }
        if (param1 == 0) {
            return 0;
        }
        if (!this.recentNode2) {
            this.recentNode2 = this.rowList.first;
            this.startY2 = this.recentNode2.rowIndex * (this.defaultRowHeight + this.rowGap);
        }
        var _loc4_: int = this.recentNode2.rowIndex;
        if (param1 == _loc4_) {
            _loc3_ = this.startY2;
        } else if (param1 < _loc4_) {
            _loc3_ = this.getPrevYAt(param1, this.recentNode2, this.startY2);
        } else {
            _loc3_ = this.getNextYAt(param1, this.recentNode2, this.startY2);
        }
        return _loc3_;
    }

    private function getPrevYAt(param1: int, param2: GridRowNode, param3: Number): Number {
        var _loc6_: * = null;
        var _loc8_: int = 0;
        var _loc4_: GridRowNode = param2;
        var _loc5_: Number = param3;
        var _loc7_: Number = param3;
        while (_loc4_) {
            if (_loc4_.rowIndex == param1) {
                break;
            }
            if (!(_loc6_ = _loc4_.prev) || param1 < _loc4_.rowIndex && param1 > _loc6_.rowIndex) {
                _loc8_ = _loc4_.rowIndex - param1;
                _loc7_ -= _loc8_ * (this.defaultRowHeight + this.rowGap);
                break;
            }
            _loc8_ = _loc4_.rowIndex - _loc6_.rowIndex - 1;
            _loc5_ = _loc7_ = _loc7_ - _loc8_ * (this.defaultRowHeight + this.rowGap) - (_loc6_.maxCellHeight + this.rowGap);
            _loc4_ = _loc6_;
        }
        this.recentNode2 = _loc4_;
        this.startY2 = _loc5_;
        return _loc7_;
    }

    private function getNextYAt(param1: int, param2: GridRowNode, param3: Number): Number {
        var _loc6_: * = null;
        var _loc8_: int = 0;
        var _loc4_: GridRowNode = param2;
        var _loc5_: Number = param3;
        var _loc7_: Number = param3;
        while (_loc4_) {
            if (_loc4_.rowIndex == param1) {
                break;
            }
            _loc7_ += _loc4_.maxCellHeight;
            if (_loc4_.rowIndex < this._rowCount - 1) {
                _loc7_ += this.rowGap;
            }
            if (!(_loc6_ = _loc4_.next) || param1 > _loc4_.rowIndex && param1 < _loc6_.rowIndex) {
                _loc8_ = param1 - _loc4_.rowIndex - 1;
                _loc7_ += _loc8_ * (this.defaultRowHeight + this.rowGap);
                break;
            }
            _loc8_ = _loc6_.rowIndex - _loc4_.rowIndex - 1;
            _loc5_ = _loc7_ += _loc8_ * (this.defaultRowHeight + this.rowGap);
            _loc4_ = _loc6_;
        }
        this.recentNode2 = _loc4_;
        this.startY2 = _loc5_;
        return _loc7_;
    }

    public function getRowBounds(param1: int): Rectangle {
        var _loc2_: Number = NaN;
        if (param1 < 0 || param1 >= this._rowCount) {
            return null;
        }
        if (this._columnCount == 0 || this._rowCount == 0) {
            return new Rectangle(0, 0, 0, 0);
        }
        _loc2_ = this.getCellX(param1, 0);
        var _loc3_: Number = this.getCellY(param1, 0);
        var _loc4_: Number = this.getCellX(param1, this._columnCount - 1) + this.getColumnWidth(this._columnCount - 1) - _loc2_;
        var _loc5_: Number = this.getRowHeight(param1);
        return new Rectangle(_loc2_, _loc3_, _loc4_, _loc5_);
    }

    public function getPadRowBounds(param1: int): Rectangle {
        var _loc2_: int = 0;
        var _loc6_: int = 0;
        if (param1 < 0) {
            return null;
        }
        if (param1 < this.rowCount) {
            return this.getRowBounds(param1);
        }
        _loc2_ = this.rowCount - 1;
        var _loc3_: int = this.columnCount - 1;
        var _loc4_: Number = _loc2_ >= 0 ? this.getCellX(_loc2_, 0) : 0;
        var _loc5_: Number = _loc2_ >= 0 ? this.getCellY(_loc2_, 0) + this.getRowHeight(_loc2_) : 0;
        var _loc7_: Number = (_loc6_ = param1 - this.rowCount) > 0 ? (_loc6_ - 1) * this.rowGap : 0;
        var _loc8_: Number = _loc5_ + _loc6_ * this.defaultRowHeight + _loc7_;
        var _loc9_: Number = 0;
        if (_loc3_ >= 0 && _loc2_ >= 0) {
            _loc9_ = this.getCellX(_loc2_, _loc3_) + this.getColumnWidth(_loc3_) - _loc4_;
        } else if (_loc3_ >= 0) {
            _loc9_ = this.getCellX(0, _loc3_) + this.getColumnWidth(_loc3_) - _loc4_;
        } else if (_loc2_ >= 0) {
            _loc9_ = this.getCellX(_loc2_, 0) + this.getColumnWidth(0) - _loc4_;
        }
        return new Rectangle(_loc4_, _loc8_, _loc9_, this.defaultRowHeight);
    }

    public function getColumnBounds(param1: int): Rectangle {
        var _loc3_: Number = NaN;
        if (param1 < 0 || param1 >= this._columnCount) {
            return null;
        }
        if (this._columnCount == 0 || this._rowCount == 0) {
            return new Rectangle(0, 0, 0, 0);
        }
        var _loc2_: Number = this.getCellX(0, param1);
        _loc3_ = this.getCellY(0, param1);
        var _loc4_: Number = this.getColumnWidth(param1);
        var _loc5_: Number = this.getCellY(this._rowCount - 1, param1) + this.getRowHeight(this._rowCount - 1) - _loc3_;
        return new Rectangle(_loc2_, _loc3_, _loc4_, _loc5_);
    }

    public function getRowIndexAt(param1: Number, param2: Number): int {
        var _loc3_: int = 0;
        if (param2 < 0) {
            return -1;
        }
        if (!this.variableRowHeight || this.rowList.length == 0) {
            _loc3_ = param2 / (this.defaultRowHeight + this.rowGap);
            return _loc3_ < this._rowCount ? _loc3_ : -1;
        }
        if (param2 == 0) {
            return this._rowCount > 0 ? 0 : -1;
        }
        if (!this.recentNode) {
            this.recentNode = this.rowList.first;
            this.startY = this.recentNode.rowIndex * (this.defaultRowHeight + this.rowGap);
        }
        if (this.isYInRow(param2, this.startY, this.recentNode)) {
            _loc3_ = this.recentNode.rowIndex;
        } else if (param2 < this.startY) {
            _loc3_ = this.getPrevRowIndexAt(param2, this.recentNode, this.startY);
        } else {
            _loc3_ = this.getNextRowIndexAt(param2, this.recentNode, this.startY);
        }
        return _loc3_ < this._rowCount ? _loc3_ : -1;
    }

    private function isYInRow(param1: Number, param2: Number, param3: GridRowNode): Boolean {
        var _loc4_: Number = param2 + param3.maxCellHeight;
        if (param3.rowIndex != this.rowCount - 1) {
            _loc4_ += this.rowGap;
        }
        if (param1 >= param2 && param1 < _loc4_) {
            return true;
        }
        return false;
    }

    private function getPrevRowIndexAt(param1: Number, param2: GridRowNode, param3: Number): int {
        var _loc8_: Number = NaN;
        var _loc10_: int = 0;
        var _loc4_: GridRowNode = param2;
        var _loc5_: * = null;
        var _loc6_: int = _loc4_.rowIndex;
        var _loc7_: Number = param3;
        var _loc9_: Number = param1;
        while (_loc4_) {
            if (this.isYInRow(_loc9_, _loc7_, _loc4_)) {
                break;
            }
            if (!(_loc5_ = _loc4_.prev)) {
                _loc8_ = 0;
            } else {
                _loc8_ = _loc7_;
                if ((_loc10_ = _loc4_.rowIndex - _loc5_.rowIndex) > 1) {
                    _loc8_ -= (_loc10_ - 1) * (this.defaultRowHeight + this.rowGap);
                }
            }
            if (_loc9_ < _loc7_ && _loc9_ >= _loc8_) {
                _loc6_ -= Math.ceil(Number(_loc7_ - _loc9_) / (this.defaultRowHeight + this.rowGap));
                break;
            }
            _loc7_ = _loc8_ - _loc5_.maxCellHeight - this.rowGap;
            _loc6_ = (_loc4_ = _loc4_.prev).rowIndex;
        }
        this.recentNode = _loc4_;
        this.startY = _loc7_;
        return _loc6_;
    }

    private function getNextRowIndexAt(param1: Number, param2: GridRowNode, param3: Number): int {
        var _loc9_: Number = NaN;
        var _loc11_: int = 0;
        var _loc4_: GridRowNode = param2;
        var _loc5_: * = null;
        var _loc6_: int = _loc4_.rowIndex;
        var _loc7_: Number = param3;
        var _loc8_: Number = param3;
        var _loc10_: Number = param1;
        while (_loc4_) {
            if (this.isYInRow(_loc10_, _loc7_, _loc4_)) {
                break;
            }
            _loc8_ += _loc4_.maxCellHeight;
            if (_loc4_.rowIndex != this.rowCount - 1) {
                _loc8_ += this.rowGap;
            }
            _loc5_ = _loc4_.next;
            _loc9_ = _loc8_;
            if (!_loc5_) {
                _loc11_ = this.rowCount - 1 - _loc4_.rowIndex;
                _loc9_ += _loc11_ * (this.defaultRowHeight + this.rowGap) - this.rowGap + 1;
            } else {
                _loc11_ = _loc5_.rowIndex - _loc4_.rowIndex;
                _loc9_ += (_loc11_ - 1) * (this.defaultRowHeight + this.rowGap);
            }
            if (_loc10_ >= _loc8_ && _loc10_ < _loc9_) {
                _loc6_ += Math.ceil(Number(_loc10_ - _loc8_) / (this.defaultRowHeight + this.rowGap));
                break;
            }
            if (!_loc5_) {
                _loc6_ = -1;
                break;
            }
            _loc7_ = _loc8_ = _loc9_;
            _loc6_ = (_loc4_ = _loc4_.next).rowIndex;
        }
        this.recentNode = _loc4_;
        this.startY = _loc7_;
        return _loc6_;
    }

    public function getColumnIndexAt(param1: Number, param2: Number): int {
        var _loc4_: int = 0;
        var _loc5_: Number = NaN;
        var _loc3_: Number = param1;
        _loc4_ = 0;
        for (; _loc4_ < this._columnCount; _loc4_++) {
            _loc5_ = this._columnWidths[_loc4_];
            if (isNaN(_loc5_)) {
                if ((_loc5_ = this.typicalCellWidths[_loc4_]) == 0) {
                    continue;
                }
            }
            if (isNaN(_loc5_)) {
                _loc5_ = this.defaultColumnWidth;
            }
            _loc3_ -= _loc5_ + this.columnGap;
            if (_loc3_ <= 0) {
                return _loc4_;
            }
        }
        return -1;
    }

    public function getContentWidth(param1: int = -1): Number {
        var _loc4_: Number = NaN;
        var _loc2_: int = param1 == -1 ? this._columnCount : param1;
        var _loc3_: Number = 0;
        var _loc5_: int = 0;
        var _loc6_: int = 0;
        for (; _loc6_ < this._columnCount && _loc5_ < _loc2_; _loc6_++) {
            if (_loc6_ >= this._columnWidths.length) {
                _loc3_ += this.defaultColumnWidth;
                _loc5_++;
            } else {
                _loc4_ = this._columnWidths[_loc6_];
                if (isNaN(_loc4_)) {
                    if ((_loc4_ = this.typicalCellWidths[_loc6_]) == 0) {
                        continue;
                    }
                }
                if (isNaN(_loc4_)) {
                    _loc4_ = this.defaultColumnWidth;
                }
                _loc3_ += _loc4_;
                _loc5_++;
            }
        }
        if (_loc2_ > 1) {
            _loc3_ += (_loc2_ - 1) * this.columnGap;
        }
        return _loc3_;
    }

    public function getContentHeight(param1: int = -1): Number {
        var _loc2_: int = param1 == -1 ? this.rowCount : param1;
        var _loc3_: Number = 0;
        if (_loc2_ > 1) {
            _loc3_ += (_loc2_ - 1) * this.rowGap;
        }
        if (!this.variableRowHeight || this.rowList.length == 0) {
            return _loc3_ + _loc2_ * this.defaultRowHeight;
        }
        var _loc4_: GridRowNode = this.rowList.first;
        var _loc5_: int = 0;
        while (Boolean(_loc4_) && _loc4_.rowIndex < _loc2_) {
            _loc3_ += _loc4_.maxCellHeight;
            _loc5_++;
            _loc4_ = _loc4_.next;
        }
        return _loc3_ + (_loc2_ - _loc5_) * this.defaultRowHeight;
    }

    public function getTypicalContentWidth(param1: int = -1): Number {
        var _loc6_: Number = NaN;
        var _loc2_: int = param1 == -1 ? this._columnCount : param1;
        var _loc3_: Number = 0;
        var _loc4_: int = 0;
        var _loc5_: int = 0;
        while (_loc5_ < this._columnCount && _loc4_ < _loc2_) {
            if ((_loc6_ = _loc5_ < this._columnCount ? this.typicalCellWidths[_loc5_] : NaN) != 0) {
                if (isNaN(_loc6_)) {
                    _loc6_ = this.defaultColumnWidth;
                }
                _loc3_ += _loc6_;
                _loc4_++;
            }
            _loc5_++;
        }
        if (_loc2_ > 1) {
            _loc3_ += (_loc4_ - 1) * this.columnGap;
        }
        return _loc3_;
    }

    public function getTypicalContentHeight(param1: int = -1): Number {
        var _loc2_: int = param1 == -1 ? this.rowCount : param1;
        var _loc3_: Number = 0;
        if (_loc2_ > 1) {
            _loc3_ += (_loc2_ - 1) * this.rowGap;
        }
        if (!isNaN(this.defaultRowHeight)) {
            return _loc3_ + _loc2_ * this.defaultRowHeight;
        }
        return 0;
    }

    public function getTypicalCellWidth(param1: int): Number {
        return this.typicalCellWidths[param1];
    }

    public function setTypicalCellWidth(param1: int, param2: Number): void {
        this.typicalCellWidths[param1] = param2;
    }

    public function getTypicalCellHeight(param1: int): Number {
        return this.typicalCellHeights[param1];
    }

    public function setTypicalCellHeight(param1: int, param2: Number): void {
        this.typicalCellHeights[param1] = param2;
        var _loc3_: Number = 0;
        var _loc4_: int = this.typicalCellHeights.length;
        var _loc5_: int = 0;
        while (_loc5_ < _loc4_) {
            if (!isNaN(this.typicalCellHeights[_loc5_])) {
                _loc3_ = Math.max(_loc3_, this.typicalCellHeights[_loc5_]);
            }
            _loc5_++;
        }
        this.maxTypicalCellHeight = _loc3_;
    }

    public function clearTypicalCellWidthsAndHeights(): void {
        clearVector(this.typicalCellWidths, NaN);
        clearVector(this.typicalCellHeights, NaN);
        this.maxTypicalCellHeight = NaN;
    }

    public function insertRows(param1: int, param2: int): void {
        this.insertRowsAt(param1, param2);
    }

    public function insertColumns(param1: int, param2: int): void {
        var _loc3_: int = this._columnCount;
        var _loc4_: int = this._columnCount + param2;
        if (param1 < 0 || param1 > _loc3_) {
            return;
        }
        this.rowList.insertColumns(param1, param2);
        this._columnCount = _loc4_;
        insertValueToVector(this._columnWidths, param1, param2, NaN);
        insertValueToVector(this.typicalCellWidths, param1, param2, NaN);
        insertValueToVector(this.typicalCellHeights, param1, param2, NaN);
    }

    public function removeRows(param1: int, param2: int): void {
        this.removeRowsAt(param1, param2);
    }

    public function removeColumns(param1: int, param2: int): void {
        var _loc3_: int = this._columnCount;
        var _loc4_: int = this._columnCount - param2;
        if (param1 < 0 || param1 >= _loc3_) {
            return;
        }
        if (_loc4_ <= 0) {
            this.columnCount = 0;
            return;
        }
        this.rowList.removeColumns(param1, param2);
        this._columnCount = _loc4_;
        this._columnWidths.splice(param1, param2);
        this.typicalCellWidths.splice(param1, param2);
        this.typicalCellHeights.splice(param1, param2);
        this.recentNode = null;
        this.recentNode2 = null;
    }

    public function clearRows(param1: int, param2: int): void {
        var _loc5_: * = null;
        if (param1 < 0 || param2 <= 0) {
            return;
        }
        var _loc3_: GridRowNode = this.rowList.findNearestLTE(param1);
        var _loc4_: int = param1 + param2;
        if (Boolean(_loc3_) && _loc3_.rowIndex < param1) {
            _loc3_ = _loc3_.next;
        }
        while (Boolean(_loc3_) && _loc3_.rowIndex < _loc4_) {
            _loc5_ = _loc3_;
            _loc3_ = _loc3_.next;
            this.rowList.removeNode(_loc5_);
        }
        this.recentNode = null;
        this.recentNode2 = null;
    }

    public function clearColumns(param1: int, param2: int): void {
        if (param1 < 0 || param1 >= this._columnCount) {
            return;
        }
        this.rowList.clearColumns(param1, param2);
        clearVector(this.typicalCellWidths, NaN, param1, param2);
        clearVector(this.typicalCellHeights, NaN, param1, param2);
        clearVector(this._columnWidths, NaN, param1, param2);
        this.recentNode = null;
        this.recentNode2 = null;
    }

    public function moveRows(param1: int, param2: int, param3: int): void {
        var _loc6_: * = null;
        var _loc4_: Vector.<GridRowNode> = this.removeRowsAt(param1, param3);
        var _loc5_: int = param2 - param1;
        for each(_loc6_ in _loc4_) {
            _loc6_.rowIndex += _loc5_;
        }
        this.insertRowsAt(param2, param3, _loc4_);
    }

    public function moveColumns(param1: int, param2: int, param3: int): void {
        if (param1 < 0 || param1 >= this._columnCount || param2 < 0 || param2 > this._columnCount) {
            return;
        }
        this.rowList.moveColumns(param1, param2, param3);
        insertElementsToVector(this._columnWidths, param2, this._columnWidths.splice(param1, param3));
        insertElementsToVector(this.typicalCellWidths, param2, this.typicalCellWidths.splice(param1, param3));
        insertElementsToVector(this.typicalCellHeights, param2, this.typicalCellHeights.splice(param1, param3));
    }

    public function clearHeights(): void {
        this.rowList.removeAll();
        this.recentNode = null;
        this.recentNode2 = null;
        this.startY = 0;
        this.startY2 = 0;
    }

    private function insertRowsAt(param1: int, param2: int, param3: Vector.<GridRowNode> = null): void {
        var _loc5_: * = null;
        if (param1 < 0 || param2 <= 0) {
            return;
        }
        var _loc4_: GridRowNode;
        if ((Boolean(_loc4_ = this.rowList.findNearestLTE(param1))) && _loc4_.rowIndex < param1) {
            _loc4_ = _loc4_.next;
        }
        if (param3) {
            if (_loc4_) {
                for each(_loc5_ in param3) {
                    this.rowList.insertBefore(_loc4_, _loc5_);
                }
            } else {
                for each(_loc5_ in param3) {
                    this.rowList.push(_loc5_);
                }
            }
        }
        _loc5_ = _loc4_;
        while (_loc5_) {
            _loc5_.rowIndex += param2;
            _loc5_ = _loc5_.next;
        }
        this.rowCount += param2;
        this.recentNode = null;
        this.recentNode2 = null;
    }

    private function removeRowsAt(param1: int, param2: int): Vector.<GridRowNode> {
        var _loc6_: * = null;
        var _loc3_: Vector.<GridRowNode> = new Vector.<GridRowNode>();
        if (param1 < 0 || param2 <= 0) {
            return _loc3_;
        }
        var _loc4_: GridRowNode = this.rowList.findNearestLTE(param1);
        var _loc5_: int = param1 + param2;
        if (Boolean(_loc4_) && _loc4_.rowIndex < param1) {
            _loc4_ = _loc4_.next;
        }
        while (Boolean(_loc4_) && _loc4_.rowIndex < _loc5_) {
            _loc6_ = _loc4_;
            _loc3_.push(_loc6_);
            _loc4_ = _loc4_.next;
            this.rowList.removeNode(_loc6_);
        }
        while (_loc4_) {
            _loc4_.rowIndex -= param2;
            _loc4_ = _loc4_.next;
        }
        this._rowCount -= param2;
        this.recentNode = null;
        this.recentNode2 = null;
        return _loc3_;
    }

    public function dataProviderCollectionChanged(param1: CollectionEvent): void {
        switch (param1.kind) {
            case CollectionEventKind.ADD:
                this.insertRows(param1.location, param1.items.length);
                break;
            case CollectionEventKind.REMOVE:
                this.removeRows(param1.location, param1.items.length);
                break;
            case CollectionEventKind.MOVE:
                this.moveRows(param1.oldLocation, param1.location, param1.items.length);
                break;
            case CollectionEventKind.REFRESH:
                this.clearHeights();
                break;
            case CollectionEventKind.RESET:
                this.clearHeights();
                this.clearTypicalCellWidthsAndHeights();
                break;
            case CollectionEventKind.UPDATE:
                break;
            case CollectionEventKind.REPLACE:
                this.clearRows(param1.location, param1.items.length);
        }
    }

    public function columnsCollectionChanged(param1: CollectionEvent): void {
        var _loc2_: * = null;
        var _loc3_: int = 0;
        var _loc4_: int = 0;
        switch (param1.kind) {
            case CollectionEventKind.ADD:
                this.insertColumns(param1.location, param1.items.length);
                break;
            case CollectionEventKind.REMOVE:
                this.removeColumns(param1.location, param1.items.length);
                break;
            case CollectionEventKind.MOVE:
                this.moveColumns(param1.oldLocation, param1.location, param1.items.length);
                break;
            case CollectionEventKind.REFRESH:
            case CollectionEventKind.RESET:
                this.columnCount = IList(param1.target).length;
                break;
            case CollectionEventKind.UPDATE:
                _loc3_ = !!param1.items ? param1.items.length : 0;
                _loc4_ = 0;
                while (_loc4_ < _loc3_) {
                    _loc2_ = param1.items[_loc4_] as PropertyChangeEvent;
                    if (Boolean(_loc2_) && _loc2_.property == "visible") {
                        this.columns_visibleChangedHandler(_loc2_);
                    }
                    _loc4_++;
                }
                break;
            case CollectionEventKind.REPLACE:
                this.clearColumns(param1.location, param1.items.length);
        }
    }

    private function columns_visibleChangedHandler(param1: PropertyChangeEvent): void {
        var _loc2_: * = null;
        _loc2_ = param1.source as GridColumn;
        var _loc3_: int = _loc2_.columnIndex;
        if (!_loc2_ || _loc3_ < 0 || _loc3_ >= this._columnCount) {
            return;
        }
        this.clearColumns(_loc3_, 1);
        if (_loc2_.visible) {
            this.setTypicalCellWidth(_loc3_, NaN);
            this.setTypicalCellHeight(_loc3_, NaN);
            if (!isNaN(_loc2_.width)) {
                this.setColumnWidth(_loc3_, _loc2_.width);
            }
        } else {
            this.setTypicalCellWidth(_loc3_, 0);
            this.setTypicalCellHeight(_loc3_, 0);
            this.setColumnWidth(_loc3_, NaN);
        }
    }

    public function toString(): String {
        return this.rowList.toString();
    }
}
}
