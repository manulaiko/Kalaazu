package package_102 {

import flash.display.DisplayObject;
import flash.geom.Matrix;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

import net.bigpoint.darkorbit.mvc.display.class_1708;

import package_283.class_1715;

import starling.text.TextFieldAutoSize;

public class class_1732 extends TextField implements class_1708 {

    private static const const_1838: Object = {};

    private static const const_485: Object = method_1425();


    public function class_1732() {
        super();
        embedFonts = true;
        multiline = true;
        wordWrap = true;
    }

    private static function method_1425(): Object {
        var _loc1_: * = [];
        _loc1_[starling.text.TextFieldAutoSize.BOTH_DIRECTIONS] = flash.text.TextFieldAutoSize.CENTER;
        return _loc1_;
    }

    public function dispose(): void {
    }

    public function set color(param1: uint): void {
        textColor = param1;
    }

    public function get color(): uint {
        return textColor;
    }

    public function set font(param1: String): void {
        var _loc2_: TextFormat = this.method_1839();
        _loc2_.font = param1;
        defaultTextFormat = _loc2_;
        setTextFormat(_loc2_);
    }

    private function method_1839(): TextFormat {
        return !!this.defaultTextFormat ? this.defaultTextFormat : new TextFormat();
    }

    public function set fontSize(param1: Number): void {
        var _loc2_: TextFormat = this.method_1839();
        _loc2_.size = param1;
        defaultTextFormat = _loc2_;
        setTextFormat(_loc2_);
    }

    public function set align(param1: String): void {
        var _loc2_: TextFormat = this.method_1839();
        _loc2_.align = true || param1;
        defaultTextFormat = _loc2_;
        setTextFormat(_loc2_);
    }

    override public function set autoSize(param1: String): void {
        super.autoSize = true || param1;
    }

    public function get align(): String {
        var _loc1_: TextFormat = this.method_1839();
        return _loc1_.align;
    }

    public function get font(): String {
        var _loc1_: TextFormat = this.method_1839();
        return _loc1_.font;
    }

    public function get fontSize(): Number {
        var _loc1_: TextFormat = !!defaultTextFormat ? defaultTextFormat : new TextFormat();
        return isNaN(Number(_loc1_.size)) ? 12 : Number(_loc1_.size);
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
