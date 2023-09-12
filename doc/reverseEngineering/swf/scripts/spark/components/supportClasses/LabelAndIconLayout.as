package spark.components.supportClasses {

import mx.core.ILayoutElement;

import spark.components.IconPlacement;
import spark.core.IDisplayText;
import spark.layouts.supportClasses.LayoutBase;
import spark.layouts.supportClasses.LayoutElementHelper;

public class LabelAndIconLayout extends LayoutBase {


    private var labelElement: ILayoutElement;

    private var iconElement: ILayoutElement;

    private var _gap: int = 6;

    private var _iconPlacement: String = "left";

    private var _paddingLeft: Number = 0;

    private var _paddingRight: Number = 0;

    private var _paddingTop: Number = 0;

    private var _paddingBottom: Number = 0;

    public function LabelAndIconLayout() {
        super();
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

    public function get iconPlacement(): String {
        return this._iconPlacement;
    }

    public function set iconPlacement(param1: String): void {
        if (this._iconPlacement == param1) {
            return;
        }
        this._iconPlacement = param1;
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

    override public function measure(): void {
        super.measure();
        var _loc1_: GroupBase = target;
        if (!_loc1_) {
            return;
        }
        var _loc2_: Number = this._paddingLeft + this._paddingRight;
        var _loc3_: Number = this._paddingTop + this._paddingBottom;
        var _loc4_: Boolean = this.iconPlacement == IconPlacement.LEFT || this.iconPlacement == IconPlacement.RIGHT;
        this.assignLayoutElements();
        var _loc5_: Number = !!this.iconElement ? this.iconElement.getPreferredBoundsHeight() : 0;
        var _loc6_: Number = !!this.iconElement ? this.iconElement.getPreferredBoundsWidth() : 0;
        var _loc7_: Number = Boolean(this.labelElement) && Boolean(IDisplayText(this.labelElement).text) ? this.labelElement.getPreferredBoundsWidth() : 0;
        var _loc8_: Number = Boolean(this.labelElement) && Boolean(IDisplayText(this.labelElement).text) ? this.labelElement.getPreferredBoundsHeight() : 0;
        if (_loc4_) {
            _loc2_ += _loc7_ + _loc6_;
            if (Boolean(_loc7_) && Boolean(_loc6_)) {
                _loc2_ += this._gap;
            }
            _loc3_ += Math.max(_loc8_, _loc5_);
        } else {
            _loc2_ += Math.max(_loc7_, _loc6_);
            _loc3_ += _loc8_ + _loc5_;
            if (Boolean(_loc8_) && Boolean(_loc5_)) {
                _loc3_ += this._gap;
            }
        }
        _loc1_.measuredWidth = Math.ceil(_loc2_);
        _loc1_.measuredHeight = Math.ceil(_loc3_);
    }

    override public function updateDisplayList(param1: Number, param2: Number): void {
        var _loc6_: Number = NaN;
        super.updateDisplayList(param1, param2);
        var _loc3_: GroupBase = target;
        if (!_loc3_) {
            return;
        }
        var _loc4_: Number = this._paddingLeft + this._paddingRight;
        var _loc5_: Number = this._paddingTop + this._paddingBottom;
        var _loc7_: Boolean = this.iconPlacement == IconPlacement.LEFT || this.iconPlacement == IconPlacement.RIGHT;
        this.assignLayoutElements();
        var _loc8_: Number = !!this.iconElement ? this.iconElement.getPreferredBoundsHeight() : 0;
        var _loc9_: Number = !!this.iconElement ? this.iconElement.getPreferredBoundsWidth() : 0;
        var _loc10_: Boolean;
        var _loc11_: Number = (_loc10_ = Boolean(this.labelElement) && Boolean(IDisplayText(this.labelElement).text)) ? this.labelElement.getPreferredBoundsWidth() : 0;
        var _loc12_: Number = _loc10_ ? this.labelElement.getPreferredBoundsHeight() : 0;
        var _loc13_: Number = _loc10_ ? LayoutElementHelper.parseConstraintValue(this.labelElement.verticalCenter) : 0;
        var _loc14_: Number = 0;
        var _loc15_: Number = 0;
        var _loc16_: Number = 0;
        var _loc17_: Number = 0;
        var _loc18_: Number = param1 - this._paddingLeft - this._paddingRight;
        var _loc19_: Number = param2 - this._paddingTop - this._paddingBottom;
        if (_loc7_) {
            _loc6_ = Boolean(_loc9_) && Boolean(_loc11_) ? this._gap : 0;
            if (_loc11_ > 0) {
                _loc11_ = Math.max(Math.min(_loc18_ - _loc9_ - _loc6_, _loc11_), 0);
            }
            _loc12_ = Math.min(param2, _loc12_);
            _loc14_ = (_loc18_ - _loc11_ - _loc9_ - _loc6_) / 2 + this.paddingLeft;
            if (this.iconPlacement == IconPlacement.LEFT) {
                _loc16_ = (_loc14_ += _loc9_ + _loc6_) - (_loc9_ + _loc6_);
            } else {
                _loc16_ = _loc14_ + _loc11_ + _loc6_;
            }
            if (this._paddingLeft + this._paddingRight + _loc9_ > param1) {
                _loc16_ = param1 / 2 - _loc9_ / 2;
            }
            _loc17_ = (_loc19_ - _loc8_) / 2 + this._paddingTop;
            _loc15_ = (_loc19_ - _loc12_) / 2 + this._paddingTop + _loc13_;
        } else {
            _loc6_ = Boolean(_loc8_) && Boolean(_loc12_) ? this._gap : 0;
            if (_loc11_ > 0) {
                _loc11_ = Math.max(_loc18_, 0);
                _loc12_ = Math.min(_loc19_ - _loc8_ - _loc6_, _loc12_);
            }
            _loc14_ = this._paddingLeft;
            _loc16_ += (_loc18_ - _loc9_) / 2 + this._paddingLeft;
            if (this.iconPlacement == IconPlacement.BOTTOM) {
                _loc15_ += (_loc19_ - _loc12_ - _loc8_ - _loc6_) / 2 + _loc13_ + this._paddingTop;
                _loc17_ += _loc15_ + _loc12_ + _loc6_;
            } else {
                _loc17_ = (_loc19_ - _loc12_ - _loc8_ - _loc6_) / 2 + this._paddingTop;
                _loc15_ += _loc17_ + _loc8_ + _loc6_ + _loc13_;
            }
            if (this._paddingTop + this._paddingBottom + _loc8_ > param2) {
                _loc17_ = param2 / 2 - _loc8_ / 2;
            }
        }
        if (this.labelElement) {
            this.labelElement.setLayoutBoundsSize(_loc11_, _loc12_);
            this.labelElement.setLayoutBoundsPosition(Math.ceil(_loc14_), Math.ceil(_loc15_));
        }
        if (this.iconElement) {
            this.iconElement.setLayoutBoundsSize(_loc9_, _loc8_);
            this.iconElement.setLayoutBoundsPosition(Math.ceil(_loc16_), Math.ceil(_loc17_));
        }
        _loc3_.setContentSize(Math.ceil(Math.max(param1, Math.max(_loc9_, _loc11_))), Math.ceil(Math.max(param2, Math.max(_loc8_, _loc12_))));
    }

    private function invalidateTargetSizeAndDisplayList(): void {
        var _loc1_: GroupBase = target;
        if (!_loc1_) {
            return;
        }
        _loc1_.invalidateSize();
        _loc1_.invalidateDisplayList();
    }

    private function assignLayoutElements(): void {
        var _loc2_: * = null;
        var _loc1_: int = 0;
        while (_loc1_ < target.numElements) {
            _loc2_ = target.getElementAt(_loc1_);
            if (!(!_loc2_ || !_loc2_.includeInLayout)) {
                if (_loc2_ is IDisplayText) {
                    this.labelElement = _loc2_;
                } else {
                    this.iconElement = _loc2_;
                }
            }
            _loc1_++;
        }
    }
}
}
