package spark.primitives.supportClasses {

import flash.display.Graphics;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.geom.Point;
import flash.geom.Rectangle;

import mx.core.mx_internal;
import mx.events.PropertyChangeEvent;
import mx.graphics.IFill;

public class FilledElement extends StrokedElement {

    mx_internal static const VERSION: String = "4.6.0.23201";


    protected var _fill: IFill;

    public function FilledElement() {
        super();
    }

    [Bindable("propertyChange")]
    public function get fill(): IFill {
        return this._fill;
    }

    public function set fill(param1: IFill): void {
        var _loc3_: * = null;
        var _loc2_: IFill = this._fill;
        _loc3_ = this._fill as EventDispatcher;
        if (_loc3_) {
            _loc3_.removeEventListener(PropertyChangeEvent.PROPERTY_CHANGE, this.fill_propertyChangeHandler);
        }
        this._fill = param1;
        _loc3_ = this._fill as EventDispatcher;
        if (_loc3_) {
            _loc3_.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, this.fill_propertyChangeHandler);
        }
        mx_internal::dispatchPropertyChangeEvent("fill", _loc2_, this._fill);
        invalidateDisplayList();
    }

    override protected function beginDraw(param1: Graphics): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc2_: Point = new Point(drawX, drawY);
        if (stroke) {
            _loc3_ = getStrokeBounds();
            _loc3_.offset(drawX, drawY);
            stroke.apply(param1, _loc3_, _loc2_);
        } else {
            param1.lineStyle();
        }
        if (this.fill) {
            _loc4_ = new Rectangle(drawX, drawY, width, height);
            this.fill.begin(param1, _loc4_, _loc2_);
        }
    }

    override protected function endDraw(param1: Graphics): void {
        if (this.fill) {
            this.fill.end(param1);
        }
    }

    private function fill_propertyChangeHandler(param1: Event): void {
        invalidateDisplayList();
    }
}
}
