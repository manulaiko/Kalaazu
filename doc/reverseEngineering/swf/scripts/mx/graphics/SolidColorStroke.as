package mx.graphics {

import flash.display.CapsStyle;
import flash.display.Graphics;
import flash.display.GraphicsSolidFill;
import flash.display.GraphicsStroke;
import flash.events.EventDispatcher;
import flash.geom.Point;
import flash.geom.Rectangle;

import mx.core.mx_internal;
import mx.events.PropertyChangeEvent;

public class SolidColorStroke extends EventDispatcher implements IStroke {

    mx_internal static const VERSION: String = "4.6.0.23201";


    private var _alpha: Number = 0;

    private var _caps: String = "round";

    private var _color: uint = 0;

    private var _joints: String = "round";

    private var _miterLimit: Number = 3;

    private var _pixelHinting: Boolean = false;

    private var _scaleMode: String = "normal";

    private var _weight: Number;

    public function SolidColorStroke(param1: uint = 0, param2: Number = 1, param3: Number = 1, param4: Boolean = false, param5: String = "normal", param6: String = "round", param7: String = "round", param8: Number = 3) {
        super();
        this.color = param1;
        this._weight = param2;
        this.alpha = param3;
        this.pixelHinting = param4;
        this.scaleMode = param5;
        this.caps = param6;
        this.joints = param7;
        this.miterLimit = param8;
    }

    [Bindable("propertyChange")]
    public function get alpha(): Number {
        return this._alpha;
    }

    public function set alpha(param1: Number): void {
        var _loc2_: Number = this._alpha;
        if (param1 != _loc2_) {
            this._alpha = param1;
            this.dispatchStrokeChangedEvent("alpha", _loc2_, param1);
        }
    }

    [Bindable("propertyChange")]
    public function get caps(): String {
        return this._caps;
    }

    public function set caps(param1: String): void {
        var _loc2_: String = this._caps;
        if (param1 != _loc2_) {
            this._caps = param1;
            this.dispatchStrokeChangedEvent("caps", _loc2_, param1);
        }
    }

    [Bindable("propertyChange")]
    public function get color(): uint {
        return this._color;
    }

    public function set color(param1: uint): void {
        var _loc2_: uint = this._color;
        if (param1 != _loc2_) {
            this._color = param1;
            this.dispatchStrokeChangedEvent("color", _loc2_, param1);
        }
    }

    [Bindable("propertyChange")]
    public function get joints(): String {
        return this._joints;
    }

    public function set joints(param1: String): void {
        var _loc2_: String = this._joints;
        if (param1 != _loc2_) {
            this._joints = param1;
            this.dispatchStrokeChangedEvent("joints", _loc2_, param1);
        }
    }

    [Bindable("propertyChange")]
    public function get miterLimit(): Number {
        return this._miterLimit;
    }

    public function set miterLimit(param1: Number): void {
        var _loc2_: Number = this._miterLimit;
        if (param1 != _loc2_) {
            this._miterLimit = param1;
            this.dispatchStrokeChangedEvent("miterLimit", _loc2_, param1);
        }
    }

    [Bindable("propertyChange")]
    public function get pixelHinting(): Boolean {
        return this._pixelHinting;
    }

    public function set pixelHinting(param1: Boolean): void {
        var _loc2_: Boolean = this._pixelHinting;
        if (param1 != _loc2_) {
            this._pixelHinting = param1;
            this.dispatchStrokeChangedEvent("pixelHinting", _loc2_, param1);
        }
    }

    [Bindable("propertyChange")]
    public function get scaleMode(): String {
        return this._scaleMode;
    }

    public function set scaleMode(param1: String): void {
        var _loc2_: String = this._scaleMode;
        if (param1 != _loc2_) {
            this._scaleMode = param1;
            this.dispatchStrokeChangedEvent("scaleMode", _loc2_, param1);
        }
    }

    [Bindable("propertyChange")]
    public function get weight(): Number {
        return this._weight;
    }

    public function set weight(param1: Number): void {
        var _loc2_: Number = this._weight;
        if (param1 != _loc2_) {
            this._weight = param1;
            this.dispatchStrokeChangedEvent("weight", _loc2_, param1);
        }
    }

    public function apply(param1: Graphics, param2: Rectangle, param3: Point): void {
        param1.lineStyle(this.weight, this.color, this.alpha, this.pixelHinting, this.scaleMode, this.caps, this.joints, this.miterLimit);
    }

    public function createGraphicsStroke(param1: Rectangle, param2: Point): GraphicsStroke {
        var _loc3_: GraphicsStroke = new GraphicsStroke();
        _loc3_.thickness = this.weight;
        _loc3_.miterLimit = this.miterLimit;
        _loc3_.pixelHinting = this.pixelHinting;
        _loc3_.scaleMode = this.scaleMode;
        _loc3_.caps = !this.caps ? "null" : this.caps;
        var _loc4_: GraphicsSolidFill;
        (_loc4_ = new GraphicsSolidFill()).color = this.color;
        _loc4_.alpha = this.alpha;
        _loc3_.fill = _loc4_;
        return _loc3_;
    }

    private function dispatchStrokeChangedEvent(param1: String, param2: *, param3: *): void {
        if (hasEventListener("propertyChange")) {
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, param1, param2, param3));
        }
    }
}
}
