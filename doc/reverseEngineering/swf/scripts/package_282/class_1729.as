package package_282 {

import flash.geom.Point;
import flash.geom.Rectangle;

import net.bigpoint.darkorbit.mvc.display.class_1708;

import starling.display.DisplayObject;
import starling.filters.FragmentFilter;
import starling.text.TextField;

public class class_1729 extends TextField implements class_1708 {


    public function class_1729() {
        super(100, 100, "");
    }

    public function set font(param1: String): void {
        fontName = param1;
    }

    public function set htmlText(param1: String): void {
        super.text = param1;
    }

    public function set align(param1: String): void {
        hAlign = param1;
    }

    public function get font(): String {
        return fontName;
    }

    public function get htmlText(): String {
        return text;
    }

    public function get align(): String {
        return hAlign;
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

    public function set method_3211(param1: Object): void {
        this.filter = param1 as FragmentFilter;
    }

    public function get method_3211(): Object {
        return this.filter;
    }
}
}
