package spark.components.supportClasses {

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.FocusEvent;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.events.TimerEvent;
import flash.ui.Keyboard;
import flash.utils.Timer;

import mx.core.mx_internal;
import mx.events.FlexEvent;
import mx.events.SandboxMouseEvent;
import mx.managers.ISystemManager;

import spark.events.DropDownEvent;

public class DropDownController extends EventDispatcher {


    private var mouseIsDown: Boolean;

    private var _openButton: ButtonBase;

    private var _systemManager: ISystemManager;

    public var hitAreaAdditions: Vector.<DisplayObject>;

    private var _dropDown: DisplayObject;

    private var _isOpen: Boolean = false;

    private var _closeOnResize: Boolean = true;

    private var _rollOverOpenDelay: Number = NaN;

    private var rollOverOpenDelayTimer: Timer;

    public function DropDownController() {
        super();
    }

    public function set openButton(param1: ButtonBase): void {
        if (this._openButton === param1) {
            return;
        }
        this.removeOpenTriggers();
        this._openButton = param1;
        this._openButton.mx_internal::disableMinimumDownStateTime = true;
        this.addOpenTriggers();
    }

    public function get openButton(): ButtonBase {
        return this._openButton;
    }

    public function set systemManager(param1: ISystemManager): void {
        this._systemManager = param1;
    }

    public function get systemManager(): ISystemManager {
        return this._systemManager != null ? this._systemManager : (this.openButton != null ? this.openButton.systemManager : null);
    }

    public function set dropDown(param1: DisplayObject): void {
        if (this._dropDown === param1) {
            return;
        }
        this._dropDown = param1;
    }

    public function get dropDown(): DisplayObject {
        return this._dropDown;
    }

    public function get isOpen(): Boolean {
        return this._isOpen;
    }

    public function get closeOnResize(): Boolean {
        return this._closeOnResize;
    }

    public function set closeOnResize(param1: Boolean): void {
        if (this._closeOnResize == param1) {
            return;
        }
        if (this.isOpen) {
            this.removeCloseOnResizeTrigger();
        }
        this._closeOnResize = param1;
        this.addCloseOnResizeTrigger();
    }

    public function get rollOverOpenDelay(): Number {
        return this._rollOverOpenDelay;
    }

    public function set rollOverOpenDelay(param1: Number): void {
        if (this._rollOverOpenDelay == param1) {
            return;
        }
        this.removeOpenTriggers();
        this._rollOverOpenDelay = param1;
        this.addOpenTriggers();
    }

    private function addOpenTriggers(): void {
        if (this.openButton) {
            if (isNaN(this.rollOverOpenDelay)) {
                this.openButton.addEventListener(FlexEvent.BUTTON_DOWN, this.mx_internal::openButton_buttonDownHandler);
            } else {
                this.openButton.addEventListener(MouseEvent.ROLL_OVER, this.mx_internal::openButton_rollOverHandler);
            }
        }
    }

    private function removeOpenTriggers(): void {
        if (this.openButton) {
            if (isNaN(this.rollOverOpenDelay)) {
                this.openButton.removeEventListener(FlexEvent.BUTTON_DOWN, this.mx_internal::openButton_buttonDownHandler);
            } else {
                this.openButton.removeEventListener(MouseEvent.ROLL_OVER, this.mx_internal::openButton_rollOverHandler);
            }
        }
    }

    private function addCloseTriggers(): void {
        if (this.systemManager) {
            if (isNaN(this.rollOverOpenDelay)) {
                this.systemManager.getSandboxRoot().addEventListener(MouseEvent.MOUSE_DOWN, this.mx_internal::systemManager_mouseDownHandler);
                this.systemManager.getSandboxRoot().addEventListener(SandboxMouseEvent.MOUSE_DOWN_SOMEWHERE, this.mx_internal::systemManager_mouseDownHandler);
                this.systemManager.getSandboxRoot().addEventListener(MouseEvent.MOUSE_UP, this.mx_internal::systemManager_mouseUpHandler_noRollOverOpenDelay);
            } else {
                this.systemManager.getSandboxRoot().addEventListener(MouseEvent.MOUSE_MOVE, this.mx_internal::systemManager_mouseMoveHandler);
                this.systemManager.getSandboxRoot().addEventListener(SandboxMouseEvent.MOUSE_MOVE_SOMEWHERE, this.mx_internal::systemManager_mouseMoveHandler);
            }
            this.addCloseOnResizeTrigger();
            if (Boolean(this.openButton) && Boolean(this.openButton.systemManager)) {
                this.openButton.systemManager.getSandboxRoot().addEventListener(MouseEvent.MOUSE_WHEEL, this.systemManager_mouseWheelHandler);
            }
        }
    }

    private function addCloseOnResizeTrigger(): void {
        if (this.closeOnResize) {
            this.systemManager.getSandboxRoot().addEventListener(Event.RESIZE, this.mx_internal::systemManager_resizeHandler, false, 0, true);
        }
    }

    private function removeCloseTriggers(): void {
        if (this.systemManager) {
            if (isNaN(this.rollOverOpenDelay)) {
                this.systemManager.getSandboxRoot().removeEventListener(MouseEvent.MOUSE_DOWN, this.mx_internal::systemManager_mouseDownHandler);
                this.systemManager.getSandboxRoot().removeEventListener(SandboxMouseEvent.MOUSE_DOWN_SOMEWHERE, this.mx_internal::systemManager_mouseDownHandler);
                this.systemManager.getSandboxRoot().removeEventListener(MouseEvent.MOUSE_UP, this.mx_internal::systemManager_mouseUpHandler_noRollOverOpenDelay);
            } else {
                this.systemManager.getSandboxRoot().removeEventListener(MouseEvent.MOUSE_MOVE, this.mx_internal::systemManager_mouseMoveHandler);
                this.systemManager.getSandboxRoot().removeEventListener(SandboxMouseEvent.MOUSE_MOVE_SOMEWHERE, this.mx_internal::systemManager_mouseMoveHandler);
                this.systemManager.getSandboxRoot().removeEventListener(MouseEvent.MOUSE_UP, this.mx_internal::systemManager_mouseUpHandler);
                this.systemManager.getSandboxRoot().removeEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE, this.mx_internal::systemManager_mouseUpHandler);
            }
            this.removeCloseOnResizeTrigger();
            if (Boolean(this.openButton) && Boolean(this.openButton.systemManager)) {
                this.openButton.systemManager.getSandboxRoot().removeEventListener(MouseEvent.MOUSE_WHEEL, this.systemManager_mouseWheelHandler);
            }
        }
    }

    private function removeCloseOnResizeTrigger(): void {
        if (this.closeOnResize) {
            this.systemManager.getSandboxRoot().removeEventListener(Event.RESIZE, this.mx_internal::systemManager_resizeHandler);
        }
    }

    private function isTargetOverDropDownOrOpenButton(param1: DisplayObject): Boolean {
        var _loc2_: int = 0;
        if (param1) {
            if (Boolean(this.openButton) && this.openButton.contains(param1)) {
                return true;
            }
            if (this.hitAreaAdditions != null) {
                _loc2_ = 0;
                while (_loc2_ < this.hitAreaAdditions.length) {
                    if (this.hitAreaAdditions[_loc2_] == param1 || this.hitAreaAdditions[_loc2_] is DisplayObjectContainer && Boolean(DisplayObjectContainer(this.hitAreaAdditions[_loc2_]).contains(param1 as DisplayObject))) {
                        return true;
                    }
                    _loc2_++;
                }
            }
            if (this.dropDown is DisplayObjectContainer) {
                if (DisplayObjectContainer(this.dropDown).contains(param1)) {
                    return true;
                }
            } else if (param1 == this.dropDown) {
                return true;
            }
        }
        return false;
    }

    public function openDropDown(): void {
        this.openDropDownHelper(true);
    }

    private function openDropDownHelper(param1: Boolean = false): void {
        if (!this.isOpen) {
            this.addCloseTriggers();
            this._isOpen = true;
            if (this.openButton) {
                this.openButton.mx_internal::keepDown(true, !param1);
            }
            dispatchEvent(new DropDownEvent(DropDownEvent.OPEN));
        }
    }

    public function closeDropDown(param1: Boolean): void {
        var _loc2_: * = null;
        if (this.isOpen) {
            this._isOpen = false;
            if (this.openButton) {
                this.openButton.mx_internal::keepDown(false);
            }
            _loc2_ = new DropDownEvent(DropDownEvent.CLOSE, false, true);
            if (!param1) {
                _loc2_.preventDefault();
            }
            dispatchEvent(_loc2_);
            this.removeCloseTriggers();
        }
    }

    mx_internal function openButton_buttonDownHandler(param1: Event): void {
        if (this.isOpen) {
            this.closeDropDown(true);
        } else {
            this.mouseIsDown = true;
            this.openDropDownHelper();
        }
    }

    mx_internal function openButton_rollOverHandler(param1: MouseEvent): void {
        if (this.rollOverOpenDelay == 0) {
            this.openDropDownHelper();
        } else {
            this.openButton.addEventListener(MouseEvent.ROLL_OUT, this.openButton_rollOutHandler);
            this.rollOverOpenDelayTimer = new Timer(this.rollOverOpenDelay, 1);
            this.rollOverOpenDelayTimer.addEventListener(TimerEvent.TIMER_COMPLETE, this.rollOverDelay_timerCompleteHandler);
            this.rollOverOpenDelayTimer.start();
        }
    }

    private function openButton_rollOutHandler(param1: MouseEvent): void {
        if (Boolean(this.rollOverOpenDelayTimer) && this.rollOverOpenDelayTimer.running) {
            this.rollOverOpenDelayTimer.stop();
            this.rollOverOpenDelayTimer = null;
        }
        this.openButton.removeEventListener(MouseEvent.ROLL_OUT, this.openButton_rollOutHandler);
    }

    private function rollOverDelay_timerCompleteHandler(param1: TimerEvent): void {
        this.openButton.removeEventListener(MouseEvent.ROLL_OUT, this.openButton_rollOutHandler);
        this.rollOverOpenDelayTimer = null;
        this.openDropDownHelper();
    }

    mx_internal function systemManager_mouseDownHandler(param1: Event): void {
        var _loc2_: * = null;
        var _loc3_: int = 0;
        if (this.mouseIsDown) {
            this.mouseIsDown = false;
            return;
        }
        if (!this.dropDown || this.dropDown && (param1.target == this.dropDown || this.dropDown is DisplayObjectContainer && !DisplayObjectContainer(this.dropDown).contains(DisplayObject(param1.target)))) {
            _loc2_ = param1.target as DisplayObject;
            if (this.openButton && _loc2_ && this.openButton.contains(_loc2_)) {
                return;
            }
            if (this.hitAreaAdditions != null) {
                _loc3_ = 0;
                while (_loc3_ < this.hitAreaAdditions.length) {
                    if (this.hitAreaAdditions[_loc3_] == param1.target || this.hitAreaAdditions[_loc3_] is DisplayObjectContainer && Boolean(DisplayObjectContainer(this.hitAreaAdditions[_loc3_]).contains(param1.target as DisplayObject))) {
                        return;
                    }
                    _loc3_++;
                }
            }
            this.closeDropDown(true);
        }
    }

    mx_internal function systemManager_mouseMoveHandler(param1: Event): void {
        var _loc2_: DisplayObject = param1.target as DisplayObject;
        var _loc3_: Boolean = this.isTargetOverDropDownOrOpenButton(_loc2_);
        if (_loc3_) {
            return;
        }
        if (param1 is MouseEvent && Boolean(MouseEvent(param1).buttonDown) || param1 is SandboxMouseEvent && Boolean(SandboxMouseEvent(param1).buttonDown)) {
            this.systemManager.getSandboxRoot().addEventListener(MouseEvent.MOUSE_UP, this.mx_internal::systemManager_mouseUpHandler);
            this.systemManager.getSandboxRoot().addEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE, this.mx_internal::systemManager_mouseUpHandler);
            return;
        }
        this.closeDropDown(true);
    }

    mx_internal function systemManager_mouseUpHandler_noRollOverOpenDelay(param1: Event): void {
        if (this.mouseIsDown) {
            this.mouseIsDown = false;
            return;
        }
    }

    mx_internal function systemManager_mouseUpHandler(param1: Event): void {
        var _loc2_: DisplayObject = param1.target as DisplayObject;
        var _loc3_: Boolean = this.isTargetOverDropDownOrOpenButton(_loc2_);
        if (_loc3_) {
            this.systemManager.getSandboxRoot().removeEventListener(MouseEvent.MOUSE_UP, this.mx_internal::systemManager_mouseUpHandler);
            this.systemManager.getSandboxRoot().removeEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE, this.mx_internal::systemManager_mouseUpHandler);
            return;
        }
        this.closeDropDown(true);
    }

    mx_internal function systemManager_resizeHandler(param1: Event): void {
        this.closeDropDown(true);
    }

    private function systemManager_mouseWheelHandler(param1: MouseEvent): void {
        if (Boolean(this.dropDown) && !(Boolean(DisplayObjectContainer(this.dropDown).contains(DisplayObject(param1.target))) && param1.isDefaultPrevented())) {
            this.closeDropDown(false);
        }
    }

    public function processFocusOut(param1: FocusEvent): void {
        if (this.isOpen) {
            if (!param1.relatedObject || (!this.dropDown || this.dropDown is DisplayObjectContainer && !DisplayObjectContainer(this.dropDown).contains(param1.relatedObject))) {
                this.closeDropDown(true);
            }
        }
    }

    public function processKeyDown(param1: KeyboardEvent): Boolean {
        if (param1.isDefaultPrevented()) {
            return true;
        }
        if (param1.ctrlKey && param1.keyCode == Keyboard.DOWN) {
            this.openDropDownHelper(true);
            param1.preventDefault();
        } else if (param1.ctrlKey && param1.keyCode == Keyboard.UP) {
            this.closeDropDown(true);
            param1.preventDefault();
        } else if (param1.keyCode == Keyboard.ENTER) {
            if (this.isOpen) {
                this.closeDropDown(true);
                param1.preventDefault();
            }
        } else {
            if (param1.keyCode != Keyboard.ESCAPE) {
                return false;
            }
            if (this.isOpen) {
                this.closeDropDown(false);
                param1.preventDefault();
            }
        }
        return true;
    }
}
}
