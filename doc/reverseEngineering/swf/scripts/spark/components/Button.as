package spark.components {

import flash.events.Event;

import mx.core.IButton;
import mx.core.mx_internal;

import spark.components.supportClasses.ButtonBase;

public class Button extends ButtonBase implements IButton {

    mx_internal static const VERSION: String = "4.6.0.23201";


    private var _emphasized: Boolean = false;

    public function Button() {
        super();
    }

    [Bindable("emphasizedChanged")]
    public function get emphasized(): Boolean {
        return this._emphasized;
    }

    public function set emphasized(param1: Boolean): void {
        if (param1 == this._emphasized) {
            return;
        }
        this._emphasized = param1;
        this.emphasizeStyleName();
        dispatchEvent(new Event("emphasizedChanged"));
    }

    override public function set styleName(param1: Object): void {
        super.styleName = param1;
        if (param1 == null || param1 is String) {
            if (!param1 || this._emphasized && param1.indexOf(" emphasized") == -1) {
                this.emphasizeStyleName();
            }
        }
    }

    private function emphasizeStyleName(): void {
        var _loc1_: String = styleName is String ? styleName as String : "";
        if (!styleName || styleName is String) {
            if (this._emphasized) {
                super.styleName = _loc1_ + " emphasized";
            } else {
                super.styleName = _loc1_.split(" emphasized").join("");
            }
        }
    }
}
}
