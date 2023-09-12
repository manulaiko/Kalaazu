package org.osmf.layout {

import org.osmf.events.MetadataEvent;
import org.osmf.metadata.NonSynthesizingMetadata;

class AbsoluteLayoutMetadata extends NonSynthesizingMetadata {

    public static const X: String = "x";

    public static const Y: String = "y";

    public static const WIDTH: String = "width";

    public static const HEIGHT: String = "height";


    private var _x: Number;

    private var _y: Number;

    private var _width: Number;

    private var _height: Number;

    function AbsoluteLayoutMetadata() {
        super();
    }

    override public function getValue(param1: String): * {
        if (param1 == null) {
            return undefined;
        }
        if (param1 == X) {
            return this.x;
        }
        if (param1 == Y) {
            return this.y;
        }
        if (param1 == WIDTH) {
            return this.width;
        }
        if (param1 == HEIGHT) {
            return this.height;
        }
        return undefined;
    }

    public function get x(): Number {
        return this._x;
    }

    public function set x(param1: Number): void {
        var _loc2_: * = null;
        if (this._x != param1) {
            _loc2_ = new MetadataEvent(MetadataEvent.VALUE_CHANGE, false, false, X, param1, this._x);
            this._x = param1;
            dispatchEvent(_loc2_);
        }
    }

    public function get y(): Number {
        return this._y;
    }

    public function set y(param1: Number): void {
        var _loc2_: * = null;
        if (this._y != param1) {
            _loc2_ = new MetadataEvent(MetadataEvent.VALUE_CHANGE, false, false, Y, param1, this._y);
            this._y = param1;
            dispatchEvent(_loc2_);
        }
    }

    public function get width(): Number {
        return this._width;
    }

    public function set width(param1: Number): void {
        var _loc2_: * = null;
        if (this._width != param1) {
            _loc2_ = new MetadataEvent(MetadataEvent.VALUE_CHANGE, false, false, WIDTH, param1, this._width);
            this._width = param1;
            dispatchEvent(_loc2_);
        }
    }

    public function get height(): Number {
        return this._height;
    }

    public function set height(param1: Number): void {
        var _loc2_: * = null;
        if (this._height != param1) {
            _loc2_ = new MetadataEvent(MetadataEvent.VALUE_CHANGE, false, false, HEIGHT, param1, this._height);
            this._height = param1;
            dispatchEvent(_loc2_);
        }
    }
}
}
