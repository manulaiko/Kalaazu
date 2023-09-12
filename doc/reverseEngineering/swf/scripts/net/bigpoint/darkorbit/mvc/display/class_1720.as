package net.bigpoint.darkorbit.mvc.display {

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.events.Event;
import flash.geom.Matrix;
import flash.geom.Point;
import flash.geom.Rectangle;

public class class_1720 extends Sprite implements IDisplayObject {


    public function class_1720() {
        super();
    }

    public function addUntypedChild(param1: Object): void {
        if (this.method_266(param1)) {
            addChild(param1 as DisplayObject);
        }
    }

    public function removeUntypedChild(param1: Object, param2: Boolean = true): Object {
        if (param1 is DisplayObject) {
            return removeChild(param1 as DisplayObject);
        }
        return null;
    }

    public function method_33(param1: int, param2: Boolean = true): Object {
        return removeChildAt(param1);
    }

    public function removeFromParent(param1: Boolean = true): void {
        var _loc2_: Boolean = false;
        if (this.method_266(this.method_1052)) {
            _loc2_ = Boolean(this.method_1052.contains(this));
            if (_loc2_) {
                this.method_1052.removeUntypedChild(this);
            }
        }
    }

    public function method_3151(param1: Object): Boolean {
        return false;
    }

    public function method_1032(param1: Object): Boolean {
        if (this.method_6346(param1)) {
            dispatchEvent(param1 as Event);
        }
        return true;
    }

    public function method_266(param1: Object): Boolean {
        return param1 is DisplayObject;
    }

    public function method_6346(param1: Object): Boolean {
        return param1 is Event;
    }

    public function method_1532(param1: String, param2: Function, param3: Boolean = false, param4: int = 0, param5: Boolean = false): void {
        addEventListener(param1, param2, param3, param4, param5);
    }

    public function method_1899(param1: String, param2: Function, param3: Boolean = false): void {
        removeEventListener(param1, param2, param3);
    }

    public function get method_1052(): Object {
        return parent;
    }

    public function method_2392(param1: Object, param2: Rectangle = null): Rectangle {
        if (this.method_266(param1)) {
            return getBounds(param1 as DisplayObject);
        }
        return null;
    }

    public function get method_4142(): Number {
        return rotation;
    }

    public function set method_4142(param1: Number): void {
        rotation = param1;
    }

    public function method_2394(param1: Object = null): void {
        var _loc2_: * = null;
        if (param1 == null) {
            param1 = {};
        }
        if (this.method_266(param1)) {
            _loc2_ = param1 as DisplayObjectContainer;
            if (_loc2_) {
                while (_loc2_.numChildren) {
                    _loc2_.removeChildAt(0);
                }
            }
            this.removeFromParent();
        }
    }

    public function get transformationMatrix(): Matrix {
        return transform.matrix;
    }

    public function get method_2826(): Object {
        return root;
    }

    public function method_990(param1: Point): Point {
        return localToGlobal(param1);
    }

    public function get method_5539(): Object {
        return stage;
    }

    public function method_4347(param1: Point): Point {
        return globalToLocal(param1);
    }
}
}
