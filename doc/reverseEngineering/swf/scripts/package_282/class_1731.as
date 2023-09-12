package package_282 {

import flash.geom.Point;
import flash.geom.Rectangle;

import net.bigpoint.darkorbit.mvc.display.class_1207;
import net.bigpoint.darkorbit.mvc.display.class_1704;
import net.bigpoint.darkorbit.mvc.display.class_1709;

import starling.display.DisplayObject;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.filters.FragmentFilter;

public class class_1731 extends class_1207 implements class_1709 {


    private var _mouseX: Number = 0;

    private var _mouseY: Number = 0;

    public function class_1731() {
        super();
        this.mouseEnabled = touchable;
    }

    private function method_3075(param1: TouchEvent): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc2_: Vector.<Touch> = param1.getTouches(this);
        for each(_loc3_ in _loc2_) {
            if (_loc3_.phase == TouchPhase.HOVER) {
                _loc4_ = _loc3_.getLocation(this);
                this._mouseX = _loc4_.x;
                this._mouseY = _loc4_.y;
            }
        }
    }

    public function get mouseEnabled(): Boolean {
        return touchable;
    }

    override public function set mouseEnabled(param1: Boolean): void {
        touchable = param1;
        if (param1) {
            addEventListener(TouchEvent.TOUCH, this.method_3075);
        } else {
            removeEventListener(TouchEvent.TOUCH, this.method_3075);
        }
    }

    public function method_5266(param1: class_1704): void {
        if (param1 is DisplayObject) {
            super.addChild(param1 as DisplayObject);
            return;
        }
        throw new ArgumentError("child must be flash.display.Sprite");
    }

    public function method_5297(param1: class_1704, param2: int): void {
        if (param1 is DisplayObject) {
            super.addChildAt(param1 as DisplayObject, param2);
            return;
        }
        throw new ArgumentError("child must be flash.display.Sprite");
    }

    public function method_1204(param1: class_1704): class_1704 {
        return super.removeChild(param1 as DisplayObject) as class_1704;
    }

    public function method_3256(param1: int): class_1704 {
        return super.removeChildAt(param1) as class_1704;
    }

    public function method_746(param1: class_1704): Rectangle {
        return super.getBounds(param1 as DisplayObject);
    }

    public function method_2151(param1: class_1704): Boolean {
        return super.contains(param1 as DisplayObject);
    }

    override public function get mouseX(): Number {
        return this._mouseX;
    }

    override public function get mouseY(): Number {
        return this._mouseY;
    }

    public function method_1013(): void {
        var _loc1_: int = int(numChildren);
        while (--_loc1_ >= 0) {
            class_1704(getChildAt(_loc1_)).dispose();
        }
    }

    public function set method_3211(param1: Object): void {
        this.filter = param1 as FragmentFilter;
    }

    public function get method_3211(): Object {
        return this.filter;
    }
}
}
