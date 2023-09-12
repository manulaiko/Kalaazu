package spark.layouts {

import mx.core.ILayoutElement;
import mx.core.IVisualElement;
import mx.core.mx_internal;
import mx.resources.ResourceManager;

import spark.components.supportClasses.GroupBase;
import spark.layouts.supportClasses.LayoutBase;
import spark.layouts.supportClasses.LayoutElementHelper;

public class BasicLayout extends LayoutBase {

    mx_internal static const VERSION: String = "4.6.0.23201";


    public function BasicLayout() {
        super();
    }

    private static function constraintsDetermineWidth(param1: ILayoutElement): Boolean {
        return !isNaN(param1.percentWidth) || !isNaN(LayoutElementHelper.parseConstraintValue(param1.left)) && !isNaN(LayoutElementHelper.parseConstraintValue(param1.right));
    }

    private static function constraintsDetermineHeight(param1: ILayoutElement): Boolean {
        return !isNaN(param1.percentHeight) || !isNaN(LayoutElementHelper.parseConstraintValue(param1.top)) && !isNaN(LayoutElementHelper.parseConstraintValue(param1.bottom));
    }

    private static function maxSizeToFitIn(param1: Number, param2: Number, param3: Number, param4: Number, param5: Number): Number {
        if (!isNaN(param2)) {
            return param1 - 2 * Math.abs(param2);
        }
        if (!isNaN(param3)) {
            return param1 - param3;
        }
        if (!isNaN(param4)) {
            return param1 - param4;
        }
        return param1 - param5;
    }

    override mx_internal function get virtualLayoutSupported(): Boolean {
        return false;
    }

    private function checkUseVirtualLayout(): void {
        if (useVirtualLayout) {
            throw new Error(ResourceManager.getInstance().getString("layout", "basicLayoutNotVirtualized"));
        }
    }

    override public function measure(): void {
        var _loc8_: * = null;
        var _loc9_: Number = NaN;
        var _loc10_: Number = NaN;
        var _loc11_: Number = NaN;
        var _loc12_: Number = NaN;
        var _loc13_: Number = NaN;
        var _loc14_: Number = NaN;
        var _loc15_: Number = NaN;
        var _loc16_: Number = NaN;
        var _loc17_: Number = NaN;
        var _loc18_: Number = NaN;
        var _loc19_: Number = NaN;
        var _loc20_: Number = NaN;
        var _loc21_: Number = NaN;
        this.checkUseVirtualLayout();
        super.measure();
        var _loc1_: GroupBase = target;
        if (!_loc1_) {
            return;
        }
        var _loc2_: Number = 0;
        var _loc3_: Number = 0;
        var _loc4_: Number = 0;
        var _loc5_: Number = 0;
        var _loc6_: int = _loc1_.numElements;
        var _loc7_: int = 0;
        while (_loc7_ < _loc6_) {
            if (!(!(_loc8_ = _loc1_.getElementAt(_loc7_)) || !_loc8_.includeInLayout)) {
                _loc9_ = LayoutElementHelper.parseConstraintValue(_loc8_.horizontalCenter);
                _loc10_ = LayoutElementHelper.parseConstraintValue(_loc8_.verticalCenter);
                _loc11_ = LayoutElementHelper.parseConstraintValue(_loc8_.baseline);
                _loc12_ = LayoutElementHelper.parseConstraintValue(_loc8_.left);
                _loc13_ = LayoutElementHelper.parseConstraintValue(_loc8_.right);
                _loc14_ = LayoutElementHelper.parseConstraintValue(_loc8_.top);
                _loc15_ = LayoutElementHelper.parseConstraintValue(_loc8_.bottom);
                if (!isNaN(_loc12_) && !isNaN(_loc13_)) {
                    _loc16_ = _loc12_ + _loc13_;
                } else if (!isNaN(_loc9_)) {
                    _loc16_ = Math.abs(_loc9_) * 2;
                } else if (!isNaN(_loc12_) || !isNaN(_loc13_)) {
                    _loc16_ = (_loc16_ = isNaN(_loc12_) ? 0 : _loc12_) + (isNaN(_loc13_) ? 0 : _loc13_);
                } else {
                    _loc16_ = _loc8_.getBoundsXAtSize(NaN, NaN);
                }
                if (!isNaN(_loc14_) && !isNaN(_loc15_)) {
                    _loc17_ = _loc14_ + _loc15_;
                } else if (!isNaN(_loc10_)) {
                    _loc17_ = Math.abs(_loc10_) * 2;
                } else if (!isNaN(_loc11_)) {
                    _loc17_ = Math.round(_loc11_ - _loc8_.baselinePosition);
                } else if (!isNaN(_loc14_) || !isNaN(_loc15_)) {
                    _loc17_ = (_loc17_ = isNaN(_loc14_) ? 0 : _loc14_) + (isNaN(_loc15_) ? 0 : _loc15_);
                } else {
                    _loc17_ = _loc8_.getBoundsYAtSize(NaN, NaN);
                }
                _loc18_ = _loc8_.getPreferredBoundsWidth();
                _loc19_ = _loc8_.getPreferredBoundsHeight();
                _loc2_ = Math.max(_loc2_, _loc16_ + _loc18_);
                _loc3_ = Math.max(_loc3_, _loc17_ + _loc19_);
                _loc20_ = constraintsDetermineWidth(_loc8_) ? _loc8_.getMinBoundsWidth() : _loc18_;
                _loc21_ = constraintsDetermineHeight(_loc8_) ? _loc8_.getMinBoundsHeight() : _loc19_;
                _loc4_ = Math.max(_loc4_, _loc16_ + _loc20_);
                _loc5_ = Math.max(_loc5_, _loc17_ + _loc21_);
            }
            _loc7_++;
        }
        _loc1_.measuredWidth = Math.ceil(Math.max(_loc2_, _loc4_));
        _loc1_.measuredHeight = Math.ceil(Math.max(_loc3_, _loc5_));
        _loc1_.measuredMinWidth = Math.ceil(_loc4_);
        _loc1_.measuredMinHeight = Math.ceil(_loc5_);
    }

    override public function updateDisplayList(param1: Number, param2: Number): void {
        var _loc8_: * = null;
        var _loc9_: Number = NaN;
        var _loc10_: Number = NaN;
        var _loc11_: Number = NaN;
        var _loc12_: Number = NaN;
        var _loc13_: Number = NaN;
        var _loc14_: Number = NaN;
        var _loc15_: Number = NaN;
        var _loc16_: Number = NaN;
        var _loc17_: Number = NaN;
        var _loc18_: Number = NaN;
        var _loc19_: Number = NaN;
        var _loc20_: Number = NaN;
        var _loc21_: Number = NaN;
        var _loc22_: Number = NaN;
        var _loc23_: Number = NaN;
        var _loc24_: Number = NaN;
        var _loc25_: Number = NaN;
        var _loc26_: Number = NaN;
        var _loc27_: Number = NaN;
        this.checkUseVirtualLayout();
        super.updateDisplayList(param1, param2);
        var _loc3_: GroupBase = target;
        if (!_loc3_) {
            return;
        }
        var _loc4_: int = _loc3_.numElements;
        var _loc5_: Number = 0;
        var _loc6_: Number = 0;
        var _loc7_: int = 0;
        while (_loc7_ < _loc4_) {
            if (!(!(_loc8_ = _loc3_.getElementAt(_loc7_)) || !_loc8_.includeInLayout)) {
                _loc9_ = LayoutElementHelper.parseConstraintValue(_loc8_.horizontalCenter);
                _loc10_ = LayoutElementHelper.parseConstraintValue(_loc8_.verticalCenter);
                _loc11_ = LayoutElementHelper.parseConstraintValue(_loc8_.baseline);
                _loc12_ = LayoutElementHelper.parseConstraintValue(_loc8_.left);
                _loc13_ = LayoutElementHelper.parseConstraintValue(_loc8_.right);
                _loc14_ = LayoutElementHelper.parseConstraintValue(_loc8_.top);
                _loc15_ = LayoutElementHelper.parseConstraintValue(_loc8_.bottom);
                _loc16_ = _loc8_.percentWidth;
                _loc17_ = _loc8_.percentHeight;
                _loc18_ = NaN;
                _loc19_ = NaN;
                _loc20_ = NaN;
                _loc21_ = NaN;
                if (!isNaN(_loc16_)) {
                    _loc26_ = param1;
                    if (!isNaN(_loc12_)) {
                        _loc26_ -= _loc12_;
                    }
                    if (!isNaN(_loc13_)) {
                        _loc26_ -= _loc13_;
                    }
                    _loc20_ = Math.round(_loc26_ * Math.min(_loc16_ * 0.01, 1));
                    _loc18_ = Math.min(_loc8_.getMaxBoundsWidth(), maxSizeToFitIn(param1, _loc9_, _loc12_, _loc13_, _loc8_.getLayoutBoundsX()));
                } else if (!isNaN(_loc12_) && !isNaN(_loc13_)) {
                    _loc20_ = param1 - _loc13_ - _loc12_;
                }
                if (!isNaN(_loc17_)) {
                    _loc27_ = param2;
                    if (!isNaN(_loc14_)) {
                        _loc27_ -= _loc14_;
                    }
                    if (!isNaN(_loc15_)) {
                        _loc27_ -= _loc15_;
                    }
                    _loc21_ = Math.round(_loc27_ * Math.min(_loc17_ * 0.01, 1));
                    _loc19_ = Math.min(_loc8_.getMaxBoundsHeight(), maxSizeToFitIn(param2, _loc10_, _loc14_, _loc15_, _loc8_.getLayoutBoundsY()));
                } else if (!isNaN(_loc14_) && !isNaN(_loc15_)) {
                    _loc21_ = param2 - _loc15_ - _loc14_;
                }
                if (!isNaN(_loc20_)) {
                    if (isNaN(_loc18_)) {
                        _loc18_ = _loc8_.getMaxBoundsWidth();
                    }
                    _loc20_ = Math.max(_loc8_.getMinBoundsWidth(), Math.min(_loc18_, _loc20_));
                }
                if (!isNaN(_loc21_)) {
                    if (isNaN(_loc19_)) {
                        _loc19_ = _loc8_.getMaxBoundsHeight();
                    }
                    _loc21_ = Math.max(_loc8_.getMinBoundsHeight(), Math.min(_loc19_, _loc21_));
                }
                _loc8_.setLayoutBoundsSize(_loc20_, _loc21_);
                _loc22_ = _loc8_.getLayoutBoundsWidth();
                _loc23_ = _loc8_.getLayoutBoundsHeight();
                _loc24_ = NaN;
                _loc25_ = NaN;
                if (!isNaN(_loc9_)) {
                    _loc24_ = Math.round((param1 - _loc22_) / 2 + _loc9_);
                } else if (!isNaN(_loc12_)) {
                    _loc24_ = _loc12_;
                } else if (!isNaN(_loc13_)) {
                    _loc24_ = param1 - _loc22_ - _loc13_;
                } else {
                    _loc24_ = _loc8_.getLayoutBoundsX();
                }
                if (!isNaN(_loc10_)) {
                    _loc25_ = Math.round((param2 - _loc23_) / 2 + _loc10_);
                } else if (!isNaN(_loc11_)) {
                    _loc25_ = Math.round(_loc11_ - Number(IVisualElement(_loc8_).baselinePosition));
                } else if (!isNaN(_loc14_)) {
                    _loc25_ = _loc14_;
                } else if (!isNaN(_loc15_)) {
                    _loc25_ = param2 - _loc23_ - _loc15_;
                } else {
                    _loc25_ = _loc8_.getLayoutBoundsY();
                }
                _loc8_.setLayoutBoundsPosition(_loc24_, _loc25_);
                _loc5_ = Math.max(_loc5_, _loc24_ + _loc22_);
                _loc6_ = Math.max(_loc6_, _loc25_ + _loc23_);
            }
            _loc7_++;
        }
        _loc3_.setContentSize(Math.ceil(_loc5_), Math.ceil(_loc6_));
    }
}
}
