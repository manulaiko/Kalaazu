package spark.components.mediaClasses {

import flash.display.DisplayObject;
import flash.events.Event;
import flash.events.FocusEvent;
import flash.geom.Point;

import mx.core.mx_internal;
import mx.events.FlexEvent;
import mx.managers.LayoutManager;

import spark.components.VSlider;
import spark.components.supportClasses.DropDownController;
import spark.events.DropDownEvent;

public class VolumeBar extends VSlider {


    [SkinPart(required="false")]
    public var muteButton: MuteButton;

    [SkinPart(required="false")]
    public var dropDown: DisplayObject;

    private var _dropDownController: DropDownController;

    private var _muted: Boolean = false;

    public function VolumeBar() {
        super();
        this.dropDownController = new DropDownController();
        addEventListener(Event.CHANGE, this.changeHandler);
    }

    protected function get dropDownController(): DropDownController {
        return this._dropDownController;
    }

    protected function set dropDownController(param1: DropDownController): void {
        if (this._dropDownController == param1) {
            return;
        }
        this._dropDownController = param1;
        this._dropDownController.addEventListener(DropDownEvent.OPEN, this.mx_internal::dropDownController_openHandler);
        this._dropDownController.addEventListener(DropDownEvent.CLOSE, this.mx_internal::dropDownController_closeHandler);
        this._dropDownController.rollOverOpenDelay = getStyle("rollOverOpenDelay");
        if (this.muteButton) {
            this._dropDownController.openButton = this.muteButton;
        }
        if (this.dropDown) {
            this._dropDownController.dropDown = this.dropDown;
        }
    }

    public function get isDropDownOpen(): Boolean {
        if (this.dropDownController) {
            return this.dropDownController.isOpen;
        }
        return false;
    }

    [Bindable("mutedChange")]
    public function get muted(): Boolean {
        return this._muted;
    }

    public function set muted(param1: Boolean): void {
        if (this._muted == param1) {
            return;
        }
        this._muted = param1;
        invalidateDisplayList();
        if (this.muteButton) {
            this.muteButton.muted = param1;
        }
        dispatchEvent(new FlexEvent(FlexEvent.MUTED_CHANGE));
    }

    override public function get baselinePosition(): Number {
        return getBaselinePositionForPart(this.muteButton);
    }

    override protected function updateSkinDisplayList(): void {
        var _loc3_: Number = NaN;
        if (!thumb || !track) {
            return;
        }
        var _loc1_: Number = track.getLayoutBoundsHeight() - thumb.getLayoutBoundsHeight();
        var _loc2_: Number = maximum - minimum;
        if (!this.muted) {
            _loc3_ = _loc2_ > 0 ? _loc1_ - (pendingValue - minimum) / _loc2_ * _loc1_ : 0;
        } else {
            _loc3_ = _loc1_;
        }
        var _loc4_: Point = track.localToGlobal(new Point(0, _loc3_));
        var _loc5_: Number = thumb.parent.globalToLocal(_loc4_).y;
        thumb.setLayoutBoundsPosition(thumb.getLayoutBoundsX(), Math.round(_loc5_));
    }

    override public function styleChanged(param1: String): void {
        super.styleChanged(param1);
        var _loc2_: Boolean = param1 == null || param1 == "styleName";
        if (_loc2_ || param1 == "rollOverOpenDelay") {
            if (this.dropDownController) {
                this.dropDownController.rollOverOpenDelay = getStyle("rollOverOpenDelay");
            }
        }
    }

    override protected function setValue(param1: Number): void {
        super.setValue(param1);
        if (this.muteButton) {
            this.muteButton.volume = param1;
        }
    }

    override protected function getCurrentSkinState(): String {
        return !enabled ? "disabled" : (this.dropDownController.isOpen ? "open" : "normal");
    }

    override protected function partAdded(param1: String, param2: Object): void {
        super.partAdded(param1, param2);
        if (param2 == this.muteButton) {
            if (this.dropDownController) {
                this.dropDownController.openButton = this.muteButton;
            }
            this.muteButton.addEventListener(FlexEvent.MUTED_CHANGE, this.muteButton_mutedChangeHandler);
            this.muteButton.volume = value;
            this.muteButton.muted = this.muted;
        } else if (param2 == this.dropDown && Boolean(this.dropDownController)) {
            this.dropDownController.dropDown = this.dropDown;
        }
    }

    override protected function partRemoved(param1: String, param2: Object): void {
        if (param2 == this.muteButton) {
            this.muteButton.removeEventListener(FlexEvent.MUTED_CHANGE, this.muteButton_mutedChangeHandler);
        } else if (param2 == this.dropDownController) {
            if (param2 == this.muteButton) {
                this.dropDownController.openButton = null;
            }
            if (param2 == this.dropDown) {
                this.dropDownController.dropDown = null;
            }
        }
        super.partRemoved(param1, param2);
    }

    override public function setFocus(): void {
        this.openDropDown();
        LayoutManager.getInstance().validateNow();
        super.setFocus();
    }

    override protected function focusOutHandler(param1: FocusEvent): void {
        this.dropDownController.processFocusOut(param1);
        super.focusOutHandler(param1);
    }

    public function openDropDown(): void {
        this.dropDownController.openDropDown();
    }

    public function closeDropDown(param1: Boolean): void {
        this.dropDownController.closeDropDown(param1);
    }

    mx_internal function dropDownController_openHandler(param1: DropDownEvent): void {
        invalidateSkinState();
        dispatchEvent(param1);
    }

    mx_internal function dropDownController_closeHandler(param1: DropDownEvent): void {
        invalidateSkinState();
        dispatchEvent(param1);
    }

    private function changeHandler(param1: Event): void {
        if (this.muted) {
            this.muted = false;
        }
    }

    private function muteButton_mutedChangeHandler(param1: FlexEvent): void {
        this.muted = this.muteButton.muted;
    }
}
}
