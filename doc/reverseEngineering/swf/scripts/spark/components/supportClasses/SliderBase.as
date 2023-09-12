package spark.components.supportClasses {

import flash.display.DisplayObject;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.events.TimerEvent;
import flash.geom.Point;
import flash.ui.Keyboard;
import flash.utils.Timer;

import mx.core.IDataRenderer;
import mx.core.IFactory;
import mx.core.UIComponent;
import mx.core.mx_internal;
import mx.events.FlexEvent;
import mx.formatters.NumberFormatter;
import mx.managers.IFocusManagerComponent;

import spark.effects.animation.Animation;
import spark.effects.animation.MotionPath;
import spark.effects.animation.SimpleMotionPath;
import spark.effects.easing.Sine;
import spark.events.TrackBaseEvent;

public class SliderBase extends TrackBase implements IFocusManagerComponent {

    mx_internal static const VERSION: String = "4.6.0.23201";

    mx_internal static var createAccessibilityImplementation: Function;

    private static const MAX_DRAG_RATE: Number = 30;


    [SkinPart(type="mx.core.IDataRenderer", required="false")]
    public var dataTip: IFactory;

    private var dataFormatter: NumberFormatter;

    private var animator: Animation = null;

    private var dataTipInitialPosition: Point;

    private var dataTipInstance: IDataRenderer;

    private var slideToValue: Number;

    private var isKeyDown: Boolean = false;

    private var clickOffset: Point;

    private var mostRecentMousePoint: Point;

    private var dragTimer: Timer = null;

    private var dragPending: Boolean = false;

    private var _dataTipFormatFunction: Function;

    public var dataTipPrecision: int = 2;

    private var _pendingValue: Number = 0;

    public var showDataTip: Boolean = true;

    public function SliderBase() {
        super();
        maximum = 10;
    }

    override public function get maximum(): Number {
        return super.maximum;
    }

    public function get dataTipFormatFunction(): Function {
        return this._dataTipFormatFunction;
    }

    public function set dataTipFormatFunction(param1: Function): void {
        this._dataTipFormatFunction = param1;
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

    override protected function initializeAccessibility(): void {
        if (false) {
            SliderBase.mx_internal::createAccessibilityImplementation(this);
        }
    }

    override protected function partAdded(param1: String, param2: Object): void {
        super.partAdded(param1, param2);
        if (param2 == thumb) {
            thumb.focusEnabled = false;
        } else if (param2 == track) {
            track.focusEnabled = false;
        }
    }

    override public function drawFocus(param1: Boolean): void {
        if (thumb) {
            thumb.mx_internal::drawFocusAnyway = true;
            thumb.drawFocus(param1);
        } else {
            super.drawFocus(param1);
        }
    }

    override protected function setValue(param1: Number): void {
        this._pendingValue = param1;
        super.setValue(param1);
    }

    override mx_internal function updateErrorSkin(): void {
    }

    protected function updateDataTip(param1: IDataRenderer, param2: Point): void {
    }

    private function formatDataTipText(param1: Number): Object {
        var _loc2_: * = null;
        if (this.dataTipFormatFunction != null) {
            _loc2_ = this.dataTipFormatFunction(param1);
        } else {
            if (this.dataFormatter == null) {
                this.dataFormatter = new NumberFormatter();
            }
            this.dataFormatter.precision = this.dataTipPrecision;
            _loc2_ = this.dataFormatter.format(param1);
        }
        return _loc2_;
    }

    private function animationUpdateHandler(param1: Animation): void {
        this.pendingValue = param1.currentValue["value"];
    }

    private function animationEndHandler(param1: Animation): void {
        this.setValue(this.slideToValue);
        dispatchEvent(new Event(Event.CHANGE));
        dispatchEvent(new FlexEvent(FlexEvent.CHANGE_END));
    }

    private function stopAnimation(): void {
        this.animator.stop();
        this.setValue(nearestValidValue(this.pendingValue, snapInterval));
        dispatchEvent(new Event(Event.CHANGE));
        dispatchEvent(new FlexEvent(FlexEvent.CHANGE_END));
    }

    override protected function thumb_mouseDownHandler(param1: MouseEvent): void {
        var _loc2_: * = null;
        if (Boolean(this.animator) && this.animator.isPlaying) {
            this.stopAnimation();
        }
        super.thumb_mouseDownHandler(param1);
        this.clickOffset = thumb.globalToLocal(new Point(param1.stageX, param1.stageY));
        if (this.dataTip && this.showDataTip && enabled) {
            this.dataTipInstance = IDataRenderer(createDynamicPartInstance("dataTip"));
            this.dataTipInstance.data = this.formatDataTipText(nearestValidValue(this.pendingValue, snapInterval));
            _loc2_ = this.dataTipInstance as UIComponent;
            if (_loc2_) {
                _loc2_.owner = this;
                _loc2_.isPopUp = true;
            }
            systemManager.toolTipChildren.addChild(DisplayObject(this.dataTipInstance));
            if (_loc2_) {
                _loc2_.validateNow();
                _loc2_.setActualSize(_loc2_.getExplicitOrMeasuredWidth(), _loc2_.getExplicitOrMeasuredHeight());
            }
            this.dataTipInitialPosition = new Point(DisplayObject(this.dataTipInstance).x, DisplayObject(this.dataTipInstance).y);
            this.updateDataTip(this.dataTipInstance, this.dataTipInitialPosition);
        }
    }

    private function handleMousePoint(param1: Point): void {
        var _loc3_: * = null;
        var _loc2_: Number = pointToValue(param1.x - this.clickOffset.x, param1.y - this.clickOffset.y);
        _loc2_ = nearestValidValue(_loc2_, snapInterval);
        if (_loc2_ != this.pendingValue) {
            dispatchEvent(new TrackBaseEvent(TrackBaseEvent.THUMB_DRAG));
            if (getStyle("liveDragging") === true) {
                this.setValue(_loc2_);
                dispatchEvent(new Event(Event.CHANGE));
            } else {
                this.pendingValue = _loc2_;
            }
        }
        if (Boolean(this.dataTipInstance) && this.showDataTip) {
            this.dataTipInstance.data = this.formatDataTipText(this.pendingValue);
            _loc3_ = this.dataTipInstance as UIComponent;
            if (_loc3_) {
                _loc3_.validateNow();
                _loc3_.setActualSize(_loc3_.getExplicitOrMeasuredWidth(), _loc3_.getExplicitOrMeasuredHeight());
            }
            this.updateDataTip(this.dataTipInstance, this.dataTipInitialPosition);
        }
    }

    override protected function system_mouseMoveHandler(param1: MouseEvent): void {
        if (!track) {
            return;
        }
        this.mostRecentMousePoint = track.globalToLocal(new Point(param1.stageX, param1.stageY));
        if (!this.dragTimer) {
            this.dragTimer = new Timer(1000 / MAX_DRAG_RATE, 0);
            this.dragTimer.addEventListener(TimerEvent.TIMER, this.dragTimerHandler);
        }
        if (!this.dragTimer.running) {
            this.handleMousePoint(this.mostRecentMousePoint);
            param1.updateAfterEvent();
            this.dragTimer.start();
            this.dragPending = false;
        } else {
            this.dragPending = true;
        }
    }

    private function dragTimerHandler(param1: TimerEvent): void {
        if (this.dragPending) {
            this.handleMousePoint(this.mostRecentMousePoint);
            param1.updateAfterEvent();
            this.dragPending = false;
        } else {
            this.dragTimer.stop();
        }
    }

    override protected function system_mouseUpHandler(param1: Event): void {
        if (this.dragTimer) {
            if (this.dragPending) {
                this.handleMousePoint(this.mostRecentMousePoint);
                if (param1 is MouseEvent) {
                    MouseEvent(param1).updateAfterEvent();
                }
            }
            this.dragTimer.stop();
            this.dragTimer.removeEventListener(TimerEvent.TIMER, this.dragTimerHandler);
            this.dragTimer = null;
        }
        if (getStyle("liveDragging") === false && value != this.pendingValue) {
            this.setValue(this.pendingValue);
            dispatchEvent(new Event(Event.CHANGE));
        }
        if (this.dataTipInstance) {
            removeDynamicPartInstance("dataTip", this.dataTipInstance);
            systemManager.toolTipChildren.removeChild(DisplayObject(this.dataTipInstance));
            this.dataTipInstance = null;
        }
        super.system_mouseUpHandler(param1);
    }

    override protected function keyDownHandler(param1: KeyboardEvent): void {
        var _loc3_: Number = NaN;
        super.keyDownHandler(param1);
        if (param1.isDefaultPrevented()) {
            return;
        }
        if (Boolean(this.animator) && this.animator.isPlaying) {
            this.stopAnimation();
        }
        var _loc2_: Number = this.value;
        var _loc4_: uint = uint(mx_internal::mapKeycodeForLayoutDirection(param1, true));
        switch (_loc4_) {
            case Keyboard.DOWN:
            case Keyboard.LEFT:
                _loc3_ = nearestValidValue(this.pendingValue - stepSize, snapInterval);
                if (_loc2_ != _loc3_) {
                    if (!this.isKeyDown) {
                        dispatchEvent(new FlexEvent(FlexEvent.CHANGE_START));
                        this.isKeyDown = true;
                    }
                    this.setValue(_loc3_);
                    dispatchEvent(new Event(Event.CHANGE));
                }
                param1.preventDefault();
                break;
            case Keyboard.UP:
            case Keyboard.RIGHT:
                _loc3_ = nearestValidValue(this.pendingValue + stepSize, snapInterval);
                if (_loc2_ != _loc3_) {
                    if (!this.isKeyDown) {
                        dispatchEvent(new FlexEvent(FlexEvent.CHANGE_START));
                        this.isKeyDown = true;
                    }
                    this.setValue(_loc3_);
                    dispatchEvent(new Event(Event.CHANGE));
                }
                param1.preventDefault();
                break;
            case Keyboard.HOME:
                value = minimum;
                if (value != _loc2_) {
                    dispatchEvent(new Event(Event.CHANGE));
                }
                param1.preventDefault();
                break;
            case Keyboard.END:
                value = this.maximum;
                if (value != _loc2_) {
                    dispatchEvent(new Event(Event.CHANGE));
                }
                param1.preventDefault();
        }
    }

    override protected function keyUpHandler(param1: KeyboardEvent): void {
        switch (param1.keyCode) {
            case Keyboard.DOWN:
            case Keyboard.LEFT:
            case Keyboard.UP:
            case Keyboard.RIGHT:
                if (this.isKeyDown) {
                    dispatchEvent(new FlexEvent(FlexEvent.CHANGE_END));
                    this.isKeyDown = false;
                }
                param1.preventDefault();
        }
    }

    override protected function track_mouseDownHandler(param1: MouseEvent): void {
        var _loc8_: Number = NaN;
        var _loc9_: * = null;
        if (!enabled) {
            return;
        }
        var _loc2_: Number = !!thumb ? 0 : 0;
        var _loc3_: Number = !!thumb ? 0 : 0;
        var _loc4_: Number = param1.stageX - _loc2_ / 2;
        var _loc5_: Number = param1.stageY - _loc3_ / 2;
        var _loc6_: Point = track.globalToLocal(new Point(_loc4_, _loc5_));
        var _loc7_: Number = pointToValue(_loc6_.x, _loc6_.y);
        if ((_loc7_ = nearestValidValue(_loc7_, snapInterval)) != this.pendingValue) {
            if ((_loc8_ = getStyle("slideDuration")) != 0) {
                if (!this.animator) {
                    this.animator = new Animation();
                    (_loc9_ = new AnimationTarget(this.animationUpdateHandler)).endFunction = this.animationEndHandler;
                    this.animator.animationTarget = _loc9_;
                    this.animator.easer = new Sine(0);
                }
                if (this.animator.isPlaying) {
                    this.stopAnimation();
                }
                this.slideToValue = _loc7_;
                this.animator.duration = _loc8_ * (Math.abs(this.pendingValue - this.slideToValue) / (this.maximum - minimum));
                this.animator.motionPaths = new <MotionPath>[new SimpleMotionPath("value", this.pendingValue, this.slideToValue)];
                dispatchEvent(new FlexEvent(FlexEvent.CHANGE_START));
                this.animator.play();
            } else {
                this.setValue(_loc7_);
                dispatchEvent(new Event(Event.CHANGE));
            }
        }
        param1.updateAfterEvent();
    }
}
}
