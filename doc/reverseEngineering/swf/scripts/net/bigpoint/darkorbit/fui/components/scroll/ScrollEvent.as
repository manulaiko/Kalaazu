package net.bigpoint.darkorbit.fui.components.scroll {

import flash.events.MouseEvent;
import flash.utils.Dictionary;

public class ScrollEvent extends MouseEvent {

    public static var SCROLLBAR_POSITION_CHANGED: String = "positionChanged";

    public static var SCROLLCONTAINER_VERTICAL_SIZE_CHANGED: String = "verticalSieChanged";

    public static var SCROLLCONTAINER_HORIZONTAL_SIZE_CHANGED: String = "horizontalSizeChanged";


    private var _values: Dictionary;

    private var _contentSize: Number;

    private var _viewSize: Number;

    public function ScrollEvent(param1: String, param2: Object = null) {
        super(param1);
        this._values = new Dictionary();
        switch (param1) {
            case SCROLLBAR_POSITION_CHANGED:
                this._values[SCROLLBAR_POSITION_CHANGED] = param2;
                break;
            case SCROLLCONTAINER_VERTICAL_SIZE_CHANGED:
                this._values[SCROLLCONTAINER_VERTICAL_SIZE_CHANGED] = param2;
                break;
            case SCROLLCONTAINER_VERTICAL_SIZE_CHANGED:
                this._values[SCROLLCONTAINER_HORIZONTAL_SIZE_CHANGED] = param2;
        }
    }

    public function get positionInPercent(): Number {
        return this._values[SCROLLBAR_POSITION_CHANGED] as Number;
    }

    public function get scrollDelta(): Number {
        if (this._values[SCROLLCONTAINER_VERTICAL_SIZE_CHANGED] != null) {
            return this._values[SCROLLCONTAINER_VERTICAL_SIZE_CHANGED] as Number;
        }
        if (this._values[SCROLLCONTAINER_HORIZONTAL_SIZE_CHANGED]) {
            return this._values[SCROLLCONTAINER_HORIZONTAL_SIZE_CHANGED] as Number;
        }
        return -1;
    }

    public function set contentSize(param1: Number): void {
        this._contentSize = param1;
    }

    public function set viewSize(param1: Number): void {
        this._viewSize = param1;
    }

    public function get contentSize(): Number {
        return this._contentSize;
    }

    public function get viewSize(): Number {
        return this._viewSize;
    }
}
}
