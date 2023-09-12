package spark.components.supportClasses {

import flash.display.DisplayObject;
import flash.events.Event;
import flash.events.FocusEvent;
import flash.events.MouseEvent;
import flash.geom.Point;

import mx.core.InteractionMode;
import mx.core.mx_internal;
import mx.events.FlexEvent;
import mx.events.ResizeEvent;
import mx.events.SandboxMouseEvent;
import mx.events.TouchInteractionEvent;

import spark.components.Button;
import spark.events.TrackBaseEvent;

public class TrackBase extends Range {

    mx_internal static const VERSION: String = "4.6.0.23201";


    [SkinPart(required="false")]
    public var thumb: Button;

    [SkinPart(required="false")]
    public var track: Button;

    private var mouseDownTarget: DisplayObject;

    private var clickOffset: Point;

    public function TrackBase() {
        super();
        addEventListener(Event.ADDED_TO_STAGE, this.addedToStageHandler);
        addEventListener(MouseEvent.MOUSE_DOWN, this.mouseDownHandler);
    }

    override public function get maximum(): Number {
        return super.maximum;
    }

    override public function set maximum(param1: Number): void {
        if (param1 == super.maximum) {
            return;
        }
        super.maximum = param1;
        invalidateDisplayList();
    }

    override public function get minimum(): Number {
        return super.minimum;
    }

    override public function set minimum(param1: Number): void {
        if (param1 == super.minimum) {
            return;
        }
        super.minimum = param1;
        invalidateDisplayList();
    }

    override public function set scaleX(param1: Number): void {
        if (param1 == super.scaleX) {
            return;
        }
        if (super.scaleX == 0) {
            invalidateDisplayList();
        }
        super.scaleX = param1;
    }

    override public function set scaleY(param1: Number): void {
        if (param1 == super.scaleY) {
            return;
        }
        if (super.scaleY == 0) {
            invalidateDisplayList();
        }
        super.scaleY = param1;
    }

    [Bindable(event="valueCommit")]
    override public function get value(): Number {
        return super.value;
    }

    override public function set value(param1: Number): void {
        if (param1 == super.value) {
            return;
        }
        super.value = param1;
        invalidateDisplayList();
    }

    override protected function setValue(param1: Number): void {
        super.setValue(param1);
        invalidateDisplayList();
    }

    protected function pointToValue(param1: Number, param2: Number): Number {
        return this.minimum;
    }

    override public function changeValueByStep(param1: Boolean = true): void {
        var _loc2_: Number = this.value;
        super.changeValueByStep(param1);
        if (this.value != _loc2_) {
            dispatchEvent(new Event(Event.CHANGE));
        }
    }

    override protected function getCurrentSkinState(): String {
        return enabled ? "normal" : "disabled";
    }

    override protected function partAdded(param1: String, param2: Object): void {
        super.partAdded(param1, param2);
        if (param2 == this.thumb) {
            this.thumb.addEventListener(MouseEvent.MOUSE_DOWN, this.thumb_mouseDownHandler);
            this.thumb.addEventListener(TouchInteractionEvent.TOUCH_INTERACTION_STARTING, this.thumb_touchInteractionStartingHandler);
            this.thumb.addEventListener(ResizeEvent.RESIZE, this.thumb_resizeHandler);
            this.thumb.addEventListener(FlexEvent.UPDATE_COMPLETE, this.thumb_updateCompleteHandler);
            this.thumb.stickyHighlighting = true;
        } else if (param2 == this.track) {
            this.track.addEventListener(ResizeEvent.RESIZE, this.track_resizeHandler);
            if (getStyle("interactionMode") == InteractionMode.MOUSE) {
                this.track.addEventListener(MouseEvent.MOUSE_DOWN, this.track_mouseDownHandler);
            }
        }
    }

    override protected function partRemoved(param1: String, param2: Object): void {
        super.partRemoved(param1, param2);
        if (param2 == this.thumb) {
            this.thumb.removeEventListener(MouseEvent.MOUSE_DOWN, this.thumb_mouseDownHandler);
            this.thumb.removeEventListener(TouchInteractionEvent.TOUCH_INTERACTION_STARTING, this.thumb_touchInteractionStartingHandler);
            this.thumb.removeEventListener(ResizeEvent.RESIZE, this.thumb_resizeHandler);
            this.thumb.removeEventListener(FlexEvent.UPDATE_COMPLETE, this.thumb_updateCompleteHandler);
        } else if (param2 == this.track) {
            this.track.removeEventListener(MouseEvent.MOUSE_DOWN, this.track_mouseDownHandler);
            this.track.removeEventListener(ResizeEvent.RESIZE, this.track_resizeHandler);
        }
    }

    override public function styleChanged(param1: String): void {
        var _loc2_: Boolean = param1 == null || param1 == "styleName";
        super.styleChanged(param1);
        if (_loc2_ || param1 == "interactionMode") {
            if (this.track) {
                if (getStyle("interactionMode") == InteractionMode.MOUSE) {
                    this.track.addEventListener(MouseEvent.MOUSE_DOWN, this.track_mouseDownHandler);
                } else {
                    this.track.removeEventListener(MouseEvent.MOUSE_DOWN, this.track_mouseDownHandler);
                }
            }
        }
    }

    override protected function focusInHandler(param1: FocusEvent): void {
        super.focusInHandler(param1);
        systemManager.getSandboxRoot().addEventListener(MouseEvent.MOUSE_WHEEL, this.system_mouseWheelHandler, true);
    }

    override protected function focusOutHandler(param1: FocusEvent): void {
        super.focusOutHandler(param1);
        systemManager.getSandboxRoot().removeEventListener(MouseEvent.MOUSE_WHEEL, this.system_mouseWheelHandler, true);
    }

    override protected function updateDisplayList(param1: Number, param2: Number): void {
        super.updateDisplayList(param1, param2);
        this.updateSkinDisplayList();
    }

    protected function updateSkinDisplayList(): void {
    }

    private function addedToStageHandler(param1: Event): void {
        this.updateSkinDisplayList();
    }

    private function track_resizeHandler(param1: Event): void {
        this.updateSkinDisplayList();
    }

    private function thumb_resizeHandler(param1: Event): void {
        this.updateSkinDisplayList();
    }

    private function thumb_updateCompleteHandler(param1: Event): void {
        this.updateSkinDisplayList();
        this.thumb.removeEventListener(FlexEvent.UPDATE_COMPLETE, this.thumb_updateCompleteHandler);
    }

    protected function system_mouseWheelHandler(param1: MouseEvent): void {
        var _loc2_: Number = NaN;
        if (!param1.isDefaultPrevented()) {
            _loc2_ = nearestValidValue(this.value + param1.delta * stepSize, stepSize);
            this.setValue(_loc2_);
            dispatchEvent(new Event(Event.CHANGE));
            param1.preventDefault();
        }
    }

    protected function thumb_mouseDownHandler(param1: MouseEvent): void {
        systemManager.getSandboxRoot().addEventListener(MouseEvent.MOUSE_MOVE, this.system_mouseMoveHandler, true);
        systemManager.getSandboxRoot().addEventListener(MouseEvent.MOUSE_UP, this.system_mouseUpHandler, true);
        systemManager.getSandboxRoot().addEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE, this.system_mouseUpHandler);
        this.clickOffset = this.thumb.globalToLocal(new Point(param1.stageX, param1.stageY));
        dispatchEvent(new TrackBaseEvent(TrackBaseEvent.THUMB_PRESS));
        dispatchEvent(new FlexEvent(FlexEvent.CHANGE_START));
    }

    protected function thumb_touchInteractionStartingHandler(param1: TouchInteractionEvent): void {
        param1.preventDefault();
    }

    protected function system_mouseMoveHandler(param1: MouseEvent): void {
        if (!this.track) {
            return;
        }
        var _loc2_: Point = this.track.globalToLocal(new Point(param1.stageX, param1.stageY));
        var _loc3_: Number = this.pointToValue(_loc2_.x - this.clickOffset.x, _loc2_.y - this.clickOffset.y);
        _loc3_ = nearestValidValue(_loc3_, snapInterval);
        if (_loc3_ != this.value) {
            this.setValue(_loc3_);
            dispatchEvent(new TrackBaseEvent(TrackBaseEvent.THUMB_DRAG));
            dispatchEvent(new Event(Event.CHANGE));
        }
        param1.updateAfterEvent();
    }

    protected function system_mouseUpHandler(param1: Event): void {
        systemManager.getSandboxRoot().removeEventListener(MouseEvent.MOUSE_MOVE, this.system_mouseMoveHandler, true);
        systemManager.getSandboxRoot().removeEventListener(MouseEvent.MOUSE_UP, this.system_mouseUpHandler, true);
        systemManager.getSandboxRoot().removeEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE, this.system_mouseUpHandler);
        dispatchEvent(new TrackBaseEvent(TrackBaseEvent.THUMB_RELEASE));
        dispatchEvent(new FlexEvent(FlexEvent.CHANGE_END));
    }

    protected function track_mouseDownHandler(param1: MouseEvent): void {
    }

    private function mouseDownHandler(param1: MouseEvent): void {
        systemManager.getSandboxRoot().addEventListener(MouseEvent.MOUSE_UP, this.system_mouseUpSomewhereHandler, true);
        systemManager.getSandboxRoot().addEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE, this.system_mouseUpSomewhereHandler);
        this.mouseDownTarget = DisplayObject(param1.target);
    }

    private function system_mouseUpSomewhereHandler(param1: Event): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        systemManager.getSandboxRoot().removeEventListener(MouseEvent.MOUSE_UP, this.system_mouseUpSomewhereHandler, true);
        systemManager.getSandboxRoot().removeEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE, this.system_mouseUpSomewhereHandler);
        if (this.mouseDownTarget != param1.target && param1 is MouseEvent && contains(DisplayObject(param1.target))) {
            _loc2_ = param1 as MouseEvent;
            _loc3_ = new Point(_loc2_.localX, _loc2_.localY);
            _loc3_ = globalToLocal(DisplayObject(param1.target).localToGlobal(_loc3_));
            dispatchEvent(new MouseEvent(MouseEvent.CLICK, _loc2_.bubbles, _loc2_.cancelable, _loc3_.x, _loc3_.y, _loc2_.relatedObject, _loc2_.ctrlKey, _loc2_.altKey, _loc2_.shiftKey, _loc2_.buttonDown, _loc2_.delta));
        }
        this.mouseDownTarget = null;
    }
}
}
