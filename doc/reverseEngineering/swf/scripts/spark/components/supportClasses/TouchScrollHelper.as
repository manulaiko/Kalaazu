package spark.components.supportClasses {

import flash.display.DisplayObject;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.TimerEvent;
import flash.events.TouchEvent;
import flash.geom.Point;
import flash.system.Capabilities;
import flash.utils.Timer;

import mx.core.UIComponent;
import mx.core.mx_internal;
import mx.events.SandboxMouseEvent;
import mx.events.TouchInteractionEvent;
import mx.events.TouchInteractionReason;
import mx.managers.ISystemManager;
import mx.utils.GetTimerUtil;

public class TouchScrollHelper {

    private static const EVENT_HISTORY_LENGTH: int = 5;

    private static const MIN_START_VELOCITY_IPS: Number = 0.8;

    private static const MAX_THROW_VELOCITY_IPS: Number = 10;

    private static const VELOCITY_WEIGHTS: Vector.<Number> = Vector.<Number>([1, 1.33, 1.66, 2]);


    mx_internal var dragFunction: Function = null;

    mx_internal var throwFunction: Function = null;

    mx_internal var target: UIComponent;

    private var scrollSlop: Number;

    private var mouseDownedPoint: Point;

    private var mouseDownedDisplayObject: DisplayObject;

    private var scrollGestureAnchorPoint: Point;

    private var mostRecentDragDeltaX: Number;

    private var mostRecentDragDeltaY: Number;

    private var mostRecentDragTime: Number;

    private var dragTimer: Timer = null;

    private var dragScrollPending: Boolean = false;

    private var startTime: Number;

    private var mouseEventCoordinatesHistory: Vector.<Point>;

    private var mouseEventLength: Number = 0;

    private var mouseEventTimeHistory: Vector.<int>;

    private var isScrolling: Boolean;

    private var isIOS: Boolean = false;

    private var maxScrollRate: Number = NaN;

    private var canScrollHorizontally: Boolean;

    private var canScrollVertically: Boolean;

    private var mouseListenersInstalled: Boolean = false;

    public function TouchScrollHelper() {
        super();
        this.isIOS = Capabilities.version.indexOf("IOS") == 0;
        this.mouseEventCoordinatesHistory = new Vector.<Point>(EVENT_HISTORY_LENGTH);
        this.mouseEventTimeHistory = new Vector.<int>(EVENT_HISTORY_LENGTH);
    }

    mx_internal function startScrollWatch(param1: Event, param2: Boolean = true, param3: Boolean = true, param4: Number = 0, param5: Number = NaN): void {
        var _loc6_: * = null;
        this.startTime = GetTimerUtil.mx_internal::getTimer();
        this.scrollSlop = param4;
        this.maxScrollRate = param5;
        this.canScrollHorizontally = param2;
        this.canScrollVertically = param3;
        if (param1 is MouseEvent && param1.type == MouseEvent.MOUSE_DOWN) {
            _loc6_ = param1 as MouseEvent;
            if (!this.isScrolling) {
                this.mouseDownedDisplayObject = _loc6_.target as DisplayObject;
                this.mouseDownedPoint = new Point(_loc6_.stageX, _loc6_.stageY);
            }
            this.installMouseListeners();
            if (this.isScrolling) {
                this.scrollGestureAnchorPoint = new Point(_loc6_.stageX, _loc6_.stageY);
                this.mouseDownedPoint = new Point(_loc6_.stageX, _loc6_.stageY);
            }
            this.mouseEventLength = 0;
            this.addMouseEventHistory(_loc6_.stageX, _loc6_.stageY, GetTimerUtil.mx_internal::getTimer());
        } else if (param1 is TouchEvent && param1.type == TouchEvent.TOUCH_BEGIN) {
        }
    }

    mx_internal function stopScrollWatch(): void {
        this.uninstallMouseListeners();
    }

    private function addMouseEventHistory(param1: Number, param2: Number, param3: Number): Point {
        var _loc6_: * = null;
        var _loc4_: Number = param1 - this.mouseDownedPoint.x;
        var _loc5_: Number = param2 - this.mouseDownedPoint.y;
        var _loc7_: int = this.mouseEventLength % EVENT_HISTORY_LENGTH;
        if (this.mouseEventCoordinatesHistory[_loc7_]) {
            (_loc6_ = this.mouseEventCoordinatesHistory[_loc7_]).x = _loc4_;
            _loc6_.y = _loc5_;
        } else {
            _loc6_ = new Point(_loc4_, _loc5_);
            this.mouseEventCoordinatesHistory[_loc7_] = _loc6_;
        }
        this.mouseEventTimeHistory[_loc7_] = this.isIOS ? param3 - this.startTime : GetTimerUtil.mx_internal::getTimer() - this.startTime;
        ++this.mouseEventLength;
        return _loc6_;
    }

    private function installMouseListeners(): void {
        var _loc1_: * = null;
        _loc1_ = this.mx_internal::target.systemManager;
        var _loc2_: DisplayObject = _loc1_.getSandboxRoot();
        _loc2_.addEventListener(MouseEvent.MOUSE_MOVE, this.sbRoot_mouseMoveHandler, true);
        _loc2_.addEventListener(MouseEvent.MOUSE_UP, this.sbRoot_mouseUpHandler, true);
        if (Boolean(_loc1_.stage) && Boolean(_loc1_.isTopLevelRoot())) {
            _loc1_.stage.addEventListener(MouseEvent.MOUSE_UP, this.sbRoot_mouseUpHandler);
        }
        _loc2_.addEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE, this.sbRoot_mouseUpHandler);
        this.mx_internal::target.systemManager.deployMouseShields(true);
        this.mouseListenersInstalled = true;
    }

    private function uninstallMouseListeners(): void {
        var _loc1_: * = null;
        _loc1_ = this.mx_internal::target.systemManager;
        var _loc2_: DisplayObject = _loc1_.getSandboxRoot();
        _loc2_.removeEventListener(MouseEvent.MOUSE_MOVE, this.sbRoot_mouseMoveHandler, true);
        _loc2_.removeEventListener(MouseEvent.MOUSE_UP, this.sbRoot_mouseUpHandler, true);
        if (Boolean(_loc1_.stage) && Boolean(_loc1_.isTopLevelRoot())) {
            _loc1_.stage.removeEventListener(MouseEvent.MOUSE_UP, this.sbRoot_mouseUpHandler);
        }
        _loc2_.removeEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE, this.sbRoot_mouseUpHandler);
        this.mx_internal::target.systemManager.deployMouseShields(false);
        this.mouseListenersInstalled = false;
    }

    private function sbRoot_mouseMoveHandler(param1: MouseEvent): void {
        var _loc3_: Boolean = false;
        var _loc4_: * = null;
        var _loc5_: Boolean = false;
        var _loc6_: * = null;
        var _loc7_: Number = NaN;
        var _loc8_: int = 0;
        var _loc9_: int = 0;
        var _loc10_: * = null;
        var _loc11_: Number = NaN;
        var _loc12_: Number = NaN;
        var _loc13_: Number = NaN;
        var _loc14_: Number = NaN;
        var _loc2_: Point = new Point(param1.stageX - this.mouseDownedPoint.x, param1.stageY - this.mouseDownedPoint.y);
        if (!this.isScrolling) {
            _loc3_ = false;
            if (this.canScrollHorizontally && Math.abs(_loc2_.x) >= this.scrollSlop) {
                _loc3_ = true;
            }
            if (this.canScrollVertically && Math.abs(_loc2_.y) >= this.scrollSlop) {
                _loc3_ = true;
            }
            if (_loc3_) {
                (_loc4_ = new TouchInteractionEvent(TouchInteractionEvent.TOUCH_INTERACTION_STARTING, true, true)).relatedObject = this.mx_internal::target;
                _loc4_.reason = TouchInteractionReason.SCROLL;
                if (!(_loc5_ = this.dispatchBubblingEventOnMouseDownedDisplayObject(_loc4_))) {
                    param1.updateAfterEvent();
                    this.mx_internal::stopScrollWatch();
                    return;
                }
                (_loc6_ = new TouchInteractionEvent(TouchInteractionEvent.TOUCH_INTERACTION_START, true, true)).relatedObject = this.mx_internal::target;
                _loc6_.reason = TouchInteractionReason.SCROLL;
                this.dispatchBubblingEventOnMouseDownedDisplayObject(_loc6_);
                this.isScrolling = true;
                if (this.canScrollHorizontally && this.canScrollVertically) {
                    if ((_loc7_ = Math.max(Math.abs(_loc2_.x), Math.abs(_loc2_.y))) >= this.scrollSlop) {
                        _loc10_ = _loc2_.clone();
                        _loc11_ = this.scrollSlop / _loc7_ * _loc2_.length;
                        _loc10_.normalize(_loc11_);
                        _loc8_ = Math.round(_loc10_.x);
                        _loc9_ = Math.round(_loc10_.y);
                        this.scrollGestureAnchorPoint = new Point(this.mouseDownedPoint.x + _loc8_, this.mouseDownedPoint.y + _loc9_);
                    }
                } else if (this.canScrollHorizontally) {
                    if (_loc2_.x >= this.scrollSlop) {
                        this.scrollGestureAnchorPoint = new Point(this.mouseDownedPoint.x + this.scrollSlop, this.mouseDownedPoint.y);
                    } else {
                        this.scrollGestureAnchorPoint = new Point(this.mouseDownedPoint.x - this.scrollSlop, this.mouseDownedPoint.y);
                    }
                } else if (this.canScrollVertically) {
                    if (_loc2_.y >= this.scrollSlop) {
                        this.scrollGestureAnchorPoint = new Point(this.mouseDownedPoint.x, this.mouseDownedPoint.y + this.scrollSlop);
                    } else {
                        this.scrollGestureAnchorPoint = new Point(this.mouseDownedPoint.x, this.mouseDownedPoint.y - this.scrollSlop);
                    }
                }
            }
        }
        if (this.isScrolling) {
            _loc12_ = param1.stageX - this.scrollGestureAnchorPoint.x;
            _loc13_ = param1.stageY - this.scrollGestureAnchorPoint.y;
            if (!this.dragTimer) {
                _loc14_ = isNaN(this.maxScrollRate) ? 30 : this.maxScrollRate;
                this.dragTimer = new Timer(1000 / _loc14_, 0);
                this.dragTimer.addEventListener(TimerEvent.TIMER, this.dragTimerHandler);
            }
            if (!this.dragTimer.running) {
                this.addMouseEventHistory(param1.stageX, param1.stageY, GetTimerUtil.mx_internal::getTimer());
                if (this.mx_internal::dragFunction != null) {
                    this.mx_internal::dragFunction(_loc12_, _loc13_);
                }
                param1.updateAfterEvent();
                if (!isNaN(this.maxScrollRate)) {
                    this.dragTimer.start();
                    this.dragScrollPending = false;
                }
            } else {
                this.mostRecentDragDeltaX = _loc12_;
                this.mostRecentDragDeltaY = _loc13_;
                this.mostRecentDragTime = GetTimerUtil.mx_internal::getTimer();
                this.dragScrollPending = true;
            }
        }
    }

    private function dragTimerHandler(param1: TimerEvent): void {
        if (this.dragScrollPending) {
            this.addMouseEventHistory(this.mostRecentDragDeltaX + this.scrollGestureAnchorPoint.x, this.mostRecentDragDeltaY + this.scrollGestureAnchorPoint.y, this.mostRecentDragTime);
            if (this.mx_internal::dragFunction != null) {
                this.mx_internal::dragFunction(this.mostRecentDragDeltaX, this.mostRecentDragDeltaY);
            }
            param1.updateAfterEvent();
            this.dragScrollPending = false;
        } else {
            this.dragTimer.stop();
        }
    }

    private function sbRoot_mouseUpHandler(param1: Event): void {
        var _loc11_: int = 0;
        if (!this.mouseListenersInstalled) {
            return;
        }
        this.uninstallMouseListeners();
        if (!this.isScrolling) {
            return;
        }
        if (this.dragTimer) {
            if (this.dragScrollPending) {
                this.addMouseEventHistory(this.mostRecentDragDeltaX + this.scrollGestureAnchorPoint.x, this.mostRecentDragDeltaY + this.scrollGestureAnchorPoint.y, this.mostRecentDragTime);
                if (this.mx_internal::dragFunction != null) {
                    this.mx_internal::dragFunction(this.mostRecentDragDeltaX, this.mostRecentDragDeltaY);
                }
                if (param1 is MouseEvent) {
                    MouseEvent(param1).updateAfterEvent();
                }
            }
            this.dragTimer.stop();
            this.dragTimer.removeEventListener(TimerEvent.TIMER, this.dragTimerHandler);
            this.dragTimer = null;
        }
        var _loc2_: Number = GetTimerUtil.mx_internal::getTimer();
        var _loc3_: Number = 0;
        var _loc4_: int = this.mouseEventLength > EVENT_HISTORY_LENGTH ? EVENT_HISTORY_LENGTH : this.mouseEventLength;
        var _loc5_: int = (this.mouseEventLength - _loc4_) % EVENT_HISTORY_LENGTH;
        var _loc6_: int = (this.mouseEventLength - 1) % EVENT_HISTORY_LENGTH;
        var _loc7_: int = _loc5_;
        while (_loc7_ != _loc6_) {
            _loc11_ = (_loc7_ + 1) % EVENT_HISTORY_LENGTH;
            _loc3_ += this.mouseEventTimeHistory[_loc11_] - this.mouseEventTimeHistory[_loc7_];
            _loc7_ = _loc11_;
        }
        _loc3_ /= _loc4_ - 1;
        var _loc8_: Number = MIN_START_VELOCITY_IPS * 0 / 1000;
        var _loc9_: Point = this.calculateThrowVelocity();
        var _loc10_: Point = this.calculateFinalDragVelocity(100);
        if (this.isIOS) {
            _loc9_ = _loc10_;
        }
        if (_loc9_.length <= _loc8_) {
            _loc9_.x = 0;
            _loc9_.y = 0;
        }
        if (_loc10_.length <= _loc8_) {
            _loc9_.x = 0;
            _loc9_.y = 0;
        }
        if (this.mx_internal::throwFunction != null) {
            this.mx_internal::throwFunction(_loc9_.x, _loc9_.y);
        }
    }

    private function calculateThrowVelocity(): Point {
        var _loc12_: int = 0;
        var _loc13_: Number = NaN;
        var _loc14_: Number = NaN;
        var _loc15_: Number = NaN;
        var _loc1_: int = this.mouseEventLength > EVENT_HISTORY_LENGTH ? EVENT_HISTORY_LENGTH : this.mouseEventLength;
        var _loc2_: int = (this.mouseEventLength - _loc1_) % EVENT_HISTORY_LENGTH;
        var _loc3_: int = (this.mouseEventLength - 1) % EVENT_HISTORY_LENGTH;
        var _loc4_: Number = 0;
        var _loc5_: Number = 0;
        var _loc6_: Number = 0;
        var _loc7_: int = _loc2_;
        var _loc8_: int = 0;
        while (_loc7_ != _loc3_) {
            _loc12_ = (_loc7_ + 1) % EVENT_HISTORY_LENGTH;
            _loc13_ = this.mouseEventTimeHistory[_loc12_] - this.mouseEventTimeHistory[_loc7_];
            _loc14_ = this.mouseEventCoordinatesHistory[_loc12_].x - this.mouseEventCoordinatesHistory[_loc7_].x;
            _loc15_ = this.mouseEventCoordinatesHistory[_loc12_].y - this.mouseEventCoordinatesHistory[_loc7_].y;
            if (_loc13_ != 0) {
                _loc4_ += _loc14_ / _loc13_ * 0;
                _loc5_ += _loc15_ / _loc13_ * 0;
                _loc6_ += VELOCITY_WEIGHTS[_loc8_];
            }
            _loc7_ = _loc12_;
            _loc8_++;
        }
        if (_loc6_ == 0) {
            return new Point(0, 0);
        }
        var _loc9_: Number = MAX_THROW_VELOCITY_IPS * 0 / 1000;
        var _loc10_: Number = Math.min(_loc9_, Math.max(-_loc9_, _loc4_ / _loc6_));
        var _loc11_: Number = Math.min(_loc9_, Math.max(-_loc9_, _loc5_ / _loc6_));
        return new Point(_loc10_, _loc11_);
    }

    private function calculateFinalDragVelocity(param1: Number): Point {
        var _loc9_: int = 0;
        var _loc10_: Number = NaN;
        var _loc11_: Number = NaN;
        var _loc12_: Number = NaN;
        var _loc13_: Number = NaN;
        var _loc14_: Number = NaN;
        var _loc15_: Number = NaN;
        var _loc16_: Number = NaN;
        var _loc2_: int = this.mouseEventLength > EVENT_HISTORY_LENGTH ? EVENT_HISTORY_LENGTH : this.mouseEventLength;
        var _loc3_: int = (this.mouseEventLength - _loc2_) % EVENT_HISTORY_LENGTH;
        var _loc4_: int;
        var _loc5_: int = _loc4_ = (this.mouseEventLength - 1) % EVENT_HISTORY_LENGTH;
        var _loc6_: Number = 0;
        var _loc7_: Number = 0;
        var _loc8_: Number = 0;
        while (param1 > 0 && _loc5_ != _loc3_) {
            if ((_loc9_ = _loc5_ - 1) < 0) {
                _loc9_ += EVENT_HISTORY_LENGTH;
            }
            _loc10_ = this.mouseEventTimeHistory[_loc5_] - this.mouseEventTimeHistory[_loc9_];
            _loc11_ = this.mouseEventCoordinatesHistory[_loc5_].x - this.mouseEventCoordinatesHistory[_loc9_].x;
            _loc12_ = this.mouseEventCoordinatesHistory[_loc5_].y - this.mouseEventCoordinatesHistory[_loc9_].y;
            if (_loc10_ > param1) {
                _loc13_ = param1 / _loc10_;
                _loc11_ *= _loc13_;
                _loc12_ *= _loc13_;
                _loc10_ = param1;
            }
            param1 -= _loc10_;
            _loc6_ += _loc10_;
            _loc7_ += _loc11_;
            _loc8_ += _loc12_;
            _loc5_ = _loc9_;
        }
        if (_loc6_ == 0) {
            return new Point(0, 0);
        }
        if (this.isIOS) {
            _loc14_ = MAX_THROW_VELOCITY_IPS * 0 / 1000;
            _loc15_ = Math.min(_loc14_, Math.max(-_loc14_, _loc7_ / _loc6_));
            _loc16_ = Math.min(_loc14_, Math.max(-_loc14_, _loc8_ / _loc6_));
            return new Point(_loc15_, _loc16_);
        }
        return new Point(_loc7_ / _loc6_, _loc8_ / _loc6_);
    }

    private function dispatchBubblingEventOnMouseDownedDisplayObject(param1: Event): Boolean {
        var _loc2_: Boolean = true;
        if (this.mouseDownedDisplayObject) {
            _loc2_ = _loc2_ && this.mouseDownedDisplayObject.dispatchEvent(param1);
            if (!this.mouseDownedDisplayObject.stage) {
                if (Boolean(this.mx_internal::target) && !this.mx_internal::target.contains(this.mouseDownedDisplayObject)) {
                    _loc2_ = _loc2_ && this.mx_internal::target.dispatchEvent(param1);
                }
            }
        } else {
            _loc2_ = _loc2_ && this.mx_internal::target.dispatchEvent(param1);
        }
        return _loc2_;
    }

    mx_internal function endTouchScroll(): void {
        var _loc1_: * = null;
        if (this.isScrolling) {
            this.isScrolling = false;
            _loc1_ = new TouchInteractionEvent(TouchInteractionEvent.TOUCH_INTERACTION_END, true);
            _loc1_.relatedObject = this.mx_internal::target;
            _loc1_.reason = TouchInteractionReason.SCROLL;
            this.dispatchBubblingEventOnMouseDownedDisplayObject(_loc1_);
        }
    }
}
}
