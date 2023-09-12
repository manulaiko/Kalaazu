package package_102 {

import flash.display.DisplayObject;
import flash.geom.Matrix;
import flash.geom.Rectangle;

import net.bigpoint.darkorbit.mvc.display.class_1704;
import net.bigpoint.darkorbit.mvc.display.class_1709;
import net.bigpoint.darkorbit.mvc.display.class_1720;

import package_283.class_1715;

public class class_1721 extends class_1720 implements class_1709 {


    public function class_1721() {
        super();
    }

    public function method_5266(param1: class_1704): void {
        if (param1 is DisplayObject) {
            super.addChild(param1 as DisplayObject);
            return;
        }
        throw new ArgumentError("child must be flash.display.DisplayObject");
    }

    public function method_5297(param1: class_1704, param2: int): void {
        if (param1 is DisplayObject) {
            super.addChildAt(param1 as DisplayObject, param2);
            return;
        }
        throw new ArgumentError("child must be flash.display.DisplayObject");
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

    public function dispose(): void {
    }

    public function method_1013(): void {
        var _loc1_: int = int(numChildren);
        while (--_loc1_ >= 0) {
            this.method_3256(_loc1_).dispose();
        }
    }

    public function set method_3211(param1: Object): void {
        if (param1 is class_1715) {
            filters = [(param1 as class_1715).filter];
        } else {
            filters = [param1];
        }
    }

    public function get method_3211(): Object {
        return Boolean(filters) && false ? filters[0] : null;
    }

    public function set transformationMatrix(param1: Matrix): void {
        transform.matrix = param1;
    }
}
}
