package package_102 {

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObject;
import flash.geom.Matrix;
import flash.geom.Point;
import flash.geom.Rectangle;

import net.bigpoint.darkorbit.mvc.display.class_1718;

import package_283.class_1715;

public class class_1719 extends Bitmap implements class_1718 {


    public function class_1719() {
        super();
    }

    public function set texture(param1: Object): void {
        bitmapData = param1 as BitmapData;
    }

    public function setSubtexture(param1: Object, param2: Rectangle): void {
        var _loc3_: * = null;
        if (bitmapData) {
            bitmapData.dispose();
        }
        if (param1 is BitmapData) {
            _loc3_ = new BitmapData(param2.width, param2.height);
            _loc3_.copyPixels(param1 as BitmapData, param2, new Point(0, 0));
            bitmapData = _loc3_;
        }
    }

    public function dispose(): void {
        if (bitmapData) {
            bitmapData = null;
        }
    }

    public function get method_1052(): Object {
        return parent;
    }

    public function method_990(param1: Point): Point {
        return localToGlobal(param1);
    }

    public function method_4347(param1: Point): Point {
        return globalToLocal(param1);
    }

    public function get method_2826(): Object {
        return root;
    }

    public function get method_5539(): Object {
        return stage;
    }

    public function method_2392(param1: Object, param2: Rectangle = null): Rectangle {
        return getBounds(param1 as DisplayObject);
    }

    public function get transformationMatrix(): Matrix {
        return transform.matrix;
    }

    public function set transformationMatrix(param1: Matrix): void {
        transform.matrix = param1;
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
}
}
