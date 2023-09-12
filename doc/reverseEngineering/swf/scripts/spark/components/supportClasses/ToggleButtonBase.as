package spark.components.supportClasses {

import flash.events.Event;

import mx.core.mx_internal;
import mx.events.FlexEvent;
import mx.events.PropertyChangeEvent;

public class ToggleButtonBase extends ButtonBase {

    mx_internal static const VERSION: String = "4.6.0.23201";

    mx_internal static var createAccessibilityImplementation: Function;


    private var _selected: Boolean;

    public function ToggleButtonBase() {
        super();
        mx_internal::disableMinimumDownStateTime = true;
    }

    [Bindable(event="propertyChange")]
    public function get selected(): Boolean {
        return this._selected;
    }

    private function set _1191572123selected(param1: Boolean): void {
        if (param1 == this._selected) {
            return;
        }
        this._selected = param1;
        dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
        invalidateSkinState();
    }

    override protected function getCurrentSkinState(): String {
        if (!this.selected) {
            return super.getCurrentSkinState();
        }
        return super.getCurrentSkinState() + "AndSelected";
    }

    override protected function buttonReleased(): void {
        super.buttonReleased();
        this.selected = !this.selected;
        dispatchEvent(new Event(Event.CHANGE));
    }

    override protected function initializeAccessibility(): void {
        if (false) {
            ToggleButtonBase.mx_internal::createAccessibilityImplementation(this);
        }
    }

    public function set selected(param1: Boolean): void {
        var _loc2_: Object = this.selected;
        if (_loc2_ !== param1) {
            this._1191572123selected = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selected", _loc2_, param1));
            }
        }
    }
}
}
