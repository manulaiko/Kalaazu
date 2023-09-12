package spark.layouts {

import flash.events.Event;
import flash.geom.Point;
import flash.geom.Rectangle;

import mx.containers.utilityClasses.Flex;
import mx.core.FlexVersion;
import mx.core.ILayoutElement;
import mx.core.IVisualElement;
import mx.core.mx_internal;
import mx.events.PropertyChangeEvent;

import spark.components.DataGroup;
import spark.components.supportClasses.GroupBase;
import spark.core.NavigationUnit;
import spark.layouts.supportClasses.DropLocation;
import spark.layouts.supportClasses.LayoutBase;
import spark.layouts.supportClasses.LayoutElementHelper;
import spark.layouts.supportClasses.LinearLayoutVector;

public class HorizontalLayout extends LayoutBase {

    mx_internal static const VERSION: String = "4.6.0.23201";


    private var llv: LinearLayoutVector;

    private var _alignmentBaseline: Object = "maxAscent:0";

    private var _gap: int = 6;

    private var _columnCount: int = -1;

    private var _paddingLeft: Number = 0;

    private var _paddingRight: Number = 0;

    private var _paddingTop: Number = 0;

    private var _paddingBottom: Number = 0;

    private var _requestedMaxColumnCount: int = -1;

    private var _requestedMinColumnCount: int = -1;

    private var _requestedColumnCount: int = -1;

    private var _columnWidth: Number;

    private var _variableColumnWidth: Boolean = true;

    private var _firstIndexInView: int = -1;

    private var _lastIndexInView: int = -1;

    private var _horizontalAlign: String = "left";

    private var _verticalAlign: String = "top";

    public function HorizontalLayout() {
        super();
        mx_internal::dragScrollRegionSizeVertical = 0;
    }

    private static function calculatePercentHeight(param1: ILayoutElement, param2: Number): Number {
        var _loc3_: Number = NaN;
        if (false) {
            _loc3_ = LayoutElementHelper.pinBetween(Math.round(param1.percentHeight * 0.01 * param2), param1.getMinBoundsHeight(), param1.getMaxBoundsHeight());
            return _loc3_ < param2 ? _loc3_ : param2;
        }
        return LayoutElementHelper.pinBetween(Math.min(Math.round(param1.percentHeight * 0.01 * param2), param2), param1.getMinBoundsHeight(), param1.getMaxBoundsHeight());
    }

    private static function sizeLayoutElement(param1: ILayoutElement, param2: Number, param3: String, param4: Number, param5: Number, param6: Boolean, param7: Number): void {
        var _loc8_: Number = NaN;
        if (param3 == VerticalAlign.JUSTIFY || param3 == VerticalAlign.CONTENT_JUSTIFY) {
            _loc8_ = param4;
        } else if (!isNaN(param1.percentHeight)) {
            _loc8_ = calculatePercentHeight(param1, param2);
        }
        if (param6) {
            param1.setLayoutBoundsSize(param5, _loc8_);
        } else {
            param1.setLayoutBoundsSize(param7, _loc8_);
        }
    }

    private static function findIndexAt(param1: Number, param2: int, param3: GroupBase, param4: int, param5: int): int {
        var _loc6_: int = (param4 + param5) / 2;
        var _loc7_: ILayoutElement;
        var _loc8_: Number = (_loc7_ = param3.getElementAt(_loc6_)).getLayoutBoundsX();
        if (param1 >= _loc8_ && param1 < _loc8_ + _loc7_.getLayoutBoundsWidth() + param2) {
            return _loc6_;
        }
        if (param4 == param5) {
            return -1;
        }
        if (param1 < _loc8_) {
            return findIndexAt(param1, param2, param3, param4, Math.max(param4, _loc6_ - 1));
        }
        return findIndexAt(param1, param2, param3, Math.min(_loc6_ + 1, param5), param5);
    }

    private static function findLayoutElementIndex(param1: GroupBase, param2: int, param3: int): int {
        var _loc5_: * = null;
        var _loc4_: int = param1.numElements;
        while (param2 >= 0 && param2 < _loc4_) {
            if ((Boolean(_loc5_ = param1.getElementAt(param2))) && _loc5_.includeInLayout) {
                return param2;
            }
            param2 += param3;
        }
        return -1;
    }

    mx_internal function get alignmentBaseline(): Object {
        return this._alignmentBaseline;
    }

    mx_internal function set alignmentBaseline(param1: Object): void {
        if (this._alignmentBaseline == param1) {
            return;
        }
        this._alignmentBaseline = param1;
        this.invalidateTargetSizeAndDisplayList();
    }

    public function get gap(): int {
        return this._gap;
    }

    public function set gap(param1: int): void {
        if (this._gap == param1) {
            return;
        }
        this._gap = param1;
        this.invalidateTargetSizeAndDisplayList();
    }

    [Bindable("propertyChange")]
    public function get columnCount(): int {
        return this._columnCount;
    }

    private function setColumnCount(param1: int): void {
        if (this._columnCount == param1) {
            return;
        }
        var _loc2_: int = this._columnCount;
        this._columnCount = param1;
        dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "columnCount", _loc2_, param1));
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

    public function get requestedMaxColumnCount(): int {
        return this._requestedMaxColumnCount;
    }

    public function set requestedMaxColumnCount(param1: int): void {
        if (this._requestedMaxColumnCount == param1) {
            return;
        }
        this._requestedMaxColumnCount = param1;
        if (target) {
            target.invalidateSize();
        }
    }

    public function get requestedMinColumnCount(): int {
        return this._requestedMinColumnCount;
    }

    public function set requestedMinColumnCount(param1: int): void {
        if (this._requestedMinColumnCount == param1) {
            return;
        }
        this._requestedMinColumnCount = param1;
        if (target) {
            target.invalidateSize();
        }
    }

    public function get requestedColumnCount(): int {
        return this._requestedColumnCount;
    }

    public function set requestedColumnCount(param1: int): void {
        if (this._requestedColumnCount == param1) {
            return;
        }
        this._requestedColumnCount = param1;
        if (target) {
            target.invalidateSize();
        }
    }

    public function get columnWidth(): Number {
        var _loc1_: * = null;
        if (!isNaN(this._columnWidth)) {
            return this._columnWidth;
        }
        _loc1_ = typicalLayoutElement;
        return !!_loc1_ ? _loc1_.getPreferredBoundsWidth() : 0;
    }

    public function set columnWidth(param1: Number): void {
        if (this._columnWidth == param1) {
            return;
        }
        this._columnWidth = param1;
        this.invalidateTargetSizeAndDisplayList();
    }

    public function get variableColumnWidth(): Boolean {
        return this._variableColumnWidth;
    }

    public function set variableColumnWidth(param1: Boolean): void {
        if (param1 == this._variableColumnWidth) {
            return;
        }
        this._variableColumnWidth = param1;
        this.invalidateTargetSizeAndDisplayList();
    }

    [Bindable("indexInViewChanged")]
    public function get firstIndexInView(): int {
        return this._firstIndexInView;
    }

    [Bindable("indexInViewChanged")]
    public function get lastIndexInView(): int {
        return this._lastIndexInView;
    }

    public function get horizontalAlign(): String {
        return this._horizontalAlign;
    }

    public function set horizontalAlign(param1: String): void {
        if (param1 == this._horizontalAlign) {
            return;
        }
        this._horizontalAlign = param1;
        var _loc2_: GroupBase = target;
        if (_loc2_) {
            _loc2_.invalidateDisplayList();
        }
    }

    public function get verticalAlign(): String {
        return this._verticalAlign;
    }

    public function set verticalAlign(param1: String): void {
        var _loc3_: * = null;
        if (param1 == this._verticalAlign) {
            return;
        }
        var _loc2_: String = this._verticalAlign;
        this._verticalAlign = param1;
        if (_loc2_ == VerticalAlign.BASELINE || param1 == VerticalAlign.BASELINE) {
            this.invalidateTargetSizeAndDisplayList();
        } else {
            _loc3_ = target;
            if (_loc3_) {
                _loc3_.invalidateDisplayList();
            }
        }
    }

    private function setIndexInView(param1: int, param2: int): void {
        if (this._firstIndexInView == param1 && this._lastIndexInView == param2) {
            return;
        }
        this._firstIndexInView = param1;
        this._lastIndexInView = param2;
        dispatchEvent(new Event("indexInViewChanged"));
    }

    override public function set clipAndEnableScrolling(param1: Boolean): void {
        var _loc3_: * = null;
        super.clipAndEnableScrolling = param1;
        var _loc2_: String = this.horizontalAlign;
        if (_loc2_ == HorizontalAlign.CENTER || _loc2_ == HorizontalAlign.RIGHT) {
            _loc3_ = target;
            if (_loc3_) {
                _loc3_.invalidateDisplayList();
            }
        }
    }

    override public function clearVirtualLayoutCache(): void {
        this.llv = null;
        var _loc1_: GroupBase = GroupBase(target);
        if (!_loc1_) {
            return;
        }
        target.invalidateSize();
        target.invalidateDisplayList();
    }

    override public function getElementBounds(param1: int): Rectangle {
        if (!useVirtualLayout) {
            return super.getElementBounds(param1);
        }
        var _loc2_: GroupBase = GroupBase(target);
        if (!_loc2_ || param1 < 0 || param1 >= _loc2_.numElements || !this.llv) {
            return null;
        }
        return this.llv.getBounds(param1);
    }

    public function fractionOfElementInView(param1: int): Number {
        var _loc5_: Number = NaN;
        var _loc6_: Number = NaN;
        var _loc11_: * = null;
        var _loc2_: GroupBase = target;
        if (!_loc2_) {
            return 0;
        }
        if (param1 < 0 || param1 >= _loc2_.numElements) {
            return 0;
        }
        if (!clipAndEnableScrolling) {
            return 1;
        }
        var _loc3_: int = this.firstIndexInView;
        var _loc4_: int = this.lastIndexInView;
        if (_loc3_ == -1 || _loc4_ == -1 || param1 < _loc3_ || param1 > _loc4_) {
            return 0;
        }
        if (param1 > _loc3_ && param1 < _loc4_) {
            return 1;
        }
        if (useVirtualLayout) {
            if (!this.llv) {
                return 0;
            }
            _loc5_ = this.llv.start(param1);
            _loc6_ = this.llv.getMajorSize(param1);
        } else {
            if (!(_loc11_ = _loc2_.getElementAt(param1)) || !_loc11_.includeInLayout) {
                return 0;
            }
            _loc5_ = _loc11_.getLayoutBoundsX();
            _loc6_ = _loc11_.getLayoutBoundsWidth();
        }
        var _loc7_: Number;
        var _loc8_: Number = (_loc7_ = _loc2_.horizontalScrollPosition) + _loc2_.width;
        var _loc9_: Number;
        var _loc10_: Number = (_loc9_ = _loc5_) + _loc6_;
        if (_loc9_ >= _loc10_) {
            return 1;
        }
        if (_loc9_ >= _loc7_ && _loc10_ <= _loc8_) {
            return 1;
        }
        return (Math.min(_loc8_, _loc10_) - Math.max(_loc7_, _loc9_)) / (_loc10_ - _loc9_);
    }

    override protected function scrollPositionChanged(): void {
        var _loc6_: int = 0;
        var _loc7_: int = 0;
        var _loc8_: int = 0;
        var _loc9_: * = null;
        var _loc10_: Number = NaN;
        var _loc11_: Number = NaN;
        var _loc12_: int = 0;
        var _loc13_: * = null;
        var _loc14_: Number = NaN;
        var _loc15_: Number = NaN;
        var _loc16_: * = null;
        var _loc17_: * = null;
        var _loc18_: * = null;
        super.scrollPositionChanged();
        var _loc1_: GroupBase = target;
        if (!_loc1_) {
            return;
        }
        var _loc2_: int = _loc1_.numElements - 1;
        if (_loc2_ < 0) {
            this.setIndexInView(-1, -1);
            return;
        }
        var _loc3_: Rectangle = getScrollRect();
        if (!_loc3_) {
            this.setIndexInView(0, _loc2_);
            return;
        }
        var _loc4_: Number = _loc3_.left;
        var _loc5_: Number;
        if ((_loc5_ = _loc3_.right - 0.0001) <= _loc4_) {
            this.setIndexInView(-1, -1);
            return;
        }
        if (useVirtualLayout && !this.llv) {
            this.setIndexInView(-1, -1);
            return;
        }
        if (useVirtualLayout) {
            _loc6_ = this.llv.indexOf(_loc4_);
            _loc7_ = this.llv.indexOf(_loc5_);
        } else {
            _loc6_ = findIndexAt(_loc4_ + this.gap, this.gap, _loc1_, 0, _loc2_);
            _loc7_ = findIndexAt(_loc5_, this.gap, _loc1_, 0, _loc2_);
        }
        if (_loc6_ == -1) {
            if ((_loc8_ = findLayoutElementIndex(_loc1_, 0, 1)) != -1) {
                _loc10_ = (_loc9_ = _loc1_.getElementAt(_loc8_)).getLayoutBoundsX();
                _loc11_ = _loc9_.getLayoutBoundsWidth();
                if (_loc10_ < _loc5_ && _loc10_ + _loc11_ > _loc4_) {
                    _loc6_ = _loc8_;
                }
            }
        }
        if (_loc7_ == -1) {
            if ((_loc12_ = findLayoutElementIndex(_loc1_, _loc2_, -1)) != -1) {
                _loc14_ = (_loc13_ = _loc1_.getElementAt(_loc12_)).getLayoutBoundsX();
                _loc15_ = _loc13_.getLayoutBoundsWidth();
                if (_loc14_ < _loc5_ && _loc14_ + _loc15_ > _loc4_) {
                    _loc7_ = _loc12_;
                }
            }
        }
        if (useVirtualLayout) {
            _loc16_ = _loc1_.getElementAt(this._firstIndexInView);
            _loc17_ = _loc1_.getElementAt(this._lastIndexInView);
            _loc18_ = getScrollRect();
            if (!_loc16_ || !_loc17_ || _loc18_.left < _loc16_.getLayoutBoundsX() || _loc18_.right >= _loc17_.getLayoutBoundsX() + _loc17_.getLayoutBoundsWidth()) {
                _loc1_.invalidateDisplayList();
            }
        }
        this.setIndexInView(_loc6_, _loc7_);
    }

    private function findLayoutElementBounds(param1: GroupBase, param2: int, param3: int, param4: Rectangle): Rectangle {
        var _loc6_: * = null;
        var _loc7_: Boolean = false;
        var _loc8_: Boolean = false;
        var _loc5_: int = param1.numElements;
        if (this.fractionOfElementInView(param2) >= 1) {
            param2 += param3;
            if (param2 < 0) {
                return new Rectangle(0, 0, this.paddingLeft, 0);
            }
            if (param2 >= _loc5_) {
                return new Rectangle(this.getElementBounds(_loc5_ - 1).right, 0, this.paddingRight, 0);
            }
        }
        while (param2 >= 0 && param2 < _loc5_) {
            if (_loc6_ = this.getElementBounds(param2)) {
                _loc7_ = param3 == -1 && _loc6_.left == param4.left && _loc6_.right >= param4.right;
                _loc8_ = param3 == 1 && _loc6_.right == param4.right && _loc6_.left <= param4.left;
                if (!(_loc7_ || _loc8_)) {
                    return _loc6_;
                }
            }
            param2 += param3;
        }
        return null;
    }

    override protected function getElementBoundsLeftOfScrollRect(param1: Rectangle): Rectangle {
        return this.findLayoutElementBounds(target, this.firstIndexInView, -1, param1);
    }

    override protected function getElementBoundsRightOfScrollRect(param1: Rectangle): Rectangle {
        return this.findLayoutElementBounds(target, this.lastIndexInView, 1, param1);
    }

    private function getElementWidth(param1: ILayoutElement, param2: Number, param3: SizesAndLimit): void {
        var _loc4_: Number = isNaN(param2) ? Math.ceil(param1.getPreferredBoundsWidth()) : param2;
        var _loc5_: * = !isNaN(param1.percentWidth);
        var _loc6_: Number = !isNaN(param1.percentWidth) ? Math.ceil(param1.getMinBoundsWidth()) : _loc4_;
        param3.preferredSize = _loc4_;
        param3.minSize = _loc6_;
    }

    private function getElementHeight(param1: ILayoutElement, param2: Boolean, param3: SizesAndLimit): void {
        var _loc4_: Number = Math.ceil(param1.getPreferredBoundsHeight());
        var _loc5_: Boolean;
        var _loc6_: Number = (_loc5_ = !isNaN(param1.percentHeight) || param2) ? Math.ceil(param1.getMinBoundsHeight()) : _loc4_;
        param3.preferredSize = _loc4_;
        param3.minSize = _loc6_;
    }

    private function calculateBaselineTopBottom(param1: Boolean): Array {
        var _loc6_: Boolean = false;
        var _loc10_: * = null;
        var _loc11_: Number = NaN;
        var _loc12_: Number = NaN;
        var _loc13_: Number = NaN;
        var _loc14_: Number = NaN;
        var _loc15_: Number = NaN;
        var _loc16_: Number = NaN;
        var _loc2_: Number = 0;
        var _loc3_: Number = 0;
        var _loc4_: Number = 0;
        var _loc7_: Array;
        if ((_loc7_ = LayoutElementHelper.parseConstraintExp(this.mx_internal::alignmentBaseline)).length == 2 && _loc7_[1] == "maxAscent") {
            _loc2_ = Number(_loc7_[0]);
            _loc6_ = true;
        } else {
            _loc6_ = false;
            _loc3_ = Number(_loc7_[0]);
            if (isNaN(_loc3_)) {
                _loc3_ = 0;
                _loc6_ = true;
            }
        }
        var _loc8_: int = 0;
        var _loc9_: int = 0;
        while (_loc9_ < _loc8_) {
            if (!(!(_loc10_ = target.getElementAt(_loc9_)) || !_loc10_.includeInLayout)) {
                _loc11_ = _loc10_.baseline as Number;
                if (isNaN(_loc11_)) {
                    _loc11_ = 0;
                }
                _loc13_ = (_loc12_ = _loc10_.baselinePosition) - _loc11_;
                if (_loc6_) {
                    _loc3_ = Math.max(_loc13_, _loc3_);
                }
                if (param1) {
                    _loc16_ = _loc15_ = (_loc14_ = _loc10_.getPreferredBoundsHeight()) - _loc13_;
                    if (!isNaN(_loc10_.percentHeight)) {
                        _loc16_ = _loc10_.getMinBoundsHeight() - _loc13_;
                    }
                    _loc4_ = Math.max(_loc15_, _loc4_);
                }
            }
            _loc9_++;
        }
        if (_loc6_) {
            _loc3_ += _loc2_;
        }
        return [_loc3_, _loc4_, 0];
    }

    private function getColumsToMeasure(param1: int): int {
        var _loc2_: int = 0;
        if (this.requestedColumnCount != -1) {
            _loc2_ = this.requestedColumnCount;
        } else {
            _loc2_ = param1;
            if (this.requestedMaxColumnCount != -1) {
                _loc2_ = Math.min(this.requestedMaxColumnCount, _loc2_);
            }
            if (this.requestedMinColumnCount != -1) {
                _loc2_ = Math.max(this.requestedMinColumnCount, _loc2_);
            }
        }
        return _loc2_;
    }

    private function measureReal(param1: GroupBase): void {
        var _loc15_: * = null;
        var _loc19_: * = null;
        var _loc20_: Number = NaN;
        var _loc21_: Number = NaN;
        var _loc22_: Number = NaN;
        var _loc23_: Number = NaN;
        var _loc2_: SizesAndLimit = new SizesAndLimit();
        var _loc3_: * = this.verticalAlign == VerticalAlign.BASELINE;
        var _loc4_: * = this.verticalAlign == VerticalAlign.JUSTIFY;
        var _loc5_: int;
        var _loc6_: int = _loc5_ = param1.numElements;
        var _loc7_: int = this.requestedColumnCount;
        var _loc8_: int = 0;
        var _loc9_: Number = 0;
        var _loc10_: Number = 0;
        var _loc11_: Number = 0;
        var _loc12_: Number = 0;
        var _loc13_: Number = NaN;
        if (!this.variableColumnWidth) {
            _loc13_ = this.columnWidth;
        }
        var _loc14_: int = this.getColumsToMeasure(_loc6_);
        var _loc16_: int = 0;
        while (_loc16_ < _loc5_) {
            if (!(_loc15_ = param1.getElementAt(_loc16_)) || !_loc15_.includeInLayout) {
                _loc6_--;
            } else {
                if (!_loc3_) {
                    this.getElementHeight(_loc15_, _loc4_, _loc2_);
                    _loc9_ = Math.max(_loc9_, _loc2_.preferredSize);
                    _loc11_ = Math.max(_loc11_, _loc2_.minSize);
                }
                if (_loc8_ < _loc14_) {
                    this.getElementWidth(_loc15_, _loc13_, _loc2_);
                    _loc10_ += _loc2_.preferredSize;
                    _loc12_ += _loc2_.minSize;
                    _loc8_++;
                }
            }
            _loc16_++;
        }
        _loc14_ = this.getColumsToMeasure(_loc6_);
        if (_loc8_ < _loc14_) {
            if (_loc15_ = typicalLayoutElement) {
                if (!_loc3_) {
                    this.getElementHeight(_loc15_, _loc4_, _loc2_);
                    _loc9_ = Math.max(_loc9_, _loc2_.preferredSize);
                    _loc11_ = Math.max(_loc11_, _loc2_.minSize);
                }
                this.getElementWidth(_loc15_, _loc13_, _loc2_);
                _loc10_ += _loc2_.preferredSize * (_loc14_ - _loc8_);
                _loc12_ += _loc2_.minSize * (_loc14_ - _loc8_);
                _loc8_ = _loc14_;
            }
        }
        if (_loc3_) {
            _loc20_ = Number((_loc19_ = this.calculateBaselineTopBottom(true))[0]);
            _loc21_ = Number(_loc19_[1]);
            _loc22_ = Number(_loc19_[2]);
            _loc9_ = Math.ceil(_loc20_ + _loc21_);
            _loc11_ = Math.ceil(_loc20_ + _loc22_);
        }
        if (_loc8_ > 1) {
            _loc23_ = this.gap * (_loc8_ - 1);
            _loc10_ += _loc23_;
            _loc12_ += _loc23_;
        }
        var _loc17_: Number = this.paddingLeft + this.paddingRight;
        var _loc18_: Number = this.paddingTop + this.paddingBottom;
        param1.measuredHeight = _loc9_ + _loc18_;
        param1.measuredWidth = _loc10_ + _loc17_;
        param1.measuredMinHeight = _loc11_ + _loc18_;
        param1.measuredMinWidth = _loc12_ + _loc17_;
    }

    private function updateLLV(param1: GroupBase): void {
        var _loc3_: Number = NaN;
        var _loc4_: Number = NaN;
        if (!this.llv) {
            this.llv = new LinearLayoutVector(LinearLayoutVector.HORIZONTAL);
            this.llv.defaultMinorSize = 22;
            this.llv.defaultMajorSize = 71;
        }
        var _loc2_: ILayoutElement = typicalLayoutElement;
        if (_loc2_) {
            _loc3_ = _loc2_.getPreferredBoundsWidth();
            _loc4_ = _loc2_.getPreferredBoundsHeight();
            this.llv.defaultMinorSize = _loc4_;
            this.llv.defaultMajorSize = _loc3_;
        }
        if (!isNaN(this._columnWidth)) {
            this.llv.defaultMajorSize = this._columnWidth;
        }
        if (param1) {
            this.llv.length = param1.numElements;
        }
        this.llv.gap = this.gap;
        this.llv.majorAxisOffset = this.paddingLeft;
    }

    override public function elementAdded(param1: int): void {
        if (param1 >= 0 && useVirtualLayout && Boolean(this.llv)) {
            this.llv.insert(param1);
        }
    }

    override public function elementRemoved(param1: int): void {
        if (param1 >= 0 && useVirtualLayout && Boolean(this.llv)) {
            this.llv.remove(param1);
        }
    }

    private function measureVirtual(param1: GroupBase): void {
        var _loc6_: int = 0;
        var _loc7_: Number = NaN;
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc10_: int = 0;
        var _loc11_: * = null;
        var _loc12_: Number = NaN;
        var _loc2_: int = param1.numElements;
        var _loc3_: int = this.getColumsToMeasure(_loc2_);
        var _loc4_: Number = this.paddingLeft + this.paddingRight;
        var _loc5_: Number = this.paddingTop + this.paddingBottom;
        if (_loc3_ <= 0) {
            param1.measuredWidth = param1.measuredMinWidth = _loc4_;
            param1.measuredHeight = param1.measuredMinHeight = _loc5_;
            return;
        }
        this.updateLLV(param1);
        if (this.variableColumnWidth) {
            _loc6_ = -1;
            if (_loc3_ > this.llv.length) {
                _loc6_ = this.llv.length;
                this.llv.length = _loc3_;
            }
            _loc7_ = this.llv.end(_loc3_ - 1) + this.paddingRight;
            if (_loc8_ = param1 as DataGroup) {
                _loc9_ = _loc8_.getItemIndicesInView();
                for each(_loc10_ in _loc9_) {
                    if (_loc11_ = _loc8_.getElementAt(_loc10_)) {
                        _loc7_ = (_loc7_ -= this.llv.getMajorSize(_loc10_)) + _loc11_.getPreferredBoundsWidth();
                    }
                }
            }
            param1.measuredWidth = _loc7_;
            if (_loc6_ != -1) {
                this.llv.length = _loc6_;
            }
        } else {
            _loc12_ = _loc3_ > 1 ? (_loc3_ - 1) * this.gap : 0;
            param1.measuredWidth = _loc3_ * this.columnWidth + _loc12_ + _loc4_;
        }
        param1.measuredHeight = this.llv.minorSize + _loc5_;
        param1.measuredMinWidth = param1.measuredWidth;
        param1.measuredMinHeight = this.verticalAlign == VerticalAlign.JUSTIFY ? this.llv.minMinorSize + _loc5_ : param1.measuredHeight;
    }

    override public function measure(): void {
        var _loc1_: GroupBase = target;
        if (!_loc1_) {
            return;
        }
        if (useVirtualLayout) {
            this.measureVirtual(_loc1_);
        } else {
            this.measureReal(_loc1_);
        }
        _loc1_.measuredWidth = Math.ceil(_loc1_.measuredWidth);
        _loc1_.measuredHeight = Math.ceil(_loc1_.measuredHeight);
        _loc1_.measuredMinWidth = Math.ceil(_loc1_.measuredMinWidth);
        _loc1_.measuredMinHeight = Math.ceil(_loc1_.measuredMinHeight);
    }

    override public function getNavigationDestinationIndex(param1: int, param2: uint, param3: Boolean): int {
        var _loc5_: int = 0;
        var _loc6_: * = null;
        var _loc7_: Number = NaN;
        var _loc8_: int = 0;
        var _loc9_: int = 0;
        var _loc10_: int = 0;
        var _loc11_: int = 0;
        if (!target || true) {
            return -1;
        }
        var _loc4_: int = -1;
        if (param1 == -1) {
            if (param2 == NavigationUnit.LEFT) {
                return param3 ? _loc4_ : -1;
            }
            if (param2 == NavigationUnit.RIGHT) {
                return 0;
            }
        }
        param1 = Math.max(0, Math.min(_loc4_, param1));
        loop2:
            switch (param2) {
                case NavigationUnit.LEFT:
                    if (param3 && param1 == 0) {
                        _loc5_ = _loc4_;
                        break;
                    }
                    _loc5_ = param1 - 1;
                    break;
                case NavigationUnit.RIGHT:
                    if (param3 && param1 == _loc4_) {
                        _loc5_ = 0;
                        break;
                    }
                    _loc5_ = param1 + 1;
                    break;
                case NavigationUnit.PAGE_UP:
                case NavigationUnit.PAGE_LEFT:
                    _loc9_ = _loc8_ = this.firstIndexInView;
                    if (this.fractionOfElementInView(_loc9_) < 1) {
                        _loc9_ += 1;
                    }
                    if (_loc9_ < param1 && param1 <= this.lastIndexInView) {
                        _loc5_ = _loc9_;
                        break;
                    }
                    if (param1 == _loc9_ || param1 == _loc8_) {
                        _loc7_ = getHorizontalScrollPositionDelta(NavigationUnit.PAGE_LEFT) + getScrollRect().left;
                    } else {
                        _loc7_ = this.getElementBounds(param1).right - getScrollRect().width;
                    }
                    _loc5_ = param1 - 1;
                    while (true) {
                        if (0 > _loc5_) {
                            break loop2;
                        }
                        if ((Boolean(_loc6_ = this.getElementBounds(_loc5_))) && _loc6_.left < _loc7_) {
                            _loc5_ = Math.min(param1 - 1, _loc5_ + 1);
                            break loop2;
                        }
                        _loc5_--;
                    }
                    break;
                case NavigationUnit.PAGE_DOWN:
                case NavigationUnit.PAGE_RIGHT:
                    _loc11_ = _loc10_ = this.lastIndexInView;
                    if (this.fractionOfElementInView(_loc11_) < 1) {
                        _loc11_--;
                    }
                    if (this.firstIndexInView <= param1 && param1 < _loc11_) {
                        _loc5_ = _loc11_;
                        break;
                    }
                    if (param1 == _loc11_ || param1 == _loc10_) {
                        _loc7_ = getHorizontalScrollPositionDelta(NavigationUnit.PAGE_RIGHT) + getScrollRect().right;
                    } else {
                        _loc7_ = this.getElementBounds(param1).left + getScrollRect().width;
                    }
                    _loc5_ = param1 + 1;
                    while (true) {
                        if (_loc5_ > _loc4_) {
                            break loop2;
                        }
                        if ((Boolean(_loc6_ = this.getElementBounds(_loc5_))) && _loc6_.right > _loc7_) {
                            _loc5_ = Math.max(param1 + 1, _loc5_ - 1);
                            break loop2;
                        }
                        _loc5_++;
                    }
                    break;
                default:
                    return super.getNavigationDestinationIndex(param1, param2, param3);
            }
        return Math.max(0, Math.min(_loc4_, _loc5_));
    }

    private function calculateElementHeight(param1: ILayoutElement, param2: Number, param3: Number): Number {
        var _loc5_: Number = NaN;
        var _loc4_: Number = param1.percentHeight;
        if (!isNaN(_loc4_)) {
            _loc5_ = _loc4_ * 0.01 * param2;
            return Math.min(param2, Math.min(param1.getMaxBoundsHeight(), Math.max(param1.getMinBoundsHeight(), _loc5_)));
        }
        switch (this.verticalAlign) {
            case VerticalAlign.JUSTIFY:
                return param2;
            case VerticalAlign.CONTENT_JUSTIFY:
                return Math.max(param1.getPreferredBoundsHeight(), param3);
            default:
                return NaN;
        }
    }

    private function calculateElementY(param1: ILayoutElement, param2: Number, param3: Number): Number {
        switch (this.verticalAlign) {
            case VerticalAlign.MIDDLE:
                return Math.round((param3 - param2) * 0.5);
            case VerticalAlign.BOTTOM:
                return param3 - param2;
            default:
                return 0;
        }
    }

    private function updateDisplayListVirtual(): void {
        var _loc6_: Number = NaN;
        var _loc7_: Number = NaN;
        var _loc21_: * = null;
        var _loc22_: Number = NaN;
        var _loc23_: Number = NaN;
        var _loc24_: Number = NaN;
        var _loc25_: Number = NaN;
        var _loc26_: Number = NaN;
        var _loc27_: * = null;
        var _loc1_: GroupBase = target;
        var _loc2_: int = _loc1_.numElements;
        var _loc3_: Number = Math.max(0, _loc1_.height - this.paddingTop - this.paddingBottom);
        var _loc4_: Number;
        var _loc5_: Number = (_loc4_ = _loc1_.horizontalScrollPosition) + _loc1_.width;
        this.updateLLV(_loc1_);
        var _loc8_: int;
        if ((_loc8_ = this.llv.indexOf(Math.max(0, _loc4_ + this.gap))) == -1) {
            _loc6_ = this.llv.end(this.llv.length - 1) - this.paddingLeft;
            _loc7_ = Math.ceil(_loc6_ + this.paddingLeft + this.paddingRight);
            _loc1_.setContentSize(_loc7_, _loc1_.contentHeight);
            return;
        }
        var _loc9_: Number = NaN;
        if (!this.variableColumnWidth) {
            _loc9_ = this.columnWidth;
        }
        var _loc10_: * = this.verticalAlign == VerticalAlign.JUSTIFY;
        var _loc11_: Number = NaN;
        var _loc12_: Number = _loc10_ ? Math.max(this.llv.minMinorSize, _loc3_) : this.llv.minorSize;
        var _loc13_: Number = _loc10_ ? Math.max(this.llv.minMinorSize, _loc3_) : this.llv.minorSize;
        var _loc14_: Number = Math.max(_loc13_, _loc3_);
        var _loc15_: Number = this.llv.start(_loc8_);
        var _loc16_: int = _loc8_;
        var _loc17_: Number = this.paddingTop;
        while (_loc15_ < _loc5_ && _loc16_ < _loc2_) {
            _loc21_ = _loc1_.getVirtualElementAt(_loc16_);
            _loc22_ = _loc9_;
            _loc23_ = this.calculateElementHeight(_loc21_, _loc3_, _loc14_);
            _loc21_.setLayoutBoundsSize(_loc22_, _loc23_);
            _loc22_ = _loc21_.getLayoutBoundsWidth();
            _loc23_ = _loc21_.getLayoutBoundsHeight();
            _loc24_ = _loc17_ + this.calculateElementY(_loc21_, _loc23_, _loc14_);
            _loc21_.setLayoutBoundsPosition(_loc15_, _loc24_);
            this.llv.cacheDimensions(_loc16_, _loc21_);
            _loc15_ += _loc22_ + this.gap;
            _loc16_++;
        }
        var _loc18_: int = _loc16_ - 1;
        if (!_loc10_ && this.llv.minorSize != _loc13_) {
            _loc13_ = this.llv.minorSize;
            _loc14_ = Math.max(_loc13_, _loc3_);
            if (this.verticalAlign != VerticalAlign.TOP && this.verticalAlign != VerticalAlign.JUSTIFY) {
                _loc16_ = _loc8_;
                while (_loc16_ <= _loc18_) {
                    _loc21_ = _loc1_.getElementAt(_loc16_);
                    _loc23_ = this.calculateElementHeight(_loc21_, _loc3_, _loc14_);
                    _loc21_.setLayoutBoundsSize(_loc21_.getLayoutBoundsWidth(), _loc23_);
                    _loc23_ = _loc21_.getLayoutBoundsHeight();
                    _loc24_ = _loc17_ + this.calculateElementY(_loc21_, _loc23_, _loc14_);
                    _loc21_.setLayoutBoundsPosition(_loc21_.getLayoutBoundsX(), _loc24_);
                    _loc16_++;
                }
            }
        }
        _loc6_ = this.llv.end(this.llv.length - 1) - this.paddingLeft;
        var _loc19_: Number = Math.max(0, _loc1_.width - this.paddingLeft - this.paddingRight);
        if (_loc6_ < _loc19_) {
            _loc25_ = _loc19_ - _loc6_;
            _loc26_ = 0;
            if ((_loc27_ = this.horizontalAlign) == HorizontalAlign.CENTER) {
                _loc26_ = Math.round(_loc25_ / 2);
            } else if (_loc27_ == HorizontalAlign.RIGHT) {
                _loc26_ = _loc25_;
            }
            if (_loc26_ > 0) {
                _loc16_ = _loc8_;
                while (_loc16_ <= _loc18_) {
                    (_loc21_ = _loc1_.getElementAt(_loc16_)).setLayoutBoundsPosition(_loc26_ + _loc21_.getLayoutBoundsX(), _loc21_.getLayoutBoundsY());
                    _loc16_++;
                }
                _loc6_ += _loc26_;
            }
        }
        this.setColumnCount(_loc16_ - _loc8_);
        this.setIndexInView(_loc8_, _loc18_);
        _loc7_ = Math.ceil(_loc6_ + this.paddingLeft + this.paddingRight);
        var _loc20_: Number = Math.ceil(_loc13_ + this.paddingTop + this.paddingBottom);
        _loc1_.setContentSize(_loc7_, _loc20_);
    }

    private function updateDisplayListReal(): void {
        var _loc4_: * = null;
        var _loc21_: int = 0;
        var _loc22_: Number = NaN;
        var _loc23_: * = null;
        var _loc24_: * = null;
        var _loc25_: Number = NaN;
        var _loc26_: Number = NaN;
        var _loc27_: Number = NaN;
        var _loc28_: Number = NaN;
        var _loc29_: Number = NaN;
        var _loc1_: GroupBase = target;
        var _loc2_: Number = Math.max(0, _loc1_.width - this.paddingLeft - this.paddingRight);
        var _loc3_: Number = Math.max(0, _loc1_.height - this.paddingTop - this.paddingBottom);
        var _loc5_: int = _loc1_.numElements;
        var _loc6_: Number = _loc3_;
        if (this.verticalAlign == VerticalAlign.CONTENT_JUSTIFY || clipAndEnableScrolling && (this.verticalAlign == VerticalAlign.MIDDLE || this.verticalAlign == VerticalAlign.BOTTOM)) {
            _loc21_ = 0;
            while (_loc21_ < _loc5_) {
                if (!(!(_loc4_ = _loc1_.getElementAt(_loc21_)) || !_loc4_.includeInLayout)) {
                    if (!isNaN(_loc4_.percentHeight)) {
                        _loc22_ = calculatePercentHeight(_loc4_, _loc3_);
                    } else {
                        _loc22_ = _loc4_.getPreferredBoundsHeight();
                    }
                    _loc6_ = Math.max(_loc6_, Math.ceil(_loc22_));
                }
                _loc21_++;
            }
        }
        var _loc7_: Number = this.distributeWidth(_loc2_, _loc3_, _loc6_);
        var _loc8_: Number = 0;
        if (this.verticalAlign == VerticalAlign.MIDDLE) {
            _loc8_ = 0.5;
        } else if (this.verticalAlign == VerticalAlign.BOTTOM) {
            _loc8_ = 1;
        }
        var _loc9_: Number = 0;
        var _loc10_: * = this.verticalAlign == VerticalAlign.BASELINE;
        if (this.verticalAlign == VerticalAlign.BASELINE) {
            _loc9_ = Number((_loc23_ = this.calculateBaselineTopBottom(false))[0]);
        }
        var _loc11_: * = 0;
        var _loc12_: Number;
        var _loc13_: Number = (_loc12_ = _loc1_.horizontalScrollPosition) + _loc2_;
        var _loc14_: Number = this.paddingLeft;
        var _loc15_: Number = this.paddingTop;
        var _loc16_: Number = this.paddingLeft;
        var _loc17_: Number = this.paddingTop;
        var _loc18_: int = -1;
        var _loc19_: int = -1;
        if (_loc7_ > 0 || !clipAndEnableScrolling) {
            if ((_loc24_ = this.horizontalAlign) == HorizontalAlign.CENTER) {
                _loc14_ = this.paddingLeft + Math.round(_loc7_ / 2);
            } else if (_loc24_ == HorizontalAlign.RIGHT) {
                _loc14_ = this.paddingLeft + _loc7_;
            }
        }
        var _loc20_: int = 0;
        while (_loc20_ < _loc5_) {
            if (!(!(_loc4_ = _loc1_.getElementAt(_loc20_)) || !_loc4_.includeInLayout)) {
                _loc25_ = Math.ceil(_loc4_.getLayoutBoundsWidth());
                _loc26_ = Math.ceil(_loc4_.getLayoutBoundsHeight());
                if (_loc10_) {
                    _loc28_ = _loc4_.baseline as Number;
                    if (isNaN(_loc28_)) {
                        _loc28_ = 0;
                    }
                    _loc29_ = _loc4_.baselinePosition;
                    _loc27_ = _loc15_ + _loc9_ + _loc28_ - _loc29_;
                } else {
                    _loc27_ = _loc15_ + (_loc6_ - _loc26_) * _loc8_;
                    if (_loc8_ == 0.5) {
                        _loc27_ = Math.round(_loc27_);
                    }
                }
                _loc4_.setLayoutBoundsPosition(_loc14_, _loc27_);
                _loc16_ = Math.max(_loc16_, _loc14_ + _loc25_);
                _loc17_ = Math.max(_loc17_, _loc27_ + _loc26_);
                if (!clipAndEnableScrolling || _loc14_ < _loc13_ && _loc14_ + _loc25_ > _loc12_ || _loc25_ <= 0 && (_loc14_ == _loc13_ || _loc14_ == _loc12_)) {
                    _loc11_ += 1;
                    if (_loc18_ == -1) {
                        _loc18_ = _loc19_ = _loc20_;
                    } else {
                        _loc19_ = _loc20_;
                    }
                }
                _loc14_ += _loc25_ + this.gap;
            }
            _loc20_++;
        }
        this.setColumnCount(_loc11_);
        this.setIndexInView(_loc18_, _loc19_);
        _loc1_.setContentSize(Math.ceil(_loc16_ + this.paddingRight), Math.ceil(_loc17_ + this.paddingBottom));
    }

    private function distributeWidth(param1: Number, param2: Number, param3: Number): Number {
        var _loc7_: * = null;
        var _loc8_: Number = NaN;
        var _loc9_: * = null;
        var _loc14_: Number = NaN;
        var _loc15_: int = 0;
        var _loc4_: Number = param1;
        var _loc5_: Number = 0;
        var _loc6_: * = [];
        var _loc10_: Number = this.variableColumnWidth ? 0 : Math.ceil(this.columnWidth);
        var _loc11_: int;
        var _loc12_: int = _loc11_ = 0;
        var _loc13_: int = 0;
        while (_loc13_ < _loc11_) {
            if (!(_loc9_ = target.getElementAt(_loc13_)) || !_loc9_.includeInLayout) {
                _loc12_--;
            } else if (!isNaN(_loc9_.percentWidth) && this.variableColumnWidth) {
                _loc5_ += _loc9_.percentWidth;
                (_loc7_ = new HLayoutElementFlexChildInfo()).layoutElement = _loc9_;
                _loc7_.percent = _loc9_.percentWidth;
                _loc7_.min = _loc9_.getMinBoundsWidth();
                _loc7_.max = _loc9_.getMaxBoundsWidth();
                _loc6_.push(_loc7_);
            } else {
                sizeLayoutElement(_loc9_, param2, this.verticalAlign, param3, NaN, this.variableColumnWidth, _loc10_);
                _loc4_ -= Math.ceil(_loc9_.getLayoutBoundsWidth());
            }
            _loc13_++;
        }
        if (_loc12_ > 1) {
            _loc4_ -= (_loc12_ - 1) * this.gap;
        }
        if (_loc5_) {
            Flex.flexChildrenProportionally(param1, _loc4_, _loc5_, _loc6_);
            _loc14_ = 0;
            for each(_loc7_ in _loc6_) {
                _loc15_ = Math.round(_loc7_.size + _loc14_);
                _loc14_ += Number(_loc7_.size) - _loc15_;
                sizeLayoutElement(_loc7_.layoutElement, param2, this.verticalAlign, param3, _loc15_, this.variableColumnWidth, _loc10_);
                _loc4_ -= _loc15_;
            }
        }
        return _loc4_;
    }

    override public function updateDisplayList(param1: Number, param2: Number): void {
        super.updateDisplayList(param1, param2);
        var _loc3_: GroupBase = target;
        if (!_loc3_) {
            return;
        }
        if (_loc3_.numElements == 0 || param1 == 0 || param2 == 0) {
            this.setColumnCount(0);
            this.setIndexInView(-1, -1);
            if (_loc3_.numElements == 0) {
                _loc3_.setContentSize(Math.ceil(this.paddingLeft + this.paddingRight), Math.ceil(this.paddingTop + this.paddingBottom));
            }
            return;
        }
        if (useVirtualLayout) {
            this.updateDisplayListVirtual();
        } else {
            this.updateDisplayListReal();
        }
    }

    private function invalidateTargetSizeAndDisplayList(): void {
        var _loc1_: GroupBase = target;
        if (!_loc1_) {
            return;
        }
        _loc1_.invalidateSize();
        _loc1_.invalidateDisplayList();
    }

    override protected function calculateDropIndex(param1: Number, param2: Number): int {
        var _loc10_: * = null;
        var _loc11_: Number = NaN;
        var _loc12_: Number = NaN;
        var _loc3_: GroupBase = target;
        var _loc4_: int;
        if ((_loc4_ = _loc3_.numElements) == 0) {
            return 0;
        }
        var _loc5_: Number = 0;
        var _loc6_: int = -1;
        var _loc7_: int = this.firstIndexInView;
        var _loc8_: int = this.lastIndexInView;
        var _loc9_: int = _loc7_;
        while (_loc9_ <= _loc8_) {
            if (_loc10_ = this.getElementBounds(_loc9_)) {
                if (_loc10_.left <= param1 && param1 <= _loc10_.right) {
                    _loc12_ = _loc10_.x + _loc10_.width / 2;
                    return param1 < _loc12_ ? _loc9_ : _loc9_ + 1;
                }
                if ((_loc11_ = Math.min(Math.abs(param1 - _loc10_.left), Math.abs(param1 - _loc10_.right))) < _loc5_) {
                    _loc5_ = _loc11_;
                    _loc6_ = param1 < _loc10_.left ? _loc9_ : _loc9_ + 1;
                }
            }
            _loc9_++;
        }
        if (_loc6_ == -1) {
            _loc6_ = this.getElementBounds(0).x < param1 ? _loc4_ : 0;
        }
        return _loc6_;
    }

    override protected function calculateDropIndicatorBounds(param1: DropLocation): Rectangle {
        var _loc11_: * = null;
        var _loc2_: int = param1.dropIndex;
        var _loc3_: int = 0;
        var _loc4_: Number;
        if ((_loc4_ = this.gap) < 0 && _loc2_ == _loc3_) {
            _loc4_ = 0;
        }
        var _loc5_: Number = 0 < _loc4_ ? _loc4_ : 0;
        var _loc6_: Number = 0;
        if (false) {
            _loc6_ = _loc2_ < _loc3_ ? this.getElementBounds(_loc2_).left - _loc5_ : this.getElementBounds(_loc2_ - 1).right + _loc4_ - _loc5_;
        }
        var _loc7_: Number = _loc5_;
        var _loc8_: Number = Math.max(target.height, target.contentHeight) - this.paddingTop - this.paddingBottom;
        if (dropIndicator is IVisualElement) {
            _loc11_ = IVisualElement(dropIndicator);
            _loc7_ = Math.max(Math.min(_loc7_, _loc11_.getMaxBoundsWidth(false)), _loc11_.getMinBoundsWidth(false));
        }
        var _loc9_: Number = _loc6_ + Math.round((_loc5_ - _loc7_) / 2);
        _loc9_ = Math.max(-Math.ceil(_loc7_ / 2), Math.min(0 - Math.ceil(_loc7_ / 2), _loc9_));
        var _loc10_: Number = this.paddingTop;
        return new Rectangle(_loc9_, _loc10_, _loc7_, _loc8_);
    }

    override protected function calculateDragScrollDelta(param1: DropLocation, param2: Number): Point {
        var _loc3_: Point = super.calculateDragScrollDelta(param1, param2);
        if (_loc3_) {
            _loc3_.y = 0;
        }
        return _loc3_;
    }

    override mx_internal function getElementNearestScrollPosition(param1: Point, param2: String = "center"): int {
        var _loc6_: * = null;
        if (!useVirtualLayout) {
            return super.mx_internal::getElementNearestScrollPosition(param1, param2);
        }
        var _loc3_: GroupBase = GroupBase(target);
        if (!_loc3_) {
            return -1;
        }
        this.updateLLV(_loc3_);
        var _loc4_: int;
        if ((_loc4_ = this.llv.indexOf(param1.x)) == -1) {
            _loc4_ = param1.x < 0 ? 0 : _loc3_.numElements - 1;
        }
        var _loc5_: Rectangle = this.llv.getBounds(_loc4_);
        if ((param2 == "topRight" || param2 == "bottomRight") && _loc4_ > 0) {
            _loc6_ = this.llv.getBounds(_loc4_ - 1);
            if (Point.distance(param1, _loc6_.bottomRight) < Point.distance(param1, _loc5_.bottomRight)) {
                _loc4_--;
            }
        }
        if ((param2 == "topLeft" || param2 == "bottomLeft") && _loc4_ < _loc3_.numElements - 1) {
            _loc6_ = this.llv.getBounds(_loc4_ + 1);
            if (Point.distance(param1, _loc6_.topLeft) < Point.distance(param1, _loc5_.topLeft)) {
                _loc4_++;
            }
        }
        return _loc4_;
    }
}
}

import mx.containers.utilityClasses.FlexChildInfo;
import mx.core.ILayoutElement;

class HLayoutElementFlexChildInfo extends FlexChildInfo {


    public var layoutElement: ILayoutElement;

    function HLayoutElementFlexChildInfo() {
        super();
    }
}

class SizesAndLimit {


    public var preferredSize: Number;

    public var minSize: Number;

    function SizesAndLimit() {
        super();
    }
}
