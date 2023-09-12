package spark.layouts {

import flash.geom.Point;
import flash.geom.Rectangle;

import mx.core.ILayoutElement;
import mx.core.IVisualElement;
import mx.core.mx_internal;
import mx.events.PropertyChangeEvent;

import spark.components.supportClasses.GroupBase;
import spark.core.NavigationUnit;
import spark.layouts.supportClasses.DropLocation;
import spark.layouts.supportClasses.LayoutBase;

public class TileLayout extends LayoutBase {

    mx_internal static const VERSION: String = "4.6.0.23201";


    private var explicitHorizontalGap: Number = 6;

    private var _horizontalGap: Number = 6;

    private var explicitVerticalGap: Number = 6;

    private var _verticalGap: Number = 6;

    private var _columnCount: int = -1;

    private var _requestedColumnCount: int = -1;

    private var _rowCount: int = -1;

    private var _requestedRowCount: int = -1;

    private var explicitColumnWidth: Number = NaN;

    private var _columnWidth: Number = NaN;

    private var explicitRowHeight: Number = NaN;

    private var _rowHeight: Number = NaN;

    private var _paddingLeft: Number = 0;

    private var _paddingRight: Number = 0;

    private var _paddingTop: Number = 0;

    private var _paddingBottom: Number = 0;

    private var _horizontalAlign: String = "justify";

    private var _verticalAlign: String = "justify";

    private var _columnAlign: String = "left";

    private var _rowAlign: String = "top";

    private var _orientation: String = "rows";

    private var oldColumnWidth: Number = NaN;

    private var oldRowHeight: Number = NaN;

    private var oldColumnCount: int = -1;

    private var oldRowCount: int = -1;

    private var oldHorizontalGap: Number = NaN;

    private var oldVerticalGap: Number = NaN;

    private var _tileWidthCached: Number = NaN;

    private var _tileHeightCached: Number = NaN;

    private var _numElementsCached: int = -1;

    private var visibleStartIndex: int = -1;

    private var visibleEndIndex: int = -1;

    private var visibleStartX: Number = 0;

    private var visibleStartY: Number = 0;

    public function TileLayout() {
        super();
    }

    [Bindable("propertyChange")]
    public function get horizontalGap(): Number {
        return this._horizontalGap;
    }

    public function set horizontalGap(param1: Number): void {
        this.explicitHorizontalGap = param1;
        if (param1 == this._horizontalGap) {
            return;
        }
        this._horizontalGap = param1;
        this.invalidateTargetSizeAndDisplayList();
    }

    [Bindable("propertyChange")]
    public function get verticalGap(): Number {
        return this._verticalGap;
    }

    public function set verticalGap(param1: Number): void {
        this.explicitVerticalGap = param1;
        if (param1 == this._verticalGap) {
            return;
        }
        this._verticalGap = param1;
        this.invalidateTargetSizeAndDisplayList();
    }

    [Bindable("propertyChange")]
    public function get columnCount(): int {
        return this._columnCount;
    }

    public function get requestedColumnCount(): int {
        return this._requestedColumnCount;
    }

    public function set requestedColumnCount(param1: int): void {
        if (this._requestedColumnCount == param1) {
            return;
        }
        this._requestedColumnCount = param1;
        this._columnCount = param1;
        this.invalidateTargetSizeAndDisplayList();
    }

    [Bindable("propertyChange")]
    public function get rowCount(): int {
        return this._rowCount;
    }

    public function get requestedRowCount(): int {
        return this._requestedRowCount;
    }

    public function set requestedRowCount(param1: int): void {
        if (this._requestedRowCount == param1) {
            return;
        }
        this._requestedRowCount = param1;
        this._rowCount = param1;
        this.invalidateTargetSizeAndDisplayList();
    }

    [Bindable("propertyChange")]
    public function get columnWidth(): Number {
        return this._columnWidth;
    }

    public function set columnWidth(param1: Number): void {
        this.explicitColumnWidth = param1;
        if (param1 == this._columnWidth) {
            return;
        }
        this._columnWidth = param1;
        this.invalidateTargetSizeAndDisplayList();
    }

    [Bindable("propertyChange")]
    public function get rowHeight(): Number {
        return this._rowHeight;
    }

    public function set rowHeight(param1: Number): void {
        this.explicitRowHeight = param1;
        if (param1 == this._rowHeight) {
            return;
        }
        this._rowHeight = param1;
        this.invalidateTargetSizeAndDisplayList();
    }

    public function get paddingLeft(): Number {
        return this._paddingLeft;
    }

    public function set paddingLeft(param1: Number): void {
        if (this._paddingLeft == param1) {
            return;
        }
        this._paddingLeft = param1;
        this.invalidateTargetSizeAndDisplayList();
    }

    public function get paddingRight(): Number {
        return this._paddingRight;
    }

    public function set paddingRight(param1: Number): void {
        if (this._paddingRight == param1) {
            return;
        }
        this._paddingRight = param1;
        this.invalidateTargetSizeAndDisplayList();
    }

    public function get paddingTop(): Number {
        return this._paddingTop;
    }

    public function set paddingTop(param1: Number): void {
        if (this._paddingTop == param1) {
            return;
        }
        this._paddingTop = param1;
        this.invalidateTargetSizeAndDisplayList();
    }

    public function get paddingBottom(): Number {
        return this._paddingBottom;
    }

    public function set paddingBottom(param1: Number): void {
        if (this._paddingBottom == param1) {
            return;
        }
        this._paddingBottom = param1;
        this.invalidateTargetSizeAndDisplayList();
    }

    public function get horizontalAlign(): String {
        return this._horizontalAlign;
    }

    public function set horizontalAlign(param1: String): void {
        if (this._horizontalAlign == param1) {
            return;
        }
        this._horizontalAlign = param1;
        this.invalidateTargetSizeAndDisplayList();
    }

    public function get verticalAlign(): String {
        return this._verticalAlign;
    }

    public function set verticalAlign(param1: String): void {
        if (this._verticalAlign == param1) {
            return;
        }
        this._verticalAlign = param1;
        this.invalidateTargetSizeAndDisplayList();
    }

    public function get columnAlign(): String {
        return this._columnAlign;
    }

    public function set columnAlign(param1: String): void {
        if (this._columnAlign == param1) {
            return;
        }
        this._columnAlign = param1;
        this.invalidateTargetSizeAndDisplayList();
    }

    public function get rowAlign(): String {
        return this._rowAlign;
    }

    public function set rowAlign(param1: String): void {
        if (this._rowAlign == param1) {
            return;
        }
        this._rowAlign = param1;
        this.invalidateTargetSizeAndDisplayList();
    }

    public function get orientation(): String {
        return this._orientation;
    }

    public function set orientation(param1: String): void {
        if (this._orientation == param1) {
            return;
        }
        this._orientation = param1;
        this._tileWidthCached = this._tileHeightCached = NaN;
        this.invalidateTargetSizeAndDisplayList();
    }

    override public function set useVirtualLayout(param1: Boolean): void {
        if (useVirtualLayout == param1) {
            return;
        }
        super.useVirtualLayout = param1;
        if (param1) {
            this.visibleStartIndex = -1;
            this.visibleEndIndex = -1;
            this.visibleStartX = 0;
            this.visibleStartY = 0;
        }
    }

    override public function clearVirtualLayoutCache(): void {
        this._tileWidthCached = this._tileHeightCached = NaN;
    }

    private function dispatchEventsForActualValueChanges(): void {
        if (hasEventListener(PropertyChangeEvent.PROPERTY_CHANGE)) {
            if (this.oldColumnWidth != this._columnWidth) {
                dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "columnWidth", this.oldColumnWidth, this._columnWidth));
            }
            if (this.oldRowHeight != this._rowHeight) {
                dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rowHeight", this.oldRowHeight, this._rowHeight));
            }
            if (this.oldColumnCount != this._columnCount) {
                dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "columnCount", this.oldColumnCount, this._columnCount));
            }
            if (this.oldRowCount != this._rowCount) {
                dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rowCount", this.oldRowCount, this._rowCount));
            }
            if (this.oldHorizontalGap != this._horizontalGap) {
                dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "horizontalGap", this.oldHorizontalGap, this._horizontalGap));
            }
            if (this.oldVerticalGap != this._verticalGap) {
                dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "verticalGap", this.oldVerticalGap, this._verticalGap));
            }
        }
        this.oldColumnWidth = this._columnWidth;
        this.oldRowHeight = this._rowHeight;
        this.oldColumnCount = this._columnCount;
        this.oldRowCount = this._rowCount;
        this.oldHorizontalGap = this._horizontalGap;
        this.oldVerticalGap = this._verticalGap;
    }

    private function updateActualValues(param1: Number, param2: Number): void {
        var _loc3_: Number = param1 - this.paddingLeft - this.paddingRight;
        var _loc4_: Number = param2 - this.paddingTop - this.paddingBottom;
        this.calculateTileSize();
        var _loc5_: int = this.calculateElementCount();
        this.calculateColumnAndRowCount(_loc3_, _loc4_, _loc5_);
        this._horizontalGap = this.explicitHorizontalGap;
        this._verticalGap = this.explicitVerticalGap;
        if (!isNaN(param1)) {
            switch (this.columnAlign) {
                case ColumnAlign.JUSTIFY_USING_GAP:
                    this._horizontalGap = this.justifyByGapSize(_loc3_, this._columnWidth, this._horizontalGap, this._columnCount);
                    break;
                case ColumnAlign.JUSTIFY_USING_WIDTH:
                    this._columnWidth = this.justifyByElementSize(_loc3_, this._columnWidth, this._horizontalGap, this._columnCount);
            }
        }
        if (!isNaN(param2)) {
            switch (this.rowAlign) {
                case RowAlign.JUSTIFY_USING_GAP:
                    this._verticalGap = this.justifyByGapSize(_loc4_, this._rowHeight, this._verticalGap, this._rowCount);
                    break;
                case RowAlign.JUSTIFY_USING_HEIGHT:
                    this._rowHeight = this.justifyByElementSize(_loc4_, this._rowHeight, this._verticalGap, this._rowCount);
            }
        }
        if (-1 != this._requestedColumnCount && -1 != this._requestedRowCount) {
            if (this.orientation == TileOrientation.ROWS) {
                this._rowCount = Math.max(1, Math.ceil(_loc5_ / Math.max(1, this._requestedColumnCount)));
            } else {
                this._columnCount = Math.max(1, Math.ceil(_loc5_ / Math.max(1, this._requestedRowCount)));
            }
        }
    }

    private function closerToSquare(param1: int, param2: int, param3: int, param4: int): Boolean {
        var _loc5_: Number = Math.abs(param1 * (this._columnWidth + this._horizontalGap) - this._horizontalGap - param2 * (this._rowHeight + this._verticalGap) + this._verticalGap);
        var _loc6_: Number = Math.abs(param3 * (this._columnWidth + this._horizontalGap) - this._horizontalGap - param4 * (this._rowHeight + this._verticalGap) + this._verticalGap);
        return _loc5_ < _loc6_ || _loc5_ == _loc6_ && param2 <= param4;
    }

    private function calculateColumnAndRowCount(param1: Number, param2: Number, param3: int): void {
        var _loc4_: Number = NaN;
        var _loc5_: Number = NaN;
        var _loc6_: Number = NaN;
        var _loc7_: Number = NaN;
        var _loc8_: Number = NaN;
        var _loc9_: Number = NaN;
        var _loc10_: Number = NaN;
        var _loc11_: int = 0;
        var _loc12_: int = 0;
        var _loc13_: int = 0;
        var _loc14_: int = 0;
        var _loc15_: int = 0;
        var _loc16_: int = 0;
        var _loc17_: int = 0;
        var _loc18_: int = 0;
        this._rowCount = -1;
        this._columnCount = -1;
        if (-1 != this._requestedColumnCount || -1 != this._requestedRowCount) {
            if (-1 != this._requestedRowCount) {
                this._rowCount = Math.max(1, this._requestedRowCount);
            }
            if (-1 != this._requestedColumnCount) {
                this._columnCount = Math.max(1, this._requestedColumnCount);
            }
        } else if (!isNaN(param1) && (this.orientation == TileOrientation.ROWS || isNaN(param2))) {
            if (this._columnWidth + this.explicitHorizontalGap > 0) {
                this._columnCount = Math.max(1, Math.floor((param1 + this.explicitHorizontalGap) / (this._columnWidth + this.explicitHorizontalGap)));
            } else {
                this._columnCount = 1;
            }
        } else if (!isNaN(param2) && (this.orientation == TileOrientation.COLUMNS || isNaN(param1))) {
            if (this._rowHeight + this.explicitVerticalGap > 0) {
                this._rowCount = Math.max(1, Math.floor((param2 + this.explicitVerticalGap) / (this._rowHeight + this.explicitVerticalGap)));
            } else {
                this._rowCount = 1;
            }
        } else {
            _loc4_ = this.explicitHorizontalGap;
            _loc5_ = this.explicitVerticalGap;
            _loc6_ = Math.max(0, this.rowHeight + _loc5_);
            _loc7_ = _loc4_ - _loc5_;
            _loc8_ = -param3 * (this._columnWidth + _loc4_);
            _loc9_ = _loc7_ * _loc7_ - 4 * _loc6_ * _loc8_;
            _loc9_ = Math.sqrt(_loc9_);
            _loc10_ = _loc6_ != 0 ? (_loc7_ + _loc9_) / (2 * _loc6_) : param3;
            _loc11_ = Math.max(1, Math.floor(_loc10_));
            _loc12_ = Math.max(1, Math.ceil(param3 / _loc11_));
            _loc11_ = Math.max(1, Math.ceil(param3 / _loc12_));
            _loc13_ = Math.max(1, Math.ceil(_loc10_));
            _loc14_ = Math.max(1, Math.ceil(param3 / _loc13_));
            _loc13_ = Math.max(1, Math.ceil(param3 / _loc14_));
            _loc15_ = Math.max(1, Math.floor(param3 / _loc10_));
            _loc16_ = Math.max(1, Math.ceil(param3 / _loc15_));
            _loc15_ = Math.max(1, Math.ceil(param3 / _loc16_));
            _loc17_ = Math.max(1, Math.ceil(param3 / _loc10_));
            _loc18_ = Math.max(1, Math.ceil(param3 / _loc17_));
            _loc17_ = Math.max(1, Math.ceil(param3 / _loc18_));
            if (this.closerToSquare(_loc15_, _loc16_, _loc12_, _loc11_)) {
                _loc12_ = _loc15_;
                _loc11_ = _loc16_;
            }
            if (this.closerToSquare(_loc17_, _loc18_, _loc14_, _loc13_)) {
                _loc14_ = _loc17_;
                _loc13_ = _loc18_;
            }
            if (this.closerToSquare(_loc12_, _loc11_, _loc14_, _loc13_)) {
                this._columnCount = _loc12_;
                this._rowCount = _loc11_;
            } else {
                this._columnCount = _loc14_;
                this._rowCount = _loc13_;
            }
        }
        if (-1 == this._rowCount) {
            this._rowCount = Math.max(1, Math.ceil(param3 / this._columnCount));
        }
        if (-1 == this._columnCount) {
            this._columnCount = Math.max(1, Math.ceil(param3 / this._rowCount));
        }
    }

    private function justifyByGapSize(param1: Number, param2: Number, param3: Number, param4: int): Number {
        if (param2 + param3 <= 0) {
            return param3;
        }
        var _loc5_: int;
        if ((_loc5_ = Math.min(param4, Math.floor((param1 + param3) / (param2 + param3)))) < 1) {
            return param3;
        }
        if (_loc5_ == 1) {
            return param4 > 1 ? Math.max(param3, param1 - param2) : param3;
        }
        return (param1 - _loc5_ * param2) / (_loc5_ - 1);
    }

    private function justifyByElementSize(param1: Number, param2: Number, param3: Number, param4: int): Number {
        var _loc5_: Number = param2 + param3;
        var _loc6_: int = 0;
        if (_loc5_ == 0) {
            _loc6_ = param4;
        } else {
            _loc6_ = Math.min(param4, Math.floor((param1 + param3) / _loc5_));
        }
        if (_loc6_ < 1) {
            return param2;
        }
        return (param1 - (_loc6_ - 1) * param3) / _loc6_;
    }

    private function updateVirtualTileSize(param1: ILayoutElement): void {
        if (!param1 || !param1.includeInLayout) {
            return;
        }
        var _loc2_: Number = param1.getPreferredBoundsWidth();
        var _loc3_: Number = param1.getPreferredBoundsHeight();
        this._tileWidthCached = isNaN(this._tileWidthCached) ? _loc2_ : Math.max(_loc2_, this._tileWidthCached);
        this._tileHeightCached = isNaN(this._tileHeightCached) ? _loc3_ : Math.max(_loc3_, this._tileHeightCached);
    }

    private function calculateVirtualTileSize(): void {
        var _loc1_: int = 0;
        this._columnWidth = this.explicitColumnWidth;
        this._rowHeight = this.explicitRowHeight;
        if (!isNaN(this._columnWidth) && !isNaN(this._rowHeight)) {
            this._tileWidthCached = this._columnWidth;
            this._tileHeightCached = this._rowHeight;
            return;
        }
        this.updateVirtualTileSize(typicalLayoutElement);
        if (this.visibleStartIndex != -1 && this.visibleEndIndex != -1) {
            _loc1_ = this.visibleStartIndex;
            while (_loc1_ <= this.visibleEndIndex) {
                this.updateVirtualTileSize(target.getVirtualElementAt(_loc1_));
                _loc1_++;
            }
        }
        if (isNaN(this._tileWidthCached)) {
            this._tileWidthCached = 0;
        }
        if (isNaN(this._tileHeightCached)) {
            this._tileHeightCached = 0;
        }
        if (isNaN(this._columnWidth)) {
            this._columnWidth = this._tileWidthCached;
        }
        if (isNaN(this._rowHeight)) {
            this._rowHeight = this._tileHeightCached;
        }
    }

    private function calculateRealTileSize(): void {
        var _loc6_: * = null;
        this._columnWidth = this._tileWidthCached;
        this._rowHeight = this._tileHeightCached;
        if (!isNaN(this._columnWidth) && !isNaN(this._rowHeight)) {
            return;
        }
        this._columnWidth = this._tileWidthCached = this.explicitColumnWidth;
        this._rowHeight = this._tileHeightCached = this.explicitRowHeight;
        if (!isNaN(this._columnWidth) && !isNaN(this._rowHeight)) {
            return;
        }
        var _loc1_: Number = 0;
        var _loc2_: Number = 0;
        var _loc3_: GroupBase = target;
        var _loc4_: int = _loc3_.numElements;
        this._numElementsCached = _loc4_;
        var _loc5_: int = 0;
        while (_loc5_ < _loc4_) {
            if (!(_loc6_ = _loc3_.getElementAt(_loc5_)) || !_loc6_.includeInLayout) {
                --this._numElementsCached;
            } else {
                if (isNaN(this._columnWidth)) {
                    _loc1_ = Math.max(_loc1_, _loc6_.getPreferredBoundsWidth());
                }
                if (isNaN(this._rowHeight)) {
                    _loc2_ = Math.max(_loc2_, _loc6_.getPreferredBoundsHeight());
                }
            }
            _loc5_++;
        }
        if (isNaN(this._columnWidth)) {
            this._columnWidth = this._tileWidthCached = _loc1_;
        }
        if (isNaN(this._rowHeight)) {
            this._rowHeight = this._tileHeightCached = _loc2_;
        }
    }

    private function calculateTileSize(): void {
        if (useVirtualLayout) {
            this.calculateVirtualTileSize();
        } else {
            this.calculateRealTileSize();
        }
    }

    private function calculateElementCount(): int {
        var _loc4_: * = null;
        if (-1 != this._numElementsCached) {
            return this._numElementsCached;
        }
        var _loc1_: GroupBase = target;
        var _loc2_: int = _loc1_.numElements;
        this._numElementsCached = _loc2_;
        if (useVirtualLayout) {
            return this._numElementsCached;
        }
        var _loc3_: int = 0;
        while (_loc3_ < _loc2_) {
            if (!(_loc4_ = _loc1_.getElementAt(_loc3_)) || !_loc4_.includeInLayout) {
                --this._numElementsCached;
            }
            _loc3_++;
        }
        return this._numElementsCached;
    }

    private function calculateDisplayParameters(param1: int, param2: int): void {
        var _loc5_: Number = NaN;
        var _loc6_: Number = NaN;
        var _loc7_: Number = NaN;
        var _loc8_: Number = NaN;
        var _loc9_: int = 0;
        var _loc10_: int = 0;
        var _loc11_: int = 0;
        var _loc12_: int = 0;
        this.updateActualValues(param1, param2);
        var _loc3_: GroupBase = target;
        var _loc4_: int = _loc3_.numElements;
        this.visibleStartX = this.paddingLeft;
        this.visibleStartY = this.paddingTop;
        this.visibleStartIndex = 0;
        this.visibleEndIndex = _loc4_ - 1;
        if (useVirtualLayout) {
            _loc5_ = _loc3_.horizontalScrollPosition - this.paddingLeft;
            _loc6_ = _loc3_.verticalScrollPosition - this.paddingTop;
            _loc7_ = this._columnWidth + this._horizontalGap;
            _loc8_ = this._rowHeight + this._verticalGap;
            _loc9_ = Math.max(0, Math.floor(_loc5_ / _loc7_));
            _loc10_ = Math.max(0, Math.floor(_loc6_ / _loc8_));
            _loc11_ = Math.min(this._columnCount - 1, Math.floor((_loc5_ + param1) / _loc7_));
            _loc12_ = Math.min(this._rowCount - 1, Math.floor((_loc6_ + param2) / _loc8_));
            if (this.orientation == TileOrientation.ROWS) {
                this.visibleStartIndex = _loc10_ * this._columnCount;
                this.visibleEndIndex = Math.min(_loc4_ - 1, _loc12_ * this._columnCount + _loc11_);
                this.visibleStartY = _loc10_ * _loc8_ + this.paddingTop;
            } else {
                this.visibleStartIndex = _loc9_ * this._rowCount;
                this.visibleEndIndex = Math.min(_loc4_ - 1, _loc11_ * this._rowCount + _loc12_);
                this.visibleStartX = _loc9_ * _loc7_ + this.paddingLeft;
            }
        }
    }

    private function updateVirtualLayout(param1: int, param2: int): void {
        var _loc7_: * = null;
        var _loc3_: int = this.visibleStartIndex;
        var _loc4_: int = this.visibleEndIndex;
        this.calculateDisplayParameters(param1, param2);
        var _loc5_: GroupBase = target;
        var _loc6_: int = _loc3_;
        while (_loc6_ <= _loc4_) {
            if (_loc6_ >= this.visibleStartIndex && _loc6_ <= this.visibleEndIndex) {
                _loc6_ = this.visibleEndIndex;
            } else if (_loc7_ = _loc5_.getElementAt(_loc6_)) {
                if (_loc7_ is IVisualElement) {
                    IVisualElement(_loc7_).visible = false;
                }
            }
            _loc6_++;
        }
    }

    private function sizeAndPositionElement(param1: ILayoutElement, param2: int, param3: int, param4: int, param5: int): void {
        var _loc6_: Number = NaN;
        var _loc7_: Number = NaN;
        if (this.horizontalAlign == "justify") {
            _loc6_ = param4;
        } else if (!isNaN(param1.percentWidth)) {
            _loc6_ = Math.round(param4 * param1.percentWidth * 0.01);
        } else {
            _loc6_ = param1.getPreferredBoundsWidth();
        }
        if (this.verticalAlign == "justify") {
            _loc7_ = param5;
        } else if (!isNaN(param1.percentHeight)) {
            _loc7_ = Math.round(param5 * param1.percentHeight * 0.01);
        } else {
            _loc7_ = param1.getPreferredBoundsHeight();
        }
        var _loc8_: Number = Math.min(param1.getMaxBoundsWidth(), param4);
        var _loc9_: Number = Math.min(param1.getMaxBoundsHeight(), param5);
        _loc6_ = Math.max(param1.getMinBoundsWidth(), Math.min(_loc8_, _loc6_));
        _loc7_ = Math.max(param1.getMinBoundsHeight(), Math.min(_loc9_, _loc7_));
        param1.setLayoutBoundsSize(_loc6_, _loc7_);
        var _loc10_: Number = param2;
        switch (this.horizontalAlign) {
            case "right":
                _loc10_ += param4 - param1.getLayoutBoundsWidth();
                break;
            case "center":
                _loc10_ = param2 + Math.floor((param4 - param1.getLayoutBoundsWidth()) / 2);
        }
        var _loc11_: Number = param3;
        switch (this.verticalAlign) {
            case "bottom":
                _loc11_ += param5 - param1.getLayoutBoundsHeight();
                break;
            case "middle":
                _loc11_ += Math.floor((param5 - param1.getLayoutBoundsHeight()) / 2);
        }
        param1.setLayoutBoundsPosition(_loc10_, _loc11_);
    }

    private final function leftEdge(param1: int): Number {
        if (param1 < 0) {
            return 0;
        }
        return Math.max(0, param1 * (this._columnWidth + this._horizontalGap)) + this.paddingLeft;
    }

    private final function rightEdge(param1: int): Number {
        if (param1 < 0) {
            return 0;
        }
        return Math.min(target.contentWidth, param1 * (this._columnWidth + this._horizontalGap) + this._columnWidth) + this.paddingLeft;
    }

    private final function topEdge(param1: int): Number {
        if (param1 < 0) {
            return 0;
        }
        return Math.max(0, param1 * (this._rowHeight + this._verticalGap)) + this.paddingTop;
    }

    private final function bottomEdge(param1: int): Number {
        if (param1 < 0) {
            return 0;
        }
        return Math.min(target.contentHeight, param1 * (this._rowHeight + this._verticalGap) + this._rowHeight) + this.paddingTop;
    }

    private function invalidateTargetSizeAndDisplayList(): void {
        var _loc1_: GroupBase = target;
        if (!_loc1_) {
            return;
        }
        _loc1_.invalidateSize();
        _loc1_.invalidateDisplayList();
    }

    override protected function scrollPositionChanged(): void {
        super.scrollPositionChanged();
        var _loc1_: GroupBase = target;
        if (!_loc1_) {
            return;
        }
        if (useVirtualLayout) {
            _loc1_.invalidateDisplayList();
        }
    }

    override public function measure(): void {
        var _loc4_: int = 0;
        var _loc5_: int = 0;
        var _loc1_: int = this._columnCount;
        var _loc2_: int = this._rowCount;
        var _loc3_: int = this._horizontalGap;
        _loc4_ = this._verticalGap;
        _loc5_ = this._columnWidth;
        var _loc6_: int = this._rowHeight;
        var _loc7_: GroupBase;
        if (!(_loc7_ = target)) {
            return;
        }
        this.updateActualValues(_loc7_.explicitWidth, _loc7_.explicitHeight);
        var _loc8_: int = this._requestedColumnCount != -1 ? Math.max(1, this._requestedColumnCount) : this._columnCount;
        var _loc9_: int = this._requestedRowCount != -1 ? Math.max(1, this._requestedRowCount) : this._rowCount;
        var _loc10_: Number = 0;
        var _loc11_: Number = 0;
        var _loc12_: Number = 0;
        var _loc13_: Number = 0;
        if (_loc8_ > 0) {
            _loc10_ = Math.ceil(_loc8_ * (this._columnWidth + this._horizontalGap) - this._horizontalGap);
            _loc11_ = Math.ceil(this._columnCount * (this._columnWidth + this._horizontalGap) - this._horizontalGap);
        }
        if (_loc9_ > 0) {
            _loc12_ = Math.ceil(_loc9_ * (this._rowHeight + this._verticalGap) - this._verticalGap);
            _loc13_ = Math.ceil(this._rowCount * (this._rowHeight + this._verticalGap) - this._verticalGap);
        }
        this._numElementsCached = -1;
        var _loc14_: Number = this.paddingLeft + this.paddingRight;
        var _loc15_: Number = this.paddingTop + this.paddingBottom;
        _loc7_.measuredWidth = _loc10_ + _loc14_;
        _loc7_.measuredMinWidth = _loc11_ + _loc14_;
        _loc7_.measuredHeight = _loc12_ + _loc15_;
        _loc7_.measuredMinHeight = _loc13_ + _loc15_;
        this._columnCount = _loc1_;
        this._rowCount = _loc2_;
        this._horizontalGap = _loc3_;
        this._verticalGap = _loc4_;
        this._columnWidth = _loc5_;
        this._rowHeight = _loc6_;
    }

    override public function getNavigationDestinationIndex(param1: int, param2: uint, param3: Boolean): int {
        var _loc6_: int = 0;
        var _loc7_: int = 0;
        var _loc10_: * = null;
        var _loc11_: int = 0;
        var _loc12_: int = 0;
        var _loc13_: int = 0;
        var _loc14_: int = 0;
        if (!target || true) {
            return -1;
        }
        var _loc4_: int = -1;
        if (param1 == -1) {
            if (param2 == NavigationUnit.UP || param2 == NavigationUnit.LEFT) {
                return param3 ? _loc4_ : -1;
            }
            if (param2 == NavigationUnit.DOWN || param2 == NavigationUnit.RIGHT) {
                return 0;
            }
        }
        var _loc5_: * = this.orientation == TileOrientation.ROWS;
        param1 = Math.max(0, Math.min(_loc4_, param1));
        if (_loc5_) {
            if (this.columnCount == 0 || this.rowHeight + this.verticalGap == 0) {
                return param1;
            }
            _loc6_ = param1 / this.columnCount;
            _loc7_ = param1 - _loc6_ * this.columnCount;
        } else {
            if (this.rowCount == 0 || this.columnWidth + this.horizontalGap == 0) {
                return param1;
            }
            _loc7_ = param1 / this.rowCount;
            _loc6_ = param1 - _loc7_ * this.rowCount;
        }
        var _loc8_: int = _loc6_;
        var _loc9_: int = _loc7_;
        switch (param2) {
            case NavigationUnit.LEFT:
                if (_loc9_ == 0 && _loc5_ && _loc8_ > 0) {
                    _loc8_--;
                    _loc9_ = this.columnCount - 1;
                    break;
                }
                if (param3 && _loc9_ == 0 && _loc5_ && _loc8_ == 0) {
                    _loc8_ = this.rowCount - 1;
                    _loc9_ = this.columnCount - 1;
                    break;
                }
                _loc9_--;
                break;
            case NavigationUnit.RIGHT:
                if (_loc9_ == this.columnCount - 1 && _loc5_ && _loc8_ < this.rowCount - 1) {
                    _loc9_ = 0;
                    _loc8_++;
                    break;
                }
                if (param3 && _loc9_ == this.columnCount - 1 && _loc5_ && _loc8_ == this.rowCount - 1) {
                    _loc9_ = 0;
                    _loc8_ = 0;
                    break;
                }
                _loc9_++;
                break;
            case NavigationUnit.UP:
                if (_loc8_ == 0 && !_loc5_ && _loc9_ > 0) {
                    _loc9_--;
                    _loc8_ = this.rowCount - 1;
                    break;
                }
                if (param3 && _loc8_ == 0 && !_loc5_ && _loc9_ == 0) {
                    _loc9_ = this.columnCount - 1;
                    _loc8_ = this.rowCount - 1;
                    break;
                }
                _loc8_--;
                break;
            case NavigationUnit.DOWN:
                if (_loc8_ == this.rowCount - 1 && !_loc5_ && _loc9_ < this.columnCount - 1) {
                    _loc9_++;
                    _loc8_ = 0;
                    break;
                }
                if (param3 && _loc8_ == this.rowCount - 1 && !_loc5_ && _loc9_ == this.columnCount - 1) {
                    _loc9_ = 0;
                    _loc8_ = 0;
                    break;
                }
                _loc8_++;
                break;
            case NavigationUnit.PAGE_UP:
            case NavigationUnit.PAGE_DOWN:
                if (!(_loc10_ = getScrollRect())) {
                    _loc10_ = new Rectangle(0, 0, target.contentWidth, target.contentHeight);
                }
                if (_loc5_) {
                    _loc11_ = Math.ceil(_loc10_.top / (this.rowHeight + this.verticalGap));
                    _loc12_ = Math.floor(_loc10_.bottom / (this.rowHeight + this.verticalGap));
                    if (param2 == NavigationUnit.PAGE_UP) {
                        if (_loc11_ < _loc6_ && _loc6_ <= _loc12_) {
                            _loc8_ = _loc11_;
                            break;
                        }
                        _loc8_ = 2 * _loc11_ - _loc12_;
                        break;
                    }
                    if (_loc11_ <= _loc6_ && _loc6_ < _loc12_) {
                        _loc8_ = _loc12_;
                        break;
                    }
                    _loc8_ = 2 * _loc12_ - _loc11_;
                    break;
                }
                _loc13_ = Math.ceil(_loc10_.left / (this.columnWidth + this.horizontalGap));
                _loc14_ = Math.floor(_loc10_.right / (this.columnWidth + this.horizontalGap));
                if (param2 == NavigationUnit.PAGE_UP) {
                    if (_loc13_ < _loc7_ && _loc7_ <= _loc14_) {
                        _loc9_ = _loc13_;
                        break;
                    }
                    _loc9_ = 2 * _loc13_ - _loc14_;
                    break;
                }
                if (_loc13_ <= _loc7_ && _loc7_ < _loc14_) {
                    _loc9_ = _loc14_;
                    break;
                }
                _loc9_ = 2 * _loc14_ - _loc13_;
                break;
            default:
                return super.getNavigationDestinationIndex(param1, param2, param3);
        }
        _loc8_ = Math.max(0, Math.min(this.rowCount - 1, _loc8_));
        _loc9_ = Math.max(0, Math.min(this.columnCount - 1, _loc9_));
        if (_loc5_) {
            if (_loc8_ == this.rowCount - 1) {
                if (param1 == _loc4_ && _loc9_ > _loc7_) {
                    _loc9_ = _loc7_;
                }
                if (_loc9_ > _loc4_ - this.columnCount * (this.rowCount - 1)) {
                    _loc8_--;
                }
            }
            return _loc8_ * this.columnCount + _loc9_;
        }
        if (_loc9_ == this.columnCount - 1) {
            if (param1 == _loc4_ && _loc8_ > _loc6_) {
                _loc8_ = _loc6_;
            }
            if (_loc8_ > _loc4_ - this.rowCount * (this.columnCount - 1)) {
                _loc9_--;
            }
        }
        return _loc9_ * this.rowCount + _loc8_;
    }

    override public function updateDisplayList(param1: Number, param2: Number): void {
        var _loc6_: Number = NaN;
        var _loc7_: Number = NaN;
        var _loc8_: Number = NaN;
        var _loc9_: Number = NaN;
        var _loc11_: int = 0;
        var _loc15_: * = null;
        var _loc16_: int = 0;
        var _loc17_: int = 0;
        var _loc18_: int = 0;
        var _loc19_: int = 0;
        var _loc3_: GroupBase = target;
        if (!_loc3_) {
            return;
        }
        this.calculateDisplayParameters(param1, param2);
        if (useVirtualLayout) {
            this.updateVirtualLayout(param1, param2);
        }
        var _loc4_: Number = this.visibleStartX;
        var _loc5_: Number = this.visibleStartY;
        var _loc10_: int = 0;
        if (this.orientation == TileOrientation.ROWS) {
            _loc11_ = this._columnCount;
            _loc6_ = this._columnWidth + this._horizontalGap;
            _loc8_ = 0;
            _loc7_ = 0;
            _loc9_ = this._rowHeight + this._verticalGap;
        } else {
            _loc11_ = this._rowCount;
            _loc6_ = 0;
            _loc8_ = this._columnWidth + this._horizontalGap;
            _loc7_ = this._rowHeight + this._verticalGap;
            _loc9_ = 0;
        }
        var _loc12_: int = this.visibleStartIndex;
        while (_loc12_ <= this.visibleEndIndex) {
            _loc15_ = null;
            if (useVirtualLayout) {
                if ((_loc15_ = _loc3_.getVirtualElementAt(_loc12_)) is IVisualElement) {
                    IVisualElement(_loc15_).visible = true;
                }
            } else {
                _loc15_ = _loc3_.getElementAt(_loc12_);
            }
            if (!(!_loc15_ || !_loc15_.includeInLayout)) {
                _loc16_ = Math.round(_loc4_);
                _loc17_ = Math.round(_loc5_);
                _loc18_ = Math.round(_loc4_ + this._columnWidth) - _loc16_;
                _loc19_ = Math.round(_loc5_ + this._rowHeight) - _loc17_;
                this.sizeAndPositionElement(_loc15_, _loc16_, _loc17_, _loc18_, _loc19_);
                _loc4_ += _loc6_;
                _loc5_ += _loc7_;
                if (++_loc10_ >= _loc11_) {
                    _loc10_ = 0;
                    if (this.orientation == TileOrientation.ROWS) {
                        _loc4_ = this.paddingLeft;
                        _loc5_ += _loc9_;
                    } else {
                        _loc4_ += _loc8_;
                        _loc5_ = this.paddingTop;
                    }
                }
            }
            _loc12_++;
        }
        var _loc13_: Number = this.paddingLeft + this.paddingRight;
        var _loc14_: Number = this.paddingTop + this.paddingBottom;
        _loc3_.setContentSize(Math.ceil(this._columnCount * (this._columnWidth + this._horizontalGap) - this._horizontalGap) + _loc13_, Math.ceil(this._rowCount * (this._rowHeight + this._verticalGap) - this._verticalGap) + _loc14_);
        if (!useVirtualLayout) {
            this._tileWidthCached = this._tileHeightCached = NaN;
        }
        this._numElementsCached = -1;
        if (useVirtualLayout) {
            this.visibleStartIndex = this.visibleEndIndex = -1;
        }
        this.dispatchEventsForActualValueChanges();
    }

    override public function getElementBounds(param1: int): Rectangle {
        var _loc3_: int = 0;
        var _loc4_: int = 0;
        if (!useVirtualLayout) {
            return super.getElementBounds(param1);
        }
        var _loc2_: GroupBase = GroupBase(target);
        if (!_loc2_ || param1 < 0 || param1 >= _loc2_.numElements) {
            return null;
        }
        if (this.orientation == TileOrientation.ROWS) {
            _loc3_ = param1 % this._columnCount;
            _loc4_ = param1 / this._columnCount;
        } else {
            _loc3_ = param1 / this._rowCount;
            _loc4_ = param1 % this._rowCount;
        }
        return new Rectangle(this.leftEdge(_loc3_), this.topEdge(_loc4_), this._columnWidth, this._rowHeight);
    }

    override protected function getElementBoundsLeftOfScrollRect(param1: Rectangle): Rectangle {
        var _loc2_: Rectangle = new Rectangle();
        var _loc3_: int = Math.floor((param1.left - 1 - this.paddingLeft) / (this._columnWidth + this._horizontalGap));
        _loc2_.left = this.leftEdge(_loc3_);
        _loc2_.right = this.rightEdge(_loc3_);
        return _loc2_;
    }

    override protected function getElementBoundsRightOfScrollRect(param1: Rectangle): Rectangle {
        var _loc2_: Rectangle = new Rectangle();
        var _loc3_: int = Math.floor((param1.right + 1 + this._horizontalGap - this.paddingLeft) / (this._columnWidth + this._horizontalGap));
        _loc2_.left = this.leftEdge(_loc3_);
        _loc2_.right = this.rightEdge(_loc3_);
        return _loc2_;
    }

    override protected function getElementBoundsAboveScrollRect(param1: Rectangle): Rectangle {
        var _loc2_: Rectangle = new Rectangle();
        var _loc3_: int = Math.floor((param1.top - 1 - this.paddingTop) / (this._rowHeight + this._verticalGap));
        _loc2_.top = this.topEdge(_loc3_);
        _loc2_.bottom = this.bottomEdge(_loc3_);
        return _loc2_;
    }

    override protected function getElementBoundsBelowScrollRect(param1: Rectangle): Rectangle {
        var _loc2_: Rectangle = new Rectangle();
        var _loc3_: int = Math.floor((param1.bottom + 1 + this._verticalGap - this.paddingTop) / (this._rowHeight + this._verticalGap));
        _loc2_.top = this.topEdge(_loc3_);
        _loc2_.bottom = this.bottomEdge(_loc3_);
        return _loc2_;
    }

    override public function elementAdded(param1: int): void {
        this.invalidateTargetSizeAndDisplayList();
    }

    override public function elementRemoved(param1: int): void {
        this.invalidateTargetSizeAndDisplayList();
    }

    private function calculateDropCellIndex(param1: Number, param2: Number): Array {
        var _loc7_: Number = NaN;
        var _loc8_: Number = NaN;
        var _loc3_: Number = param1 - this.paddingLeft;
        var _loc4_: Number = param2 - this.paddingTop;
        var _loc5_: int = Math.floor(_loc3_ / (this._columnWidth + this._horizontalGap));
        var _loc6_: int = Math.floor(_loc4_ / (this._rowHeight + this._verticalGap));
        var _loc9_: * = this.orientation == TileOrientation.ROWS;
        if (this.orientation == TileOrientation.ROWS) {
            _loc7_ = (_loc5_ + 1) * (this._columnWidth + this._horizontalGap) - this._horizontalGap - this._columnWidth / 2;
            _loc8_ = (_loc6_ + 1) * (this._rowHeight + this._verticalGap) - this._verticalGap / 2;
        } else {
            _loc7_ = (_loc5_ + 1) * (this._columnWidth + this._horizontalGap) - this._horizontalGap / 2;
            _loc8_ = (_loc6_ + 1) * (this._rowHeight + this._verticalGap) - this._verticalGap - this._rowHeight / 2;
        }
        if (_loc3_ > _loc7_) {
            _loc5_++;
        }
        if (_loc4_ > _loc8_) {
            _loc6_++;
        }
        if (_loc5_ > this._columnCount || _loc6_ > this._rowCount) {
            _loc6_ = this._rowCount;
            _loc5_ = this._columnCount;
        }
        if (_loc5_ < 0) {
            _loc5_ = 0;
        }
        if (_loc6_ < 0) {
            _loc6_ = 0;
        }
        if (_loc9_) {
            if (_loc6_ >= this._rowCount) {
                _loc6_ = this._rowCount - 1;
            }
        } else if (_loc5_ >= this._columnCount) {
            _loc5_ = this._columnCount - 1;
        }
        return [_loc6_, _loc5_];
    }

    override protected function calculateDropIndex(param1: Number, param2: Number): int {
        var _loc6_: int = 0;
        var _loc3_: Array = this.calculateDropCellIndex(param1, param2);
        var _loc4_: int = int(_loc3_[0]);
        var _loc5_: int = int(_loc3_[1]);
        if (this.orientation == TileOrientation.ROWS) {
            _loc6_ = _loc4_ * this._columnCount + _loc5_;
        } else {
            _loc6_ = _loc5_ * this._rowCount + _loc4_;
        }
        var _loc7_: int = this.calculateElementCount();
        this._numElementsCached = -1;
        if (_loc6_ > _loc7_) {
            _loc6_ = _loc7_;
        }
        return _loc6_;
    }

    override protected function calculateDropIndicatorBounds(param1: DropLocation): Rectangle {
        var _loc7_: Number = NaN;
        var _loc8_: Number = NaN;
        var _loc9_: * = null;
        var _loc10_: Number = NaN;
        var _loc13_: Number = NaN;
        var _loc14_: Number = NaN;
        var _loc2_: Array = this.calculateDropCellIndex(param1.dropPoint.x, param1.dropPoint.y);
        var _loc3_: int = int(_loc2_[0]);
        var _loc4_: int = int(_loc2_[1]);
        var _loc5_: * = this.orientation == TileOrientation.ROWS;
        var _loc6_: int = this.calculateElementCount();
        this._numElementsCached = -1;
        if (_loc5_) {
            if (_loc3_ * this._columnCount + _loc4_ > _loc6_) {
                _loc4_ = _loc6_ - (this._rowCount - 1) * this._columnCount;
            }
        } else if (_loc4_ * this._rowCount + _loc3_ > _loc6_) {
            _loc3_ = _loc6_ - (this._columnCount - 1) * this._rowCount;
        }
        var _loc11_: Number = 0;
        var _loc12_: Number = 0;
        if (_loc5_) {
            _loc10_ = 0 < this._horizontalGap ? this._horizontalGap : 0;
            _loc13_ = _loc4_ * (this._columnWidth + this._horizontalGap) - _loc10_;
            if (this._horizontalGap < 0 && (_loc4_ == this._columnCount || _loc6_ == param1.dropIndex)) {
                _loc13_ -= this._horizontalGap;
            }
            _loc11_ = _loc10_;
            _loc12_ = this._rowHeight;
            if (this._verticalGap < 0 && _loc3_ < this._rowCount - 1) {
                _loc12_ += this._verticalGap + 1;
            }
            if (dropIndicator is IVisualElement) {
                _loc9_ = IVisualElement(dropIndicator);
                _loc11_ = Math.max(Math.min(_loc11_, _loc9_.getMaxBoundsWidth(false)), _loc9_.getMinBoundsWidth(false));
            }
            _loc7_ = _loc13_ + Math.round((_loc10_ - _loc11_) / 2) + this.paddingLeft;
            _loc7_ = Math.max(-1, Math.min(0 - _loc11_ + 1, _loc7_));
            _loc8_ = _loc3_ * (this._rowHeight + this._verticalGap) + this.paddingTop;
        } else {
            _loc10_ = 0 < this._verticalGap ? this._verticalGap : 0;
            _loc14_ = _loc3_ * (this._rowHeight + this._verticalGap) - _loc10_;
            if (this._verticalGap < 0 && (_loc3_ == this._rowCount || _loc6_ == param1.dropIndex)) {
                _loc14_ -= this._verticalGap;
            }
            _loc11_ = this._columnWidth;
            _loc12_ = _loc10_;
            if (this._horizontalGap < 0 && _loc4_ < this._columnCount - 1) {
                _loc11_ += this._horizontalGap + 1;
            }
            if (dropIndicator is IVisualElement) {
                _loc9_ = IVisualElement(dropIndicator);
                _loc12_ = Math.max(Math.min(_loc10_, _loc9_.getMaxBoundsWidth(false)), _loc9_.getMinBoundsWidth(false));
            }
            _loc7_ = _loc4_ * (this._columnWidth + this._horizontalGap) + this.paddingLeft;
            _loc8_ = _loc14_ + Math.round((_loc10_ - _loc12_) / 2) + this.paddingTop;
            _loc8_ = Math.max(-1, Math.min(0 - _loc12_ + 1, _loc8_));
        }
        return new Rectangle(_loc7_, _loc8_, _loc11_, _loc12_);
    }

    private function calculateCellIndex(param1: Number, param2: Number): Array {
        var _loc3_: Number = param1 - this.paddingLeft;
        var _loc4_: Number = param2 - this.paddingTop;
        var _loc5_: int = Math.floor(_loc3_ / (this._columnWidth + this._horizontalGap));
        var _loc6_: int = Math.floor(_loc4_ / (this._rowHeight + this._verticalGap));
        if (_loc5_ < 0) {
            _loc5_ = 0;
        }
        if (_loc5_ >= this._columnCount) {
            _loc5_ = this._columnCount - 1;
        }
        if (_loc6_ < 0) {
            _loc6_ = 0;
        }
        if (_loc6_ >= this._rowCount) {
            _loc6_ = this._rowCount - 1;
        }
        return [_loc6_, _loc5_];
    }

    override mx_internal function getElementNearestScrollPosition(param1: Point, param2: String = "center"): int {
        var _loc14_: int = 0;
        var _loc16_: int = 0;
        var _loc3_: Array = this.calculateCellIndex(param1.x, param1.y);
        var _loc4_: int = int(_loc3_[0]);
        var _loc5_: int = int(_loc3_[1]);
        var _loc6_: int = this._rowCount - 1;
        var _loc7_: int = this._columnCount - 1;
        var _loc8_: Rectangle = new Rectangle(this.leftEdge(_loc5_), this.topEdge(_loc4_), this._columnWidth + this._horizontalGap, this._rowHeight + this._verticalGap);
        var _loc13_: int = 0;
        if (param1.x > _loc8_.left + _loc8_.width / 2) {
            _loc13_ += 1;
        }
        if (param1.y > _loc8_.top + _loc8_.height / 2) {
            _loc13_ += 2;
        }
        if (this.orientation == TileOrientation.ROWS) {
            _loc14_ = _loc4_ * this._columnCount + _loc5_;
        } else {
            _loc14_ = _loc5_ * this._rowCount + _loc4_;
        }
        var _loc15_: GroupBase = GroupBase(target);
        if (_loc14_ >= _loc15_.numElements) {
            return _loc15_.numElements - 1;
        }
        switch (param2) {
            case "topLeft":
                if (_loc13_ == 1 && _loc5_ < _loc7_) {
                    _loc5_++;
                    break;
                }
                if (_loc13_ == 2 && _loc4_ < _loc6_) {
                    _loc4_++;
                    break;
                }
                if (_loc13_ == 3 && _loc4_ < _loc6_ && _loc5_ < _loc7_) {
                    _loc4_++;
                    _loc5_++;
                    break;
                }
                break;
            case "topRight":
                if (_loc13_ == 0 && _loc5_ > 0) {
                    _loc5_--;
                    break;
                }
                if (_loc13_ == 2 && _loc5_ > 0 && _loc4_ < _loc6_) {
                    _loc5_--;
                    _loc4_++;
                    break;
                }
                if (_loc13_ == 3 && _loc4_ < _loc6_) {
                    _loc4_++;
                    break;
                }
                break;
            case "bottomLeft":
                if (_loc13_ == 0 && _loc4_ > 0) {
                    _loc4_--;
                    break;
                }
                if (_loc13_ == 1 && _loc4_ > 0 && _loc5_ < _loc7_) {
                    _loc4_--;
                    _loc5_++;
                    break;
                }
                if (_loc13_ == 3 && _loc5_ < _loc7_) {
                    _loc5_++;
                    break;
                }
                break;
            case "bottomRight":
                if (_loc13_ == 0 && _loc5_ > 0 && _loc4_ > 0) {
                    _loc5_--;
                    _loc4_--;
                    break;
                }
                if (_loc13_ == 1 && _loc4_ > 0) {
                    _loc4_--;
                    break;
                }
                if (_loc13_ == 2 && _loc5_ > 0) {
                    _loc5_--;
                    break;
                }
                break;
            case "center":
        }
        if (this.orientation == TileOrientation.ROWS) {
            _loc16_ = _loc4_ * this._columnCount + _loc5_;
        } else {
            _loc16_ = _loc5_ * this._rowCount + _loc4_;
        }
        if (_loc16_ < _loc15_.numElements) {
            _loc14_ = _loc16_;
        }
        return _loc14_;
    }
}
}
