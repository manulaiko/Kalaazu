package spark.components {

import flash.events.Event;
import flash.events.MouseEvent;
import flash.geom.Point;

import mx.core.IInvalidating;
import mx.core.InteractionMode;
import mx.core.mx_internal;
import mx.events.FlexMouseEvent;
import mx.events.PropertyChangeEvent;
import mx.events.ResizeEvent;

import spark.components.supportClasses.ScrollBarBase;
import spark.core.IViewport;
import spark.core.NavigationUnit;
import spark.utils.MouseEventUtil;

public class VScrollBar extends ScrollBarBase {

    mx_internal static const VERSION: String = "4.6.0.23201";


    public function VScrollBar() {
        super();
    }

    private function updateMaximumAndPageSize(): void {
        var _loc1_: Number = 0;
        var _loc2_: Number = isNaN(viewport.height) ? 0 : Number(viewport.height);
        var _loc3_: Number = 0;
        if (getStyle("interactionMode") == InteractionMode.TOUCH) {
            minimum = -_loc2_;
            maximum = _loc3_ == 0 ? _loc1_ + _loc2_ : _loc3_;
        } else {
            minimum = 0;
            maximum = _loc3_ == 0 ? _loc1_ : _loc3_ - _loc2_;
        }
        pageSize = _loc2_;
    }

    override public function set viewport(param1: IViewport): void {
        var _loc2_: IViewport = super.viewport;
        if (_loc2_ == param1) {
            return;
        }
        if (_loc2_) {
            _loc2_.removeEventListener(MouseEvent.MOUSE_WHEEL, this.mx_internal::mouseWheelHandler);
            removeEventListener(MouseEvent.MOUSE_WHEEL, this.mx_internal::mouseWheelHandler);
        }
        super.viewport = param1;
        if (param1) {
            this.updateMaximumAndPageSize();
            value = param1.verticalScrollPosition;
            param1.addEventListener(MouseEvent.MOUSE_WHEEL, this.mx_internal::mouseWheelHandler);
            addEventListener(MouseEvent.MOUSE_WHEEL, this.mx_internal::mouseWheelHandler);
        }
    }

    override protected function pointToValue(param1: Number, param2: Number): Number {
        if (!thumb || !track) {
            return 0;
        }
        var _loc3_: Number = track.getLayoutBoundsHeight() - thumb.getLayoutBoundsHeight();
        return minimum + (_loc3_ != 0 ? param2 / _loc3_ * (maximum - minimum) : 0);
    }

    override protected function updateSkinDisplayList(): void {
        var _loc2_: Number = NaN;
        var _loc3_: Number = NaN;
        var _loc6_: * = null;
        var _loc10_: Number = NaN;
        if (!thumb || !track) {
            return;
        }
        var _loc1_: Number = track.getLayoutBoundsHeight();
        if (getStyle("interactionMode") == InteractionMode.TOUCH && Boolean(viewport)) {
            _loc10_ = isNaN(viewport.height) ? 0 : Number(viewport.height);
            _loc2_ = !isNaN(mx_internal::contentMinimum) ? Number(mx_internal::contentMinimum) : 0;
            _loc3_ = !isNaN(mx_internal::contentMaximum) ? Number(mx_internal::contentMaximum) : Math.max(0, maximum - _loc10_);
        } else {
            _loc2_ = minimum;
            _loc3_ = maximum;
        }
        var _loc4_: Number = _loc3_ - _loc2_;
        var _loc5_: * = getStyle("fixedThumbSize") !== false;
        var _loc7_: Number = 0;
        var _loc8_: Number = 0;
        var _loc9_: Number = _loc1_;
        if (_loc4_ > 0) {
            if (!_loc5_) {
                _loc9_ = Math.min(pageSize / (_loc4_ + pageSize) * _loc1_, _loc1_);
                _loc9_ = Math.max(thumb.minHeight, _loc9_);
            } else {
                _loc9_ = !!thumb ? 0 : 0;
            }
            _loc7_ = (pendingValue - _loc2_) * ((_loc1_ - _loc9_) / _loc4_);
        }
        if (pendingValue < _loc2_) {
            if (!_loc5_) {
                _loc9_ = Math.max(Math.min(thumb.minHeight, _loc9_), _loc9_ + (pendingValue - _loc2_));
            }
            _loc7_ = 0;
        }
        if (pendingValue > _loc3_) {
            if (!_loc5_) {
                _loc9_ = Math.max(Math.min(thumb.minHeight, _loc9_), _loc9_ - (pendingValue - _loc3_));
            }
            _loc7_ = _loc1_ - _loc9_;
        }
        if (!_loc5_) {
            thumb.setLayoutBoundsSize(NaN, _loc9_);
        }
        if (getStyle("autoThumbVisibility") === true) {
            thumb.visible = _loc9_ < _loc1_;
        }
        _loc6_ = track.localToGlobal(new Point(0, _loc7_));
        if (false) {
            _loc8_ = thumb.parent.globalToLocal(_loc6_).y;
        }
        thumb.setLayoutBoundsPosition(thumb.getLayoutBoundsX(), Math.round(_loc8_));
    }

    override protected function setValue(param1: Number): void {
        super.setValue(param1);
        if (viewport) {
            viewport.verticalScrollPosition = param1;
        }
    }

    override public function changeValueByPage(param1: Boolean = true): void {
        var _loc2_: Number = NaN;
        if (viewport) {
            _loc2_ = pageSize;
            pageSize = Math.abs(viewport.getVerticalScrollPositionDelta(param1 ? 0 : NavigationUnit.PAGE_UP));
        }
        super.changeValueByPage(param1);
        if (viewport) {
            pageSize = _loc2_;
        }
    }

    override protected function animatePaging(param1: Number, param2: Number): void {
        var _loc3_: Number = NaN;
        if (viewport) {
            _loc3_ = Math.abs(viewport.getVerticalScrollPositionDelta(param1 > value ? 0 : NavigationUnit.PAGE_UP));
            super.animatePaging(param1, _loc3_);
            return;
        }
        super.animatePaging(param1, param2);
    }

    override public function changeValueByStep(param1: Boolean = true): void {
        var _loc2_: Number = NaN;
        if (viewport) {
            _loc2_ = stepSize;
            stepSize = Math.abs(viewport.getVerticalScrollPositionDelta(param1 ? 0 : NavigationUnit.UP));
        }
        super.changeValueByStep(param1);
        if (viewport) {
            stepSize = _loc2_;
        }
    }

    override protected function partAdded(param1: String, param2: Object): void {
        if (param2 == thumb) {
            thumb.setConstraintValue("top", undefined);
            thumb.setConstraintValue("bottom", undefined);
            thumb.setConstraintValue("verticalCenter", undefined);
        }
        super.partAdded(param1, param2);
    }

    override mx_internal function viewportVerticalScrollPositionChangeHandler(param1: PropertyChangeEvent): void {
        if (viewport) {
            value = viewport.verticalScrollPosition;
        }
    }

    override mx_internal function viewportResizeHandler(param1: ResizeEvent): void {
        if (viewport) {
            this.updateMaximumAndPageSize();
        }
    }

    override mx_internal function viewportContentHeightChangeHandler(param1: PropertyChangeEvent): void {
        if (viewport) {
            if (getStyle("interactionMode") == InteractionMode.TOUCH) {
                this.updateMaximumAndPageSize();
            } else {
                maximum = 0 - 0;
            }
        }
    }

    override public function styleChanged(param1: String): void {
        super.styleChanged(param1);
        var _loc2_: Boolean = !param1 || param1 == "styleName";
        if (_loc2_ || param1 == "interactionMode") {
            if (viewport) {
                this.updateMaximumAndPageSize();
            }
        }
    }

    mx_internal function mouseWheelHandler(param1: MouseEvent): void {
        var _loc6_: * = 0;
        var _loc7_: Boolean = false;
        var _loc9_: Number = NaN;
        var _loc2_: IViewport = viewport;
        if (param1.isDefaultPrevented() || !_loc2_ || !_loc2_.visible || !visible) {
            return;
        }
        var _loc3_: FlexMouseEvent = MouseEventUtil.createMouseWheelChangingEvent(param1);
        if (!dispatchEvent(_loc3_)) {
            param1.preventDefault();
            return;
        }
        var _loc4_: int = _loc3_.delta;
        var _loc5_: uint = Math.abs(_loc4_);
        _loc6_ = _loc4_ < 0 ? 0 : NavigationUnit.UP;
        var _loc8_: int = 0;
        while (_loc8_ < _loc5_) {
            _loc9_ = _loc2_.getVerticalScrollPositionDelta(_loc6_);
            if (!isNaN(_loc9_)) {
                _loc2_.verticalScrollPosition += _loc9_;
                _loc7_ = true;
                if (_loc2_ is IInvalidating) {
                    IInvalidating(_loc2_).validateNow();
                }
            }
            _loc8_++;
        }
        if (_loc7_) {
            dispatchEvent(new Event(Event.CHANGE));
        }
        param1.preventDefault();
    }
}
}
