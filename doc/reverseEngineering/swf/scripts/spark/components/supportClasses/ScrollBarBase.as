package spark.components.supportClasses {

import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.TimerEvent;
import flash.geom.Point;
import flash.utils.Timer;

import mx.core.mx_internal;
import mx.events.FlexEvent;
import mx.events.PropertyChangeEvent;
import mx.events.ResizeEvent;
import mx.events.SandboxMouseEvent;

import spark.components.Button;
import spark.core.IViewport;
import spark.effects.animation.Animation;
import spark.effects.animation.MotionPath;
import spark.effects.animation.SimpleMotionPath;
import spark.effects.easing.IEaser;
import spark.effects.easing.Linear;
import spark.effects.easing.Sine;
import spark.events.TrackBaseEvent;

public class ScrollBarBase extends TrackBase {

    mx_internal static const VERSION: String = "4.6.0.23201";

    private static var linearEaser: IEaser = new Linear();

    private static var easyInLinearEaser: IEaser = new Linear(0.1);

    private static var deceleratingSineEaser: IEaser = new Sine(0);


    [SkinPart(required="false")]
    public var decrementButton: Button;

    [SkinPart(required="false")]
    public var incrementButton: Button;

    private var _animator: Animation = null;

    private var steppingDown: Boolean;

    private var steppingUp: Boolean;

    private var isStepping: Boolean;

    private var animatingOnce: Boolean;

    private var clickOffset: Point;

    private var trackScrollDown: Boolean;

    private var trackScrollTimer: Timer;

    private var trackPosition: Point;

    private var trackScrolling: Boolean = false;

    private var _pageSize: Number = 20;

    private var pageSizeChanged: Boolean = false;

    private var _pendingValue: Number = 0;

    private var _viewport: IViewport;

    private var _contentMinimum: Number = NaN;

    private var _contentMaximum: Number = NaN;

    public function ScrollBarBase() {
        this.trackPosition = new Point();
        super();
    }

    private function get animator(): Animation {
        if (this._animator) {
            return this._animator;
        }
        this._animator = new Animation();
        var _loc1_: AnimationTarget = new AnimationTarget(this.animationUpdateHandler);
        _loc1_.endFunction = this.animationEndHandler;
        this._animator.animationTarget = _loc1_;
        return this._animator;
    }

    override public function set minimum(param1: Number): void {
        if (param1 == super.minimum) {
            return;
        }
        super.minimum = param1;
        invalidateSkinState();
    }

    override public function set maximum(param1: Number): void {
        if (param1 == super.maximum) {
            return;
        }
        super.maximum = param1;
        invalidateSkinState();
    }

    override public function set snapInterval(param1: Number): void {
        super.snapInterval = param1;
        this.pageSizeChanged = true;
    }

    override protected function setValue(param1: Number): void {
        this._pendingValue = param1;
        super.setValue(param1);
    }

    public function get pageSize(): Number {
        return this._pageSize;
    }

    public function set pageSize(param1: Number): void {
        if (param1 == this._pageSize) {
            return;
        }
        this._pageSize = param1;
        this.pageSizeChanged = true;
        invalidateProperties();
        invalidateDisplayList();
    }

    protected function get pendingValue(): Number {
        return this._pendingValue;
    }

    protected function set pendingValue(param1: Number): void {
        if (param1 == this._pendingValue) {
            return;
        }
        this._pendingValue = param1;
        invalidateDisplayList();
    }

    public function get viewport(): IViewport {
        return this._viewport;
    }

    public function set viewport(param1: IViewport): void {
        if (param1 == this._viewport) {
            return;
        }
        if (this._viewport) {
            this._viewport.removeEventListener(PropertyChangeEvent.PROPERTY_CHANGE, this.viewport_propertyChangeHandler);
            this._viewport.removeEventListener(ResizeEvent.RESIZE, this.mx_internal::viewportResizeHandler);
            this._viewport.clipAndEnableScrolling = false;
        }
        this._viewport = param1;
        if (this._viewport) {
            this._viewport.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, this.viewport_propertyChangeHandler);
            this._viewport.addEventListener(ResizeEvent.RESIZE, this.mx_internal::viewportResizeHandler);
            this._viewport.clipAndEnableScrolling = true;
        }
    }

    mx_internal function get contentMinimum(): Number {
        return this._contentMinimum;
    }

    mx_internal function set contentMinimum(param1: Number): void {
        if (param1 == this._contentMinimum) {
            return;
        }
        this._contentMinimum = param1;
        invalidateDisplayList();
    }

    mx_internal function get contentMaximum(): Number {
        return this._contentMaximum;
    }

    mx_internal function set contentMaximum(param1: Number): void {
        if (param1 == this._contentMaximum) {
            return;
        }
        this._contentMaximum = param1;
        invalidateDisplayList();
    }

    private function startAnimation(param1: Number, param2: Number, param3: IEaser, param4: Number = 0): void {
        this.animator.stop();
        this.animator.duration = param1;
        this.animator.easer = param3;
        this.animator.motionPaths = new <MotionPath>[new SimpleMotionPath("value", value, param2)];
        this.animator.startDelay = param4;
        this.animator.play();
    }

    private function nearestValidSize(param1: Number): Number {
        var _loc2_: Number = snapInterval;
        if (_loc2_ == 0) {
            return param1;
        }
        var _loc3_: Number = Math.round(param1 / _loc2_) * _loc2_;
        return Math.abs(_loc3_) < _loc2_ ? _loc2_ : _loc3_;
    }

    override protected function commitProperties(): void {
        super.commitProperties();
        if (this.pageSizeChanged) {
            this._pageSize = this.nearestValidSize(this._pageSize);
            this.pageSizeChanged = false;
        }
    }

    override protected function getCurrentSkinState(): String {
        if (maximum <= minimum) {
            return "inactive";
        }
        return super.getCurrentSkinState();
    }

    override protected function partAdded(param1: String, param2: Object): void {
        super.partAdded(param1, param2);
        if (param2 == this.decrementButton) {
            this.decrementButton.addEventListener(FlexEvent.BUTTON_DOWN, this.button_buttonDownHandler);
            this.decrementButton.addEventListener(MouseEvent.ROLL_OVER, this.button_rollOverHandler);
            this.decrementButton.addEventListener(MouseEvent.ROLL_OUT, this.button_rollOutHandler);
            this.decrementButton.autoRepeat = true;
        } else if (param2 == this.incrementButton) {
            this.incrementButton.addEventListener(FlexEvent.BUTTON_DOWN, this.button_buttonDownHandler);
            this.incrementButton.addEventListener(MouseEvent.ROLL_OVER, this.button_rollOverHandler);
            this.incrementButton.addEventListener(MouseEvent.ROLL_OUT, this.button_rollOutHandler);
            this.incrementButton.autoRepeat = true;
        } else if (param2 == track) {
            track.addEventListener(MouseEvent.ROLL_OVER, this.track_rollOverHandler);
            track.addEventListener(MouseEvent.ROLL_OUT, this.track_rollOutHandler);
        }
    }

    override protected function partRemoved(param1: String, param2: Object): void {
        super.partRemoved(param1, param2);
        if (param2 == this.decrementButton) {
            this.decrementButton.removeEventListener(FlexEvent.BUTTON_DOWN, this.button_buttonDownHandler);
            this.decrementButton.removeEventListener(MouseEvent.ROLL_OVER, this.button_rollOverHandler);
            this.decrementButton.removeEventListener(MouseEvent.ROLL_OUT, this.button_rollOutHandler);
        } else if (param2 == this.incrementButton) {
            this.incrementButton.removeEventListener(FlexEvent.BUTTON_DOWN, this.button_buttonDownHandler);
            this.incrementButton.removeEventListener(MouseEvent.ROLL_OVER, this.button_rollOverHandler);
            this.incrementButton.removeEventListener(MouseEvent.ROLL_OUT, this.button_rollOutHandler);
        } else if (param2 == track) {
            track.removeEventListener(MouseEvent.ROLL_OVER, this.track_rollOverHandler);
            track.removeEventListener(MouseEvent.ROLL_OUT, this.track_rollOutHandler);
        }
    }

    override public function styleChanged(param1: String): void {
        super.styleChanged(param1);
        if (param1 == "autoThumbVisibility") {
            invalidateDisplayList();
        }
    }

    override protected function system_mouseMoveHandler(param1: MouseEvent): void {
        if (!track) {
            return;
        }
        var _loc2_: Point = track.globalToLocal(new Point(param1.stageX, param1.stageY));
        var _loc3_: Number = pointToValue(_loc2_.x - this.clickOffset.x, _loc2_.y - this.clickOffset.y);
        _loc3_ = nearestValidValue(_loc3_, snapInterval);
        if (_loc3_ != this.pendingValue) {
            dispatchEvent(new TrackBaseEvent(TrackBaseEvent.THUMB_DRAG));
            if (getStyle("liveDragging") === true) {
                this.setValue(_loc3_);
                dispatchEvent(new Event(Event.CHANGE));
            } else {
                this.pendingValue = _loc3_;
            }
        }
        param1.updateAfterEvent();
    }

    override protected function system_mouseUpHandler(param1: Event): void {
        if (getStyle("liveDragging") === false && value != this.pendingValue) {
            this.setValue(this.pendingValue);
            dispatchEvent(new Event(Event.CHANGE));
        }
        super.system_mouseUpHandler(param1);
    }

    public function changeValueByPage(param1: Boolean = true): void {
        var _loc2_: Number = NaN;
        if (param1) {
            _loc2_ = Math.min(value + this.pageSize, maximum);
        } else {
            _loc2_ = Math.max(value - this.pageSize, minimum);
        }
        if (getStyle("smoothScrolling")) {
            this.startAnimation(getStyle("repeatInterval"), _loc2_, linearEaser);
        } else {
            this.setValue(_loc2_);
            dispatchEvent(new Event(Event.CHANGE));
        }
    }

    private function viewport_propertyChangeHandler(param1: PropertyChangeEvent): void {
        switch (param1.property) {
            case "contentWidth":
                this.mx_internal::viewportContentWidthChangeHandler(param1);
                break;
            case "contentHeight":
                this.mx_internal::viewportContentHeightChangeHandler(param1);
                break;
            case "horizontalScrollPosition":
                this.mx_internal::viewportHorizontalScrollPositionChangeHandler(param1);
                break;
            case "verticalScrollPosition":
                this.mx_internal::viewportVerticalScrollPositionChangeHandler(param1);
        }
    }

    mx_internal function viewportResizeHandler(param1: ResizeEvent): void {
    }

    mx_internal function viewportContentWidthChangeHandler(param1: PropertyChangeEvent): void {
    }

    mx_internal function viewportContentHeightChangeHandler(param1: PropertyChangeEvent): void {
    }

    mx_internal function viewportHorizontalScrollPositionChangeHandler(param1: PropertyChangeEvent): void {
    }

    mx_internal function viewportVerticalScrollPositionChangeHandler(param1: PropertyChangeEvent): void {
    }

    override protected function thumb_mouseDownHandler(param1: MouseEvent): void {
        this.stopAnimation();
        super.thumb_mouseDownHandler(param1);
        this.clickOffset = thumb.globalToLocal(new Point(param1.stageX, param1.stageY));
    }

    protected function button_buttonDownHandler(param1: Event): void {
        if (!this.isStepping) {
            this.stopAnimation();
        }
        var _loc2_: * = param1.target == this.incrementButton;
        if (!this.isStepping && (_loc2_ && value < maximum || !_loc2_ && value > minimum)) {
            dispatchEvent(new FlexEvent(FlexEvent.CHANGE_START));
            this.isStepping = true;
            systemManager.getSandboxRoot().addEventListener(MouseEvent.MOUSE_UP, this.button_buttonUpHandler, true);
            systemManager.getSandboxRoot().addEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE, this.button_buttonUpHandler);
        }
        if (!this.steppingDown && !this.steppingUp) {
            changeValueByStep(_loc2_);
            if (getStyle("smoothScrolling") && (_loc2_ && this.pendingValue < maximum || !_loc2_ && this.pendingValue > minimum)) {
                this.animateStepping(_loc2_ ? maximum : minimum, Math.max(this.pageSize / 10, stepSize));
            }
            return;
        }
    }

    protected function button_buttonUpHandler(param1: Event): void {
        if (this.steppingDown || this.steppingUp) {
            this.stopAnimation();
            dispatchEvent(new FlexEvent(FlexEvent.CHANGE_END));
            this.steppingDown = false;
            this.steppingUp = false;
            this.isStepping = false;
        } else if (this.isStepping) {
            dispatchEvent(new FlexEvent(FlexEvent.CHANGE_END));
            this.isStepping = false;
        }
        systemManager.getSandboxRoot().removeEventListener(MouseEvent.MOUSE_UP, this.button_buttonUpHandler, true);
        systemManager.getSandboxRoot().removeEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE, this.button_buttonUpHandler);
    }

    override protected function track_mouseDownHandler(param1: MouseEvent): void {
        var _loc3_: Number = NaN;
        var _loc4_: Number = NaN;
        var _loc5_: Number = NaN;
        var _loc6_: Number = NaN;
        if (!enabled) {
            return;
        }
        this.stopAnimation();
        this.trackPosition = track.globalToLocal(new Point(param1.stageX, param1.stageY));
        if (param1.shiftKey) {
            _loc3_ = !!thumb ? thumb.getLayoutBoundsWidth() : 0;
            _loc4_ = !!thumb ? thumb.getLayoutBoundsHeight() : 0;
            this.trackPosition.x -= _loc3_ / 2;
            this.trackPosition.y -= _loc4_ / 2;
        }
        var _loc2_: Number = pointToValue(this.trackPosition.x, this.trackPosition.y);
        this.trackScrollDown = _loc2_ > this.pendingValue;
        if (param1.shiftKey) {
            _loc5_ = getStyle("slideDuration");
            _loc6_ = nearestValidValue(_loc2_, snapInterval);
            if (getStyle("smoothScrolling") && _loc5_ != 0 && maximum - minimum != 0) {
                dispatchEvent(new FlexEvent(FlexEvent.CHANGE_START));
                this.startAnimation(_loc5_ * (Math.abs(value - _loc2_) / (maximum - minimum)), _loc6_, deceleratingSineEaser);
                this.animatingOnce = true;
            } else {
                this.setValue(_loc6_);
                dispatchEvent(new Event(Event.CHANGE));
            }
            return;
        }
        dispatchEvent(new FlexEvent(FlexEvent.CHANGE_START));
        this.animatingOnce = false;
        this.changeValueByPage(this.trackScrollDown);
        this.trackScrolling = true;
        systemManager.getSandboxRoot().addEventListener(MouseEvent.MOUSE_MOVE, this.track_mouseMoveHandler, true);
        systemManager.getSandboxRoot().addEventListener(MouseEvent.MOUSE_UP, this.track_mouseUpHandler, true);
        systemManager.getSandboxRoot().addEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE, this.track_mouseUpHandler);
        if (!this.trackScrollTimer) {
            this.trackScrollTimer = new Timer(getStyle("repeatDelay"), 1);
            this.trackScrollTimer.addEventListener(TimerEvent.TIMER, this.trackScrollTimerHandler);
        } else {
            this.trackScrollTimer.delay = getStyle("repeatDelay");
            this.trackScrollTimer.repeatCount = 1;
        }
        this.trackScrollTimer.start();
    }

    protected function animatePaging(param1: Number, param2: Number): void {
        this.animatingOnce = false;
        this.startAnimation(getStyle("repeatInterval") * (Math.abs(param1 - this.pendingValue) / param2), param1, linearEaser);
    }

    protected function animateStepping(param1: Number, param2: Number): void {
        var _loc5_: * = null;
        this.steppingDown = param1 > this.pendingValue;
        this.steppingUp = !this.steppingDown;
        var _loc3_: Number = param2 != 0 ? param2 : 1;
        var _loc4_: Number;
        if ((_loc4_ = getStyle("repeatInterval") * (Math.abs(param1 - this.pendingValue) / _loc3_)) > 5000) {
            _loc5_ = new Linear(500 / _loc4_);
        } else {
            _loc5_ = easyInLinearEaser;
        }
        this.startAnimation(_loc4_, param1, _loc5_, getStyle("repeatDelay"));
    }

    private function animationUpdateHandler(param1: Animation): void {
        this.setValue(param1.currentValue["value"]);
    }

    private function animationEndHandler(param1: Animation): void {
        if (this.trackScrolling) {
            this.trackScrolling = false;
        }
        if (this.steppingDown || this.steppingUp) {
            changeValueByStep(this.steppingDown);
            this.animator.startDelay = 0;
            return;
        }
        this.setValue(nearestValidValue(this.pendingValue, snapInterval));
        dispatchEvent(new Event(Event.CHANGE));
        if (this.animatingOnce) {
            dispatchEvent(new FlexEvent(FlexEvent.CHANGE_END));
            this.animatingOnce = false;
        }
    }

    private function stopAnimation(): void {
        if (this.animator.isPlaying) {
            this.animationEndHandler(this.animator);
        }
        this.animator.stop();
    }

    private function trackScrollTimerHandler(param1: Event): void {
        var _loc5_: Number = NaN;
        var _loc6_: Number = NaN;
        var _loc7_: int = 0;
        var _loc8_: Number = NaN;
        var _loc2_: Number = pointToValue(this.trackPosition.x, this.trackPosition.y);
        var _loc3_: * = getStyle("fixedThumbSize") !== false;
        if (this.trackScrollDown) {
            if ((_loc5_ = maximum - minimum) == 0) {
                return;
            }
            if (value + this.pageSize > _loc2_ && (!_loc3_ || nearestValidValue(_loc2_, this.pageSize) != maximum)) {
                return;
            }
        } else if (_loc2_ > value) {
            return;
        }
        if (getStyle("smoothScrolling")) {
            _loc6_ = Math.abs(value - _loc2_);
            if (_loc2_ > value) {
                _loc7_ = this.pageSize != 0 ? int(_loc6_ / this.pageSize) : _loc6_;
                if (_loc3_ && nearestValidValue(_loc2_, this.pageSize) == maximum) {
                    _loc8_ = maximum;
                } else {
                    _loc8_ = value + _loc7_ * this.pageSize;
                }
            } else {
                _loc7_ = this.pageSize != 0 ? int(Math.ceil(_loc6_ / this.pageSize)) : _loc6_;
                _loc8_ = Math.max(minimum, value - _loc7_ * this.pageSize);
            }
            this.animatePaging(_loc8_, this.pageSize);
            return;
        }
        var _loc4_: Number = value;
        this.changeValueByPage(this.trackScrollDown);
        if (Boolean(this.trackScrollTimer) && this.trackScrollTimer.repeatCount == 1) {
            this.trackScrollTimer.delay = getStyle("repeatInterval");
            this.trackScrollTimer.repeatCount = 0;
        }
    }

    private function track_mouseMoveHandler(param1: MouseEvent): void {
        var _loc2_: * = null;
        if (this.trackScrolling) {
            _loc2_ = new Point(param1.stageX, param1.stageY);
            this.trackPosition = track.globalToLocal(_loc2_);
        }
    }

    private function track_mouseUpHandler(param1: Event): void {
        this.trackScrolling = false;
        systemManager.getSandboxRoot().removeEventListener(MouseEvent.MOUSE_MOVE, this.track_mouseMoveHandler, true);
        systemManager.getSandboxRoot().removeEventListener(MouseEvent.MOUSE_UP, this.track_mouseUpHandler, true);
        systemManager.getSandboxRoot().removeEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE, this.track_mouseUpHandler);
        if (getStyle("smoothScrolling")) {
            if (!this.animatingOnce) {
                if (Boolean(this.trackScrollTimer) && this.trackScrollTimer.running) {
                    if (this.animator.isPlaying) {
                        this.animatingOnce = true;
                    } else {
                        dispatchEvent(new FlexEvent(FlexEvent.CHANGE_END));
                    }
                } else {
                    this.stopAnimation();
                    dispatchEvent(new FlexEvent(FlexEvent.CHANGE_END));
                }
            }
        } else {
            dispatchEvent(new FlexEvent(FlexEvent.CHANGE_END));
        }
        if (this.trackScrollTimer) {
            this.trackScrollTimer.reset();
        }
    }

    private function track_rollOverHandler(param1: MouseEvent): void {
        if (this.trackScrolling && Boolean(this.trackScrollTimer)) {
            this.trackScrollTimer.start();
        }
    }

    private function track_rollOutHandler(param1: MouseEvent): void {
        if (this.trackScrolling && Boolean(this.trackScrollTimer)) {
            this.trackScrollTimer.stop();
        }
    }

    private function button_rollOverHandler(param1: MouseEvent): void {
        if (this.steppingUp || this.steppingDown) {
            this.animator.resume();
        }
    }

    private function button_rollOutHandler(param1: MouseEvent): void {
        if (this.steppingUp || this.steppingDown) {
            this.animator.pause();
        }
    }
}
}
